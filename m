Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CE3C25B77
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 05:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IMfbl8emHhMCCu0JSj8NUKTW29Glvhny7RehhsJZVwk=; b=i1NMcphXwUa35W
	yJh+SibygHu619aSzRIflb/rG6xIE7wQgUvZiuOo57jzcvxcwHMJMG/P8XsV5jHsmRJzPUdHCVBwQ
	YbeZ4B6B+3Rehgxk1DCDN7K7IEKKHLanJD3xyxU/OGQJPhixOHoxv0LEEHRBkr/m3V5HY68yLwLs1
	kup10lI2V1CIxGAJjmrIYLGLi0ZZ3mYohN14kfNywJYzl42BrpKK8PuKM1eE6AU7tXky74oK6E0ym
	LBA1NknhXJwRH82RhgipJ8jRHD2XSm6tifcQeGjwn/vzO9UIL5BurvGzuMUoVhp3RUkqc3IbtNqcG
	tMcEv7Mp8OjT3zsQQwAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ejo-000000022ar-42fk;
	Wed, 22 May 2024 05:42:08 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ejm-000000022Zq-263L
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 05:42:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716356526; x=1747892526;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DNOmOODdlXynNw2098gR2o08KbJJt+rlhW8xtv8itE8=;
  b=IK4DYfRZ48jlYqu8CGnzW3wtDiANWOrAql8cOGL2sCuRn8u/5L5094ju
   OqPGAgcs4BkyBw5JPU7aQPnuciTlLNqJBX02re7xTpmvPDYb5COHwScQa
   ep38UxsQ4BZa2vai4RmttAzlDhW5kxMnSWs4j4p7AwOV/fhOJI39hukIX
   7sicS5116k+BteqbonkY/cCpoxk1EpRnTMg/DSHLJrOtRwpLxONlPAMCD
   q1zJylQvKDrqqnJ4cYBLNFW4rnEBaa5doK1b2m/aGw3aO10D98CXHrnaN
   CDA2qcIKFGbHdhJ4KqlQm6kuECVcNkijh+fdYys+VQncN8jnXY937gEfu
   w==;
X-CSE-ConnectionGUID: uEp1tAd8S0GCNI8EawV5/g==
X-CSE-MsgGUID: 8xJZrLNhRXaN0O1N/yGw4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="23990825"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="23990825"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 22:41:58 -0700
X-CSE-ConnectionGUID: 2Q1tF3BvQ9S+lXXvTMhpug==
X-CSE-MsgGUID: ms7XDvyHTui40I7vtTbvbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="37922008"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
  by orviesa003.jf.intel.com with ESMTP; 21 May 2024 22:41:53 -0700
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
Subject: [PATCH] riscv, bpf: Use STACK_ALIGN macro for size rounding up
Date: Wed, 22 May 2024 13:45:07 +0800
Message-Id: <20240522054507.3941595-1-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_224206_670976_F82FD486 
X-CRM114-Status: UNSURE (   8.77  )
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
---
 arch/riscv/net/bpf_jit_comp64.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 39149ad002da..bd869d41612f 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -858,7 +858,7 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 	stack_size += 8;
 	sreg_off = stack_size;
 
-	stack_size = round_up(stack_size, 16);
+	stack_size = round_up(stack_size, STACK_ALIGN);
 
 	if (!is_struct_ops) {
 		/* For the trampoline called from function entry,
@@ -1723,7 +1723,7 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 {
 	int i, stack_adjust = 0, store_offset, bpf_stack_adjust;
 
-	bpf_stack_adjust = round_up(ctx->prog->aux->stack_depth, 16);
+	bpf_stack_adjust = round_up(ctx->prog->aux->stack_depth, STACK_ALIGN);
 	if (bpf_stack_adjust)
 		mark_fp(ctx);
 
@@ -1743,7 +1743,7 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 	if (seen_reg(RV_REG_S6, ctx))
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
