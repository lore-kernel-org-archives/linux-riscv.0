Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2D8C3064D
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 15:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zZFxx5mEe1D7KfRYKWspTYg2OZ4exyCrKb2aX4rTpUg=; b=wnr2KoG9kPTokq
	rNn3GEbQ7D9/ERmkqciBu8bBOpr2PVjwZAc5KB3W27l59E+XFc8LdBklgkqOh1Vs610lVQ56hDAOo
	sDL9XPu/dLO96bvgr9wLeu3vOHFlcjnnWKFKm9muPwqNbWHHWbsWVaJWI1E3tfUgWMoSMFpYiz3rH
	LLFSTkCTJ/ktx58VsudVESI1049HGzDCJqftdPUd01BZl/8/NWxuP2Z5/i/fbXiAC+CDXWJrO7mdu
	8kmye4Nv4NE0frK2cOWgu8QZIgFir+SAs5P9SQjWd4xbBTH+1y8VCj5Npzb70ozPkACu3DvtH223y
	39tcc62RraEnusoO2mVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7gS-00000003KH4-2Xlh;
	Tue, 25 Jun 2024 15:02:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7fo-00000003JhF-0Zgy;
	Tue, 25 Jun 2024 15:01:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 56ED36146C;
	Tue, 25 Jun 2024 15:01:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A8EC32782;
	Tue, 25 Jun 2024 15:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719327691;
	bh=FZl6osZQv9tUt2U/ynTpAvRjKv0nX8jhIzHo4KZI7Xc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LB1z0uLCfALEQBxZq3EKZVaHBNY3stJUGGS33HnAF+qvGORdfESqvZIYxkj7bv+HS
	 L54U6Iv2tOs7j44tOE4h84EJHGTDTjVlcLQ66TCpZjGdtamPPWx+W+Bk/1zpl79jTs
	 jEkOH3pcuJ9K8R5CN7nTj8KGgEESCqUdR3u1CW3/JZ+hI+fOukZ6IgdLE8QPpSaRSl
	 Mk3jTJZCntx0mFGHWhgYC7NFHGichd3Kt/0PHDAD4/TAgKu2FgqexAejVK5n7sGLxs
	 3Wwr+VUqSM/UeLdYhiOS9WB70a43AdK2D82QFbm3y+bMh8yXGTcW6K9Wkz8IKHsBlm
	 UnY7K7gsZV2sw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 25 Jun 2024 15:57:35 +0100
Subject: [PATCH v9 07/39] arm64/gcs: Add manual encodings of GCS
 instructions
MIME-Version: 1.0
Message-Id: <20240625-arm64-gcs-v9-7-0f634469b8f0@kernel.org>
References: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
In-Reply-To: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 Ross Burton <ross.burton@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.14-dev-d4707
X-Developer-Signature: v=1; a=openpgp-sha256; l=2643; i=broonie@kernel.org;
 h=from:subject:message-id; bh=FZl6osZQv9tUt2U/ynTpAvRjKv0nX8jhIzHo4KZI7Xc=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhrSq2+XPXm/0bpVzD/k8YQlf0IX13+pntU0rfHD/iHhl8g2+
 bCazTkZjFgZGLgZZMUWWtc8yVqWHS2yd/2j+K5hBrEwgUxi4OAVgIh/bOBjaedu9c59WSqjki3yWWS
 WkUBj+trxszfmbhX3ln+cJShS8Cf0lqbfX6VfE3P7yG7qM5zdnnxDcNe9lvfSEMtXr+wyKs4KnPrjO
 03bX9I920aOcdusdTDx8LEfvPJc1S5Bz4Jy27qW2XSfTifyd9orsthH/duhkuLbstLrrWjLxtWfwzk
 6TSn9Fq1bVzi+rtRec4WJ5YrXh/5FvbypfOEwRnKmmf5YhbIl8RkBTI0+Vo70zt8D2Rc9+x0nrhWux
 r9w2U1Q0s4QjMOj/WnnbwBuuEyavaqiPEJ/ixn6mNC70/Lm+SL2s3r87+cOPFieUOHbynL2RzijscI
 z1zj19gUM/3++5eqSDT/FKbYIsAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_080132_531954_081F5358 
X-CRM114-Status: GOOD (  15.70  )
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

Define C callable functions for GCS instructions used by the kernel. In
order to avoid ambitious toolchain requirements for GCS support these are
manually encoded, this means we have fixed register numbers which will be
a bit limiting for the compiler but none of these should be used in
sufficiently fast paths for this to be a problem.

Note that GCSSTTR is used to store to EL0.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/gcs.h     | 51 ++++++++++++++++++++++++++++++++++++++++
 arch/arm64/include/asm/uaccess.h | 22 +++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/arch/arm64/include/asm/gcs.h b/arch/arm64/include/asm/gcs.h
new file mode 100644
index 000000000000..7c5e95218db6
--- /dev/null
+++ b/arch/arm64/include/asm/gcs.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 ARM Ltd.
+ */
+#ifndef __ASM_GCS_H
+#define __ASM_GCS_H
+
+#include <asm/types.h>
+#include <asm/uaccess.h>
+
+static inline void gcsb_dsync(void)
+{
+	asm volatile(".inst 0xd503227f" : : : "memory");
+}
+
+static inline void gcsstr(u64 *addr, u64 val)
+{
+	register u64 *_addr __asm__ ("x0") = addr;
+	register long _val __asm__ ("x1") = val;
+
+	/* GCSSTTR x1, x0 */
+	asm volatile(
+		".inst 0xd91f1c01\n"
+		:
+		: "rZ" (_val), "r" (_addr)
+		: "memory");
+}
+
+static inline void gcsss1(u64 Xt)
+{
+	asm volatile (
+		"sys #3, C7, C7, #2, %0\n"
+		:
+		: "rZ" (Xt)
+		: "memory");
+}
+
+static inline u64 gcsss2(void)
+{
+	u64 Xt;
+
+	asm volatile(
+		"SYSL %0, #3, C7, C7, #3\n"
+		: "=r" (Xt)
+		:
+		: "memory");
+
+	return Xt;
+}
+
+#endif
diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 14be5000c5a0..22e10e79f56a 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -425,4 +425,26 @@ static inline size_t probe_subpage_writeable(const char __user *uaddr,
 
 #endif /* CONFIG_ARCH_HAS_SUBPAGE_FAULTS */
 
+#ifdef CONFIG_ARM64_GCS
+
+static inline int gcssttr(unsigned long __user *addr, unsigned long val)
+{
+	register unsigned long __user *_addr __asm__ ("x0") = addr;
+	register unsigned long _val __asm__ ("x1") = val;
+	int err = 0;
+
+	/* GCSSTTR x1, x0 */
+	asm volatile(
+		"1: .inst 0xd91f1c01\n"
+		"2: \n"
+		_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %w0)
+		: "+r" (err)
+		: "rZ" (_val), "r" (_addr)
+		: "memory");
+
+	return err;
+}
+
+#endif /* CONFIG_ARM64_GCS */
+
 #endif /* __ASM_UACCESS_H */

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
