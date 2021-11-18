Return-Path: <SRS0=Kh2H=QF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCBEBC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 11:35:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97F6661BFA
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 11:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 97F6661BFA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GvGmXl0tgbQ3cL29cfE5Ngb9e5SGeyouG/Z+zPuOLgE=; b=LhJWjblImuDeDX
	gtY0TK1CL4vFvMo/xSd0J1c6M2zounAusumrMIUkxHcbdBeuSFpsfY01fT+lsJJRhDTL0erO/4XZC
	5K8BzHvw6C4Fx0Cdu+PHVipViEXdE2mFDo1C0MDJDOOTF1cyOPlmmrmGKci8T/1HWNdbpRKwCllNX
	fXEMUymPePJI2FiphkI02kmtJCkOzZZcqkt13sp3YYEtBK0dCEeUR8NP4mO4/TFS99GntN/4Z19UI
	MWpT3yBRtxn3eHdX0ZwuzfsAmaYSt4no1UfG8RFZwpzKFJxKYhwbSdG4pUoJuROso2wsQbZq16vQU
	qoz0qcwka5dYivpToDuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnfh7-007bTm-RK; Thu, 18 Nov 2021 11:35:09 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnfh2-007bRQ-6V
 for linux-riscv@lists.infradead.org; Thu, 18 Nov 2021 11:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=u2o84AxwU8xhUErO2FYo4Qh1EzNzUfFohy
 WOsjH5TgM=; b=FCw9PF9iQ0HmsuVEkUsMUR+WnYxOM6yTs3ro59rzdA/R+mHtGP
 Lw4wRDt7BIyWivvAH8ysLNS3XpkAcFFZ6U2JuEGmWvAXnUMbndFKRTfgiDz6bvy3
 4VUNrWxbPOyxIgM/BgISi5xuNZonEYDy4szSfYL3nKn97NPFrD6h4TWHU=
Received: from xhacker (unknown [101.86.18.22])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygAHD99XOpZhwZ1cAQ--.27562S5; 
 Thu, 18 Nov 2021 19:34:53 +0800 (CST)
Date: Thu, 18 Nov 2021 19:25:45 +0800
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
Subject: [PATCH 08/12] riscv: extable: consolidate definitions
Message-ID: <20211118192545.349f59b7@xhacker>
In-Reply-To: <20211118192130.48b8f04c@xhacker>
References: <20211118192130.48b8f04c@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygAHD99XOpZhwZ1cAQ--.27562S5
X-Coremail-Antispam: 1UD129KBjvJXoWxury3XrWrCw1rWFy5tFykuFg_yoW5ZF1kpF
 4qkF95KrZ5Cr1xCw1ayF9F9r4UKan8Ww1ayry7uFyqvw42ya10yrn0gr9rtrykAa1kZFyx
 Was29r45Wr4UZw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBmb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
 8067AKxVWUWwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
 64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
 CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
 6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
 02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
 4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82
 IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
 0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMI
 IF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l
 IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU7BMKDUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_033504_844064_F27CE3B5 
X-CRM114-Status: GOOD (  12.90  )
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

This is a riscv port of commit 819771cc2892 ("arm64: extable:
consolidate definitions").

In subsequent patches we'll alter the structure and usage of struct
exception_table_entry.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/asm-extable.h | 33 ++++++++++++++++++++++++++++
 arch/riscv/include/asm/futex.h       |  1 +
 arch/riscv/include/asm/uaccess.h     |  7 +-----
 arch/riscv/lib/uaccess.S             |  6 ++---
 4 files changed, 37 insertions(+), 10 deletions(-)
 create mode 100644 arch/riscv/include/asm/asm-extable.h

diff --git a/arch/riscv/include/asm/asm-extable.h b/arch/riscv/include/asm/asm-extable.h
new file mode 100644
index 000000000000..b790c02dbdda
--- /dev/null
+++ b/arch/riscv/include/asm/asm-extable.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_ASM_EXTABLE_H
+#define __ASM_ASM_EXTABLE_H
+
+#ifdef __ASSEMBLY__
+
+#define __ASM_EXTABLE_RAW(insn, fixup)		\
+	.pushsection	__ex_table, "a";	\
+	.balign		4;			\
+	.long		((insn) - .);		\
+	.long		((fixup) - .);		\
+	.popsection;
+
+	.macro		_asm_extable, insn, fixup
+	__ASM_EXTABLE_RAW(\insn, \fixup)
+	.endm
+
+#else /* __ASSEMBLY__ */
+
+#include <linux/stringify.h>
+
+#define __ASM_EXTABLE_RAW(insn, fixup)			\
+	".pushsection	__ex_table, \"a\"\n"		\
+	".balign	4\n"				\
+	".long		((" insn ") - .)\n"		\
+	".long		((" fixup ") - .)\n"		\
+	".popsection\n"
+
+#define _ASM_EXTABLE(insn, fixup) __ASM_EXTABLE_RAW(#insn, #fixup)
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* __ASM_ASM_EXTABLE_H */
diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
index 3191574e135c..2e15e8e89502 100644
--- a/arch/riscv/include/asm/futex.h
+++ b/arch/riscv/include/asm/futex.h
@@ -11,6 +11,7 @@
 #include <linux/uaccess.h>
 #include <linux/errno.h>
 #include <asm/asm.h>
+#include <asm/asm-extable.h>
 
 /* We don't even really need the extable code, but for now keep it simple */
 #ifndef CONFIG_MMU
diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 0f2c5b9d2e8f..40e6099af488 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -8,14 +8,9 @@
 #ifndef _ASM_RISCV_UACCESS_H
 #define _ASM_RISCV_UACCESS_H
 
+#include <asm/asm-extable.h>
 #include <asm/pgtable.h>		/* for TASK_SIZE */
 
-#define _ASM_EXTABLE(from, to)						\
-	"	.pushsection	__ex_table, \"a\"\n"			\
-	"	.balign		4\n"					\
-	"	.long		(" #from " - .), (" #to " - .)\n"	\
-	"	.popsection\n"
-
 /*
  * User space memory access functions
  */
diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 047f517ac780..8c475f4da308 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -1,15 +1,13 @@
 #include <linux/linkage.h>
 #include <asm-generic/export.h>
 #include <asm/asm.h>
+#include <asm/asm-extable.h>
 #include <asm/csr.h>
 
 	.macro fixup op reg addr lbl
 100:
 	\op \reg, \addr
-	.section __ex_table,"a"
-	.balign 4
-	.long (100b - .), (\lbl - .)
-	.previous
+	_asm_extable	100b, \lbl
 	.endm
 
 ENTRY(__asm_copy_to_user)
-- 
2.33.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
