Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F70C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 13:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P3vJEJOLODeGo+tDS5C53TTJk2328qv5CLHz6swLN6U=; b=EfU2ZRsnQ/67Pa
	GitzyFzQkQcX1OZ5BUudzfrT6VsHw9Pv3K1JLMVICwuzraJ4UlGyipADVXSzgKHzaNyiQrDb3n+ns
	ubIjXN1FYKJhaQgqngllVh6ssDIOZhDmcwCbgIN64sq96MGPIYsaKx9o4UdkEjZHkET4fmVFOXs0j
	BB4DKJlg899Zag0YwyfdGmSOtUKyJKgYp00j0eXh5XBnkGP7vTYytGXwieq9QI22lUG4i9Qygr/08
	TOw0+FhkHWYFqKi6s4yApdr2xKPsJxMPxIO3746ZZ7bYXlLd/xFXUhfzlIWWuvbzqOagHvajjaaj3
	2Pev6Xa2SSk37BnqPTaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVbt-00000005QZG-0mSc;
	Thu, 01 Aug 2024 13:12:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVPr-00000005Jb2-2ehX;
	Thu, 01 Aug 2024 13:00:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 12FE2628A3;
	Thu,  1 Aug 2024 13:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A461EC4AF09;
	Thu,  1 Aug 2024 13:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722517222;
	bh=jCz9TB/T2gtL+Dj1sBbCVvFYWqxLMS2lgt+ihDoyD98=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Zdk/HN3Vv5MCR9tWdyaa/VEftixl5lcXiTlx9bdPKbc6eaT3FWEIZma95Z+GhffvM
	 EcnEtjxjUMY7BtJNNzPCC7DDT43xLDYiM+AZJdYOlDlAIPK9JiTcxM9ZYM42+e7C+U
	 9M+FRULwYAKFy9B+Z/awaXXUyELOAV1XBrU0mp4w/mkVPsn/eOz7VKSFLsmAIwwW7B
	 lew6XfI7DwPM58JgIGVw2nkB0gIogzXMI6WGBoekN/T1iW0VC3dDiHWS29AQH9c6VV
	 IV9oIsnZ+4eQBNTMn/6CGQLJ5TBXgVfn0mxsqA1OzKNu7nMhgKP1rnDfsJkBxLzSKi
	 FYf/bx/yCadnw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 01 Aug 2024 13:06:53 +0100
Subject: [PATCH v10 26/40] arm64: Add Kconfig for Guarded Control Stack
 (GCS)
MIME-Version: 1.0
Message-Id: <20240801-arm64-gcs-v10-26-699e2bd2190b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jCz9TB/T2gtL+Dj1sBbCVvFYWqxLMS2lgt+ihDoyD98=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmq4YaZfoQpmqEUbybjMAYNvLQbJaJ5ach0jFFKMwt
 WAXMRf6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZquGGgAKCRAk1otyXVSH0GzQB/
 0VUEM5IVaWGWCtsoHGuHQHdtM8+bn0nEmmu8lC+oIKaYCzNy9VMZzgyUqowYnTd7bPlWUz/Y86I44V
 RwpJj/EKex2ZFhiaMSKwZKk5ZycQwwdhmGqd8wkhELOTAU5tPmelrk1C5oPSDSLU5/cK5yCygjrcBh
 KSD25yGvlDBzmQwU8A2hU2FXizsVvxQGd/XPIkN4qnQLAWZKEaHYFH8a475LGnHg8uUfsFCToCPjWh
 6YUfe9z6iCQUb0w218AdqDzqriKwGOuLBU2jkxLaydWomcfvewT1WWRsu2cMVLqUa0d9CiOZRK5wBg
 Uww68Gf9sKSJ6c/5O3iLSaPKkTUUYX
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_060023_864618_B0928AF6 
X-CRM114-Status: GOOD (  12.38  )
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
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/Kconfig | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b3fc891f1544..83e27857bc6a 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2127,6 +2127,26 @@ config ARM64_EPAN
 	  if the cpu does not implement the feature.
 endmenu # "ARMv8.7 architectural features"
 
+menu "v9.4 architectural features"
+
+config ARM64_GCS
+	bool "Enable support for Guarded Control Stack (GCS)"
+	default y
+	select ARCH_HAS_USER_SHADOW_STACK
+	select ARCH_USES_HIGH_VMA_FLAGS
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
