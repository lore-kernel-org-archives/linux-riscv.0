Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843D7C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 06:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j5d4/oLIdTM5P55ke997G5kxCx4jOWIiURphifSr1rM=; b=D7wucbAmQwdgkL
	c+vf4p5yG9eVM6CUYTg0IseTvVhQleeqqcfDNiYucXuz7dCEOuBX+injJ3kCKr5zOed8Gi0a/Uq2Y
	3Ew1lEV+yi9dhyguEZShcAoq8yXmtQnl9o1gRhvPvbErELDuJV+5IyPYeyngcNMJWIIrAf5ndXo6h
	k8IrzkTq74c6iJ1RX51KOfwbGpaPkr0VH0UAp6AROOdWpYp0NCjxepiexjLjZiLzZgN9EIEyj6cGe
	iNUy1daZnO1UBDgTLKRSqrCIguf+4FXFkamXdVUwmAZpeThNShXXofzFps/E7Bdvj2KXGBGHWRhG4
	FpufnBXYWxtChf6fdDnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whLxc-0000000GQ4w-1Oqs;
	Wed, 08 Jul 2026 06:40:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whLxb-0000000GQ4B-3dti
	for linux-riscv@bombadil.infradead.org;
	Wed, 08 Jul 2026 06:40:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=spDFx5j2BTKoaJXOtXnPcGCwvsAlDIymWAmhnKxAjqU=; b=eN1kT6UiKSdWu6i4dNHR8SsjMc
	NCsa5aw9VbpKIygpA8N4ENm89lFPjoOD8SgFoJ9VUR5IutvciBESmyhDDUHchonCGgpif8HBX/SjZ
	SHfkwpIRMmHiN4GJY+SGfh2PLlN6qNL7URQv19e3VgFhaJ1q2Mkj8vSi8uA7bx0wq8ogvbmwYgoNw
	BrWHRooEQ7EH9Xo7Zl8PQHYlAb7QCEJ3FZAxMrX52qVt3OdhWpFJkbA1zs27b2LRbkGXPGfEzPdNs
	zijEbsPe8wyTpoV4RMbDi7z/08MoMf4ce6jETnRrZyFbFYLxaGozRjtoE+Wit6VMprG9COdVgA6kA
	v+O9/00w==;
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whLxX-000000083b8-3CuT
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 06:40:42 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gw7kh1XgvzYQtl0
	for <linux-riscv@lists.infradead.org>; Wed,  8 Jul 2026 14:40:12 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id C47724056D
	for <linux-riscv@lists.infradead.org>; Wed,  8 Jul 2026 14:40:16 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP2 (Coremail) with UTF8SMTPA id Syh0CgD32yfQ8E1qblLgAQ--.30661S3;
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
Subject: [PATCH bpf-next v6 1/7] bpf: Extract the is_struct_ops_tramp helper
Date: Wed,  8 Jul 2026 06:44:30 +0000
Message-Id: <20260708064436.2971933-2-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708064436.2971933-1-pulehui@huaweicloud.com>
References: <20260708064436.2971933-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: Syh0CgD32yfQ8E1qblLgAQ--.30661S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CFy3WFy8Kr4fKF4DWFykXwb_yoW5JF17pF
	4xur13Cr4kWr1xWFyktay8ZFya9an2q3y2krWUG3ySka1aqry7JF1rGw45CrZ8GrWYk3Wf
	AFWj9rs8urykZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP2b4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ew
	Av7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY
	6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14
	v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0U8
	n5UUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_074040_527828_37E45B39 
X-CRM114-Status: UNSURE (   9.07  )
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

Extract the is_struct_ops_tramp helper, and use it in riscv
as the current checks are somewhat hacky.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 arch/arm64/net/bpf_jit_comp.c   | 6 ------
 arch/riscv/net/bpf_jit_comp64.c | 2 +-
 include/linux/bpf.h             | 6 ++++++
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index b0075ece4a6e..36337c3dad85 100644
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
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index f9d5347ba966..406e774b4ac3 100644
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
index adf53f7edf28..70aad8d7d84f 100644
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
