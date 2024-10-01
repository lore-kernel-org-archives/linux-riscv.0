Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DB5CF3189
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 23:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9reJaNkfUSToxq+vp+vPLVAuRSJQtt0/E4xti9uiYks=; b=w9Xlsp0oR5e3R3
	wdFv8wumRFcYFWPkZ5k2IkSPEgY6e7OlZPakApGSL/ZmXUkxUhIUI2ztAYWABGzqLuUfcvAWFaNIw
	/oNOIflGqnZDJHxCThKk1c5Jk2gvhap6uyhtFqo8AW6goDJKaaL0JmDbXLE/BtLDfk3tOEhWjjt7h
	hqo+9VQayj3uvHcxaA9gmx6TuNngb355eYqcH6jHjlDvXDedYcw6+21ZZPBzpIvXNYiAdZ011zlS7
	rWu34Qm2JCG1P5DdEMtNYZa+hPSuvgcFX9oB/xZ/kef9MlSLRf3qnbAfB3OocVpucZi1oOkEXXdeH
	WKUn3eQCa0rLwWu6j6PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svmOT-00000004NNZ-1oIg;
	Tue, 01 Oct 2024 23:35:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svlvU-00000004I3I-1ZRb;
	Tue, 01 Oct 2024 23:05:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=pItaQE5H3eRA0ypxjPZXP3ezpZw+nz/REhLu6sj4x90=; b=HtafsoXY4VDiM0M3PdVCobEDmS
	fnabg1ElHjRpNGNEUq3NameBVf8dK7o34D4tfaqOxuX5NeS2pzi+lgMDK44px43nXvkfZwOw2WpbF
	WuOwccg1ZHq+Q+FMnTHEeSgZyP0jnW1k3dJ0qXPGtDCjqiOSJj2zlg7WPYlYzg/uhDJCF0vCDBKj8
	vj6d0jvuKzLWIbS3cEXM7PVZuAD7iY6TytuktwtJDv0mxdnLuiLVCwpW/k/jxw3roiTnRWmHnvjN3
	fWaRLNpB8mdnG3+5WCkKO3Fiqk2vC8jTLjC7VmVbddSDR+kGu7j50nAai9esSCSxwb1hWdmhBOWXo
	tuFriSWg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svlvQ-00000003Ko6-3N5g;
	Tue, 01 Oct 2024 23:05:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6B5955C53D4;
	Tue,  1 Oct 2024 23:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CFCFC4CECF;
	Tue,  1 Oct 2024 23:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727823899;
	bh=VAiC7wTRzpadh8RpHSWvVn3DPR/rNVWThbxqMFfnHEk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eRy/kctW3nA/qJ93+WM+vITRctux1o0SD6GPKbIu8jj/YMt7AnIk6QFRLezzYyzuH
	 SlcLCbUhqAUI1u30Po/NuBch0G0v0ql50IwITt34H7cQ62gIpWVQUIeHJ9tcQRMzTc
	 uViUbs/Xvke/fjWiDksO4Qh2GN0gSj+Nk9UlnnP4YOWk25QjeTK3gKZLM8phKEA2k+
	 mjTPj4LrQGG7RmJEjAG85LAf7kBnQhfndAYVI+ip3Dyl1vcnUH0miYKXcExeKBvbav
	 xfZGoiL38AAi6+Dr8MCWdJs/DMGV6gztdc8XmLv6yc/PWIpR7eLYMiUpADAIS6yUCs
	 VOJL4q92nUy0w==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Oct 2024 23:59:06 +0100
Subject: [PATCH v13 27/40] arm64/ptrace: Expose GCS via ptrace and core
 files
MIME-Version: 1.0
Message-Id: <20241001-arm64-gcs-v13-27-222b78d87eee@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4262; i=broonie@kernel.org;
 h=from:subject:message-id; bh=VAiC7wTRzpadh8RpHSWvVn3DPR/rNVWThbxqMFfnHEk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm/H7Z5vNb2IgxdeOBRBnWacqJsMskdit5gkN95CIq
 Z4SFLa+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZvx+2QAKCRAk1otyXVSH0AD7B/
 90YcXso4DMluSzh5SnDnEMoZx98sERhuAysFMI+D8NQYKJCTCgbRD1UHKlev8+31TQjTM7cBYNPtTM
 M2nPE8s6UfeDzMcl0vw5RpKx5LCOmfb6By9Z0S/OOOBBDnhycSmaVuCWWHk1e6dDiF2fEeSs6Sn5vc
 BDdtHJpnVBlaBt5KecWXAU7R9Hda2+JhFtcTnYEu3PlCLUn8MK2iObaoVpv5VGApENQlXul5wDDgcA
 YjtMn40OZdA7GAQR5zJCgInDRJyMmkYBeRAvEBnSfi/l1QhqGRthlk7gspycrolcOCHSr0crpN7IZJ
 mVRvPfsG6jKAiyRP+nTBBXtTDR35tE
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_000501_564809_C15DF0F8 
X-CRM114-Status: GOOD (  17.68  )
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

Provide a new register type NT_ARM_GCS reporting the current GCS mode
and pointer for EL0.  Due to the interactions with allocation and
deallocation of Guarded Control Stacks we do not permit any changes to
the GCS mode via ptrace, only GCSPR_EL0 may be changed.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/uapi/asm/ptrace.h |  8 +++++
 arch/arm64/kernel/ptrace.c           | 62 +++++++++++++++++++++++++++++++++++-
 include/uapi/linux/elf.h             |  1 +
 3 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/uapi/asm/ptrace.h b/arch/arm64/include/uapi/asm/ptrace.h
index 7fa2f7036aa7..0f39ba4f3efd 100644
--- a/arch/arm64/include/uapi/asm/ptrace.h
+++ b/arch/arm64/include/uapi/asm/ptrace.h
@@ -324,6 +324,14 @@ struct user_za_header {
 #define ZA_PT_SIZE(vq)						\
 	(ZA_PT_ZA_OFFSET + ZA_PT_ZA_SIZE(vq))
 
+/* GCS state (NT_ARM_GCS) */
+
+struct user_gcs {
+	__u64 features_enabled;
+	__u64 features_locked;
+	__u64 gcspr_el0;
+};
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _UAPI__ASM_PTRACE_H */
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index b756578aeaee..6c1dcfe6d25a 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -34,6 +34,7 @@
 #include <asm/cpufeature.h>
 #include <asm/debug-monitors.h>
 #include <asm/fpsimd.h>
+#include <asm/gcs.h>
 #include <asm/mte.h>
 #include <asm/pointer_auth.h>
 #include <asm/stacktrace.h>
@@ -1473,6 +1474,52 @@ static int poe_set(struct task_struct *target, const struct
 }
 #endif
 
+#ifdef CONFIG_ARM64_GCS
+static int gcs_get(struct task_struct *target,
+		   const struct user_regset *regset,
+		   struct membuf to)
+{
+	struct user_gcs user_gcs;
+
+	if (!system_supports_gcs())
+		return -EINVAL;
+
+	if (target == current)
+		gcs_preserve_current_state();
+
+	user_gcs.features_enabled = target->thread.gcs_el0_mode;
+	user_gcs.features_locked = target->thread.gcs_el0_locked;
+	user_gcs.gcspr_el0 = target->thread.gcspr_el0;
+
+	return membuf_write(&to, &user_gcs, sizeof(user_gcs));
+}
+
+static int gcs_set(struct task_struct *target, const struct
+		   user_regset *regset, unsigned int pos,
+		   unsigned int count, const void *kbuf, const
+		   void __user *ubuf)
+{
+	int ret;
+	struct user_gcs user_gcs;
+
+	if (!system_supports_gcs())
+		return -EINVAL;
+
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &user_gcs, 0, -1);
+	if (ret)
+		return ret;
+
+	if (user_gcs.features_enabled & ~PR_SHADOW_STACK_SUPPORTED_STATUS_MASK)
+		return -EINVAL;
+
+	target->thread.gcs_el0_mode = user_gcs.features_enabled;
+	target->thread.gcs_el0_locked = user_gcs.features_locked;
+	target->thread.gcspr_el0 = user_gcs.gcspr_el0;
+
+	return 0;
+}
+#endif
+
 enum aarch64_regset {
 	REGSET_GPR,
 	REGSET_FPR,
@@ -1503,7 +1550,10 @@ enum aarch64_regset {
 	REGSET_TAGGED_ADDR_CTRL,
 #endif
 #ifdef CONFIG_ARM64_POE
-	REGSET_POE
+	REGSET_POE,
+#endif
+#ifdef CONFIG_ARM64_GCS
+	REGSET_GCS,
 #endif
 };
 
@@ -1674,6 +1724,16 @@ static const struct user_regset aarch64_regsets[] = {
 		.set = poe_set,
 	},
 #endif
+#ifdef CONFIG_ARM64_GCS
+	[REGSET_GCS] = {
+		.core_note_type = NT_ARM_GCS,
+		.n = sizeof(struct user_gcs) / sizeof(u64),
+		.size = sizeof(u64),
+		.align = sizeof(u64),
+		.regset_get = gcs_get,
+		.set = gcs_set,
+	},
+#endif
 };
 
 static const struct user_regset_view user_aarch64_view = {
diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index b9935988da5c..9adc218fb6df 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -443,6 +443,7 @@ typedef struct elf64_shdr {
 #define NT_ARM_ZT	0x40d		/* ARM SME ZT registers */
 #define NT_ARM_FPMR	0x40e		/* ARM floating point mode register */
 #define NT_ARM_POE	0x40f		/* ARM POE registers */
+#define NT_ARM_GCS	0x410		/* ARM GCS state */
 #define NT_ARC_V2	0x600		/* ARCv2 accumulator/extra registers */
 #define NT_VMCOREDD	0x700		/* Vmcore Device Dump Note */
 #define NT_MIPS_DSP	0x800		/* MIPS DSP ASE registers */

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
