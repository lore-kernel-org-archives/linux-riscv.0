Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B155C636CC
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 13:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IHEI+AqUs1XHtaGzeRuJc4xrM5eZ7kEnjDJgNc3Altc=; b=GGmPc71w+b5EhT
	CTUZ6Adh//62VYY3sg3knrCxaGHVnQQS8HkZcHovDomD4Vty7Sf4pLYq4uECGmrAPaHrBwdEJ/w3Z
	6Fx1olei1wNvFjL1SHsbuHI2hTnMayhviI/Y4sesnT43X1PVb8abVXjyXLp5dLCqFex+zo1OdJ1HU
	a6leDzgdu0NKUDxn+7yM4auAwse2Md5J9XCPrgNo4rCTR9CySexNvllhXI5AN4BuIZFebSb8n4VRi
	kxluowO25carYbujjfSYSDdtFXwOzk8HeFawVrxBTfFmhpzHTtpuUvuZJ/H0vZPlXwzYm4AsvRDXb
	3xX5g/0TflMDNe0NJorQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSIAk-0066h9-Ae; Wed, 15 Feb 2023 13:50:10 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSIAe-0066ZJ-9b
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 13:50:07 +0000
Received: from mail02.huawei.com (unknown [172.30.67.153])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4PGzwC2sgSz4f3k5q
	for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 21:49:47 +0800 (CST)
Received: from localhost.localdomain (unknown [10.67.175.61])
	by APP1 (Coremail) with SMTP id cCh0CgDnUSz64uxjC3LEDQ--.36740S5;
	Wed, 15 Feb 2023 21:49:49 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
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
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	Pu Lehui <pulehui@huawei.com>,
	Pu Lehui <pulehui@huaweicloud.com>
Subject: [PATCH bpf-next v1 3/4] riscv, bpf: Add bpf_arch_text_poke support for RV64
Date: Wed, 15 Feb 2023 21:52:04 +0800
Message-Id: <20230215135205.1411105-4-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230215135205.1411105-1-pulehui@huaweicloud.com>
References: <20230215135205.1411105-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgDnUSz64uxjC3LEDQ--.36740S5
X-Coremail-Antispam: 1UD129KBjvJXoWxur4ruw43ZFW5tF4DWw1xKrg_yoWrtF45pF
	s8C3sxCrWvqF4SgFy7JF4jqr1Ykr4vgFsrGr9xu3yrAanFqr93C3Z5Ka1ayF98CrW8WF1I
	vF4jkFnxuw4DArJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
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
	CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUojjgUUUU
	U
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_055004_715436_43F0352C 
X-CRM114-Status: GOOD (  14.63  )
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

Implement bpf_arch_text_poke for RV64. For call scenario,
to make bpf trampoline compatible with the kernel and bpf
context, we follow the framework of RV64 ftrace to reserve
4 nops for bpf programs as function entry, and use auipc+jalr
instructions for function call. However, since auipc+jalr
call instruction is non-atomic operation, we need to use
stop-machine to make sure instructions patching in atomic
context. Also, we use auipc+jalr pair and need to patch
in stop-machine context for jump scenario.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 arch/riscv/net/bpf_jit.h        |  5 ++
 arch/riscv/net/bpf_jit_comp64.c | 88 ++++++++++++++++++++++++++++++++-
 2 files changed, 91 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
index d926e0f7ef57..bf9802a63061 100644
--- a/arch/riscv/net/bpf_jit.h
+++ b/arch/riscv/net/bpf_jit.h
@@ -573,6 +573,11 @@ static inline u32 rv_fence(u8 pred, u8 succ)
 	return rv_i_insn(imm11_0, 0, 0, 0, 0xf);
 }
 
+static inline u32 rv_nop(void)
+{
+	return rv_i_insn(0, 0, 0, 0, 0x13);
+}
+
 /* RVC instrutions. */
 
 static inline u16 rvc_addi4spn(u8 rd, u32 imm10)
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 69ebab81d935..b6b9bbcc977a 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -8,6 +8,8 @@
 #include <linux/bitfield.h>
 #include <linux/bpf.h>
 #include <linux/filter.h>
+#include <linux/memory.h>
+#include <linux/stop_machine.h>
 #include "bpf_jit.h"
 
 #define RV_REG_TCC RV_REG_A6
@@ -238,7 +240,7 @@ static void __build_epilogue(bool is_tail_call, struct rv_jit_context *ctx)
 	if (!is_tail_call)
 		emit_mv(RV_REG_A0, RV_REG_A5, ctx);
 	emit_jalr(RV_REG_ZERO, is_tail_call ? RV_REG_T3 : RV_REG_RA,
-		  is_tail_call ? 4 : 0, /* skip TCC init */
+		  is_tail_call ? 20 : 0, /* skip reserved nops and TCC init */
 		  ctx);
 }
 
@@ -615,6 +617,84 @@ static int add_exception_handler(const struct bpf_insn *insn,
 	return 0;
 }
 
+static int gen_call_or_nops(void *target, void *ip, u32 *insns)
+{
+	s64 rvoff;
+	int i, ret;
+	struct rv_jit_context ctx;
+
+	ctx.ninsns = 0;
+	ctx.insns = (u16 *)insns;
+
+	if (!target) {
+		for (i = 0; i < 4; i++)
+			emit(rv_nop(), &ctx);
+		return 0;
+	}
+
+	rvoff = (s64)(target - (ip + 4));
+	emit(rv_sd(RV_REG_SP, -8, RV_REG_RA), &ctx);
+	ret = emit_jump_and_link(RV_REG_RA, rvoff, false, &ctx);
+	if (ret)
+		return ret;
+	emit(rv_ld(RV_REG_RA, -8, RV_REG_SP), &ctx);
+
+	return 0;
+}
+
+static int gen_jump_or_nops(void *target, void *ip, u32 *insns)
+{
+	s64 rvoff;
+	struct rv_jit_context ctx;
+
+	ctx.ninsns = 0;
+	ctx.insns = (u16 *)insns;
+
+	if (!target) {
+		emit(rv_nop(), &ctx);
+		emit(rv_nop(), &ctx);
+		return 0;
+	}
+
+	rvoff = (s64)(target - ip);
+	return emit_jump_and_link(RV_REG_ZERO, rvoff, false, &ctx);
+}
+
+int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type poke_type,
+		       void *old_addr, void *new_addr)
+{
+	u32 old_insns[4], new_insns[4];
+	bool is_call = poke_type == BPF_MOD_CALL;
+	int (*gen_insns)(void *target, void *ip, u32 *insns);
+	int ninsns = is_call ? 4 : 2;
+	int ret;
+
+	if (!is_bpf_text_address((unsigned long)ip))
+		return -ENOTSUPP;
+
+	gen_insns = is_call ? gen_call_or_nops : gen_jump_or_nops;
+
+	ret = gen_insns(old_addr, ip, old_insns);
+	if (ret)
+		return ret;
+
+	if (memcmp(ip, old_insns, ninsns * 4))
+		return -EFAULT;
+
+	ret = gen_insns(new_addr, ip, new_insns);
+	if (ret)
+		return ret;
+
+	cpus_read_lock();
+	mutex_lock(&text_mutex);
+	if (memcmp(ip, new_insns, ninsns * 4))
+		ret = patch_text(ip, new_insns, ninsns);
+	mutex_unlock(&text_mutex);
+	cpus_read_unlock();
+
+	return ret;
+}
+
 int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 		      bool extra_pass)
 {
@@ -1266,7 +1346,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 
 void bpf_jit_build_prologue(struct rv_jit_context *ctx)
 {
-	int stack_adjust = 0, store_offset, bpf_stack_adjust;
+	int i, stack_adjust = 0, store_offset, bpf_stack_adjust;
 
 	bpf_stack_adjust = round_up(ctx->prog->aux->stack_depth, 16);
 	if (bpf_stack_adjust)
@@ -1293,6 +1373,10 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx)
 
 	store_offset = stack_adjust - 8;
 
+	/* reserve 4 nop insns */
+	for (i = 0; i < 4; i++)
+		emit(rv_nop(), ctx);
+
 	/* First instruction is always setting the tail-call-counter
 	 * (TCC) register. This instruction is skipped for tail calls.
 	 * Force using a 4-byte (non-compressed) instruction.
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
