Return-Path: <SRS0=LL44=PU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78462C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Nov 2021 16:20:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46EF46113D
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Nov 2021 16:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46EF46113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vzCE1Hk1zpf4u1TVpDv658EdDfozlhYh7YjNmvboXQs=; b=Zy1sES8A58VDRb
	54aqGD/8/2CUvBCSSOUEC0umHpZ9eIi5l3DvII6lHkAXnp9K3nSg8Rf1KQiN+RgR5qp33Mp9/2Qo3
	TYpf+tp+wjF7Pa8Vi/2fCdbhH45W/mJltnhRkJZJY2VVjtcTorBTrmZX43NA9TYvn+Ghfc1k7E4rZ
	7b4cMtbKw/jAHBjbzo/+HpCgtQKOGzEdzbP1+C7g52qTBjbukVQA/N+bdX/YEUY5D5gimemPh6ngq
	e85KCciRhe15pv29sdb9x+xLNCuTlz1kvX40HuDQ2B/IkD3ss2IP1lAuyhvQH/2+CuSQ/pgCUAqm7
	4fAq5tavxXYNY1abE2ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mha2e-00GlQf-Nd; Mon, 01 Nov 2021 16:20:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mha2b-00GlPP-Il
 for linux-riscv@lists.infradead.org; Mon, 01 Nov 2021 16:20:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id BA7716115B;
 Mon,  1 Nov 2021 16:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635783608;
 bh=hUZM1gaPOjZAlPgpNZ5sCi4NaVWCN9ntfJOsTV3J2Aw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=G1J6hxyOhppDDNCQOAkMSfAexH9U0Srb9rS4GlBN/44v1hcO7AfPbtoiNaiorSV9C
 jXiDnOGPH84mVVXoDsNoYVGtpUZ6UbenFstv8ejJJdvgz3UKDL8mZny/aJrLeu6Dvj
 CwchYAx65f1Lo/gUEV4Sn7mEgTT+bSBZ/feSqkW36+bq/uDl0dGyPBUCXYwIny+R18
 JSxgBGq5SLfEdetLbALwpzRNlkYoI2WXsAj8bfUoEgkeG7pH5EDbmaDk92EQWw1V9W
 Og5/Q9/KI3ysZd69NIDItaeXzAcWrV48lgKUcwVWm5SSZHIcpxndwV0VblwTX4n4ql
 u7kR2w6ZLuOVg==
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2 0/4] Various RISC-V BPF improvements
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163578360870.18867.4815897974014023266.git-patchwork-notify@kernel.org>
Date: Mon, 01 Nov 2021 16:20:08 +0000
References: <20211028161057.520552-1-bjorn@kernel.org>
In-Reply-To: <20211028161057.520552-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@ci.codeaurora.org
Cc: ast@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 bpf@vger.kernel.org, luke.r.nels@gmail.com, xi.wang@gmail.com,
 linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_092009_663554_74C3F05A 
X-CRM114-Status: UNSURE (   6.66  )
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

Hello:

This series was applied to bpf/bpf-next.git (master)
by Daniel Borkmann <daniel@iogearbox.net>:

On Thu, 28 Oct 2021 18:10:53 +0200 you wrote:
> Unfortunately selftest/bpf does not build for RV64. This series fixes
> that.
> 
> * JIT requires more iterations to converge
> * Some Makefile issues
> * bpf_tracing.h was missing RISC-V macros for PT_REGS
> 
> [...]

Here is the summary with links:
  - [bpf-next,v2,1/4] riscv, bpf: Increase the maximum number of iterations
    https://git.kernel.org/bpf/bpf-next/c/4b54214f39ff
  - [bpf-next,v2,2/4] tools build: Add RISC-V to HOSTARCH parsing
    https://git.kernel.org/bpf/bpf-next/c/b390d69831ee
  - [bpf-next,v2,3/4] riscv, libbpf: Add RISC-V (RV64) support to bpf_tracing.h
    https://git.kernel.org/bpf/bpf-next/c/589fed479ba1
  - [bpf-next,v2,4/4] selftests/bpf: Fix broken riscv build
    https://git.kernel.org/bpf/bpf-next/c/36e70b9b06bf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
