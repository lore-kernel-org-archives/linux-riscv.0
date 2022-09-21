Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B1CC6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 16:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MujNX26FxUK9B199zWabMUiSzWDzBYr3u7q5PvMCOMc=; b=XXr0DhvJB2BSqD
	8MG8k2OezzB69oOCSX4VWldF7/noZaZlmKUq5PePYypfDS7x4auwD8ARVZdRE9S/ASt7eqtHFbXjw
	GCiMf1BCTlphiLdnlLL2zMsUtN0r4axfF6+eeVfEQwoi5i6F6X8rAUsUzgpgnn4flhWxXhkFyi0yI
	4IXl6vXWaPUfZn3ud+ayzqY+9OC8eHLo2eGESy0qu3eDV1nz+ALP/MLbZQXE0m58vEJxqIHwOU4gG
	s6Z6bXqj69AlWDF2HnzRYDG43ZVhQqSbZ2zIV8+cBxMCbncGZnhiG5k5SLG5OQKl3q4irILha3D8L
	xZ8dkkCAiSC9e8FIoLoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2va-00C3wg-HZ; Wed, 21 Sep 2022 16:50:26 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2vX-00C3uG-6d
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 16:50:24 +0000
Received: by mail-wr1-x431.google.com with SMTP id x18so4867762wrm.7
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 09:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=R7FucNEvBYhx+py0T15xv+ntnu+xHn1Mgi3filkb55I=;
        b=Uh4TSWA7tCmxfRa440DFTfSj+dNvJmSB7UnK7rOE2vbhT9I8VlGvHvnM40vZWeMjjF
         EL9r5Xc2TDxq2Bu+Ighif08jv6DLLqKKC9ch7TZQ5fP/yG9bSzOVxWI0wkOWArdqdy2E
         McHemt69NFLkjJAFdXdpkOJ3a3VDy1+9GWBSBChO+Cl1oSoerSsP9hwlHMBBhpfp3htt
         8DCCNB6GvMkHKvnRPTDHqxtHCvvZ+nc6BztDQS/LzKzLiMd94DYOfdFy0BPvu0Vh5lZB
         s9F/gQTcFQGw+y2+9NBU18gZFqaNlYhmjvn6lZ1o0/gtpnaIHkuSsmBQUON0CtaZD1Zh
         mg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=R7FucNEvBYhx+py0T15xv+ntnu+xHn1Mgi3filkb55I=;
        b=JrceMKtpyP7JWLB8WfEGAqKLvfoA1UFQI0wMx+Pve+b2cVBSjlX9O/4dQqibQYDk3A
         zN18BBVjEzeS7yeV4U4XM0IRI98VTm0P3EZkMR1Ewq7xvvk1UMV9SwAeGHcf3N60FkTb
         oIG/9ydbDJ2TRXh9PHtgjI2iP2mnpLRmwprJ6kB0qpmAMRDUUMjZwyfpD9DZZZYCHSGu
         yFdTnorHVvexcXE7l/jAIjKvLL/904vbIW20Cpch177JzwN7neOmNw8f1zOAUbnv/rPD
         Wt+8m0Jiu+pkNSJiu24egwi8CKwBuA6p0x9LvHhAnjsutv3B8eoT9KR/ARijDjfEw6JC
         fDGw==
X-Gm-Message-State: ACrzQf0ow78fGctKWaN03snO/8HkNNjetfNIXB8qUd82mWdazL6Mp8Gx
	/LlV+kvffujcgQXTqdFBxivANFvulNKfTG+kbKGGfcGkrhc8lw==
X-Google-Smtp-Source: AMsMyM5/TMXrUrr1Ond+VacueK7HVCeGvk6wGIb5xyA4DGlH7ZUvIyT+K+VvOEmnn9qDcrqvr4oPDXCW3T0jCsqPAWc=
X-Received: by 2002:adf:fb8f:0:b0:225:2def:221e with SMTP id
 a15-20020adffb8f000000b002252def221emr17858412wrr.130.1663779020529; Wed, 21
 Sep 2022 09:50:20 -0700 (PDT)
MIME-Version: 1.0
From: Chris Stillson <stillson@rivosinc.com>
Date: Wed, 21 Sep 2022 09:49:44 -0700
Message-ID: <CAM2SziUvhVTvD2TcDSVUx2CiW9deEb1V8G56e_7avcdWsUomzw@mail.gmail.com>
Subject: [PATCH 13/17] riscv: Add vector extension XOR implementation
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_095023_263752_848E9840 
X-CRM114-Status: GOOD (  14.44  )
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

This patch adds support for vector optimized XOR and it is tested in
qemu.

Co-developed-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Signed-off-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/asm/xor.h | 82 ++++++++++++++++++++++++++++++++++++
 arch/riscv/lib/Makefile      |  1 +
 arch/riscv/lib/xor.S         | 81 +++++++++++++++++++++++++++++++++++
 3 files changed, 164 insertions(+)
 create mode 100644 arch/riscv/include/asm/xor.h
 create mode 100644 arch/riscv/lib/xor.S

diff --git a/arch/riscv/include/asm/xor.h b/arch/riscv/include/asm/xor.h
new file mode 100644
index 000000000000..d1f2eeb14afb
--- /dev/null
+++ b/arch/riscv/include/asm/xor.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2021 SiFive
+ */
+
+#include <linux/hardirq.h>
+#include <asm-generic/xor.h>
+#ifdef CONFIG_VECTOR
+#include <asm/vector.h>
+#include <asm/switch_to.h>
+
+void xor_regs_2_(unsigned long bytes, unsigned long * __restrict p1,
+                const unsigned long * __restrict p2);
+void xor_regs_3_(unsigned long bytes, unsigned long * __restrict p1,
+                const unsigned long * __restrict p2,
+                const unsigned long * __restrict p3);
+void xor_regs_4_(unsigned long bytes, unsigned long * __restrict p1,
+                const unsigned long * __restrict p2,
+                const unsigned long * __restrict p3,
+                const unsigned long * __restrict p4);
+void xor_regs_5_(unsigned long bytes, unsigned long * __restrict p1,
+                const unsigned long * __restrict p2,
+                const unsigned long * __restrict p3,
+                const unsigned long * __restrict p4,
+                const unsigned long * __restrict p5);
+
+static void xor_rvv_2(unsigned long bytes, unsigned long * __restrict p1,
+                     const unsigned long * __restrict p2)
+{
+       kernel_rvv_begin();
+       xor_regs_2_(bytes, p1, p2);
+       kernel_rvv_end();
+}
+
+static void xor_rvv_3(unsigned long bytes, unsigned long * __restrict p1,
+                     const unsigned long * __restrict p2,
+                     const unsigned long * __restrict p3)
+{
+       kernel_rvv_begin();
+       xor_regs_3_(bytes, p1, p2, p3);
+       kernel_rvv_end();
+}
+
+static void xor_rvv_4(unsigned long bytes, unsigned long * __restrict p1,
+                     const unsigned long * __restrict p2,
+                     const unsigned long * __restrict p3,
+                     const unsigned long * __restrict p4)
+{
+       kernel_rvv_begin();
+       xor_regs_4_(bytes, p1, p2, p3, p4);
+       kernel_rvv_end();
+}
+
+static void xor_rvv_5(unsigned long bytes, unsigned long * __restrict p1,
+                     const unsigned long * __restrict p2,
+                     const unsigned long * __restrict p3,
+                     const unsigned long * __restrict p4,
+                     const unsigned long * __restrict p5)
+{
+       kernel_rvv_begin();
+       xor_regs_5_(bytes, p1, p2, p3, p4, p5);
+       kernel_rvv_end();
+}
+
+static struct xor_block_template xor_block_rvv = {
+       .name = "rvv",
+       .do_2 = xor_rvv_2,
+       .do_3 = xor_rvv_3,
+       .do_4 = xor_rvv_4,
+       .do_5 = xor_rvv_5
+};
+
+#undef XOR_TRY_TEMPLATES
+#define XOR_TRY_TEMPLATES           \
+       do {        \
+               xor_speed(&xor_block_8regs);    \
+               xor_speed(&xor_block_32regs);    \
+               if (has_vector()) { \
+                       xor_speed(&xor_block_rvv);\
+               } \
+       } while (0)
+#endif
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 25d5c9664e57..acd87ac86d24 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -7,3 +7,4 @@ lib-$(CONFIG_MMU)       += uaccess.o
 lib-$(CONFIG_64BIT)    += tishift.o

 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
+lib-$(CONFIG_VECTOR)   += xor.o
diff --git a/arch/riscv/lib/xor.S b/arch/riscv/lib/xor.S
new file mode 100644
index 000000000000..3bc059e18171
--- /dev/null
+++ b/arch/riscv/lib/xor.S
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2021 SiFive
+ */
+#include <linux/linkage.h>
+#include <asm-generic/export.h>
+#include <asm/asm.h>
+
+ENTRY(xor_regs_2_)
+       vsetvli a3, a0, e8, m8, ta, ma
+       vle8.v v0, (a1)
+       vle8.v v8, (a2)
+       sub a0, a0, a3
+       vxor.vv v16, v0, v8
+       add a2, a2, a3
+       vse8.v v16, (a1)
+       add a1, a1, a3
+       bnez a0, xor_regs_2_
+       ret
+END(xor_regs_2_)
+EXPORT_SYMBOL(xor_regs_2_)
+
+ENTRY(xor_regs_3_)
+       vsetvli a4, a0, e8, m8, ta, ma
+       vle8.v v0, (a1)
+       vle8.v v8, (a2)
+       sub a0, a0, a4
+       vxor.vv v0, v0, v8
+       vle8.v v16, (a3)
+       add a2, a2, a4
+       vxor.vv v16, v0, v16
+       add a3, a3, a4
+       vse8.v v16, (a1)
+       add a1, a1, a4
+       bnez a0, xor_regs_3_
+       ret
+END(xor_regs_3_)
+EXPORT_SYMBOL(xor_regs_3_)
+
+ENTRY(xor_regs_4_)
+       vsetvli a5, a0, e8, m8, ta, ma
+       vle8.v v0, (a1)
+       vle8.v v8, (a2)
+       sub a0, a0, a5
+       vxor.vv v0, v0, v8
+       vle8.v v16, (a3)
+       add a2, a2, a5
+       vxor.vv v0, v0, v16
+       vle8.v v24, (a4)
+       add a3, a3, a5
+       vxor.vv v16, v0, v24
+       add a4, a4, a5
+       vse8.v v16, (a1)
+       add a1, a1, a5
+       bnez a0, xor_regs_4_
+       ret
+END(xor_regs_4_)
+EXPORT_SYMBOL(xor_regs_4_)
+
+ENTRY(xor_regs_5_)
+       vsetvli a6, a0, e8, m8, ta, ma
+       vle8.v v0, (a1)
+       vle8.v v8, (a2)
+       sub a0, a0, a6
+       vxor.vv v0, v0, v8
+       vle8.v v16, (a3)
+       add a2, a2, a6
+       vxor.vv v0, v0, v16
+       vle8.v v24, (a4)
+       add a3, a3, a6
+       vxor.vv v0, v0, v24
+       vle8.v v8, (a5)
+       add a4, a4, a6
+       vxor.vv v16, v0, v8
+       add a5, a5, a6
+       vse8.v v16, (a1)
+       add a1, a1, a6
+       bnez a0, xor_regs_5_
+       ret
+END(xor_regs_5_)
+EXPORT_SYMBOL(xor_regs_5_)
--
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
