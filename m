Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86EEC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Mar 2022 08:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xRMZd21tKxDkQ8UdsDnLdhFdpx5uIiFRZZXHV890HrA=; b=TgWO0MyTD8i8HC
	CgL+ikmJgr9k+Yg1XN1T0yh4i13RivWfLiUGf0UVmXk8aLGYx8ritRivhK0Vam8OjOr1IA/vTWhqY
	g6ZlZX4Pq65ddhQifDnVcHF2y+V3AxK7uy8U7EGwvqFIfXy/+hIl1kodP1YE3og0EiWuEs4uIWawL
	muS3cDgq8kGzgJQ9/bnqLaD6bXaS3j01LQ69QVLR1WW/MZTORrKGMZU+E8hVN8pDbevsI+HbyWh0N
	10DyWsgJDBxV0paeBygxvNqKwxsv806pSoFxQ3lbjPS83UW0GrFmkDWf6ou84qB2JjEmrlqhYWv3B
	Vzli7tgllOP/eQ4UzkmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRVHJ-003HTi-S2; Tue, 08 Mar 2022 08:33:09 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRVHF-003HRe-5q
 for linux-riscv@lists.infradead.org; Tue, 08 Mar 2022 08:33:08 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 c16-20020a17090aa61000b001befad2bfaaso1748581pjq.1
 for <linux-riscv@lists.infradead.org>; Tue, 08 Mar 2022 00:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wqJPK7gJwRjnxGCy/1xJqzYBCwrwBHapPtG5B0u2ghw=;
 b=Q7ElcIGy/FSi47nQIylfCvP1XiRW81NGcjvgCFLBPI6Tp+hUhH88w8lzPZGXNeeqks
 6DkZ07v/6BfNmV1/gHnGEYADd4WAlO6orvx/+MOf5eMviKjMyr9s1MotNFP4mUHw8Qs3
 hk2QD1o0zrqtZrZSZT8kQc3BT/HQRdOIqg1H+2itGq8Jr02XooVDw7cwXVL/FwaIfayo
 h//S8qfnTdEzT6rytjW704bm42jTiWKCXC+BH05GIQvtuKH79bZqMiviGlK1Sz1zvVxp
 E6QGym/5jOy0zacO3zuTzvYpPZEfmCUMLMz8Hl/cqrXzhiX2T9+WndPvh+xLmo2B2fyL
 8hUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wqJPK7gJwRjnxGCy/1xJqzYBCwrwBHapPtG5B0u2ghw=;
 b=VCHaPo2BIQ5rFPvDkUTQ80X3ec0rjQPT/c46IYV6s1F7F/0XtpKeK3W50P4DDpzHh1
 6Glqz9/Ke0Mx79IbTocReKBZn4HzkC9E0YDPyoTgC6JsGAvyvgZzAYqkhkjj9GnICBRW
 b42ruVz34K23w6nMAm18l0Lqs1eQoRsoudd1J5YRDK1Q+D51DQloxQzmh802nFxjkrgJ
 FBRgzyDPtqPoS6FTdsCq1rwQdGNhrumoWxH9K3jnmsB9ncHfUx5hCBHSWGEnhqGAuVXt
 PfzQGg2Ep2kHYYkUWglY+nFD7zoCn8QljT/2n/Y75ZKeARoFBFNvMOgvdCx0HanBsDLJ
 chRg==
X-Gm-Message-State: AOAM531rEnvDk3JBHAdMW2eqZyKJjSCcwvJbrn0lOuu/G03C8wzqoSdS
 PIB/JzL+l882Eljy5wgyo/JjUQ==
X-Google-Smtp-Source: ABdhPJzsdmBXdcU3WwpMRrYvLCkiP1ggpfrTvhLZmZUxo+YCHPfIwgnRBg0LpXCsRKKpQnOPp/lCig==
X-Received: by 2002:a17:90b:f8a:b0:1be:dccd:e4f7 with SMTP id
 ft10-20020a17090b0f8a00b001bedccde4f7mr3466173pjb.92.1646728383797; 
 Tue, 08 Mar 2022 00:33:03 -0800 (PST)
Received: from localhost.localdomain (36-226-208-100.dynamic-ip.hinet.net.
 [36.226.208.100]) by smtp.gmail.com with ESMTPSA id
 x6-20020a17090aa38600b001bce781ce03sm1912854pjp.18.2022.03.08.00.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 00:33:03 -0800 (PST)
From: Vincent Chen <vincent.chen@sifive.com>
To: palmer@dabbelt.com,
	mathieu.desnoyers@efficios.com
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 vincent.chen@sifive.com
Subject: [PATCH v4 2/2] rseq/selftests: Add support for RISC-V
Date: Tue,  8 Mar 2022 16:32:53 +0800
Message-Id: <20220308083253.12285-3-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220308083253.12285-1-vincent.chen@sifive.com>
References: <20220308083253.12285-1-vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_003305_282062_5B5C3F58 
X-CRM114-Status: GOOD (  16.09  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add support for RISC-V in the rseq selftests, which covers both
64-bit and 32-bit ISA with little endian mode.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Tested-by: Eric Lin <eric.lin@sifive.com>
---
 tools/testing/selftests/rseq/param_test.c |  23 +
 tools/testing/selftests/rseq/rseq-riscv.h | 677 ++++++++++++++++++++++
 tools/testing/selftests/rseq/rseq.h       |   2 +
 3 files changed, 702 insertions(+)
 create mode 100644 tools/testing/selftests/rseq/rseq-riscv.h

diff --git a/tools/testing/selftests/rseq/param_test.c b/tools/testing/selftests/rseq/param_test.c
index 699ad5f93c34..0a6b8eafd444 100644
--- a/tools/testing/selftests/rseq/param_test.c
+++ b/tools/testing/selftests/rseq/param_test.c
@@ -207,6 +207,29 @@ unsigned int yield_mod_cnt, nr_abort;
 	"addiu " INJECT_ASM_REG ", -1\n\t" \
 	"bnez " INJECT_ASM_REG ", 222b\n\t" \
 	"333:\n\t"
+#elif defined(__riscv)
+
+#define RSEQ_INJECT_INPUT \
+	, [loop_cnt_1]"m"(loop_cnt[1]) \
+	, [loop_cnt_2]"m"(loop_cnt[2]) \
+	, [loop_cnt_3]"m"(loop_cnt[3]) \
+	, [loop_cnt_4]"m"(loop_cnt[4]) \
+	, [loop_cnt_5]"m"(loop_cnt[5]) \
+	, [loop_cnt_6]"m"(loop_cnt[6])
+
+#define INJECT_ASM_REG	"t1"
+
+#define RSEQ_INJECT_CLOBBER \
+	, INJECT_ASM_REG
+
+#define RSEQ_INJECT_ASM(n)					\
+	"lw " INJECT_ASM_REG ", %[loop_cnt_" #n "]\n\t"		\
+	"beqz " INJECT_ASM_REG ", 333f\n\t"			\
+	"222:\n\t"						\
+	"addi  " INJECT_ASM_REG "," INJECT_ASM_REG ", -1\n\t"	\
+	"bnez " INJECT_ASM_REG ", 222b\n\t"			\
+	"333:\n\t"
+
 
 #else
 #error unsupported target
diff --git a/tools/testing/selftests/rseq/rseq-riscv.h b/tools/testing/selftests/rseq/rseq-riscv.h
new file mode 100644
index 000000000000..b86642f90d7f
--- /dev/null
+++ b/tools/testing/selftests/rseq/rseq-riscv.h
@@ -0,0 +1,677 @@
+/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
+/*
+ * Select the instruction "csrw mhartid, x0" as the RSEQ_SIG. Unlike
+ * other architectures, the ebreak instruction has no immediate field for
+ * distinguishing purposes. Hence, ebreak is not suitable as RSEQ_SIG.
+ * "csrw mhartid, x0" can also satisfy the RSEQ requirement because it
+ * is an uncommon instruction and will raise an illegal instruction
+ * exception when executed in all modes.
+ */
+#include <endian.h>
+
+#if defined(__BYTE_ORDER) ? (__BYTE_ORDER == __LITTLE_ENDIAN) : defined(__LITTLE_ENDIAN)
+#define RSEQ_SIG   0xf1401073  /* csrr mhartid, x0 */
+#else
+#error "Currently, RSEQ only supports Little-Endian version"
+#endif
+
+#if __riscv_xlen == 64
+#define __REG_SEL(a, b)	a
+#elif __riscv_xlen == 32
+#define __REG_SEL(a, b)	b
+#endif
+
+#define REG_L	__REG_SEL("ld ", "lw ")
+#define REG_S	__REG_SEL("sd ", "sw ")
+
+#define RISCV_FENCE(p, s) \
+	__asm__ __volatile__ ("fence " #p "," #s : : : "memory")
+#define rseq_smp_mb()	RISCV_FENCE(rw, rw)
+#define rseq_smp_rmb()	RISCV_FENCE(r, r)
+#define rseq_smp_wmb()	RISCV_FENCE(w, w)
+#define RSEQ_ASM_TMP_REG_1	"t6"
+#define RSEQ_ASM_TMP_REG_2	"t5"
+#define RSEQ_ASM_TMP_REG_3	"t4"
+#define RSEQ_ASM_TMP_REG_4	"t3"
+
+#define rseq_smp_load_acquire(p)					\
+__extension__ ({							\
+	__typeof(*(p)) ____p1 = RSEQ_READ_ONCE(*(p));			\
+	RISCV_FENCE(r, rw)						\
+	____p1;								\
+})
+
+#define rseq_smp_acquire__after_ctrl_dep()	rseq_smp_rmb()
+
+#define rseq_smp_store_release(p, v)					\
+do {									\
+	RISCV_FENCE(rw, w);						\
+	RSEQ_WRITE_ONCE(*(p), v);						\
+} while (0)
+
+#ifdef RSEQ_SKIP_FASTPATH
+#include "rseq-skip.h"
+#else /* !RSEQ_SKIP_FASTPATH */
+
+#define __RSEQ_ASM_DEFINE_TABLE(label, version, flags, start_ip,	\
+				post_commit_offset, abort_ip)		\
+	".pushsection	__rseq_cs, \"aw\"\n"				\
+	".balign	32\n"						\
+	__rseq_str(label) ":\n"						\
+	".long	" __rseq_str(version) ", " __rseq_str(flags) "\n"	\
+	".quad	" __rseq_str(start_ip) ", "				\
+			  __rseq_str(post_commit_offset) ", "		\
+			  __rseq_str(abort_ip) "\n"			\
+	".popsection\n\t"						\
+	".pushsection __rseq_cs_ptr_array, \"aw\"\n"			\
+	".quad " __rseq_str(label) "b\n"				\
+	".popsection\n"
+
+#define RSEQ_ASM_DEFINE_TABLE(label, start_ip, post_commit_ip, abort_ip) \
+	__RSEQ_ASM_DEFINE_TABLE(label, 0x0, 0x0, start_ip,		 \
+				((post_commit_ip) - (start_ip)), abort_ip)
+
+/*
+ * Exit points of a rseq critical section consist of all instructions outside
+ * of the critical section where a critical section can either branch to or
+ * reach through the normal course of its execution. The abort IP and the
+ * post-commit IP are already part of the __rseq_cs section and should not be
+ * explicitly defined as additional exit points. Knowing all exit points is
+ * useful to assist debuggers stepping over the critical section.
+ */
+#define RSEQ_ASM_DEFINE_EXIT_POINT(start_ip, exit_ip)			\
+	".pushsection __rseq_exit_point_array, \"aw\"\n"		\
+	".quad " __rseq_str(start_ip) ", " __rseq_str(exit_ip) "\n"	\
+	".popsection\n"
+
+#define RSEQ_ASM_STORE_RSEQ_CS(label, cs_label, rseq_cs)		\
+	RSEQ_INJECT_ASM(1)						\
+	"la	"RSEQ_ASM_TMP_REG_1 ", " __rseq_str(cs_label) "\n"	\
+	REG_S	RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(rseq_cs) "]\n"	\
+	__rseq_str(label) ":\n"
+
+#define RSEQ_ASM_DEFINE_ABORT(label, abort_label)			\
+	"j	222f\n"							\
+	".balign	4\n"						\
+	".long "	__rseq_str(RSEQ_SIG) "\n"			\
+	__rseq_str(label) ":\n"						\
+	"j	%l[" __rseq_str(abort_label) "]\n"			\
+	"222:\n"
+
+#define RSEQ_ASM_OP_STORE(value, var)					\
+	REG_S	"%[" __rseq_str(value) "], %[" __rseq_str(var) "]\n"
+
+#define RSEQ_ASM_OP_CMPEQ(var, expect, label)				\
+	REG_L	RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"		\
+	"bne	"RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(expect) "] ,"	\
+		  __rseq_str(label) "\n"
+
+#define RSEQ_ASM_OP_CMPEQ32(var, expect, label)				\
+	"lw	"RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"	\
+	"bne	"RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(expect) "] ,"	\
+		  __rseq_str(label) "\n"
+
+#define RSEQ_ASM_OP_CMPNE(var, expect, label)				\
+	REG_L	RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"		\
+	"beq	"RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(expect) "] ,"	\
+		  __rseq_str(label) "\n"
+
+#define RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, label)		\
+	RSEQ_INJECT_ASM(2)						\
+	RSEQ_ASM_OP_CMPEQ32(current_cpu_id, cpu_id, label)
+
+#define RSEQ_ASM_OP_R_LOAD(var)						\
+	REG_L	RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"
+
+#define RSEQ_ASM_OP_R_STORE(var)					\
+	REG_S	RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"
+
+#define RSEQ_ASM_OP_R_LOAD_OFF(offset)					\
+	"add	"RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(offset) "], "	\
+		 RSEQ_ASM_TMP_REG_1 "\n"				\
+	REG_L	RSEQ_ASM_TMP_REG_1 ", (" RSEQ_ASM_TMP_REG_1 ")\n"
+
+#define RSEQ_ASM_OP_R_ADD(count)					\
+	"add	"RSEQ_ASM_TMP_REG_1 ", " RSEQ_ASM_TMP_REG_1		\
+		", %[" __rseq_str(count) "]\n"
+
+#define RSEQ_ASM_OP_FINAL_STORE(value, var, post_commit_label)		\
+	RSEQ_ASM_OP_STORE(value, var)					\
+	__rseq_str(post_commit_label) ":\n"
+
+#define RSEQ_ASM_OP_FINAL_STORE_RELEASE(value, var, post_commit_label)	\
+	"fence	rw, w\n"						\
+	RSEQ_ASM_OP_STORE(value, var)					\
+	__rseq_str(post_commit_label) ":\n"
+
+#define RSEQ_ASM_OP_R_FINAL_STORE(var, post_commit_label)		\
+	REG_S	RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"		\
+	__rseq_str(post_commit_label) ":\n"
+
+#define RSEQ_ASM_OP_R_BAD_MEMCPY(dst, src, len)				\
+	"beqz	%[" __rseq_str(len) "], 333f\n"				\
+	"mv	" RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(len) "]\n"	\
+	"mv	" RSEQ_ASM_TMP_REG_2 ", %[" __rseq_str(src) "]\n"	\
+	"mv	" RSEQ_ASM_TMP_REG_3 ", %[" __rseq_str(dst) "]\n"	\
+	"222:\n"							\
+	"lb	" RSEQ_ASM_TMP_REG_4 ", 0(" RSEQ_ASM_TMP_REG_2 ")\n"	\
+	"sb	" RSEQ_ASM_TMP_REG_4 ", 0(" RSEQ_ASM_TMP_REG_3 ")\n"	\
+	"addi	" RSEQ_ASM_TMP_REG_1 ", " RSEQ_ASM_TMP_REG_1 ", -1\n"	\
+	"addi	" RSEQ_ASM_TMP_REG_2 ", " RSEQ_ASM_TMP_REG_2 ", 1\n"	\
+	"addi	" RSEQ_ASM_TMP_REG_3 ", " RSEQ_ASM_TMP_REG_3 ", 1\n"	\
+	"bnez	" RSEQ_ASM_TMP_REG_1 ", 222b\n"				\
+	"333:\n"
+
+#define RSEQ_ASM_OP_R_DEREF_ADDV(ptr, off, post_commit_label)		\
+	"mv	" RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(ptr) "]\n"	\
+	RSEQ_ASM_OP_R_ADD(off)						\
+	REG_L	  RSEQ_ASM_TMP_REG_1 ", 0(" RSEQ_ASM_TMP_REG_1 ")\n"	\
+	RSEQ_ASM_OP_R_ADD(inc)						\
+	__rseq_str(post_commit_label) ":\n"
+
+static inline __always_inline
+int rseq_cmpeqv_storev(intptr_t *v, intptr_t expect, intptr_t newv, int cpu)
+{
+	RSEQ_INJECT_C(9)
+
+	__asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
+				  RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[cmpfail]")
+#ifdef RSEQ_COMPARE_TWICE
+				  RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error1]")
+				  RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error2]")
+#endif
+				  RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
+				  RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
+				  RSEQ_INJECT_ASM(3)
+				  RSEQ_ASM_OP_CMPEQ(v, expect, "%l[cmpfail]")
+				  RSEQ_INJECT_ASM(4)
+#ifdef RSEQ_COMPARE_TWICE
+				  RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
+				  RSEQ_ASM_OP_CMPEQ(v, expect, "%l[error2]")
+#endif
+				  RSEQ_ASM_OP_FINAL_STORE(newv, v, 3)
+				  RSEQ_INJECT_ASM(5)
+				  RSEQ_ASM_DEFINE_ABORT(4, abort)
+				  : /* gcc asm goto does not allow outputs */
+				  : [cpu_id]		"r" (cpu),
+				    [current_cpu_id]	"m" (__rseq_abi.cpu_id),
+				    [rseq_cs]		"m" (__rseq_abi.rseq_cs),
+				    [v]			"m" (*v),
+				    [expect]		"r" (expect),
+				    [newv]		"r" (newv)
+				    RSEQ_INJECT_INPUT
+				  : "memory", RSEQ_ASM_TMP_REG_1
+				    RSEQ_INJECT_CLOBBER
+				  : abort, cmpfail
+#ifdef RSEQ_COMPARE_TWICE
+				    , error1, error2
+#endif
+	);
+
+	return 0;
+abort:
+	RSEQ_INJECT_FAILED
+	return -1;
+cmpfail:
+	return 1;
+#ifdef RSEQ_COMPARE_TWICE
+error1:
+	rseq_bug("cpu_id comparison failed");
+error2:
+	rseq_bug("expected value comparison failed");
+#endif
+}
+
+static inline __always_inline
+int rseq_cmpnev_storeoffp_load(intptr_t *v, intptr_t expectnot,
+			       off_t voffp, intptr_t *load, int cpu)
+{
+	RSEQ_INJECT_C(9)
+
+	__asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
+				  RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[cmpfail]")
+#ifdef RSEQ_COMPARE_TWICE
+				  RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error1]")
+				  RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error2]")
+#endif
+				  RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
+				  RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
+				  RSEQ_INJECT_ASM(3)
+				  RSEQ_ASM_OP_CMPNE(v, expectnot, "%l[cmpfail]")
+				  RSEQ_INJECT_ASM(4)
+#ifdef RSEQ_COMPARE_TWICE
+				  RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
+				  RSEQ_ASM_OP_CMPNE(v, expectnot, "%l[error2]")
+#endif
+				  RSEQ_ASM_OP_R_LOAD(v)
+				  RSEQ_ASM_OP_R_STORE(load)
+				  RSEQ_ASM_OP_R_LOAD_OFF(voffp)
+				  RSEQ_ASM_OP_R_FINAL_STORE(v, 3)
+				  RSEQ_INJECT_ASM(5)
+				  RSEQ_ASM_DEFINE_ABORT(4, abort)
+				  : /* gcc asm goto does not allow outputs */
+				  : [cpu_id]		"r" (cpu),
+				    [current_cpu_id]	"m" (__rseq_abi.cpu_id),
+				    [rseq_cs]		"m" (__rseq_abi.rseq_cs),
+				    [v]			"m" (*v),
+				    [expectnot]		"r" (expectnot),
+				    [load]		"m" (*load),
+				    [voffp]		"r" (voffp)
+				    RSEQ_INJECT_INPUT
+				  : "memory", RSEQ_ASM_TMP_REG_1
+				    RSEQ_INJECT_CLOBBER
+				  : abort, cmpfail
+#ifdef RSEQ_COMPARE_TWICE
+				    , error1, error2
+#endif
+	);
+	return 0;
+abort:
+	RSEQ_INJECT_FAILED
+	return -1;
+cmpfail:
+	return 1;
+#ifdef RSEQ_COMPARE_TWICE
+error1:
+	rseq_bug("cpu_id comparison failed");
+error2:
+	rseq_bug("expected value comparison failed");
+#endif
+}
+
+static inline __always_inline
+int rseq_addv(intptr_t *v, intptr_t count, int cpu)
+{
+	RSEQ_INJECT_C(9)
+
+	__asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
+#ifdef RSEQ_COMPARE_TWICE
+				  RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error1]")
+#endif
+				  RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
+				  RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
+				  RSEQ_INJECT_ASM(3)
+#ifdef RSEQ_COMPARE_TWICE
+				  RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
+#endif
+				  RSEQ_ASM_OP_R_LOAD(v)
+				  RSEQ_ASM_OP_R_ADD(count)
+				  RSEQ_ASM_OP_R_FINAL_STORE(v, 3)
+				  RSEQ_INJECT_ASM(4)
+				  RSEQ_ASM_DEFINE_ABORT(4, abort)
+				  : /* gcc asm goto does not allow outputs */
+				  : [cpu_id]		"r" (cpu),
+				    [current_cpu_id]	"m" (__rseq_abi.cpu_id),
+				    [rseq_cs]		"m" (__rseq_abi.rseq_cs),
+				    [v]			"m" (*v),
+				    [count]		"r" (count)
+				    RSEQ_INJECT_INPUT
+				  : "memory", RSEQ_ASM_TMP_REG_1
+				    RSEQ_INJECT_CLOBBER
+				  : abort
+#ifdef RSEQ_COMPARE_TWICE
+				    , error1
+#endif
+	);
+	return 0;
+abort:
+	RSEQ_INJECT_FAILED
+	return -1;
+#ifdef RSEQ_COMPARE_TWICE
+error1:
+	rseq_bug("cpu_id comparison failed");
+#endif
+}
+
+static inline __always_inline
+int rseq_cmpeqv_trystorev_storev(intptr_t *v, intptr_t expect,
+				 intptr_t *v2, intptr_t newv2,
+				 intptr_t newv, int cpu)
+{
+	RSEQ_INJECT_C(9)
+
+	__asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
+				  RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[cmpfail]")
+#ifdef RSEQ_COMPARE_TWICE
+				  RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error1]")
+				  RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error2]")
+#endif
+				  RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
+				  RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
+				  RSEQ_INJECT_ASM(3)
+				  RSEQ_ASM_OP_CMPEQ(v, expect, "%l[cmpfail]")
+				  RSEQ_INJECT_ASM(4)
+#ifdef RSEQ_COMPARE_TWICE
+				  RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
+				  RSEQ_ASM_OP_CMPEQ(v, expect, "%l[error2]")
+#endif
+				  RSEQ_ASM_OP_STORE(newv2, v2)
+				  RSEQ_INJECT_ASM(5)
+				  RSEQ_ASM_OP_FINAL_STORE(newv, v, 3)
+				  RSEQ_INJECT_ASM(6)
+				  RSEQ_ASM_DEFINE_ABORT(4, abort)
+				  : /* gcc asm goto does not allow outputs */
+				  : [cpu_id]		"r" (cpu),
+				    [current_cpu_id]	"m" (__rseq_abi.cpu_id),
+				    [rseq_cs]		"m" (__rseq_abi.rseq_cs),
+				    [expect]		"r" (expect),
+				    [v]			"m" (*v),
+				    [newv]		"r" (newv),
+				    [v2]			"m" (*v2),
+				    [newv2]		"r" (newv2)
+				    RSEQ_INJECT_INPUT
+				  : "memory", RSEQ_ASM_TMP_REG_1
+				    RSEQ_INJECT_CLOBBER
+				  : abort, cmpfail
+#ifdef RSEQ_COMPARE_TWICE
+				    , error1, error2
+#endif
+	);
+
+	return 0;
+abort:
+	RSEQ_INJECT_FAILED
+	return -1;
+cmpfail:
+	return 1;
+#ifdef RSEQ_COMPARE_TWICE
+error1:
+	rseq_bug("cpu_id comparison failed");
+error2:
+	rseq_bug("expected value comparison failed");
+#endif
+}
+
+static inline __always_inline
+int rseq_cmpeqv_trystorev_storev_release(intptr_t *v, intptr_t expect,
+					 intptr_t *v2, intptr_t newv2,
+					 intptr_t newv, int cpu)
+{
+	RSEQ_INJECT_C(9)
+
+	__asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
+				  RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[cmpfail]")
+#ifdef RSEQ_COMPARE_TWICE
+				  RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error1]")
+				  RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error2]")
+#endif
+				  RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
+				  RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
+				  RSEQ_INJECT_ASM(3)
+				  RSEQ_ASM_OP_CMPEQ(v, expect, "%l[cmpfail]")
+				  RSEQ_INJECT_ASM(4)
+#ifdef RSEQ_COMPARE_TWICE
+				  RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
+				  RSEQ_ASM_OP_CMPEQ(v, expect, "%l[error2]")
+#endif
+				  RSEQ_ASM_OP_STORE(newv2, v2)
+				  RSEQ_INJECT_ASM(5)
+				  RSEQ_ASM_OP_FINAL_STORE_RELEASE(newv, v, 3)
+				  RSEQ_INJECT_ASM(6)
+				  RSEQ_ASM_DEFINE_ABORT(4, abort)
+				  : /* gcc asm goto does not allow outputs */
+				  : [cpu_id]		"r" (cpu),
+				    [current_cpu_id]	"m" (__rseq_abi.cpu_id),
+				    [rseq_cs]		"m" (__rseq_abi.rseq_cs),
+				    [expect]		"r" (expect),
+				    [v]			"m" (*v),
+				    [newv]		"r" (newv),
+				    [v2]			"m" (*v2),
+				    [newv2]		"r" (newv2)
+				    RSEQ_INJECT_INPUT
+				  : "memory", RSEQ_ASM_TMP_REG_1
+				    RSEQ_INJECT_CLOBBER
+				  : abort, cmpfail
+#ifdef RSEQ_COMPARE_TWICE
+				    , error1, error2
+#endif
+	);
+
+	return 0;
+abort:
+	RSEQ_INJECT_FAILED
+	return -1;
+cmpfail:
+	return 1;
+#ifdef RSEQ_COMPARE_TWICE
+error1:
+	rseq_bug("cpu_id comparison failed");
+error2:
+	rseq_bug("expected value comparison failed");
+#endif
+}
+
+static inline __always_inline
+int rseq_cmpeqv_cmpeqv_storev(intptr_t *v, intptr_t expect,
+			      intptr_t *v2, intptr_t expect2,
+			      intptr_t newv, int cpu)
+{
+	RSEQ_INJECT_C(9)
+
+	__asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
+				  RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[cmpfail]")
+#ifdef RSEQ_COMPARE_TWICE
+				  RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error1]")
+				  RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error2]")
+				  RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error3]")
+#endif
+				  RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
+				  RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
+				  RSEQ_INJECT_ASM(3)
+				  RSEQ_ASM_OP_CMPEQ(v, expect, "%l[cmpfail]")
+				  RSEQ_INJECT_ASM(4)
+				  RSEQ_ASM_OP_CMPEQ(v2, expect2, "%l[cmpfail]")
+				  RSEQ_INJECT_ASM(5)
+#ifdef RSEQ_COMPARE_TWICE
+				  RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
+				  RSEQ_ASM_OP_CMPEQ(v, expect, "%l[error2]")
+				  RSEQ_ASM_OP_CMPEQ(v2, expect2, "%l[error3]")
+#endif
+				  RSEQ_ASM_OP_FINAL_STORE(newv, v, 3)
+				  RSEQ_INJECT_ASM(6)
+				  RSEQ_ASM_DEFINE_ABORT(4, abort)
+				  : /* gcc asm goto does not allow outputs */
+				  : [cpu_id]		"r" (cpu),
+				    [current_cpu_id]	"m" (__rseq_abi.cpu_id),
+				    [rseq_cs]		"m" (__rseq_abi.rseq_cs),
+				    [v]			"m" (*v),
+				    [expect]		"r" (expect),
+				    [v2]			"m" (*v2),
+				    [expect2]		"r" (expect2),
+				    [newv]		"r" (newv)
+				    RSEQ_INJECT_INPUT
+				  : "memory", RSEQ_ASM_TMP_REG_1
+				    RSEQ_INJECT_CLOBBER
+				  : abort, cmpfail
+#ifdef RSEQ_COMPARE_TWICE
+				    , error1, error2, error3
+#endif
+	);
+
+	return 0;
+abort:
+	RSEQ_INJECT_FAILED
+	return -1;
+cmpfail:
+	return 1;
+#ifdef RSEQ_COMPARE_TWICE
+error1:
+	rseq_bug("cpu_id comparison failed");
+error2:
+	rseq_bug("expected value comparison failed");
+error3:
+	rseq_bug("2nd expected value comparison failed");
+#endif
+}
+
+static inline __always_inline
+int rseq_cmpeqv_trymemcpy_storev(intptr_t *v, intptr_t expect,
+				 void *dst, void *src, size_t len,
+				 intptr_t newv, int cpu)
+{
+	RSEQ_INJECT_C(9)
+	__asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
+				  RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[cmpfail]")
+#ifdef RSEQ_COMPARE_TWICE
+				  RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error1]")
+				  RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error2]")
+#endif
+				  RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
+				  RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
+				  RSEQ_INJECT_ASM(3)
+				  RSEQ_ASM_OP_CMPEQ(v, expect, "%l[cmpfail]")
+				  RSEQ_INJECT_ASM(4)
+#ifdef RSEQ_COMPARE_TWICE
+				  RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
+				  RSEQ_ASM_OP_CMPEQ(v, expect, "%l[error2]")
+#endif
+				  RSEQ_ASM_OP_R_BAD_MEMCPY(dst, src, len)
+				  RSEQ_INJECT_ASM(5)
+				  RSEQ_ASM_OP_FINAL_STORE(newv, v, 3)
+				  RSEQ_INJECT_ASM(6)
+				  RSEQ_ASM_DEFINE_ABORT(4, abort)
+				  : /* gcc asm goto does not allow outputs */
+				  : [cpu_id]		"r" (cpu),
+				    [current_cpu_id]	"m" (__rseq_abi.cpu_id),
+				    [rseq_cs]		"m" (__rseq_abi.rseq_cs),
+				    [expect]		"r" (expect),
+				    [v]			"m" (*v),
+				    [newv]		"r" (newv),
+				    [dst]			"r" (dst),
+				    [src]			"r" (src),
+				    [len]			"r" (len)
+				    RSEQ_INJECT_INPUT
+				  : "memory", RSEQ_ASM_TMP_REG_1, RSEQ_ASM_TMP_REG_2,
+				    RSEQ_ASM_TMP_REG_3, RSEQ_ASM_TMP_REG_4
+				    RSEQ_INJECT_CLOBBER
+				  : abort, cmpfail
+#ifdef RSEQ_COMPARE_TWICE
+				    , error1, error2
+#endif
+	);
+
+	return 0;
+abort:
+	RSEQ_INJECT_FAILED
+	return -1;
+cmpfail:
+	return 1;
+#ifdef RSEQ_COMPARE_TWICE
+error1:
+	rseq_bug("cpu_id comparison failed");
+error2:
+	rseq_bug("expected value comparison failed");
+#endif
+}
+
+static inline __always_inline
+int rseq_cmpeqv_trymemcpy_storev_release(intptr_t *v, intptr_t expect,
+					 void *dst, void *src, size_t len,
+					 intptr_t newv, int cpu)
+{
+	RSEQ_INJECT_C(9)
+
+	__asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
+				  RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[cmpfail]")
+#ifdef RSEQ_COMPARE_TWICE
+				  RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error1]")
+				  RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error2]")
+#endif
+				  RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
+				  RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
+				  RSEQ_INJECT_ASM(3)
+				  RSEQ_ASM_OP_CMPEQ(v, expect, "%l[cmpfail]")
+				  RSEQ_INJECT_ASM(4)
+#ifdef RSEQ_COMPARE_TWICE
+				  RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
+				  RSEQ_ASM_OP_CMPEQ(v, expect, "%l[error2]")
+#endif
+				  RSEQ_ASM_OP_R_BAD_MEMCPY(dst, src, len)
+				  RSEQ_INJECT_ASM(5)
+				  RSEQ_ASM_OP_FINAL_STORE_RELEASE(newv, v, 3)
+				  RSEQ_INJECT_ASM(6)
+				  RSEQ_ASM_DEFINE_ABORT(4, abort)
+				  : /* gcc asm goto does not allow outputs */
+				  : [cpu_id]		"r" (cpu),
+				    [current_cpu_id]	"m" (__rseq_abi.cpu_id),
+				    [rseq_cs]		"m" (__rseq_abi.rseq_cs),
+				    [expect]		"r" (expect),
+				    [v]			"m" (*v),
+				    [newv]		"r" (newv),
+				    [dst]			"r" (dst),
+				    [src]			"r" (src),
+				    [len]			"r" (len)
+				    RSEQ_INJECT_INPUT
+				  : "memory", RSEQ_ASM_TMP_REG_1, RSEQ_ASM_TMP_REG_2,
+				    RSEQ_ASM_TMP_REG_3, RSEQ_ASM_TMP_REG_4
+				    RSEQ_INJECT_CLOBBER
+				  : abort, cmpfail
+#ifdef RSEQ_COMPARE_TWICE
+				    , error1, error2
+#endif
+	);
+
+	return 0;
+abort:
+	RSEQ_INJECT_FAILED
+	return -1;
+cmpfail:
+	return 1;
+#ifdef RSEQ_COMPARE_TWICE
+error1:
+	rseq_bug("cpu_id comparison failed");
+error2:
+	rseq_bug("expected value comparison failed");
+#endif
+}
+
+#define RSEQ_ARCH_HAS_OFFSET_DEREF_ADDV
+
+/*
+ *   pval = *(ptr+off)
+ *  *pval += inc;
+ */
+static inline __always_inline
+int rseq_offset_deref_addv(intptr_t *ptr, off_t off, intptr_t inc, int cpu)
+{
+	RSEQ_INJECT_C(9)
+
+	__asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
+#ifdef RSEQ_COMPARE_TWICE
+				  RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error1]")
+#endif
+				  RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
+				  RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
+				  RSEQ_INJECT_ASM(3)
+#ifdef RSEQ_COMPARE_TWICE
+				  RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
+#endif
+				  RSEQ_ASM_OP_R_DEREF_ADDV(ptr, off, 3)
+				  RSEQ_INJECT_ASM(4)
+				  RSEQ_ASM_DEFINE_ABORT(4, abort)
+				  : /* gcc asm goto does not allow outputs */
+				  : [cpu_id]		"r" (cpu),
+				    [current_cpu_id]      "m" (__rseq_abi.cpu_id),
+				    [rseq_cs]		"m" (__rseq_abi.rseq_cs),
+				    [ptr]			"r" (ptr),
+				    [off]			"er" (off),
+				    [inc]			"er" (inc)
+				    RSEQ_INJECT_INPUT
+				  : "memory", RSEQ_ASM_TMP_REG_1
+				    RSEQ_INJECT_CLOBBER
+				  : abort
+#ifdef RSEQ_COMPARE_TWICE
+				    , error1
+#endif
+	);
+	return 0;
+abort:
+	RSEQ_INJECT_FAILED
+	return -1;
+#ifdef RSEQ_COMPARE_TWICE
+error1:
+	rseq_bug("cpu_id comparison failed");
+#endif
+}
+
+#endif /* !RSEQ_SKIP_FASTPATH */
diff --git a/tools/testing/selftests/rseq/rseq.h b/tools/testing/selftests/rseq/rseq.h
index 3f63eb362b92..72efb6d3d84e 100644
--- a/tools/testing/selftests/rseq/rseq.h
+++ b/tools/testing/selftests/rseq/rseq.h
@@ -79,6 +79,8 @@ extern int __rseq_handled;
 #include <rseq-mips.h>
 #elif defined(__s390__)
 #include <rseq-s390.h>
+#elif defined(__riscv)
+#include <rseq-riscv.h>
 #else
 #error unsupported target
 #endif
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
