Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CF7CF318B
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 23:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jdzgA8iB6SzXbQxgItjqx1Jy9sV9aZbdC8gYCwLJ3e0=; b=eBstxx1+hNjD8Y
	vgC1Yi9vINMxyIFcFdEVi3k+CX6E1vX9pqZ0CvJAsMkFUw6Dnf0OXHxODA+UpvY/uxYfUZTdtHKjF
	sD74MsBGiqSxP6Pt9N/axzKZorEQKLpjgW9UVQK3hHrdyXHCvERCnH6zPKwfMVS1g8hbo+VTcGmkw
	8gAtP7ShRbuTwkQjV3kmEjgqLfynastfq7EwrAxuyWTzxy067AagkDgl0eG4pLGXO+PDpd5ZncuZ6
	fu3b4jvQjkhVhA7wJFEVrJ1GhQOtd1dArv0Cs1UikL/AIAZxTtIlb1bnt03wTD7nyaQy5FAZ25K4R
	vn5Bo9fkbLQBNX3aNObQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svmPf-00000004NZN-2CJ1;
	Tue, 01 Oct 2024 23:36:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svlvb-00000004I65-0Dx8;
	Tue, 01 Oct 2024 23:05:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3F4535C555B;
	Tue,  1 Oct 2024 23:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2430C4CEC6;
	Tue,  1 Oct 2024 23:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727823910;
	bh=atDZEtbemNIieqZC6RtXrtbJMuxF2tLKf2K/TSJvVes=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B5J7eMmHKHd97SZEJxiVYhbNX/Ks8kJn5Nue5+50O9KQLxkG1E+ZShZeg7g74vkcV
	 A18Gq9rmhXe19Z4kUcF+pJs+Qtvsqr91+6+b7Kbsshk5rbEYcPSxMF6dM0k1CoOe1h
	 e7cF+4+kslmzvSIQSqXfflUfAQAyfMhFn+CLChMvKBH4y0HQkYfZBLgHsx4waUTth1
	 FFWq7cK+cnEGEWp6Vnhnn8l3ARtW5Mw5+nZSWMAvmkBEWfgsMfYi/qYMdxye19J2jn
	 B7Sl2jtRZqa10PTgSCq8QLQWkDF2ckA/wZ0Me+T/OCoSkGoPz9AVJA8AU9mCB+UO5i
	 YC+XhEF1TuzLw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Oct 2024 23:59:07 +0100
Subject: [PATCH v13 28/40] arm64: Add Kconfig for Guarded Control Stack
 (GCS)
MIME-Version: 1.0
Message-Id: <20241001-arm64-gcs-v13-28-222b78d87eee@kernel.org>
References: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
In-Reply-To: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
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
 Ross Burton <ross.burton@arm.com>, David Spickett <david.spickett@arm.com>, 
 Yury Khrustalev <yury.khrustalev@arm.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477; i=broonie@kernel.org;
 h=from:subject:message-id; bh=atDZEtbemNIieqZC6RtXrtbJMuxF2tLKf2K/TSJvVes=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm/H7Zc7rKkETgD5/LTaxxdr7BGJRS0qSsZjNw/txV
 r2Wuw/+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZvx+2QAKCRAk1otyXVSH0M+qB/
 91ODENwPWdKuLlElj/7OYeWGSCjN5ITwHJ4ppzWwF1BP5tpBhvEs9TuGenH2UXxcohCfUT6yjbeNU7
 BqHi1YY0+wQUtr4ulVRIVOnj1gq7q8h/tS/NBM0kzuoPNW/h3FxRY8l5bCnYAo5i4/0MKAznj5S5pL
 tj2aRrRznvG5Pj2t4m43nTUIxrTduG05Cdqisl6Txjh+LJSLhBOsiLtFeWGetiiTrHDcpNisfrWB/g
 INyNQ3jEJ06Kni4oXAI1kFQBiWcbUVqmeRHJg4jEpObnjwLN4GS3NWbsDfDtfdFgL9q0FM2zOz1vfP
 x+uZvUmrp6KnGE2kvCpjKmctHavSdF
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_160511_249252_D34BF986 
X-CRM114-Status: GOOD (  12.68  )
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

Provide a Kconfig option allowing the user to select if GCS support is
built into the kernel.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/Kconfig | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 3e29b44d2d7b..dcb12f041c13 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2178,6 +2178,27 @@ config ARCH_PKEY_BITS
 
 endmenu # "ARMv8.9 architectural features"
 
+menu "v9.4 architectural features"
+
+config ARM64_GCS
+	bool "Enable support for Guarded Control Stack (GCS)"
+	default y
+	select ARCH_HAS_USER_SHADOW_STACK
+	select ARCH_USES_HIGH_VMA_FLAGS
+	depends on !UPROBES
+	help
+	  Guarded Control Stack (GCS) provides support for a separate
+	  stack with restricted access which contains only return
+	  addresses.  This can be used to harden against some attacks
+	  by comparing return address used by the program with what is
+	  stored in the GCS, and may also be used to efficiently obtain
+	  the call stack for applications such as profiling.
+
+	  The feature is detected at runtime, and will remain disabled
+	  if the system does not implement the feature.
+
+endmenu # "v9.4 architectural features"
+
 config ARM64_SVE
 	bool "ARM Scalable Vector Extension support"
 	default y

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
