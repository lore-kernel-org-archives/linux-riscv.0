Return-Path: <SRS0=Hhyj=7V=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F3D9C433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2020 23:13:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25DCD20B80
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2020 23:13:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QuPKY0cF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="AB2x00QQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25DCD20B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EkKGUJi847ZVYRroIctEfxsrydJW/qvSQCFgRykvjC8=; b=QuPKY0cFAy5EhR
	tmNGldlODtG5+49qFlyg3wqFkW458C9DCz+jF9sbYnxG0v+AX20ofi22GtzpRBFk8qt+9rTnIwG85
	OauTLyTkKhlAYqG04BCdEzRqy1H/GQe0xURbwVB/zCOxFBTiCPaghLB2vFWV5OHS5WBAFQW9xWXCN
	0KeaCCp7AtO+PaP76RJN3suh5wNFNiM4jUv/dQSjyr8CFcYiQrDQRghC8V7oTtBwCPnIoQ+N4MBle
	EmdS0Yz8HcBii297hxAALvrxqWJJAPbPeXHt268phUlWTuc11z7R1P724ML0dVgAc2q6ZACCsNXmd
	64b2jV9f6t2BQesWdAkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiQx9-0006an-SJ; Mon, 08 Jun 2020 23:13:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiQsv-0000D1-0c
 for linux-riscv@lists.infradead.org; Mon, 08 Jun 2020 23:08:54 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6ED9D2085B;
 Mon,  8 Jun 2020 23:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591657732;
 bh=fK82cI40GO1yH3Ip1kLba1zXWfkLTxYg+MFpEbXh69w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AB2x00QQzebqBsUwR4YxJzpr5+xeA8I+kaWTScWv1pvzB4lZ32TZQhAQ72rT/0Htb
 iYMGZaiSMGr4z7ARXLCAUdlKvhYOxRin5QoowGhMP6wiqZswdRHKYnI2JDZ92dWtE7
 6L5THfCOknEfk/y7lgBM629S6VtZ+NFlKLGNfXbU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 123/274] bpf,
 riscv: Fix tail call count off by one in RV32 BPF JIT
Date: Mon,  8 Jun 2020 19:03:36 -0400
Message-Id: <20200608230607.3361041-123-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608230607.3361041-1-sashal@kernel.org>
References: <20200608230607.3361041-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_160853_086383_F290AD23 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: Sasha Levin <sashal@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>,
 netdev@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 Luke Nelson <lukenels@cs.washington.edu>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, Xi Wang <xi.wang@gmail.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Luke Nelson <lukenels@cs.washington.edu>

[ Upstream commit 745abfaa9eafa597d31fdf24a3249e5206a98768 ]

This patch fixes an off by one error in the RV32 JIT handling for BPF
tail call. Currently, the code decrements TCC before checking if it
is less than zero. This limits the maximum number of tail calls to 32
instead of 33 as in other JITs. The fix is to instead check the old
value of TCC before decrementing.

Fixes: 5f316b65e99f ("riscv, bpf: Add RV32G eBPF JIT")
Signed-off-by: Luke Nelson <luke.r.nels@gmail.com>
Signed-off-by: Alexei Starovoitov <ast@kernel.org>
Acked-by: Xi Wang <xi.wang@gmail.com>
Link: https://lore.kernel.org/bpf/20200421002804.5118-1-luke.r.nels@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/net/bpf_jit_comp32.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp32.c b/arch/riscv/net/bpf_jit_comp32.c
index 302934177760..11083d4d5f2d 100644
--- a/arch/riscv/net/bpf_jit_comp32.c
+++ b/arch/riscv/net/bpf_jit_comp32.c
@@ -770,12 +770,13 @@ static int emit_bpf_tail_call(int insn, struct rv_jit_context *ctx)
 	emit_bcc(BPF_JGE, lo(idx_reg), RV_REG_T1, off, ctx);
 
 	/*
-	 * if ((temp_tcc = tcc - 1) < 0)
+	 * temp_tcc = tcc - 1;
+	 * if (tcc < 0)
 	 *   goto out;
 	 */
 	emit(rv_addi(RV_REG_T1, RV_REG_TCC, -1), ctx);
 	off = (tc_ninsn - (ctx->ninsns - start_insn)) << 2;
-	emit_bcc(BPF_JSLT, RV_REG_T1, RV_REG_ZERO, off, ctx);
+	emit_bcc(BPF_JSLT, RV_REG_TCC, RV_REG_ZERO, off, ctx);
 
 	/*
 	 * prog = array->ptrs[index];
-- 
2.25.1


