Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5478C52D6F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 01:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AhU/5mmQiZga3kQwlNTos+HzP8Kp2Oc8YwwIkJeek4E=; b=Q++T94eqtR6iVh
	luK9IT+VMB2g0h+Z1/rfwnxWeSB2CYNq6yyMU7x/dlgLCF3xmCgJVXkgHU0hmNm0ocAGiqPNBzEFv
	j1feW0OloRIJG3ZtNjg1g7wBgkSN9ib/f1RVpmi9iOVKBFU9ifh0CxVFkYKpDUfoUR8Z8qotMkoin
	2V9Lrdsp5joOG5ZtT11Nf5IiZYH9qsD2jkrEs0WlZ2Ib8CrjO6OG6LKJWHWpiXS1JuxFBP2oxfPI0
	w3kqTnDUMbGpscqI5cEIpYF/zvaCmOPMgzuSHjZbu6WguehSW8R0TgAF9OJjQ2Fx0V0O6PcBGRb4B
	uAvTI/mb/NnQjcX5fLSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwVO-0000000AsuG-15At;
	Thu, 22 Aug 2024 01:20:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwRm-0000000Ar5o-26Lk;
	Thu, 22 Aug 2024 01:17:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D8B79A42102;
	Thu, 22 Aug 2024 01:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4565C32781;
	Thu, 22 Aug 2024 01:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724289425;
	bh=LciwolFLXXLWXDnsivqPJlAtVDmmbm43hS6WTnUcp7s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ia0J7+D2NFXEmERA4MzAXLz1pGlb+558E6HkoadFLR+MbUfLle7EFSSmcioe5NUwP
	 FtkqMMdEx9UsBRQ/qORfUHBOsxA7OKwseQ/vNExKFBliIoDiDApWvzNXNmGrKWwGNu
	 r0yFtmaQOxeXmR0XePqzegx7CFhuusQYArnikYtytNSDU0bYR22HjH60ectbkksUdN
	 YDqKjUMZw/qGiw9MnNFna+T+E4gv806SFVvkWiF9bjxcEQB+e3TjyPh2eZGcuKbbxp
	 0fHNfQGupmKdAN3PouWeIIcmHIAKnGxvPb95W+cCIORajfoJhvSds4S0y8PIQnzVJG
	 48L5kKMqPA3eQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 22 Aug 2024 02:15:08 +0100
Subject: [PATCH v11 05/39] arm64: Document boot requirements for Guarded
 Control Stacks
MIME-Version: 1.0
Message-Id: <20240822-arm64-gcs-v11-5-41b81947ecb5@kernel.org>
References: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
In-Reply-To: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
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
 Ross Burton <ross.burton@arm.com>, 
 Yury Khrustalev <yury.khrustalev@arm.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=openpgp-sha256; l=2324; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LciwolFLXXLWXDnsivqPJlAtVDmmbm43hS6WTnUcp7s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmxpEngL7Lww4m52gXKTq1tKoqIVBC5xOmnd+rCOx3
 nXv9/fOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZsaRJwAKCRAk1otyXVSH0OYEB/
 4xlpXpmgzrKErY1qHRUkcTUWg3EYHQ/Qr01sVqb0Ye+5PMjMVG+CInmO2KRkZ0gkgHMlZcu9ZrWqeu
 9rqYTkoaNj6IRo3kQmDFpOD7tSHwV3MHynW814M1FTg+A7qBtBCYE7cD7F9TvFm8+pKvzokXh3URRT
 hyu/gbZg3AW9s4kkAmNCa7t9G+ojCK6ye36D4jnQ7TT3NPoGgqOxHLnscslbvspCdMaE10YWE/OxOk
 bFnTh3K8ymWJnUMi0vhUvhnn1ulrNSdMfAW2DJcqS4JKKCk08fJmGK6OdYmuS1eQCWdxCbBbgifIBd
 0HuxoIfZvO7cjXv0Cl2nzl+EJ/keuT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_181706_706138_EB011358 
X-CRM114-Status: GOOD (  11.49  )
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

FEAT_GCS introduces a number of new system registers, we require that
access to these registers is not trapped when we identify that the feature
is present.  There is also a HCRX_EL2 control to make GCS operations
functional.

Since if GCS is enabled any function call instruction will cause a fault
we also require that the feature be specifically disabled, existing
kernels implicitly have this requirement and especially given that the
MMU must be disabled it is difficult to see a situation where leaving
GCS enabled would be reasonable.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/arch/arm64/booting.rst | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index b57776a68f15..aed6e9f47cf3 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -411,6 +411,38 @@ Before jumping into the kernel, the following conditions must be met:
 
     - HFGRWR_EL2.nPIRE0_EL1 (bit 57) must be initialised to 0b1.
 
+ - For CPUs with Guarded Control Stacks (FEAT_GCS):
+
+  - GCSCR_EL1 must be initialised to 0.
+
+  - GCSCRE0_EL1 must be initialised to 0.
+
+  - If EL3 is present:
+
+    - SCR_EL3.GCSEn (bit 39) must be initialised to 0b1.
+
+  - If EL2 is present:
+
+    - GCSCR_EL2 must be initialised to 0.
+
+ - If the kernel is entered at EL1 and EL2 is present:
+
+    - HCRX_EL2.GCSEn must be initialised to 0b1.
+
+    - HFGITR_EL2.nGCSEPP (bit 59) must be initialised to 0b1.
+
+    - HFGITR_EL2.nGCSSTR_EL1 (bit 58) must be initialised to 0b1.
+
+    - HFGITR_EL2.nGCSPUSHM_EL1 (bit 57) must be initialised to 0b1.
+
+    - HFGRTR_EL2.nGCS_EL1 (bit 53) must be initialised to 0b1.
+
+    - HFGRTR_EL2.nGCS_EL0 (bit 52) must be initialised to 0b1.
+
+    - HFGWTR_EL2.nGCS_EL1 (bit 53) must be initialised to 0b1.
+
+    - HFGWTR_EL2.nGCS_EL0 (bit 52) must be initialised to 0b1.
+
 The requirements described above for CPU mode, caches, MMUs, architected
 timers, coherency and system registers apply to all CPUs.  All CPUs must
 enter the kernel in the same exception level.  Where the values documented

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
