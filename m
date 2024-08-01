Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD9BC3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 13:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rh1xewf/FKjRasR9o9eccCypzaVT20dknOi28oZJR4c=; b=sGgeP8uFrmtXVp
	QXOEjiA8HPQ/GBDp0s2ixHwOO+r9yxkP4pojqB6QCgihIadoIDESora07X20qB4p+1ZhhpLQ/dZnV
	Y7nGJz15OP/LwVzDgE539WooF2ylTYtoVStaHzPEpfol/Z0xYWlvdOofgpQnq+Brm1zRHmnqGcMmh
	iDM/5eun90GMdWx0VqLRMmMX5W1YCiSz9qBdnMRgOd27LXD8n3viy7cLZxEj02TTzbmLOM/Dqxi1g
	W2eTzJ9IC1/UTqwJvThKkdOsbEFt1um5evIqL7/KCowQl8TEGhOO839HeY4GF/MeKXy59LXkeib+s
	ArRzuqE0NxbgU2OxGpRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVSe-00000005LMJ-0Zqu;
	Thu, 01 Aug 2024 13:03:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVNw-00000005IFh-0VSZ;
	Thu, 01 Aug 2024 12:58:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6A245CE19B5;
	Thu,  1 Aug 2024 12:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD58C4AF09;
	Thu,  1 Aug 2024 12:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722517101;
	bh=n96ljJnJVMpYM9CVsfMUORPIasrMIuo5nt8SCuY5I/I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pTC4lgO7SQKGHaiX2nkMESdUjPENIlCeXI7cbdMEO1veZv+NnE7Q0HtzHnypIRSwX
	 EFFbCP9R/odkVfMcUNhw2BYaIXYd3+HHHyjwGShekpbDTq/8639R57lZi260FRwS9W
	 BXwQfAdQaytr8C0yGa+c68hCauRvpcE5dlS4czXMOBk4eaOepEeEMdHSJS4YgQtuZk
	 I467IPjnvVLTzCPUkz/2CCGzWf602uS+MbKUA33Seoqav/yPBIg4Pmjhg1gOrHSJdQ
	 mzerRki9mRWRzWC7SiWU82YMhlX5m5cdrQzDukG/jpa0w3ctN8oQ6BmSr2GFLvtm/r
	 68Ybg8kKNBgRg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 01 Aug 2024 13:06:36 +0100
Subject: [PATCH v10 09/40] arm64/gcs: Provide basic EL2 setup to allow GCS
 usage at EL0 and EL1
MIME-Version: 1.0
Message-Id: <20240801-arm64-gcs-v10-9-699e2bd2190b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2228; i=broonie@kernel.org;
 h=from:subject:message-id; bh=n96ljJnJVMpYM9CVsfMUORPIasrMIuo5nt8SCuY5I/I=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmq4YMcSNTIJcJ2iVFyb/E14kVTlvrio58Ua+gwj4/
 lAQflIiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZquGDAAKCRAk1otyXVSH0DvuB/
 oDx/VdoNOsQl5QDmrDks6jRvVft2wlWPJjs7YotfALeKJpT6PRTjX/fHk0yQ3nT1TbsgavUVMh5ugk
 azWaDppWDeoeJyRUeR8AwqHPaLkF75qzW8tRm1tYmbjlUvU9Cs9kNG23dqrPxY48VY9JN/FknkR15Z
 vIT8K7Tidey9v247fvxyj4rfKz1arkjoyGZLJVMyWb6u9BHi66D9qeos14lTWlCqrtqjX8EJYBKS7r
 3I0t3sTBFUAUPotD1oVJPOQb4oPqtBVJy9PMQP1Yq1fWgtYabT5l5VrcJQzcK+M8dNstOCEIZLt/rL
 V6ygoYoUMW539BYpF1RQrxycLsV1z0
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_055824_546722_F5CDF7BB 
X-CRM114-Status: GOOD (  12.35  )
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

There is a control HCRX_EL2.GCSEn which must be set to allow GCS
features to take effect at lower ELs and also fine grained traps for GCS
usage at EL0 and EL1.  Configure all these to allow GCS usage by EL0 and
EL1.

We also initialise GCSCR_EL1 and GCSCRE0_EL1 to ensure that we can
execute function call instructions without faulting regardless of the
state when the kernel is started.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/el2_setup.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index fd87c4b8f984..09211aebcf03 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -27,6 +27,14 @@
 	ubfx	x0, x0, #ID_AA64MMFR1_EL1_HCX_SHIFT, #4
 	cbz	x0, .Lskip_hcrx_\@
 	mov_q	x0, HCRX_HOST_FLAGS
+
+        /* Enable GCS if supported */
+	mrs_s	x1, SYS_ID_AA64PFR1_EL1
+	ubfx	x1, x1, #ID_AA64PFR1_EL1_GCS_SHIFT, #4
+	cbz	x1, .Lset_hcrx_\@
+	orr	x0, x0, #HCRX_EL2_GCSEn
+
+.Lset_hcrx_\@:
 	msr_s	SYS_HCRX_EL2, x0
 .Lskip_hcrx_\@:
 .endm
@@ -191,6 +199,15 @@
 	orr	x0, x0, #HFGxTR_EL2_nPIR_EL1
 	orr	x0, x0, #HFGxTR_EL2_nPIRE0_EL1
 
+	/* GCS depends on PIE so we don't check it if PIE is absent */
+	mrs_s	x1, SYS_ID_AA64PFR1_EL1
+	ubfx	x1, x1, #ID_AA64PFR1_EL1_GCS_SHIFT, #4
+	cbz	x1, .Lset_fgt_\@
+
+	/* Disable traps of access to GCS registers at EL0 and EL1 */
+	orr	x0, x0, #HFGxTR_EL2_nGCS_EL1_MASK
+	orr	x0, x0, #HFGxTR_EL2_nGCS_EL0_MASK
+
 .Lset_fgt_\@:
 	msr_s	SYS_HFGRTR_EL2, x0
 	msr_s	SYS_HFGWTR_EL2, x0
@@ -204,6 +221,17 @@
 .Lskip_fgt_\@:
 .endm
 
+.macro __init_el2_gcs
+	mrs_s	x1, SYS_ID_AA64PFR1_EL1
+	ubfx	x1, x1, #ID_AA64PFR1_EL1_GCS_SHIFT, #4
+	cbz	x1, .Lskip_gcs_\@
+
+	/* Ensure GCS is not enabled when we start trying to do BLs */
+	msr_s	SYS_GCSCR_EL1, xzr
+	msr_s	SYS_GCSCRE0_EL1, xzr
+.Lskip_gcs_\@:
+.endm
+
 .macro __init_el2_nvhe_prepare_eret
 	mov	x0, #INIT_PSTATE_EL1
 	msr	spsr_el2, x0
@@ -229,6 +257,7 @@
 	__init_el2_nvhe_idregs
 	__init_el2_cptr
 	__init_el2_fgt
+        __init_el2_gcs
 .endm
 
 #ifndef __KVM_NVHE_HYPERVISOR__

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
