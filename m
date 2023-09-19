Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFD3CD3432
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 03:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sz6uU0AOyPZ/F1lyyRzenr9K2V6WPCbInVRCMas44+c=; b=333xKzBZLl+m0E
	jxK4k/EWIiwBliPDzsb5icxw1Tfdfxm8yo9WitVWCoD99EY6tX9Z1DOXOMKYD9nTVUB2WSijQeCOr
	zRH4lsAEBsM/Uu1xXTOEN98BhGyOVtaZLaqLAhQ0qmS900FSeBWo+ETz07TexxX8h106yq2j+dRir
	hmUj5sMCuejuCRCThCMugPrWGVlkB+bWv3qgkeGVsXKAAErkaZh20NkxiI9w3DTza1MPYHF9/95c1
	9w7++tYTECDt1kKSp2OcZpA6dJWmUz4i4+xS+wU1+nQ+A+0vU4xhCoAhsf79yWQd6HtLqlLMEhbRv
	AKrG3mmjCKTEObpAp3kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRsk-00GsCI-1f;
	Tue, 19 Sep 2023 03:58:38 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRsd-00Gs6Q-2Y
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 03:58:34 +0000
Received: from mail02.huawei.com (unknown [172.30.67.143])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4RqSZ81DxHz4f3l6m
	for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 11:58:24 +0800 (CST)
Received: from localhost.localdomain (unknown [10.67.175.61])
	by APP4 (Coremail) with SMTP id gCh0CgBn_t1hHAll2JRXAw--.51929S3;
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
Subject: [PATCH bpf-next v2 1/6] riscv, bpf: Unify 32-bit sign-extension to emit_sextw
Date: Tue, 19 Sep 2023 11:58:34 +0800
Message-Id: <20230919035839.3297328-2-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230919035839.3297328-1-pulehui@huaweicloud.com>
References: <20230919035839.3297328-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgBn_t1hHAll2JRXAw--.51929S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uryrWw45KFWxKrWUXFWxtFb_yoW8KFy7pa
	1jkrs3CrZ2qF4FqasrJFn7Wr45JF4YvF43KryfW398Jan2qFsrG3WFkw4YyFy5GFyrWayr
	ZFWjkr1fCa4vgrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr
	1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUSYLPU
	UUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_205832_196428_94129FE2 
X-CRM114-Status: GOOD (  10.25  )
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

For code unification, add emit_sextw wrapper to unify all the 32-bit
sign-extension operations.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 arch/riscv/net/bpf_jit.h        |  5 +++++
 arch/riscv/net/bpf_jit_comp64.c | 10 +++++-----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
index d21c6c92a..03a6ecb43 100644
--- a/arch/riscv/net/bpf_jit.h
+++ b/arch/riscv/net/bpf_jit.h
@@ -1084,6 +1084,11 @@ static inline void emit_subw(u8 rd, u8 rs1, u8 rs2, struct rv_jit_context *ctx)
 		emit(rv_subw(rd, rs1, rs2), ctx);
 }
 
+static inline void emit_sextw(u8 rd, u8 rs, struct rv_jit_context *ctx)
+{
+	emit_addiw(rd, rs, 0, ctx);
+}
+
 #endif /* __riscv_xlen == 64 */
 
 void bpf_jit_build_prologue(struct rv_jit_context *ctx);
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 8423f4ddf..8b654c0cf 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -413,8 +413,8 @@ static void emit_zext_32_rd_rs(u8 *rd, u8 *rs, struct rv_jit_context *ctx)
 
 static void emit_sext_32_rd_rs(u8 *rd, u8 *rs, struct rv_jit_context *ctx)
 {
-	emit_addiw(RV_REG_T2, *rd, 0, ctx);
-	emit_addiw(RV_REG_T1, *rs, 0, ctx);
+	emit_sextw(RV_REG_T2, *rd, ctx);
+	emit_sextw(RV_REG_T1, *rs, ctx);
 	*rd = RV_REG_T2;
 	*rs = RV_REG_T1;
 }
@@ -429,7 +429,7 @@ static void emit_zext_32_rd_t1(u8 *rd, struct rv_jit_context *ctx)
 
 static void emit_sext_32_rd(u8 *rd, struct rv_jit_context *ctx)
 {
-	emit_addiw(RV_REG_T2, *rd, 0, ctx);
+	emit_sextw(RV_REG_T2, *rd, ctx);
 	*rd = RV_REG_T2;
 }
 
@@ -1057,7 +1057,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 			emit_srai(rd, RV_REG_T1, 64 - insn->off, ctx);
 			break;
 		case 32:
-			emit_addiw(rd, rs, 0, ctx);
+			emit_sextw(rd, rs, ctx);
 			break;
 		}
 		if (!is64 && !aux->verifier_zext)
@@ -1457,7 +1457,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 		 * as t1 is used only in comparison against zero.
 		 */
 		if (!is64 && imm < 0)
-			emit_addiw(RV_REG_T1, RV_REG_T1, 0, ctx);
+			emit_sextw(RV_REG_T1, RV_REG_T1, ctx);
 		e = ctx->ninsns;
 		rvoff -= ninsns_rvoff(e - s);
 		emit_branch(BPF_JNE, RV_REG_T1, RV_REG_ZERO, rvoff, ctx);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
