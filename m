Return-Path: <SRS0=WJg2=O6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55326C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Oct 2021 16:04:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E02A160E76
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Oct 2021 16:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E02A160E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/BQHS52mkCLxmIv6c4M/3z7HbhuhHPVNuzSb1v50zQI=; b=iNZv0i8spHRL6b
	Mz++gLgGH3dn3GcrHRwX2R7D/g3GAIYAF9hwPbRzzC/BEAgnNRQ+59dfwDMlJrcems6RobGNLr29N
	hdadTnC1jHWRHrvJ/SDHBIlVe/FmyEC8TCts4hUc29/b2ESRfCcPiMf2s4jZCDly6ZSFDH+doI2JU
	zGMgMm+LYSgdk7zoYxawIRSaY+FZLJlLaPRO4Dhv+9K5GRSaKMUQlN3CqA9RdooRniPiJRb6YQ0K8
	5UoQ+G458BxS9XYWGGQQcfXFcHSzt9n5RdPKFnw5rOK6zcDrlS/pVakG2LAMprEw2zbfNd/Zkxmvc
	ZsY+0R+f8K+hcv0tiiWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZbIz-0078LM-AJ; Sun, 10 Oct 2021 16:04:05 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZbIv-0078JL-6X
 for linux-riscv@lists.infradead.org; Sun, 10 Oct 2021 16:04:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=7Xs0fb9L30/DAAcflT7Dwi9V5jyN51Ujy3
 ADt4o569M=; b=KD1kjEuTzGzI/sclVZ22k71tvoY8S7PZeiSLXER8nLmish4KEX
 GbhAO9sRDjXIYxYPTAdMl23qp2UYvgS6jWsZuPoUlJUHGsnqfCRXHtJ3Owyt9coX
 tOWDeOTzgoFsrOZU4TC3YnUaNxr+fcXPWCgk71s14BXLO5dqP1Yehpm+Q=
Received: from xhacker (unknown [101.86.20.138])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygCH2d3dDmNhLjkUAA--.18068S2; 
 Mon, 11 Oct 2021 00:03:44 +0800 (CST)
Date: Sun, 10 Oct 2021 23:56:55 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [Request for help] issue when add relative extable support to
 riscv64
Message-ID: <20211010235655.35c55e61@xhacker>
In-Reply-To: <20210917235733.6240d6d3@xhacker>
References: <20210917235733.6240d6d3@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygCH2d3dDmNhLjkUAA--.18068S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WrW3Jry5AFWfGrWkJr1UWrg_yoW7Kry7pr
 4qk397KFWfGF1kGwnFgayUWF10ka1Du3Wa9r95WrWjg3yqvFy0yrn5Kas5G3yDJa13ZF1I
 kw18Kr10yr40vw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUy2b7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s02
 6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
 I_JrWlx4CE17CEb7AF67AKxVWUJVWUXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
 6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
 0_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j
 6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jOb18UUUUU=
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211010_090402_149828_04F04CFC 
X-CRM114-Status: GOOD (  20.50  )
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

On Fri, 17 Sep 2021 23:57:33 +0800 Jisheng Zhang wrote:

> Hi,
> 
> Now the extable entry contains 16bytes for riscv64 -- 8bytes for the insn and
> another 8bytes for the fixup. This wastes mem a bit. I think we can add
> the relative extable support. A draft patch put at the end of this mail. But
> I met abnormal build errors:
> 
> FATAL: modpost: The relocation at __ex_table+0x0 references
> section "__ex_table" which is not executable, IOW
> it is not possible for the kernel to fault
> at that address.  Something is seriously wrong
> and should be fixed.
> 
> I investigated this issue but didn't find any clue. Any suggestion
> is appreciated!

I think I found the root cause. 

a simple code:

	nop
1:
.section __ex_table,"a"
	.align 3
	.long (1b - .)

assemble it, then we can see that there are two entries for the above
label substraction, R_RISCV_ADD32 and R_RISCV_SUB32

Relocation section '.rela__ex_table' at offset 0x108 contains 2 entries:
  Offset          Info           Type           Sym. Value    Sym. Name + Addend
000000000000  000600000023 R_RISCV_ADD32     0000000000000002 .L1^B1 + 0
000000000000  000500000027 R_RISCV_SUB32     0000000000000000 .L0  + 0

The 2nd R_RISCV_SUB32 rela entry causes the problem.

Can we prevent assembler from emitting the R_RISCV_SUB32 rela entry? If not
We may need to patch modpost about this issue. Any suggestion is welcome.

Thanks in advance

> 
> Thanks
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
> diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
> index 1b00badb9f87..b220b8387c9d 100644
> --- a/arch/riscv/include/asm/futex.h
> +++ b/arch/riscv/include/asm/futex.h
> @@ -31,8 +31,8 @@
>  	"	jump 2b,%[t]				\n"	\
>  	"	.previous				\n"	\
>  	"	.section __ex_table,\"a\"		\n"	\
> -	"	.balign " RISCV_SZPTR "			\n"	\
> -	"	" RISCV_PTR " 1b, 3b			\n"	\
> +	"	.balign 4			\n"	\
> +	"	.word (1b-.), (3b-.)			\n"	\
>  	"	.previous				\n"	\
>  	: [r] "+r" (ret), [ov] "=&r" (oldval),			\
>  	  [u] "+m" (*uaddr), [t] "=&r" (tmp)			\
> @@ -104,9 +104,9 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
>  	"	jump 3b,%[t]				\n"
>  	"	.previous				\n"
>  	"	.section __ex_table,\"a\"		\n"
> -	"	.balign " RISCV_SZPTR "			\n"
> -	"	" RISCV_PTR " 1b, 4b			\n"
> -	"	" RISCV_PTR " 2b, 4b			\n"
> +	"	.balign 4 			\n"
> +	"	.word (1b-.), (4b-.)			\n"
> +	"	.word (2b-.), (4b-.)			\n"
>  	"	.previous				\n"
>  	: [r] "+r" (ret), [v] "=&r" (val), [u] "+m" (*uaddr), [t] "=&r" (tmp)
>  	: [ov] "Jr" (oldval), [nv] "Jr" (newval), [e] "i" (-EFAULT)
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index f314ff44c48d..097ed3df9b17 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -94,8 +94,8 @@ do {								\
>  		"	jump 2b, %2\n"				\
>  		"	.previous\n"				\
>  		"	.section __ex_table,\"a\"\n"		\
> -		"	.balign " RISCV_SZPTR "\n"			\
> -		"	" RISCV_PTR " 1b, 3b\n"			\
> +		"	.balign 4 \n"			\
> +		"	.word (1b - .), (3b - .)\n"			\
>  		"	.previous"				\
>  		: "+r" (err), "=&r" (__x), "=r" (__tmp)		\
>  		: "m" (*(ptr)), "i" (-EFAULT));			\
> @@ -126,9 +126,9 @@ do {								\
>  		"	jump 3b, %3\n"				\
>  		"	.previous\n"				\
>  		"	.section __ex_table,\"a\"\n"		\
> -		"	.balign " RISCV_SZPTR "\n"			\
> -		"	" RISCV_PTR " 1b, 4b\n"			\
> -		"	" RISCV_PTR " 2b, 4b\n"			\
> +		"	.balign 4 \n"			\
> +		"	.word (1b - .), (4b - .)\n"			\
> +		"	.word (2b - .), (4b - .)\n"			\
>  		"	.previous"				\
>  		: "+r" (err), "=&r" (__lo), "=r" (__hi),	\
>  			"=r" (__tmp)				\
> @@ -234,8 +234,8 @@ do {								\
>  		"	jump 2b, %1\n"				\
>  		"	.previous\n"				\
>  		"	.section __ex_table,\"a\"\n"		\
> -		"	.balign " RISCV_SZPTR "\n"			\
> -		"	" RISCV_PTR " 1b, 3b\n"			\
> +		"	.balign 4 \n"			\
> +		"	.word (1b - .), (3b - .)\n"			\
>  		"	.previous"				\
>  		: "+r" (err), "=r" (__tmp), "=m" (*(ptr))	\
>  		: "rJ" (__x), "i" (-EFAULT));			\
> @@ -263,9 +263,9 @@ do {								\
>  		"	jump 3b, %1\n"				\
>  		"	.previous\n"				\
>  		"	.section __ex_table,\"a\"\n"		\
> -		"	.balign " RISCV_SZPTR "\n"			\
> -		"	" RISCV_PTR " 1b, 4b\n"			\
> -		"	" RISCV_PTR " 2b, 4b\n"			\
> +		"	.balign 4 \n"			\
> +		"	.word (1b - .), (4b - .)\n"			\
> +		"	.word (2b - .), (4b - .)\n"			\
>  		"	.previous"				\
>  		: "+r" (err), "=r" (__tmp),			\
>  			"=m" (__ptr[__LSW]),			\
> @@ -418,8 +418,8 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
>  		"	jump 1b, %[rc]\n"			\
>  		".previous\n"					\
>  		".section __ex_table,\"a\"\n"			\
> -		".balign " RISCV_SZPTR "\n"			\
> -		"	" RISCV_PTR " 1b, 2b\n"			\
> +		".balign 4 \n"			\
> +		".word (1b-.), (2b-.)\n"			\
>  		".previous\n"					\
>  			: [ret] "=&r" (__ret),			\
>  			  [rc]  "=&r" (__rc),			\
> @@ -444,8 +444,8 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
>  		"	jump 1b, %[rc]\n"			\
>  		".previous\n"					\
>  		".section __ex_table,\"a\"\n"			\
> -		".balign " RISCV_SZPTR "\n"			\
> -		"	" RISCV_PTR " 1b, 2b\n"			\
> +		".balign 4 \n"			\
> +		".word (1b-.), (2b-.)\n"			\
>  		".previous\n"					\
>  			: [ret] "=&r" (__ret),			\
>  			  [rc]  "=&r" (__rc),			\
> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
> index 63bc691cff91..b346ecb2a051 100644
> --- a/arch/riscv/lib/uaccess.S
> +++ b/arch/riscv/lib/uaccess.S
> @@ -7,8 +7,8 @@
>  100:
>  	\op \reg, \addr
>  	.section __ex_table,"a"
> -	.balign RISCV_SZPTR
> -	RISCV_PTR 100b, \lbl
> +	.balign 4
> +	.word (100b - .), (\lbl - .)
>  	.previous
>  	.endm
>  
> diff --git a/arch/riscv/mm/extable.c b/arch/riscv/mm/extable.c
> index 2fc729422151..6aa8ffac4be7 100644
> --- a/arch/riscv/mm/extable.c
> +++ b/arch/riscv/mm/extable.c
> @@ -17,7 +17,7 @@ int fixup_exception(struct pt_regs *regs)
>  
>  	fixup = search_exception_tables(regs->epc);
>  	if (fixup) {
> -		regs->epc = fixup->fixup;
> +		regs->epc = (unsigned long)&fixup->fixup + fixup->fixup;
>  		return 1;
>  	}
>  	return 0;
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
