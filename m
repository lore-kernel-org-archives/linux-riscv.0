Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E1DC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Dec 2022 13:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gnt9aEL9f2cojXzjAr8z7DIjXS6sBl8EWGB76v+w84c=; b=wHdGsfi39PdnWt
	3GzS/JSPFLcocaDy+z/kpQfXidWp6L6YyPyShckYwRNUC0VmFdw4JmuSy9s3SKeGSiDpuM5X4V+0a
	q29fbMVwjuN8u4W2gDmiP4f+GMI7bDSN/zOLjNsZhWjE6BiMhp6jjg5zuvcFjmASYhGsFUVDzjoPO
	Ohmm4ILaF9L08peZArFKd+xNUmTuYsY3xEDdB7+hV0ISu/W8oDEbtRco5Qdk0SHvCcwLHbHrabOVK
	luf53qVUBNHQr6W1VHmabezEwBf0US3Z4Kn2fF0ziidRkwyAwxAE6XGDSPxmW6onkLZfzSCafDdX5
	hOpubiEv43Cn/Z6U5hRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7GKG-00E68G-RK; Mon, 19 Dec 2022 13:37:04 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7GJz-00E5Qt-3l
	for linux-riscv@lists.infradead.org; Mon, 19 Dec 2022 13:36:51 +0000
Received: from mail02.huawei.com (unknown [172.30.67.169])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4NbLMc33l1z4f3p0x
	for <linux-riscv@lists.infradead.org>; Mon, 19 Dec 2022 21:36:28 +0800 (CST)
Received: from localhost.localdomain (unknown [10.67.175.61])
	by APP2 (Coremail) with SMTP id Syh0CgAH++jcaKBjpueTAA--.19298S4;
	Mon, 19 Dec 2022 21:36:31 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [RFC PATCH bpf-next 2/4] riscv, bpf: Factor out emit_call for kernel and bpf context
Date: Mon, 19 Dec 2022 21:37:34 +0800
Message-Id: <20221219133736.1387008-3-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221219133736.1387008-1-pulehui@huaweicloud.com>
References: <20221219133736.1387008-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: Syh0CgAH++jcaKBjpueTAA--.19298S4
X-Coremail-Antispam: 1UD129KBjvJXoWxurWfuw13GrWUJr4rXw47Jwb_yoW5Zr4xpF
	W5CFn3C3yvqFySgFyDGFs5Zw1akr4v9ry3tF93W39YkFsFqrsxKF15Ka1Yqa4Yyry8Gr4r
	JFsFkFnxu3WUArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
	CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOJPEUUUU
	U
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_053648_008392_6A2A1AB7 
X-CRM114-Status: GOOD (  11.94  )
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

The current emit_call function is not suitable for kernel
function call as it store return value to bpf R0 register.
We can separate it out for common use. Meanwhile, simplify
judgment logic, that is, fixed function address can use jal
or auipc+jalr, while the unfixed can use only auipc+jalr.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 arch/riscv/net/bpf_jit_comp64.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 5b568ba6dcfe..bf4721a99a09 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -428,12 +428,12 @@ static void emit_sext_32_rd(u8 *rd, struct rv_jit_context *ctx)
 	*rd = RV_REG_T2;
 }
 
-static int emit_jump_and_link(u8 rd, s64 rvoff, bool force_jalr,
+static int emit_jump_and_link(u8 rd, s64 rvoff, bool fixed_addr,
 			      struct rv_jit_context *ctx)
 {
 	s64 upper, lower;
 
-	if (rvoff && is_21b_int(rvoff) && !force_jalr) {
+	if (rvoff && fixed_addr && is_21b_int(rvoff)) {
 		emit(rv_jal(rd, rvoff >> 1), ctx);
 		return 0;
 	} else if (in_auipc_jalr_range(rvoff)) {
@@ -454,24 +454,17 @@ static bool is_signed_bpf_cond(u8 cond)
 		cond == BPF_JSGE || cond == BPF_JSLE;
 }
 
-static int emit_call(bool fixed, u64 addr, struct rv_jit_context *ctx)
+static int emit_call(u64 addr, bool fixed_addr, struct rv_jit_context *ctx)
 {
 	s64 off = 0;
 	u64 ip;
-	u8 rd;
-	int ret;
 
 	if (addr && ctx->insns) {
 		ip = (u64)(long)(ctx->insns + ctx->ninsns);
 		off = addr - ip;
 	}
 
-	ret = emit_jump_and_link(RV_REG_RA, off, !fixed, ctx);
-	if (ret)
-		return ret;
-	rd = bpf_to_rv_reg(BPF_REG_0, ctx);
-	emit_mv(rd, RV_REG_A0, ctx);
-	return 0;
+	return emit_jump_and_link(RV_REG_RA, off, fixed_addr, ctx);
 }
 
 static void emit_atomic(u8 rd, u8 rs, s16 off, s32 imm, bool is64,
@@ -913,7 +906,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 	/* JUMP off */
 	case BPF_JMP | BPF_JA:
 		rvoff = rv_offset(i, off, ctx);
-		ret = emit_jump_and_link(RV_REG_ZERO, rvoff, false, ctx);
+		ret = emit_jump_and_link(RV_REG_ZERO, rvoff, true, ctx);
 		if (ret)
 			return ret;
 		break;
@@ -1032,17 +1025,20 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 	/* function call */
 	case BPF_JMP | BPF_CALL:
 	{
-		bool fixed;
+		bool fixed_addr;
 		u64 addr;
 
 		mark_call(ctx);
-		ret = bpf_jit_get_func_addr(ctx->prog, insn, extra_pass, &addr,
-					    &fixed);
+		ret = bpf_jit_get_func_addr(ctx->prog, insn, extra_pass,
+					    &addr, &fixed_addr);
 		if (ret < 0)
 			return ret;
-		ret = emit_call(fixed, addr, ctx);
+
+		ret = emit_call(addr, fixed_addr, ctx);
 		if (ret)
 			return ret;
+
+		emit_mv(bpf_to_rv_reg(BPF_REG_0, ctx), RV_REG_A0, ctx);
 		break;
 	}
 	/* tail call */
@@ -1057,7 +1053,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 			break;
 
 		rvoff = epilogue_offset(ctx);
-		ret = emit_jump_and_link(RV_REG_ZERO, rvoff, false, ctx);
+		ret = emit_jump_and_link(RV_REG_ZERO, rvoff, true, ctx);
 		if (ret)
 			return ret;
 		break;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
