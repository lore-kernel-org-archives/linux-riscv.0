Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD10FC47DA6
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 13:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wrnwVghlSOJeU8RMVpoYw5RYqYSIwgvbspYHNypzDlg=; b=UVFgiu4Fv3QPwd
	d7mCMcdU18awoRrwxVb7c+PDI9lRIUG8IAvppD2v4UohzRuMf8hMjuH/ys04rvpDM1qBTg7ZZDn6b
	Xfl8IAycuJAafwrRN+cXOBUGpv4y1cUwMJ9Jz3+Ci4pTkSg9tOh4v+OwIq11mwTCbZRZCfiCAbFSp
	lS+PEvC1jUC3akJifQsBnwIhN7dqM23+J+czIPF/bRsldRfO7WkA7U5o35WDfPmPEjpyh3dw7z0PX
	Y+/grVwlg2zzU9DmrhLvc3c4YftYib9QnP6bKHap0N7Xoddm8eB7wRYSSKSvLWCrcjG0RwbX5tGgW
	GHPr6HpNofjXnGyqnoFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPMlK-0091J9-1J;
	Mon, 15 Jan 2024 13:12:22 +0000
Received: from [45.249.212.56] (helo=dggsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPMlC-0091E1-2U
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 13:12:18 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4TDCGX5Z5hz4f3l2j
	for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 21:12:04 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 7637B1A016E
	for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 21:12:08 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with SMTP id gCh0CgBnu20iL6VlSeWtAw--.15591S8;
	Mon, 15 Jan 2024 21:12:08 +0800 (CST)
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
Subject: [PATCH RESEND bpf-next v3 6/6] riscv, bpf: Optimize bswap insns with Zbb support
Date: Mon, 15 Jan 2024 13:12:35 +0000
Message-Id: <20240115131235.2914289-7-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240115131235.2914289-1-pulehui@huaweicloud.com>
References: <20240115131235.2914289-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgBnu20iL6VlSeWtAw--.15591S8
X-Coremail-Antispam: 1UD129KBjvJXoWxKFyrtFWkJF4UtFy3GF4xCrg_yoW7Gw4rpa
	43Kr4ru3y8trsIy34kG3WDWw13GF1jyFnFvF1fJrZ5Xw4jv397G3WUtr4Fyry5G34fuay5
	WF1DKr9rK3WUKFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUl
	2NtUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_051215_144077_1B712C3E 
X-CRM114-Status: UNSURE (   8.96  )
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
