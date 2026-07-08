Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16ACC43458
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 06:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RjizbxLJwAifNCPpgoy8EPRzN/vlrnGZtT/oTwtvHpM=; b=gaxYCp7uyzTl5A
	C5WPDWrZ/UqJe+sjmqtXUjDIqtj3lxAPSerm4Gb0FfeMGZqXpjCKozreRWZvLquHmhQs7sgL6pjU3
	Nq+To+tPUgbxkMSLY07qMoWdcXblDtMfrmWqiImmcFQ8d4TB/qqJHD9D/OWTiQDd/tIVc/MLkvF+6
	lb4tMUy0RgUGs67KfB+O7ph6e+zBjg6JOHBImXsz0VmmwR0qMszzNQ2Xhx6iy2DZno8zYlI3vG9v+
	0hzew01ziJoeR+JwdWYNQnMXcxF1TOd6KGx5d/RraGyaYGQl3kyRVNEF21RZyDzAkPNiKsdFo02kO
	VvzfAUmSIxMM4hvaShIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whLxT-0000000GQ0L-30ev;
	Wed, 08 Jul 2026 06:40:35 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whLxP-0000000GPxE-3kRU
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 06:40:33 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gw7kh2vn8zYQtlv
	for <linux-riscv@lists.infradead.org>; Wed,  8 Jul 2026 14:40:12 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 06BC340590
	for <linux-riscv@lists.infradead.org>; Wed,  8 Jul 2026 14:40:17 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP2 (Coremail) with UTF8SMTPA id Syh0CgD32yfQ8E1qblLgAQ--.30661S7;
	Wed, 08 Jul 2026 14:40:16 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Pu Lehui <pulehui@huawei.com>
Subject: [PATCH bpf-next v6 5/7] riscv, bpf: Add RV_TAILCALL_OFFSET macro to format tailcall offset
Date: Wed,  8 Jul 2026 06:44:34 +0000
Message-Id: <20260708064436.2971933-6-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708064436.2971933-1-pulehui@huaweicloud.com>
References: <20260708064436.2971933-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: Syh0CgD32yfQ8E1qblLgAQ--.30661S7
X-Coremail-Antispam: 1UD129KBjvJXoW7WrWrAFykXr4ftrWDXFW5Jrb_yoW8AFy5pF
	WrKwn3Cr9Yqr1FkryxAF4qqa1SyrnYgFsrGr43CrW3G3Z2vrykGa1DKw4Yvry5uFyrJr48
	AFyq9r1fua4kZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPmb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAV
	Cq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0
	rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267
	AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x02
	67AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I
	80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCj
	c4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4
	kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E
	5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZV
	WrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY
	1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
	AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZE
	Xa7IU0189tUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_234032_892858_77F7EDAC 
X-CRM114-Status: GOOD (  10.45  )
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

Add RV_TAILCALL_OFFSET macro to format tailcall offset, and correct the
relevant comments.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 arch/riscv/net/bpf_jit_comp64.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index cedf40927474..7c6304e0b846 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -20,6 +20,8 @@
 #define RV_FENTRY_NBYTES (RV_FENTRY_NINSNS * 4)
 /* imm that allows emit_imm to emit max count insns */
 #define RV_MAX_COUNT_IMM 0x7FFF7FF7FF7FF7FF
+/* fentry and TCC init insns will be skipped on tailcall */
+#define RV_TAILCALL_OFFSET ((RV_FENTRY_NINSNS + 1) * 4)
 
 #define RV_REG_TCC RV_REG_A6
 #define RV_REG_TCC_SAVED RV_REG_S6 /* Store A6 in S6 if program do calls */
@@ -271,9 +273,7 @@ static void __build_epilogue(bool is_tail_call, struct rv_jit_context *ctx)
 	if (!is_tail_call)
 		emit_addiw(RV_REG_A0, RV_REG_A5, 0, ctx);
 	emit_jalr(RV_REG_ZERO, is_tail_call ? RV_REG_T3 : RV_REG_RA,
-		  /* fentry and TCC init insns will be skipped on tailcall */
-		  is_tail_call ? (RV_FENTRY_NINSNS + 1) * 4 : 0,
-		  ctx);
+		  is_tail_call ? RV_TAILCALL_OFFSET : 0, ctx);
 }
 
 static void emit_bcc(u8 cond, u8 rd, u8 rs, int rvoff,
@@ -393,7 +393,7 @@ static int emit_bpf_tail_call(int insn, struct rv_jit_context *ctx)
 	off = ninsns_rvoff(tc_ninsn - (ctx->ninsns - start_insn));
 	emit_branch(BPF_JEQ, RV_REG_T2, RV_REG_ZERO, off, ctx);
 
-	/* goto *(prog->bpf_func + 4); */
+	/* goto *(prog->bpf_func + RV_TAILCALL_OFFSET); */
 	off = offsetof(struct bpf_prog, bpf_func);
 	if (is_12b_check(off, insn))
 		return -1;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
