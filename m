Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9537C3DA63
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 12:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wkhCg4RF3kQKpWQNymq/0YZxPgM6qlmn6UFt+ExtSug=; b=e5hYutbPL3Yzww
	oXJaB7TFuIqRb5gSCS2tBWC2yzKMGMuxoXbsbJSBHC1n9KCyyPMS+WeCh9aX2+RYTV+Yt66RRhPcc
	BfGS0E0SuM3luLdKnauBOo1NBD1V/jm952I7SPtzw1qGzLyQUqqdhPtHhg4Tw+XiuoX9OnEgJnRw2
	rpkluJIvXIksbIeKUujyFBZiluQ62bNmFVOVDA1PVhzwMzzaSBPTpyH1/NL0xOWHXb0ItjCQ4TJfK
	dVRJBjTUuY2OekckWXV6+PckfEpPZ4vTWkYyYic84v/6u2b5wN6Of7cdmwIijg/dS7Mi29eIQA/3D
	Mp08mLUNOa+oUGdq68Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWF7B-0000000CRl4-0KWL;
	Tue, 23 Jul 2024 12:59:37 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWF6I-0000000CRIb-1ABQ
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jul 2024 12:58:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 00639CE0B08;
	Tue, 23 Jul 2024 12:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76694C4AF12;
	Tue, 23 Jul 2024 12:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721739516;
	bh=Tze2ALouysJNEmGp2FNtBakloN2kVqPKlYAXAJeH8Ow=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VbOd6yJKk0vLB+UClJR/+FCf1Ndh7/6ZjNuOgUEUGrl8lQm/vw8K+wOSHuiBJjwnO
	 UFTwPY63vd2Q9U7erz44Ji/nLdMol9WS0Vtc26R+vdCK1zTUncu0E56wrnWm5eCxdp
	 yXCnlU3mnnmEPDLU88A7h1lhS9WZlwZBwBag7a5wB6umDKB2CfV7E/tQsaH7Xcft16
	 WuKGc2/aCDEh176HLdPdNmukyMAgIHr+L2w3IGzPY+6S0jc4OWItlJZBQqERVPCzht
	 +BkNb+41HCOmpBWAlQ4RAG9fZqjDoEyuI+/80tJbESqF+xJgWe6EFv3xKieITcAFT5
	 r2sEnX04TQK6w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6933CC54BB2;
	Tue, 23 Jul 2024 12:58:36 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next] riscv, bpf: Optimize stack usage of trampoline
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172173951642.10883.11057688804753906770.git-patchwork-notify@kernel.org>
Date: Tue, 23 Jul 2024 12:58:36 +0000
References: <20240708114758.64414-1-puranjay@kernel.org>
In-Reply-To: <20240708114758.64414-1-puranjay@kernel.org>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: linux-riscv@lists.infradead.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@google.com, haoluo@google.com, jolsa@kernel.org, bjorn@kernel.org,
 pulehui@huawei.com, puranjay12@gmail.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_055842_626711_18365F2D 
X-CRM114-Status: UNSURE (   8.33  )
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

This patch was applied to riscv/linux.git (for-next)
by Daniel Borkmann <daniel@iogearbox.net>:

On Mon,  8 Jul 2024 11:47:58 +0000 you wrote:
> When BPF_TRAMP_F_CALL_ORIG is not set, stack space for passing arguments
> on stack doesn't need to be reserved because the original function is
> not called.
> 
> Only reserve space for stacked arguments when BPF_TRAMP_F_CALL_ORIG is
> set.
> 
> [...]

Here is the summary with links:
  - [bpf-next] riscv, bpf: Optimize stack usage of trampoline
    https://git.kernel.org/riscv/c/a5912c37faf7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
