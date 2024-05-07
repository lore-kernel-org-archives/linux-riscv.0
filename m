Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DD3C10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 10:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zxDKAbOlGJ0Y7Muoy7E+rQItWXcqaZGT8PsjOO6jGfs=; b=Nftv5r58AQnjVD
	+aLFPSyri+cEPm8JUMRBM0qn9ph+oAuMt+ROYbcc3UyZhkxi6w4hvhIlmGK8XY2dhKLxuXQha/4dB
	79wsnOckzTyLrAGUmhkrbIU61iEsZyF1c/Md3kbU5kbytmrwdfSpvrypBaeeqahVeGoKQo+BPcvKR
	d8bw1zrrqn62Imxzx10I1RfqOMyWMLs50XHX+BwPqceZIdhe59H7KDPwAfxzBT8wlFiqjtYrxHG+k
	k6BHg1YOGyGDaddZglxuwfA9XfJ6qHbFYyQ9Wo7JVUC4E5djr8haXuGezTBkU1uUtwKZ8u3376HZi
	evMLQaNTbX5eSrP02ipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4IIC-0000000AZrd-1QgZ;
	Tue, 07 May 2024 10:43:28 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4II6-0000000AZpr-0nkI
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 10:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715078602; x=1746614602;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+TRQfeq8Nw7b6DoQt3C1fHE3AuYEeUkPp5208iLu1YA=;
  b=Y+v5bp056eGWYbCfxOVzH3lizjiIuHky+M6MXYlFxKHRrFGU7R3yNC9n
   abTnst/lhSsmwyI6rNr7Y5eTL7ZSPCQfN86sOIHCxMQyIR4MRRv8OYHXw
   lhSsNHRyPpP/ygn7ATRc0fQLWIjUumTj8sX5hK84JLNKQ5+GKU1l7KCw9
   KwGhtqzoquWS5jlJ2C+kGyi/rcjU1lStRN4u1CnpQzcesOpru8K1LlN/H
   u8xPXusFqjGvL+fpuxBwvzAejexRJFAtwSUZvQeLR9B9j1r9PYiDpPMpx
   nJo1cXDZY2UJmHQLDFsKzOcsZR7Bhf1G2ZbPAhH1gHe3NQNANZwF7VEW1
   g==;
X-CSE-ConnectionGUID: tjvgDXz8QZqUXNpVKv3k4Q==
X-CSE-MsgGUID: pW3oTtWESy+rWz8qTUtwtQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="36245718"
X-IronPort-AV: E=Sophos;i="6.07,261,1708416000"; 
   d="scan'208";a="36245718"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 03:43:15 -0700
X-CSE-ConnectionGUID: l7+b9JCCSqubT7cmWJcHIg==
X-CSE-MsgGUID: euSulxasRP6BMwVw+2KcCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,261,1708416000"; 
   d="scan'208";a="33312129"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
  by orviesa004.jf.intel.com with ESMTP; 07 May 2024 03:43:09 -0700
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
	Xiao Wang <xiao.w.wang@intel.com>
Subject: [PATCH] riscv, bpf: Optimize zextw insn with Zba extension
Date: Tue,  7 May 2024 18:45:28 +0800
Message-Id: <20240507104528.435980-1-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_034325_764267_4C18A4B8 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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
 arch/riscv/Kconfig       | 19 +++++++++++++++++++
 arch/riscv/net/bpf_jit.h | 18 ++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6bec1bce6586..0679127cc0ea 100644
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
@@ -601,6 +609,17 @@ config TOOLCHAIN_HAS_VECTOR_CRYPTO
 	def_bool $(as-instr, .option arch$(comma) +v$(comma) +zvkb)
 	depends on AS_HAS_OPTION_ARCH
 
+config RISCV_ISA_ZBA
+	bool "Zba extension support for bit manipulation instructions"
+	depends on TOOLCHAIN_HAS_ZBA
+	depends on RISCV_ALTERNATIVE
+	default y
+	help
+	   Adds support to dynamically detect the presence of the ZBA
+	   extension (address generation acceleration) and enable its usage.
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
