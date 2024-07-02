Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B952FC3064D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 04:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1YbiKJBFuGS1u7ocqu8fojMIZeBWRcOhBg8o2kAnEE8=; b=vvlT9z6sRQ1/6W
	OogEL9+jkViXl7KToiSn443JO54y+YyyZHhvdcr0EMwcINpcUOjyLQCp+qfunAWHzxTsZ6KBzBZwC
	XuqQiU5GKVblJSac0HppaprpfLHZHLTfrOq2IP8QYYjI/yJOaN4QUKPSf3DqmmLvCuz+qmOd9K+4s
	lBYt61xqinwkCuYSQ9hHe6UDoL5d/I7GqGOaAk58du4xSH6yxexsbrRNu0Bmy2rfLhQMh9ZOfqYbx
	uut2gebaAVzvjaC18+f5G9g3cb41QjJ03u9Pwjhx6jlz79vok/h9Jv3aEGOVtscVYaLf0jVQ9yEMg
	1TRUoC2uJGZBiYDNs9+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOVAP-00000005VmZ-1ePb;
	Tue, 02 Jul 2024 04:30:57 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOVAK-00000005Vm8-3f7b
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 04:30:55 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-725a7b0fc55so2167424a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 21:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719894651; x=1720499451; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j7wHN8ZS4EW/ROGi5LHr2BBapsgd7jowT7gRws/UAh8=;
        b=1PAL+hpFrWpbqtDu6fbkpX0Z5TYzqgi0qAX+7FdmMaNaVctjCnMGXkyET/Qa3ISvJR
         tOq0v5zULasaDgMT227x4I+dYR1a+vSjWl1c2/Qensl/nCsYKPYjXoqTePSxc20wHVuP
         Tk9lthtEfRoM4aId3Qc/NFvhi87cIfpRXExpzgD+iJPvis2JDU2uR/8aHXHW0g1PWkll
         a/N5yqDCRQyeTnVcxRFPMup8+fYYw/jr7J2O268dqqxAUkfbXpOfncROWCpXuAc2elol
         m3nkdZLYpXVTMLGzvfJzzQn3WaXWLfkcD5S1M81k2mvVgzkul258AqPHMsbz26NXjQ7a
         TsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719894651; x=1720499451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7wHN8ZS4EW/ROGi5LHr2BBapsgd7jowT7gRws/UAh8=;
        b=sI2Ca+pcbjn0rJM8xcu3NQdUudUrl5CED2F/oS3RASzJtdnjMT+5K1mQq7D8Wx3LRY
         WRLRCkLzFSqXcceiBlkgJFS+CJ+lODgBD6he1A+VqP7943J5hmofEZke1C2vHwAw3Pqf
         DA2kK4wjS4+rmHLXLqo6M/AA18PGAMKH5EqTx1zcgTpFnUBzwOsOfNyaY5HzMj9v2cNK
         IaH5iS2kSwOzkTfibmA0FJJhhYtTYSW5qJxzXv1KVIlNevLfWukWXqOBAv290D0+2f0g
         mrlZv2qwKtvqtWB+I6LTnDjGXlS+ejkQpsFCvv0PJ0zI/rGO5EAS/vW1DpNkhhrmyMec
         omBg==
X-Gm-Message-State: AOJu0YybAsw26+bSC5nms5lh6P+GZXa+vqXTKctqztJhKIWTTVitTTQF
	a6lddd7FENZBlBkucjfCkckQdtokCkNQ4kr9YXjF0lIoVjkzVp/Pw8rrjPY/drw=
X-Google-Smtp-Source: AGHT+IEA+hwI1pWHzT1n/noPMk2yq8ZulVIVMBdYuGLl8QeXBXHg42EsIQfke1S7YJEV2djWmrb7ig==
X-Received: by 2002:a05:6a20:3941:b0:1bd:28d1:fc5 with SMTP id adf61e73a8af0-1bef611b7e9mr7758299637.6.1719894651375;
        Mon, 01 Jul 2024 21:30:51 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:a569:328b:99ad:ce17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1539255sm73322835ad.129.2024.07.01.21.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 21:30:50 -0700 (PDT)
Date: Mon, 1 Jul 2024 21:30:48 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Wende Tan <twd2.me@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Sami Tolvanen <samitolvanen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3 4/4] RISC-V: Use Zkr to seed KASLR base address
Message-ID: <ZoOCeMUTIgnA72xj@ghost>
References: <20240701185132.319995-1-jesse@rivosinc.com>
 <20240701185132.319995-5-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240701185132.319995-5-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_213053_166031_531B9E6D 
X-CRM114-Status: GOOD (  41.25  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 01, 2024 at 02:51:32PM -0400, Jesse Taube wrote:
> Parse the device tree for Zkr in the isa string.
> If Zkr is present, use it to seed the kernel base address.
> 
> On an ACPI system, as of this commit, there is no easy way to check if
> Zkr is present. Blindly running the instruction isn't an option as;
> we have to be able to trust the firmware.
> 
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
> V1 -> V2:
>  - Almost entire rewrite
> V2 -> V3:
>  - Dont parse iscv,isa-base
>  - Move fdt_early_match_extension_isa in pi.h under comment
>  - Only check enabled cpus
>  - Rename early_isa_str to fdt_early_match_extension_isa
>  - Rename get_ext_named to early_cpu_isa_ext_available
>  - Rewrite isa_string_contains
>  - Update commit description
>  - Use fdt_stringlist_contains for riscv,isa-extensions
> ---
>  arch/riscv/kernel/pi/Makefile           |   2 +-
>  arch/riscv/kernel/pi/archrandom_early.c |  30 +++++
>  arch/riscv/kernel/pi/fdt_early.c        | 160 ++++++++++++++++++++++++
>  arch/riscv/kernel/pi/pi.h               |   3 +
>  arch/riscv/mm/init.c                    |   5 +-
>  5 files changed, 198 insertions(+), 2 deletions(-)
>  create mode 100644 arch/riscv/kernel/pi/archrandom_early.c
> 
> diff --git a/arch/riscv/kernel/pi/Makefile b/arch/riscv/kernel/pi/Makefile
> index 1ef7584be0c3..dba902f2a538 100644
> --- a/arch/riscv/kernel/pi/Makefile
> +++ b/arch/riscv/kernel/pi/Makefile
> @@ -33,5 +33,5 @@ $(obj)/string.o: $(srctree)/lib/string.c FORCE
>  $(obj)/ctype.o: $(srctree)/lib/ctype.c FORCE
>  	$(call if_changed_rule,cc_o_c)
>  
> -obj-y		:= cmdline_early.pi.o fdt_early.pi.o string.pi.o ctype.pi.o lib-fdt.pi.o lib-fdt_ro.pi.o
> +obj-y		:= cmdline_early.pi.o fdt_early.pi.o string.pi.o ctype.pi.o lib-fdt.pi.o lib-fdt_ro.pi.o archrandom_early.pi.o

When CONFIG_FORTIFY_SOURCE is enabled, the string functions try to
reference `__fortify_panic` which gets aliased to `__pi___fortify_panic`
and causes lld to fail:

ld.lld: error: undefined hidden symbol: __pi___fortify_panic
>>> referenced by fdt_early.c:24 (arch/riscv/kernel/pi/fdt_early.c:24)
>>>               arch/riscv/kernel/pi/fdt_early.pi.o:(__pi_fdt_early_match_extension_isa) in archive vmlinux.a

This early in boot __fortify_panic isn't supported. Can you add
`CFLAGS_fdt_early.o += -D__NO_FORTIFY` next to the same addition for
cmdline_early and fdt_early?

The rest of this looks go to me (just send a new version with this simple fix).

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

>  extra-y		:= $(patsubst %.pi.o,%.o,$(obj-y))
> diff --git a/arch/riscv/kernel/pi/archrandom_early.c b/arch/riscv/kernel/pi/archrandom_early.c
> new file mode 100644
> index 000000000000..3f05d3cf3b7b
> --- /dev/null
> +++ b/arch/riscv/kernel/pi/archrandom_early.c
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <asm/csr.h>
> +#include <linux/processor.h>
> +
> +#include "pi.h"
> +
> +/*
> + * To avoid rewriting code include asm/archrandom.h and create macros
> + * for the functions that won't be included.
> + */
> +#undef riscv_has_extension_unlikely
> +#define riscv_has_extension_likely(...) false
> +#undef pr_err_once
> +#define pr_err_once(...)
> +
> +#include <asm/archrandom.h>
> +
> +u64 get_kaslr_seed_zkr(const uintptr_t dtb_pa)
> +{
> +	unsigned long seed = 0;
> +
> +	if (!fdt_early_match_extension_isa((const void *)dtb_pa, "zkr"))
> +		return 0;
> +
> +	if (!csr_seed_long(&seed))
> +		return 0;
> +
> +	return seed;
> +}
> diff --git a/arch/riscv/kernel/pi/fdt_early.c b/arch/riscv/kernel/pi/fdt_early.c
> index 40ee299702bf..49ff5360bf87 100644
> --- a/arch/riscv/kernel/pi/fdt_early.c
> +++ b/arch/riscv/kernel/pi/fdt_early.c
> @@ -2,6 +2,7 @@
>  #include <linux/types.h>
>  #include <linux/init.h>
>  #include <linux/libfdt.h>
> +#include <linux/ctype.h>
>  
>  #include "pi.h"
>  
> @@ -23,3 +24,162 @@ u64 get_kaslr_seed(uintptr_t dtb_pa)
>  	*prop = 0;
>  	return ret;
>  }
> +
> +/**
> + *  fdt_device_is_available - check if a device is available for use
> + *
> + * @fdt: pointer to the device tree blob
> + * @node: offset of the node whose property to find
> + *
> + *  Returns true if the status property is absent or set to "okay" or "ok",
> + *  false otherwise
> + */
> +static bool fdt_device_is_available(const void *fdt, int node)
> +{
> +	const char *status;
> +	int statlen;
> +
> +	status = fdt_getprop(fdt, node, "status", &statlen);
> +	if (!status)
> +		return true;
> +
> +	if (statlen > 0) {
> +		if (!strcmp(status, "okay") || !strcmp(status, "ok"))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +/* Copy of fdt_nodename_eq_ */
> +static int fdt_node_name_eq(const void *fdt, int offset,
> +			    const char *s)
> +{
> +	int olen;
> +	int len = strlen(s);
> +	const char *p = fdt_get_name(fdt, offset, &olen);
> +
> +	if (!p || olen < len)
> +		/* short match */
> +		return 0;
> +
> +	if (memcmp(p, s, len) != 0)
> +		return 0;
> +
> +	if (p[len] == '\0')
> +		return 1;
> +	else if (!memchr(s, '@', len) && (p[len] == '@'))
> +		return 1;
> +	else
> +		return 0;
> +}
> +
> +/**
> + *  isa_string_contains - check if isa string contains an extension
> + *
> + * @isa_str: isa string to search
> + * @ext_name: the extension to search for
> + *
> + *  Returns true if the extension is in the given isa string,
> + *  false otherwise
> + */
> +static bool isa_string_contains(const char *isa_str, const char *ext_name)
> +{
> +	size_t i, single_end, len = strlen(ext_name);
> +	char ext_end;
> +
> +	/* Error must contain rv32/64 */
> +	if (strlen(isa_str) < 4)
> +		return false;
> +
> +	if (len == 1) {
> +		single_end = strcspn(isa_str, "sSxXzZ");
> +		/* Search for single chars between rv32/64 and multi-letter extensions */
> +		for (i = 4; i < single_end; i++) {
> +			if (tolower(isa_str[i]) == ext_name[0])
> +				return true;
> +		}
> +		return false;
> +	}
> +
> +	/* Skip to start of multi-letter extensions */
> +	isa_str = strpbrk(isa_str, "sSxXzZ");
> +	while (isa_str) {
> +		if (strncasecmp(isa_str, ext_name, len) == 0) {
> +			ext_end = isa_str[len];
> +			/* Check if matches the whole extension excluding version. */
> +			if (ext_end == '\0' || ext_end == '_' || isdigit(ext_end))
> +				return true;
> +		}
> +		/* Multi-letter extensions must be split from other multi-letter
> +		 * extensions with an "_", the end of a multi-letter extension will
> +		 * either be the null character or the "_" at the start of the next
> +		 * multi-letter extension.
> +		 */
> +		isa_str = strchr(isa_str, '_');
> +		if (isa_str)
> +			isa_str++;
> +	}
> +
> +	return false;
> +}
> +
> +/**
> + *  early_cpu_isa_ext_available - check if cpu node has an extension
> + *
> + * @fdt: pointer to the device tree blob
> + * @node: offset of the cpu node
> + * @ext_name: the extension to search for
> + *
> + *  Returns true if the cpu node has the extension,
> + *  false otherwise
> + */
> +static bool early_cpu_isa_ext_available(const void *fdt, int node, const char *ext_name)
> +{
> +	const void *prop;
> +	int len;
> +
> +	prop = fdt_getprop(fdt, node, "riscv,isa-extensions", &len);
> +	if (prop && fdt_stringlist_contains(prop, len, ext_name))
> +		return true;
> +
> +	prop = fdt_getprop(fdt, node, "riscv,isa", &len);
> +	if (prop && isa_string_contains(prop, ext_name))
> +		return true;
> +
> +	return false;
> +}
> +
> +/**
> + *  fdt_early_match_extension_isa - check if all cpu nodes have an extension
> + *
> + * @fdt: pointer to the device tree blob
> + * @ext_name: the extension to search for
> + *
> + *  Returns true if the all available the cpu nodes have the extension,
> + *  false otherwise
> + */
> +bool fdt_early_match_extension_isa(const void *fdt, const char *ext_name)
> +{
> +	int node, parent;
> +	bool ret = false;
> +
> +	parent = fdt_path_offset(fdt, "/cpus");
> +	if (parent < 0)
> +		return false;
> +
> +	fdt_for_each_subnode(node, fdt, parent) {
> +		if (!fdt_node_name_eq(fdt, node, "cpu"))
> +			continue;
> +
> +		if (!fdt_device_is_available(fdt, node))
> +			continue;
> +
> +		if (!early_cpu_isa_ext_available(fdt, node, ext_name))
> +			return false;
> +
> +		ret = true;
> +	}
> +
> +	return ret;
> +}
> diff --git a/arch/riscv/kernel/pi/pi.h b/arch/riscv/kernel/pi/pi.h
> index 493c8cb7c0e6..21141d84fea6 100644
> --- a/arch/riscv/kernel/pi/pi.h
> +++ b/arch/riscv/kernel/pi/pi.h
> @@ -11,7 +11,10 @@
>   */
>  
>  u64 get_kaslr_seed(uintptr_t dtb_pa);
> +u64 get_kaslr_seed_zkr(const uintptr_t dtb_pa);
>  bool set_nokaslr_from_cmdline(uintptr_t dtb_pa);
>  u64 set_satp_mode_from_cmdline(uintptr_t dtb_pa);
>  
> +bool fdt_early_match_extension_isa(const void *fdt, const char *ext_name);
> +
>  #endif /* _RISCV_PI_H_ */
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 9940171c79f0..bfb068dc4a64 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -1025,6 +1025,7 @@ static void __init pt_ops_set_late(void)
>  #ifdef CONFIG_RANDOMIZE_BASE
>  extern bool __init __pi_set_nokaslr_from_cmdline(uintptr_t dtb_pa);
>  extern u64 __init __pi_get_kaslr_seed(uintptr_t dtb_pa);
> +extern u64 __init __pi_get_kaslr_seed_zkr(const uintptr_t dtb_pa);
>  
>  static int __init print_nokaslr(char *p)
>  {
> @@ -1045,10 +1046,12 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>  
>  #ifdef CONFIG_RANDOMIZE_BASE
>  	if (!__pi_set_nokaslr_from_cmdline(dtb_pa)) {
> -		u64 kaslr_seed = __pi_get_kaslr_seed(dtb_pa);
> +		u64 kaslr_seed = __pi_get_kaslr_seed_zkr(dtb_pa);
>  		u32 kernel_size = (uintptr_t)(&_end) - (uintptr_t)(&_start);
>  		u32 nr_pos;
>  
> +		if (kaslr_seed == 0)
> +			kaslr_seed = __pi_get_kaslr_seed(dtb_pa);
>  		/*
>  		 * Compute the number of positions available: we are limited
>  		 * by the early page table that only has one PUD and we must
> -- 
> 2.45.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
