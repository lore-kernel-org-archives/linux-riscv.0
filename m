Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E426CC87FC4
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jul 2025 09:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uUHhl5ipdySd0P6tod09kWEdVMc3XNJNblg3ZlLkDcQ=; b=EYTPeKKBTPpnuw
	NVv1KoHo0GJBuIwr4/CsLRtbUzV+0iBnuXyu+JHLIAb3En3l7Up5ZZZDpn2Fmz1nml4Ew/S7wiRB0
	HiPvxSmxKIcuBKErwfzANTLqx0OLt0gTzmCccWvVuq2h2/e6dXLdh0M++d5TfeG3DsrbWJYQf+xVD
	hOyPe06VYVQ+6A8I4iWcIvUcRQKSs/KnxV/ACLyanlOvVS+drBvfegjMzQ8YNicntZbCmJcVdh2on
	3IjDjahqYsjrVsoOcHnGweIWMMCaSYfO6krT8MFRG/4F9rw9CU+NhVnaqHyD+GBZdQwxI+/xF4lcI
	0fjIyBhKTsw7YImFkV6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud3eU-0000000E4f0-15NF;
	Sat, 19 Jul 2025 09:14:42 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud3eP-0000000E4Z9-15Ok
	for linux-riscv@lists.infradead.org;
	Sat, 19 Jul 2025 09:14:38 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4bkgw12wZ0zYQvFR
	for <linux-riscv@lists.infradead.org>; Sat, 19 Jul 2025 17:14:25 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 288971A1882
	for <linux-riscv@lists.infradead.org>; Sat, 19 Jul 2025 17:14:24 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with SMTP id gCh0CgCHURLuYXtopCAYAw--.54295S9;
	Sat, 19 Jul 2025 17:14:23 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Pu Lehui <pulehui@huawei.com>
Subject: [PATCH bpf-next 07/10] riscv, bpf: Optimize cmpxchg insn with Zacas support
Date: Sat, 19 Jul 2025 09:17:27 +0000
Message-Id: <20250719091730.2660197-8-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250719091730.2660197-1-pulehui@huaweicloud.com>
References: <20250719091730.2660197-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgCHURLuYXtopCAYAw--.54295S9
X-Coremail-Antispam: 1UD129KBjvJXoWxZr13Zry7Gw1xJFW7JFW8JFb_yoW5AFyrpF
	WSkwn3CayIqw17ZF9xJr4DWw1rJF4093W7KFnxG34rtF42qrZrG3WrKw4SyFy5X34UWryS
	gFWYkry3ua4xXrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPvb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAV
	Cq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0
	rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267
	AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7
	xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Y
	z7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2
	AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6r
	W5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuY
	vjxUI-eODUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_021437_630044_47AB1033 
X-CRM114-Status: UNSURE (   9.99  )
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

From: Pu Lehui <pulehui@huawei.com>

Optimize cmpxchg instruction with amocas.w and amocas.d
Zacas instructions.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 arch/riscv/net/bpf_jit.h        | 27 +++++++++++++++++++++++++++
 arch/riscv/net/bpf_jit_comp64.c | 18 ++----------------
 2 files changed, 29 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
index 2351fba5d3e7..0790f40b7e9d 100644
--- a/arch/riscv/net/bpf_jit.h
+++ b/arch/riscv/net/bpf_jit.h
@@ -1294,6 +1294,33 @@ static inline void emit_bswap(u8 rd, s32 imm, struct rv_jit_context *ctx)
 	emit_mv(rd, RV_REG_T2, ctx);
 }
 
+static inline void emit_cmpxchg(u8 rd, u8 rs, u8 r0, bool is64, struct rv_jit_context *ctx)
+{
+	int jmp_offset;
+
+	if (rv_ext_enabled(ZACAS)) {
+		emit(is64 ? rvzacas_amocas_d(r0, rs, rd, 1, 1) :
+		     rvzacas_amocas_w(r0, rs, rd, 1, 1), ctx);
+		if (!is64)
+			emit_zextw(r0, r0, ctx);
+		return;
+	}
+
+	if (is64)
+		emit_mv(RV_REG_T2, r0, ctx);
+	else
+		emit_addiw(RV_REG_T2, r0, 0, ctx);
+	emit(is64 ? rv_lr_d(r0, 0, rd, 0, 0) :
+	     rv_lr_w(r0, 0, rd, 0, 0), ctx);
+	jmp_offset = ninsns_rvoff(8);
+	emit(rv_bne(RV_REG_T2, r0, jmp_offset >> 1), ctx);
+	emit(is64 ? rv_sc_d(RV_REG_T3, rs, rd, 0, 1) :
+	     rv_sc_w(RV_REG_T3, rs, rd, 0, 1), ctx);
+	jmp_offset = ninsns_rvoff(-6);
+	emit(rv_bne(RV_REG_T3, 0, jmp_offset >> 1), ctx);
+	emit_fence_rw_rw(ctx);
+}
+
 #endif /* __riscv_xlen == 64 */
 
 void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog);
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index a6a9fd9193e5..8e813809d305 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -599,10 +599,9 @@ static int emit_atomic_ld_st(u8 rd, u8 rs, const struct bpf_insn *insn,
 static int emit_atomic_rmw(u8 rd, u8 rs, const struct bpf_insn *insn,
 			   struct rv_jit_context *ctx)
 {
-	u8 r0, code = insn->code;
+	u8 code = insn->code;
 	s16 off = insn->off;
 	s32 imm = insn->imm;
-	int jmp_offset;
 	bool is64;
 
 	if (BPF_SIZE(code) != BPF_W && BPF_SIZE(code) != BPF_DW) {
@@ -673,20 +672,7 @@ static int emit_atomic_rmw(u8 rd, u8 rs, const struct bpf_insn *insn,
 		break;
 	/* r0 = atomic_cmpxchg(dst_reg + off16, r0, src_reg); */
 	case BPF_CMPXCHG:
-		r0 = bpf_to_rv_reg(BPF_REG_0, ctx);
-		if (is64)
-			emit_mv(RV_REG_T2, r0, ctx);
-		else
-			emit_addiw(RV_REG_T2, r0, 0, ctx);
-		emit(is64 ? rv_lr_d(r0, 0, rd, 0, 0) :
-		     rv_lr_w(r0, 0, rd, 0, 0), ctx);
-		jmp_offset = ninsns_rvoff(8);
-		emit(rv_bne(RV_REG_T2, r0, jmp_offset >> 1), ctx);
-		emit(is64 ? rv_sc_d(RV_REG_T3, rs, rd, 0, 1) :
-		     rv_sc_w(RV_REG_T3, rs, rd, 0, 1), ctx);
-		jmp_offset = ninsns_rvoff(-6);
-		emit(rv_bne(RV_REG_T3, 0, jmp_offset >> 1), ctx);
-		emit_fence_rw_rw(ctx);
+		emit_cmpxchg(rd, rs, regmap[BPF_REG_0], is64, ctx);
 		break;
 	default:
 		pr_err_once("bpf-jit: invalid atomic RMW opcode %02x\n", imm);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
