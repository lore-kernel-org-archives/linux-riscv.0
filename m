Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB0DC43602
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 13:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pe54t6t9eiIjQEOJotqNGiT/Hpc7OD39DBivsz7B9Ns=; b=jS+9drATHlpkj5
	G+Dof7yjwBzr11gErlKng0uFVKLVao7DJ3kdywxJM/Hi46WUg5GfmVT062SWRlMuFel4nAMlwApIw
	pNaCqvSVCKah9+sWDOjliKZdFyqF5kGMdKZvYOlczoqORXUsvHGisocDenxh+fP7iHLN5cqObyp1v
	VtJB19sT1/xnd/JHsnIIC6AYZJUj3WLf9h2dnq2AeRV8p3jsN/DFlkQI3Kla6hvLe91TKzsJ2B8Td
	kHwOpS/GC4qOeQksuAqrBZnXGz2uG5QJPqK4SJMNloxISVWJNr7/fin7K5VoMaUfAXFtXAJXcI1P4
	mQe2FHGJXAU2dkZULHpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCTo-0000000EnsB-2FgL;
	Mon, 29 Jun 2026 13:56:56 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCTi-0000000EnnB-0ZD7
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 13:56:53 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gpnrH1x8DzKHMdR
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 21:56:31 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id B9DBE40806
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 21:56:37 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP2 (Coremail) with UTF8SMTPA id Syh0CgCXBfOUeUJqDlQCAQ--.44260S3;
	Mon, 29 Jun 2026 21:56:37 +0800 (CST)
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
Subject: [PATCH bpf-next v4 1/6] bpf: Extract the is_struct_ops_tramp helper
Date: Mon, 29 Jun 2026 14:00:43 +0000
Message-Id: <20260629140048.733346-2-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629140048.733346-1-pulehui@huaweicloud.com>
References: <20260629140048.733346-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: Syh0CgCXBfOUeUJqDlQCAQ--.44260S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCryfGr1kGF4UXF1kGr4rZrb_yoW5tr4UpF
	1fur13Cr4vgr1xWFyktay8XFya9a1vqrW2gFWUGaySya1aqryDXF1rGw4UCFZ8GrWYk3Wf
	ZrWj9rWqkrykZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
	Ij6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
	Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI
	0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUIw0e
	DUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_065650_527090_9D62A157 
X-CRM114-Status: UNSURE (   9.63  )
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

Extract the is_struct_ops_tramp helper, and use it in riscv and loongarch
as the current checks are somewhat hacky.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 arch/arm64/net/bpf_jit_comp.c   | 6 ------
 arch/loongarch/net/bpf_jit.c    | 2 +-
 arch/riscv/net/bpf_jit_comp64.c | 2 +-
 include/linux/bpf.h             | 6 ++++++
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index f6bcc0e1a950..bf67ae2b2885 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -2544,12 +2544,6 @@ static void restore_args(struct jit_ctx *ctx, int bargs_off, int nregs)
 	}
 }
 
-static bool is_struct_ops_tramp(const struct bpf_tramp_nodes *fentry_nodes)
-{
-	return fentry_nodes->nr_nodes == 1 &&
-		fentry_nodes->nodes[0]->link->type == BPF_LINK_TYPE_STRUCT_OPS;
-}
-
 static void store_func_meta(struct jit_ctx *ctx, u64 func_meta, int func_meta_off)
 {
 	emit_a64_mov_i64(A64_R(10), func_meta, ctx);
diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 058ffbbaad85..e2ed79e3bfd3 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -1815,11 +1815,11 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
 	int stack_size, args_off, stk_args_off, nr_arg_slots = 0;
 	int retval_off, func_meta_off, ip_off, run_ctx_off, sreg_off, tcc_ptr_off;
 	unsigned long long func_meta;
-	bool is_struct_ops = flags & BPF_TRAMP_F_INDIRECT;
 	void *orig_call = func_addr;
 	struct bpf_tramp_nodes *fentry = &tnodes[BPF_TRAMP_FENTRY];
 	struct bpf_tramp_nodes *fexit = &tnodes[BPF_TRAMP_FEXIT];
 	struct bpf_tramp_nodes *fmod_ret = &tnodes[BPF_TRAMP_MODIFY_RETURN];
+	bool is_struct_ops = is_struct_ops_tramp(fentry);
 	u32 **branches = NULL;
 
 	/*
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index c03c1de16b79..ebff0388c3a3 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -1033,7 +1033,7 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 	struct bpf_tramp_nodes *fentry = &tnodes[BPF_TRAMP_FENTRY];
 	struct bpf_tramp_nodes *fexit = &tnodes[BPF_TRAMP_FEXIT];
 	struct bpf_tramp_nodes *fmod_ret = &tnodes[BPF_TRAMP_MODIFY_RETURN];
-	bool is_struct_ops = flags & BPF_TRAMP_F_INDIRECT;
+	bool is_struct_ops = is_struct_ops_tramp(fentry);
 	void *orig_call = func_addr;
 	bool save_ret;
 	u64 func_meta;
diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 7719f6528445..bc57a25ba659 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -2196,6 +2196,12 @@ static inline bool is_tracing_multi(enum bpf_attach_type type)
 	       type == BPF_TRACE_FSESSION_MULTI;
 }
 
+static inline bool is_struct_ops_tramp(const struct bpf_tramp_nodes *fentry_nodes)
+{
+	return fentry_nodes->nr_nodes == 1 &&
+	       fentry_nodes->nodes[0]->link->type == BPF_LINK_TYPE_STRUCT_OPS;
+}
+
 #if defined(CONFIG_BPF_JIT) && defined(CONFIG_BPF_SYSCALL)
 /* This macro helps developer to register a struct_ops type and generate
  * type information correctly. Developers should use this macro to register
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
