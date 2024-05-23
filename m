Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D42C25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 03:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0j302D5ZUg/gsxBcyQp8C/sxoehW3wEd5f6c3exX9EY=; b=EMGKiN0jMlYViO
	bU1UuClQYy55Y4CXBRpZbV0PdsiEVuDEBNxhL6SKJ+TVIG2cYSsV+PLPELQPKPOfmFrEhQmOXgIHI
	EuJQIjl1b2lXt6W5w/Enj5ss8b0b4OmcZOa/c4lqIrM14wvMhSitICGgmoDHd1NcvgHbPsINypz5U
	YRlqrs0SMeo4PAppYPAgMkhTfYAqqH1Q+blEKapeaow0uImVsqdRj/ArwbIWnzyi1f5bgU9CPNKtG
	EQuUvUbhEZlnjw66wcbY1afK6tUyFQ+MPl+wd5CgboGX4WkPPXYuBuu3KmYXT2XdjinEzpNkZqTiS
	72C6R4WNDJ9dHbTMlnMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9yvi-00000004s7I-1g6V;
	Thu, 23 May 2024 03:15:50 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9yvc-00000004s5Y-0aon
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 03:15:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716434140; x=1747970140;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mnc3vPUa53ZuitOW/W9PdnOeYFxVvgU0shbAspLPL5Y=;
  b=E/cAMe9kxeYUsoBdEIRHBVd9Ys9+FUjDIMEzK83t2RV2Xc/XdnG5kJ4Q
   1zv49OsXXFn57cBLeNb5copqbOe8vNblGSlHbE/tU+4GLLGrHPhab6Ako
   U1q8NtXUoEGGOUYs4G89kX42YpDZRVT13lBDDN8Bw7fawn1taFqgIwnLU
   p20gJqNPfbX6DmpUBKn+cAtXq0Cm79EJSOd6L1ypfYHDu5m6FHBz5S9B1
   kLLOlOL6biMnP/pvpPnEWt9S7p9mueXBIrtsaViRum1BchN5y3eRLGR0U
   gnlnCFCkqDnd82rqrPAAahyDU3rt3OEmOYkmVrSI2BYjRwJgY4E2u1A5M
   Q==;
X-CSE-ConnectionGUID: OQ+Y6h27SQKM0WIHtl7KGw==
X-CSE-MsgGUID: JbIecxb7TcWfpyfMq6JYmg==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="16514489"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="16514489"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 20:15:30 -0700
X-CSE-ConnectionGUID: BBZrUNMUQzqvWJRz7huJ/w==
X-CSE-MsgGUID: eBTIAcpCRK2wCOLPuCcgWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="34056639"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
  by orviesa008.jf.intel.com with ESMTP; 22 May 2024 20:15:24 -0700
From: Xiao Wang <xiao.w.wang@intel.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	luke.r.nels@gmail.com,
	xi.wang@gmail.com,
	bjorn@kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@google.com,
	haoluo@google.com,
	jolsa@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	pulehui@huawei.com,
	haicheng.li@intel.com,
	Xiao Wang <xiao.w.wang@intel.com>
Subject: [PATCH v2] riscv, bpf: Use STACK_ALIGN macro for size rounding up
Date: Thu, 23 May 2024 11:18:35 +0800
Message-Id: <20240523031835.3977713-1-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_201540_376378_DB49EB61 
X-CRM114-Status: UNSURE (   8.60  )
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

Use the macro STACK_ALIGN that is defined in asm/processor.h for stack size
rounding up, just like bpf_jit_comp32.c does.

Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
Reviewed-by: Pu Lehui <pulehui@huawei.com>
---
v2:
* The patch targets bpf-next tree, rather than riscv-next. (Lehui)
---
 arch/riscv/net/bpf_jit_comp64.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 79a001d5533e..c21a0ff23415 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -868,7 +868,7 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 	stack_size += 8;
 	sreg_off = stack_size;
 
-	stack_size = round_up(stack_size, 16);
+	stack_size = round_up(stack_size, STACK_ALIGN);
 
 	if (!is_struct_ops) {
 		/* For the trampoline called from function entry,
@@ -1960,7 +1960,7 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 {
 	int i, stack_adjust = 0, store_offset, bpf_stack_adjust;
 
-	bpf_stack_adjust = round_up(ctx->prog->aux->stack_depth, 16);
+	bpf_stack_adjust = round_up(ctx->prog->aux->stack_depth, STACK_ALIGN);
 	if (bpf_stack_adjust)
 		mark_fp(ctx);
 
@@ -1982,7 +1982,7 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 	if (ctx->arena_vm_start)
 		stack_adjust += 8;
 
-	stack_adjust = round_up(stack_adjust, 16);
+	stack_adjust = round_up(stack_adjust, STACK_ALIGN);
 	stack_adjust += bpf_stack_adjust;
 
 	store_offset = stack_adjust - 8;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
