Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8D7C52D54
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 13:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ofe/h+TJPkRPdEfdUBCrjBZF9GeT6UNvr1gTs2VPXYs=; b=Q1of0qMJ6t2y+x
	pmHxO7rIGvRGvG1gqtfuBmGMGO2noa2q3+86D9gmvWxGnvOgQiKmmgGijWCQeP6iySsrLegxCQFYQ
	u6SD2360vxfHCoq5DnKv25vemc1WM5hcvNUTak5F58BZQc/sPeeWZXatWQlJz2HYGTvI1mBV+SMXe
	3LWcwqMBqKARlmaU3Ae25qqsWd499sV59/jGT1E93DiVJ0WrJek5Z4yZsjU6nqfwJ/cPP14TES+C8
	gKquluvv+oWe3FSLZ41TQejLKRu/Ozrr16Uc4vmZS/LsEYNx29QJEoFVDwbRkRxBhbouFp1N2Us17
	1JcKVMkJBABIqFPHok+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVR2-00000005KP6-3a4x;
	Thu, 01 Aug 2024 13:01:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVNZ-00000005I0D-315o;
	Thu, 01 Aug 2024 12:58:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2D5416288A;
	Thu,  1 Aug 2024 12:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805F3C4AF09;
	Thu,  1 Aug 2024 12:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722517080;
	bh=mym7o+ur4BbRj2ASFXSNRXGOKmfB+ZB4m72hLojRIa4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Nmdd/qNOML0/WPSvFlhfPlPFhdWGDTeOehxKcqEpf3pUgk0DTgPcT6ho75GI2cH9s
	 V9oFZAomCWM0OIH2upCKRhoVP+5d6N4VQz42KdMbbc4TAEQVeCDdkKwlswhdSkRwAr
	 FUwVvQ9Z5lz/jE9sI8/DeuUqEy3W8GI6QftvN7ZtKtjB9jUws7JBoCyphjvomGDTE+
	 gFO4dEugK/8+qecErZI0sCkcKJEoS5uc/mfcjfIPkHNL3rO4K7sTrnouyFxgVR5CDL
	 zLqVRlTkVNLsVVadLPewREgLENPUiZlzlh8MN1E1K1yocY/aH4Wimxuz2auCxdp3l1
	 Bpq4xZ+Uo4Upg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 01 Aug 2024 13:06:33 +0100
Subject: [PATCH v10 06/40] arm64/sysreg: Add definitions for architected
 GCS caps
MIME-Version: 1.0
Message-Id: <20240801-arm64-gcs-v10-6-699e2bd2190b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1421; i=broonie@kernel.org;
 h=from:subject:message-id; bh=mym7o+ur4BbRj2ASFXSNRXGOKmfB+ZB4m72hLojRIa4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmq4YKMuPchzO3os0nL3U57pumieXoSD2PfbwOG1FY
 wWpxjVmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZquGCgAKCRAk1otyXVSH0JfMB/
 9S5qc+5UJ2Hq5Hh2gJZcqt5fs4hfsdHKXcwoKtpDSOxKNd+hIU23vQ23YrI62hlWogX++fZin4QYDT
 GOcCwT/cOUR3m/dL5FF4voHeOJTl2W7yFsUbSOey0f99FxqtjXHVe7w7DQvQrId6oU8t/lAsclZoHZ
 tQD9TJJJqolDvO5HE+DQ0fTh6WL5GECumUAW3lISgxymu//DrManuyXVjRouei1rgDvaJfd9mEbn8K
 hxDJrekIwc19/h44xJDi+e8sukKdHBCB2IAe8SSn7rqTq8apK5NDjamIvd72m5sbmWMbwAdHsJAqjc
 1iMoQNDdS3yVBU5/TM8YlURU/7VMsc
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_055802_206632_7B22D3AF 
X-CRM114-Status: GOOD (  10.01  )
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

The architecture defines a format for guarded control stack caps, used
to mark the top of an unused GCS in order to limit the potential for
exploitation via stack switching. Add definitions associated with these.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/sysreg.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 4a9ea103817e..b8d8718a7b8b 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1077,6 +1077,26 @@
 #define POE_RXW		UL(0x7)
 #define POE_MASK	UL(0xf)
 
+/*
+ * Definitions for Guarded Control Stack
+ */
+
+#define GCS_CAP_ADDR_MASK		GENMASK(63, 12)
+#define GCS_CAP_ADDR_SHIFT		12
+#define GCS_CAP_ADDR_WIDTH		52
+#define GCS_CAP_ADDR(x)			FIELD_GET(GCS_CAP_ADDR_MASK, x)
+
+#define GCS_CAP_TOKEN_MASK		GENMASK(11, 0)
+#define GCS_CAP_TOKEN_SHIFT		0
+#define GCS_CAP_TOKEN_WIDTH		12
+#define GCS_CAP_TOKEN(x)		FIELD_GET(GCS_CAP_TOKEN_MASK, x)
+
+#define GCS_CAP_VALID_TOKEN		0x1
+#define GCS_CAP_IN_PROGRESS_TOKEN	0x5
+
+#define GCS_CAP(x)	((((unsigned long)x) & GCS_CAP_ADDR_MASK) | \
+					       GCS_CAP_VALID_TOKEN)
+
 #define ARM64_FEATURE_FIELD_BITS	4
 
 /* Defined for compatibility only, do not add new users. */

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
