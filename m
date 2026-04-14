Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EF6F531D0
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 03:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yh7HY3PSBNlUFNI8BfALiq9zp2Gx8Ed/9xGsjfF9a4Q=; b=cPhRteTs+H0hCd
	rpSC19fBc4duNDh5uS1RWvCmoJ/NEx19ftTnluSIEP6Qxcw7A0N634nUn2tImpp6fjeDo1stnpIY9
	pWr28B4MdrzhW817JFHmtBMb37HzIGebSDt2Zgiseo0isDAwJ6jUo3w02V1jHy7Ymo5BhC7ksXBTu
	ubKu6pYTf4wmN5u3uaL2Z9zOOUqoYCp0gGw5Dr+CNZ6eZYVFLL+PovX1anry7SxQoDr8XAF17i88c
	XHfgPiOctLOPQuxPTVgaAqdOEb70ORcuaRRBXfWoY08LR91DkRnQXvLyvIzw7aCp2SCapqf02iv+s
	LlRVNeU74IUIifngLnmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUhj-0000000GfWg-37CJ;
	Tue, 14 Apr 2026 03:44:47 +0000
Received: from bg1.exmail.qq.com ([114.132.58.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUhg-0000000GfUi-0z2T
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 03:44:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1776138236;
	bh=8yoI0vDgnOZ9Gkp0CETeZI4o3CaN0GwTP6KguPu6pxk=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=rHptmpJngEeXki2s7POZdCPz8z+MaNXTBLEybjrkLO1TqwdeAwd4iVaWkasHn26OE
	 nTZw9pFIcCJzrOcC9uLnXSVTmq6v0YNtMU2lhDFuQVh5Yfe2wBGTVckp9bkVdOH78k
	 mJM//HDubO32NCKnH/iHlskK/NJiHHjNqKuS7IQo=
X-QQ-mid: zesmtpsz5t1776138153t0c1919cd
X-QQ-Originating-IP: 7B3g45zdNn4SZJRwH7kSE2DHV5cULmG9m+oyghyMva4=
Received: from snode5.. ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Apr 2026 11:42:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18256988191164502552
EX-QQ-RecipientCnt: 26
From: Zane Leung <liangzhen@linux.spacemit.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	gregkh@linuxfoundation.org,
	alexander.shishkin@linux.intel.com,
	irogers@google.com
Cc: coresight@lists.linaro.org,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com,
	mchitale@gmail.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	andrew.jones@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	anup.patel@oss.qualcomm.com,
	mayuresh.chitale@oss.qualcomm.com,
	zhuangqiubin@linux.spacemit.com
Subject: [RFC PATCH 10/12] perf tools: Add Nexus RISC-V Trace decoder
Date: Tue, 14 Apr 2026 11:41:51 +0800
Message-Id: <20260414034153.3272485-11-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
References: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NAK9PD+i5IxvUKN+mqfAwr0EmXJ4pzm3lnQiu3C3uY3xAh2Eba1Gk60L
	AQYOz2GkP5pDZNFzuo8UeiAs5rClmS12LuUcmWKDwHZPMiP3mIOLW1DARCPEy0mCQUp8fT0
	MI6/LpWzd7+KdCuXnEQuTuMFbGI1JtGwC0/EVgcCdRnJ25zX7tIXJJ+SrDcJubNvQvK/EaD
	T0jlE/uVa80G/38aS/PIlBc2AKdzkJj/KorrfD+hio6GwBVlQkMFXrjd3YW1/6AiOhQUpQG
	9DOpfmaI/8wDoDfA953UgdB0O1WVbKZhbthTozkxhGc9CTXKGxP0S5X0bUb0bTeTvKgwvEF
	1QBq9pla3luvtzJWXtDZHA4V7SSScZ3diAqv6IZclAgbWBqoGIxdqa4FmChdO9GvKqIreQS
	Kx7LyT55Ari5FhZ0aXTxRLD7IsEMQZKYl347YV+fclEsLdHfm88uUGsvu9nVz/3nODWggew
	Hl261GfBtH+R92XVkXeIeMrE/59FlgT3UEOAMYUf/DFpJlBnW0rJMnWMuDJJca6yHWNEbjX
	DZZ0gHcMTu99DMbVbMQOq2Uz+oVI03AVH+NqxnMAtTRUFANUF0ro8v+0hbonyWDyct8OoUd
	d9sROGfahIfUKBh0uDxagyZnicNA1m6KnGWiX+1cda3FLuJK4snLKvmLRKjua0r8CD0fCjp
	hXCfs+/Cx7MIvN8cZky88ZJno/OSEMmDWEeGGEOrjlXlOvezREyDMMN2LntlfiqUeM/Anl5
	UbIBJ0UwQzytoOtKw6UdvPZIp/yh8It2lm6/RiJw5wScLi1H33YwSlB3B7AH+vSYW1kYejG
	R9UJziHQEPcjQrAWHc4+NBLoVPPuR7LK2cfjzRriAWkU7kw8pRG790Kw8ogFYumZ6iojzmM
	d613cfy+U9yqzJfxm0fdMEBz+B3FrwOminex1RQU2Z/oLFnf8B6dFJQPyhW4rc230dmwp+5
	ihV/xd2+77gxOedrI2UvUTBCPU69OhBedG9qBT0oAnN8aXIDkpqy/uw8YdIj5pbb7pY5Prd
	GHtqoSUSC4b8a9yTPSfsJMmobbVROjRHR5d6HJOuM5pDX4LKw/JLxucp/CZzofV2cdNg/xY
	GuepsqcSAypZLz/rXWMwxP5caYz/vvb3g==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_204445_006299_23BE5D6D 
X-CRM114-Status: GOOD (  13.18  )
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

From: liangzhen <zhen.liang@spacemit.com>

Add support for RISC-V Nexus Trace decoder based on the reference
implementation from the RISC-V Nexus Trace specification. This includes
a CoreSight frame deformatter to remove the trace formatter overhead.

Signed-off-by: liangzhen <zhen.liang@spacemit.com>
---
 tools/arch/riscv/include/asm/insn.h           |  645 ++++++++
 tools/perf/arch/riscv/util/auxtrace.c         |    1 +
 tools/perf/util/Build                         |    2 +
 tools/perf/util/nexus-rv-decoder/Build        |    1 +
 .../util/nexus-rv-decoder/nexus-rv-decoder.c  | 1364 +++++++++++++++++
 .../util/nexus-rv-decoder/nexus-rv-decoder.h  |  139 ++
 .../perf/util/nexus-rv-decoder/nexus-rv-msg.h |  190 +++
 7 files changed, 2342 insertions(+)
 create mode 100644 tools/arch/riscv/include/asm/insn.h
 create mode 100644 tools/perf/util/nexus-rv-decoder/Build
 create mode 100644 tools/perf/util/nexus-rv-decoder/nexus-rv-decoder.c
 create mode 100644 tools/perf/util/nexus-rv-decoder/nexus-rv-decoder.h
 create mode 100644 tools/perf/util/nexus-rv-decoder/nexus-rv-msg.h

diff --git a/tools/arch/riscv/include/asm/insn.h b/tools/arch/riscv/include/asm/insn.h
new file mode 100644
index 000000000000..6c020afe926b
--- /dev/null
+++ b/tools/arch/riscv/include/asm/insn.h
@@ -0,0 +1,645 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 SiFive
+ */
+
+#ifndef _ASM_RISCV_INSN_H
+#define _ASM_RISCV_INSN_H
+
+#include <linux/bits.h>
+
+#define RV_INSN_FUNCT3_MASK	GENMASK(14, 12)
+#define RV_INSN_FUNCT3_OPOFF	12
+#define RV_INSN_OPCODE_MASK	GENMASK(6, 0)
+#define RV_INSN_OPCODE_OPOFF	0
+#define RV_INSN_FUNCT12_OPOFF	20
+
+#define RV_ENCODE_FUNCT3(f_)	(RVG_FUNCT3_##f_ << RV_INSN_FUNCT3_OPOFF)
+#define RV_ENCODE_FUNCT12(f_)	(RVG_FUNCT12_##f_ << RV_INSN_FUNCT12_OPOFF)
+
+/* The bit field of immediate value in I-type instruction */
+#define RV_I_IMM_SIGN_OPOFF	31
+#define RV_I_IMM_11_0_OPOFF	20
+#define RV_I_IMM_SIGN_OFF	12
+#define RV_I_IMM_11_0_OFF	0
+#define RV_I_IMM_11_0_MASK	GENMASK(11, 0)
+
+/* The bit field of immediate value in J-type instruction */
+#define RV_J_IMM_SIGN_OPOFF	31
+#define RV_J_IMM_10_1_OPOFF	21
+#define RV_J_IMM_11_OPOFF	20
+#define RV_J_IMM_19_12_OPOFF	12
+#define RV_J_IMM_SIGN_OFF	20
+#define RV_J_IMM_10_1_OFF	1
+#define RV_J_IMM_11_OFF		11
+#define RV_J_IMM_19_12_OFF	12
+#define RV_J_IMM_10_1_MASK	GENMASK(9, 0)
+#define RV_J_IMM_11_MASK	GENMASK(0, 0)
+#define RV_J_IMM_19_12_MASK	GENMASK(7, 0)
+
+/*
+ * U-type IMMs contain the upper 20bits [31:20] of an immediate with
+ * the rest filled in by zeros, so no shifting required. Similarly,
+ * bit31 contains the signed state, so no sign extension necessary.
+ */
+#define RV_U_IMM_SIGN_OPOFF	31
+#define RV_U_IMM_31_12_OPOFF	0
+#define RV_U_IMM_31_12_MASK	GENMASK(31, 12)
+
+/* The bit field of immediate value in B-type instruction */
+#define RV_B_IMM_SIGN_OPOFF	31
+#define RV_B_IMM_10_5_OPOFF	25
+#define RV_B_IMM_4_1_OPOFF	8
+#define RV_B_IMM_11_OPOFF	7
+#define RV_B_IMM_SIGN_OFF	12
+#define RV_B_IMM_10_5_OFF	5
+#define RV_B_IMM_4_1_OFF	1
+#define RV_B_IMM_11_OFF		11
+#define RV_B_IMM_10_5_MASK	GENMASK(5, 0)
+#define RV_B_IMM_4_1_MASK	GENMASK(3, 0)
+#define RV_B_IMM_11_MASK	GENMASK(0, 0)
+
+/* The register offset in RVG instruction */
+#define RVG_RS1_OPOFF		15
+#define RVG_RS2_OPOFF		20
+#define RVG_RD_OPOFF		7
+#define RVG_RS1_MASK		GENMASK(4, 0)
+#define RVG_RS2_MASK		GENMASK(4, 0)
+#define RVG_RD_MASK		GENMASK(4, 0)
+
+/* The bit field of immediate value in RVC J instruction */
+#define RVC_J_IMM_SIGN_OPOFF	12
+#define RVC_J_IMM_4_OPOFF	11
+#define RVC_J_IMM_9_8_OPOFF	9
+#define RVC_J_IMM_10_OPOFF	8
+#define RVC_J_IMM_6_OPOFF	7
+#define RVC_J_IMM_7_OPOFF	6
+#define RVC_J_IMM_3_1_OPOFF	3
+#define RVC_J_IMM_5_OPOFF	2
+#define RVC_J_IMM_SIGN_OFF	11
+#define RVC_J_IMM_4_OFF		4
+#define RVC_J_IMM_9_8_OFF	8
+#define RVC_J_IMM_10_OFF	10
+#define RVC_J_IMM_6_OFF		6
+#define RVC_J_IMM_7_OFF		7
+#define RVC_J_IMM_3_1_OFF	1
+#define RVC_J_IMM_5_OFF		5
+#define RVC_J_IMM_4_MASK	GENMASK(0, 0)
+#define RVC_J_IMM_9_8_MASK	GENMASK(1, 0)
+#define RVC_J_IMM_10_MASK	GENMASK(0, 0)
+#define RVC_J_IMM_6_MASK	GENMASK(0, 0)
+#define RVC_J_IMM_7_MASK	GENMASK(0, 0)
+#define RVC_J_IMM_3_1_MASK	GENMASK(2, 0)
+#define RVC_J_IMM_5_MASK	GENMASK(0, 0)
+
+/* The bit field of immediate value in RVC B instruction */
+#define RVC_B_IMM_SIGN_OPOFF	12
+#define RVC_B_IMM_4_3_OPOFF	10
+#define RVC_B_IMM_7_6_OPOFF	5
+#define RVC_B_IMM_2_1_OPOFF	3
+#define RVC_B_IMM_5_OPOFF	2
+#define RVC_B_IMM_SIGN_OFF	8
+#define RVC_B_IMM_4_3_OFF	3
+#define RVC_B_IMM_7_6_OFF	6
+#define RVC_B_IMM_2_1_OFF	1
+#define RVC_B_IMM_5_OFF		5
+#define RVC_B_IMM_4_3_MASK	GENMASK(1, 0)
+#define RVC_B_IMM_7_6_MASK	GENMASK(1, 0)
+#define RVC_B_IMM_2_1_MASK	GENMASK(1, 0)
+#define RVC_B_IMM_5_MASK	GENMASK(0, 0)
+
+#define RVC_INSN_FUNCT4_MASK	GENMASK(15, 12)
+#define RVC_INSN_FUNCT4_OPOFF	12
+#define RVC_INSN_FUNCT3_MASK	GENMASK(15, 13)
+#define RVC_INSN_FUNCT3_OPOFF	13
+#define RVC_INSN_J_RS1_MASK	GENMASK(11, 7)
+#define RVC_INSN_J_RS2_MASK	GENMASK(6, 2)
+#define RVC_INSN_OPCODE_MASK	GENMASK(1, 0)
+#define RVC_ENCODE_FUNCT3(f_)	(RVC_FUNCT3_##f_ << RVC_INSN_FUNCT3_OPOFF)
+#define RVC_ENCODE_FUNCT4(f_)	(RVC_FUNCT4_##f_ << RVC_INSN_FUNCT4_OPOFF)
+
+/* The register offset in RVC op=C0 instruction */
+#define RVC_C0_RS1_OPOFF	7
+#define RVC_C0_RS2_OPOFF	2
+#define RVC_C0_RD_OPOFF		2
+
+/* The register offset in RVC op=C1 instruction */
+#define RVC_C1_RS1_OPOFF	7
+#define RVC_C1_RS2_OPOFF	2
+#define RVC_C1_RD_OPOFF		7
+
+/* The register offset in RVC op=C2 instruction */
+#define RVC_C2_RS1_OPOFF	7
+#define RVC_C2_RS2_OPOFF	2
+#define RVC_C2_RD_OPOFF		7
+#define RVC_C2_RS1_MASK		GENMASK(4, 0)
+
+/* parts of opcode for RVG*/
+#define RVG_OPCODE_FENCE	0x0f
+#define RVG_OPCODE_AUIPC	0x17
+#define RVG_OPCODE_BRANCH	0x63
+#define RVG_OPCODE_JALR		0x67
+#define RVG_OPCODE_JAL		0x6f
+#define RVG_OPCODE_SYSTEM	0x73
+#define RVG_SYSTEM_CSR_OFF	20
+#define RVG_SYSTEM_CSR_MASK	GENMASK(12, 0)
+
+/* parts of opcode for RVF, RVD and RVQ */
+#define RVFDQ_FL_FS_WIDTH_OFF	12
+#define RVFDQ_FL_FS_WIDTH_MASK	GENMASK(2, 0)
+#define RVFDQ_FL_FS_WIDTH_W	2
+#define RVFDQ_FL_FS_WIDTH_D	3
+#define RVFDQ_LS_FS_WIDTH_Q	4
+#define RVFDQ_OPCODE_FL		0x07
+#define RVFDQ_OPCODE_FS		0x27
+
+/* parts of opcode for RVV */
+#define RVV_OPCODE_VECTOR	0x57
+#define RVV_VL_VS_WIDTH_8	0
+#define RVV_VL_VS_WIDTH_16	5
+#define RVV_VL_VS_WIDTH_32	6
+#define RVV_VL_VS_WIDTH_64	7
+#define RVV_OPCODE_VL		RVFDQ_OPCODE_FL
+#define RVV_OPCODE_VS		RVFDQ_OPCODE_FS
+
+/* parts of opcode for RVC*/
+#define RVC_OPCODE_C0		0x0
+#define RVC_OPCODE_C1		0x1
+#define RVC_OPCODE_C2		0x2
+
+/* parts of funct3 code for I, M, A extension*/
+#define RVG_FUNCT3_JALR		0x0
+#define RVG_FUNCT3_BEQ		0x0
+#define RVG_FUNCT3_BNE		0x1
+#define RVG_FUNCT3_BLT		0x4
+#define RVG_FUNCT3_BGE		0x5
+#define RVG_FUNCT3_BLTU		0x6
+#define RVG_FUNCT3_BGEU		0x7
+
+/* parts of funct3 code for C extension*/
+#define RVC_FUNCT3_C_BEQZ	0x6
+#define RVC_FUNCT3_C_BNEZ	0x7
+#define RVC_FUNCT3_C_J		0x5
+#define RVC_FUNCT3_C_JAL	0x1
+#define RVC_FUNCT4_C_JR		0x8
+#define RVC_FUNCT4_C_JALR	0x9
+#define RVC_FUNCT4_C_EBREAK	0x9
+
+#define RVG_FUNCT12_ECALL	0x0
+#define RVG_FUNCT12_EBREAK	0x1
+#define RVG_FUNCT12_SRET	0x102
+#define RVG_FUNCT12_MRET	0x303
+
+#define RVG_MATCH_AUIPC		(RVG_OPCODE_AUIPC)
+#define RVG_MATCH_JALR		(RV_ENCODE_FUNCT3(JALR) | RVG_OPCODE_JALR)
+#define RVG_MATCH_JAL		(RVG_OPCODE_JAL)
+#define RVG_MATCH_FENCE		(RVG_OPCODE_FENCE)
+#define RVG_MATCH_BEQ		(RV_ENCODE_FUNCT3(BEQ) | RVG_OPCODE_BRANCH)
+#define RVG_MATCH_BNE		(RV_ENCODE_FUNCT3(BNE) | RVG_OPCODE_BRANCH)
+#define RVG_MATCH_BLT		(RV_ENCODE_FUNCT3(BLT) | RVG_OPCODE_BRANCH)
+#define RVG_MATCH_BGE		(RV_ENCODE_FUNCT3(BGE) | RVG_OPCODE_BRANCH)
+#define RVG_MATCH_BLTU		(RV_ENCODE_FUNCT3(BLTU) | RVG_OPCODE_BRANCH)
+#define RVG_MATCH_BGEU		(RV_ENCODE_FUNCT3(BGEU) | RVG_OPCODE_BRANCH)
+#define RVG_MATCH_ECALL		(RV_ENCODE_FUNCT12(EBREAK) | RVG_OPCODE_SYSTEM)
+#define RVG_MATCH_EBREAK	(RV_ENCODE_FUNCT12(EBREAK) | RVG_OPCODE_SYSTEM)
+#define RVG_MATCH_SRET		(RV_ENCODE_FUNCT12(SRET) | RVG_OPCODE_SYSTEM)
+#define RVG_MATCH_MRET		(RV_ENCODE_FUNCT12(MRET) | RVG_OPCODE_SYSTEM)
+#define RVC_MATCH_C_BEQZ	(RVC_ENCODE_FUNCT3(C_BEQZ) | RVC_OPCODE_C1)
+#define RVC_MATCH_C_BNEZ	(RVC_ENCODE_FUNCT3(C_BNEZ) | RVC_OPCODE_C1)
+#define RVC_MATCH_C_J		(RVC_ENCODE_FUNCT3(C_J) | RVC_OPCODE_C1)
+#define RVC_MATCH_C_JAL		(RVC_ENCODE_FUNCT3(C_JAL) | RVC_OPCODE_C1)
+#define RVC_MATCH_C_JR		(RVC_ENCODE_FUNCT4(C_JR) | RVC_OPCODE_C2)
+#define RVC_MATCH_C_JALR	(RVC_ENCODE_FUNCT4(C_JALR) | RVC_OPCODE_C2)
+#define RVC_MATCH_C_EBREAK	(RVC_ENCODE_FUNCT4(C_EBREAK) | RVC_OPCODE_C2)
+
+#define RVG_MASK_AUIPC		(RV_INSN_OPCODE_MASK)
+#define RVG_MASK_JALR		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
+#define RVG_MASK_JAL		(RV_INSN_OPCODE_MASK)
+#define RVG_MASK_FENCE		(RV_INSN_OPCODE_MASK)
+#define RVC_MASK_C_JALR		(RVC_INSN_FUNCT4_MASK | RVC_INSN_J_RS2_MASK | RVC_INSN_OPCODE_MASK)
+#define RVC_MASK_C_JR		(RVC_INSN_FUNCT4_MASK | RVC_INSN_J_RS2_MASK | RVC_INSN_OPCODE_MASK)
+#define RVC_MASK_C_JAL		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
+#define RVC_MASK_C_J		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
+#define RVG_MASK_BEQ		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
+#define RVG_MASK_BNE		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
+#define RVG_MASK_BLT		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
+#define RVG_MASK_BGE		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
+#define RVG_MASK_BLTU		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
+#define RVG_MASK_BGEU		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
+#define RVC_MASK_C_BEQZ		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
+#define RVC_MASK_C_BNEZ		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
+#define RVC_MASK_C_EBREAK	0xffff
+#define RVG_MASK_EBREAK		0xffffffff
+#define RVG_MASK_ECALL		0xffffffff
+#define RVG_MASK_SRET		0xffffffff
+#define RVG_MASK_MRET		0xffffffff
+
+#define __INSN_LENGTH_MASK	_UL(0x3)
+#define __INSN_LENGTH_GE_32	_UL(0x3)
+#define __INSN_OPCODE_MASK	_UL(0x7F)
+#define __INSN_BRANCH_OPCODE	_UL(RVG_OPCODE_BRANCH)
+
+#define __RISCV_INSN_FUNCS(name, mask, val)				\
+static __always_inline bool riscv_insn_is_##name(u32 code)		\
+{									\
+	BUILD_BUG_ON(~(mask) & (val));					\
+	return (code & (mask)) == (val);				\
+}									\
+
+#if __riscv_xlen == 32
+/* C.JAL is an RV32C-only instruction */
+__RISCV_INSN_FUNCS(c_jal, RVC_MASK_C_JAL, RVC_MATCH_C_JAL)
+#else
+#define riscv_insn_is_c_jal(opcode) 0
+#endif
+__RISCV_INSN_FUNCS(auipc, RVG_MASK_AUIPC, RVG_MATCH_AUIPC)
+__RISCV_INSN_FUNCS(jalr, RVG_MASK_JALR, RVG_MATCH_JALR)
+__RISCV_INSN_FUNCS(jal, RVG_MASK_JAL, RVG_MATCH_JAL)
+__RISCV_INSN_FUNCS(c_j, RVC_MASK_C_J, RVC_MATCH_C_J)
+__RISCV_INSN_FUNCS(beq, RVG_MASK_BEQ, RVG_MATCH_BEQ)
+__RISCV_INSN_FUNCS(bne, RVG_MASK_BNE, RVG_MATCH_BNE)
+__RISCV_INSN_FUNCS(blt, RVG_MASK_BLT, RVG_MATCH_BLT)
+__RISCV_INSN_FUNCS(bge, RVG_MASK_BGE, RVG_MATCH_BGE)
+__RISCV_INSN_FUNCS(bltu, RVG_MASK_BLTU, RVG_MATCH_BLTU)
+__RISCV_INSN_FUNCS(bgeu, RVG_MASK_BGEU, RVG_MATCH_BGEU)
+__RISCV_INSN_FUNCS(c_beqz, RVC_MASK_C_BEQZ, RVC_MATCH_C_BEQZ)
+__RISCV_INSN_FUNCS(c_bnez, RVC_MASK_C_BNEZ, RVC_MATCH_C_BNEZ)
+__RISCV_INSN_FUNCS(c_ebreak, RVC_MASK_C_EBREAK, RVC_MATCH_C_EBREAK)
+__RISCV_INSN_FUNCS(ebreak, RVG_MASK_EBREAK, RVG_MATCH_EBREAK)
+__RISCV_INSN_FUNCS(ecall, RVG_MASK_EBREAK, RVG_MATCH_EBREAK)
+__RISCV_INSN_FUNCS(sret, RVG_MASK_SRET, RVG_MATCH_SRET)
+__RISCV_INSN_FUNCS(mret, RVG_MASK_MRET, RVG_MATCH_MRET)
+__RISCV_INSN_FUNCS(fence, RVG_MASK_FENCE, RVG_MATCH_FENCE);
+
+/* special case to catch _any_ system instruction */
+static __always_inline bool riscv_insn_is_system(u32 code)
+{
+	return (code & RV_INSN_OPCODE_MASK) == RVG_OPCODE_SYSTEM;
+}
+
+/* special case to catch _any_ branch instruction */
+static __always_inline bool riscv_insn_is_branch(u32 code)
+{
+	return (code & RV_INSN_OPCODE_MASK) == RVG_OPCODE_BRANCH;
+}
+
+static __always_inline bool riscv_insn_is_c_jr(u32 code)
+{
+	return (code & RVC_MASK_C_JR) == RVC_MATCH_C_JR &&
+	       (code & RVC_INSN_J_RS1_MASK) != 0;
+}
+
+static __always_inline bool riscv_insn_is_c_jalr(u32 code)
+{
+	return (code & RVC_MASK_C_JALR) == RVC_MATCH_C_JALR &&
+	       (code & RVC_INSN_J_RS1_MASK) != 0;
+}
+
+#define INSN_MATCH_LB		0x3
+#define INSN_MASK_LB		0x707f
+#define INSN_MATCH_LH		0x1003
+#define INSN_MASK_LH		0x707f
+#define INSN_MATCH_LW		0x2003
+#define INSN_MASK_LW		0x707f
+#define INSN_MATCH_LD		0x3003
+#define INSN_MASK_LD		0x707f
+#define INSN_MATCH_LBU		0x4003
+#define INSN_MASK_LBU		0x707f
+#define INSN_MATCH_LHU		0x5003
+#define INSN_MASK_LHU		0x707f
+#define INSN_MATCH_LWU		0x6003
+#define INSN_MASK_LWU		0x707f
+#define INSN_MATCH_SB		0x23
+#define INSN_MASK_SB		0x707f
+#define INSN_MATCH_SH		0x1023
+#define INSN_MASK_SH		0x707f
+#define INSN_MATCH_SW		0x2023
+#define INSN_MASK_SW		0x707f
+#define INSN_MATCH_SD		0x3023
+#define INSN_MASK_SD		0x707f
+
+#define INSN_MATCH_C_LD		0x6000
+#define INSN_MASK_C_LD		0xe003
+#define INSN_MATCH_C_SD		0xe000
+#define INSN_MASK_C_SD		0xe003
+#define INSN_MATCH_C_LW		0x4000
+#define INSN_MASK_C_LW		0xe003
+#define INSN_MATCH_C_SW		0xc000
+#define INSN_MASK_C_SW		0xe003
+#define INSN_MATCH_C_LDSP	0x6002
+#define INSN_MASK_C_LDSP	0xe003
+#define INSN_MATCH_C_SDSP	0xe002
+#define INSN_MASK_C_SDSP	0xe003
+#define INSN_MATCH_C_LWSP	0x4002
+#define INSN_MASK_C_LWSP	0xe003
+#define INSN_MATCH_C_SWSP	0xc002
+#define INSN_MASK_C_SWSP	0xe003
+
+#define INSN_OPCODE_MASK	0x007c
+#define INSN_OPCODE_SHIFT	2
+#define INSN_OPCODE_SYSTEM	28
+
+#define INSN_MASK_WFI		0xffffffff
+#define INSN_MATCH_WFI		0x10500073
+
+#define INSN_MASK_WRS		0xffffffff
+#define INSN_MATCH_WRS		0x00d00073
+
+#define INSN_MATCH_CSRRW	0x1073
+#define INSN_MASK_CSRRW		0x707f
+#define INSN_MATCH_CSRRS	0x2073
+#define INSN_MASK_CSRRS		0x707f
+#define INSN_MATCH_CSRRC	0x3073
+#define INSN_MASK_CSRRC		0x707f
+#define INSN_MATCH_CSRRWI	0x5073
+#define INSN_MASK_CSRRWI	0x707f
+#define INSN_MATCH_CSRRSI	0x6073
+#define INSN_MASK_CSRRSI	0x707f
+#define INSN_MATCH_CSRRCI	0x7073
+#define INSN_MASK_CSRRCI	0x707f
+
+#define INSN_MATCH_FLW		0x2007
+#define INSN_MASK_FLW		0x707f
+#define INSN_MATCH_FLD		0x3007
+#define INSN_MASK_FLD		0x707f
+#define INSN_MATCH_FLQ		0x4007
+#define INSN_MASK_FLQ		0x707f
+#define INSN_MATCH_FSW		0x2027
+#define INSN_MASK_FSW		0x707f
+#define INSN_MATCH_FSD		0x3027
+#define INSN_MASK_FSD		0x707f
+#define INSN_MATCH_FSQ		0x4027
+#define INSN_MASK_FSQ		0x707f
+
+#define INSN_MATCH_C_FLD	0x2000
+#define INSN_MASK_C_FLD		0xe003
+#define INSN_MATCH_C_FLW	0x6000
+#define INSN_MASK_C_FLW		0xe003
+#define INSN_MATCH_C_FSD	0xa000
+#define INSN_MASK_C_FSD		0xe003
+#define INSN_MATCH_C_FSW	0xe000
+#define INSN_MASK_C_FSW		0xe003
+#define INSN_MATCH_C_FLDSP	0x2002
+#define INSN_MASK_C_FLDSP	0xe003
+#define INSN_MATCH_C_FSDSP	0xa002
+#define INSN_MASK_C_FSDSP	0xe003
+#define INSN_MATCH_C_FLWSP	0x6002
+#define INSN_MASK_C_FLWSP	0xe003
+#define INSN_MATCH_C_FSWSP	0xe002
+#define INSN_MASK_C_FSWSP	0xe003
+
+#define INSN_MATCH_C_LHU		0x8400
+#define INSN_MASK_C_LHU			0xfc43
+#define INSN_MATCH_C_LH			0x8440
+#define INSN_MASK_C_LH			0xfc43
+#define INSN_MATCH_C_SH			0x8c00
+#define INSN_MASK_C_SH			0xfc43
+
+#define INSN_16BIT_MASK		0x3
+#define INSN_IS_16BIT(insn)	(((insn) & INSN_16BIT_MASK) != INSN_16BIT_MASK)
+#define INSN_LEN(insn)		(INSN_IS_16BIT(insn) ? 2 : 4)
+
+#define SHIFT_RIGHT(x, y)		\
+	((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
+
+#define REG_MASK			\
+	((1 << (5 + LOG_REGBYTES)) - (1 << LOG_REGBYTES))
+
+#define REG_OFFSET(insn, pos)		\
+	(SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
+
+#define REG_PTR(insn, pos, regs)	\
+	((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
+
+#define GET_RS1(insn, regs)	(*REG_PTR(insn, SH_RS1, regs))
+#define GET_RS2(insn, regs)	(*REG_PTR(insn, SH_RS2, regs))
+#define GET_RS1S(insn, regs)	(*REG_PTR(RVC_RS1S(insn), 0, regs))
+#define GET_RS2S(insn, regs)	(*REG_PTR(RVC_RS2S(insn), 0, regs))
+#define GET_RS2C(insn, regs)	(*REG_PTR(insn, SH_RS2C, regs))
+#define GET_SP(regs)		(*REG_PTR(2, 0, regs))
+#define SET_RD(insn, regs, val)	(*REG_PTR(insn, SH_RD, regs) = (val))
+#define IMM_I(insn)		((s32)(insn) >> 20)
+#define IMM_S(insn)		(((s32)(insn) >> 25 << 5) | \
+				 (s32)(((insn) >> 7) & 0x1f))
+
+#define SH_RD			7
+#define SH_RS1			15
+#define SH_RS2			20
+#define SH_RS2C			2
+#define MASK_RX			0x1f
+
+#if defined(CONFIG_64BIT)
+#define LOG_REGBYTES		3
+#else
+#define LOG_REGBYTES		2
+#endif
+
+#define MASK_FUNCT3		0x7000
+
+#define GET_FUNCT3(insn)	(((insn) >> 12) & 7)
+
+#define RV_IMM_SIGN(x)		(-(((x) >> 31) & 1))
+#define RVC_IMM_SIGN(x)		(-(((x) >> 12) & 1))
+#define RV_X_MASK(X, s, mask)	(((X) >> (s)) & (mask))
+#define RV_X(X, s, n)		RV_X_MASK(X, s, ((1 << (n)) - 1))
+#define RVC_LW_IMM(x)		((RV_X(x, 6, 1) << 2) | \
+				 (RV_X(x, 10, 3) << 3) | \
+				 (RV_X(x, 5, 1) << 6))
+#define RVC_LD_IMM(x)		((RV_X(x, 10, 3) << 3) | \
+				 (RV_X(x, 5, 2) << 6))
+#define RVC_LWSP_IMM(x)		((RV_X(x, 4, 3) << 2) | \
+				 (RV_X(x, 12, 1) << 5) | \
+				 (RV_X(x, 2, 2) << 6))
+#define RVC_LDSP_IMM(x)		((RV_X(x, 5, 2) << 3) | \
+				 (RV_X(x, 12, 1) << 5) | \
+				 (RV_X(x, 2, 3) << 6))
+#define RVC_SWSP_IMM(x)		((RV_X(x, 9, 4) << 2) | \
+				 (RV_X(x, 7, 2) << 6))
+#define RVC_SDSP_IMM(x)		((RV_X(x, 10, 3) << 3) | \
+				 (RV_X(x, 7, 3) << 6))
+#define RVC_RS1S(insn)		(8 + RV_X(insn, SH_RD, 3))
+#define RVC_RS2S(insn)		(8 + RV_X(insn, SH_RS2C, 3))
+#define RVC_RS2(insn)		RV_X(insn, SH_RS2C, 5)
+#define RVC_X(X, s, mask)	RV_X_MASK(X, s, mask)
+
+#define RV_EXTRACT_FUNCT3(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X_MASK(x_, RV_INSN_FUNCT3_OPOFF, \
+		   RV_INSN_FUNCT3_MASK >> RV_INSN_FUNCT3_OPOFF)); })
+
+#define RV_EXTRACT_RS1_REG(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X_MASK(x_, RVG_RS1_OPOFF, RVG_RS1_MASK)); })
+
+#define RV_EXTRACT_RS2_REG(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X_MASK(x_, RVG_RS2_OPOFF, RVG_RS2_MASK)); })
+
+#define RV_EXTRACT_RD_REG(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X_MASK(x_, RVG_RD_OPOFF, RVG_RD_MASK)); })
+
+#define RV_EXTRACT_UTYPE_IMM(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X_MASK(x_, RV_U_IMM_31_12_OPOFF, RV_U_IMM_31_12_MASK)); })
+
+#define RV_EXTRACT_JTYPE_IMM(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X_MASK(x_, RV_J_IMM_10_1_OPOFF, RV_J_IMM_10_1_MASK) << RV_J_IMM_10_1_OFF) | \
+	(RV_X_MASK(x_, RV_J_IMM_11_OPOFF, RV_J_IMM_11_MASK) << RV_J_IMM_11_OFF) | \
+	(RV_X_MASK(x_, RV_J_IMM_19_12_OPOFF, RV_J_IMM_19_12_MASK) << RV_J_IMM_19_12_OFF) | \
+	(RV_IMM_SIGN(x_) << RV_J_IMM_SIGN_OFF); })
+
+#define RV_EXTRACT_ITYPE_IMM(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X_MASK(x_, RV_I_IMM_11_0_OPOFF, RV_I_IMM_11_0_MASK)) | \
+	(RV_IMM_SIGN(x_) << RV_I_IMM_SIGN_OFF); })
+
+#define RV_EXTRACT_BTYPE_IMM(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X_MASK(x_, RV_B_IMM_4_1_OPOFF, RV_B_IMM_4_1_MASK) << RV_B_IMM_4_1_OFF) | \
+	(RV_X_MASK(x_, RV_B_IMM_10_5_OPOFF, RV_B_IMM_10_5_MASK) << RV_B_IMM_10_5_OFF) | \
+	(RV_X_MASK(x_, RV_B_IMM_11_OPOFF, RV_B_IMM_11_MASK) << RV_B_IMM_11_OFF) | \
+	(RV_IMM_SIGN(x_) << RV_B_IMM_SIGN_OFF); })
+
+#define RVC_EXTRACT_C2_RS1_REG(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X_MASK(x_, RVC_C2_RS1_OPOFF, RVC_C2_RS1_MASK)); })
+
+#define RVC_EXTRACT_JTYPE_IMM(x) \
+	({typeof(x) x_ = (x); \
+	(RVC_X(x_, RVC_J_IMM_3_1_OPOFF, RVC_J_IMM_3_1_MASK) << RVC_J_IMM_3_1_OFF) | \
+	(RVC_X(x_, RVC_J_IMM_4_OPOFF, RVC_J_IMM_4_MASK) << RVC_J_IMM_4_OFF) | \
+	(RVC_X(x_, RVC_J_IMM_5_OPOFF, RVC_J_IMM_5_MASK) << RVC_J_IMM_5_OFF) | \
+	(RVC_X(x_, RVC_J_IMM_6_OPOFF, RVC_J_IMM_6_MASK) << RVC_J_IMM_6_OFF) | \
+	(RVC_X(x_, RVC_J_IMM_7_OPOFF, RVC_J_IMM_7_MASK) << RVC_J_IMM_7_OFF) | \
+	(RVC_X(x_, RVC_J_IMM_9_8_OPOFF, RVC_J_IMM_9_8_MASK) << RVC_J_IMM_9_8_OFF) | \
+	(RVC_X(x_, RVC_J_IMM_10_OPOFF, RVC_J_IMM_10_MASK) << RVC_J_IMM_10_OFF) | \
+	(RVC_IMM_SIGN(x_) << RVC_J_IMM_SIGN_OFF); })
+
+#define RVC_EXTRACT_BTYPE_IMM(x) \
+	({typeof(x) x_ = (x); \
+	(RVC_X(x_, RVC_B_IMM_2_1_OPOFF, RVC_B_IMM_2_1_MASK) << RVC_B_IMM_2_1_OFF) | \
+	(RVC_X(x_, RVC_B_IMM_4_3_OPOFF, RVC_B_IMM_4_3_MASK) << RVC_B_IMM_4_3_OFF) | \
+	(RVC_X(x_, RVC_B_IMM_5_OPOFF, RVC_B_IMM_5_MASK) << RVC_B_IMM_5_OFF) | \
+	(RVC_X(x_, RVC_B_IMM_7_6_OPOFF, RVC_B_IMM_7_6_MASK) << RVC_B_IMM_7_6_OFF) | \
+	(RVC_IMM_SIGN(x_) << RVC_B_IMM_SIGN_OFF); })
+
+#define RVG_EXTRACT_SYSTEM_CSR(x) \
+	({typeof(x) x_ = (x); RV_X_MASK(x_, RVG_SYSTEM_CSR_OFF, RVG_SYSTEM_CSR_MASK); })
+
+#define RVFDQ_EXTRACT_FL_FS_WIDTH(x) \
+	({typeof(x) x_ = (x); RV_X_MASK(x_, RVFDQ_FL_FS_WIDTH_OFF, \
+				   RVFDQ_FL_FS_WIDTH_MASK); })
+
+#define RVV_EXTRACT_VL_VS_WIDTH(x) RVFDQ_EXTRACT_FL_FS_WIDTH(x)
+
+/*
+ * Get the immediate from a J-type instruction.
+ *
+ * @insn: instruction to process
+ * Return: immediate
+ */
+static inline s32 riscv_insn_extract_jtype_imm(u32 insn)
+{
+	return RV_EXTRACT_JTYPE_IMM(insn);
+}
+
+/*
+ * Update a J-type instruction with an immediate value.
+ *
+ * @insn: pointer to the jtype instruction
+ * @imm: the immediate to insert into the instruction
+ */
+static inline void riscv_insn_insert_jtype_imm(u32 *insn, s32 imm)
+{
+	/* drop the old IMMs, all jal IMM bits sit at 31:12 */
+	*insn &= ~GENMASK(31, 12);
+	*insn |= (RV_X_MASK(imm, RV_J_IMM_10_1_OFF, RV_J_IMM_10_1_MASK) << RV_J_IMM_10_1_OPOFF) |
+		 (RV_X_MASK(imm, RV_J_IMM_11_OFF, RV_J_IMM_11_MASK) << RV_J_IMM_11_OPOFF) |
+		 (RV_X_MASK(imm, RV_J_IMM_19_12_OFF, RV_J_IMM_19_12_MASK) << RV_J_IMM_19_12_OPOFF) |
+		 (RV_X_MASK(imm, RV_J_IMM_SIGN_OFF, 1) << RV_J_IMM_SIGN_OPOFF);
+}
+
+/*
+ * Put together one immediate from a U-type and I-type instruction pair.
+ *
+ * The U-type contains an upper immediate, meaning bits[31:12] with [11:0]
+ * being zero, while the I-type contains a 12bit immediate.
+ * Combined these can encode larger 32bit values and are used for example
+ * in auipc + jalr pairs to allow larger jumps.
+ *
+ * @utype_insn: instruction containing the upper immediate
+ * @itype_insn: instruction
+ * Return: combined immediate
+ */
+static inline s32 riscv_insn_extract_utype_itype_imm(u32 utype_insn, u32 itype_insn)
+{
+	s32 imm;
+
+	imm = RV_EXTRACT_UTYPE_IMM(utype_insn);
+	imm += RV_EXTRACT_ITYPE_IMM(itype_insn);
+
+	return imm;
+}
+
+/*
+ * Update a set of two instructions (U-type + I-type) with an immediate value.
+ *
+ * Used for example in auipc+jalrs pairs the U-type instructions contains
+ * a 20bit upper immediate representing bits[31:12], while the I-type
+ * instruction contains a 12bit immediate representing bits[11:0].
+ *
+ * This also takes into account that both separate immediates are
+ * considered as signed values, so if the I-type immediate becomes
+ * negative (BIT(11) set) the U-type part gets adjusted.
+ *
+ * @utype_insn: pointer to the utype instruction of the pair
+ * @itype_insn: pointer to the itype instruction of the pair
+ * @imm: the immediate to insert into the two instructions
+ */
+static inline void riscv_insn_insert_utype_itype_imm(u32 *utype_insn, u32 *itype_insn, s32 imm)
+{
+	/* drop possible old IMM values */
+	*utype_insn &= ~(RV_U_IMM_31_12_MASK);
+	*itype_insn &= ~(RV_I_IMM_11_0_MASK << RV_I_IMM_11_0_OPOFF);
+
+	/* add the adapted IMMs */
+	*utype_insn |= (imm & RV_U_IMM_31_12_MASK) + ((imm & BIT(11)) << 1);
+	*itype_insn |= ((imm & RV_I_IMM_11_0_MASK) << RV_I_IMM_11_0_OPOFF);
+}
+
+/*
+ * Get the immediate from a B-type instruction.
+ *
+ * @insn: instruction to process
+ * Return: immediate
+ */
+static inline s32 riscv_insn_extract_btype_imm(u32 insn)
+{
+	return RV_EXTRACT_BTYPE_IMM(insn);
+}
+
+/*
+ * Get the immediate from a RVC B-type instruction.
+ *
+ * @insn: instruction to process
+ * Return: immediate
+ */
+static inline s32 riscv_insn_extract_cbtype_imm(u32 insn)
+{
+	return RVC_EXTRACT_BTYPE_IMM(insn);
+}
+
+/*
+ * Get the immediate from a RVC J-type instruction.
+ *
+ * @insn: instruction to process
+ * Return: immediate
+ */
+static inline s32 riscv_insn_extract_cjtype_imm(u16 insn)
+{
+	return RVC_EXTRACT_JTYPE_IMM(insn);
+}
+
+#endif /* _ASM_RISCV_INSN_H */
diff --git a/tools/perf/arch/riscv/util/auxtrace.c b/tools/perf/arch/riscv/util/auxtrace.c
index 5feee198ef97..a5450bef1a8a 100644
--- a/tools/perf/arch/riscv/util/auxtrace.c
+++ b/tools/perf/arch/riscv/util/auxtrace.c
@@ -10,6 +10,7 @@
 #include <linux/zalloc.h>
 #include <linux/string.h>
 #include <time.h>
+#include <errno.h>
 
 #include <internal/lib.h> // page_size
 #include "../../../util/auxtrace.h"
diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index bcccad7487a9..648a8552df9e 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -148,6 +148,8 @@ perf-util-y += cs-etm-decoder/
 endif
 perf-util-y += cs-etm-base.o
 
+perf-util-y += nexus-rv-decoder/
+
 perf-util-y += parse-branch-options.o
 perf-util-y += dump-insn.o
 perf-util-y += parse-regs-options.o
diff --git a/tools/perf/util/nexus-rv-decoder/Build b/tools/perf/util/nexus-rv-decoder/Build
new file mode 100644
index 000000000000..61cc960b1d04
--- /dev/null
+++ b/tools/perf/util/nexus-rv-decoder/Build
@@ -0,0 +1 @@
+perf-util-y += nexus-rv-decoder.o
diff --git a/tools/perf/util/nexus-rv-decoder/nexus-rv-decoder.c b/tools/perf/util/nexus-rv-decoder/nexus-rv-decoder.c
new file mode 100644
index 000000000000..2f41d818ca32
--- /dev/null
+++ b/tools/perf/util/nexus-rv-decoder/nexus-rv-decoder.c
@@ -0,0 +1,1364 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright(C) 2026 Spacemit Limited. All rights reserved.
+ */
+
+#include <linux/err.h>
+#include <linux/zalloc.h>
+#include <linux/types.h>
+#include <errno.h>
+#include <api/fs/fs.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include "../debug.h"
+#include "../color.h"
+#include "../intlist.h"
+#include "nexus-rv-decoder.h"
+#include "nexus-rv-msg.h"
+#include "../../../arch/riscv/include/asm/insn.h"
+
+#define BUFFER_SIZE	1024
+
+#define RV_REGNO_ZERO   0
+#define RV_REGNO_RA	1
+
+static struct nexus_rv_defmt_buf *nexus_rv_get_buf(struct nexus_rv_defmt_buf defmt_bufs[],
+						   unsigned char id)
+{
+	if (defmt_bufs[id].buf != NULL)
+		return &defmt_bufs[id];
+
+	defmt_bufs[id].buf = (unsigned char *)malloc(BUFFER_SIZE);
+	if (!defmt_bufs[id].buf)
+		return NULL;
+
+	defmt_bufs[id].size = 0;
+	defmt_bufs[id].capacity = BUFFER_SIZE;
+
+	return &defmt_bufs[id];
+}
+
+static int nexus_rv_defmt_buf_append(struct nexus_rv_defmt_buf *defmt_buf, FILE *nexus,
+				     unsigned char data)
+{
+	if (defmt_buf->size == defmt_buf->capacity) {
+		defmt_buf->capacity *= 2;
+		defmt_buf->buf = realloc(defmt_buf->buf, defmt_buf->capacity);
+		if (!defmt_buf->buf)
+			return -ENOMEM;
+	}
+	defmt_buf->buf[defmt_buf->size++] = data;
+
+	if ((data & 0x3) == 0x3) {
+		size_t n = fwrite(defmt_buf->buf, defmt_buf->size, 1, nexus);
+
+		if (n != 1) {
+			pr_err("Encoder: failed to write nexus data\n");
+			return -EINVAL;
+		}
+		defmt_buf->size = 0;
+	}
+
+	return 0;
+}
+
+static size_t skip_frame_syncs(const unsigned char *buf, size_t len, size_t *fsync_count)
+{
+	const uint32_t FSYNC_PATTERN = 0x7FFFFFFF;    /* LE host pattern for Frame SYNC */
+	size_t skipped_bytes = 0;
+
+	while (skipped_bytes + 4 <= len) {
+		if (*((uint32_t *)(buf + skipped_bytes)) == FSYNC_PATTERN) {
+			skipped_bytes += 4;
+			(*fsync_count)++;
+		} else {
+			break;
+		}
+	}
+
+	return skipped_bytes;
+}
+
+/* remove coresight formatter frame */
+static int nexus_rv_pkt_defmt(struct nexus_rv_defmt_buf defmt_bufs[], FILE *nexus,
+			      const unsigned char *buf, size_t len)
+{
+	int err;
+	uint8_t flag_bit;
+	unsigned char data = 0;
+	int cur_id = -1, old_id = -1, new_id = -1;
+
+	/* 16 bytes is output by coresight trace formatter */
+	while (len >= 16) {
+		/* some linux drivers (e.g. for perf) will insert FSYNCS to pad or differentiate
+		 * between blocks of aligned data, always in frame aligned complete 16 byte frames.
+		 * we need to skip past these frames, resetting as we go.
+		 */
+		size_t fsync_count = 0;
+		size_t fsync_bytes = skip_frame_syncs(buf, len, &fsync_count);
+
+		if (fsync_bytes > 0) {
+			if (fsync_count % 4 == 0) {
+				cur_id = -1;
+				old_id = -1;
+				new_id = -1;
+			} else {
+				pr_err("Incorrect FSYNC reset pattern\n");
+				return -EINVAL;
+			}
+			buf += fsync_bytes;
+			len -= fsync_bytes;
+			continue;
+		}
+
+		flag_bit = 0x1;
+		for (int i = 0; i < 15; i += 2) {
+			if (buf[i] & 0x1) {
+				/* it's id */
+				old_id = new_id;
+				new_id = buf[i] >> 1; /* get new_id */
+				cur_id = (flag_bit & buf[15]) ? old_id : new_id;
+			} else {
+				/* it's data */
+				data = buf[i] | ((flag_bit & buf[15]) ? 0x1 : 0x0);
+			}
+
+			if (IS_VALID_ID(cur_id)) {
+				struct nexus_rv_defmt_buf *defmt_buf =
+					nexus_rv_get_buf(defmt_bufs, cur_id);
+
+				if (!defmt_buf)
+					return -ENOMEM;
+
+				/* it's data */
+				if ((buf[i] & 0x1) == 0) {
+					err = nexus_rv_defmt_buf_append(defmt_buf, nexus, data);
+					if (err)
+						return err;
+				}
+
+				/* buf[i+1] is alway data when i != 14 */
+				if (i != 14) {
+					err = nexus_rv_defmt_buf_append(defmt_buf, nexus,
+									buf[i + 1]);
+					if (err)
+						return err;
+				}
+			}
+
+			if (cur_id != new_id)
+				cur_id = new_id;
+
+			flag_bit <<= 1;
+		}
+		buf += 16;
+		len -= 16;
+	}
+	return 0;
+}
+
+/* dump all nexus messages (from nexus file) */
+static int nexus_rv_pkt_dump(struct nexus_rv_pkt_decoder *decoder, FILE *nexus)
+{
+	const char *color = PERF_COLOR_BLUE;
+	int fld_def  = -1;
+	int fld_bits = 0;
+	u64 fld_val = 0;
+
+	int msg_cnt    = 0;
+	int msg_bytes  = 0;
+	int msg_errors = 0;
+	int idle_cnt   = 0;
+
+	bool find_next_package = false;
+	int error_msgs = 0;
+
+	unsigned int tcode = 0;
+	unsigned int correlation_hist = 0;
+	unsigned int resourcefull_hrepeat = 0;
+
+	unsigned char msg_byte = 0;
+	unsigned char prev_byte = 0;
+	unsigned int mdo = 0;
+	unsigned int mseo = 0;
+
+	for (;;) {
+		prev_byte = msg_byte;
+		if (fread(&msg_byte, 1, 1, nexus) != 1)
+			break;  /* EOF */
+
+		if (find_next_package) {
+			if ((prev_byte & 0x3) == 0x3) { /* last byte */
+				error_msgs++;
+				find_next_package = false;
+
+				/* reinit some val */
+				fld_def = -1;
+				fld_bits = 0;
+				fld_val = 0;
+			} else {
+				continue;
+			}
+		}
+
+		/* This will skip long sequnece of idles (visible in true captures ...) */
+		if (msg_byte == 0xFF && prev_byte == 0xFF)
+			continue;
+
+		mdo  = msg_byte >> 2;
+		mseo = msg_byte & 0x3;
+
+		if (mseo == 0x2) {
+			pr_err(" ERROR: At offset %d: MSEO='10' is not allowed\n",
+				msg_bytes + idle_cnt);
+			find_next_package = true;
+			continue;
+		}
+
+		if (fld_def < 0) {
+			if (mseo == 0x3)  {
+				color_fprintf(stdout, color, "MSG #%d +%d - IDLE\n",
+					      msg_cnt, msg_bytes);
+				msg_cnt++;
+				msg_bytes++;
+				idle_cnt++;
+				continue;
+			}
+
+			if (mseo != 0x0) {
+				pr_err(" ERROR: At offset %d: Message must start from MSEO='00'\n",
+					      msg_bytes + idle_cnt);
+				find_next_package = true;
+				continue;
+			}
+
+			for (int d = 0; NEXUS_MSG_DEF[d].def != 0; d++) {
+				if ((NEXUS_MSG_DEF[d].def & 0x100) == 0)
+					continue;
+				if ((NEXUS_MSG_DEF[d].def & 0xFF) == mdo) {
+					fld_def = d; /* Found TCODE */
+					tcode = mdo;
+					break;
+				}
+			}
+
+			if (fld_def < 0) {
+				pr_err(" ERROR: At offset %d: Message with TCODE=%d is not defined for N-Trace\n",
+					msg_bytes + idle_cnt, mdo);
+				find_next_package = true;
+				continue;
+			}
+
+			color_fprintf(stdout, color, "MSG #%d +%d - %s TCODE[6]=%d",
+				      msg_cnt, msg_bytes, NEXUS_MSG_DEF[fld_def].name, mdo);
+			msg_cnt++;
+			msg_bytes++;
+
+			if (mdo == NEXUS_TCODE_Error)
+				msg_errors++;
+
+			fld_def++;
+			fld_bits = 0;
+			fld_val  = 0;
+			continue;
+		}
+
+		/* Accumulate 'mdo' to field value */
+		fld_val  |= (((u64)mdo) << fld_bits);
+		fld_bits += 6;
+
+		msg_bytes++;
+
+		/* Process fixed size fields (there may be more than one in one MDO record) */
+		while (NEXUS_MSG_DEF[fld_def].def & 0x200) {
+			int fld_size = NEXUS_MSG_DEF[fld_def].def & 0xFF;
+
+			if (fld_size & 0x80) {
+				/* Size of this field is defined by parameter ... */
+				fld_size = decoder->src_bits;
+			}
+			if (fld_bits < fld_size)
+				break;  /* Not enough bits for this field */
+			color_fprintf(stdout, color, " %s[%d]=0x%lx",
+				      NEXUS_MSG_DEF[fld_def].name, fld_size,
+				      fld_val & ((((u64)1) << fld_size) - 1));
+			fld_def++;
+			fld_val >>= fld_size;
+			fld_bits -= fld_size;
+		}
+
+		if (mseo == 0x0)
+			continue;
+
+		if (NEXUS_MSG_DEF[fld_def].def & 0x400) {
+			/* Process ResourceFull cfg HREPEAT field */
+			if (tcode == NEXUS_TCODE_ResourceFull) {
+				if (!strcmp(NEXUS_MSG_DEF[fld_def].name, "RCODE")
+						&& fld_val == 0x2)
+					resourcefull_hrepeat = 1;
+
+				if (!strcmp(NEXUS_MSG_DEF[fld_def].name, "HREPEAT")
+						&& resourcefull_hrepeat != 1) {
+					/* no HREPEAT field */
+					fld_def++;
+					resourcefull_hrepeat = 0;
+				}
+			}
+
+			/* Process ProgTraceCorrelation cfg HIST field */
+			if (tcode == NEXUS_TCODE_ProgTraceCorrelation) {
+				if (!strcmp(NEXUS_MSG_DEF[fld_def].name, "CDF") && fld_val == 0x2)
+					correlation_hist = 1;
+
+				if (!strcmp(NEXUS_MSG_DEF[fld_def].name, "HIST")
+						&& correlation_hist != 1) {
+					/* no HIST field */
+					fld_def++;
+					correlation_hist = 0;
+				}
+			}
+
+			/* Variable size field */
+			color_fprintf(stdout, color, " %s[%d]=0x%lx",
+				      NEXUS_MSG_DEF[fld_def].name, fld_bits, fld_val);
+
+			if (mseo == 3) {
+				printf("\n");
+				fld_def = -1;
+			} else {
+				fld_def++;
+			}
+			fld_bits = 0;
+			fld_val  = 0;
+			continue;
+		}
+
+		if (fld_bits > 0) {
+			pr_err(" ERROR: At offset %d: Not enough bits for non-variable field\n",
+				      msg_bytes + idle_cnt);
+			find_next_package = true;
+			continue;
+		}
+	}
+
+	color_fprintf(stdout, color,
+		      "\nStat: %d bytes, %d idles, %d messages, %d error messages, %d invalid messages",
+		      msg_bytes, idle_cnt, msg_cnt, msg_errors, error_msgs);
+	if (msg_cnt > 0)
+		color_fprintf(stdout, color, "%.2lf bytes/message", ((double)msg_bytes) / msg_cnt);
+
+	printf("\n");
+
+	return 0;
+}
+
+struct nexus_rv_pkt_decoder *nexus_rv_pkt_decoder_new(struct nexus_rv_pkt_decoder_params *params)
+{
+	struct nexus_rv_pkt_decoder *decoder;
+
+	if (!params)
+		return NULL;
+
+	decoder = zalloc(sizeof(struct nexus_rv_pkt_decoder));
+	if (!decoder)
+		return NULL;
+
+	decoder->formatted = params->formatted;
+	decoder->src_bits = params->src_bits;
+
+	return decoder;
+}
+
+void nexus_rv_pkt_decoder_free(struct nexus_rv_pkt_decoder *decoder)
+{
+	for (int i = 0; i < MAX_ID; ++i)
+		free(decoder->defmt_bufs[i].buf);
+
+	free(decoder);
+}
+
+int nexus_rv_pkt_desc(struct nexus_rv_pkt_decoder *decoder, const unsigned char *buf, size_t len)
+{
+	int err;
+	char filename[PATH_MAX];
+	FILE *nexus;
+	char *dir = getenv("PERF_BUILDID_DIR");
+
+	/* TODO: The filename here is always trace.bin, which results in
+	 * only the last Nexus trace data being retained. A corresponding
+	 * Nexus filename should be generated for each AUX data.
+	 */
+	snprintf(filename, sizeof(filename), "%s/trace.bin", dir);
+	nexus = fopen(filename, "w+");
+
+	if (decoder->formatted) {
+		err = nexus_rv_pkt_defmt(decoder->defmt_bufs, nexus, buf, len);
+		if (err) {
+			pr_err("Encoder: failed to remove coresight trace formatter\n");
+			return err;
+		}
+	} else {
+		size_t n = fwrite(buf, len, 1, nexus);
+
+		if (n != 1) {
+			pr_err("Encoder: failed to write nexus data\n");
+			fclose(nexus);
+			return -EINVAL;
+		}
+	}
+
+	fseek(nexus, 0, SEEK_SET);
+	err = nexus_rv_pkt_dump(decoder, nexus);
+
+	fclose(nexus);
+
+	return err;
+}
+
+static int nexus_rv_init_packet_buffer(struct nexus_rv_packet_buffer *packet_buffer)
+{
+	if (!packet_buffer->packets) {
+		packet_buffer->packets = calloc(BUFFER_SIZE, sizeof(struct nexus_rv_packet));
+		if (!packet_buffer->packets)
+			return -ENOMEM;
+	}
+
+	packet_buffer->size = 0;
+	packet_buffer->capacity = BUFFER_SIZE;
+
+	return 0;
+}
+
+static int nexus_rv_packet_buffer_append(struct nexus_rv_packet_buffer *packet_buffer,
+					 struct nexus_rv_packet packet)
+{
+	if (packet_buffer->size == packet_buffer->capacity) {
+		packet_buffer->capacity *= 2;
+		packet_buffer->packets = realloc(packet_buffer->packets,
+			sizeof(struct nexus_rv_packet) * packet_buffer->capacity);
+		if (!packet_buffer->packets)
+			return -ENOMEM;
+	}
+	packet_buffer->packets[packet_buffer->size++] = packet;
+
+	return 0;
+}
+
+static void nexus_rv_free_packet_buffer(struct nexus_rv_packet_buffer *packet_buffer)
+{
+	free(packet_buffer->packets);
+}
+
+static int nexus_rv_init_stack(struct nexus_rv_stack *stack)
+{
+	if (!stack->data) {
+		stack->data = (u64 *)malloc(sizeof(u64) * BUFFER_SIZE);
+		if (!stack->data)
+			return -ENOMEM;
+	}
+
+	stack->top = -1;
+	stack->capacity = BUFFER_SIZE;
+
+	return 0;
+}
+
+static int nexus_rv_stack_push(struct nexus_rv_stack *stack, u64 value)
+{
+	if (stack->top == stack->capacity - 1) {
+		stack->capacity *= 2;
+		stack->data = (u64 *)realloc(stack->data, sizeof(u64) * stack->capacity);
+		if (!stack->data)
+			return -ENOMEM;
+	}
+	stack->data[++stack->top] = value;
+
+	return 0;
+}
+
+static int nexus_rv_stack_pop(struct nexus_rv_stack *stack)
+{
+	u64 value;
+
+	if (stack->top == -1)
+		return 1;   /* Empty */
+
+	value = stack->data[stack->top--];
+	return value;
+}
+
+static void nexus_rv_free_stack(struct nexus_rv_stack *stack)
+{
+	free(stack->data);
+}
+
+static struct nexus_rv_src_context *nexus_rv_get_src_context(struct nexus_rv_insn_decoder *decoder,
+							     int src_id)
+{
+	struct int_node *node;
+	struct nexus_rv_src_context *ctx;
+
+	node = intlist__find(decoder->src_contexts, src_id);
+	if (node)
+		return (struct nexus_rv_src_context *)node->priv;
+
+	ctx = zalloc(sizeof(struct nexus_rv_src_context));
+	if (!ctx)
+		return NULL;
+
+	ctx->src_id = src_id;
+	ctx->nexdeco_pc = 1;
+	ctx->nexdeco_lastaddr = 1;
+	ctx->prv = 0;
+	ctx->v = 0;
+	ctx->timestamp = 0;
+	ctx->context = -1;
+	ctx->resourcefull_icnt = 0;
+
+	if (nexus_rv_init_stack(&ctx->stack)) {
+		free(ctx);
+		return NULL;
+	}
+
+	/* Add to RB Tree */
+	node = intlist__findnew(decoder->src_contexts, src_id);
+	if (!node) {
+		nexus_rv_free_stack(&ctx->stack);
+		free(ctx);
+		return NULL;
+	}
+
+	node->priv = ctx;
+
+	return ctx;
+}
+
+static void nexus_rv_free_src_contexts(struct intlist *src_contexts)
+{
+	struct int_node *node;
+
+	intlist__for_each_entry(node, src_contexts) {
+		struct nexus_rv_src_context *ctx = (struct nexus_rv_src_context *)node->priv;
+
+		nexus_rv_free_stack(&ctx->stack);
+		free(ctx);
+	}
+	intlist__delete(src_contexts);
+}
+
+static int handle_error_msg(struct nexus_rv_src_context *ctx, const char *err)
+{
+	pr_err("\nERROR: %s\n", err);
+	ctx->nexdeco_pc = 1; /* 1 means, that last address is unknown */
+	nexus_rv_init_stack(&ctx->stack);
+	return -EINVAL;
+}
+
+static int nexus_rv_insn_info_get(struct nexus_rv_insn_decoder *decoder, u8 *info, u64 *dest)
+{
+	u32 insn;
+	struct nexus_rv_src_context *ctx = decoder->current_src_ctx;
+	u64 addr = ctx->nexdeco_pc;
+
+	if (!decoder->mem_access(decoder->data, addr, ctx->prv, ctx->context,
+				 sizeof(insn), (u8 *)&insn))
+		return -EINVAL;
+
+	*info = INFO_LINEAR;
+	if ((insn & (__INSN_LENGTH_MASK)) != (__INSN_LENGTH_GE_32)) {
+		if (riscv_insn_is_c_beqz(insn) || riscv_insn_is_c_bnez(insn)) {
+			*info = INFO_BRANCH;
+			*dest = addr + riscv_insn_extract_cbtype_imm(insn);
+		} else if (riscv_insn_is_c_j(insn)) {
+			/* c.j offset */
+			*info = INFO_JUMP;
+			*dest = addr + riscv_insn_extract_cjtype_imm(insn);
+		} else if (riscv_insn_is_c_jr(insn)) {
+			*info = INFO_JUMP | INFO_INDIRECT;
+			/* ret => c.jr x1 */
+			if (RVC_EXTRACT_C2_RS1_REG(insn) == RV_REGNO_RA)
+				*info |= INFO_RET;
+		} else if (riscv_insn_is_c_jalr(insn)) {
+			*info = INFO_JUMP | INFO_CALL | INFO_INDIRECT;
+		} else {
+			*info = INFO_LINEAR;
+		}
+	} else {
+		if (riscv_insn_is_branch(insn)) {
+			*info = INFO_BRANCH;
+			*dest = addr + riscv_insn_extract_btype_imm(insn);
+		} else if (riscv_insn_is_jalr(insn)) {
+			*info = INFO_JUMP | INFO_INDIRECT;
+			if (RV_EXTRACT_RD_REG(insn) == RV_REGNO_ZERO
+					&& riscv_insn_extract_jtype_imm(insn) == 0) {
+				/* ret => jalr x0,x1,0 */
+				if (RV_EXTRACT_RS1_REG(insn) == RV_REGNO_RA)
+					*info |= INFO_RET;
+				else
+				/* jr rs1 => jalr x0,rs1,0 */
+					*info |= INFO_CALL;
+			}
+		} else if (riscv_insn_is_jal(insn)) {
+			*info = INFO_JUMP;
+			/* j offset => jal x0,offset */
+			if (RV_EXTRACT_RD_REG(insn) != RV_REGNO_ZERO)
+				*info |= INFO_CALL;
+			*dest = addr + riscv_insn_extract_jtype_imm(insn);
+		} else if (riscv_insn_is_sret(insn) || riscv_insn_is_mret(insn)) {
+			*info = INFO_JUMP | INFO_INDIRECT | INFO_RET;
+		} else if (riscv_insn_is_ecall(insn)) {
+			*info = INFO_JUMP | INFO_INDIRECT | INFO_CALL;
+		} else {
+			*info = INFO_LINEAR;
+		}
+		*info |= INFO_4;
+	}
+
+	pr_debug2(".nexdeco_pc=0x%lx .insn=0x%0*x\n", addr,
+		  (*info & INFO_4) ? 8 : 4,
+		  (*info & INFO_4) ? insn : (u16)insn);
+	return 0;
+}
+
+static int nexus_rv_emit_icnt(struct nexus_rv_insn_decoder *decoder, int n, u32 hist)
+{
+	u64 a = 0;
+	u32 hist_mask;
+	u8 info;
+	int done_icnt = 0; /* Number of done instruction count */
+	struct nexus_rv_src_context *ctx = decoder->current_src_ctx;
+
+	if (ctx->nexdeco_pc & 1)
+		return 0;  /* Not synchronized ... */
+
+	pr_debug2(".PC=0x%lX, EmitICNT(n=%d,hist=0x%x)\n", ctx->nexdeco_pc, n, hist);
+
+	/*
+	 * Adjust ICNT by what was handled by ResourceFull message[s]
+	 * before this message (message with normal ICNT field).
+	 * NOTE: ctx->resourcefull_icnt maybe positive or negative!
+	 */
+	if (n >= 0 && ctx->resourcefull_icnt != 0) {
+		n += ctx->resourcefull_icnt;
+		if (n < 0)
+			return handle_error_msg(ctx, "ICNT adjustment ERROR");
+
+		ctx->resourcefull_icnt = 0;    /* Make adjustment 'consumed' */
+	}
+
+	hist_mask = 0;  /* MSB is first in history, so we need sliding mask */
+	if (hist != 0) {
+		if (hist & (1 << (sizeof(u32) * 8 - 1))) {
+			hist_mask = (1 << (sizeof(u32) * 8 - 2));
+		} else {
+			hist_mask = 0x1;
+			while (hist_mask <= hist)
+				hist_mask <<= 1;
+			hist_mask >>= 2;
+		}
+	}
+
+	while (n != 0) {
+		ctx->current_pc = ctx->nexdeco_pc;
+		if (nexus_rv_insn_info_get(decoder, &info, &a))
+			return handle_error_msg(ctx, "failed to get insn info");
+
+		if (n > 0) {
+			n -= (info & INFO_4) ? 2 : 1;
+			if (n < 0)
+				return handle_error_msg(ctx, "ICNT too small");
+			done_icnt += 1;
+		}
+
+		if (info & INFO_CALL) {
+			u64 ret = ctx->nexdeco_pc + ((info & INFO_4) ? 4 : 2);
+
+			if (nexus_rv_stack_push(&ctx->stack, ret))
+				return handle_error_msg(ctx, "failed to push value to stack");
+		}
+
+		if (info & INFO_INDIRECT) { /* Cannot continue over indirect... */
+			if (info & INFO_RET) {
+				u64 ret = nexus_rv_stack_pop(&ctx->stack);
+
+				ctx->nexdeco_pc = ret;
+				if (n != 0) {
+					if (ret == 1)
+						return handle_error_msg(ctx,
+							"Not enough entries on callstack");
+					continue;
+				}
+			}
+
+			if (n > 0)
+				return handle_error_msg(ctx,
+							"indirect address encountered in ICNT");
+
+			break;
+		}
+
+		if (info & INFO_BRANCH) {
+			if (hist == 0) {
+				/* This is calling as DirectBranch */
+				if (n == 0)
+					info |= INFO_JUMP;  /* Force PC change below */
+			} else {
+				if (hist_mask & hist)
+					info |= INFO_JUMP;  /* Force PC change below */
+				hist_mask >>= 1;
+				if (hist_mask == 0 && n < 0)
+					n = 0;
+			}
+		}
+
+		if (info & INFO_JUMP)
+			ctx->nexdeco_pc = a;   /* Direct jump/call/branch */
+		else if (info & INFO_4)
+			ctx->nexdeco_pc += 4;
+		else
+			ctx->nexdeco_pc += 2;
+
+	}
+
+	return done_icnt;
+}
+
+static u64 nexus_rv_field_get(struct nexus_rv_insn_decoder *decoder, const char *name)
+{
+	for (int d = decoder->msg_field_pos; NEXUS_MSG_DEF[d].def != 1; d++) {
+		if (strcmp(NEXUS_MSG_DEF[d].name, name) == 0) {
+			int fi = d - decoder->msg_field_pos;
+
+			if (fi <= decoder->msg_field_cnt)
+				return decoder->msg_fields[fi];
+			return 0;
+		}
+	}
+	return 0;
+}
+
+#define NEX_FLDGET(n) nexus_rv_field_get(decoder, #n)
+
+static u64 nexus_rv_calculate_addr(u64 fu_addr, int full, u64 prev_addr)
+{
+	fu_addr <<= 1; /* LSB bit is never sent */
+	if ((fu_addr >> 32) & 0x10000)	    /* Perform MSB extension */
+		fu_addr |= 0xFFFF000000000000UL;
+	/* Update (NEW or XOR) */
+	if (!full) {
+		if (prev_addr & 1) /* Not Sync */
+			fu_addr = prev_addr;
+		else
+			fu_addr ^= prev_addr;
+	}
+	return fu_addr;
+}
+
+static int nexus_rv_msg_handle(struct nexus_rv_insn_decoder *decoder)
+{
+	int ret = 0;
+	u64 addr;
+	struct nexus_rv_packet packet;
+	int n = 0;
+	int new_src = 0;
+	u64 start_addr = 0;
+	int TCODE = decoder->msg_fields[0];
+
+	switch (TCODE) {
+	case NEXUS_TCODE_Ownership:
+		new_src = NEX_FLDGET(SRC);
+		if (new_src != decoder->current_src) {
+			struct nexus_rv_src_context *ctx = nexus_rv_get_src_context(decoder,
+										    new_src);
+			if (!ctx)
+				return -ENOMEM;
+
+			decoder->current_src = new_src;
+			decoder->current_src_ctx = ctx;
+		}
+
+		decoder->current_src_ctx->prv = NEX_FLDGET(PRV);
+		decoder->current_src_ctx->v = NEX_FLDGET(V);
+		if (NEX_FLDGET(FORMAT) && NEX_FLDGET(CONTEXT))
+			decoder->current_src_ctx->context = NEX_FLDGET(CONTEXT);
+		decoder->current_src_ctx->timestamp += NEX_FLDGET(TSTAMP);
+		break;
+
+	case NEXUS_TCODE_DirectBranch:
+		new_src = NEX_FLDGET(SRC);
+		if (new_src != decoder->current_src) {
+			struct nexus_rv_src_context *ctx = nexus_rv_get_src_context(decoder,
+										    new_src);
+			if (!ctx)
+				return -ENOMEM;
+
+			decoder->current_src = new_src;
+			decoder->current_src_ctx = ctx;
+		}
+
+		start_addr = decoder->current_src_ctx->nexdeco_pc;
+		n = NEX_FLDGET(ICNT);
+		ret = nexus_rv_emit_icnt(decoder, n, 0x0);
+		decoder->current_src_ctx->timestamp += NEX_FLDGET(TSTAMP);
+		break;
+
+	case NEXUS_TCODE_IndirectBranch:
+		new_src = NEX_FLDGET(SRC);
+		if (new_src != decoder->current_src) {
+			struct nexus_rv_src_context *ctx = nexus_rv_get_src_context(decoder,
+										    new_src);
+			if (!ctx)
+				return -ENOMEM;
+
+			decoder->current_src = new_src;
+			decoder->current_src_ctx = ctx;
+		}
+
+		start_addr = decoder->current_src_ctx->nexdeco_pc;
+		n = NEX_FLDGET(ICNT);
+		ret = nexus_rv_emit_icnt(decoder, n, 0x0);
+
+		addr = NEX_FLDGET(UADDR);
+		decoder->current_src_ctx->nexdeco_lastaddr = nexus_rv_calculate_addr(addr, 0,
+			decoder->current_src_ctx->nexdeco_lastaddr);
+		pr_debug2(".nexdeco_lastaddr=0x%lx\n", decoder->current_src_ctx->nexdeco_lastaddr);
+		decoder->current_src_ctx->nexdeco_pc = decoder->current_src_ctx->nexdeco_lastaddr;
+		decoder->current_src_ctx->timestamp += NEX_FLDGET(TSTAMP);
+		break;
+
+	case NEXUS_TCODE_ProgTraceSync:
+		new_src = NEX_FLDGET(SRC);
+		if (new_src != decoder->current_src) {
+			struct nexus_rv_src_context *ctx = nexus_rv_get_src_context(decoder,
+										    new_src);
+			if (!ctx)
+				return -ENOMEM;
+
+			decoder->current_src = new_src;
+			decoder->current_src_ctx = ctx;
+		}
+
+		start_addr = decoder->current_src_ctx->nexdeco_pc;
+		n = NEX_FLDGET(ICNT);
+		ret = nexus_rv_emit_icnt(decoder, n, 0x0);
+
+		addr = NEX_FLDGET(FADDR);
+		decoder->current_src_ctx->nexdeco_lastaddr = nexus_rv_calculate_addr(addr, 1,
+			decoder->current_src_ctx->nexdeco_lastaddr);
+		pr_debug2(".nexdeco_lastaddr=0x%lx\n", decoder->current_src_ctx->nexdeco_lastaddr);
+		decoder->current_src_ctx->nexdeco_pc = decoder->current_src_ctx->nexdeco_lastaddr;
+		decoder->current_src_ctx->timestamp = NEX_FLDGET(TSTAMP);
+		break;
+
+	case NEXUS_TCODE_DirectBranchSync:
+		new_src = NEX_FLDGET(SRC);
+		if (new_src != decoder->current_src) {
+			struct nexus_rv_src_context *ctx = nexus_rv_get_src_context(decoder,
+										    new_src);
+			if (!ctx)
+				return -ENOMEM;
+
+			decoder->current_src = new_src;
+			decoder->current_src_ctx = ctx;
+		}
+
+		start_addr = decoder->current_src_ctx->nexdeco_pc;
+		n = NEX_FLDGET(ICNT);
+		ret = nexus_rv_emit_icnt(decoder, n, 0x0);
+
+		addr = NEX_FLDGET(FADDR);
+		decoder->current_src_ctx->nexdeco_lastaddr = nexus_rv_calculate_addr(addr, 1,
+			decoder->current_src_ctx->nexdeco_lastaddr);
+		pr_debug2(".nexdeco_lastaddr=0x%lx\n", decoder->current_src_ctx->nexdeco_lastaddr);
+		decoder->current_src_ctx->nexdeco_pc = decoder->current_src_ctx->nexdeco_lastaddr;
+		decoder->current_src_ctx->timestamp = NEX_FLDGET(TSTAMP);
+		break;
+
+	case NEXUS_TCODE_IndirectBranchSync:
+		new_src = NEX_FLDGET(SRC);
+		if (new_src != decoder->current_src) {
+			struct nexus_rv_src_context *ctx = nexus_rv_get_src_context(decoder,
+										    new_src);
+			if (!ctx)
+				return -ENOMEM;
+
+			decoder->current_src = new_src;
+			decoder->current_src_ctx = ctx;
+		}
+
+		start_addr = decoder->current_src_ctx->nexdeco_pc;
+		n = NEX_FLDGET(ICNT);
+		ret = nexus_rv_emit_icnt(decoder, n, 0x0);
+
+		addr = NEX_FLDGET(FADDR);
+		decoder->current_src_ctx->nexdeco_lastaddr = nexus_rv_calculate_addr(addr, 1,
+			decoder->current_src_ctx->nexdeco_lastaddr);
+		pr_debug2(".nexdeco_lastaddr=0x%lx\n", decoder->current_src_ctx->nexdeco_lastaddr);
+		decoder->current_src_ctx->nexdeco_pc = decoder->current_src_ctx->nexdeco_lastaddr;
+		decoder->current_src_ctx->timestamp = NEX_FLDGET(TSTAMP);
+		break;
+
+	case NEXUS_TCODE_IndirectBranchHist:
+		new_src = NEX_FLDGET(SRC);
+		if (new_src != decoder->current_src) {
+			struct nexus_rv_src_context *ctx = nexus_rv_get_src_context(decoder,
+										    new_src);
+			if (!ctx)
+				return -ENOMEM;
+
+			decoder->current_src = new_src;
+			decoder->current_src_ctx = ctx;
+		}
+
+		start_addr = decoder->current_src_ctx->nexdeco_pc;
+		n = NEX_FLDGET(ICNT);
+		ret = nexus_rv_emit_icnt(decoder, n, NEX_FLDGET(HIST));
+
+		addr = NEX_FLDGET(UADDR);
+		decoder->current_src_ctx->nexdeco_lastaddr = nexus_rv_calculate_addr(addr, 0,
+			decoder->current_src_ctx->nexdeco_lastaddr);
+		pr_debug2(".nexdeco_lastaddr=0x%lx\n", decoder->current_src_ctx->nexdeco_lastaddr);
+		decoder->current_src_ctx->nexdeco_pc = decoder->current_src_ctx->nexdeco_lastaddr;
+		decoder->current_src_ctx->timestamp += NEX_FLDGET(TSTAMP);
+		break;
+
+	case NEXUS_TCODE_IndirectBranchHistSync:
+		new_src = NEX_FLDGET(SRC);
+		if (new_src != decoder->current_src) {
+			struct nexus_rv_src_context *ctx = nexus_rv_get_src_context(decoder,
+										    new_src);
+			if (!ctx)
+				return -ENOMEM;
+
+			decoder->current_src = new_src;
+			decoder->current_src_ctx = ctx;
+		}
+
+		start_addr = decoder->current_src_ctx->nexdeco_pc;
+		n = NEX_FLDGET(ICNT);
+		ret = nexus_rv_emit_icnt(decoder, n, NEX_FLDGET(HIST));
+
+		addr = NEX_FLDGET(FADDR);
+		decoder->current_src_ctx->nexdeco_lastaddr = nexus_rv_calculate_addr(addr, 1,
+			decoder->current_src_ctx->nexdeco_lastaddr);
+		pr_debug2(".nexdeco_lastaddr=0x%lx\n", decoder->current_src_ctx->nexdeco_lastaddr);
+		decoder->current_src_ctx->nexdeco_pc = decoder->current_src_ctx->nexdeco_lastaddr;
+		decoder->current_src_ctx->timestamp = NEX_FLDGET(TSTAMP);
+		break;
+
+	case NEXUS_TCODE_ResourceFull:
+		/* Determine repeat count (for RCODE=2) */
+		int hrepeat = 0;
+		int rcode = NEX_FLDGET(RCODE);
+
+		if (rcode == 2)
+			hrepeat = NEX_FLDGET(HREPEAT);
+
+		new_src = NEX_FLDGET(SRC);
+		if (new_src != decoder->current_src) {
+			struct nexus_rv_src_context *ctx = nexus_rv_get_src_context(decoder,
+										    new_src);
+			if (!ctx)
+				return -ENOMEM;
+
+			decoder->current_src = new_src;
+			decoder->current_src_ctx = ctx;
+		}
+
+		start_addr = decoder->current_src_ctx->nexdeco_pc;
+		decoder->current_src_ctx->timestamp += NEX_FLDGET(TSTAMP);
+		if (rcode == 1 || rcode == 2) {
+			int rdata = NEX_FLDGET(RDATA);
+
+			if (rdata > 1) {
+				/* Special calling to emit HIST only ... */
+				if (decoder->disp_hist_repeat) {
+					pr_debug2("RepeatHIST,0x%x,%d\n",
+						  rdata, decoder->disp_hist_repeat);
+					decoder->disp_hist_repeat = 0;
+				}
+				do {
+					/* ICNT is unknown (-1), what will process only HIST bits */
+					ret = nexus_rv_emit_icnt(decoder, -1, rdata);
+					if (ret < 0)
+						break;
+
+					/* Consume, so next time ICNT will be adjusted */
+					decoder->current_src_ctx->resourcefull_icnt -= ret;
+					hrepeat--;
+				} while (hrepeat > 0);
+			}
+		} else if (rcode == 0) {
+			decoder->current_src_ctx->resourcefull_icnt += NEX_FLDGET(RDATA);
+		}
+		break;
+
+	case NEXUS_TCODE_ProgTraceCorrelation:
+		int hist = 0;
+		int cdf = NEX_FLDGET(CDF);
+
+		if (cdf == 1)
+			hist = NEX_FLDGET(HIST);
+
+		new_src = NEX_FLDGET(SRC);
+		if (new_src != decoder->current_src) {
+			struct nexus_rv_src_context *ctx = nexus_rv_get_src_context(decoder,
+										    new_src);
+			if (!ctx)
+				return -ENOMEM;
+
+			decoder->current_src = new_src;
+			decoder->current_src_ctx = ctx;
+		}
+
+		start_addr = decoder->current_src_ctx->nexdeco_pc;
+		n = NEX_FLDGET(ICNT);
+		ret = nexus_rv_emit_icnt(decoder, n, hist);
+		decoder->current_src_ctx->timestamp += NEX_FLDGET(TSTAMP);
+		break;
+
+	case NEXUS_TCODE_Error:
+		new_src = NEX_FLDGET(SRC);
+		if (new_src != decoder->current_src) {
+			struct nexus_rv_src_context *ctx = nexus_rv_get_src_context(decoder,
+										    new_src);
+			if (!ctx)
+				return -ENOMEM;
+
+			decoder->current_src = new_src;
+			decoder->current_src_ctx = ctx;
+		}
+		decoder->current_src_ctx->timestamp += NEX_FLDGET(TSTAMP);
+		break;
+
+	case NEXUS_TCODE_RepeatBranch:  /* Handled differently! */
+	default:
+		return -EINVAL;
+	}
+
+	if (ret >= 0) {
+		if (NEXUS_TCODE_Error == TCODE)
+			packet.sample_type = RVTRACE_LOSS;
+		else
+			packet.sample_type = ret ? RVTRACE_RANGE : RVTRACE_EMPTY;
+		packet.start_addr = start_addr;
+		packet.end_addr = decoder->current_src_ctx->current_pc;
+		packet.insn_cnt = ret;
+		packet.cpu = new_src;
+		packet.prv = decoder->current_src_ctx->prv;
+		packet.v = decoder->current_src_ctx->v;
+		packet.context = decoder->current_src_ctx->context;
+		packet.timestamp = decoder->current_src_ctx->timestamp;
+	} else {
+		packet.sample_type = RVTRACE_ERROR;
+	}
+
+	ret = nexus_rv_packet_buffer_append(&decoder->packet_buffer, packet);
+
+	return ret;
+}
+
+static int nexus_rv_insn_decode(struct nexus_rv_insn_decoder *decoder, FILE *nexus)
+{
+	int fld_def = -1;
+	int fld_bits = 0;
+	u64 fld_val = 0;
+
+	int msg_cnt = 0;
+	int msg_bytes = 0;
+	int msg_errors = 0;
+
+	bool find_next_package = false;
+
+	unsigned char msg_byte = 0;
+	unsigned char prev_byte = 0;
+
+	unsigned int mdo = 0;
+	unsigned int mseo = 0;
+
+	decoder->msg_field_cnt = 0;  /* No fields */
+
+	for (;;) {
+		prev_byte = msg_byte;
+		if (fread(&msg_byte, 1, 1, nexus) != 1)
+			break;	/* EOF */
+
+		if (find_next_package) {
+			if ((prev_byte & 0x3) == 0x3) { /* last byte */
+				find_next_package = false;
+
+				/* reinit some val */
+				fld_def = -1;
+				fld_bits = 0;
+				fld_val = 0;
+			} else {
+				continue;
+			}
+		}
+
+		/* This will skip long sequnece of idles (visible in true captures ...) */
+		if (msg_byte == 0xFF && prev_byte == 0xFF)
+			continue;
+
+		mdo = msg_byte >> 2;
+		mseo = msg_byte & 0x3;
+
+		if (mseo == 0x2) {
+			pr_err("ERROR: MSEO='10' is not allowed\n");
+			find_next_package = true;
+			continue;
+		}
+
+		if (fld_def < 0) {
+			if (mseo == 0x3)
+				continue;   /* skip idle */
+
+			if (mseo != 0x0) {
+				pr_err("ERROR: Message must start from MSEO='00'\n");
+				find_next_package = true;
+				continue;
+			}
+
+			for (int d = 0; NEXUS_MSG_DEF[d].def != 0; d++) {
+				if ((NEXUS_MSG_DEF[d].def & 0x100) == 0)
+					continue;
+				if ((NEXUS_MSG_DEF[d].def & 0xFF) == mdo) {
+					fld_def = d; /* Found TCODE */
+					break;
+				}
+			}
+
+			if (fld_def < 0) {
+				pr_err("ERROR: Message with TCODE=%d is not defined for RISC-V\n",
+					      mdo);
+				find_next_package = true;
+				continue;
+			}
+
+			/*
+			 * Special handling for RepeatBranch message.
+			 * We want to preserve previous packet, so we can
+			 * repeat it at end of RepeatBranch handling.
+			 */
+			if (mdo == NEXUS_TCODE_RepeatBranch) {
+				/* Save previous message fields */
+				decoder->saved_fields[0] = decoder->msg_field_pos;
+				decoder->saved_fields[1] = decoder->msg_field_cnt;
+				decoder->saved_fields[2] = decoder->msg_fields[0];
+				decoder->saved_fields[3] = decoder->msg_fields[1];
+				decoder->saved_fields[4] = decoder->msg_fields[2];
+				decoder->saved_fields[5] = decoder->msg_fields[3];
+				decoder->saved_fields[6] = decoder->msg_fields[4];
+			}
+
+			/* Save to allow later decoding */
+			decoder->msg_field_pos = fld_def;
+			decoder->msg_field_cnt = 0;
+			decoder->msg_fields[decoder->msg_field_cnt++] = mdo;
+
+			msg_cnt++;
+			msg_bytes++;
+
+			if (mdo == NEXUS_TCODE_Error)
+				msg_errors++;
+
+			fld_def++;
+			fld_bits = 0;
+			fld_val = 0;
+			continue;
+		}
+
+		/* Accumulate 'mdo' to field value */
+		fld_val |= (((u64)mdo) << fld_bits);
+		fld_bits += 6;
+
+		msg_bytes++;
+
+		/* Process fixed size fields (there may be more than one in one MDO record) */
+		while (NEXUS_MSG_DEF[fld_def].def & 0x200) {
+			int fld_size = NEXUS_MSG_DEF[fld_def].def & 0xFF;
+
+			if (fld_size & 0x80)
+				fld_size = decoder->src_bits;
+			if (fld_bits < fld_size)
+				break;	/* Not enough bits for this field */
+
+			/* Save field */
+			decoder->msg_fields[decoder->msg_field_cnt++] =
+				fld_val & ((((u64)1) << fld_size) - 1);
+
+			fld_def++;
+			fld_val >>= fld_size;
+			fld_bits -= fld_size;
+		}
+
+		if (mseo == 0x0)
+			continue;
+
+		if (NEXUS_MSG_DEF[fld_def].def & 0x400) {
+			/* Variable size field */
+			decoder->msg_fields[decoder->msg_field_cnt++] = fld_val; /* Save fieliid */
+
+			if (mseo == 3) {
+				int cnt = 1;
+
+				decoder->disp_hist_repeat = 0;
+
+				if (decoder->msg_fields[0] == NEXUS_TCODE_RepeatBranch) {
+					/* Special handling for repeat branch (which only
+					 * has 1 field!)
+					 */
+					/* Counter set in RepeatBranch message */
+					cnt = decoder->msg_fields[1];
+					decoder->msg_field_pos = decoder->saved_fields[0];
+					decoder->msg_field_cnt = decoder->saved_fields[1];
+					decoder->msg_fields[0] = decoder->saved_fields[2];
+					decoder->msg_fields[1] = decoder->saved_fields[3];
+					decoder->msg_fields[2] = decoder->saved_fields[4];
+					decoder->msg_fields[3] = decoder->saved_fields[5];
+					decoder->msg_fields[4] = decoder->saved_fields[6];
+					decoder->disp_hist_repeat = cnt;
+				}
+
+				while (cnt > 0) { /* Handle (1 or many times ...) */
+					int err = nexus_rv_msg_handle(decoder);
+
+					if (err < 0)
+						return err;
+					cnt--;
+				}
+
+				fld_def = -1;
+			} else {
+				fld_def++;
+			}
+			fld_bits = 0;
+			fld_val = 0;
+			continue;
+		}
+
+		if (fld_bits > 0) {
+			pr_err("Decode: Not enough bits for non-variable field\n");
+			find_next_package = true;
+			continue;
+		}
+	}
+
+	return 0;
+}
+
+struct nexus_rv_insn_decoder *nexus_rv_insn_decoder_new(struct nexus_rv_insn_decoder_params *params)
+{
+	int err;
+	struct nexus_rv_insn_decoder *decoder;
+
+	if (!params)
+		return NULL;
+
+	decoder = zalloc(sizeof(struct nexus_rv_insn_decoder));
+	if (!decoder)
+		return NULL;
+
+	decoder->mem_access = params->mem_access;
+	decoder->data = params->data;
+	decoder->formatted = params->formatted;
+	decoder->src_bits = params->src_bits;
+	decoder->current_src = -1;
+
+	decoder->src_contexts = intlist__new(NULL);
+	if (!decoder->src_contexts)
+		goto err_out;
+
+	err = nexus_rv_init_packet_buffer(&decoder->packet_buffer);
+	if (err)
+		goto err_out;
+
+	return decoder;
+
+err_out:
+	nexus_rv_free_src_contexts(decoder->src_contexts);
+	nexus_rv_free_packet_buffer(&decoder->packet_buffer);
+	free(decoder);
+	return NULL;
+}
+
+void nexus_rv_insn_decoder_free(struct nexus_rv_insn_decoder *decoder)
+{
+	for (int i = 0; i < MAX_ID; ++i)
+		free(decoder->defmt_bufs[i].buf);
+
+	nexus_rv_free_src_contexts(decoder->src_contexts);
+	nexus_rv_free_packet_buffer(&decoder->packet_buffer);
+	free(decoder);
+}
+
+int nexus_rv_insn_decoder_reset(struct nexus_rv_insn_decoder *decoder)
+{
+	int err;
+	struct int_node *node;
+	struct nexus_rv_src_context *ctx;
+
+	if (decoder->src_contexts) {
+		intlist__for_each_entry(node, decoder->src_contexts) {
+			ctx = (struct nexus_rv_src_context *)node->priv;
+			ctx->nexdeco_pc = 1;
+			ctx->nexdeco_lastaddr = 1;
+			ctx->prv = 0;
+			ctx->v = 0;
+			ctx->timestamp = 0;
+			ctx->context = -1;
+			ctx->resourcefull_icnt = 0;
+			nexus_rv_init_stack(&ctx->stack);
+		}
+	}
+	decoder->current_src_ctx = NULL;
+	decoder->current_src = -1;
+
+	err = nexus_rv_init_packet_buffer(&decoder->packet_buffer);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+int nexus_rv_insn_decode_data(struct nexus_rv_insn_decoder *decoder,
+			      const unsigned char *buf, size_t size)
+{
+	int err;
+	char filename[PATH_MAX];
+	FILE *nexus;
+	char *dir = getenv("PERF_BUILDID_DIR");
+
+	/* TODO: The filename here is always trace.bin, which results in
+	 * only the last Nexus trace data being retained. A corresponding
+	 * Nexus filename should be generated for each AUX data.
+	 */
+	snprintf(filename, sizeof(filename), "%s/trace.bin", dir);
+	nexus = fopen(filename, "w+");
+
+	if (decoder->formatted) {
+		err = nexus_rv_pkt_defmt(decoder->defmt_bufs, nexus, buf, size);
+		if (err) {
+			pr_err("Encoder: failed to remove coresight trace formatter\n");
+			fclose(nexus);
+			return err;
+		}
+	} else {
+		size_t n = fwrite(buf, size, 1, nexus);
+
+		if (n != 1) {
+			pr_err("Encoder: failed to write nexus data\n");
+			fclose(nexus);
+			return -EINVAL;
+		}
+	}
+
+	fseek(nexus, 0, SEEK_SET);
+	err = nexus_rv_insn_decode(decoder, nexus);
+
+	fclose(nexus);
+
+	return err;
+}
diff --git a/tools/perf/util/nexus-rv-decoder/nexus-rv-decoder.h b/tools/perf/util/nexus-rv-decoder/nexus-rv-decoder.h
new file mode 100644
index 000000000000..1595b59f3b3c
--- /dev/null
+++ b/tools/perf/util/nexus-rv-decoder/nexus-rv-decoder.h
@@ -0,0 +1,139 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright(C) 2026 Spacemit Limited. All rights reserved.
+ * Author: liangzhen <zhen.liang@spacemit.com>
+ */
+
+#ifndef INCLUDE__NEXUS_RV_DECODER_H__
+#define INCLUDE__NEXUS_RV_DECODER_H__
+
+#define INFO_LINEAR   0x1   // Linear (plain instruction or not taken BRANCH)
+#define INFO_4        0x2   // If not 4, it must be 2 on RISC-V
+//                    0x4   // Reserved (for exception or so ...)
+#define INFO_INDIRECT 0x8   // Possible for most types above
+#define INFO_BRANCH   0x10  // Always direct on RISC-V (may have LINEAR too)
+#define INFO_JUMP     0x20  // Direct or indirect
+#define INFO_CALL     0x40  // Direct or indirect (and always a jump)
+#define INFO_RET      0x80  // Return (always indirect and always a jump)
+
+#define MAX_ID 112  // Values of 0x00 and 0x70-0x7F are reserved by the ATB specification
+#define MSGFIELDS_MAX 10
+#define INSN_SZ       16
+
+/* check an ID is in the valid range */
+#define IS_VALID_ID(id)	    \
+	((id > 0) && (id < MAX_ID))
+
+struct rvtrace_queue;
+
+struct nexus_rv_defmt_buf {
+	unsigned char *buf;
+	size_t size;
+	size_t capacity;
+};
+
+struct nexus_rv_pkt_decoder {
+	bool formatted;
+	struct nexus_rv_defmt_buf defmt_bufs[MAX_ID];
+	u32 src_bits;
+};
+
+struct nexus_rv_pkt_decoder_params {
+	bool formatted;
+	u32 src_bits;
+};
+
+struct nexus_rv_stack {
+	u64 *data;
+	int top;
+	int capacity;
+};
+
+enum rvtrace_sample_type {
+	RVTRACE_EMPTY,
+	RVTRACE_RANGE,
+	RVTRACE_LOSS,
+	RVTRACE_ERROR,
+};
+
+enum riscv_privilege_mode {
+	RISCV_PRIV_USER_MODE,
+	RISCV_PRIV_SUPERVISOR_MODE,
+	RISCV_PRIV_MACHINE_MODE = 3,
+};
+
+typedef u32 (*rvtrace_mem_access_type)(void *, u64, enum riscv_privilege_mode,
+				       int, size_t, u8 *);
+
+struct nexus_rv_packet {
+	enum rvtrace_sample_type sample_type;
+	u64 start_addr;
+	u64 end_addr;
+	u32 insn_cnt;
+	int cpu;
+	enum riscv_privilege_mode prv;
+	bool v;
+	int context;
+	u64 timestamp;
+};
+
+struct nexus_rv_packet_buffer {
+	struct nexus_rv_packet *packets;
+	int size;
+	int capacity;
+};
+
+struct nexus_rv_src_context {
+	int src_id;
+	u64 nexdeco_pc;
+	u64 nexdeco_lastaddr;
+	u64 current_pc;
+	u64 timestamp;
+	enum riscv_privilege_mode prv;
+	bool v;
+	int context;
+	int resourcefull_icnt;
+	struct nexus_rv_stack stack;
+};
+
+struct nexus_rv_insn_decoder {
+	rvtrace_mem_access_type mem_access;
+	void *data;
+	bool formatted;
+	struct nexus_rv_defmt_buf defmt_bufs[MAX_ID];
+	u32 src_bits;
+	int msg_field_pos;
+	u64 msg_fields[MSGFIELDS_MAX];
+	u64 saved_fields[MSGFIELDS_MAX];
+	int msg_field_cnt;
+	int disp_hist_repeat;
+	int current_src;
+	struct intlist *src_contexts;
+	struct nexus_rv_src_context *current_src_ctx;
+	struct nexus_rv_packet_buffer packet_buffer;
+};
+
+struct nexus_rv_insn_decoder_params {
+	rvtrace_mem_access_type mem_access;
+	void *data;
+	bool formatted;
+	u32 src_bits;
+};
+
+struct nexus_rv_pkt_decoder *nexus_rv_pkt_decoder_new(struct nexus_rv_pkt_decoder_params *params);
+
+void nexus_rv_pkt_decoder_free(struct nexus_rv_pkt_decoder *decoder);
+
+int nexus_rv_pkt_desc(struct nexus_rv_pkt_decoder *decoder, const unsigned char *buf, size_t len);
+
+struct nexus_rv_insn_decoder *nexus_rv_insn_decoder_new(
+	struct nexus_rv_insn_decoder_params *params);
+
+void nexus_rv_insn_decoder_free(struct nexus_rv_insn_decoder *decoder);
+
+int nexus_rv_insn_decoder_reset(struct nexus_rv_insn_decoder *decoder);
+
+int nexus_rv_insn_decode_data(struct nexus_rv_insn_decoder *decoder,
+			      const unsigned char *buf, size_t size);
+
+#endif
diff --git a/tools/perf/util/nexus-rv-decoder/nexus-rv-msg.h b/tools/perf/util/nexus-rv-decoder/nexus-rv-msg.h
new file mode 100644
index 000000000000..90d95f2c5f5f
--- /dev/null
+++ b/tools/perf/util/nexus-rv-decoder/nexus-rv-msg.h
@@ -0,0 +1,190 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 IAR Systems AB.
+ */
+
+#ifndef INCLUDE__NEXUS_RV_MSG_H__
+#define INCLUDE__NEXUS_RV_MSG_H__
+
+/****************************************************************************/
+/* Nexus RISC-V Trace header. */
+
+// Header with common Nexus Trace definitions
+
+#include <stdint.h> // For uint32_t and uint64_t
+
+/****************************************************************************/
+/* Nexus specific values (based on Nexus Standard PDF) */
+
+#define NEXUS_FLDSIZE_TCODE                       6 // This is standard
+
+// Nexus TCODE values applicable to RISC-V
+#define NEXUS_TCODE_Ownership                     2
+#define NEXUS_TCODE_DirectBranch                  3
+#define NEXUS_TCODE_IndirectBranch                4
+#define NEXUS_TCODE_Error                         8
+#define NEXUS_TCODE_ProgTraceSync                 9
+#define NEXUS_TCODE_DirectBranchSync              11
+#define NEXUS_TCODE_IndirectBranchSync            12
+#define NEXUS_TCODE_ResourceFull                  27
+#define NEXUS_TCODE_IndirectBranchHist            28
+#define NEXUS_TCODE_IndirectBranchHistSync        29
+#define NEXUS_TCODE_RepeatBranch                  30
+#define NEXUS_TCODE_ProgTraceCorrelation          33
+
+// End of standard values
+/****************************************************************************/
+
+/****************************************************************************/
+/* RISC-V Nexus Trace related values (most 'recommended' by Nexus) */
+
+//  Sizes of fields:
+#define NEXUS_FLDSIZE_BTYPE     2 // Branch type
+#define NEXUS_FLDSIZE_SYNC      4 // Synchronization code
+#define NEXUS_FLDSIZE_ETYPE     4 // Error type
+#define NEXUS_FLDSIZE_EVCODE    4 // Event code (correlation)
+#define NEXUS_FLDSIZE_CDF       2
+#define NEXUS_FLDSIZE_RCODE     4 // Resource full code size
+//  from PROCESS fields:
+#define NEXUS_FLDSIZE_FORMAT    2
+#define NEXUS_FLDSIZE_PRV       2
+#define NEXUS_FLDSIZE_V         1
+
+#define NEXUS_PAR_SIZE_SRC      0 // SRC field size is defined by parameter #0
+
+#define NEXUS_HIST_BITS         31 // Number of valid HIST bits
+
+// Address skipping (on RISC-V LSB of PC is always 0, so it is not encoded)
+#define NEXUS_PARAM_AddrSkip    1
+#define NEXUS_PARAM_AddrUnit    1
+
+// End of RISC-V related values
+/****************************************************************************/
+
+// Nexus RISC-V Trace message definitions (dump & decode)
+
+// Macros to define Nexus Messages (NEXM_...)
+//  NOTE: These macros refer to 'NEXUS_TCODE_...' and 'NEXUS_FLDSIZE_...'
+//  It is also possible to NOT do it, but it provides less flexibility.
+//
+//                          name   def (marker | value)
+//#define NEXM_BEG(n, t)      {#n,    0x100 | (t)                 }
+#define NEXM_BEG(n)         {#n,    0x100 | (NEXUS_TCODE_##n)   } \
+			    // , NEXM_FLD_PAR(SRC) // SRC is always following TCODE
+//#define   NEXM_FLD(n, s)    {#n,    0x200 | (s)                 }
+#define   NEXM_FLD(n)       {#n,    0x200 | (NEXUS_FLDSIZE_##n) }
+// 0x80 means size is a parameter
+#define   NEXM_FLD_PAR(n)   {#n,    0x200 | 0x80 | (NEXUS_PAR_SIZE_##n) }
+#define   NEXM_VAR(n)       {#n,    0x400                       }
+#define   NEXM_ADR(n)       {#n,    0xC00                       }
+#define NEXM_END()          {NULL,  1                           }
+
+// Definition of Nexus Messages (subset applicable to RISC-V PC trace)
+static struct NEXM_MSGDEF_STRU {
+	const char *name; // Name of message/field
+	int def;          // Definition of field (see NEXM_... above)
+} NEXUS_MSG_DEF[] = {
+
+	NEXM_BEG(Ownership),
+	  NEXM_FLD_PAR(SRC),
+	  //NEXM_VAR(PROCESS),
+	  NEXM_FLD(FORMAT),
+	  NEXM_FLD(PRV),
+	  NEXM_FLD(V),
+	  NEXM_VAR(CONTEXT),
+	  NEXM_VAR(TSTAMP),
+	NEXM_END(),
+
+	NEXM_BEG(DirectBranch),
+	  NEXM_FLD_PAR(SRC),
+	  NEXM_VAR(ICNT),
+	  NEXM_VAR(TSTAMP),
+	NEXM_END(),
+
+	NEXM_BEG(IndirectBranch),
+	  NEXM_FLD_PAR(SRC),
+	  NEXM_FLD(BTYPE),
+	  NEXM_VAR(ICNT),
+	  NEXM_ADR(UADDR),
+	  NEXM_VAR(TSTAMP),
+	NEXM_END(),
+
+	NEXM_BEG(Error),
+	  NEXM_FLD_PAR(SRC),
+	  NEXM_FLD(ETYPE),
+	  NEXM_VAR(PAD),
+	  NEXM_VAR(TSTAMP),
+	NEXM_END(),
+
+	NEXM_BEG(ProgTraceSync),
+	  NEXM_FLD_PAR(SRC),
+	  NEXM_FLD(SYNC),
+	  NEXM_VAR(ICNT),
+	  NEXM_ADR(FADDR),
+	  NEXM_VAR(TSTAMP),
+	NEXM_END(),
+
+	NEXM_BEG(DirectBranchSync),
+	  NEXM_FLD_PAR(SRC),
+	  NEXM_FLD(SYNC),
+	  NEXM_VAR(ICNT),
+	  NEXM_ADR(FADDR),
+	  NEXM_VAR(TSTAMP),
+	NEXM_END(),
+
+	NEXM_BEG(IndirectBranchSync),
+	  NEXM_FLD_PAR(SRC),
+	  NEXM_FLD(SYNC),
+	  NEXM_FLD(BTYPE),
+	  NEXM_VAR(ICNT),
+	  NEXM_ADR(FADDR),
+	  NEXM_VAR(TSTAMP),
+	NEXM_END(),
+
+	NEXM_BEG(ResourceFull),
+	  NEXM_FLD_PAR(SRC),
+	  NEXM_FLD(RCODE),
+	  NEXM_VAR(RDATA),
+	  NEXM_VAR(HREPEAT),
+	  NEXM_VAR(TSTAMP),
+	NEXM_END(),
+
+	NEXM_BEG(IndirectBranchHist),
+	  NEXM_FLD_PAR(SRC),
+	  NEXM_FLD(BTYPE),
+	  NEXM_VAR(ICNT),
+	  NEXM_ADR(UADDR),
+	  NEXM_VAR(HIST),
+	  NEXM_VAR(TSTAMP),
+	NEXM_END(),
+
+	NEXM_BEG(IndirectBranchHistSync),
+	  NEXM_FLD_PAR(SRC),
+	  NEXM_FLD(SYNC),
+	  NEXM_FLD(BTYPE),
+	  // NEXM_FLD(CANCEL),
+	  NEXM_VAR(ICNT),
+	  NEXM_ADR(FADDR),
+	  NEXM_VAR(HIST),
+	  NEXM_VAR(TSTAMP),
+	NEXM_END(),
+
+	NEXM_BEG(RepeatBranch),
+	  NEXM_FLD_PAR(SRC),
+	  NEXM_VAR(BCNT),
+	  NEXM_VAR(TSTAMP),
+	NEXM_END(),
+
+	NEXM_BEG(ProgTraceCorrelation),
+	  NEXM_FLD_PAR(SRC),
+	  NEXM_FLD(EVCODE),
+	  NEXM_FLD(CDF),
+	  NEXM_VAR(ICNT),
+	  NEXM_VAR(HIST),   // Only if CDF=1!
+	  NEXM_VAR(TSTAMP),
+	NEXM_END(),
+
+	{ NULL, 0 } // End-marker ('def == 0' is not otherwise used - see NEXM_...)
+};
+
+#endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
