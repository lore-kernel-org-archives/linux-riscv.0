Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DADC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 15:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iNcDnMzmFiOYjbMEGzzZR28XTCCPFQ9ENgGkkd2kiXc=; b=Nx8TZB1becGoBy
	VQeHJftAzZrf5ocnpuU1IdLxIDnS7hNKqjgb1ZID8c0ywmu1f5Nf+L9QdMD817p92hyhv4YZMc+yQ
	8A532ZYO9giolk5tYG0WsdB0y9SPjVYbRiaMB3FPnAKgEv06vD99YGTNzljJDT7JRPVCqNA+LVWN3
	P1zH/h3Zy375HObuyovRCZ6adaJqGIBmLgDJewEOwityylN+JHPjdiudB2FgST/n0MTPxwfjdS3uF
	Q6onEAV+HP5hgTQYCKOm9Z7Eno1makNmJvDs11ZNke0gC2iILsh8kbOoGkuDAYsj7NJ2qAzYM5urN
	JU7ow1qTRN9dRKHpunYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDo6z-000jU3-3C;
	Thu, 14 Dec 2023 15:58:57 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDo6w-000jSu-2i
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 15:58:56 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d3448937ddso18620505ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 07:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702569533; x=1703174333; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JZ524jmI8bMaL86E7Kn95OVAwtI8eSUFYhWVmFuBQIE=;
        b=QwRiMfy91ahb2oyIpKa+sccjBw/gELGDb3W6f8xtkykx2zxtvhPnKc7ylaETtOcM6N
         DuBEOMHas2tXxJI0ZZProRfPCAmplVOM89MWzx5YglWWXQw296dnykqGUaeZ+Hg7wBzD
         auqWlyKbhHhkiW6ci/Wjge272ZMUw+qQjLiJ2tvP+8+U4/2q6Pda8xaE3StWptbnmPgv
         6gYpB1CcK6GuXPutNwFLrrj7eqX+HBPHZoAjKKCYvKkwh07BUW9VngaAbKsuS7qCxkyw
         GA3RE9C0/z/sOa0NW5pddpH2ziV322TaVylTlMp1sEGSyUYzw0a64or6APKr5jLrEpHB
         awYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702569533; x=1703174333;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JZ524jmI8bMaL86E7Kn95OVAwtI8eSUFYhWVmFuBQIE=;
        b=e7GvcJGpMwYXdpZLFDk5Q6PNWU9rTAOgd+uDRxJYn9YdqjwgGpxYQUUKjoNNCPBKmi
         f9yUsUeQUBonJ8NgRHjWauLxON1zUJp8fcKO8n/aPJzhqInbZUtwUB65C0APqfDOrWBF
         vVEGndRYsFxbeCmq7SbhaN/s+GRZ1xV8plb+1me+hN6CO4kHGMg8K27LWO17A96E78Ww
         7+Ftg4EQTMiRi98ZsgXwVAcjp7CRuuFr8HvCsNx3/1adX7e6CCqd/YcVKAXp5wiawmWT
         LzS3bYmonMmwNvsCrMBAkDWtPkVEtM/xyAiRPBu8qPQyhtA5K0aI1CSrUaO5SFGSGa3k
         Ohqw==
X-Gm-Message-State: AOJu0Yxyo+MNN4wdDb9DBVlH1+LrIITHCe9aMBCnP10AmBVS+jNmIBj6
	26q9YvxLlkFElZGqUpwAokcmq8kges5flySGDL90Idexy6Z6xweh7uXku5kuHi/Ry7tgJzFN0Ar
	xUWVh8f/oFaiMZB0/WjWznzjnIsK8ewJCOSWLz/KN+dSrSVFsbpY4QpuDUiKwSnwYpE7SJ+A2Zm
	0HvZMjoE+KjDd2
X-Google-Smtp-Source: AGHT+IHBT/C+p5V968+xKuIBZxr9LHaRjBPZ6X7veXDtR2XdXwzYNmPLnwyY4U84MEXz2EIDBN6dCg==
X-Received: by 2002:a17:903:32c6:b0:1d0:c6a6:10e4 with SMTP id i6-20020a17090332c600b001d0c6a610e4mr6446907plr.27.1702569533116;
        Thu, 14 Dec 2023 07:58:53 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id f4-20020a170902e98400b001d35223d0besm3320799plb.251.2023.12.14.07.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 07:58:52 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	charlie@rivosinc.com,
	ardb@kernel.org,
	arnd@arndb.de,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bo YU <tsu.yubo@gmail.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [v5, 5/6] riscv: lib: vectorize copy_to_user/copy_from_user
Date: Thu, 14 Dec 2023 15:57:20 +0000
Message-Id: <20231214155721.1753-6-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231214155721.1753-1-andy.chiu@sifive.com>
References: <20231214155721.1753-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_075854_880049_E95B7068 
X-CRM114-Status: GOOD (  19.68  )
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
Changelog v4:
 - new patch since v4
---
 arch/riscv/lib/Makefile          |  2 ++
 arch/riscv/lib/riscv_v_helpers.c | 38 ++++++++++++++++++++++
 arch/riscv/lib/uaccess.S         | 11 +++++++
 arch/riscv/lib/uaccess_vector.S  | 55 ++++++++++++++++++++++++++++++++
 4 files changed, 106 insertions(+)
 create mode 100644 arch/riscv/lib/riscv_v_helpers.c
 create mode 100644 arch/riscv/lib/uaccess_vector.S

diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 494f9cd1a00c..1fe8d797e0f2 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -12,3 +12,5 @@ lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 lib-$(CONFIG_RISCV_ISA_V)	+= xor.o
+lib-$(CONFIG_RISCV_ISA_V)	+= riscv_v_helpers.o
+lib-$(CONFIG_RISCV_ISA_V)	+= uaccess_vector.o
diff --git a/arch/riscv/lib/riscv_v_helpers.c b/arch/riscv/lib/riscv_v_helpers.c
new file mode 100644
index 000000000000..d763b9c69fb7
--- /dev/null
+++ b/arch/riscv/lib/riscv_v_helpers.c
@@ -0,0 +1,38 @@
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
+size_t riscv_v_usercopy_thres = 768;
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
diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 3ab438f30d13..ae8c1453cfcf 100644
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
@@ -11,6 +13,14 @@
 	.endm
 
 SYM_FUNC_START(__asm_copy_to_user)
+#ifdef CONFIG_RISCV_ISA_V
+	ALTERNATIVE("j fallback_scalar_usercopy", "nop", 0, RISCV_ISA_EXT_v, CONFIG_RISCV_ISA_V)
+	la	t0, riscv_v_usercopy_thres
+	REG_L	t0, (t0)
+	bltu	a2, t0, fallback_scalar_usercopy
+	tail enter_vector_usercopy
+#endif
+SYM_FUNC_START(fallback_scalar_usercopy)
 
 	/* Enable access to user memory */
 	li t6, SR_SUM
@@ -181,6 +191,7 @@ SYM_FUNC_START(__asm_copy_to_user)
 	sub a0, t5, a0
 	ret
 SYM_FUNC_END(__asm_copy_to_user)
+SYM_FUNC_END(fallback_scalar_usercopy)
 EXPORT_SYMBOL(__asm_copy_to_user)
 SYM_FUNC_ALIAS(__asm_copy_from_user, __asm_copy_to_user)
 EXPORT_SYMBOL(__asm_copy_from_user)
diff --git a/arch/riscv/lib/uaccess_vector.S b/arch/riscv/lib/uaccess_vector.S
new file mode 100644
index 000000000000..5bebcb1276a2
--- /dev/null
+++ b/arch/riscv/lib/uaccess_vector.S
@@ -0,0 +1,55 @@
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
+#define pDstPtr a4
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
+	/* Save for return value */
+	mv	t5, a2
+
+	mv pDstPtr, pDst
+loop:
+	vsetvli iVL, iNum, e8, ELEM_LMUL_SETTING, ta, ma
+	fixup vle8.v vData, (pSrc), 10f
+	fixup vse8.v vData, (pDstPtr), 10f
+	sub iNum, iNum, iVL
+	add pSrc, pSrc, iVL
+	add pDstPtr, pDstPtr, iVL
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
