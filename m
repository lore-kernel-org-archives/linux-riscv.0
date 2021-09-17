Return-Path: <SRS0=snBs=OH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E1CC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Sep 2021 16:33:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D7AF61019
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Sep 2021 16:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D7AF61019
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X3J7HhqOOQQ6VMpjSsfXwY0i4MKYsR4+61J6ioDxaJg=; b=jIcjkKgIzA9/1X
	lg4KZT7k22KpSC+L/RcJF+3d5in4ibWUYVdBwocwpFBPz5FSSCshk/Y7RVLGBB9lOnGCNP5tvcLl1
	y1Iqc0xZjuLcvB0MW6FQRQs9T5PmZEkIzyRYEAhXb3MlIpq2GXZypmDW/X2X7Xdvrr5nEp8ZE+do/
	2f0bsh6fIjTQkaAnQY0YEEirqiZguf+fB61LHgl594jOfGOtE93kWvN8frqFWj9yXu16ju1zx0q/1
	1UtStQtmJ8DM58h0NN3yXw/+kpmpmngeQYAe69Nu9RJ5+YcrzHdlhpZZq3W0jJx8JF1TLbq9PwDYR
	hMo2fvEhUFC2HBQOOGiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRGnB-00EeHj-Q7; Fri, 17 Sep 2021 16:32:49 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRGn6-00EeGQ-PJ
 for linux-riscv@lists.infradead.org; Fri, 17 Sep 2021 16:32:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=tDUhIAD5P4K9p8e167+0xfXMU/cH2/TTxN
 cn9gRmcs4=; b=Tkudjrz3/Q0Z7ZMKzoOKguCICK5MPvblaPmEw8rRQ2ryfpyZhj
 bOiblXTUQ5ULCajNWHiA2r5cV1myAqvdHtEK9tkI7P0vULgc3iSW2/WzgWifiqtz
 pHELGxuNMXrkoD9pjzJBAdYo9GPGbXGXPIJ7bF2wmfcg6c7jb9qbYKzTs=
Received: from xhacker (unknown [101.86.20.138])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygBXW4ciw0RhxQASAA--.3082S2; 
 Sat, 18 Sep 2021 00:32:34 +0800 (CST)
Date: Sat, 18 Sep 2021 00:26:03 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [Request for help] issue when add relative extable support to
 riscv64
Message-ID: <20210918002603.58c5a030@xhacker>
In-Reply-To: <20210917235733.6240d6d3@xhacker>
References: <20210917235733.6240d6d3@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygBXW4ciw0RhxQASAA--.3082S2
X-Coremail-Antispam: 1UD129KBjvJXoW3trW5Gr1DWw1fJw1UCryfWFg_yoWDZw4Dpr
 4qk397KFW3KFykAwnFqayUWF48ta1Duw1a93s5WrWqgrWjvFy8trn5K34kXrWDJa13ZF92
 kw18Kr18Ar40vrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyIb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s02
 6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
 I_JrWlx4CE17CEb7AF67AKxVWUJVWUXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
 6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
 0_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWU
 JVW8JbIYCTnIWIevJa73UjIFyTuYvjxUcVWlDUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_093245_737696_B8EAAF50 
X-CRM114-Status: GOOD (  22.61  )
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
> 
> Thanks
> 

sorry, I missed two files, the completed patch is here:

diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index 445ccc97305a..57b86fd9916c 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 generic-y += early_ioremap.h
-generic-y += extable.h
 generic-y += flat.h
 generic-y += kvm_para.h
 generic-y += user.h
diff --git a/arch/riscv/include/asm/extable.h b/arch/riscv/include/asm/extable.h
new file mode 100644
index 000000000000..3a055c7d6a5b
--- /dev/null
+++ b/arch/riscv/include/asm/extable.h
@@ -0,0 +1,12 @@
+#ifndef __ASM_EXTABLE_H
+#define __ASM_EXTABLE_H
+
+struct exception_table_entry
+{
+	int insn, fixup;
+};
+
+#define ARCH_HAS_RELATIVE_EXTABLE
+
+extern int fixup_exception(struct pt_regs *regs);
+#endif
diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
index 1b00badb9f87..b220b8387c9d 100644
--- a/arch/riscv/include/asm/futex.h
+++ b/arch/riscv/include/asm/futex.h
@@ -31,8 +31,8 @@
 	"	jump 2b,%[t]				\n"	\
 	"	.previous				\n"	\
 	"	.section __ex_table,\"a\"		\n"	\
-	"	.balign " RISCV_SZPTR "			\n"	\
-	"	" RISCV_PTR " 1b, 3b			\n"	\
+	"	.balign 4			\n"	\
+	"	.word (1b-.), (3b-.)			\n"	\
 	"	.previous				\n"	\
 	: [r] "+r" (ret), [ov] "=&r" (oldval),			\
 	  [u] "+m" (*uaddr), [t] "=&r" (tmp)			\
@@ -104,9 +104,9 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 	"	jump 3b,%[t]				\n"
 	"	.previous				\n"
 	"	.section __ex_table,\"a\"		\n"
-	"	.balign " RISCV_SZPTR "			\n"
-	"	" RISCV_PTR " 1b, 4b			\n"
-	"	" RISCV_PTR " 2b, 4b			\n"
+	"	.balign 4 			\n"
+	"	.word (1b-.), (4b-.)			\n"
+	"	.word (2b-.), (4b-.)			\n"
 	"	.previous				\n"
 	: [r] "+r" (ret), [v] "=&r" (val), [u] "+m" (*uaddr), [t] "=&r" (tmp)
 	: [ov] "Jr" (oldval), [nv] "Jr" (newval), [e] "i" (-EFAULT)
diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index f314ff44c48d..097ed3df9b17 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -94,8 +94,8 @@ do {								\
 		"	jump 2b, %2\n"				\
 		"	.previous\n"				\
 		"	.section __ex_table,\"a\"\n"		\
-		"	.balign " RISCV_SZPTR "\n"			\
-		"	" RISCV_PTR " 1b, 3b\n"			\
+		"	.balign 4 \n"			\
+		"	.word (1b - .), (3b - .)\n"			\
 		"	.previous"				\
 		: "+r" (err), "=&r" (__x), "=r" (__tmp)		\
 		: "m" (*(ptr)), "i" (-EFAULT));			\
@@ -126,9 +126,9 @@ do {								\
 		"	jump 3b, %3\n"				\
 		"	.previous\n"				\
 		"	.section __ex_table,\"a\"\n"		\
-		"	.balign " RISCV_SZPTR "\n"			\
-		"	" RISCV_PTR " 1b, 4b\n"			\
-		"	" RISCV_PTR " 2b, 4b\n"			\
+		"	.balign 4 \n"			\
+		"	.word (1b - .), (4b - .)\n"			\
+		"	.word (2b - .), (4b - .)\n"			\
 		"	.previous"				\
 		: "+r" (err), "=&r" (__lo), "=r" (__hi),	\
 			"=r" (__tmp)				\
@@ -234,8 +234,8 @@ do {								\
 		"	jump 2b, %1\n"				\
 		"	.previous\n"				\
 		"	.section __ex_table,\"a\"\n"		\
-		"	.balign " RISCV_SZPTR "\n"			\
-		"	" RISCV_PTR " 1b, 3b\n"			\
+		"	.balign 4 \n"			\
+		"	.word (1b - .), (3b - .)\n"			\
 		"	.previous"				\
 		: "+r" (err), "=r" (__tmp), "=m" (*(ptr))	\
 		: "rJ" (__x), "i" (-EFAULT));			\
@@ -263,9 +263,9 @@ do {								\
 		"	jump 3b, %1\n"				\
 		"	.previous\n"				\
 		"	.section __ex_table,\"a\"\n"		\
-		"	.balign " RISCV_SZPTR "\n"			\
-		"	" RISCV_PTR " 1b, 4b\n"			\
-		"	" RISCV_PTR " 2b, 4b\n"			\
+		"	.balign 4 \n"			\
+		"	.word (1b - .), (4b - .)\n"			\
+		"	.word (2b - .), (4b - .)\n"			\
 		"	.previous"				\
 		: "+r" (err), "=r" (__tmp),			\
 			"=m" (__ptr[__LSW]),			\
@@ -418,8 +418,8 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
 		"	jump 1b, %[rc]\n"			\
 		".previous\n"					\
 		".section __ex_table,\"a\"\n"			\
-		".balign " RISCV_SZPTR "\n"			\
-		"	" RISCV_PTR " 1b, 2b\n"			\
+		".balign 4 \n"			\
+		".word (1b-.), (2b-.)\n"			\
 		".previous\n"					\
 			: [ret] "=&r" (__ret),			\
 			  [rc]  "=&r" (__rc),			\
@@ -444,8 +444,8 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
 		"	jump 1b, %[rc]\n"			\
 		".previous\n"					\
 		".section __ex_table,\"a\"\n"			\
-		".balign " RISCV_SZPTR "\n"			\
-		"	" RISCV_PTR " 1b, 2b\n"			\
+		".balign 4 \n"			\
+		".word (1b-.), (2b-.)\n"			\
 		".previous\n"					\
 			: [ret] "=&r" (__ret),			\
 			  [rc]  "=&r" (__rc),			\
diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 63bc691cff91..b346ecb2a051 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -7,8 +7,8 @@
 100:
 	\op \reg, \addr
 	.section __ex_table,"a"
-	.balign RISCV_SZPTR
-	RISCV_PTR 100b, \lbl
+	.balign 4
+	.word (100b - .), (\lbl - .)
 	.previous
 	.endm
 
diff --git a/arch/riscv/mm/extable.c b/arch/riscv/mm/extable.c
index 2fc729422151..6aa8ffac4be7 100644
--- a/arch/riscv/mm/extable.c
+++ b/arch/riscv/mm/extable.c
@@ -17,7 +17,7 @@ int fixup_exception(struct pt_regs *regs)
 
 	fixup = search_exception_tables(regs->epc);
 	if (fixup) {
-		regs->epc = fixup->fixup;
+		regs->epc = (unsigned long)&fixup->fixup + fixup->fixup;
 		return 1;
 	}
 	return 0;
diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index f355869c65cd..7c5f6a361946 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -342,6 +342,7 @@ static int do_file(char const *const fname, void *addr)
 	case EM_PARISC:
 	case EM_PPC:
 	case EM_PPC64:
+	case EM_RISCV:
 		custom_sort = sort_relative_table;
 		break;
 	case EM_ARCOMPACT:
@@ -349,7 +350,6 @@ static int do_file(char const *const fname, void *addr)
 	case EM_ARM:
 	case EM_MICROBLAZE:
 	case EM_MIPS:
-	case EM_RISCV:
 	case EM_XTENSA:
 		break;
 	default:


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
