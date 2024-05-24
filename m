Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84463C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 07:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6DrgAM8yXl1IJDqcrhliy4Oqk+HLXaXUa3BLFq/M6Q=; b=QCXWzoV7xGaZ8B
	LXS77pEZcSDTlm0j0Ih774EiclVF0cW95qLvTkTiMr2Yqstse3EISdlaHUZ6Xe0RMKpRpUwBBRFPJ
	47ksrgrNUEmBMNUmvMQr5Pj5OIsuSVCDexKD7PqfI0gSaZW/yH7AGV5ImMqLQNrZiipmy/U5eAEdR
	ISXmlZP8FdN45rKuv8Omnjzn5bBFN793k2twWH+frVhoyzTUr3qvubLEH2drP3oSi6E1EKqk5ZYIl
	c257IA7MANRTJZnJYwsjYlmWq23/54KWrcMygNPqDaZI+1WPByAErzT6JbZ+6/ZpoCtR0fhXyxXMb
	c/v04U18cA4azUwxaVow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAPjk-00000008JmS-1d6I;
	Fri, 24 May 2024 07:53:12 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAPjh-00000008Ji6-2T86
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 07:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716537189; x=1748073189;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=24rp/WrT9pHPUaGJNcHcPwIVsZW4SZ2btnKiehAt6f4=;
  b=mFGme1kCTEgr37ucOTwq0YBFHzic8yNSmlti0hKEJkjVVl85JRV6Y61J
   yoz9jnm0XpPS1ocXSH7dYff4u8IY7X+NTxqc383DgyELMnxYSHSgvc6nC
   w8Jw37m48/VGqbPEAYHnJwEo78XFcSjAElgsNp42xOlM6mrHNw5/86SvA
   VOIISl6uyrC4z7w/R2HOd/d6UIIulUx+KTe0QbJL/c37rr5QJyaOopNQo
   3SpIMItZ0DyHOth6TwWgFyZnOe2Igt918GM1gDQsUx3wFaeQ5RhrhKUK/
   NWSPIVbPve7fd1RWeNwgsaCUZzlW9fdlgPNuPv8nlRfHgbB9HBAphIphK
   g==;
X-CSE-ConnectionGUID: TGmAzoZNRSmjeQoeuaxT0g==
X-CSE-MsgGUID: SPKn3QpmT7uCq5zWb9Db1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="15846006"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; 
   d="scan'208";a="15846006"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 00:53:09 -0700
X-CSE-ConnectionGUID: hoI+mS1CT/i21woqbc6A6w==
X-CSE-MsgGUID: ZE0unwlWR/KX39Mr84rR0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; 
   d="scan'208";a="33953931"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
  by fmviesa006.fm.intel.com with ESMTP; 24 May 2024 00:53:03 -0700
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
	Xiao Wang <xiao.w.wang@intel.com>
Subject: [PATCH bpf-next v4 2/2] riscv, bpf: Introduce shift add helper with Zba optimization
Date: Fri, 24 May 2024 15:55:43 +0800
Message-Id: <20240524075543.4050464-3-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240524075543.4050464-1-xiao.w.wang@intel.com>
References: <20240524075543.4050464-1-xiao.w.wang@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_005309_704140_30072497 
X-CRM114-Status: GOOD (  11.22  )
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
RV32 and RV64 respectively, to accelerate addressing for array of unsigned
long data.

Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
---
 arch/riscv/net/bpf_jit.h        | 33 +++++++++++++++++++++++++++++++++
 arch/riscv/net/bpf_jit_comp32.c |  3 +--
 arch/riscv/net/bpf_jit_comp64.c |  9 +++------
 3 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
index 97041b58237a..1d1c78d4cff1 100644
--- a/arch/riscv/net/bpf_jit.h
+++ b/arch/riscv/net/bpf_jit.h
@@ -742,6 +742,17 @@ static inline u16 rvc_swsp(u32 imm8, u8 rs2)
 	return rv_css_insn(0x6, imm, rs2, 0x2);
 }
 
+/* RVZBA instructions. */
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
 /* RVZBB instructions. */
 static inline u32 rvzbb_sextb(u8 rd, u8 rs1)
 {
@@ -1095,6 +1106,28 @@ static inline void emit_sw(u8 rs1, s32 off, u8 rs2, struct rv_jit_context *ctx)
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
index 79a001d5533e..30ede3ce42d1 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -380,8 +380,7 @@ static int emit_bpf_tail_call(int insn, struct rv_jit_context *ctx)
 	 * if (!prog)
 	 *     goto out;
 	 */
-	emit_slli(RV_REG_T2, RV_REG_A2, 3, ctx);
-	emit_add(RV_REG_T2, RV_REG_T2, RV_REG_A1, ctx);
+	emit_sh3add(RV_REG_T2, RV_REG_A2, RV_REG_A1, ctx);
 	off = offsetof(struct bpf_array, ptrs);
 	if (is_12b_check(off, insn))
 		return -1;
@@ -1097,12 +1096,10 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 			/* Load current CPU number in T1 */
 			emit_ld(RV_REG_T1, offsetof(struct thread_info, cpu),
 				RV_REG_TP, ctx);
-			/* << 3 because offsets are 8 bytes */
-			emit_slli(RV_REG_T1, RV_REG_T1, 3, ctx);
 			/* Load address of __per_cpu_offset array in T2 */
 			emit_addr(RV_REG_T2, (u64)&__per_cpu_offset, extra_pass, ctx);
-			/* Add offset of current CPU to  __per_cpu_offset */
-			emit_add(RV_REG_T1, RV_REG_T2, RV_REG_T1, ctx);
+			/* Get address of __per_cpu_offset[cpu] in T1 */
+			emit_sh3add(RV_REG_T1, RV_REG_T1, RV_REG_T2, ctx);
 			/* Load __per_cpu_offset[cpu] in T1 */
 			emit_ld(RV_REG_T1, 0, RV_REG_T1, ctx);
 			/* Add the offset to Rd */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
