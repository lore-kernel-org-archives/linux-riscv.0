Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3DAC9830B
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 13:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FsKKfJCYqaEqYn2chEaeLnPoru/Za7eUePqRBrhP/Ww=; b=BmYgU8iOp1UKKt
	Tcv5diSdZ2p11B1CHVba/s1sCJm7QXf3OwH9zUWJp+ZqcniuzBmxe8TXmzBBBuTV24b7XY92b4PvO
	QSVLjyH/UmU97x/PF+YhpVObrYdA66E1W+9SpSAXoB20gPDIiw7MJgmZOXv5puxrXBg8ZydMKnZ9u
	a4QipsgxE5xTp3gjGZJOeSKJWSVclDZhq+ImxL+XaF+Fp1WQXwAKbWR2bIyNzspZKMLI8KoBHbS74
	/3HFcFXAF5iyDah0yhWUgkDkiCVtkEhXclhBdaAu8BXDBMlg4Fqlt8IhR7CurfXarXFfNgmTztQCv
	7C2nTON69Qv3QRjI2xbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MjB-00000008LO7-2KI6;
	Wed, 23 Sep 2026 13:09:37 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Mj8-00000008LMx-1VWc
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 13:09:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790168968; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=o6SVUnKde/TR5k8kPB3Bgbc2uo8e/oZYlAsOUPZzYhI=;
	b=sKhOeygBsXf+Zln0mzQe72MUeS4kW5KijfS93dKnGdTxxJIh4cNUuIeezsvLqnmE0aaaOzmBJDdTFP12eBJQewvJKu8q/2HiR5Yuq3wxA2X3Ad0n1QEVR4Q1HTp9QdGUIJzU5IwACvrpgFH5L6t63ouUtV6NQvOr2AQMpU8CBQU=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XBX4ZPB_1790168967;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XBX4ZPB_1790168967 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 23 Sep 2026 21:09:27 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	memxor@gmail.com,
	bjorn@kernel.org,
	puranjay@kernel.org
Cc: ihor.solodrai@linux.dev,
	eddyz87@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	pulehui@huawei.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	shuah@kernel.org,
	guoren@kernel.org,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next 1/2] bpf, riscv: Add support for indirect jumps
Date: Wed, 23 Sep 2026 21:08:55 +0800
Message-ID: <20260923130856.1157-2-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923130856.1157-1-cp0613@linux.alibaba.com>
References: <20260923130856.1157-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_060935_041642_FD13F848 
X-CRM114-Status: GOOD (  14.95  )
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

Implement JIT support for the indirect jump instruction (BPF_JMP |
BPF_JA | BPF_X), a.k.a. gotox, which lets a BPF program jump through a
BPF_MAP_TYPE_INSN_ARRAY jump table.

Emit "jalr zero, rd, 0" and hand the xlated to jitted offsets to
bpf_prog_update_insn_ptrs(), which is what fills in the jump table
entries; without that call the load fails with -EFAULT in
bpf_insn_array_ready(). ctx->offset[] holds the offset of the insn
*following* insn i, as bpf_prog_fill_jited_linfo() expects, so it is
shifted by one and offset[0] comes from the prologue length. build_body()
now records both halves of a multi-insn record, so no slot keeps a
fabricated offset.

Only the RV64 JIT is covered; RV32 keeps failing to load as before.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 arch/riscv/net/bpf_jit_comp64.c |  5 +++++
 arch/riscv/net/bpf_jit_core.c   | 16 ++++++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index ed0a6f871dea..9de3749fb268 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -1691,6 +1691,11 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 			emit_zextw(rd, rd, ctx);
 		break;
 
+	/* JUMP reg */
+	case BPF_JMP | BPF_JA | BPF_X:
+		emit_jalr(RV_REG_ZERO, rd, 0, ctx);
+		break;
+
 	/* JUMP off */
 	case BPF_JMP | BPF_JA:
 	case BPF_JMP32 | BPF_JA:
diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
index 2fb0b4e198b9..15acf249fed4 100644
--- a/arch/riscv/net/bpf_jit_core.c
+++ b/arch/riscv/net/bpf_jit_core.c
@@ -26,10 +26,13 @@ static int build_body(struct rv_jit_context *ctx, bool extra_pass, int *offset)
 		int ret;
 
 		ret = bpf_jit_emit_insn(insn, ctx, extra_pass);
-		if (ret > 0)
-			i++; /* skip the next instruction */
 		if (offset)
 			offset[i] = ctx->ninsns;
+		if (ret > 0) {
+			i++; /* skip the next instruction */
+			if (offset)
+				offset[i] = ctx->ninsns;
+		}
 		if (ret < 0)
 			return ret;
 	}
@@ -176,6 +179,15 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
 		for (i = 0; i < prog->len; i++)
 			ctx->offset[i] = ninsns_rvoff(ctx->offset[i]);
 		bpf_prog_fill_jited_linfo(prog, ctx->offset);
+
+		/*
+		 * bpf_prog_update_insn_ptrs() wants the start of each insn, so
+		 * shift the linfo array by one and get insn 0 from the prologue.
+		 */
+		for (i = prog->len - 1; i > 0; i--)
+			ctx->offset[i] = ctx->offset[i - 1];
+		ctx->offset[0] = ninsns_rvoff(ctx->prologue_len);
+		bpf_prog_update_insn_ptrs(prog, ctx->offset, jit_data->ro_image);
 out_offset:
 		kvfree(ctx->offset);
 		kfree(jit_data);
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
