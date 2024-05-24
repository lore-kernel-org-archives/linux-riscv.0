Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A692C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 07:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PvWAdhWTJIQ2M7uGDbUMnUYJj+XYRvPQi/Z9uIGSqfo=; b=pikkWm92/yOwcM
	11eRQqdTSg/WKR2JpXzfF01nwOqHGgJKpSfD2aQmYSpnZOJqL1pOEGhkN6z4NsStwgqznxwdXf1i5
	JtcL7pYRQlLLDPnFH+vmaRD9ImUi/SjnIJhJO04Ze6uBdC9Lr0efdbCIYtYAyRxaHL5rR8KnfEz88
	hg/D63nDyY/6e2EJSJgslYT2t0Obg7AhEIbTDOWTI7qJBdXqBub+PN9z16lNisEg4BzC702vJ2Qqx
	bOaLoINEjKMjY08YfSJJhhnpUxrWmEuNChE8ysO0L4bjP92yYAERAs2EVPcLKais/wMLSxym0WWLp
	PZNXe57O0hvabt6FfWEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAPjf-00000008Jkw-0oqU;
	Fri, 24 May 2024 07:53:07 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAPjc-00000008Ji6-1HA2
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 07:53:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716537184; x=1748073184;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wpFG1s8PYSDhqQqyrDF/Dhz/I5KMqnXKfyAlTsU7BRU=;
  b=XMRyxJ57DwksGW2DhT8ARpG3FMuR5Lvko9DgIkcTapdF7e2qOTg0U4Xj
   SMVuV0KDasgC3tc9G5ITthcTMoJEswymktqBYslLj82n8Jt8/nXcHXX+k
   fBfpIn4pIWn9VJSS176Puf04dN8JR+/u7/KzmfRMgV7WYLoCyaFCh1ca9
   Mu6rWtXQz+vftVY1iPqkFa+tBwSIb9fpnBs46mWn2LBjUdqxRhsBAXJp+
   k5osvaP+Jg4BycGjAqUxQ+ScBrM8SuC1EqJlnhNhRIcn8aNf7ry7B2ObP
   cFi0F0MwEd5MoMW0pL9u9IFs81LwAcG2t+u97GWL4GuCVhJzUdcg6duV5
   w==;
X-CSE-ConnectionGUID: N/aNZgB2QPiRFGnj3+u+IA==
X-CSE-MsgGUID: lgRtig/ASwC+406b3iEyrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="15845975"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; 
   d="scan'208";a="15845975"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 00:53:03 -0700
X-CSE-ConnectionGUID: QITdRlzlQFaoqJqCkVS2Kg==
X-CSE-MsgGUID: grYXd3QZSkuU+OC9LrVvUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; 
   d="scan'208";a="33953910"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
  by fmviesa006.fm.intel.com with ESMTP; 24 May 2024 00:52:57 -0700
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
	puranjay@kernel.org,
	haicheng.li@intel.com,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH bpf-next v4 1/2] riscv, bpf: Optimize zextw insn with Zba extension
Date: Fri, 24 May 2024 15:55:42 +0800
Message-Id: <20240524075543.4050464-2-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240524075543.4050464-1-xiao.w.wang@intel.com>
References: <20240524075543.4050464-1-xiao.w.wang@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_005304_380573_0FDA0C8E 
X-CRM114-Status: GOOD (  10.25  )
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Pu Lehui <pulehui@huawei.com>
Tested-by: Pu Lehui <pulehui@huawei.com>
---
 arch/riscv/Kconfig       | 12 ++++++++++++
 arch/riscv/net/bpf_jit.h | 18 ++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index be09c8836d56..a117adff5810 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -593,6 +593,18 @@ config TOOLCHAIN_HAS_VECTOR_CRYPTO
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
index fdbf88ca8b70..97041b58237a 100644
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
@@ -939,6 +944,14 @@ static inline u16 rvc_sdsp(u32 imm9, u8 rs2)
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
@@ -1161,6 +1174,11 @@ static inline void emit_zexth(u8 rd, u8 rs, struct rv_jit_context *ctx)
 
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
