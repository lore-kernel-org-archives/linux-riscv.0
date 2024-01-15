Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A33C3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 12:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJBbJxW4an8vP34Sjk40GtIxWiKsUAzctNqaB/6Hdro=; b=jpAijAMdq+b5GN
	sWmy8S1mkfyDNN4Bh3xbfpsUmUZGJmdoQmNPABs4+9iFbO3TE7UmsggV3WBG1ftJW4GI6pJ9q0wen
	ODAZoWnuk4FN0FndVAE04+mw6hhZCyflgJD7w2zQLKN23dQiUImpUizq+YIJTs2Mgz4rxqvFTO9aq
	oON1JbMiDQu5VFUfOentsIvobu7GX23bi7J+Vjja+0+JSAI09ot/gFDecTrkgjdmrUb2bwvz2TtSa
	Q1Vf1waEFbQZFmm92NqXaA8qaYD+t+G4drfyGjUM5i5ZoVhU9SHPCJM4WgUheYvOdwVin9kk21Gt1
	4g2qjMRfQs6zD2807K/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPMV1-008xa6-2x;
	Mon, 15 Jan 2024 12:55:31 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPMUy-008xYN-1o
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 12:55:30 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4TDBtM4kFTzsR5n;
	Mon, 15 Jan 2024 20:54:35 +0800 (CST)
Received: from kwepemd100009.china.huawei.com (unknown [7.221.188.135])
	by mail.maildlp.com (Postfix) with ESMTPS id D2B421400CD;
	Mon, 15 Jan 2024 20:55:11 +0800 (CST)
Received: from ultra.huawei.com (10.90.53.71) by
 kwepemd100009.china.huawei.com (7.221.188.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.28; Mon, 15 Jan 2024 20:53:59 +0800
From: Pu Lehui <pulehui@huawei.com>
To: <bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<netdev@vger.kernel.org>
CC: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Alexei Starovoitov
	<ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
	<andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
	<song@kernel.org>, Yonghong Song <yhs@fb.com>, John Fastabend
	<john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav Fomichev
	<sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Luke
 Nelson <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>, Pu Lehui
	<pulehui@huaweicloud.com>
Subject: [PATCH bpf-next v3 6/6] riscv, bpf: Optimize bswap insns with Zbb support
Date: Mon, 15 Jan 2024 12:54:27 +0000
Message-ID: <20240115125427.2914015-7-pulehui@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240115125427.2914015-1-pulehui@huawei.com>
References: <20240115125427.2914015-1-pulehui@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.71]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd100009.china.huawei.com (7.221.188.135)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_045528_939361_50ACBE9C 
X-CRM114-Status: UNSURE (   9.40  )
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

Optimize bswap instructions by rev8 Zbb instruction conbined with srli
instruction. And Optimize 16-bit zero-extension with Zbb support.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 arch/riscv/net/bpf_jit.h        | 69 +++++++++++++++++++++++++++++++++
 arch/riscv/net/bpf_jit_comp64.c | 50 +-----------------------
 2 files changed, 71 insertions(+), 48 deletions(-)

diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
index b00c5c0591d2..8b35f12a4452 100644
--- a/arch/riscv/net/bpf_jit.h
+++ b/arch/riscv/net/bpf_jit.h
@@ -1146,12 +1146,81 @@ static inline void emit_sextw(u8 rd, u8 rs, struct rv_jit_context *ctx)
 	emit_addiw(rd, rs, 0, ctx);
 }
 
+static inline void emit_zexth(u8 rd, u8 rs, struct rv_jit_context *ctx)
+{
+	if (rvzbb_enabled()) {
+		emit(rvzbb_zexth(rd, rs), ctx);
+		return;
+	}
+
+	emit_slli(rd, rs, 48, ctx);
+	emit_srli(rd, rd, 48, ctx);
+}
+
 static inline void emit_zextw(u8 rd, u8 rs, struct rv_jit_context *ctx)
 {
 	emit_slli(rd, rs, 32, ctx);
 	emit_srli(rd, rd, 32, ctx);
 }
 
+static inline void emit_bswap(u8 rd, s32 imm, struct rv_jit_context *ctx)
+{
+	if (rvzbb_enabled()) {
+		int bits = 64 - imm;
+
+		emit(rvzbb_rev8(rd, rd), ctx);
+		if (bits)
+			emit_srli(rd, rd, bits, ctx);
+		return;
+	}
+
+	emit_li(RV_REG_T2, 0, ctx);
+
+	emit_andi(RV_REG_T1, rd, 0xff, ctx);
+	emit_add(RV_REG_T2, RV_REG_T2, RV_REG_T1, ctx);
+	emit_slli(RV_REG_T2, RV_REG_T2, 8, ctx);
+	emit_srli(rd, rd, 8, ctx);
+	if (imm == 16)
+		goto out_be;
+
+	emit_andi(RV_REG_T1, rd, 0xff, ctx);
+	emit_add(RV_REG_T2, RV_REG_T2, RV_REG_T1, ctx);
+	emit_slli(RV_REG_T2, RV_REG_T2, 8, ctx);
+	emit_srli(rd, rd, 8, ctx);
+
+	emit_andi(RV_REG_T1, rd, 0xff, ctx);
+	emit_add(RV_REG_T2, RV_REG_T2, RV_REG_T1, ctx);
+	emit_slli(RV_REG_T2, RV_REG_T2, 8, ctx);
+	emit_srli(rd, rd, 8, ctx);
+	if (imm == 32)
+		goto out_be;
+
+	emit_andi(RV_REG_T1, rd, 0xff, ctx);
+	emit_add(RV_REG_T2, RV_REG_T2, RV_REG_T1, ctx);
+	emit_slli(RV_REG_T2, RV_REG_T2, 8, ctx);
+	emit_srli(rd, rd, 8, ctx);
+
+	emit_andi(RV_REG_T1, rd, 0xff, ctx);
+	emit_add(RV_REG_T2, RV_REG_T2, RV_REG_T1, ctx);
+	emit_slli(RV_REG_T2, RV_REG_T2, 8, ctx);
+	emit_srli(rd, rd, 8, ctx);
+
+	emit_andi(RV_REG_T1, rd, 0xff, ctx);
+	emit_add(RV_REG_T2, RV_REG_T2, RV_REG_T1, ctx);
+	emit_slli(RV_REG_T2, RV_REG_T2, 8, ctx);
+	emit_srli(rd, rd, 8, ctx);
+
+	emit_andi(RV_REG_T1, rd, 0xff, ctx);
+	emit_add(RV_REG_T2, RV_REG_T2, RV_REG_T1, ctx);
+	emit_slli(RV_REG_T2, RV_REG_T2, 8, ctx);
+	emit_srli(rd, rd, 8, ctx);
+out_be:
+	emit_andi(RV_REG_T1, rd, 0xff, ctx);
+	emit_add(RV_REG_T2, RV_REG_T2, RV_REG_T1, ctx);
+
+	emit_mv(rd, RV_REG_T2, ctx);
+}
+
 #endif /* __riscv_xlen == 64 */
 
 void bpf_jit_build_prologue(struct rv_jit_context *ctx);
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 18bbf8122eb3..e86e83649820 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -1176,8 +1176,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 	case BPF_ALU | BPF_END | BPF_FROM_LE:
 		switch (imm) {
 		case 16:
-			emit_slli(rd, rd, 48, ctx);
-			emit_srli(rd, rd, 48, ctx);
+			emit_zexth(rd, rd, ctx);
 			break;
 		case 32:
 			if (!aux->verifier_zext)
@@ -1188,54 +1187,9 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 			break;
 		}
 		break;
-
 	case BPF_ALU | BPF_END | BPF_FROM_BE:
 	case BPF_ALU64 | BPF_END | BPF_FROM_LE:
-		emit_li(RV_REG_T2, 0, ctx);
-
-		emit_andi(RV_REG_T1, rd, 0xff, ctx);
-		emit_add(RV_REG_T2, RV_REG_T2, RV_REG_T1, ctx);
-		emit_slli(RV_REG_T2, RV_REG_T2, 8, ctx);
-		emit_srli(rd, rd, 8, ctx);
-		if (imm == 16)
-			goto out_be;
-
-		emit_andi(RV_REG_T1, rd, 0xff, ctx);
-		emit_add(RV_REG_T2, RV_REG_T2, RV_REG_T1, ctx);
-		emit_slli(RV_REG_T2, RV_REG_T2, 8, ctx);
-		emit_srli(rd, rd, 8, ctx);
-
-		emit_andi(RV_REG_T1, rd, 0xff, ctx);
-		emit_add(RV_REG_T2, RV_REG_T2, RV_REG_T1, ctx);
-		emit_slli(RV_REG_T2, RV_REG_T2, 8, ctx);
-		emit_srli(rd, rd, 8, ctx);
-		if (imm == 32)
-			goto out_be;
-
-		emit_andi(RV_REG_T1, rd, 0xff, ctx);
-		emit_add(RV_REG_T2, RV_REG_T2, RV_REG_T1, ctx);
-		emit_slli(RV_REG_T2, RV_REG_T2, 8, ctx);
-		emit_srli(rd, rd, 8, ctx);
-
-		emit_andi(RV_REG_T1, rd, 0xff, ctx);
-		emit_add(RV_REG_T2, RV_REG_T2, RV_REG_T1, ctx);
-		emit_slli(RV_REG_T2, RV_REG_T2, 8, ctx);
-		emit_srli(rd, rd, 8, ctx);
-
-		emit_andi(RV_REG_T1, rd, 0xff, ctx);
-		emit_add(RV_REG_T2, RV_REG_T2, RV_REG_T1, ctx);
-		emit_slli(RV_REG_T2, RV_REG_T2, 8, ctx);
-		emit_srli(rd, rd, 8, ctx);
-
-		emit_andi(RV_REG_T1, rd, 0xff, ctx);
-		emit_add(RV_REG_T2, RV_REG_T2, RV_REG_T1, ctx);
-		emit_slli(RV_REG_T2, RV_REG_T2, 8, ctx);
-		emit_srli(rd, rd, 8, ctx);
-out_be:
-		emit_andi(RV_REG_T1, rd, 0xff, ctx);
-		emit_add(RV_REG_T2, RV_REG_T2, RV_REG_T1, ctx);
-
-		emit_mv(rd, RV_REG_T2, ctx);
+		emit_bswap(rd, imm, ctx);
 		break;
 
 	/* dst = imm */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
