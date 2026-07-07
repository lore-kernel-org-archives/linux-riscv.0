Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C898C43458
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 14:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D0YKodcbVdBKVH8cbgn6bIKololBJhHBVKTSQwechNE=; b=PvBjtLMtVtzmK2
	DPGaKfy12WbEIwezYhwE/JJdBQ/LRLfUwH+M8PJLIfsWCg/UTP01Sp6OfICEuh/w2GsMZODf3HVln
	sIsN9XAmmQK2vlYYe23k/dzGwA/YlxCtW/0PiEe7aDzHofWMQrSwSm/EP1la6aRnLTA16pdfvKsWO
	7jcXR2oMFUxh6sO1NuCsX19gTe53vBgO8Ji3EHIO3OT+QQXjpddpHwG5iVCnbtnU3yGMtoC1kOc++
	+mTb6+y7bWJxojid/VPWRI6ZQVEUcWjghQD96Eoquz+DzRSlN3L65CQI0TphjH6/TOjj5YAFuFb9f
	3fxnP9R8llipkhcpLfQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6cr-0000000F8DT-1v3t;
	Tue, 07 Jul 2026 14:18:17 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6cn-0000000F8BA-1g25
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 14:18:15 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gvjxK6GVGzYQtkn
	for <linux-riscv@lists.infradead.org>; Tue,  7 Jul 2026 22:17:57 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 4D3BC409F0
	for <linux-riscv@lists.infradead.org>; Tue,  7 Jul 2026 22:18:01 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP1 (Coremail) with UTF8SMTPA id cCh0CgBnd3OXCk1qwUWNAQ--.43005S5;
	Tue, 07 Jul 2026 22:18:01 +0800 (CST)
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
Subject: [PATCH bpf-next v5 3/6] riscv, bpf: Fix kernel stack corruption in tailcall with CFI
Date: Tue,  7 Jul 2026 14:22:16 +0000
Message-Id: <20260707142219.2871758-4-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707142219.2871758-1-pulehui@huaweicloud.com>
References: <20260707142219.2871758-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgBnd3OXCk1qwUWNAQ--.43005S5
X-Coremail-Antispam: 1UD129KBjvJXoW7tryxGr4Uur4Dur15tr45GFg_yoW8Zw1DpF
	45Gwn3urykXr1vkr9rAF4Dtw4YgrsY9a17Wr9ruayayan29r1xG3Z8Kw43ZFyrZFW8K3Wr
	AFy29rn3u34DZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPab4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUWw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ew
	Av7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY
	6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14
	v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU
	IF4iUUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_071813_801589_FFCF4B7F 
X-CRM114-Status: GOOD (  10.07  )
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

When CONFIG_CFI_CLANG is enabled, prog->bpf_func already skips the kcfi
instruction during setup. Including it again in the tailcall jump offset
causes it to jump over an extra 4 bytes, skipping the stack pointer
adjustment, which will result in kernel stack corruption.

Fixes: 30a59cc79754 ("riscv, bpf: Fix possible infinite tailcall when CONFIG_CFI_CLANG is enabled")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 arch/riscv/net/bpf_jit_comp64.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 2f06752fb036..cedf40927474 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -18,7 +18,6 @@
 #define RV_MAX_REG_ARGS 8
 #define RV_FENTRY_NINSNS 2
 #define RV_FENTRY_NBYTES (RV_FENTRY_NINSNS * 4)
-#define RV_KCFI_NINSNS (IS_ENABLED(CONFIG_CFI) ? 1 : 0)
 /* imm that allows emit_imm to emit max count insns */
 #define RV_MAX_COUNT_IMM 0x7FFF7FF7FF7FF7FF
 
@@ -272,8 +271,8 @@ static void __build_epilogue(bool is_tail_call, struct rv_jit_context *ctx)
 	if (!is_tail_call)
 		emit_addiw(RV_REG_A0, RV_REG_A5, 0, ctx);
 	emit_jalr(RV_REG_ZERO, is_tail_call ? RV_REG_T3 : RV_REG_RA,
-		  /* kcfi, fentry and TCC init insns will be skipped on tailcall */
-		  is_tail_call ? (RV_KCFI_NINSNS + RV_FENTRY_NINSNS + 1) * 4 : 0,
+		  /* fentry and TCC init insns will be skipped on tailcall */
+		  is_tail_call ? (RV_FENTRY_NINSNS + 1) * 4 : 0,
 		  ctx);
 }
 
@@ -2033,6 +2032,8 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 	/* emit kcfi type preamble immediately before the  first insn */
 	emit_kcfi(is_subprog ? cfi_bpf_subprog_hash : cfi_bpf_hash, ctx);
 
+	/* bpf prog starts here as kcfi skipped during prog->bpf_func setup */
+
 	/* nops reserved for auipc+jalr pair */
 	for (i = 0; i < RV_FENTRY_NINSNS; i++)
 		emit(rv_nop(), ctx);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
