Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3619EC98302
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 14:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XWqN2enABKvNIhY7NsqD/RthKHZl8iajNVQTTw6p2Po=; b=btlIUcMOjMx2Sb
	RlIV6xWTKP7gVzKAsIcD4hIcDqJxG0lpfOxRp4gkxjBZ7Qjxm/SZ8SAdaO4Cuy1sT0vCTrF7DFv9+
	Ba0ZEyRZ9GTTpYR5lO5Y3bM0C3sdDJvGxOGCjgCpnVOFXOeJGYvhsCVFyzvzxn0MilkHiENeVoqf1
	Hud7GCLURGwGiKHHgsdKz3GQiQ52506whtmbB9IFr98W2LmSsps4PE4+ytagNHzenWfCpG+XbzQQp
	e1WXiJ8LD2+5hwSgrPPJkKfbtPv3oMNK5avQr6YCvVew/UfZ3RgA7oxeXxAzDxuw9Y8WvVgjkDbGR
	/GU3NoBf4SarSQpqikXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9O6q-00000008YSn-4BVh;
	Wed, 23 Sep 2026 14:38:09 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9O6n-00000008YOs-2HqL
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 14:38:07 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hqfh00gxwzYQtgy
	for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 22:37:36 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 2EF554056B
	for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 22:37:53 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgAX6Co_5LNqbS2UBQ--.27216S2;
	Wed, 23 Sep 2026 22:37:52 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Pu Lehui <pulehui@huawei.com>
Subject: [PATCH bpf-next] riscv, bpf: Fix missing sign-ext for signed 1-byte and 2-byte kfunc args
Date: Wed, 23 Sep 2026 14:41:54 +0000
Message-Id: <20260923144154.934674-1-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgAX6Co_5LNqbS2UBQ--.27216S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF48Wry5ury3JFWUXFWfGrg_yoW8WF15pF
	15C34akF9Yqw1IvFy8AF48Wr15Gr4vva17uFWj9a45JFW2qFWrWr4rKw4Yvay5urZ5u3WF
	kryqgwn7u3yku3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAa
	w2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a
	6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
	xUIa0PDUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_073805_941384_1BAA1584 
X-CRM114-Status: UNSURE (   9.65  )
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

On RV64, the ABI requires sign-extension for signed 1-byte and 2-byte
kfunc args. However, the RV64 JIT currently does not perform
sign-extension for such kfunc args.

Before commit 7ce090afbf72 ("bpf: Infer zext_dst based on static
register liveness analysis"), state pruning could potentially omit
zero-extension of 32-bit subregisters, which inadvertently masked the
above issue by making the args appear as if they had been properly
sign-extended. After that commit, the problem is exposed, causing the
kfunc_call/kfunc_call_test4 selftest to fail.

Fix this by extending the existing sign-extension logic to handle signed
1-byte and 2-byte kfunc args as well.

Fixes: 443574b03387 ("riscv, bpf: Fix kfunc parameters incompatibility between bpf and riscv abi")
Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 arch/riscv/net/bpf_jit_comp64.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 2504df1fa111..74efe4b138d2 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -1823,9 +1823,10 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 
 			for (idx = 0; idx < fm->nr_args; idx++) {
 				u8 reg = bpf_to_rv_reg(BPF_REG_1 + idx, ctx);
+				bool sign = fm->arg_flags[idx] & BTF_FMODEL_SIGNED_ARG;
 
-				if (fm->arg_size[idx] == sizeof(int))
-					emit_sextw(reg, reg, ctx);
+				if (sign_extend(reg, reg, fm->arg_size[idx], sign, ctx))
+					return -EINVAL;
 			}
 		}
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
