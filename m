Return-Path: <SRS0=V1R6=2R=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38155C2D0C6
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 27 Dec 2019 17:43:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B3582464B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 27 Dec 2019 17:43:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bqwyhO/S";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TiKHpEc6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B3582464B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nkk8KczfQvaKUS2+TjU7I8NGU5LD1ueMTQR0BxhAqVo=; b=bqwyhO/SAEWrGt
	GXrBnju7Rnl5ONUH0KBtJKWlye7GerPJu61uEhMCknX3jR6j/yqA5IAKfEf3u9JYqhYYtNnUY1tMT
	ATCYC4rHxXXlBpV3X5JfvdJLUq2wLjt7Dyc1ZxRAmWUf4nvNxPASciYgcPYx4RtBTirmrQkaRDX9i
	5RvKDwlJGPNEIQdPVkXeIEoc6Q+XbNd62sPK5O6WCLe0OeDQlpazFDiNs8KGJOXcOisjoxR0IFjkK
	KVTQKC9L97Q/WpW2s1pTfa3FvCzqJh1/bCYucj8lw6z1o+94GNMo/yoPYGLBKhGFRCFCoBF5XKRDY
	8je1ONy2AWn22obHCgog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikte4-0000i9-6E; Fri, 27 Dec 2019 17:43:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iktd1-0008Ev-50
 for linux-riscv@lists.infradead.org; Fri, 27 Dec 2019 17:42:25 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 836E624656;
 Fri, 27 Dec 2019 17:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577468542;
 bh=sA28e4/Vn28o0eBK2OtFILC07rU4A36VwG070Roqi1Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TiKHpEc6CjWZYqHnTSwrNT6baXTcn23/DRReuzfA9XS8TZUMxmDmnBH5smo1ha96M
 ehPvzrdCkn1N0u2vCUI6ia6pA8vZCNYLNODmvK+ehrpI7xlOCdF3zGXDsaubdsgEdu
 d+76EAmFFcvYvSbQs3m1aOdCaEKFlLWSLbIiE72Q=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 071/187] bpf, riscv: Limit to 33 tail calls
Date: Fri, 27 Dec 2019 12:38:59 -0500
Message-Id: <20191227174055.4923-71-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191227174055.4923-1-sashal@kernel.org>
References: <20191227174055.4923-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191227_094223_248615_794E23C0 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
 bpf@vger.kernel.org, Paul Chaignon <paul.chaignon@orange.com>,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 Mahshid Khezri <khezri.mahshid@gmail.com>, Martin KaFai Lau <kafai@fb.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Paul Chaignon <paul.chaignon@orange.com>

[ Upstream commit 96bc4432f5ade1045521f3b247f516b1478166bd ]

All BPF JIT compilers except RISC-V's and MIPS' enforce a 33-tail calls
limit at runtime.  In addition, a test was recently added, in tailcalls2,
to check this limit.

This patch updates the tail call limit in RISC-V's JIT compiler to allow
33 tail calls.  I tested it using the above selftest on an emulated
RISCV64.

Fixes: 2353ecc6f91f ("bpf, riscv: add BPF JIT for RV64G")
Reported-by: Mahshid Khezri <khezri.mahshid@gmail.com>
Signed-off-by: Paul Chaignon <paul.chaignon@orange.com>
Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
Acked-by: Björn Töpel <bjorn.topel@gmail.com>
Acked-by: Martin KaFai Lau <kafai@fb.com>
Link: https://lore.kernel.org/bpf/966fe384383bf23a0ee1efe8d7291c78a3fb832b.1575916815.git.paul.chaignon@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/net/bpf_jit_comp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp.c b/arch/riscv/net/bpf_jit_comp.c
index 5451ef3845f2..7fbf56aab661 100644
--- a/arch/riscv/net/bpf_jit_comp.c
+++ b/arch/riscv/net/bpf_jit_comp.c
@@ -631,14 +631,14 @@ static int emit_bpf_tail_call(int insn, struct rv_jit_context *ctx)
 		return -1;
 	emit(rv_bgeu(RV_REG_A2, RV_REG_T1, off >> 1), ctx);
 
-	/* if (--TCC < 0)
+	/* if (TCC-- < 0)
 	 *     goto out;
 	 */
 	emit(rv_addi(RV_REG_T1, tcc, -1), ctx);
 	off = (tc_ninsn - (ctx->ninsns - start_insn)) << 2;
 	if (is_13b_check(off, insn))
 		return -1;
-	emit(rv_blt(RV_REG_T1, RV_REG_ZERO, off >> 1), ctx);
+	emit(rv_blt(tcc, RV_REG_ZERO, off >> 1), ctx);
 
 	/* prog = array->ptrs[index];
 	 * if (!prog)
-- 
2.20.1


