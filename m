Return-Path: <SRS0=snBs=OH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED109C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Sep 2021 16:04:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FD2C611C4
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Sep 2021 16:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FD2C611C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zYV8K5ztSmH6TucHVxyETHAQ4nWmr3nsYiYJ/7zDiLI=; b=Ja8Q6QHGA0mZek
	kpeDvjSRU862xB14vo8/GXW+qUpMGPHcdLZ1nSSxe0Yuq7T+BUbSn2sOwkjVyZxezF8Pf+EWYCMy/
	b6YvI8OMPquc449i5pJ7wlV235U6+rKtOPAah+32hsinFAXumv+/RJ2PwKjeHeHliAfY/nWh6iwfW
	K61mWsb/TRfMH+pI3qO1rgCV9XfmMlCKe3SOYSPIYm9JQQsFypHfYmsWMeLgzInSfd7Ut/sTFloXq
	D6difZutCi0uR/GoTlZzctE5Vfyvfa4InmtC80vVxMbe+kkdNGnPdn4IzKBBh6BI3gBpCGAI26EUL
	ycr2CqC3XG4l1UWs3/zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRGLV-00EbMJ-4u; Fri, 17 Sep 2021 16:04:13 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRGLR-00EbLl-8K
 for linux-riscv@lists.infradead.org; Fri, 17 Sep 2021 16:04:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=mzr2rinTxx2pXFg1xOAwYlWRIrPOR1oHBjJ1w47nQ5k=; b=OaZuR2e0/G5hd
 lHFXED/3F1NJMEtoMS5+uMQKsj7kaZ/El/7uS3LdMe5cDK9Y9Q/sf1RgF+WZM0jr
 mGhaBF566XSdZb1yDFM1ML83KTXHSIZkp5y0Mr9z+HaCGi3at+BQH/DYTdkXa5P1
 fh5/Agn1TD4kqEURDyKH10zvRHYnQM=
Received: from xhacker (unknown [101.86.20.138])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygAXHrpwvERhMOERAA--.337S2; 
 Sat, 18 Sep 2021 00:04:01 +0800 (CST)
Date: Fri, 17 Sep 2021 23:57:33 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: linux-riscv <linux-riscv@lists.infradead.org>
Subject: [Request for help] issue when add relative extable support to riscv64
Message-ID: <20210917235733.6240d6d3@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygAXHrpwvERhMOERAA--.337S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXrWDXFWxGrWUtFy8Zw43Jrb_yoWrKFyfpr
 4qkrZ7KFZ0kF18Aw12qayUuF4vga1DWwnI93s8WrWqgr4jvFy8Jrs5Ka4kZrWDJa17Z3Z2
 9w18Kr1rAr40vrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyFb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E
 4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
 WUWwC2zVAF1VAY17CE14v26r1j6r15MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
 Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rV
 WrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_
 GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8v_M3UUUUU==
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_090410_009098_A7D3FAE2 
X-CRM114-Status: UNSURE (   7.03  )
X-CRM114-Notice: Please train this message.
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

Hi,

Now the extable entry contains 16bytes for riscv64 -- 8bytes for the insn and
another 8bytes for the fixup. This wastes mem a bit. I think we can add
the relative extable support. A draft patch put at the end of this mail. But
I met abnormal build errors:

FATAL: modpost: The relocation at __ex_table+0x0 references
section "__ex_table" which is not executable, IOW
it is not possible for the kernel to fault
at that address.  Something is seriously wrong
and should be fixed.

I investigated this issue but didn't find any clue. Any suggestion
is appreciated!

Thanks

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


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
