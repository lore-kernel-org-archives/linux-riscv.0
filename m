Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541D5C61D9C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 10:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j4hDNj42ph4m2tF5JONuKqwtJrtwwagqbsIQzeGedYo=; b=g7VXJpu5CeZ4R2
	mGXThe/kJIBO/IlvqC+eG09IyXjG7qKOlLp/YdueiQpXVUf3AroMRv69iQv/2vS1Mbm5027HVEsvo
	GbYDUXxLHMIdQAQhud1R13yEO7/kC9/kZz5thHQuIlE2//2175MBd6c8v1sQvFXjUHPbtnrSK9lqz
	xgNtQosfeJ+SXXbnwvqd2Wm+RFZPKAAXmDlZLVv3Kr7oHQu1QpxLnbx0bAmOSEgTVd7yydVhsRd2w
	ArQHCUIEo/EBp4j81dADzQCdlLt5vfeP3Hpk/tgy0/NCUveyhavtTnDT7B25WPIYdcjSa0KV7oyJ+
	TVO5I+WXFPZ2u0Pp08bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5kka-001T2r-1Q;
	Wed, 22 Nov 2023 10:46:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jmq-001GkA-03;
	Wed, 22 Nov 2023 09:44:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id DED0CB81183;
	Wed, 22 Nov 2023 09:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B4AC433C7;
	Wed, 22 Nov 2023 09:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700646285;
	bh=eAZyVctWUIW822C6a4XspzvFhF8YmdJ2KmfW+KTTZkg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SyPO5tjneJ1lWQ6vMvro8FogjGi2iuc2b+pcmTXuO8VKhRqYlvw00yJlvvbHsdh84
	 TjGzB+y7+/Y3Q920f0JAUO7oIDuDC/YZstqwF38A6ixh909kP+lzJHULCdJGX+fIzu
	 q2JxSOEaKpH+uJ3EXxGW9/9dWeXbeAXUDeWofNO1W6RlsAf2V1MwnpzjgSB/ogU4X+
	 iQxSL+7QlIiwyGcC1yZ1M5CuYrxppxx40R+51v4wstppfqJqFFJl8enKcPtvvp49Ck
	 5eg7e8+cZV57vDaFzG3Pv8smXqbDeUH6q2VouWbCf5uw9sS0ZDl4rykCqfkbJEE4hX
	 ADwfS0/JxHqSg==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 22 Nov 2023 09:42:25 +0000
Subject: [PATCH v7 15/39] arm64/gcs: Allow GCS usage at EL0 and EL1
MIME-Version: 1.0
Message-Id: <20231122-arm64-gcs-v7-15-201c483bd775@kernel.org>
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
In-Reply-To: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
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
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=2246; i=broonie@kernel.org;
 h=from:subject:message-id; bh=eAZyVctWUIW822C6a4XspzvFhF8YmdJ2KmfW+KTTZkg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlXc0CgBXsZyH7UmX+GJUnolHom10FZwrrBFtz2
 fm0irI1LESJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZV3NAgAKCRAk1otyXVSH
 0DSKB/0YQg4ct+cd7LzPnbzosVtkcpo9NOAazn/sUsJ2DtI354warKGrRY6PxciWlxzrMDgiIus
 HiJme7H4zGCw0IDbOmwwTfwCBkzLrvskL6mtcVElBOwwj0p22FxA2z06bnEyl+hOGCVOvm6HJGr
 S2L6/PMBzs/qmDYtEl04cqXyrEjy7B073aCQ39bj4OWb8e9pd1x45oG1v1BG9nEsklqU/iYgKZl
 +W/7rPeizJfM/yQ1ZEYuaJ73f8isMI/FMN+vA1i0JVuceYiVSaL7GypOFOYgDGwoP/Xmt6S2aUk
 PoVEJ298MhJe8H7+mrvEZOIqa4+3U3qcVTURWXFcrBZzuVbh
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_014448_350923_3F312709 
X-CRM114-Status: GOOD (  12.50  )
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

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/el2_setup.h | 17 +++++++++++++++++
 arch/arm64/include/asm/kvm_arm.h   |  4 ++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index b7afaa026842..17672563e333 100644
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
@@ -190,6 +198,15 @@
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
diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index b85f46a73e21..e4b6a29879b7 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -103,9 +103,9 @@
 #define HCR_HOST_VHE_FLAGS (HCR_RW | HCR_TGE | HCR_E2H)
 
 #define HCRX_GUEST_FLAGS \
-	(HCRX_EL2_SMPME | HCRX_EL2_TCR2En | \
+	(HCRX_EL2_SMPME | HCRX_EL2_TCR2En | HCRX_EL2_GCSEn |\
 	 (cpus_have_final_cap(ARM64_HAS_MOPS) ? (HCRX_EL2_MSCEn | HCRX_EL2_MCE2) : 0))
-#define HCRX_HOST_FLAGS (HCRX_EL2_MSCEn | HCRX_EL2_TCR2En)
+#define HCRX_HOST_FLAGS (HCRX_EL2_MSCEn | HCRX_EL2_TCR2En | HCRX_EL2_GCSEn)
 
 /* TCR_EL2 Registers bits */
 #define TCR_EL2_RES1		((1U << 31) | (1 << 23))

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
