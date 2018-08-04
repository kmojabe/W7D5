import {combineReducers} from 'redux';
import usersReducers from './users_reducer';

const entitiesReducer = combineReducers({
  users: users_reducer
});

export default entitiesReducer; 
