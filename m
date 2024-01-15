Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537D1C3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 07:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xaq2TRk3wXbQZSmYt3X3wTn1lW/bK0rQJZnzB7U/D/M=; b=Zhfg6HKWKAyo9o
	4RtfXjdPGiin0bPjoNOzPH7ZoYorpMJmtl4ooFXntqn4Mwh3vOtg3VvxE+02ajlmGupNsevStXoDe
	a07OrHLIyr2QNqgskbwl44UJs6a7WDk81Vzx0rsrdIUSMQRCvNSScO7L55ioH94gYzjGs142CIVUz
	2dc/ZQ53wCgNmED7q2tPhtrQZytqaPd43q8kxpNhDdLebUuFGb5MzF9GIz2wMY+i68yBt+9oVWFH+
	0KVt6PgnyRRwG3BN1fuY4owyg6ngqviXFRvDKqfY14fAWlAcT7b8M/hFhexpVL0dEOFxl086guw3J
	FkG02X00Qi3Abqy3d7Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPHBl-0083Cm-0p;
	Mon, 15 Jan 2024 07:15:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPG1F-007qLS-31
	for linux-riscv@bombadil.infradead.org;
	Mon, 15 Jan 2024 06:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NFnYzFltuLxaA5kymfUv4YQXh/w1s0UKs0KJQeLv+3U=; b=izfqPcsuYMr1yRDiqXHtUA2MbX
	Q7uvcxOI1kChL+YIJTteZVyICft21g9fmJrqv/fu4mWUxpqrjc+AKjmzzc/rGSbwatRncAFF4MghY
	9U6I0qEZ8oH0tF1MPJsaCtyef7YN+kB5k1jQtIyFtXMqGuEsZ15j+7RxGb5Ho0OlDDHqiTo93WMg7
	/Cn+qDNSlhRN/LNVkm51FgkkvgEBqGUyqBSjcAZsHgCsvCrtY1RNdXClO5vWjiKnzZ10Kdm6tUTNk
	96zyqxSe4OmP3eTv7YH0uxkcat+6E5kjDTsGNGJlfUpWkr6jaqtngHojU2tsXP4jc+7WOcjcK4b2S
	VCJOy1Qw==;
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPG14-00D1bH-35
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 06:00:13 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6db81c6287dso406378b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 14 Jan 2024 22:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1705298408; x=1705903208; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NFnYzFltuLxaA5kymfUv4YQXh/w1s0UKs0KJQeLv+3U=;
        b=gUXd1u8dVggzZ1myg9QA8VxGZAnl83eQdeSGI2STyIS36ZFsP0AmL4LdQTf/whlmht
         o43T9ULFLCRU1GmJMy0ckAQlX4Qqa/lkrwrg/qdFhZ2nkQttuv/DwIhYgHRGbeavMHw5
         kCcw0cekRTGLHJHfUdJwA4Wk1RTpYHtKI6C6sbi84zDSlUHe+c4Qx7VYrgCT268OdJv8
         Y57Rw5Ftftb0zgy9dAWYSzTD1Ff/qpyIQyTpFj3wGQ0oVRLLsqbJQ7ceJTIdA77izw2t
         kVSiqf00epk+9h5EgDKCLJCYRHNQ4SsWqS8xTCFWbhT2fB9dcMN+q94h1DGscF2jgE3s
         A7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705298408; x=1705903208;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NFnYzFltuLxaA5kymfUv4YQXh/w1s0UKs0KJQeLv+3U=;
        b=UQQdBrUIUssfOHJprxzFGesvSs0eoF27ovCcwgAt7S6JSi/2iWtiV+Wr8Q4wQd0yQz
         cMjvNGKrAJpTmvIUykITTmcfY41QPn5NXYp/+bnIHriPh06OTNJQm46SmhgUE6NvghAq
         5+XJIF3f0tFItC+/e0vBS/HapDlLhzWkhznb3o070I3l4adgJaLJmImpecyxFMnmSOdz
         XDpNsNNIbaG22Ci0mphK4MfhqAiRLxQry59PWHBZauDt5a1Os47ZUPzkPFJS0ldMS0oR
         s+WOGLlSWpVv0n62G776vLyXcH5agdw/1XrA8GqomSjtPAL2sYvivPcUPgbeLhzTGXoN
         Lmvg==
X-Gm-Message-State: AOJu0Yy14T/nKhHrbY+8d3vaPykH0uJWcYpVGlpQlpBjUXxqyLhxvl2i
	VstaxDBYDRKgbHWuBx1REcWyKY3spHjhrPsv6GN9dTWL3xYMIptO8eYvf4lrz7Gp9tFLNMJ8r4g
	+4bMkXY0CaVtpn9Gopx4Bc7LQPL5jQDP3ZO9L98HuE8Thnz9cgZ5d/+TeuXY0q/MnOKLg8aal6Q
	v1K/mY3UU1JiIN0bibx9x8
X-Google-Smtp-Source: AGHT+IFQ9o4Beuw84DJQv0CcxnQM9UIRHHO0VCbgTgB+5nccklvOx/eNcKBm9DdqVJnj1VDg1MkJIA==
X-Received: by 2002:a05:6a20:a8af:b0:19a:260b:ec26 with SMTP id ca47-20020a056a20a8af00b0019a260bec26mr5467308pzb.61.1705298407715;
        Sun, 14 Jan 2024 22:00:07 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o18-20020a637e52000000b005b9083b81f0sm7392988pgn.36.2024.01.14.22.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jan 2024 22:00:06 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	charlie@rivosinc.com,
	ardb@kernel.org,
	arnd@arndb.de,
	peterz@infradead.org,
	tglx@linutronix.de,
	ebiggers@kernel.org,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Jerry Shih <jerry.shih@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Nick Knight <nick.knight@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [v11, 03/10] riscv: Add vector extension XOR implementation
Date: Mon, 15 Jan 2024 05:59:22 +0000
Message-Id: <20240115055929.4736-4-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240115055929.4736-1-andy.chiu@sifive.com>
References: <20240115055929.4736-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_060011_192289_4D1A63AB 
X-CRM114-Status: GOOD (  16.17  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Greentime Hu <greentime.hu@sifive.com>

This patch adds support for vector optimized XOR and it is tested in
qemu.

Co-developed-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Signed-off-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog v8:
 - wrap xor function prototypes with CONFIG_RISCV_ISA_V
Changelog v7:
 - fix build warning message and use proper entry/exit macro for
   assembly. Drop Conor's A-b
Changelog v2:
 - 's/rvv/vector/' (Conor)
---
 arch/riscv/include/asm/asm-prototypes.h | 18 ++++++
 arch/riscv/include/asm/xor.h            | 68 +++++++++++++++++++++
 arch/riscv/lib/Makefile                 |  1 +
 arch/riscv/lib/xor.S                    | 81 +++++++++++++++++++++++++
 4 files changed, 168 insertions(+)
 create mode 100644 arch/riscv/include/asm/xor.h
 create mode 100644 arch/riscv/lib/xor.S

diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index 36b955c762ba..6db1a9bbff4c 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -9,6 +9,24 @@ long long __lshrti3(long long a, int b);
 long long __ashrti3(long long a, int b);
 long long __ashlti3(long long a, int b);
 
+#ifdef CONFIG_RISCV_ISA_V
+
+void xor_regs_2_(unsigned long bytes, unsigned long *__restrict p1,
+		 const unsigned long *__restrict p2);
+void xor_regs_3_(unsigned long bytes, unsigned long *__restrict p1,
+		 const unsigned long *__restrict p2,
+		 const unsigned long *__restrict p3);
+void xor_regs_4_(unsigned long bytes, unsigned long *__restrict p1,
+		 const unsigned long *__restrict p2,
+		 const unsigned long *__restrict p3,
+		 const unsigned long *__restrict p4);
+void xor_regs_5_(unsigned long bytes, unsigned long *__restrict p1,
+		 const unsigned long *__restrict p2,
+		 const unsigned long *__restrict p3,
+		 const unsigned long *__restrict p4,
+		 const unsigned long *__restrict p5);
+
+#endif /* CONFIG_RISCV_ISA_V */
 
 #define DECLARE_DO_ERROR_INFO(name)	asmlinkage void name(struct pt_regs *regs)
 
diff --git a/arch/riscv/include/asm/xor.h b/arch/riscv/include/asm/xor.h
new file mode 100644
index 000000000000..96011861e46b
--- /dev/null
+++ b/arch/riscv/include/asm/xor.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2021 SiFive
+ */
+
+#include <linux/hardirq.h>
+#include <asm-generic/xor.h>
+#ifdef CONFIG_RISCV_ISA_V
+#include <asm/vector.h>
+#include <asm/switch_to.h>
+#include <asm/asm-prototypes.h>
+
+static void xor_vector_2(unsigned long bytes, unsigned long *__restrict p1,
+			 const unsigned long *__restrict p2)
+{
+	kernel_vector_begin();
+	xor_regs_2_(bytes, p1, p2);
+	kernel_vector_end();
+}
+
+static void xor_vector_3(unsigned long bytes, unsigned long *__restrict p1,
+			 const unsigned long *__restrict p2,
+			 const unsigned long *__restrict p3)
+{
+	kernel_vector_begin();
+	xor_regs_3_(bytes, p1, p2, p3);
+	kernel_vector_end();
+}
+
+static void xor_vector_4(unsigned long bytes, unsigned long *__restrict p1,
+			 const unsigned long *__restrict p2,
+			 const unsigned long *__restrict p3,
+			 const unsigned long *__restrict p4)
+{
+	kernel_vector_begin();
+	xor_regs_4_(bytes, p1, p2, p3, p4);
+	kernel_vector_end();
+}
+
+static void xor_vector_5(unsigned long bytes, unsigned long *__restrict p1,
+			 const unsigned long *__restrict p2,
+			 const unsigned long *__restrict p3,
+			 const unsigned long *__restrict p4,
+			 const unsigned long *__restrict p5)
+{
+	kernel_vector_begin();
+	xor_regs_5_(bytes, p1, p2, p3, p4, p5);
+	kernel_vector_end();
+}
+
+static struct xor_block_template xor_block_rvv = {
+	.name = "rvv",
+	.do_2 = xor_vector_2,
+	.do_3 = xor_vector_3,
+	.do_4 = xor_vector_4,
+	.do_5 = xor_vector_5
+};
+
+#undef XOR_TRY_TEMPLATES
+#define XOR_TRY_TEMPLATES           \
+	do {        \
+		xor_speed(&xor_block_8regs);    \
+		xor_speed(&xor_block_32regs);    \
+		if (has_vector()) { \
+			xor_speed(&xor_block_rvv);\
+		} \
+	} while (0)
+#endif
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 26cb2502ecf8..494f9cd1a00c 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -11,3 +11,4 @@ lib-$(CONFIG_64BIT)	+= tishift.o
 lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
+lib-$(CONFIG_RISCV_ISA_V)	+= xor.o
diff --git a/arch/riscv/lib/xor.S b/arch/riscv/lib/xor.S
new file mode 100644
index 000000000000..b28f2430e52f
--- /dev/null
+++ b/arch/riscv/lib/xor.S
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2021 SiFive
+ */
+#include <linux/linkage.h>
+#include <linux/export.h>
+#include <asm/asm.h>
+
+SYM_FUNC_START(xor_regs_2_)
+	vsetvli a3, a0, e8, m8, ta, ma
+	vle8.v v0, (a1)
+	vle8.v v8, (a2)
+	sub a0, a0, a3
+	vxor.vv v16, v0, v8
+	add a2, a2, a3
+	vse8.v v16, (a1)
+	add a1, a1, a3
+	bnez a0, xor_regs_2_
+	ret
+SYM_FUNC_END(xor_regs_2_)
+EXPORT_SYMBOL(xor_regs_2_)
+
+SYM_FUNC_START(xor_regs_3_)
+	vsetvli a4, a0, e8, m8, ta, ma
+	vle8.v v0, (a1)
+	vle8.v v8, (a2)
+	sub a0, a0, a4
+	vxor.vv v0, v0, v8
+	vle8.v v16, (a3)
+	add a2, a2, a4
+	vxor.vv v16, v0, v16
+	add a3, a3, a4
+	vse8.v v16, (a1)
+	add a1, a1, a4
+	bnez a0, xor_regs_3_
+	ret
+SYM_FUNC_END(xor_regs_3_)
+EXPORT_SYMBOL(xor_regs_3_)
+
+SYM_FUNC_START(xor_regs_4_)
+	vsetvli a5, a0, e8, m8, ta, ma
+	vle8.v v0, (a1)
+	vle8.v v8, (a2)
+	sub a0, a0, a5
+	vxor.vv v0, v0, v8
+	vle8.v v16, (a3)
+	add a2, a2, a5
+	vxor.vv v0, v0, v16
+	vle8.v v24, (a4)
+	add a3, a3, a5
+	vxor.vv v16, v0, v24
+	add a4, a4, a5
+	vse8.v v16, (a1)
+	add a1, a1, a5
+	bnez a0, xor_regs_4_
+	ret
+SYM_FUNC_END(xor_regs_4_)
+EXPORT_SYMBOL(xor_regs_4_)
+
+SYM_FUNC_START(xor_regs_5_)
+	vsetvli a6, a0, e8, m8, ta, ma
+	vle8.v v0, (a1)
+	vle8.v v8, (a2)
+	sub a0, a0, a6
+	vxor.vv v0, v0, v8
+	vle8.v v16, (a3)
+	add a2, a2, a6
+	vxor.vv v0, v0, v16
+	vle8.v v24, (a4)
+	add a3, a3, a6
+	vxor.vv v0, v0, v24
+	vle8.v v8, (a5)
+	add a4, a4, a6
+	vxor.vv v16, v0, v8
+	add a5, a5, a6
+	vse8.v v16, (a1)
+	add a1, a1, a6
+	bnez a0, xor_regs_5_
+	ret
+SYM_FUNC_END(xor_regs_5_)
+EXPORT_SYMBOL(xor_regs_5_)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
