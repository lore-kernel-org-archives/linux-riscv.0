Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A105C32771
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 21:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=emgCVctMZ56uq3pZ1wHAal/Iz2vrMgi5eBIEtTf5+7g=; b=im0JDTBhdAJ/CY
	K7k6ITPWPp0N5byCCdjuEZgkZMgqFePgv74raQRDFlr59WLhDP0SKDz+57R/Sb2g9H5wQa/i895bk
	sTjHLYAwdtzPUBaSgJFfQOFyrwpbe4uJZu+S+j+aVwReUVTgjEz6TS02pXesI0EJHuOpuy64xFxAR
	z4R9Nk2JCBIWdavMGr6KToTPnVhAf2tn+usiCXw1MbNGKFlgPewtVbW1TLVd/DsbBS86oziIWX+ge
	9tYyNJfwUMBIp/vjpWTj6N6sKMK7jIF878dHGOZgbDXh4/GIVXvlG9xZ9J1+oAZYqQE3RbgZgCvDK
	BfIdNRWQsY1Fn+XpNktw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob6qo-00Cdb5-Gh; Wed, 21 Sep 2022 21:01:46 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5gT-00CUbD-9r
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 19:47:03 +0000
Received: by mail-pj1-x1035.google.com with SMTP id q35-20020a17090a752600b002038d8a68fbso11440264pjk.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 12:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=KNTXllz/7lqM8/dxY7FGxyptHmO7d+SD0mjK3UzDW10=;
        b=4zRZG8Zb4e4mxlIrhpf7G2WQOZPiUjk1qdo8dZ5w3+IzLTgdXoZh804On2UcjYATeg
         MFw/iAtfRZk4BXnweCdoMf5FF4d6gxT3tPOIvPukXNQBWaiKiLc9C0l3NR1KAc4+wk0A
         /+fzryq2L9LblD2JI3whjLfQMiQ1bUIzxRbpFyXgC/udjG2alYh71XpyLyBtAji9e2Ti
         I/8HKAuZIPOjTobAc0xYCsXZMaTpDY7xpAbjA0P5UllYIdRqkkAF43K+ICiFN0VaEnt+
         Qdibsg+R6nJJB1+w0ZTaZf/ZfgUxY8Y8A1F0S4x8qhbP9MimRqgMxOPpUVs8rL6FlLuB
         iFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=KNTXllz/7lqM8/dxY7FGxyptHmO7d+SD0mjK3UzDW10=;
        b=OS42IHw5lLKR4MMs7u6s6bQP9wSoDvktmoGpsHgq5fTiISZ2vaxaKYj0QhhahmB260
         kBLzNkTQlBgE6dHL9hWwUrjI6nYtsYWCSxvNl44BLO3ygxESQXkWtT9qx3WKaJHRlZdA
         P1AilODtBRf/Cscig+mYWcpDfQ47evfSLa3tDYHi4hPWDO68+lOt0MqsoWeoeZvcr+sd
         uAIFYtAnwn8fkqskRf+00LycccRUIyYNW8VmdHwZbAvmhhdDkYZzDKz6iejY0FcrZAlP
         +NOm48/Hn0uHYDnBNysOIlUhjxfgtTGOYtgdaqbUHZXnf7A+9sDYYI8S7s4OUmNF+Qht
         5qww==
X-Gm-Message-State: ACrzQf2ErUOCzhMmW7C4d+F5+yIxd0TV1ZosPCtdoor1ySJW6A1hpfXc
	mMuLVEFVUYsPNNPIEQyIhk5jedTPVSz1bg==
X-Google-Smtp-Source: AMsMyM6ZnNI7nM3T2R503jdBu9k5h0fDD5BgYE/7x2ylGfqZ4AJNwYiLoaX6AVs+en71otXOOBw/TA==
X-Received: by 2002:a17:902:d552:b0:178:5b6d:629 with SMTP id z18-20020a170902d55200b001785b6d0629mr6371639plf.17.1663789618079;
        Wed, 21 Sep 2022 12:46:58 -0700 (PDT)
Received: from stillson.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id o2-20020aa79782000000b0054aa69bc192sm2551057pfp.72.2022.09.21.12.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 12:46:57 -0700 (PDT)
From: Chris Stillson <stillson@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	jpalmer@dabbelt.com,
	kvm-riscv@lists.infradead.org
Cc: Greentime Hu <greentime.hu@sifive.com>,
	Han-Kuan Chen <hankuan.chen@sifive.com>
Subject: [PATCH 13/17] riscv: Add vector extension XOR implementation
Date: Wed, 21 Sep 2022 12:46:25 -0700
Message-Id: <20220921194629.1480202-14-stillson@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921194629.1480202-1-stillson@rivosinc.com>
References: <20220921194629.1480202-1-stillson@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_124701_444125_369E01B3 
X-CRM114-Status: GOOD (  15.54  )
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

From: Greentime Hu <greentime.hu@sifive.com>

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
+		 const unsigned long * __restrict p2);
+void xor_regs_3_(unsigned long bytes, unsigned long * __restrict p1,
+		 const unsigned long * __restrict p2,
+		 const unsigned long * __restrict p3);
+void xor_regs_4_(unsigned long bytes, unsigned long * __restrict p1,
+		 const unsigned long * __restrict p2,
+		 const unsigned long * __restrict p3,
+		 const unsigned long * __restrict p4);
+void xor_regs_5_(unsigned long bytes, unsigned long * __restrict p1,
+		 const unsigned long * __restrict p2,
+		 const unsigned long * __restrict p3,
+		 const unsigned long * __restrict p4,
+		 const unsigned long * __restrict p5);
+
+static void xor_rvv_2(unsigned long bytes, unsigned long * __restrict p1,
+		      const unsigned long * __restrict p2)
+{
+	kernel_rvv_begin();
+	xor_regs_2_(bytes, p1, p2);
+	kernel_rvv_end();
+}
+
+static void xor_rvv_3(unsigned long bytes, unsigned long * __restrict p1,
+		      const unsigned long * __restrict p2,
+		      const unsigned long * __restrict p3)
+{
+	kernel_rvv_begin();
+	xor_regs_3_(bytes, p1, p2, p3);
+	kernel_rvv_end();
+}
+
+static void xor_rvv_4(unsigned long bytes, unsigned long * __restrict p1,
+		      const unsigned long * __restrict p2,
+		      const unsigned long * __restrict p3,
+		      const unsigned long * __restrict p4)
+{
+	kernel_rvv_begin();
+	xor_regs_4_(bytes, p1, p2, p3, p4);
+	kernel_rvv_end();
+}
+
+static void xor_rvv_5(unsigned long bytes, unsigned long * __restrict p1,
+		      const unsigned long * __restrict p2,
+		      const unsigned long * __restrict p3,
+		      const unsigned long * __restrict p4,
+		      const unsigned long * __restrict p5)
+{
+	kernel_rvv_begin();
+	xor_regs_5_(bytes, p1, p2, p3, p4, p5);
+	kernel_rvv_end();
+}
+
+static struct xor_block_template xor_block_rvv = {
+	.name = "rvv",
+	.do_2 = xor_rvv_2,
+	.do_3 = xor_rvv_3,
+	.do_4 = xor_rvv_4,
+	.do_5 = xor_rvv_5
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
index 25d5c9664e57..acd87ac86d24 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -7,3 +7,4 @@ lib-$(CONFIG_MMU)	+= uaccess.o
 lib-$(CONFIG_64BIT)	+= tishift.o
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
+lib-$(CONFIG_VECTOR)	+= xor.o
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
+END(xor_regs_2_)
+EXPORT_SYMBOL(xor_regs_2_)
+
+ENTRY(xor_regs_3_)
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
+END(xor_regs_3_)
+EXPORT_SYMBOL(xor_regs_3_)
+
+ENTRY(xor_regs_4_)
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
+END(xor_regs_4_)
+EXPORT_SYMBOL(xor_regs_4_)
+
+ENTRY(xor_regs_5_)
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
+END(xor_regs_5_)
+EXPORT_SYMBOL(xor_regs_5_)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
