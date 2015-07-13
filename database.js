'use strict';

// Options used by [knex]: https://github.com/tgriesser/knex
//
// Here is a simple configuration:
//
// ```javascript
// development: {
//     client: 'sqlite3',
//     connection: {
//         filename: './flyboard.sqlite'
//     }
// }
// ```
//
// Documents can be found here:
//
// - http://knexjs.org/#Installation-client

module.exports = {
    development: {
        client: 'mysql',
        connection: {
            database: 'pipe',
            host: 'dx-pipe-mysql1-online',
            port: 3306,
            user: 'pipe',
            password: 'pipe123'
        },
        pool: {
            min: 10,
            max: 20
        }
    },

    test: {
        client: 'mysql',
        connection: {
            database: 'flyboard'
        }
    },
    production: {
        client: 'mysql',
        connection: {
            database: 'flyboard',
            host: 'mysql_board_writer',
            user: 'fly',
            password: 'fly123'
        },
        pool: {
            min: 10,
            max: 20
        }
    }
};
