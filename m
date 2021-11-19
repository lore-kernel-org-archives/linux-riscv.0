Return-Path: <SRS0=zkJ7=QG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CBB1C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 02:10:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35C4461A89
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 02:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35C4461A89
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:CC:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jP7Lw4NoMDb/6tU9g84YIVckEN4B5M21TC1hL+J1/fA=; b=xZVP963jQiRZoOmGL+YHSzEffL
	OtINMNA0RpD3UrDqfanNz2IXsRqA2n7zRFkatqRPa/XbN+iOS33mhZKPu4WX512fGCcpnZoC411rX
	5bsx4YxiT8wAIlraJtfSSc2yJveDxhBEsKTspeE37tvvVYPrAvfbflN1FjrxhZK7jx8eVx1WHF0O3
	7SKYZz2X5FQ/YrQg/0g15CtEDHfJsfzMMrV6XOERU9jQwyNRKtcXdeRB33q7uXFA8urOXkCWV0pvY
	kt3qmwn0JJdZwddQ47WVdnSW4v8V8PxD9p7WphaTLaYXKb0zoNucIaJTLPm/9VixpC/GIsM8QjxA+
	3gj2k0Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mntLx-009Dry-4i; Fri, 19 Nov 2021 02:10:13 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mntLs-009Dpx-Qi
 for linux-riscv@lists.infradead.org; Fri, 19 Nov 2021 02:10:11 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HwKk46rXQzbhjk;
 Fri, 19 Nov 2021 10:05:00 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 19 Nov 2021 10:09:57 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Fri, 19 Nov 2021 10:09:55 +0800
Subject: Re: [PATCH 03/12] riscv: switch to relative exception tables
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, "Song
 Liu" <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, "Nick
 Desaulniers" <ndesaulniers@google.com>
References: <20211118192130.48b8f04c@xhacker> <20211118192251.749c04f7@xhacker>
CC: Kefeng Wang <wangkefeng.wang@huawei.com>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
From: tongtiangen <tongtiangen@huawei.com>
Message-ID: <bc466684-b02e-c6b0-13cf-a071eeebff8c@huawei.com>
Date: Fri, 19 Nov 2021 10:09:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20211118192251.749c04f7@xhacker>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_181009_253184_3B467E3C 
X-CRM114-Status: GOOD (  29.90  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi jisheng:
eBPF's exception tables needs to be modified to relative synchronously.

I modified and verified the code as follows:

===================
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -499,7 +499,7 @@ static int add_exception_handler(const struct bpf_insn *insn,
         offset = pc - (long)&ex->insn;
         if (WARN_ON_ONCE(offset >= 0 || offset < INT_MIN))
                 return -ERANGE;
-       ex->insn = pc;
+       ex->insn = offset;
===================

Thanks.

Reviewed-by:Tong Tiangen <tongtiangen@huawei.com>

On 2021/11/18 19:22, Jisheng Zhang wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> Similar as other architectures such as arm64, x86 and so on, use
> offsets relative to the exception table entry values rather than
> absolute addresses for both the exception locationand the fixup.
>
> However, RISCV label difference will actually produce two relocations,
> a pair of R_RISCV_ADD32 and R_RISCV_SUB32. Take below simple code for
> example:
>
> $ cat test.S
> .section .text
> 1:
>         nop
> .section __ex_table,"a"
>         .balign 4
>         .long (1b - .)
> .previous
>
> $ riscv64-linux-gnu-gcc -c test.S
> $ riscv64-linux-gnu-readelf -r test.o
> Relocation section '.rela__ex_table' at offset 0x100 contains 2 entries:
>   Offset          Info           Type           Sym. Value    Sym. Name + Addend
> 000000000000  000600000023 R_RISCV_ADD32     0000000000000000 .L1^B1 + 0
> 000000000000  000500000027 R_RISCV_SUB32     0000000000000000 .L0  + 0
>
> The modpost will complain the R_RISCV_SUB32 relocation, so we need to
> patch modpost.c to skip this relocation for .rela__ex_table section.
>
> After this patch, the __ex_table section size of defconfig vmlinux is
> reduced from 7072 Bytes to 3536 Bytes.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/include/asm/Kbuild    |  1 -
>  arch/riscv/include/asm/extable.h | 25 +++++++++++++++++++++++++
>  arch/riscv/include/asm/uaccess.h |  4 ++--
>  arch/riscv/lib/uaccess.S         |  4 ++--
>  arch/riscv/mm/extable.c          |  2 +-
>  scripts/mod/modpost.c            | 15 +++++++++++++++
>  scripts/sorttable.c              |  2 +-
>  7 files changed, 46 insertions(+), 7 deletions(-)
>  create mode 100644 arch/riscv/include/asm/extable.h
>
> diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
> index 445ccc97305a..57b86fd9916c 100644
> --- a/arch/riscv/include/asm/Kbuild
> +++ b/arch/riscv/include/asm/Kbuild
> @@ -1,6 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  generic-y += early_ioremap.h
> -generic-y += extable.h
>  generic-y += flat.h
>  generic-y += kvm_para.h
>  generic-y += user.h
> diff --git a/arch/riscv/include/asm/extable.h b/arch/riscv/include/asm/extable.h
> new file mode 100644
> index 000000000000..84760392fc69
> --- /dev/null
> +++ b/arch/riscv/include/asm/extable.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_RISCV_EXTABLE_H
> +#define _ASM_RISCV_EXTABLE_H
> +
> +/*
> + * The exception table consists of pairs of relative offsets: the first
> + * is the relative offset to an instruction that is allowed to fault,
> + * and the second is the relative offset at which the program should
> + * continue. No registers are modified, so it is entirely up to the
> + * continuation code to figure out what to do.
> + *
> + * All the routines below use bits of fixup code that are out of line
> + * with the main instruction path.  This means when everything is well,
> + * we don't even have to jump over them.  Further, they do not intrude
> + * on our cache or tlb entries.
> + */
> +
> +struct exception_table_entry {
> +	int insn, fixup;
> +};
> +
> +#define ARCH_HAS_RELATIVE_EXTABLE
> +
> +int fixup_exception(struct pt_regs *regs);
> +#endif
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index 714cd311d9f1..0f2c5b9d2e8f 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -12,8 +12,8 @@
>
>  #define _ASM_EXTABLE(from, to)						\
>  	"	.pushsection	__ex_table, \"a\"\n"			\
> -	"	.balign "	RISCV_SZPTR "	 \n"			\
> -	"	" RISCV_PTR	"(" #from "), (" #to ")\n"		\
> +	"	.balign		4\n"					\
> +	"	.long		(" #from " - .), (" #to " - .)\n"	\
>  	"	.popsection\n"
>
>  /*
> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
> index 63bc691cff91..55f80f84e23f 100644
> --- a/arch/riscv/lib/uaccess.S
> +++ b/arch/riscv/lib/uaccess.S
> @@ -7,8 +7,8 @@
>  100:
>  	\op \reg, \addr
>  	.section __ex_table,"a"
> -	.balign RISCV_SZPTR
> -	RISCV_PTR 100b, \lbl
> +	.balign 4
> +	.long (100b - .), (\lbl - .)
>  	.previous
>  	.endm
>
> diff --git a/arch/riscv/mm/extable.c b/arch/riscv/mm/extable.c
> index ddb7d3b99e89..d8d239c2c1bd 100644
> --- a/arch/riscv/mm/extable.c
> +++ b/arch/riscv/mm/extable.c
> @@ -28,6 +28,6 @@ int fixup_exception(struct pt_regs *regs)
>  		return rv_bpf_fixup_exception(fixup, regs);
>  #endif
>
> -	regs->epc = fixup->fixup;
> +	regs->epc = (unsigned long)&fixup->fixup + fixup->fixup;
>  	return 1;
>  }
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index cb8ab7d91d30..6bfa33217914 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1830,6 +1830,14 @@ static int addend_mips_rel(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Rela *r)
>  	return 0;
>  }
>
> +#ifndef EM_RISCV
> +#define EM_RISCV		243
> +#endif
> +
> +#ifndef R_RISCV_SUB32
> +#define R_RISCV_SUB32		39
> +#endif
> +
>  static void section_rela(const char *modname, struct elf_info *elf,
>  			 Elf_Shdr *sechdr)
>  {
> @@ -1866,6 +1874,13 @@ static void section_rela(const char *modname, struct elf_info *elf,
>  		r_sym = ELF_R_SYM(r.r_info);
>  #endif
>  		r.r_addend = TO_NATIVE(rela->r_addend);
> +		switch (elf->hdr->e_machine) {
> +		case EM_RISCV:
> +			if (!strcmp("__ex_table", fromsec) &&
> +			    ELF_R_TYPE(r.r_info) == R_RISCV_SUB32)
> +				continue;
> +			break;
> +		}
>  		sym = elf->symtab_start + r_sym;
>  		/* Skip special sections */
>  		if (is_shndx_special(sym->st_shndx))
> diff --git a/scripts/sorttable.c b/scripts/sorttable.c
> index b7c2ad71f9cf..0c031e47a419 100644
> --- a/scripts/sorttable.c
> +++ b/scripts/sorttable.c
> @@ -376,6 +376,7 @@ static int do_file(char const *const fname, void *addr)
>  	case EM_PARISC:
>  	case EM_PPC:
>  	case EM_PPC64:
> +	case EM_RISCV:
>  		custom_sort = sort_relative_table;
>  		break;
>  	case EM_ARCOMPACT:
> @@ -383,7 +384,6 @@ static int do_file(char const *const fname, void *addr)
>  	case EM_ARM:
>  	case EM_MICROBLAZE:
>  	case EM_MIPS:
> -	case EM_RISCV:
>  	case EM_XTENSA:
>  		break;
>  	default:
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
