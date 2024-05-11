Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939F9C25B10
	for <linux-riscv@archiver.kernel.org>; Sat, 11 May 2024 02:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CaCxWZQWms2YN72f0zfD0vIqxMiMVHderuFYgHlPK1c=; b=Lt4K8Y5rTyqN7j
	iATQPODOx9jgsezx8JgtDoujnAoNFz4HfeHBPwXC3E5u1NHJ6Iw3wQFNPxtwYc/C6/gty3WG9434L
	e6RDelAReHYDFREHlGv3LsIdzyt9HRX6idCToKF22mAcYaqFGaE7L6nXbxPjXRRBedYyTU1wqJbOz
	VLdG6Xh1T9gHhTtBM3/uDKF1qvwki7DZoJPWVh+eP4vxwRZQngDHvuLQmc0Rz8qL2fDGGXbDlW7v4
	xY7aRl1Z83VCtUILbKTeMEoKxNnj7PFU6bEdFMjCfYB6Xpvp0OYbwpgVoJblLzIb/yMFj/AtmaKgq
	r5Tq5YglzVE17jYHdWww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5cWG-000000076L1-3h93;
	Sat, 11 May 2024 02:31:28 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5cWD-000000076JD-2FTg
	for linux-riscv@lists.infradead.org;
	Sat, 11 May 2024 02:31:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715394685; x=1746930685;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zOqj5z27hn5Ja+9Hiogv2yU6ck56jE/mAfjwUewOMc8=;
  b=M0fOsmLEuGVE14z0CfPG+KW6hebfXuLOylJoJo6ExMZbHnBz8a9foNmv
   1OWl9wFtfEpKiSTcrr9Ugbt1Oxoq51IapC+dl5bwl3JpsPudMeh0zS6Df
   N6URl872kX1Vy8C+t987FBzSmHANArZwZqLsIPpg6MKmIcH0xkQucGBoC
   BsUP0tnxbulAysRMP3ARSCHlKZPBQRS2rkQ45/Pl0rYXudSHJzkqlYAzi
   7S4EBfJvNa5Nr7wce3La3JPC80rfdBuyYI7e/nZlHsN9jmfY1vUHtjsAL
   8ikVEGbnloTpt9Rp/T6/Sk9Aeyxp5594A99HTMAa4RS7IF32KEUruIY5w
   g==;
X-CSE-ConnectionGUID: +ieFl3LsSS6Thyw/YmkF0g==
X-CSE-MsgGUID: X20BVGM0RtKwEnrpJpl+hw==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11532828"
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="11532828"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 19:31:21 -0700
X-CSE-ConnectionGUID: 9UgOqJBlSziTAnLQ3DxYtw==
X-CSE-MsgGUID: 50XnkUn5TWqBlry7JtN2iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="29867299"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
  by fmviesa010.fm.intel.com with ESMTP; 10 May 2024 19:31:15 -0700
From: Xiao Wang <xiao.w.wang@intel.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	luke.r.nels@gmail.com,
	xi.wang@gmail.com,
	bjorn@kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@google.com,
	haoluo@google.com,
	jolsa@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	pulehui@huawei.com,
	haicheng.li@intel.com,
	conor@kernel.org,
	Xiao Wang <xiao.w.wang@intel.com>
Subject: [PATCH v2] riscv, bpf: Optimize zextw insn with Zba extension
Date: Sat, 11 May 2024 10:34:36 +0800
Message-Id: <20240511023436.3282285-1-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_193125_664660_E386AAAD 
X-CRM114-Status: GOOD (  11.01  )
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

The Zba extension provides add.uw insn which can be used to implement
zext.w with rs2 set as ZERO.

Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
---
v2:
* Add Zba description in the Kconfig. (Lehui)
* Reword the Kconfig help message to make it clearer. (Conor)
---
 arch/riscv/Kconfig       | 22 ++++++++++++++++++++++
 arch/riscv/net/bpf_jit.h | 18 ++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6bec1bce6586..e262a8668b41 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -586,6 +586,14 @@ config RISCV_ISA_V_PREEMPTIVE
 	  preemption. Enabling this config will result in higher memory
 	  consumption due to the allocation of per-task's kernel Vector context.
 
+config TOOLCHAIN_HAS_ZBA
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zba)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zba)
+	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
+	depends on AS_HAS_OPTION_ARCH
+
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
@@ -601,6 +609,20 @@ config TOOLCHAIN_HAS_VECTOR_CRYPTO
 	def_bool $(as-instr, .option arch$(comma) +v$(comma) +zvkb)
 	depends on AS_HAS_OPTION_ARCH
 
+config RISCV_ISA_ZBA
+	bool "Zba extension support for bit manipulation instructions"
+	depends on TOOLCHAIN_HAS_ZBA
+	depends on RISCV_ALTERNATIVE
+	default y
+	help
+	   Add support for enabling optimisations in the kernel when the Zba
+	   extension is detected at boot.
+
+	   The Zba extension provides instructions to accelerate the generation
+	   of addresses that index into arrays of basic data types.
+
+	   If you don't know what to do here, say Y.
+
 config RISCV_ISA_ZBB
 	bool "Zbb extension support for bit manipulation instructions"
 	depends on TOOLCHAIN_HAS_ZBB
diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
index f4b6b3b9edda..18a7885ba95e 100644
--- a/arch/riscv/net/bpf_jit.h
+++ b/arch/riscv/net/bpf_jit.h
@@ -18,6 +18,11 @@ static inline bool rvc_enabled(void)
 	return IS_ENABLED(CONFIG_RISCV_ISA_C);
 }
 
+static inline bool rvzba_enabled(void)
+{
+	return IS_ENABLED(CONFIG_RISCV_ISA_ZBA) && riscv_has_extension_likely(RISCV_ISA_EXT_ZBA);
+}
+
 static inline bool rvzbb_enabled(void)
 {
 	return IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && riscv_has_extension_likely(RISCV_ISA_EXT_ZBB);
@@ -937,6 +942,14 @@ static inline u16 rvc_sdsp(u32 imm9, u8 rs2)
 	return rv_css_insn(0x7, imm, rs2, 0x2);
 }
 
+/* RV64-only ZBA instructions. */
+
+static inline u32 rvzba_zextw(u8 rd, u8 rs1)
+{
+	/* add.uw rd, rs1, ZERO */
+	return rv_r_insn(0x04, RV_REG_ZERO, rs1, 0, rd, 0x3b);
+}
+
 #endif /* __riscv_xlen == 64 */
 
 /* Helper functions that emit RVC instructions when possible. */
@@ -1159,6 +1172,11 @@ static inline void emit_zexth(u8 rd, u8 rs, struct rv_jit_context *ctx)
 
 static inline void emit_zextw(u8 rd, u8 rs, struct rv_jit_context *ctx)
 {
+	if (rvzba_enabled()) {
+		emit(rvzba_zextw(rd, rs), ctx);
+		return;
+	}
+
 	emit_slli(rd, rs, 32, ctx);
 	emit_srli(rd, rd, 32, ctx);
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
