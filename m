Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9315C25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 16 May 2024 09:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mKgAmk0GHUz3M69N/7XeDNCQDJgyT53dvGv0Nx0qYRY=; b=ouhLV945g1vGJs
	w54LeMf5SlqYIuGEH5zpvf1F2t3qCkffgpoitEV+Kc2bBNHukkliXOzaMDc70hgoZ/+Sr1RW9lSwg
	bDfxuAMJoSK/hrNoTdg89e4/hkOshin91OVrN2+xOoR/4OftIDDs9snWQcfGt4IUqcjtf3wlx6+LV
	1dEqCv7nvNMhlBlRhsyJz+/7Wjs1sTOQLOo2d8tKW8gFFGsoJJdRAkLzeqDLpzBml0qiB8alevTH7
	NNgD1M+3bLjNctbjhhy+6aC8/3MxP2GiFvUW3IXRjWsma5Y7eOgRerzVDHe8ZsIpTozLubaY8MSKp
	OdPdl3+k+YcWxsiwEIvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7WzM-00000004F8q-1Fhm;
	Thu, 16 May 2024 09:01:24 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7WzJ-00000004F7v-2J8Y
	for linux-riscv@lists.infradead.org;
	Thu, 16 May 2024 09:01:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715850081; x=1747386081;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Qs2BtB30x40JRIKZiOWFcq+R7jv/plwfGPgi4oxWEg4=;
  b=Zzg9XZuuv2JqyQra4SIzGIBr4ouZEKonC0TIm9qN/axoGEcmQ1RHUstx
   yNFE5GYUXbVDXMDYNBid3bTguMBPeza2hW6i6Qg16qalO+ku/je/tSYBs
   p4Q1bDhfL68+qqzh1e591u8IK0Nu0JcLZUS1nUyPrLoBEFkGGsWIi9w9t
   ckloknYwjOkw80dlCn+jSEnGZObhrU2iJa21xI6qiyIsnitptSCacuLI5
   8lFvqHRMotlZQBZdSl1UxKUfS9dGfi+uBJBhrG3aQy40VAQS6sXyauSYz
   KrTZGnCzcU6+cN/IzcF4Sil3MO6Sds2aHITbHSAomfYwbeEVfi22Fh7qr
   w==;
X-CSE-ConnectionGUID: P7FgAuULQvmMFYJnOcDfBg==
X-CSE-MsgGUID: 143CpH6YSu65q9ZSNvCueA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12058095"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="12058095"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 02:01:18 -0700
X-CSE-ConnectionGUID: rG8UIvklSymxZx+v86dtFA==
X-CSE-MsgGUID: prHw5wvCS5CmQDvFAFg7bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="31932782"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
  by orviesa007.jf.intel.com with ESMTP; 16 May 2024 02:01:13 -0700
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
	ben.dooks@codethink.co.uk,
	ajones@ventanamicro.com,
	Xiao Wang <xiao.w.wang@intel.com>
Subject: [PATCH v3] riscv, bpf: Optimize zextw insn with Zba extension
Date: Thu, 16 May 2024 17:04:30 +0800
Message-Id: <20240516090430.493122-1-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_020121_657969_355020AD 
X-CRM114-Status: GOOD (  10.62  )
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
v3:
* Remove the Kconfig dependencies on TOOLCHAIN_HAS_ZBA and
  RISCV_ALTERNATIVE. (Andrew)
v2:
* Add Zba description in the Kconfig. (Lehui)
* Reword the Kconfig help message to make it clearer. (Conor)
---
 arch/riscv/Kconfig       | 12 ++++++++++++
 arch/riscv/net/bpf_jit.h | 18 ++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6bec1bce6586..b64d55dc929f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -601,6 +601,18 @@ config TOOLCHAIN_HAS_VECTOR_CRYPTO
 	def_bool $(as-instr, .option arch$(comma) +v$(comma) +zvkb)
 	depends on AS_HAS_OPTION_ARCH
 
+config RISCV_ISA_ZBA
+	bool "Zba extension support for bit manipulation instructions"
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
