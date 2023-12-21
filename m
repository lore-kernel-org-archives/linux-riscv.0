Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BC2C35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 13:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DV8xRL7tEjykz4cKWnFtTLNKKrx8DErQgcUfaLcD/9s=; b=m0jjXR4X/l85lt
	Wg9G4cj1RiYHKjzSl52UZMYW/zxbcZIACPS4C1Iy8iejIf3wGqZvcs4sA5anwtVQ6V+v1a/dL1CWd
	9SN+Lq46qM1p4QuF3jwq4EWKxg4e494VxKSYirJ6qbtlZmft2SUWavqaveVVbMS5yVkaxe5YDySuH
	wMRwfg6nr1JuYgtQ5v8+P1o1DSWLzyORlQ6s2edMfNyVsv7u+l9wM/NvAQ0hmzj2xI4qWrBwKo4I0
	CzyU1y311xg2fGRAj/bHXx5KcuNOpU2b1CpyW5pw/3XJk/usBLSahWpG019j2uhGgJdCHHl8eJHnI
	xwdBLbDxJT8ER5mYJQ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJLG-0031jk-2Z;
	Thu, 21 Dec 2023 13:44:02 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJLD-0031gn-0N
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 13:44:01 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1d3fc184b6dso4474755ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 05:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703166235; x=1703771035; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AqcMhZ6hnnDAvLBGLmTurXkp9t0sE5KdvWpv8IRkAao=;
        b=FMwrxDSWnLab0bEoZUO8kQCARgAbG6Fw5qCcVwVxg9G5hWsNviGkvROEdqvVCG3QnD
         BjqWAilOIY8mEhUiq2Le6jPWOT0AT8pYkTnjB3aIysloh1QYo2/Lu1Hrb1o1G3RvNM/i
         f10iUBbPFJ8smk4M8eCpIzP9yZtlFAvlt8VOVcsK+KbSOv2Id7CVZGHqfcqDSUKSxUwl
         w4cEqaP4IWQQf69A0xV/HU3fq23/Wkzzz5Ijoyl28XwR1VNnQTuYFuAfL01Iz7NxRxVz
         heleuIOhfy+27C5Ftn7aXEvBOF4/ZCodKJwdhDNwWwfFLRzjZwfnncshEwqsN0NoIcAl
         I2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703166235; x=1703771035;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AqcMhZ6hnnDAvLBGLmTurXkp9t0sE5KdvWpv8IRkAao=;
        b=DCvDEFTXRER/vHvOGQt456h0y8s0mbCFiTIi6ECx0e0P3zfAJxCgS3O/wO9I+IBt8E
         ogMsfXPVvkqXu7qeLjDSgKxOWzpHSRMDp3iOtAtDAxX1zn5fqtpCIMpCK+zBdyXsZw1c
         P13A8izu6HVI7TPIlagBq7AIB2yrtYVc/salAFkV0uo3QjM97Xrf2ei3DgBpoRu9T1dt
         COq3ovJDXNeGVHdi7yqzWzhdM/zLJF7T4mOmHTd2gfpUnbYJ0IlzRYAbNuSPY2DKRebk
         ufGnH4QZ60aZfhNXaWqt9esf4xPcoUDZ27HHCgw0GZVKqhTGLJss4jN3pzLID4CO2ZjG
         6/OQ==
X-Gm-Message-State: AOJu0YxZerC9NX/DD+vzrumOOD/DpUKZkSN7o6fmy5CsfHb0F5TIpVBz
	6NoRMbjl8Yokhb3uWTCUWvZ/KwfIN0wMk/o60D4S+88wwAtU2Gx9oNIXD7VU1zSWAs+efCZ5LZ9
	f0oYVvOStHbETpKxlku06CpMwv9+q0SdPYcROf8v6E5HaIhorCWy9n8bpQXE1g9uLlwOVQvA0uV
	vbqEbWSwU5+dQZ
X-Google-Smtp-Source: AGHT+IHMxBxtOLeATxuL0RHWmg09uEvKnnZrqSLjhd03HMW9WzMmyvjgdPYJm7idTGzyszEuuTP+og==
X-Received: by 2002:a17:902:bb10:b0:1d3:ef79:4a2e with SMTP id im16-20020a170902bb1000b001d3ef794a2emr1317096plb.87.1703166234922;
        Thu, 21 Dec 2023 05:43:54 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id iw3-20020a170903044300b001c72d5e16acsm1646001plb.57.2023.12.21.05.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:43:54 -0800 (PST)
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
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [v7, 03/10] riscv: Add vector extension XOR implementation
Date: Thu, 21 Dec 2023 13:43:10 +0000
Message-Id: <20231221134318.28105-4-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231221134318.28105-1-andy.chiu@sifive.com>
References: <20231221134318.28105-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_054359_155682_15B6D845 
X-CRM114-Status: GOOD (  15.12  )
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
Changelog v7:
 - fix build warning message and use proper entry/exit macro for
   assembly. Drop Conor's A-b
Changelog v2:
 - 's/rvv/vector/' (Conor)
---
 arch/riscv/include/asm/asm-prototypes.h | 14 +++++
 arch/riscv/include/asm/xor.h            | 68 +++++++++++++++++++++
 arch/riscv/lib/Makefile                 |  1 +
 arch/riscv/lib/xor.S                    | 81 +++++++++++++++++++++++++
 4 files changed, 164 insertions(+)
 create mode 100644 arch/riscv/include/asm/xor.h
 create mode 100644 arch/riscv/lib/xor.S

diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index 36b955c762ba..b34b68a99855 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -9,6 +9,20 @@ long long __lshrti3(long long a, int b);
 long long __ashrti3(long long a, int b);
 long long __ashlti3(long long a, int b);
 
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
