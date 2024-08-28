Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4B9C71150
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 23:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PFwzCB2V8ToVd5WfGHLDgiDGzTz7jTZFWRxksKK6iUE=; b=pQ28QoiAbLZtux
	MSTFSynihVEFgRbwSmoDPT9uIi5bIYhf7LbbPuRL8iwniMIMiamdecnlinRSMKQiQbaEw1QMS41Z6
	+RhJo2j8pIe/n3tZF+zDt3QMXgAUq1J31QptJ9ON1S/xL+U/vF/lUNXdwP/1nnx++iUAnRkNLKTjt
	k3nZ0/3z4g3+eAFVuCdvbRsN4DDgoj582G7VPBZcliOm4zzl1wep+sI0cCbHJ5x/GUEt2sPpfdP0/
	KBZTsJdBQrcC8HSife052S4zXElRJ/cy0hRnnwgrFNH0vMLryyqIZOM5xMjmn2Dd+Dup34iOF3XOD
	L4s//4GmCX/UWdkobnAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjSBD-0000000HOQI-1TJO;
	Wed, 28 Aug 2024 23:34:23 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjS6A-0000000HLtE-3maY;
	Wed, 28 Aug 2024 23:29:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 09C74CE1736;
	Wed, 28 Aug 2024 23:29:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D85C4CEC9;
	Wed, 28 Aug 2024 23:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724887748;
	bh=rOh4m4fj2wClbocRq0H+LpbzuLewpkO3M5BRFF5QA9g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZtDMwdQpJIDs2Rkwg0UYeDSZGl9Kgy35c06eDIK4/xNomEaD++8/p8t2QXdJEAztH
	 wSDe8Jup97ATXtYoBygYSHUOvxgA0EtDFbcoVHiHXkZU64s+4e7QdTpYwjHwYUNNA4
	 fmXhbKdf9yiRBra8gOySoZ5GyegNK29pluB9SC4oXQpTUsASjznj/+gelnrStbMUCQ
	 mzoDrv+bTHH8lLa0Z0jhD+yocQgZqM15phOtwWzVvG0Hlip8JN4BaxASDLVEXK4jb0
	 ciKTdIgx29iXFhoHHZ6RBmDIqv5QKOIIhKW1Dsd8YOdLxp4HP/wwySaJA5xzlpY4PO
	 wYLCOROxVvtxw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 29 Aug 2024 00:27:21 +0100
Subject: [PATCH v12 05/39] arm64: Document boot requirements for Guarded
 Control Stacks
MIME-Version: 1.0
Message-Id: <20240829-arm64-gcs-v12-5-42fec947436a@kernel.org>
References: <20240829-arm64-gcs-v12-0-42fec947436a@kernel.org>
In-Reply-To: <20240829-arm64-gcs-v12-0-42fec947436a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2380; i=broonie@kernel.org;
 h=from:subject:message-id; bh=rOh4m4fj2wClbocRq0H+LpbzuLewpkO3M5BRFF5QA9g=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmz7J8Z5KYwVa17Tubvy4OA5GT6N3rKn+DrkFI1TFj
 ZrKgfK2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZs+yfAAKCRAk1otyXVSH0MAcB/
 9SchQoHpvxwB9OxCqShz/dLftqcvRCIWxO9ZgoadV/U4Z50nuJqBdPypaRBS3bZjxOdOISP6XQ/CbU
 3V5v+g4JXxiGcKDkpOi/GfmZ6t1GA/fgPZdFp7Ckdq8Pt0Zt/kwqhC/xwj48+HPd3g5yzqtjHeJ9VG
 yMVnneUwHH2TzyyvgGOyEVPO6GLr8arjGFoQ31TxvfiC+NskBEnNqcixA8MMAzSn+sZ8Xfxuyxmvgi
 MILIA4dpUWrY3uWd/x5J6+znHC9MOgmcxRhX2X16jFT1Zd5K/rFTcP6Wz1FXTwZMdn/T7eo3Yjz4iO
 RIWXdgHpzMXKw6EeHaoiWr7gUCLOry
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_162911_336640_0E54CBAF 
X-CRM114-Status: GOOD (  11.56  )
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
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
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
