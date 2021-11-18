Return-Path: <SRS0=Kh2H=QF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51665C43217
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 11:35:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CB4B63212
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Nov 2021 11:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CB4B63212
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vGc16/UIDlLI2M14fz2PGKH3Ky4lQXZV+3W1VHUjMI=; b=4isob9MN88IUSj
	NgSWlPehsjhh3mzDDhin9180i4PEQrgrFMlYYcV+/KjGeiWBQedh2pU9eNP9eEkE8iuXAoc8kZrDj
	t3X3pvlIznC0SPOPSZc8u++SvtLq9JoKARQ7fyhghiKc2z4VXHwHdNET8jb0b0xhpjTmJvDoGa9yi
	lRVIdwzCB2IEIghdtAOjmflLYFQP/C+GhKxqAfRYQTZfEva5iULJ2dLJLXzxRISr2dyshKmBQc1kR
	H4MQKGwQOfDPa1ZItVeHhuUgeOFE7o97Pqy6Culjdxi4Bb5GetMNoJOIHFo1YkI/3OkALAi038o4P
	cDavU/GTkljSTwN1nq6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnfhD-007bVh-41; Thu, 18 Nov 2021 11:35:15 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnfh2-007bRP-Fc
 for linux-riscv@lists.infradead.org; Thu, 18 Nov 2021 11:35:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=E194qarboNDAGzp6ZWTNIVq4BztBSA4Zvn
 i9ISpWjXc=; b=k6f/1MpGGeLZvXWpC/6SuK4qWxc7ENCe7ku7GwcXkl+EO0eHxS
 qRv3IbB/hD/sbYN6X0MBfjnMEVvY/BaowBu9hCTr/ZXJOZgLq0hzi+d0vEL1QPZb
 bGL0n/SMIZ1HKtG18Gx1kcBrQTB+NyexxGEY0suLkIQVQuRGYklQw/Jw4=
Received: from xhacker (unknown [101.86.18.22])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygAHD99XOpZhwZ1cAQ--.27562S3; 
 Thu, 18 Nov 2021 19:34:49 +0800 (CST)
Date: Thu, 18 Nov 2021 19:26:05 +0800
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
Subject: [PATCH 09/12] riscv: extable: add `type` and `data` fields
Message-ID: <20211118192605.57e06d6b@xhacker>
In-Reply-To: <20211118192130.48b8f04c@xhacker>
References: <20211118192130.48b8f04c@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygAHD99XOpZhwZ1cAQ--.27562S3
X-Coremail-Antispam: 1UD129KBjvJXoW3AFy3Aw4rur43Cr47Ar48Crg_yoWxXFWrpF
 4qkF93KrWFgrn3ua13tF4qqr15Kr40g345CrWS9w15ta12krWrtr18t34ayr1qvFW8WFy8
 C3WSkrW5Cw4fArJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBmb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
 8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
 64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
 CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
 6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
 02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
 4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82
 IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
 0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMI
 IF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l
 IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU7Pl1DUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_033505_235348_D0703990 
X-CRM114-Status: GOOD (  15.77  )
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

This is a riscv port of commit d6e2cc564775("arm64: extable: add `type`
and `data` fields").

We will add specialized handlers for fixups, the `type` field is for
fixup handler type, the `data` field is used to pass specific data to
each handler, for example register numbers.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/asm-extable.h | 25 +++++++++++++++++--------
 arch/riscv/include/asm/extable.h     | 17 ++++++++++++++---
 arch/riscv/kernel/vmlinux.lds.S      |  2 +-
 arch/riscv/mm/extable.c              | 25 +++++++++++++++++++++----
 arch/riscv/net/bpf_jit_comp64.c      |  5 +++--
 scripts/sorttable.c                  |  4 +++-
 6 files changed, 59 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/include/asm/asm-extable.h b/arch/riscv/include/asm/asm-extable.h
index b790c02dbdda..1b1f4ffd8d37 100644
--- a/arch/riscv/include/asm/asm-extable.h
+++ b/arch/riscv/include/asm/asm-extable.h
@@ -2,31 +2,40 @@
 #ifndef __ASM_ASM_EXTABLE_H
 #define __ASM_ASM_EXTABLE_H
 
+#define EX_TYPE_NONE			0
+#define EX_TYPE_FIXUP			1
+#define EX_TYPE_BPF			2
+
 #ifdef __ASSEMBLY__
 
-#define __ASM_EXTABLE_RAW(insn, fixup)		\
-	.pushsection	__ex_table, "a";	\
-	.balign		4;			\
-	.long		((insn) - .);		\
-	.long		((fixup) - .);		\
+#define __ASM_EXTABLE_RAW(insn, fixup, type, data)	\
+	.pushsection	__ex_table, "a";		\
+	.balign		4;				\
+	.long		((insn) - .);			\
+	.long		((fixup) - .);			\
+	.short		(type);				\
+	.short		(data);				\
 	.popsection;
 
 	.macro		_asm_extable, insn, fixup
-	__ASM_EXTABLE_RAW(\insn, \fixup)
+	__ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_FIXUP, 0)
 	.endm
 
 #else /* __ASSEMBLY__ */
 
 #include <linux/stringify.h>
 
-#define __ASM_EXTABLE_RAW(insn, fixup)			\
+#define __ASM_EXTABLE_RAW(insn, fixup, type, data)	\
 	".pushsection	__ex_table, \"a\"\n"		\
 	".balign	4\n"				\
 	".long		((" insn ") - .)\n"		\
 	".long		((" fixup ") - .)\n"		\
+	".short		(" type ")\n"			\
+	".short		(" data ")\n"			\
 	".popsection\n"
 
-#define _ASM_EXTABLE(insn, fixup) __ASM_EXTABLE_RAW(#insn, #fixup)
+#define _ASM_EXTABLE(insn, fixup)	\
+	__ASM_EXTABLE_RAW(#insn, #fixup, __stringify(EX_TYPE_FIXUP), "0")
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/riscv/include/asm/extable.h b/arch/riscv/include/asm/extable.h
index e4374dde02b4..512012d193dc 100644
--- a/arch/riscv/include/asm/extable.h
+++ b/arch/riscv/include/asm/extable.h
@@ -17,18 +17,29 @@
 
 struct exception_table_entry {
 	int insn, fixup;
+	short type, data;
 };
 
 #define ARCH_HAS_RELATIVE_EXTABLE
 
+#define swap_ex_entry_fixup(a, b, tmp, delta)		\
+do {							\
+	(a)->fixup = (b)->fixup + (delta);		\
+	(b)->fixup = (tmp).fixup - (delta);		\
+	(a)->type = (b)->type;				\
+	(b)->type = (tmp).type;				\
+	(a)->data = (b)->data;				\
+	(b)->data = (tmp).data;				\
+} while (0)
+
 bool fixup_exception(struct pt_regs *regs);
 
 #if defined(CONFIG_BPF_JIT) && defined(CONFIG_ARCH_RV64I)
-bool rv_bpf_fixup_exception(const struct exception_table_entry *ex, struct pt_regs *regs);
+bool ex_handler_bpf(const struct exception_table_entry *ex, struct pt_regs *regs);
 #else
 static inline bool
-rv_bpf_fixup_exception(const struct exception_table_entry *ex,
-		       struct pt_regs *regs)
+ex_handler_bpf(const struct exception_table_entry *ex,
+	       struct pt_regs *regs)
 {
 	return false;
 }
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 5104f3a871e3..0e5ae851929e 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -4,7 +4,7 @@
  * Copyright (C) 2017 SiFive
  */
 
-#define RO_EXCEPTION_TABLE_ALIGN	16
+#define RO_EXCEPTION_TABLE_ALIGN	4
 
 #ifdef CONFIG_XIP_KERNEL
 #include "vmlinux-xip.lds.S"
diff --git a/arch/riscv/mm/extable.c b/arch/riscv/mm/extable.c
index 3c561f1d0115..91e52c4bb33a 100644
--- a/arch/riscv/mm/extable.c
+++ b/arch/riscv/mm/extable.c
@@ -10,6 +10,20 @@
 #include <linux/extable.h>
 #include <linux/module.h>
 #include <linux/uaccess.h>
+#include <asm/asm-extable.h>
+
+static inline unsigned long
+get_ex_fixup(const struct exception_table_entry *ex)
+{
+	return ((unsigned long)&ex->fixup + ex->fixup);
+}
+
+static bool ex_handler_fixup(const struct exception_table_entry *ex,
+			     struct pt_regs *regs)
+{
+	regs->epc = get_ex_fixup(ex);
+	return true;
+}
 
 bool fixup_exception(struct pt_regs *regs)
 {
@@ -19,9 +33,12 @@ bool fixup_exception(struct pt_regs *regs)
 	if (!ex)
 		return false;
 
-	if (regs->epc >= BPF_JIT_REGION_START && regs->epc < BPF_JIT_REGION_END)
-		return rv_bpf_fixup_exception(ex, regs);
+	switch (ex->type) {
+	case EX_TYPE_FIXUP:
+		return ex_handler_fixup(ex, regs);
+	case EX_TYPE_BPF:
+		return ex_handler_bpf(ex, regs);
+	}
 
-	regs->epc = (unsigned long)&ex->fixup + ex->fixup;
-	return true;
+	BUG();
 }
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 7714081cbb64..69bab7e28f91 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -459,8 +459,8 @@ static int emit_call(bool fixed, u64 addr, struct rv_jit_context *ctx)
 #define BPF_FIXUP_OFFSET_MASK   GENMASK(26, 0)
 #define BPF_FIXUP_REG_MASK      GENMASK(31, 27)
 
-bool rv_bpf_fixup_exception(const struct exception_table_entry *ex,
-			    struct pt_regs *regs)
+bool ex_handler_bpf(const struct exception_table_entry *ex,
+		    struct pt_regs *regs)
 {
 	off_t offset = FIELD_GET(BPF_FIXUP_OFFSET_MASK, ex->fixup);
 	int regs_offset = FIELD_GET(BPF_FIXUP_REG_MASK, ex->fixup);
@@ -514,6 +514,7 @@ static int add_exception_handler(const struct bpf_insn *insn,
 
 	ex->fixup = FIELD_PREP(BPF_FIXUP_OFFSET_MASK, offset) |
 		FIELD_PREP(BPF_FIXUP_REG_MASK, dst_reg);
+	ex->type = EX_TYPE_BPF;
 
 	ctx->nexentries++;
 	return 0;
diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index 0c031e47a419..5b5472b543f5 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -376,9 +376,11 @@ static int do_file(char const *const fname, void *addr)
 	case EM_PARISC:
 	case EM_PPC:
 	case EM_PPC64:
-	case EM_RISCV:
 		custom_sort = sort_relative_table;
 		break;
+	case EM_RISCV:
+		custom_sort = arm64_sort_relative_table;
+		break;
 	case EM_ARCOMPACT:
 	case EM_ARCV2:
 	case EM_ARM:
-- 
2.33.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
