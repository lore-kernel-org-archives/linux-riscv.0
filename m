Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25632C25B75
	for <linux-riscv@archiver.kernel.org>; Sun, 19 May 2024 05:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6178wcjm3Le7I6I0hErh0Gp4xGNNewBLPNypjqxwWew=; b=tSU9LmirXjLjbN
	pe1PY1kRz2J1HEOf3I1ufU0lZbeyCRb7CWdE4O/yT/JHDpmZ/FJzWxvYoOPO0O1gngxjmX+gPaavC
	Fh84Z2johz4xvGkyrw5NjcMEY5dlbRrS+Yv26BAnrl2aUQ5b7wkpPqUF0QRAEsPUt6i66z7z7kGh3
	hMkHk9boDgO5opxCTWKBZ7GOjKJ8gb4GqrzFaEVpQgnjd/jWBCfWkuXwm0c12OIlIRWJKG2tgUqUX
	9KkkG3mwH9889aCLTuRsJ5DL3GpxLbc0LLfmd9BjXDJ68A8pMUCPCqn3MWUBFcYssk9UfhL3cMXjp
	qSZ50v0JCx463rsG6K2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8YgP-0000000BN6i-2TA9;
	Sun, 19 May 2024 05:02:05 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8YgM-0000000BN5x-3J2W
	for linux-riscv@lists.infradead.org;
	Sun, 19 May 2024 05:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716094923; x=1747630923;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JOXyQnL/Rd4T3+2ptcou/ugUznzFoHrhbhcuHxJtPgI=;
  b=eJSQRbH7RFtBzrQmRl4fCz668NzRUNFaqEPiIGTNoFmTgmfl++0rSAtw
   VtsYSciR5g0Tirp6BECgg25/toR0UB0J6qgA7mLA5tpH8ilfSnr/9MN/3
   IKR2rDqa02iTJyUqzwNuAZDfbBWnu/ZxJBur1BlEk4CsIe5NsqWq9p3Ds
   oanH1X6rfHB1pN5xrDdmIIV2cs8I0VGCVnDot45AQBZjr3E6WUuFYvBYx
   PGpyQHL+/X4jBfKVRJ+dW21EOCvt0+QRrGEYZfB+OKHmbURl7MS5i1m+T
   kNToxI2h4m8aQnrMd+nSLFsCRQKEaObeEkc4ASx/ntnFHy01cwXUzs2qe
   Q==;
X-CSE-ConnectionGUID: kTJEVgfjTQCVUc9hrkGqVQ==
X-CSE-MsgGUID: sMRb2hORTxGV8xQQEp4IUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="12182840"
X-IronPort-AV: E=Sophos;i="6.08,172,1712646000"; 
   d="scan'208";a="12182840"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 22:01:57 -0700
X-CSE-ConnectionGUID: VMTxTzD9SMe76W4d80VeWw==
X-CSE-MsgGUID: Mf1dO27hTISmu4yA6Z9XBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,172,1712646000"; 
   d="scan'208";a="32110053"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
  by fmviesa007.fm.intel.com with ESMTP; 18 May 2024 22:01:51 -0700
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
Subject: [PATCH] riscv, bpf: try RVC for reg move within BPF_CMPXCHG JIT
Date: Sun, 19 May 2024 13:05:07 +0800
Message-Id: <20240519050507.2217791-1-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240518_220202_929010_9240D794 
X-CRM114-Status: UNSURE (   8.13  )
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

We could try to emit compressed insn for reg move operation during CMPXCHG
JIT, the instruction compression has no impact on the jump offsets of
following forward and backward jump instructions.

Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
---
 arch/riscv/net/bpf_jit_comp64.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index aac190085472..c134aaec4295 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -531,8 +531,10 @@ static void emit_atomic(u8 rd, u8 rs, s16 off, s32 imm, bool is64,
 	/* r0 = atomic_cmpxchg(dst_reg + off16, r0, src_reg); */
 	case BPF_CMPXCHG:
 		r0 = bpf_to_rv_reg(BPF_REG_0, ctx);
-		emit(is64 ? rv_addi(RV_REG_T2, r0, 0) :
-		     rv_addiw(RV_REG_T2, r0, 0), ctx);
+		if (is64)
+			emit_mv(RV_REG_T2, r0, ctx);
+		else
+			emit_addiw(RV_REG_T2, r0, 0, ctx);
 		emit(is64 ? rv_lr_d(r0, 0, rd, 0, 0) :
 		     rv_lr_w(r0, 0, rd, 0, 0), ctx);
 		jmp_offset = ninsns_rvoff(8);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
