Return-Path: <SRS0=Kh2H=QF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3464CC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 11:35:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1A0B61B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 11:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1A0B61B7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GSVmysBak6EeBPzdRpsKltYPJATZy4k7EkY86OdvMpw=; b=yv/jcTAxi44SJf
	nq1MOcVmDG9ut82W766wrBV5AbFmZv5HuH9jsAYCB1prRkuhPMu8INEscX1SB6YL7W4sLqm7xJ92H
	tNcogiR43pL4aTEvOke8CFn7aDyxwEWDQT++lY/+ZNIXXygIkmrojlHLY+aCPoyvY76qMtxpJ+8hI
	VEzq6Hs/jcQpkBb3ZH9BKYJAMuHflKXc8pz1L/0TMjvE9UusIATjHJQ7xToCxRBcHOmNaWFiX/wAn
	O4Hr5K9okE+KoldDCSNv0KYeKE4+B7cyT6ujdfEWsMZTbB9EXbYip+MjrcV0lY9h4IMZit/jtDwK+
	PYM1OSz2JdrQuJrnMiQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnfh9-007bTw-Gq; Thu, 18 Nov 2021 11:35:11 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnfh2-007bRO-3K
 for linux-riscv@lists.infradead.org; Thu, 18 Nov 2021 11:35:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=MImYhdH7KtmtmyNxgxMYJv9ChC/U1LJ+nA
 F+ThMzzTs=; b=n1GqrCTk3CkgO6L1OgzelvSCXh7SJgeUdXDFMvaERgQdMUohGK
 ykyJ/f8D+L+F8ujbZwYqht/dH9hCAR/RBlTvuoGTGjCFCtymoOHJ10MiuPbm5TIR
 z+4+gk//4bcXcZsAGi7w2bb4NZplSB4a9FDoNTqB7cRChkUV7vnx+/HsQ=
Received: from xhacker (unknown [101.86.18.22])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygAHD99XOpZhwZ1cAQ--.27562S4; 
 Thu, 18 Nov 2021 19:34:51 +0800 (CST)
Date: Thu, 18 Nov 2021 19:22:27 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "=?UTF-8?B?Qmo=?=
 =?UTF-8?B?w7ZybiBUw7ZwZWw=?=" <bjorn@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu
 <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nick
 Desaulniers <ndesaulniers@google.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Tong Tiangen
 <tongtiangen@huawei.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-kbuild@vger.kernel.org
Subject: [PATCH 02/12] riscv: consolidate __ex_table construction
Message-ID: <20211118192227.6e03909b@xhacker>
In-Reply-To: <20211118192130.48b8f04c@xhacker>
References: <20211118192130.48b8f04c@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygAHD99XOpZhwZ1cAQ--.27562S4
X-Coremail-Antispam: 1UD129KBjvJXoWxury3tF4DZw4kKF1xJrW7XFb_yoW5urWDpw
 sFkrZ3KrZ8KF1xCFn7tFs7ur40ga1DGwnIy3sxWryv9r4qy3W0kF4vkr97W3ykJa13ZFyI
 gw18Krn5Jr4I9rUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBmb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
 8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
 64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
 CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
 6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
 02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
 4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82
 IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
 0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMI
 IF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l
 IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUzDGOUUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_033504_850169_77878CC7 
X-CRM114-Status: UNSURE (   6.99  )
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

From: Jisheng Zhang <jszhang@kernel.org>

Consolidate all the __ex_table constuction code with a _ASM_EXTABLE
helper.

There should be no functional change as a result of this patch.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/include/asm/futex.h   | 12 +++---------
 arch/riscv/include/asm/uaccess.h | 30 ++++++++++++------------------
 2 files changed, 15 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
index 1b00badb9f87..3191574e135c 100644
--- a/arch/riscv/include/asm/futex.h
+++ b/arch/riscv/include/asm/futex.h
@@ -30,10 +30,7 @@
 	"3:	li %[r],%[e]				\n"	\
 	"	jump 2b,%[t]				\n"	\
 	"	.previous				\n"	\
-	"	.section __ex_table,\"a\"		\n"	\
-	"	.balign " RISCV_SZPTR "			\n"	\
-	"	" RISCV_PTR " 1b, 3b			\n"	\
-	"	.previous				\n"	\
+		_ASM_EXTABLE(1b, 3b)				\
 	: [r] "+r" (ret), [ov] "=&r" (oldval),			\
 	  [u] "+m" (*uaddr), [t] "=&r" (tmp)			\
 	: [op] "Jr" (oparg), [e] "i" (-EFAULT)			\
@@ -103,11 +100,8 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 	"4:	li %[r],%[e]				\n"
 	"	jump 3b,%[t]				\n"
 	"	.previous				\n"
-	"	.section __ex_table,\"a\"		\n"
-	"	.balign " RISCV_SZPTR "			\n"
-	"	" RISCV_PTR " 1b, 4b			\n"
-	"	" RISCV_PTR " 2b, 4b			\n"
-	"	.previous				\n"
+		_ASM_EXTABLE(1b, 4b)			\
+		_ASM_EXTABLE(2b, 4b)			\
 	: [r] "+r" (ret), [v] "=&r" (val), [u] "+m" (*uaddr), [t] "=&r" (tmp)
 	: [ov] "Jr" (oldval), [nv] "Jr" (newval), [e] "i" (-EFAULT)
 	: "memory");
diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 9f9219545e59..714cd311d9f1 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -10,6 +10,12 @@
 
 #include <asm/pgtable.h>		/* for TASK_SIZE */
 
+#define _ASM_EXTABLE(from, to)						\
+	"	.pushsection	__ex_table, \"a\"\n"			\
+	"	.balign "	RISCV_SZPTR "	 \n"			\
+	"	" RISCV_PTR	"(" #from "), (" #to ")\n"		\
+	"	.popsection\n"
+
 /*
  * User space memory access functions
  */
@@ -93,10 +99,7 @@ do {								\
 		"	li %1, 0\n"				\
 		"	jump 2b, %2\n"				\
 		"	.previous\n"				\
-		"	.section __ex_table,\"a\"\n"		\
-		"	.balign " RISCV_SZPTR "\n"			\
-		"	" RISCV_PTR " 1b, 3b\n"			\
-		"	.previous"				\
+			_ASM_EXTABLE(1b, 3b)			\
 		: "+r" (err), "=&r" (__x), "=r" (__tmp)		\
 		: "m" (*(ptr)), "i" (-EFAULT));			\
 	(x) = __x;						\
@@ -125,11 +128,8 @@ do {								\
 		"	li %2, 0\n"				\
 		"	jump 3b, %3\n"				\
 		"	.previous\n"				\
-		"	.section __ex_table,\"a\"\n"		\
-		"	.balign " RISCV_SZPTR "\n"			\
-		"	" RISCV_PTR " 1b, 4b\n"			\
-		"	" RISCV_PTR " 2b, 4b\n"			\
-		"	.previous"				\
+			_ASM_EXTABLE(1b, 4b)			\
+			_ASM_EXTABLE(2b, 4b)			\
 		: "+r" (err), "=&r" (__lo), "=r" (__hi),	\
 			"=r" (__tmp)				\
 		: "m" (__ptr[__LSW]), "m" (__ptr[__MSW]),	\
@@ -233,10 +233,7 @@ do {								\
 		"	li %0, %4\n"				\
 		"	jump 2b, %1\n"				\
 		"	.previous\n"				\
-		"	.section __ex_table,\"a\"\n"		\
-		"	.balign " RISCV_SZPTR "\n"			\
-		"	" RISCV_PTR " 1b, 3b\n"			\
-		"	.previous"				\
+			_ASM_EXTABLE(1b, 3b)			\
 		: "+r" (err), "=r" (__tmp), "=m" (*(ptr))	\
 		: "rJ" (__x), "i" (-EFAULT));			\
 } while (0)
@@ -262,11 +259,8 @@ do {								\
 		"	li %0, %6\n"				\
 		"	jump 3b, %1\n"				\
 		"	.previous\n"				\
-		"	.section __ex_table,\"a\"\n"		\
-		"	.balign " RISCV_SZPTR "\n"			\
-		"	" RISCV_PTR " 1b, 4b\n"			\
-		"	" RISCV_PTR " 2b, 4b\n"			\
-		"	.previous"				\
+			_ASM_EXTABLE(1b, 4b)			\
+			_ASM_EXTABLE(2b, 4b)			\
 		: "+r" (err), "=r" (__tmp),			\
 			"=m" (__ptr[__LSW]),			\
 			"=m" (__ptr[__MSW])			\
-- 
2.33.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
