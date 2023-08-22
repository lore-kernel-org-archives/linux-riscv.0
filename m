Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2987EE49A4
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 14:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f1RFBiQLkyRZMVMnIEYTyEsPmmIyv5+gReTOxNmx/04=; b=DCAITGD6pOBosU
	v3Gf0gVufvyOjgJbFQ9rAGXrR/fhve/Z4yD1DPHQXjq4v6N2xgNdZKlNrhL7ipXOYQJtGEHEtCAHe
	XR0U/Z//8hs0QpdDab9grim2rbtonKUW0XxHJRMWgI4v303hqa6s6YkqQxyWhx05a5BRLjaJsPfYl
	1Fo0kYZrCgD9uZhddGxiDieVTFSKkGjOb9d9x3quDpDFIfE0IDFbTctTNCKByi3Qn6V0qYHSWRGCL
	5Xo4GB7n+935cHANdgLGQwEa57TKxEDVos4gfZqk7aUvyTqf3dCzWeogWjyYpwtn7Qd6baIgzcNw6
	VmDZ2Ssl9ZUiVHtVSSyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRzJ-00G6eX-3A;
	Tue, 22 Aug 2023 14:04:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRz1-00G6OJ-1z;
	Tue, 22 Aug 2023 14:03:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1AA4D65331;
	Tue, 22 Aug 2023 14:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 960CDC433CB;
	Tue, 22 Aug 2023 14:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692713026;
	bh=sadX6jRs7DdBAThhpdGK2D3phr2V3dLQCMXle4b8GlY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KKzlO3Qq+PRK+tbHucKMd0ag4RDplna76NIOOKLqQ3Y6/CZZN72W14ML8g+RKfDOe
	 qBX9bKAGlIhs2TZphzMa/zy7XFNwG1XUEv0xeqYLbDKjjUXNjZtfaUWSXEV83TJacK
	 pZLKyLzKmfCLNNe4GYOJTZ1ZWfMQw1rY9Vdn6WzDIvsHAZyc6wamZ0twqeAmdfSQZz
	 7dsGLPM/jQRlY/w55J307Fr8CQHDRMwFhB9J1ca5QJVdMRHfYkZylBu6aDMfAdNekG
	 9kTGLiaf/rDXpqE2mt7bznqV/Joz6xLj5wHbQPgWgtyr0DSYx8sAZv328FvOuNFhGN
	 +6LFrr1ySqcxg==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 22 Aug 2023 14:56:40 +0100
Subject: [PATCH v5 07/37] arm64/gcs: Add manual encodings of GCS
 instructions
MIME-Version: 1.0
Message-Id: <20230822-arm64-gcs-v5-7-9ef181dd6324@kernel.org>
References: <20230822-arm64-gcs-v5-0-9ef181dd6324@kernel.org>
In-Reply-To: <20230822-arm64-gcs-v5-0-9ef181dd6324@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-034f2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2577; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sadX6jRs7DdBAThhpdGK2D3phr2V3dLQCMXle4b8GlY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBk5L/1IzIK9b4CT61C11bXtYUumI20KBT+NviAf5QW
 KmkUc7CJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZOS/9QAKCRAk1otyXVSH0EadB/
 4pbEQ68xNEsXlzqT+FKSx4l2VDqcaSxDznurZmF3wiwHsUGqukXt4UPUqfjBdqJi6Oym5H3SsAnkPw
 goVhDlUrA1e9Ismj4oLhvp6filQQGx+V21HAV0F//QE8/vChISGpHJoYB3Bn+wHHjjf03fiAMCbVI6
 bzOzlliwqLz0/itkNVmJ3by1VWsVogv/zJPz/owBZFe0T7q7q6P1bbeT8dAzSy6P7USzLBAsGsPl56
 IuKF/2r9i/kopR0473dAcyso/W1OEYo9/K54E52GCXR5fWqThIcllYOYye86S7wqt/kB4IqhS0rny5
 H5YWc3aMj80CfrlzlUdxQlWDKP6+Mn
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_070347_755273_D3A2337A 
X-CRM114-Status: GOOD (  17.08  )
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
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
