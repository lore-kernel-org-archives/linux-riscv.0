Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED34DF34C4B
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 12:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zV2e0/Z7OQhfTAZr+vuU6CmpOpqGFaPM4JKm/JxUo5U=; b=PvHM4IwvSaX//S
	/97YnYzs+f6p9u/0bQhuO3H5LiMnrOzNRYZet0xzb/kglmCiSED4YD16AvmcRneJGhDurXlznYYkP
	rnauyjJv5sk/zISkLmGjIS+pvuzLshugl9uhsI+TY35KCS7FpUuFvPRbRSovEWUoG7hkzFDXgj+NQ
	8vWbLjjTUr2kQX4/UToGUhwLvlTBG8rbRUQLKDPJRNzEULBDIfMLH8HzaZkT0122ux78CisKObIpi
	gmfCNVASMsrSn2RjdnOjUEMAiUigmlIx++Di0I88e6N5nlqahECnBzjT/z3iXmoMndDBGQ+bZrb/G
	C1VWn4rcbX08kM3I7Slw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGUO-0000000FefZ-01lE;
	Mon, 13 Apr 2026 12:34:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGUM-0000000Feeb-0BQ1;
	Mon, 13 Apr 2026 12:34:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F1E8C61333;
	Mon, 13 Apr 2026 12:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E11BC2BCB1;
	Mon, 13 Apr 2026 12:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776083610;
	bh=UbDfM/GxSDcj6cq2REF6peE9vw8ahQW3H/hw/MykbRE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a2DN5l/f5tHlHQwcBO1st0Pq/3kkzqs8fSMr6BLlrcYhZYQUbHeNxIZqAz/Vhr2Ff
	 ukgmmPUZyuKRTKTz9yf1StrPpNGjlCf5pg8/1uY7B2wDNHivQ4zVQ3zCyV3X7LsWJD
	 hc0LbaB373eGP1lDW72zvgfd6xd+V5pr9vMeo35OImHuO3BiQ75gdfroJ1DZerDmTP
	 LlhBeHvlZkha2+zUuQ3n+OzBfAZYj7lfNl1/ehXYqdXNog1yFMhk6E3hTn+sSk1int
	 j/ysQ4JXyaFCV6rrHAH9+iZCQWliriJ+f6BNTrBfk4jap/sH2RDNKURHKs28rYr+Vm
	 jPtT6xyNVA1FQ==
From: Puranjay Mohan <puranjay@kernel.org>
To: bpf@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next 1/2] bpf, arm64: Remove redundant bpf_flush_icache() after pack allocator finalize
Date: Mon, 13 Apr 2026 05:32:54 -0700
Message-ID: <20260413123256.3296452-2-puranjay@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260413123256.3296452-1-puranjay@kernel.org>
References: <20260413123256.3296452-1-puranjay@kernel.org>
MIME-Version: 1.0
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

bpf_flush_icache() calls flush_icache_range() to clean the data cache
and invalidate the instruction cache for the JITed code region. However,
since commit 1dad391daef1 ("bpf, arm64: use bpf_prog_pack for memory
management"), this flush is redundant.

bpf_jit_binary_pack_finalize() copies the JITed instructions to the ROX
region via bpf_arch_text_copy() -> aarch64_insn_copy() -> __text_poke(),
and __text_poke() already calls flush_icache_range() on the written
range. The subsequent bpf_flush_icache() repeats the same cache
maintenance on an overlapping range, including an unnecessary second
synchronous IPI to all CPUs via kick_all_cpus_sync().

Remove the redundant bpf_flush_icache() call and its now-unused
definition.

Fixes: 1dad391daef1 ("bpf, arm64: use bpf_prog_pack for memory management")
Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 arch/arm64/net/bpf_jit_comp.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index adf84962d579..e88b0917adec 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -1961,11 +1961,6 @@ static int validate_ctx(struct jit_ctx *ctx)
 	return 0;
 }
 
-static inline void bpf_flush_icache(void *start, void *end)
-{
-	flush_icache_range((unsigned long)start, (unsigned long)end);
-}
-
 static void priv_stack_init_guard(void __percpu *priv_stack_ptr, int alloc_size)
 {
 	int cpu, underflow_idx = (alloc_size - PRIV_STACK_GUARD_SZ) >> 3;
@@ -2204,12 +2199,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 			prog = orig_prog;
 			goto out_off;
 		}
-		/*
-		 * The instructions have now been copied to the ROX region from
-		 * where they will execute. Now the data cache has to be cleaned to
-		 * the PoU and the I-cache has to be invalidated for the VAs.
-		 */
-		bpf_flush_icache(ro_header, ctx.ro_image + ctx.idx);
 	} else {
 		jit_data->ctx = ctx;
 		jit_data->ro_image = ro_image_ptr;
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
