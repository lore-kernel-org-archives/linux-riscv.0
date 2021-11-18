Return-Path: <SRS0=Kh2H=QF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2C7C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 11:50:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE44F61108
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 11:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE44F61108
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8oB2y/XWI3oCl8mcnAl8a+MNoIO3zh4d127SVzb5/Ho=; b=svSaR8li9pyUzH
	QE8mJuWZT6NdWtMEJFXMJOuHLR51hY5J+td85NCRDRWQgErO0d7E15Ta0BZE2YA1No/fvRIC74J0m
	qeJ8P5q5VCWKnvUXQLVppKq2Osx6qNslVzySAZkiVheYUvsuNuPSKBJt9pkClNi2otYzTnzbYxkKo
	dmNGj5CV+wd/IuXWhGTXRLP36OcqtiRxt2ShIyNKQKqIVfa8ccmU32IbQFZ6x5weYFK3n7Ebr+vjQ
	S/w2Lcf6uFLP77t+TTTy2y8U5TGA89DN3wRqyD+KrH6Zqy/X6p8/x9mHUnt9rzrp7xAvVQ7C0Bqs3
	o45G0L6yA+Uqo/5MhoTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnfwB-007eRY-D8; Thu, 18 Nov 2021 11:50:43 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnfw7-007eQJ-BX
 for linux-riscv@lists.infradead.org; Thu, 18 Nov 2021 11:50:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=29okKHkwWZdYLH+Lmyg8jemUfOuDaKwn09
 zuL8mkGrM=; b=nFe9Aq6aa3PqwL1Rpsg4fOZa2GGCFTlVbWH26JIwJQY7JIOLdW
 UwjxqdXd09arVlrwve3z+XSs1BP6V2FkalpIDoJtms3fpYa+lV2EY5ozid6LKN/r
 hOZMJly5SntprlFWqIyLp6YikcyyXyCew7apINFLkNe3Z2kqlQ5xIthBs=
Received: from xhacker (unknown [101.86.18.22])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygCX6d3fPZZhyLJcAQ--.27212S2; 
 Thu, 18 Nov 2021 19:49:52 +0800 (CST)
Date: Thu, 18 Nov 2021 19:42:49 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "=?UTF-8?B?Qmo=?=
 =?UTF-8?B?w7ZybiBUw7ZwZWw=?=" <bjorn@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek
 <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Tong Tiangen
 <tongtiangen@huawei.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 09/12] riscv: extable: add `type` and `data` fields
Message-ID: <20211118193332.79799a9c@xhacker>
In-Reply-To: <20211118192605.57e06d6b@xhacker>
References: <20211118192130.48b8f04c@xhacker> <20211118192605.57e06d6b@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygCX6d3fPZZhyLJcAQ--.27212S2
X-Coremail-Antispam: 1UD129KBjvJXoW3AFy3Aw4rury7WFy3CrWxZwb_yoWxZw4DpF
 s0kF93KrWFgrn7u3W3tF1qgr1Ygr40g34Fkr4S9a45ta12yFyrKr1rK343tr1qvFy8WFy8
 C3WS9ry5Cw4fArDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkGb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
 MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
 0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0E
 wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
 WxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
 IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07je7KsUUU
 UU=
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_035040_094623_88A6ED72 
X-CRM114-Status: GOOD (  25.45  )
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

On Thu, 18 Nov 2021 19:26:05 +0800 Jisheng Zhang wrote:

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

Hi Mark, Thomas,

x86 and arm64 version of sort_relative_table routine are the same, I want to
unify them, and then use the common function for riscv, but I'm not sure
which name is better. Could you please suggest?

Thanks	

> +		break;
>  	case EM_ARCOMPACT:
>  	case EM_ARCV2:
>  	case EM_ARM:



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
