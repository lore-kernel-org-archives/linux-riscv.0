Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC63AC04FFE
	for <linux-riscv@archiver.kernel.org>; Mon, 20 May 2024 07:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l8yVD8VSx3fSyMkzuhhU4AlMENqrn+R37dsChmEMw/A=; b=pd3KiG2pI3DUHU
	HxvOElLBd5c5xJw6MagRpcxu/3sLBeKL5b/q6IAFqeYnPPQOdjXGo+5XoUI7PVzTlP7YGMrSUMQQM
	rPDTRVkQ4ntLCy8g04yXEu1emNbP/UujGt/QwmuDDyx6OMCcXvvKvYerr1Iba9pAxHRUOqLwGKbPO
	FvoPkz9MAM5hJqWDGzRyM0Rsth5zCPxFE7LDrP58lMTnwQnDi1nau/oE6qeXJr6nVhuc9g9U5lrq8
	cpUhNsoW7vUB8HhZn2dcZyG9OZ39jlKJaylxVzca/HtDpVTHTBVliDk2vDp0W1Tz6uk07ei055i7i
	M40H4/N9t0gDMGuhDzOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8xD9-0000000Djsc-04yG;
	Mon, 20 May 2024 07:13:31 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8xD5-0000000DjrO-3UkD
	for linux-riscv@lists.infradead.org;
	Mon, 20 May 2024 07:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716189208; x=1747725208;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HaN3uDDCs7rsYuOeFc7Bo7CtrGnS/xMq3UMxX8UPGd8=;
  b=DyLbEHoOXnDLeDOSQntN8N+aGp9Ul1CmDYo8OTaxOepRWX678gBKuLEl
   lzW30etXwZ+APjaXOpDfGfyMNCBY67x5gYPs6TH+j89F++7pHhByqsZm6
   wUmKWz7cXAgP7dbFZ6siwaK3bx0jrKQ0o1f5IP7eLXbXe4eqh79uXCdqd
   O5A/Map4O2n9jjxDVuu4+Wxu9CMfJdffnojHfA6HrZK0NgL6QQtWUwU3+
   dcQ6Fwxc4qvj624f5Wsm4w6PNZtmX/lbvZhN0VPP4VuN3Ps2Et85aFBGN
   FCqPIUf6Dd7eTfuYfWMpNvE8kF83L6Ky4QLFzbQiGgXGQ1NRTWk26DQQJ
   g==;
X-CSE-ConnectionGUID: CGDNquAUQWG5Yuo36t2Nxw==
X-CSE-MsgGUID: c5KvcS28Saa53d7CVTVB3Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="23707106"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="23707106"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 00:13:22 -0700
X-CSE-ConnectionGUID: ZcexixZXStuP6prl3x1rZQ==
X-CSE-MsgGUID: B6Pcj36/QT+24AjOgrQ8ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="55667841"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
  by fmviesa002.fm.intel.com with ESMTP; 20 May 2024 00:13:16 -0700
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
Subject: [PATCH] riscv, bpf: Introduce shift add helper with Zba optimization
Date: Mon, 20 May 2024 15:16:31 +0800
Message-Id: <20240520071631.2980798-1-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_001328_029217_FC17CF5F 
X-CRM114-Status: UNSURE (   9.80  )
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

Zba extension is very useful for generating addresses that index into array
of basic data types. This patch introduces sh2add and sh3add helpers for
RV32 and RV64 respectively, to accelerate pointer array addressing.

Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
---
 arch/riscv/net/bpf_jit.h        | 33 +++++++++++++++++++++++++++++++++
 arch/riscv/net/bpf_jit_comp32.c |  3 +--
 arch/riscv/net/bpf_jit_comp64.c |  3 +--
 3 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
index 18a7885ba95e..efe51821c463 100644
--- a/arch/riscv/net/bpf_jit.h
+++ b/arch/riscv/net/bpf_jit.h
@@ -740,6 +740,17 @@ static inline u16 rvc_swsp(u32 imm8, u8 rs2)
 	return rv_css_insn(0x6, imm, rs2, 0x2);
 }
 
+/* RVZBA instrutions. */
+static inline u32 rvzba_sh2add(u8 rd, u8 rs1, u8 rs2)
+{
+	return rv_r_insn(0x10, rs2, rs1, 0x4, rd, 0x33);
+}
+
+static inline u32 rvzba_sh3add(u8 rd, u8 rs1, u8 rs2)
+{
+	return rv_r_insn(0x10, rs2, rs1, 0x6, rd, 0x33);
+}
+
 /* RVZBB instrutions. */
 static inline u32 rvzbb_sextb(u8 rd, u8 rs1)
 {
@@ -1093,6 +1104,28 @@ static inline void emit_sw(u8 rs1, s32 off, u8 rs2, struct rv_jit_context *ctx)
 		emit(rv_sw(rs1, off, rs2), ctx);
 }
 
+static inline void emit_sh2add(u8 rd, u8 rs1, u8 rs2, struct rv_jit_context *ctx)
+{
+	if (rvzba_enabled()) {
+		emit(rvzba_sh2add(rd, rs1, rs2), ctx);
+		return;
+	}
+
+	emit_slli(rd, rs1, 2, ctx);
+	emit_add(rd, rd, rs2, ctx);
+}
+
+static inline void emit_sh3add(u8 rd, u8 rs1, u8 rs2, struct rv_jit_context *ctx)
+{
+	if (rvzba_enabled()) {
+		emit(rvzba_sh3add(rd, rs1, rs2), ctx);
+		return;
+	}
+
+	emit_slli(rd, rs1, 3, ctx);
+	emit_add(rd, rd, rs2, ctx);
+}
+
 /* RV64-only helper functions. */
 #if __riscv_xlen == 64
 
diff --git a/arch/riscv/net/bpf_jit_comp32.c b/arch/riscv/net/bpf_jit_comp32.c
index f5ba73bb153d..592dd86fbf81 100644
--- a/arch/riscv/net/bpf_jit_comp32.c
+++ b/arch/riscv/net/bpf_jit_comp32.c
@@ -811,8 +811,7 @@ static int emit_bpf_tail_call(int insn, struct rv_jit_context *ctx)
 	 * if (!prog)
 	 *   goto out;
 	 */
-	emit(rv_slli(RV_REG_T0, lo(idx_reg), 2), ctx);
-	emit(rv_add(RV_REG_T0, RV_REG_T0, lo(arr_reg)), ctx);
+	emit_sh2add(RV_REG_T0, lo(idx_reg), lo(arr_reg), ctx);
 	off = offsetof(struct bpf_array, ptrs);
 	if (is_12b_check(off, insn))
 		return -1;
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index aac190085472..39149ad002da 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -374,8 +374,7 @@ static int emit_bpf_tail_call(int insn, struct rv_jit_context *ctx)
 	 * if (!prog)
 	 *     goto out;
 	 */
-	emit_slli(RV_REG_T2, RV_REG_A2, 3, ctx);
-	emit_add(RV_REG_T2, RV_REG_T2, RV_REG_A1, ctx);
+	emit_sh3add(RV_REG_T2, RV_REG_A2, RV_REG_A1, ctx);
 	off = offsetof(struct bpf_array, ptrs);
 	if (is_12b_check(off, insn))
 		return -1;

base-commit: 92cce91949a497a8a4615f9ba5813b03f7a1f1d5
prerequisite-patch-id: f2b95de7f0f5ff170ecdf723154da7a61e1fc77e
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
