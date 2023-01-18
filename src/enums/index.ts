import { registerEnumType } from "@nestjs/graphql"
import {SortOrder} from "./SortOrder.enum"

registerEnumType(SortOrder, {
    name: 'SortOrder',
  })
export {
    SortOrder
}