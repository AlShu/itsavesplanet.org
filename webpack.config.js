const {resolve} = require('path')
const autoprefixer = require('autoprefixer')
//const normalize = require('postcss-normalize')
const MiniCssExtractPlugin = require("mini-css-extract-plugin")

const {
  HotModuleReplacementPlugin,
  NamedModulesPlugin,
  HashedModuleIdsPlugin,
  optimize: {
    AggressiveMergingPlugin,
    ModuleConcatenationPlugin
  },
} = require('webpack')

const browsersList = ['> 1%']

const cssLoader = [
  MiniCssExtractPlugin.loader, ['css-loader', 'sass-loader']
];


const babelLoader = {
  loader: 'babel-loader',
//  options: {
//    presets: [
//      ['@babel/env', {
//        loose: true,
//        useBuiltIns: 'entry',
//        shippedProposals: true,
//        targets: {
//          browsers: browsersList,
//        },
//      }],
//    ],
//    //plugins: [
//    //  '@babel/transform-runtime',
//    //],
//    env: {
//      production: {
//        presets: [
//          ['minify', {
//            evaluate: false,
//            mangle: false,
//          }],
//        ],
//      },
//    },
//  },
}

module.exports = {
  entry: {
    app: [
      resolve(__dirname, 'assets/js/app.js')
    ],
    //css: [
    //  resolve(__dirname, 'assets/css/app.sass')
    //]
  },
  output: {
    path: resolve(__dirname, 'priv/static'),
    filename: 'js/[name].js',
    publicPath: '/',
    //hotUpdateChunkFilename: 'hot/hot-update.js',
    //hotUpdateMainFilename: 'hot/hot-update.json',
  },

  context: resolve(__dirname, 'assets'),

  module: {
    rules: [
      {
        include: /assets\/static/,
        use: [
          {
            loader: 'file-loader',
            options: {
              name: "../[path][name].[ext]",
              context: ''
            }
          }
        ]
      },
      {
        test: /\.js?x$/,
        exclude: /node_modules|assets\/static/,
        use: babelLoader,
      },
      {
        test: /\.(scss|sass|css)$/,
        exclude: /assets\/static/,
        use: [
          MiniCssExtractPlugin.loader,
          {
            loader: "css-loader",
            options: {
              minimize: {
                safe: true
              }
            }
          },
          {
            loader: "postcss-loader",
            options: {
              autoprefixer: {
                browsers: ["last 2 versions"]
              },
              plugins: () => [autoprefixer]
            },
          },
          {
            loader: "sass-loader",
            options: {}
          }
        ]
      },
      {
        test: /\.(eot|svg|otf|ttf|woff|woff2)$/,
        exclude: /assets\/static/,
        use: [
          {
            loader: 'file-loader',
            options: {
              name: 'fonts/[name]-[hash].[ext]',
              context: ''
            }
          }
        ]
      },
      {
        test: /\.(png|jpg|gif)$/,
        exclude: /assets\/static/,
        use: [
          {
            loader: 'file-loader',
            options: {
              name: 'images/[name]-[hash].[ext]',
              context: ''
            }
          }
        ]
      }
      // {
      //     test: /\.woff$/,
      //     loader: 'url-loader',
      //     options: {
      //         limit: 50000,
      //         mimetype: 'application/font-woff',
      //         name: '/assets/fonts/[name].[ext]',
      //     },
      // },
      // {
      //     test: /\.svg$/,
      //     loader: 'url-loader',
      //     options: {
      //         limit: 200000,
      //         mimetype: 'image/svg+xml',
      //         name: '/assets/icons/[name].[ext]',
      //     },
      // },
    ]
  },
  plugins: [
    //new HtmlWebPackPlugin({
    //  template: "./src/index.html",
    //  filename: "./index.html"
    //}),
    new MiniCssExtractPlugin({
      filename: "css/[name].css",
      chunkFilename: "css/[name]-[id].css"
    })
  ]
  //optimization: {
  //  splitChunks: {
  //    chunks: "all"
  //  }
  //}
}

