Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6940BC5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 16:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:
	In-Reply-To:Date:References:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KMeWk8L3YJHa7dMIzh9Q2VQbuuHc477IesUBvQd2GC0=; b=hCVQAJtgnUt/o94/Qjip93W653
	w4K6BcQF1mDDXD68xUp4h9Aki5PYXK4ujaqhukq3jWzlM623UJ+4D6sp1prE37hkRMHLiXK24hJwx
	Zr4nmdPIbgQnXZhxMx7XEuCAFCLqVN1+2dcRd6H+f+/AJpRCmp0rG1P4fDXIb5NDS0YarOxiFvPS1
	w3YldI+fHjk4hI1udr+DZ6KbCtc42e7CPkHoEv0JauHSmbKz/pIS79zWWQDNxFOAtq5WiyKzC3JqU
	lqtqvO6Xd2D1Omc+JsyN9u+xnBBIEBvCX7U7QXt6Ex0fl7K8navP167V+3yRmIuSWQam/7G4fTw6B
	nXW04dhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFeN3-00CE1K-VA; Wed, 11 Jan 2023 16:54:37 +0000
Received: from out03.mta.xmission.com ([166.70.13.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFeN1-00CDxy-5f
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 16:54:37 +0000
Received: from in01.mta.xmission.com ([166.70.13.51]:40424)
	by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1pFeMe-00AaJZ-9n; Wed, 11 Jan 2023 09:54:12 -0700
Received: from ip68-110-29-46.om.om.cox.net ([68.110.29.46]:35842 helo=email.froward.int.ebiederm.org.xmission.com)
	by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1pFeMc-00Btqi-O7; Wed, 11 Jan 2023 09:54:11 -0700
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org,
  palmer@rivosinc.com,  Paul Walmsley <paul.walmsley@sifive.com>,  Albert
 Ou <aou@eecs.berkeley.edu>,  Kees Cook <keescook@chromium.org>,  Guo Ren
 <guoren@kernel.org>,  Greentime Hu <greentime.hu@sifive.com>,  Conor
 Dooley <conor.dooley@microchip.com>,  linux@rivosinc.com,  kernel test
 robot <lkp@intel.com>
References: <20230110201841.2069353-1-vineetg@rivosinc.com>
Date: Wed, 11 Jan 2023 10:53:43 -0600
In-Reply-To: <20230110201841.2069353-1-vineetg@rivosinc.com> (Vineet Gupta's
	message of "Tue, 10 Jan 2023 12:18:41 -0800")
Message-ID: <87tu0xko6g.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1pFeMc-00Btqi-O7;;;mid=<87tu0xko6g.fsf@email.froward.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=68.110.29.46;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX1+fwyd9BlePvUBxqwyPNTq7xFHkSxOf+m8=
X-SA-Exim-Connect-IP: 68.110.29.46
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: [PATCH] riscv: elf: add .riscv.attributes parsing
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_085435_264232_ACD72748 
X-CRM114-Status: GOOD (  29.43  )
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

Vineet Gupta <vineetg@rivosinc.com> writes:

> This implements the elf loader hook to parse RV specific
> .riscv.attributes section. This section is inserted by compilers
> (gcc/llvm) with build related information such as -march organized as
> tag/value attribute pairs.
>
> It identifies the various attribute tags (and corresponding values) as
> currently specified in the psABI specification.
>
> This patch only implements the elf parsing mechanics, leaving out the
> recording/usage of the attributes to subsequent patches.

Why does the kernel care?

Unless I am mistaken the kind of information you are describing is
typically dealt with by the dynamic linker, rather than the kernel.

As a general strategy I think it is smart to leave as much to
userspace and the dynamic linker and possible intead of asking
the kernel's elf loader to care.  That allows more rapid
prototyping and reduces the impact of parsing bugs.

Eric



> Reported-by: kernel test robot <lkp@intel.com>  # code under CONFIG_COMPAT
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> ---
>  arch/riscv/Kconfig           |   1 +
>  arch/riscv/include/asm/elf.h |  11 +++
>  arch/riscv/kernel/Makefile   |   1 +
>  arch/riscv/kernel/elf-attr.c | 150 +++++++++++++++++++++++++++++++++++
>  4 files changed, 163 insertions(+)
>  create mode 100644 arch/riscv/kernel/elf-attr.c
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e2b656043abf..f7e0ab05a2d2 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -12,6 +12,7 @@ config 32BIT
>  
>  config RISCV
>  	def_bool y
> +	select ARCH_BINFMT_ELF_STATE
>  	select ARCH_CLOCKSOURCE_INIT
>  	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
>  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
> diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
> index e7acffdf21d2..7ab8bd0ec330 100644
> --- a/arch/riscv/include/asm/elf.h
> +++ b/arch/riscv/include/asm/elf.h
> @@ -116,6 +116,17 @@ do {							\
>  		*(struct user_regs_struct *)regs;	\
>  } while (0);
>  
> +struct arch_elf_state {
> +};
> +
> +#define INIT_ARCH_ELF_STATE {}
> +
> +extern int arch_elf_pt_proc(void *ehdr, void *phdr, struct file *elf,
> +			    bool is_interp, struct arch_elf_state *state);
> +
> +extern int arch_check_elf(void *ehdr, bool has_interpreter, void *interp_ehdr,
> +			  struct arch_elf_state *state);
> +
>  #ifdef CONFIG_COMPAT
>  
>  #define SET_PERSONALITY(ex)					\
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index 4cf303a779ab..eff6d845ac9d 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -50,6 +50,7 @@ obj-y	+= riscv_ksyms.o
>  obj-y	+= stacktrace.o
>  obj-y	+= cacheinfo.o
>  obj-y	+= patch.o
> +obj-y	+= elf-attr.o
>  obj-y	+= probes/
>  obj-$(CONFIG_MMU) += vdso.o vdso/
>  
> diff --git a/arch/riscv/kernel/elf-attr.c b/arch/riscv/kernel/elf-attr.c
> new file mode 100644
> index 000000000000..148d720f97de
> --- /dev/null
> +++ b/arch/riscv/kernel/elf-attr.c
> @@ -0,0 +1,150 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023-24 Rivos Inc.
> + */
> +
> +#include <linux/binfmts.h>
> +#include <linux/elf.h>
> +
> +#undef pr_fmt
> +#define pr_fmt(fmt) "rv-elf-attr: " fmt
> +
> +#define PT_RISCV_ATTRIBUTES		0x70000003
> +
> +#define RV_ATTR_TAG_stack_align		4
> +#define RV_ATTR_TAG_arch		5
> +#define RV_ATTR_TAG_unaligned_access	6
> +
> +#define RV_ATTR_SEC_SZ			SZ_1K
> +
> +static void rv_elf_attr_int(u64 tag, u64 val)
> +{
> +}
> +
> +static void rv_elf_attr_str(u64 tag, const char *str)
> +{
> +}
> +
> +static u64
> +decode_uleb128(unsigned char **dpp)
> +{
> +	unsigned char *bp = *dpp;
> +	unsigned char byte;
> +	unsigned int shift = 0;
> +	u64 result = 0;
> +
> +	while (1) {
> +		byte = *bp++;
> +		result |= (byte & 0x7f) << shift;
> +		if ((byte & 0x80) == 0)
> +			break;
> +		shift += 7;
> +	}
> +	*dpp = bp;
> +	return result;
> +}
> +
> +/*
> + * Parse .riscv.attributes elf section to get the various compile time
> + * attributes such as -march, unaligned access and so no.
> + */
> +static int rv_parse_elf_attributes(struct file *f, const struct elf_phdr *phdr,
> +				   struct arch_elf_state *state)
> +{
> +	unsigned char buf[RV_ATTR_SEC_SZ];
> +	unsigned char *p;
> +	ssize_t n;
> +	int ret = 0;
> +	loff_t pos;
> +
> +	pr_debug("Section .riscv.attributes found\n");
> +
> +	/* Assume a reasonable size for now */
> +	if (phdr->p_filesz > sizeof(buf))
> +		return -ENOEXEC;
> +
> +	memset(buf, 0, RV_ATTR_SEC_SZ);
> +	pos = phdr->p_offset;
> +	n = kernel_read(f, &buf, phdr->p_filesz, &pos);
> +
> +	if (n < 0)
> +		return -EIO;
> +
> +	p = buf;
> +	p++;				/* format-version (1B) */
> +
> +	while ((p - buf) < n) {
> +
> +		unsigned char *vendor_start;
> +		u32 len;
> +
> +		/*
> +		 * Organized as "vendor" sub-section(s).
> +		 * Current only 1 specified "riscv"
> +		 */
> +
> +		p += 4;			/* sub-section length (4B) */
> +		while (*p++ != '\0')	/* vendor name string */
> +			;
> +		p++;			/* Tag_File (1B) */
> +		len = *(u32 *)p;	/* data length (4B) */
> +		p += 4;
> +
> +		len -= 5;		/* data length includes Tag and self length */
> +		vendor_start = p;
> +		while ((p - vendor_start) < len) {
> +
> +			u64 tag = decode_uleb128(&p);
> +			unsigned char *val_str;
> +			u64 val_n;
> +
> +			switch (tag) {
> +			case RV_ATTR_TAG_stack_align:
> +				val_n = decode_uleb128(&p);
> +				break;
> +
> +			case RV_ATTR_TAG_unaligned_access:
> +				val_n = decode_uleb128(&p);
> +				pr_debug("Tag_RISCV_unaligned_access =%llu\n", val_n);
> +				rv_elf_attr_int(tag, val_n);
> +				break;
> +
> +			case RV_ATTR_TAG_arch:
> +				val_str = p;
> +				while (*p++ != '\0')
> +					;
> +				pr_debug("Tag_RISCV_arch =[%s]\n", val_str);
> +				rv_elf_attr_str(tag, val_str);
> +				break;
> +
> +			default:
> +				val_n = decode_uleb128(&p);
> +				pr_debug("skipping Unrecognized Tag [%llu]=%llu\n", tag, val_n);
> +				break;
> +			}
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +/*
> + * Hook invoked from common elf loader to parse any arch specific elf segments
> + */
> +int arch_elf_pt_proc(void *_ehdr, void *_phdr, struct file *elf,
> +		     bool is_interp, struct arch_elf_state *state)
> +{
> +	struct elf_phdr *phdr = _phdr;
> +	int ret = 0;
> +
> +	if (phdr->p_type == PT_RISCV_ATTRIBUTES && !is_interp)
> +		ret = rv_parse_elf_attributes(elf, phdr, state);
> +
> +	return ret;
> +}
> +
> +int arch_check_elf(void *_ehdr, bool has_interpreter, void *_interp_ehdr,
> +		   struct arch_elf_state *state)
> +{
> +	return 0;
> +}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
