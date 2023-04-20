Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8ECC77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 18:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:In-Reply-To:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=5U8YTkRaryo4+lbh3ccMh2SfQeIA6fREeIK94CaaZuQ=; b=sThnovl9I+eNcu
	n5hVNlcW8E+AJxukHHRtHY3p6A2yTpE7t8BQgVfwgDkbvCVjjkFATUZG1Nk9YHErydpfPdjzURiKn
	2KMq4YmPbhT+7K6tVTZ95FWaFEVwcjfMuC1f0Y3NxwovpCUm3oJRSkTFK73dRRYV1+9OmT86ScObM
	SeIFY7l+N1dryvgSJdrSkzayT99rNaOBHRbLxjDIDHBMZStZ6scLYQ2dkPFOq+Hmqyn8kAmCrZ7Vc
	mh3Pb+j4ChAMrA6K+Ntc/Yp/bdJ7dF/wkHY+y2yvyMHDrApjNYyqU9XDQoda1l0JcmATjD7ke+Onb
	4cxWLwCdwOhlLyty+P+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppZGb-008mUC-1o;
	Thu, 20 Apr 2023 18:44:25 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppZGX-008mSQ-0F
	for linux-riscv@lists.infradead.org;
	Thu, 20 Apr 2023 18:44:23 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1a92369761cso12657605ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Apr 2023 11:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682016259; x=1684608259;
        h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aJKg4Mh6vZ3WSZ/pRsR5MqO6auYwg4i+qfpcnb6vsx0=;
        b=pDtWzYePueUfAyEs1dD3G5MmmwsYjH3HOdqJpxVtnhjO/giDVKF04/5yfz/S8s2Sh0
         elTr7KDImtJhEyNym5LHyHnzTgTVCu+2igwJA9H8e/rS6ZGcv6w72PjRoYLyN33a++Kq
         8dGFjTvjJII+3lCYLn58It4rGntekoiazVyFUkHcA2Ed8ALO7xAI8tH/s8n1zdjcTsr5
         7LPeUVjL7zjPpuvHNJDUxY9xfdldBR5YZ+dlZ3BoH2MSA9SJKFbLaPaMmVlD8X5hCQMg
         0fk2+He8qR+fmn7BalSGpUX5VQAGugwFDJSw87wP6WV7uWuQ3jSfYPhHtKovKbsPczm5
         cptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682016259; x=1684608259;
        h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aJKg4Mh6vZ3WSZ/pRsR5MqO6auYwg4i+qfpcnb6vsx0=;
        b=Ypt3KGM4/gnrTnsrzzc7FRJptlil338+3ClLdhd8dQLeKa9ickVSFNwygMiR6aCWOj
         ceUKQ0S8gopf1uKepFHPsuj0DEUgiC9RQH6vY/Wgppk6R44l1dpevd2U2JSr39/qg89y
         SPkjzBWO3FP5Yq9Z3wvu/07n3eAB/9KucCv0jua5NFfXOo0hjYh/Cz5J8Nr67yZXQjFt
         XuJER0pRymypTu2XkYgvJ38lSQKgJ64ZSbrpYoriVSd3GVrITmvQbYORm9JFD7/3jMDK
         cQG5aaJWyKB6TxKEFrJoE6Ckxj9AKUZlzGuHRfrbSJFVUhZ4PYirrTnDuAV4GJlF2VId
         9B6w==
X-Gm-Message-State: AAQBX9forI3sfAoP0bgnc/MMdoOWyJaJLDlJITbUmIWfNxyw6ZxuuHxq
	KBgdTiqozW2+UU+nb6Vp36oKeQ==
X-Google-Smtp-Source: AKy350bEoGeFmyYpnjAL7o4p0QHicwFCutcvSCUFHSVKd4cxLIE2/w5arf6iT10TJKpTFLX8oVN9jA==
X-Received: by 2002:a17:903:230d:b0:1a6:a6e7:8846 with SMTP id d13-20020a170903230d00b001a6a6e78846mr3033873plh.40.1682016259026;
        Thu, 20 Apr 2023 11:44:19 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id w15-20020a170902d70f00b001a6c58e95d7sm1437886ply.269.2023.04.20.11.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 11:44:18 -0700 (PDT)
Date: Thu, 20 Apr 2023 11:44:18 -0700 (PDT)
X-Google-Original-Date: Thu, 20 Apr 2023 11:44:05 PDT (-0700)
Subject: Re: [PATCH v9 1/1] riscv: Allow to downgrade paging mode from the command line
In-Reply-To: <mhng-04c8dd83-22b9-462e-9ecd-622128769635@palmer-ri-x1c9a>
CC: corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Conor Dooley <conor@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, bjorn@kernel.org, linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, alexghiti@rivosinc.com,
  Bjorn Topel <bjorn@rivosinc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexghiti@rivosinc.com
Message-ID: <mhng-ecd68703-9cc0-48a4-be15-f82f2b4fbe22@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_114421_332046_5D2DD5E9 
X-CRM114-Status: GOOD (  34.75  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4228784555169839651=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4228784555169839651==
Content-Type: text/plain

On Thu, 20 Apr 2023 10:36:43 PDT (-0700), Palmer Dabbelt wrote:
> On Tue, 28 Mar 2023 22:09:51 PDT (-0700), alexghiti@rivosinc.com wrote:
>> Add 2 early command line parameters that allow to downgrade satp mode
>> (using the same naming as x86):
>> - "no5lvl": use a 4-level page table (down from sv57 to sv48)
>> - "no4lvl": use a 3-level page table (down from sv57/sv48 to sv39)
>>
>> Note that going through the device tree to get the kernel command line
>> works with ACPI too since the efi stub creates a device tree anyway with
>> the command line.
>>
>> In KASAN kernels, we can't use the libfdt that early in the boot process
>> since we are not ready to execute instrumented functions. So instead of
>> using the "generic" libfdt, we compile our own versions of those functions
>> that are not instrumented and that are prefixed so that they do not
>> conflict with the generic ones. We also need the non-instrumented versions
>> of the string functions and the prefixed versions of memcpy/memmove.
>>
>> This is largely inspired by commit aacd149b6238 ("arm64: head: avoid
>> relocating the kernel twice for KASLR") from which I removed compilation
>> flags that were not relevant to RISC-V at the moment (LTO, SCS, pie).
>>
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> Tested-by: Björn Töpel <bjorn@rivosinc.com>
>> Reviewed-by: Björn Töpel <bjorn@rivosinc.com>
>> ---
>>  .../admin-guide/kernel-parameters.txt         |  5 +-
>>  arch/riscv/kernel/Makefile                    |  2 +
>>  arch/riscv/kernel/pi/Makefile                 | 39 ++++++++++++
>>  arch/riscv/kernel/pi/cmdline_early.c          | 62 +++++++++++++++++++
>>  arch/riscv/kernel/vmlinux.lds.S               |  8 +++
>>  arch/riscv/lib/memcpy.S                       |  2 +
>>  arch/riscv/lib/memmove.S                      |  2 +
>>  arch/riscv/lib/strlen.S                       |  1 +
>>  arch/riscv/mm/init.c                          | 36 +++++++++--
>>  9 files changed, 150 insertions(+), 7 deletions(-)
>>  create mode 100644 arch/riscv/kernel/pi/Makefile
>>  create mode 100644 arch/riscv/kernel/pi/cmdline_early.c
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index 6221a1d057dd..accc400b43f1 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -3576,7 +3576,10 @@
>>  			emulation library even if a 387 maths coprocessor
>>  			is present.
>>
>> -	no5lvl		[X86-64] Disable 5-level paging mode. Forces
>> +	no4lvl		[RISCV] Disable 4-level and 5-level paging modes. Forces
>> +			kernel to use 3-level paging instead.
>> +
>> +	no5lvl		[X86-64,RISCV] Disable 5-level paging mode. Forces
>>  			kernel to use 4-level paging instead.
>>
>>  	nofsgsbase	[X86] Disables FSGSBASE instructions.
>> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
>> index 4cf303a779ab..aa22f87faeae 100644
>> --- a/arch/riscv/kernel/Makefile
>> +++ b/arch/riscv/kernel/Makefile
>> @@ -89,3 +89,5 @@ obj-$(CONFIG_EFI)		+= efi.o
>>  obj-$(CONFIG_COMPAT)		+= compat_syscall_table.o
>>  obj-$(CONFIG_COMPAT)		+= compat_signal.o
>>  obj-$(CONFIG_COMPAT)		+= compat_vdso/
>> +
>> +obj-$(CONFIG_64BIT)		+= pi/
>> diff --git a/arch/riscv/kernel/pi/Makefile b/arch/riscv/kernel/pi/Makefile
>> new file mode 100644
>> index 000000000000..42c58f4ab53b
>> --- /dev/null
>> +++ b/arch/riscv/kernel/pi/Makefile
>> @@ -0,0 +1,39 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +# This file was copied from arm64/kernel/pi/Makefile.
>> +
>> +KBUILD_CFLAGS	:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
>> +		   -Os -DDISABLE_BRANCH_PROFILING $(DISABLE_STACKLEAK_PLUGIN) \
>> +		   $(call cc-option,-mbranch-protection=none) \
>> +		   -I$(srctree)/scripts/dtc/libfdt -fno-stack-protector \
>> +		   -D__DISABLE_EXPORTS -ffreestanding \
>> +		   -fno-asynchronous-unwind-tables -fno-unwind-tables \
>> +		   $(call cc-option,-fno-addrsig)
>> +
>> +KBUILD_CFLAGS	+= -mcmodel=medany
>> +
>> +CFLAGS_cmdline_early.o += -D__NO_FORTIFY
>> +CFLAGS_lib-fdt_ro.o += -D__NO_FORTIFY
>> +
>> +GCOV_PROFILE	:= n
>> +KASAN_SANITIZE	:= n
>> +KCSAN_SANITIZE	:= n
>> +UBSAN_SANITIZE	:= n
>> +KCOV_INSTRUMENT	:= n
>> +
>> +$(obj)/%.pi.o: OBJCOPYFLAGS := --prefix-symbols=__pi_ \
>> +			       --remove-section=.note.gnu.property \
>> +			       --prefix-alloc-sections=.init
>> +$(obj)/%.pi.o: $(obj)/%.o FORCE
>> +	$(call if_changed,objcopy)
>> +
>> +$(obj)/lib-%.o: $(srctree)/lib/%.c FORCE
>> +	$(call if_changed_rule,cc_o_c)
>> +
>> +$(obj)/string.o: $(srctree)/lib/string.c FORCE
>> +	$(call if_changed_rule,cc_o_c)
>> +
>> +$(obj)/ctype.o: $(srctree)/lib/ctype.c FORCE
>> +	$(call if_changed_rule,cc_o_c)
>> +
>> +obj-y		:= cmdline_early.pi.o string.pi.o ctype.pi.o lib-fdt.pi.o lib-fdt_ro.pi.o
>> +extra-y		:= $(patsubst %.pi.o,%.o,$(obj-y))
>> diff --git a/arch/riscv/kernel/pi/cmdline_early.c b/arch/riscv/kernel/pi/cmdline_early.c
>> new file mode 100644
>> index 000000000000..05652d13c746
>> --- /dev/null
>> +++ b/arch/riscv/kernel/pi/cmdline_early.c
>> @@ -0,0 +1,62 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +#include <linux/types.h>
>> +#include <linux/init.h>
>> +#include <linux/libfdt.h>
>> +#include <linux/string.h>
>> +#include <asm/pgtable.h>
>> +#include <asm/setup.h>
>> +
>> +static char early_cmdline[COMMAND_LINE_SIZE];
>> +
>> +/*
>> + * Declare the functions that are exported (but prefixed) here so that LLVM
>> + * does not complain it lacks the 'static' keyword (which, if added, makes
>> + * LLVM complain because the function is actually unused in this file).
>> + */
>> +u64 set_satp_mode_from_cmdline(uintptr_t dtb_pa);
>> +
>> +static char *get_early_cmdline(uintptr_t dtb_pa)
>> +{
>> +	const char *fdt_cmdline = NULL;
>> +	unsigned int fdt_cmdline_size = 0;
>> +	int chosen_node;
>> +
>> +	if (!IS_ENABLED(CONFIG_CMDLINE_FORCE)) {
>> +		chosen_node = fdt_path_offset((void *)dtb_pa, "/chosen");
>> +		if (chosen_node >= 0) {
>> +			fdt_cmdline = fdt_getprop((void *)dtb_pa, chosen_node,
>> +						  "bootargs", NULL);
>> +			if (fdt_cmdline) {
>> +				fdt_cmdline_size = strlen(fdt_cmdline);
>> +				strscpy(early_cmdline, fdt_cmdline,
>> +					COMMAND_LINE_SIZE);
>> +			}
>> +		}
>> +	}
>> +
>> +	if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) ||
>> +	    IS_ENABLED(CONFIG_CMDLINE_FORCE) ||
>> +	    fdt_cmdline_size == 0 /* CONFIG_CMDLINE_FALLBACK */) {
>> +		strncat(early_cmdline, CONFIG_CMDLINE,
>> +			COMMAND_LINE_SIZE - fdt_cmdline_size);
>> +	}
>> +
>> +	return early_cmdline;
>> +}
>> +
>> +static u64 match_noXlvl(char *cmdline)
>> +{
>> +	if (strstr(cmdline, "no4lvl"))
>> +		return SATP_MODE_48;
>> +	else if (strstr(cmdline, "no5lvl"))
>> +		return SATP_MODE_57;
>> +
>> +	return 0;
>> +}
>> +
>> +u64 set_satp_mode_from_cmdline(uintptr_t dtb_pa)
>> +{
>> +	char *cmdline = get_early_cmdline(dtb_pa);
>> +
>> +	return match_noXlvl(cmdline);
>> +}
>> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
>> index 615ff5842690..b12a843ad426 100644
>> --- a/arch/riscv/kernel/vmlinux.lds.S
>> +++ b/arch/riscv/kernel/vmlinux.lds.S
>> @@ -83,6 +83,14 @@ SECTIONS
>>  	/* Start of init data section */
>>  	__init_data_begin = .;
>>  	INIT_DATA_SECTION(16)
>> +
>> +	/* Those sections result from the compilation of kernel/pi/string.c */
>> +	.init.pidata : {
>> +		*(.init.srodata.cst8*)
>> +		*(.init__bug_table*)
>> +		*(.init.sdata*)
>> +	}
>> +
>>  	.init.bss : {
>>  		*(.init.bss)	/* from the EFI stub */
>>  	}
>> diff --git a/arch/riscv/lib/memcpy.S b/arch/riscv/lib/memcpy.S
>> index 51ab716253fa..1a40d01a9543 100644
>> --- a/arch/riscv/lib/memcpy.S
>> +++ b/arch/riscv/lib/memcpy.S
>> @@ -106,3 +106,5 @@ WEAK(memcpy)
>>  6:
>>  	ret
>>  END(__memcpy)
>> +SYM_FUNC_ALIAS(__pi_memcpy, __memcpy)
>> +SYM_FUNC_ALIAS(__pi___memcpy, __memcpy)
>> diff --git a/arch/riscv/lib/memmove.S b/arch/riscv/lib/memmove.S
>> index e0609e1f0864..838ff2022fe3 100644
>> --- a/arch/riscv/lib/memmove.S
>> +++ b/arch/riscv/lib/memmove.S
>> @@ -314,3 +314,5 @@ return_from_memmove:
>>
>>  SYM_FUNC_END(memmove)
>>  SYM_FUNC_END(__memmove)
>> +SYM_FUNC_ALIAS(__pi_memmove, __memmove)
>> +SYM_FUNC_ALIAS(__pi___memmove, __memmove)
>> diff --git a/arch/riscv/lib/strlen.S b/arch/riscv/lib/strlen.S
>> index 15bb8f3aa959..9d0055616f7b 100644
>> --- a/arch/riscv/lib/strlen.S
>> +++ b/arch/riscv/lib/strlen.S
>> @@ -131,3 +131,4 @@ strlen_zbb:
>>  .option pop
>>  #endif
>>  SYM_FUNC_END(strlen)
>> +SYM_FUNC_ALIAS(__pi_strlen, strlen)
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index bce899b180cd..3ad771571c2d 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -746,6 +746,8 @@ static __init pgprot_t pgprot_from_va(uintptr_t va)
>>  #endif /* CONFIG_STRICT_KERNEL_RWX */
>>
>>  #if defined(CONFIG_64BIT) && !defined(CONFIG_XIP_KERNEL)
>> +u64 __pi_set_satp_mode_from_cmdline(uintptr_t dtb_pa);
>> +
>>  static void __init disable_pgtable_l5(void)
>>  {
>>  	pgtable_l5_enabled = false;
>> @@ -760,17 +762,39 @@ static void __init disable_pgtable_l4(void)
>>  	satp_mode = SATP_MODE_39;
>>  }
>>
>> +static int __init print_no4lvl(char *p)
>> +{
>> +	pr_info("Disabled 4-level and 5-level paging");
>> +	return 0;
>> +}
>> +early_param("no4lvl", print_no4lvl);
>> +
>> +static int __init print_no5lvl(char *p)
>> +{
>> +	pr_info("Disabled 5-level paging");
>> +	return 0;
>> +}
>> +early_param("no5lvl", print_no5lvl);
>> +
>>  /*
>>   * There is a simple way to determine if 4-level is supported by the
>>   * underlying hardware: establish 1:1 mapping in 4-level page table mode
>>   * then read SATP to see if the configuration was taken into account
>>   * meaning sv48 is supported.
>>   */
>> -static __init void set_satp_mode(void)
>> +static __init void set_satp_mode(uintptr_t dtb_pa)
>>  {
>>  	u64 identity_satp, hw_satp;
>>  	uintptr_t set_satp_mode_pmd = ((unsigned long)set_satp_mode) & PMD_MASK;
>> -	bool check_l4 = false;
>> +	u64 satp_mode_cmdline = __pi_set_satp_mode_from_cmdline(dtb_pa);
>> +
>> +	if (satp_mode_cmdline == SATP_MODE_57) {
>> +		disable_pgtable_l5();
>> +	} else if (satp_mode_cmdline == SATP_MODE_48) {
>> +		disable_pgtable_l5();
>> +		disable_pgtable_l4();
>> +		return;
>> +	}
>>
>>  	create_p4d_mapping(early_p4d,
>>  			set_satp_mode_pmd, (uintptr_t)early_pud,
>> @@ -789,7 +813,8 @@ static __init void set_satp_mode(void)
>>  retry:
>>  	create_pgd_mapping(early_pg_dir,
>>  			   set_satp_mode_pmd,
>> -			   check_l4 ? (uintptr_t)early_pud : (uintptr_t)early_p4d,
>> +			   pgtable_l5_enabled ?
>> +				(uintptr_t)early_p4d : (uintptr_t)early_pud,
>>  			   PGDIR_SIZE, PAGE_TABLE);
>>
>>  	identity_satp = PFN_DOWN((uintptr_t)&early_pg_dir) | satp_mode;
>> @@ -800,9 +825,8 @@ static __init void set_satp_mode(void)
>>  	local_flush_tlb_all();
>>
>>  	if (hw_satp != identity_satp) {
>> -		if (!check_l4) {
>> +		if (pgtable_l5_enabled) {
>>  			disable_pgtable_l5();
>> -			check_l4 = true;
>>  			memset(early_pg_dir, 0, PAGE_SIZE);
>>  			goto retry;
>>  		}
>> @@ -1031,7 +1055,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>>  #endif
>>
>>  #if defined(CONFIG_64BIT) && !defined(CONFIG_XIP_KERNEL)
>> -	set_satp_mode();
>> +	set_satp_mode(dtb_pa);
>>  #endif
>>
>>  	/*
>
> Alex found that we're missing -fpie, which was causing the LLVM boot
> failures.  I'm just going to squash in
>
> diff --git a/arch/riscv/kernel/pi/Makefile b/arch/riscv/kernel/pi/Makefile
> index 42c58f4ab53b..5d7cb991f2b8 100644
> --- a/arch/riscv/kernel/pi/Makefile
> +++ b/arch/riscv/kernel/pi/Makefile
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # This file was copied from arm64/kernel/pi/Makefile.
>
> -KBUILD_CFLAGS	:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
> +KBUILD_CFLAGS	:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) -fpie \
>  		   -Os -DDISABLE_BRANCH_PROFILING $(DISABLE_STACKLEAK_PLUGIN) \
>  		   $(call cc-option,-mbranch-protection=none) \
>  		   -I$(srctree)/scripts/dtc/libfdt -fno-stack-protector \

Looks like we got a bit ahead of ourselves, this trips up some warnings 
like

riscv64-unknown-linux-gnu-ld: warning: orphan section `.got' from `init/main.o' being placed in section `.got'
riscv64-unknown-linux-gnu-ld: warning: orphan section `.got.plt' from `init/main.o' being placed in section `.got.plt'

I'm going to drop this for now, Alex is looking at a better fix.  Sorry 
for the churn!


--===============4228784555169839651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4228784555169839651==--
