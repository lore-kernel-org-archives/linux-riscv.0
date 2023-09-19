Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A9DCD37B4
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 03:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JU52eIWXsa7yPOVSF9nXr1W/nLtw+zY8vBSlBmZHVFY=; b=TRgmyGQBZF3IkO
	AIWCLVoKfnXPPXOQbrQD+eXTrZCSS35Zhp7qeVKJ8CQNY8TgYp8JHIH8SkhRRNWuVnPc6Nkjp21zv
	DjTTiHQrWuw/gCPXv9Ff5Pi0wsKokLd7FHp83OKDBN0Utgw6sHgRSEu3SjG87XRP6inzSO0qM3Y8f
	Jfxu5tL5GdTDNA65Yathts6PAwW8x+fbzJ4dIpPRWwzBa7kQ9lx07ZaUhR+HxdHVifiQTGR9m5iVn
	jRLZ5vAwtxY09vKo9pHWWM1DnV4yDPRz/wMzoeO7D3sX2TTa/UAA5Euyn8VACUNIDK3nq/Dc2eAeo
	p3USfycbr3T1MAxytiXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRsg-00Gs9g-21;
	Tue, 19 Sep 2023 03:58:34 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRsd-00Gs6S-15
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 03:58:33 +0000
Received: from mail02.huawei.com (unknown [172.30.67.143])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4RqSZ831nbz4f3l6x
	for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 11:58:24 +0800 (CST)
Received: from localhost.localdomain (unknown [10.67.175.61])
	by APP4 (Coremail) with SMTP id gCh0CgBn_t1hHAll2JRXAw--.51929S5;
	Tue, 19 Sep 2023 11:58:28 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
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
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [PATCH bpf-next v2 3/6] riscv, bpf: Simplify sext and zext logics in branch instructions
Date: Tue, 19 Sep 2023 11:58:36 +0800
Message-Id: <20230919035839.3297328-4-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230919035839.3297328-1-pulehui@huaweicloud.com>
References: <20230919035839.3297328-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgBn_t1hHAll2JRXAw--.51929S5
X-Coremail-Antispam: 1UD129KBjvJXoWxZryUArW7Jr4fCry3uF4rXwb_yoWrWr4kpF
	1xKws3CFZ2qF4rtFykJFnFqw15Cr48tF9rtrn3G398Jay0vrykW3Wjkw4Fyry5G34fuw43
	XF4qyr1xW3Wj9FDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr
	1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUCXdbU
	UUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_205831_803797_C8AEA9A6 
X-CRM114-Status: GOOD (  12.39  )
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

There are many extension helpers in the current branch instructions, and
the implementation is a bit complicated. We simplify this logic through
two simple extension helpers with alternate register.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 arch/riscv/net/bpf_jit_comp64.c | 82 +++++++++++++--------------------
 1 file changed, 31 insertions(+), 51 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 4a649e195..0c6ffe11a 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -141,6 +141,19 @@ static bool in_auipc_jalr_range(s64 val)
 		val < ((1L << 31) - (1L << 11));
 }
 
+/* Modify rd pointer to alternate reg to avoid corrupting original reg */
+static void emit_sextw_alt(u8 *rd, u8 ra, struct rv_jit_context *ctx)
+{
+	emit_sextw(ra, *rd, ctx);
+	*rd = ra;
+}
+
+static void emit_zextw_alt(u8 *rd, u8 ra, struct rv_jit_context *ctx)
+{
+	emit_zextw(ra, *rd, ctx);
+	*rd = ra;
+}
+
 /* Emit fixed-length instructions for address */
 static int emit_addr(u8 rd, u64 addr, bool extra_pass, struct rv_jit_context *ctx)
 {
@@ -395,38 +408,6 @@ static void init_regs(u8 *rd, u8 *rs, const struct bpf_insn *insn,
 		*rs = bpf_to_rv_reg(insn->src_reg, ctx);
 }
 
-static void emit_zext_32_rd_rs(u8 *rd, u8 *rs, struct rv_jit_context *ctx)
-{
-	emit_mv(RV_REG_T2, *rd, ctx);
-	emit_zextw(RV_REG_T2, RV_REG_T2, ctx);
-	emit_mv(RV_REG_T1, *rs, ctx);
-	emit_zextw(RV_REG_T1, RV_REG_T1, ctx);
-	*rd = RV_REG_T2;
-	*rs = RV_REG_T1;
-}
-
-static void emit_sext_32_rd_rs(u8 *rd, u8 *rs, struct rv_jit_context *ctx)
-{
-	emit_sextw(RV_REG_T2, *rd, ctx);
-	emit_sextw(RV_REG_T1, *rs, ctx);
-	*rd = RV_REG_T2;
-	*rs = RV_REG_T1;
-}
-
-static void emit_zext_32_rd_t1(u8 *rd, struct rv_jit_context *ctx)
-{
-	emit_mv(RV_REG_T2, *rd, ctx);
-	emit_zextw(RV_REG_T2, RV_REG_T2, ctx);
-	emit_zextw(RV_REG_T1, RV_REG_T2, ctx);
-	*rd = RV_REG_T2;
-}
-
-static void emit_sext_32_rd(u8 *rd, struct rv_jit_context *ctx)
-{
-	emit_sextw(RV_REG_T2, *rd, ctx);
-	*rd = RV_REG_T2;
-}
-
 static int emit_jump_and_link(u8 rd, s64 rvoff, bool fixed_addr,
 			      struct rv_jit_context *ctx)
 {
@@ -1372,22 +1353,22 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 		rvoff = rv_offset(i, off, ctx);
 		if (!is64) {
 			s = ctx->ninsns;
-			if (is_signed_bpf_cond(BPF_OP(code)))
-				emit_sext_32_rd_rs(&rd, &rs, ctx);
-			else
-				emit_zext_32_rd_rs(&rd, &rs, ctx);
+			if (is_signed_bpf_cond(BPF_OP(code))) {
+				emit_sextw_alt(&rs, RV_REG_T1, ctx);
+				emit_sextw_alt(&rd, RV_REG_T2, ctx);
+			} else {
+				emit_zextw_alt(&rs, RV_REG_T1, ctx);
+				emit_zextw_alt(&rd, RV_REG_T2, ctx);
+			}
 			e = ctx->ninsns;
-
 			/* Adjust for extra insns */
 			rvoff -= ninsns_rvoff(e - s);
 		}
-
 		if (BPF_OP(code) == BPF_JSET) {
 			/* Adjust for and */
 			rvoff -= 4;
 			emit_and(RV_REG_T1, rd, rs, ctx);
-			emit_branch(BPF_JNE, RV_REG_T1, RV_REG_ZERO, rvoff,
-				    ctx);
+			emit_branch(BPF_JNE, RV_REG_T1, RV_REG_ZERO, rvoff, ctx);
 		} else {
 			emit_branch(BPF_OP(code), rd, rs, rvoff, ctx);
 		}
@@ -1416,21 +1397,20 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 	case BPF_JMP32 | BPF_JSLE | BPF_K:
 		rvoff = rv_offset(i, off, ctx);
 		s = ctx->ninsns;
-		if (imm) {
+		if (imm)
 			emit_imm(RV_REG_T1, imm, ctx);
-			rs = RV_REG_T1;
-		} else {
-			/* If imm is 0, simply use zero register. */
-			rs = RV_REG_ZERO;
-		}
+		rs = imm ? RV_REG_T1 : RV_REG_ZERO;
 		if (!is64) {
-			if (is_signed_bpf_cond(BPF_OP(code)))
-				emit_sext_32_rd(&rd, ctx);
-			else
-				emit_zext_32_rd_t1(&rd, ctx);
+			if (is_signed_bpf_cond(BPF_OP(code))) {
+				emit_sextw_alt(&rd, RV_REG_T2, ctx);
+				/* rs has been sign extended */
+			} else {
+				emit_zextw_alt(&rd, RV_REG_T2, ctx);
+				if (imm)
+					emit_zextw(rs, rs, ctx);
+			}
 		}
 		e = ctx->ninsns;
-
 		/* Adjust for extra insns */
 		rvoff -= ninsns_rvoff(e - s);
 		emit_branch(BPF_OP(code), rd, rs, rvoff, ctx);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
