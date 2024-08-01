Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561D5C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 13:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s7Dhdgo+Vjn3eMroIX2RnRQ1SIsBE2ZLgTGaFhBlQgs=; b=gtAAVdR2cOioPP
	TvyD2g01FPrBflm+imfUo3lt3VMOwgJmTWEMpjTW0TOmgGdnBt96Y0RLB7uGeGdET9xWnU14X8yBm
	t5zYHqZ2X3KWuc8rrmAXU02/tHrUVmMiO7iZ+oI32T5Jugl1+KXU/RQMIfZArEzYpa5RI0LTL9nlY
	30atTGQL7kCykSDC/RfW9mEGEy48GF/4VlrfNRJnyJSnSKrzL4gQH+5cjXYGBmYcNvModxLXys3WF
	QEpXBYrGjBE9nQxHlBHKsXxURJHFkbHG5qiun3tOyQVuejEZewGitynavvIvMPGPWofo091aYh5KM
	1a8qhJ9CZCo5U1EAudfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVRb-00000005KlP-28Vz;
	Thu, 01 Aug 2024 13:02:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVNg-00000005I4v-2Vg8;
	Thu, 01 Aug 2024 12:58:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0E21462898;
	Thu,  1 Aug 2024 12:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BEEFC4AF0A;
	Thu,  1 Aug 2024 12:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722517087;
	bh=pr/SL5aXRHkEgbL61YT0WXgEv0CY13vhmdtve/jq07s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FJCzDaYTgHGPGRDGs3q91BDDMkyJYNXJ9l28iaaR4G/ZjvUUEUMEofxFR4EGbzrWK
	 i7Ek/16URKLtwBc1hlMafY9YbSCGkquoX8rmFRCQ08rDxXFcDaR//nlZGW2QUEks1O
	 HkFrj/gtGwWhWmpKSFsMS0n7QJdSe39Rzd6bhdG/8xKdSyOrts5Y/UKs3pOmNFqsRQ
	 p48zboodXYB+6JXyVyxXF88GjyncMrpns+MDgNcJmtbK+ow9aQcBXNU2qrpqfqMQjT
	 JjbdUytErk0J5QKWnXBEHc+ocova9NSO9/K7+/G0NOjVKONSV7LnqmxJbitAFz3DtP
	 l2/FJGAFfHG+A==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 01 Aug 2024 13:06:34 +0100
Subject: [PATCH v10 07/40] arm64/gcs: Add manual encodings of GCS
 instructions
MIME-Version: 1.0
Message-Id: <20240801-arm64-gcs-v10-7-699e2bd2190b@kernel.org>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
In-Reply-To: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
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
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=openpgp-sha256; l=2643; i=broonie@kernel.org;
 h=from:subject:message-id; bh=pr/SL5aXRHkEgbL61YT0WXgEv0CY13vhmdtve/jq07s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmq4YL5wsbsXpFLEnxHz0MZq4t/+nYJjX+FBLrDs1/
 N1KvKSeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZquGCwAKCRAk1otyXVSH0ORxB/
 9s11x3nh7dQHtvX3MMe4dfLF77kaKt9nnh2hUEcXu6pG5/rLpFfae/LeU0oemP87Wwg8VI3Rc8GZA1
 XFkfxYlXExPjnMj0q6PPaQ0GnI2ZFQ6xacPuGxoci7j79eZ6kxTRtRqol84eilLhP7ZofZtyUUnUaE
 CgzAkdr1bWGZLN++CxGV4YpKBICjj9LkdFKvT1HKMy8kwZklzUdGFEmbtBdk7rCi+m9P+PL0+g0prg
 uoVSgcUxvlnAu+/F8PQHPb/kvMXP1g0Ks4yKPB/nx0om9RFyY1BdkBB3EAo908dARyobtvzN6MaU5w
 Rl0zghQtR3bcLuKNMEY3/pLk1ooTRF
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_055808_947843_5DE4FC32 
X-CRM114-Status: GOOD (  16.18  )
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
index 28f665e0975a..6aba10e38d1c 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -502,4 +502,26 @@ static inline size_t probe_subpage_writeable(const char __user *uaddr,
 
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
