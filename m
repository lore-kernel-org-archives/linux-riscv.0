Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583FFC46CD3
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 14:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+hIieG5alVHABdmXoSXIF3wc/8qqCtNaqGJkH8HYHzI=; b=2G6a7axqfP7Nf4
	IjLmk9lOb0JZp1gRbCh+DHrNScoBD2QQ1MAHrofKWVP1ImUQXA+GYwOSvyCmp8jV6U7xdiV/hg8eR
	lIS/x0Hip8jgbSHhTwyFGU9PZ4jr+Dz210EzZmR4ALG3miv5SPGlUHMQiQN01Ln0zCse8F6eiyYZn
	ZAdmhaSWD9M4MitcettCcZqV+Z9YEMi8yaw4fisEv0Ho+c8oz+2K1zAaNbdwWisRM2Wpr8rg6emy5
	Qf6m43b1mqRoK6Rr18Dx5S1uI3RUeqIXixX1muFQ+xD82Q5m4OGIvEhLlD/Q6WQFg9vy1diTZ+x94
	0uuTXrX27wHXZccTgfKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJDzg-0012xs-0T;
	Fri, 29 Dec 2023 14:37:48 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJDzb-0012vv-2E
	for linux-riscv@lists.infradead.org;
	Fri, 29 Dec 2023 14:37:46 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6d9b37f4804so2507362b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 29 Dec 2023 06:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703860661; x=1704465461; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vWRlgwSOjDtRNsyl0UctYF1l5cwomAcgVJVuoWlsSQI=;
        b=dWnuZyDJyIUeybazp+Y/DYdPLfCFLSUKqIdIMoLYv4xR72Z3/NSJf9K7BMDumFQLgU
         649BOOYU/7Sn2+fl7bznchrTptgQohFtkFoe+yBHwoGy/VeI0fTcwAIfcQO/wL4hX+iL
         h0uDhaG/Vfy8UpBp5GhnAc7JR9wObScGnHWoHxr81mVF7yxbLlpqOog0YHFMZoZ4L9Jt
         Sp4NNAQu7RCxmsju/kiUwRfe8D6DbahDxPhZ1gp4k084lqYTKkEzodU1BYLKBw8HT8lk
         uC2UX9a2pcFYtfMOHF4lZN/DNidGeYVAvjQz8beVO6JHmjtnI9qD+YC4wP6sRJ71piqb
         t3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703860661; x=1704465461;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vWRlgwSOjDtRNsyl0UctYF1l5cwomAcgVJVuoWlsSQI=;
        b=DyU9mTNlVR5fe0ShpuZbXs0UjdP5fINarM57+bFSBJ/4WjyeXfqtR6n/jZ7p4WsHG2
         DiunCjhYmTJwcgDQMdnLZQqeoJVkBxY56dvHx9k03xvaWIdYAFZWtw6m3BJdEiLfGeKP
         b+l+XRLduFaHe9DL5TS9meJkhg8Dd7kS+gJe4DKbTldPsSm3y8nOeVVmo8DJt1pO3TnO
         Kw2wOFRSsrADIq5hQbtHeL1L0STUK72mtgSoNyQJ7McVNPZhwJkVv8YA2fQJsn5lLfiZ
         utJlcmus3ERA1Zf+recufsMrf3XprXuUr4aC34UlmyHMwfFFNdOQF2LYq9HqTDxAGufE
         5ESQ==
X-Gm-Message-State: AOJu0YzPjtXrmwrOytRdKJJnNH3JRWGDP/YK0fXEej0/DR63jhDTjE32
	OhwjYgIwdM3uX69cDkIkr1FLGs8Dh1IqU0sEvOLl0g/+8TSCMa+X0QNFusuhxUxO2JQvqrPFb2U
	ZpwdlNWTjr0hW+rC5NTVOSLCVd/m52ni7NtF8h/F3qSy0SaFaLUWfFVmL/vF8lqgnj4OKaRp6Td
	qYh5FJvgn+ftGBCIVDlX97
X-Google-Smtp-Source: AGHT+IGgzoxOkULw65eJ9QryqjMf3hxeTXnICwi64OQIwlCtex/QBsNrkHZor/xIJLPz8rx+aQn+xw==
X-Received: by 2002:a05:6a20:7291:b0:196:36d2:9baf with SMTP id o17-20020a056a20729100b0019636d29bafmr5101479pzk.46.1703860660664;
        Fri, 29 Dec 2023 06:37:40 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y16-20020aa793d0000000b006d99c6c0f1fsm11544727pff.100.2023.12.29.06.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 06:37:39 -0800 (PST)
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
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Bo YU <tsu.yubo@gmail.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [v9, 05/10] riscv: lib: vectorize copy_to_user/copy_from_user
Date: Fri, 29 Dec 2023 14:36:22 +0000
Message-Id: <20231229143627.22898-6-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231229143627.22898-1-andy.chiu@sifive.com>
References: <20231229143627.22898-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_063743_727079_93153CE9 
X-CRM114-Status: GOOD (  22.35  )
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

This patch utilizes Vector to perform copy_to_user/copy_from_user. If
Vector is available and the size of copy is large enough for Vector to
perform better than scalar, then direct the kernel to do Vector copies
for userspace. Though the best programming practice for users is to
reduce the copy, this provides a faster variant when copies are
inevitable.

The optimal size for using Vector, copy_to_user_thres, is only a
heuristic for now. We can add DT parsing if people feel the need of
customizing it.

The exception fixup code of the __asm_vector_usercopy must fallback to
the scalar one because accessing user pages might fault, and must be
sleepable. Current kernel-mode Vector does not allow tasks to be
preemptible, so we must disactivate Vector and perform a scalar fallback
in such case.

The original implementation of Vector operations comes from
https://github.com/sifive/sifive-libc, which we agree to contribute to
Linux kernel.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog v8:
 - fix no-mmu build
Changelog v6:
 - Add a kconfig entry to configure threshold values (Charlie)
 - Refine assembly code (Charlie)
Changelog v4:
 - new patch since v4
---
 arch/riscv/Kconfig                      |  8 ++++
 arch/riscv/include/asm/asm-prototypes.h |  4 ++
 arch/riscv/lib/Makefile                 |  6 ++-
 arch/riscv/lib/riscv_v_helpers.c        | 44 ++++++++++++++++++++++
 arch/riscv/lib/uaccess.S                | 10 +++++
 arch/riscv/lib/uaccess_vector.S         | 50 +++++++++++++++++++++++++
 6 files changed, 121 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/lib/riscv_v_helpers.c
 create mode 100644 arch/riscv/lib/uaccess_vector.S

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 95a2a06acc6a..3c5ba05e8a2d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -525,6 +525,14 @@ config RISCV_ISA_V_DEFAULT_ENABLE
 
 	  If you don't know what to do here, say Y.
 
+config RISCV_ISA_V_UCOPY_THRESHOLD
+	int "Threshold size for vectorized user copies"
+	depends on RISCV_ISA_V
+	default 768
+	help
+	  Prefer using vectorized copy_to_user()/copy_from_user() when the
+	  workload size exceeds this value.
+
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index 6db1a9bbff4c..be438932f321 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -11,6 +11,10 @@ long long __ashlti3(long long a, int b);
 
 #ifdef CONFIG_RISCV_ISA_V
 
+#ifdef CONFIG_MMU
+asmlinkage int enter_vector_usercopy(void *dst, void *src, size_t n);
+#endif /* CONFIG_MMU  */
+
 void xor_regs_2_(unsigned long bytes, unsigned long *__restrict p1,
 		 const unsigned long *__restrict p2);
 void xor_regs_3_(unsigned long bytes, unsigned long *__restrict p1,
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 494f9cd1a00c..c8a6787d5827 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -6,9 +6,13 @@ lib-y			+= memmove.o
 lib-y			+= strcmp.o
 lib-y			+= strlen.o
 lib-y			+= strncmp.o
-lib-$(CONFIG_MMU)	+= uaccess.o
+ifeq ($(CONFIG_MMU), y)
+lib-y				+= uaccess.o
+lib-$(CONFIG_RISCV_ISA_V)	+= uaccess_vector.o
+endif
 lib-$(CONFIG_64BIT)	+= tishift.o
 lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 lib-$(CONFIG_RISCV_ISA_V)	+= xor.o
+lib-$(CONFIG_RISCV_ISA_V)	+= riscv_v_helpers.o
diff --git a/arch/riscv/lib/riscv_v_helpers.c b/arch/riscv/lib/riscv_v_helpers.c
new file mode 100644
index 000000000000..6cac8f4e69e9
--- /dev/null
+++ b/arch/riscv/lib/riscv_v_helpers.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2023 SiFive
+ * Author: Andy Chiu <andy.chiu@sifive.com>
+ */
+#include <linux/linkage.h>
+#include <asm/asm.h>
+
+#include <asm/vector.h>
+#include <asm/simd.h>
+
+#ifdef CONFIG_MMU
+#include <asm/asm-prototypes.h>
+#endif
+
+#ifdef CONFIG_MMU
+size_t riscv_v_usercopy_threshold = CONFIG_RISCV_ISA_V_UCOPY_THRESHOLD;
+int __asm_vector_usercopy(void *dst, void *src, size_t n);
+int fallback_scalar_usercopy(void *dst, void *src, size_t n);
+asmlinkage int enter_vector_usercopy(void *dst, void *src, size_t n)
+{
+	size_t remain, copied;
+
+	/* skip has_vector() check because it has been done by the asm  */
+	if (!may_use_simd())
+		goto fallback;
+
+	kernel_vector_begin();
+	remain = __asm_vector_usercopy(dst, src, n);
+	kernel_vector_end();
+
+	if (remain) {
+		copied = n - remain;
+		dst += copied;
+		src += copied;
+		goto fallback;
+	}
+
+	return remain;
+
+fallback:
+	return fallback_scalar_usercopy(dst, src, n);
+}
+#endif
diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 3ab438f30d13..a1e4a3c42925 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -3,6 +3,8 @@
 #include <asm/asm.h>
 #include <asm/asm-extable.h>
 #include <asm/csr.h>
+#include <asm/hwcap.h>
+#include <asm/alternative-macros.h>
 
 	.macro fixup op reg addr lbl
 100:
@@ -11,6 +13,13 @@
 	.endm
 
 SYM_FUNC_START(__asm_copy_to_user)
+#ifdef CONFIG_RISCV_ISA_V
+	ALTERNATIVE("j fallback_scalar_usercopy", "nop", 0, RISCV_ISA_EXT_v, CONFIG_RISCV_ISA_V)
+	REG_L	t0, riscv_v_usercopy_threshold
+	bltu	a2, t0, fallback_scalar_usercopy
+	tail enter_vector_usercopy
+#endif
+SYM_FUNC_START(fallback_scalar_usercopy)
 
 	/* Enable access to user memory */
 	li t6, SR_SUM
@@ -181,6 +190,7 @@ SYM_FUNC_START(__asm_copy_to_user)
 	sub a0, t5, a0
 	ret
 SYM_FUNC_END(__asm_copy_to_user)
+SYM_FUNC_END(fallback_scalar_usercopy)
 EXPORT_SYMBOL(__asm_copy_to_user)
 SYM_FUNC_ALIAS(__asm_copy_from_user, __asm_copy_to_user)
 EXPORT_SYMBOL(__asm_copy_from_user)
diff --git a/arch/riscv/lib/uaccess_vector.S b/arch/riscv/lib/uaccess_vector.S
new file mode 100644
index 000000000000..7bd96cee39e4
--- /dev/null
+++ b/arch/riscv/lib/uaccess_vector.S
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <linux/linkage.h>
+#include <asm-generic/export.h>
+#include <asm/asm.h>
+#include <asm/asm-extable.h>
+#include <asm/csr.h>
+
+#define pDst a0
+#define pSrc a1
+#define iNum a2
+
+#define iVL a3
+
+#define ELEM_LMUL_SETTING m8
+#define vData v0
+
+	.macro fixup op reg addr lbl
+100:
+	\op \reg, \addr
+	_asm_extable	100b, \lbl
+	.endm
+
+SYM_FUNC_START(__asm_vector_usercopy)
+	/* Enable access to user memory */
+	li t6, SR_SUM
+	csrs CSR_STATUS, t6
+
+loop:
+	vsetvli iVL, iNum, e8, ELEM_LMUL_SETTING, ta, ma
+	fixup vle8.v vData, (pSrc), 10f
+	fixup vse8.v vData, (pDst), 10f
+	sub iNum, iNum, iVL
+	add pSrc, pSrc, iVL
+	add pDst, pDst, iVL
+	bnez iNum, loop
+
+.Lout_copy_user:
+	/* Disable access to user memory */
+	csrc CSR_STATUS, t6
+	li	a0, 0
+	ret
+
+	/* Exception fixup code */
+10:
+	/* Disable access to user memory */
+	csrc	CSR_STATUS, t6
+	mv	a0, iNum
+	ret
+SYM_FUNC_END(__asm_vector_usercopy)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
