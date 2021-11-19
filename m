Return-Path: <SRS0=zkJ7=QG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D38C9C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 02:36:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7244D6121F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 02:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7244D6121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:CC:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q998UoFo4X1geNpaZab9ZDSgrsdy1mEOKYOAqsjYw3U=; b=NHIfuMbR58JZTV4JjoO7HMRrJv
	7aF6kpcQK2/6W2rTaezy25n3jpIpWwo9+KMguYprFJF6MyUHN4u0NqpNquUvEZBWWWmfoCg1BSx73
	kT6jnvP47Y/rmDNAV+j42DHTFACLaLndZsP6jc/d/92xIj1902u47NmI4DHiSLhkCuR1IhMj9Yv3V
	o8+TME4wxCv49MkcSAHkPsAkqZ/akEjLuZIKX2N8E9k/r8wlsNQjX/T6JstXLsMQfHXVoftxf5+EP
	xUwOYow8IKkG4guWo34RyopJLROZv9kateLdbU2sjc2NFxqApY8SdR+MnLnpxCy5d5TvP8yHDO1Bj
	dtXdmd6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mntkm-009H2B-QP; Fri, 19 Nov 2021 02:35:52 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mntkj-009H0k-8z
 for linux-riscv@lists.infradead.org; Fri, 19 Nov 2021 02:35:51 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HwLLl0VkpzZd7H;
 Fri, 19 Nov 2021 10:33:19 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 19 Nov 2021 10:35:44 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Fri, 19 Nov 2021 10:35:42 +0800
Subject: Re: [PATCH 09/12] riscv: extable: add `type` and `data` fields
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, "Song
 Liu" <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, "Nick
 Desaulniers" <ndesaulniers@google.com>
References: <20211118192130.48b8f04c@xhacker> <20211118192605.57e06d6b@xhacker>
CC: Kefeng Wang <wangkefeng.wang@huawei.com>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
From: tongtiangen <tongtiangen@huawei.com>
Message-ID: <7c1b31cf-eb0b-02ad-f672-95d69055928a@huawei.com>
Date: Fri, 19 Nov 2021 10:35:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20211118192605.57e06d6b@xhacker>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_183549_754678_6F578146 
X-CRM114-Status: GOOD (  23.47  )
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



On 2021/11/18 19:26, Jisheng Zhang wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> This is a riscv port of commit d6e2cc564775("arm64: extable: add `type`
> and `data` fields").
>
> We will add specialized handlers for fixups, the `type` field is for
> fixup handler type, the `data` field is used to pass specific data to
> each handler, for example register numbers.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/asm-extable.h | 25 +++++++++++++++++--------
>  arch/riscv/include/asm/extable.h     | 17 ++++++++++++++---
>  arch/riscv/kernel/vmlinux.lds.S      |  2 +-
>  arch/riscv/mm/extable.c              | 25 +++++++++++++++++++++----
>  arch/riscv/net/bpf_jit_comp64.c      |  5 +++--
>  scripts/sorttable.c                  |  4 +++-
>  6 files changed, 59 insertions(+), 19 deletions(-)
>
> diff --git a/arch/riscv/include/asm/asm-extable.h b/arch/riscv/include/asm/asm-extable.h
> index b790c02dbdda..1b1f4ffd8d37 100644
> --- a/arch/riscv/include/asm/asm-extable.h
> +++ b/arch/riscv/include/asm/asm-extable.h
> @@ -2,31 +2,40 @@
>  #ifndef __ASM_ASM_EXTABLE_H
>  #define __ASM_ASM_EXTABLE_H
>
> +#define EX_TYPE_NONE			0
> +#define EX_TYPE_FIXUP			1
> +#define EX_TYPE_BPF			2
> +
>  #ifdef __ASSEMBLY__
>
> -#define __ASM_EXTABLE_RAW(insn, fixup)		\
> -	.pushsection	__ex_table, "a";	\
> -	.balign		4;			\
> -	.long		((insn) - .);		\
> -	.long		((fixup) - .);		\
> +#define __ASM_EXTABLE_RAW(insn, fixup, type, data)	\
> +	.pushsection	__ex_table, "a";		\
> +	.balign		4;				\
> +	.long		((insn) - .);			\
> +	.long		((fixup) - .);			\
> +	.short		(type);				\
> +	.short		(data);				\
>  	.popsection;
>
>  	.macro		_asm_extable, insn, fixup
> -	__ASM_EXTABLE_RAW(\insn, \fixup)
> +	__ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_FIXUP, 0)
>  	.endm
>
>  #else /* __ASSEMBLY__ */
>
>  #include <linux/stringify.h>
>
> -#define __ASM_EXTABLE_RAW(insn, fixup)			\
> +#define __ASM_EXTABLE_RAW(insn, fixup, type, data)	\
>  	".pushsection	__ex_table, \"a\"\n"		\
>  	".balign	4\n"				\
>  	".long		((" insn ") - .)\n"		\
>  	".long		((" fixup ") - .)\n"		\
> +	".short		(" type ")\n"			\
> +	".short		(" data ")\n"			\
>  	".popsection\n"
>
> -#define _ASM_EXTABLE(insn, fixup) __ASM_EXTABLE_RAW(#insn, #fixup)
> +#define _ASM_EXTABLE(insn, fixup)	\
> +	__ASM_EXTABLE_RAW(#insn, #fixup, __stringify(EX_TYPE_FIXUP), "0")
>
>  #endif /* __ASSEMBLY__ */
>
> diff --git a/arch/riscv/include/asm/extable.h b/arch/riscv/include/asm/extable.h
> index e4374dde02b4..512012d193dc 100644
> --- a/arch/riscv/include/asm/extable.h
> +++ b/arch/riscv/include/asm/extable.h
> @@ -17,18 +17,29 @@
>
>  struct exception_table_entry {
>  	int insn, fixup;
> +	short type, data;
>  };
>
>  #define ARCH_HAS_RELATIVE_EXTABLE
>
> +#define swap_ex_entry_fixup(a, b, tmp, delta)		\
> +do {							\
> +	(a)->fixup = (b)->fixup + (delta);		\
> +	(b)->fixup = (tmp).fixup - (delta);		\
> +	(a)->type = (b)->type;				\
> +	(b)->type = (tmp).type;				\
> +	(a)->data = (b)->data;				\
> +	(b)->data = (tmp).data;				\
> +} while (0)
> +
>  bool fixup_exception(struct pt_regs *regs);
>
>  #if defined(CONFIG_BPF_JIT) && defined(CONFIG_ARCH_RV64I)
> -bool rv_bpf_fixup_exception(const struct exception_table_entry *ex, struct pt_regs *regs);
> +bool ex_handler_bpf(const struct exception_table_entry *ex, struct pt_regs *regs);
>  #else
>  static inline bool
> -rv_bpf_fixup_exception(const struct exception_table_entry *ex,
> -		       struct pt_regs *regs)
> +ex_handler_bpf(const struct exception_table_entry *ex,
> +	       struct pt_regs *regs)
>  {
>  	return false;
>  }
> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> index 5104f3a871e3..0e5ae851929e 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -4,7 +4,7 @@
>   * Copyright (C) 2017 SiFive
>   */
>
> -#define RO_EXCEPTION_TABLE_ALIGN	16
> +#define RO_EXCEPTION_TABLE_ALIGN	4
>
>  #ifdef CONFIG_XIP_KERNEL
>  #include "vmlinux-xip.lds.S"
> diff --git a/arch/riscv/mm/extable.c b/arch/riscv/mm/extable.c
> index 3c561f1d0115..91e52c4bb33a 100644
> --- a/arch/riscv/mm/extable.c
> +++ b/arch/riscv/mm/extable.c
> @@ -10,6 +10,20 @@
>  #include <linux/extable.h>
>  #include <linux/module.h>
>  #include <linux/uaccess.h>
> +#include <asm/asm-extable.h>
> +
> +static inline unsigned long
> +get_ex_fixup(const struct exception_table_entry *ex)
> +{
> +	return ((unsigned long)&ex->fixup + ex->fixup);
> +}
> +
> +static bool ex_handler_fixup(const struct exception_table_entry *ex,
> +			     struct pt_regs *regs)
> +{
> +	regs->epc = get_ex_fixup(ex);
> +	return true;
> +}
>
>  bool fixup_exception(struct pt_regs *regs)
>  {
> @@ -19,9 +33,12 @@ bool fixup_exception(struct pt_regs *regs)
>  	if (!ex)
>  		return false;
>
> -	if (regs->epc >= BPF_JIT_REGION_START && regs->epc < BPF_JIT_REGION_END)
> -		return rv_bpf_fixup_exception(ex, regs);
> +	switch (ex->type) {
> +	case EX_TYPE_FIXUP:
> +		return ex_handler_fixup(ex, regs);
> +	case EX_TYPE_BPF:
> +		return ex_handler_bpf(ex, regs);
> +	}
>
> -	regs->epc = (unsigned long)&ex->fixup + ex->fixup;
> -	return true;
> +	BUG();
>  }
> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index 7714081cbb64..69bab7e28f91 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c
> @@ -459,8 +459,8 @@ static int emit_call(bool fixed, u64 addr, struct rv_jit_context *ctx)
>  #define BPF_FIXUP_OFFSET_MASK   GENMASK(26, 0)
>  #define BPF_FIXUP_REG_MASK      GENMASK(31, 27)
>
> -bool rv_bpf_fixup_exception(const struct exception_table_entry *ex,
> -			    struct pt_regs *regs)
> +bool ex_handler_bpf(const struct exception_table_entry *ex,
> +		    struct pt_regs *regs)
>  {
>  	off_t offset = FIELD_GET(BPF_FIXUP_OFFSET_MASK, ex->fixup);
>  	int regs_offset = FIELD_GET(BPF_FIXUP_REG_MASK, ex->fixup);
> @@ -514,6 +514,7 @@ static int add_exception_handler(const struct bpf_insn *insn,
>
>  	ex->fixup = FIELD_PREP(BPF_FIXUP_OFFSET_MASK, offset) |
>  		FIELD_PREP(BPF_FIXUP_REG_MASK, dst_reg);
> +	ex->type = EX_TYPE_BPF;

looks good to me.

Reviewed-by:Tong Tiangen <tongtiangen@huawei.com>

>
>  	ctx->nexentries++;
>  	return 0;
> diff --git a/scripts/sorttable.c b/scripts/sorttable.c
> index 0c031e47a419..5b5472b543f5 100644
> --- a/scripts/sorttable.c
> +++ b/scripts/sorttable.c
> @@ -376,9 +376,11 @@ static int do_file(char const *const fname, void *addr)
>  	case EM_PARISC:
>  	case EM_PPC:
>  	case EM_PPC64:
> -	case EM_RISCV:
>  		custom_sort = sort_relative_table;
>  		break;
> +	case EM_RISCV:
> +		custom_sort = arm64_sort_relative_table;
> +		break;
>  	case EM_ARCOMPACT:
>  	case EM_ARCV2:
>  	case EM_ARM:
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
