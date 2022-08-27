library modal_bottom_sheets;

import 'package:keep_money/data/models/hive_adapters/transaction_type_view_model/transaction_type_view_model.dart';
import 'package:keep_money/data/models/hive_adapters/user_view_model/user_view_model.dart';
import 'package:keep_money/presentation/cubits/add_transaction_cubit.dart';
import 'package:keep_money/presentation/cubits/personal_info_modal_bottom_sheet_cubit.dart';
import 'package:keep_money/presentation/cubits/profile_preferences_cubit.dart';
import 'package:keep_money/presentation/cubits/transaction_types_selection_cubit.dart';
import 'package:keep_money/presentation/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';

import '../../core/constants/assets.dart';
import '../../core/constants/durations.dart';
import '../../core/constants/palette.dart';
import '../../core/constants/styles.dart';
import '../../core/helpers/date_picker_helper.dart';
import '../../core/helpers/modal_bottom_sheet_helper.dart';
import '../../injection_container.dart';
import '../cubits/personal_info_edit_modal_bottom_sheet_cubit.dart';
import '../pages/index.dart';

part 'sheets/add_transaction_modal_bottom_sheet.dart';
part 'sheets/personal_info_edit_modal_bottom_sheet.dart';
part 'sheets/personal_info_modal_bottom_sheet.dart';
part 'sheets/profile_preferences_modal_bottom_sheet.dart';
part 'sheets/transaction_types_selection_modal_bottom_sheet.dart';
part 'widgets/add_transaction_modal_bottom_sheet/fields/add_transaction_modal_amount_field.dart';
part 'widgets/add_transaction_modal_bottom_sheet/fields/add_transaction_modal_date_field.dart';
part 'widgets/add_transaction_modal_bottom_sheet/fields/add_transaction_modal_type_field.dart';
part 'widgets/add_transaction_modal_bottom_sheet/numeric_keyboard/add_transaction_modal_numeric_keyboard.dart';
part 'widgets/add_transaction_modal_bottom_sheet/numeric_keyboard/sections/keyboard_backspace_button.dart';
part 'widgets/add_transaction_modal_bottom_sheet/numeric_keyboard/sections/keyboard_interaction_buttons.dart';
part 'widgets/add_transaction_modal_bottom_sheet/numeric_keyboard/sections/keyboard_recent_values.dart';
part 'widgets/add_transaction_modal_bottom_sheet/numeric_keyboard/sections/keyboard_submit_button.dart';
part 'widgets/add_transaction_modal_bottom_sheet/numeric_keyboard/sections/numeric_keyboard.dart';
part 'widgets/add_transaction_modal_bottom_sheet/numeric_keyboard/sections/numeric_rows/numeric_three_numbers_row.dart';
part 'widgets/add_transaction_modal_bottom_sheet/numeric_keyboard/sections/numeric_rows/numeric_zero_dot_row.dart';
part 'widgets/common/modal_bottom_sheet_header.dart';
part 'widgets/personal_info_edit_modal_bottom_sheet/form/divider/personal_info_edit_modal_bottom_sheet_divider.dart';
part 'widgets/personal_info_edit_modal_bottom_sheet/form/fields/personal_info_edit_modal_bottom_sheet_avatar_field.dart';
part 'widgets/personal_info_edit_modal_bottom_sheet/form/fields/personal_info_edit_modal_bottom_sheet_gender_field.dart';
part 'widgets/personal_info_edit_modal_bottom_sheet/form/fields/personal_info_edit_modal_bottom_sheet_income_field.dart';
part 'widgets/personal_info_edit_modal_bottom_sheet/form/fields/personal_info_edit_modal_bottom_sheet_name_field.dart';
part 'widgets/personal_info_edit_modal_bottom_sheet/form/personal_info_edit_modal_bottom_sheet_form.dart';
part 'widgets/personal_info_edit_modal_bottom_sheet/form/personal_info_edit_modal_bottom_sheet_submit_button.dart';
part 'widgets/personal_info_modal_bottom_sheet/form/divider/personal_info_modal_bottom_sheet_divider.dart';
part 'widgets/personal_info_modal_bottom_sheet/form/fields/personal_info_modal_bottom_sheet_avatar_field.dart';
part 'widgets/personal_info_modal_bottom_sheet/form/fields/personal_info_modal_bottom_sheet_gender_field.dart';
part 'widgets/personal_info_modal_bottom_sheet/form/fields/personal_info_modal_bottom_sheet_income_field.dart';
part 'widgets/personal_info_modal_bottom_sheet/form/fields/personal_info_modal_bottom_sheet_name_field.dart';
part 'widgets/personal_info_modal_bottom_sheet/form/personal_info_modal_bottom_sheet_form.dart';
part 'widgets/personal_info_modal_bottom_sheet/form/personal_info_modal_bottom_sheet_submit_button.dart';
part 'widgets/profile_preferences_modal_bottom_sheet/profile_preferences_main_box.dart';
part 'widgets/transaction_types_selection_modal_bottom_sheet/transaction_type_item.dart';
part 'widgets/transaction_types_selection_modal_bottom_sheet/transaction_type_modal_overview.dart';