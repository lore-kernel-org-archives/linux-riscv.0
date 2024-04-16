Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036CEC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 15:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJo3SlqGiiLzyeDFALO5hMlocshXSepRiuvZ4cV2kaI=; b=CADQbcdCVi14Du
	OnzBdmJ8KXOouj2XYMuJmNb+rQecpTdPI4o3tBOSajHzTiZ+AMBEPtrckVmMOTn+v5UZzejx35+VE
	+T0OzpWbR+hfIYj9WcAc1oaM2a14RECTPnrFQithmdmD2T3Fo+i0/yl6PbYGY9pvWZNuNifSKQVUz
	yqTve5RBnmNrAVxoVGH/doiNFWYz5LCPvscRwrLic0LjXRQi5riarV5bKkeC5s62sqrHtd6xPpv6+
	4NDLMrnfLA30o7kvPl7uuNaANp3tV5uGQpmZREhQHDs471pIUZulBfOZD6MUIwZNX6nPeKrAG6W37
	MPzuDWa524+vxJSKbT9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwklZ-0000000Clmd-3mxe;
	Tue, 16 Apr 2024 15:30:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwklV-0000000Cljo-0rfe;
	Tue, 16 Apr 2024 15:30:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9EA02CE10B3;
	Tue, 16 Apr 2024 15:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 559BBC32783;
	Tue, 16 Apr 2024 15:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713281428;
	bh=oPwvBqYAEpsC9wQTdQEO0Wb1hyID1ZhiUozjUzIHPTg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JyqcTz9TWcFq9sASdFXtkHiiKRTdh4GxySZDVog7CunMepoxTuFJrsh7amwhe6heJ
	 /4pEagaCTQ7zXryalI91kzSUMF6CkMHiv5lTcY3Rl9Sd93X9h2wqd7OZk0GMEwE5p5
	 dadBnBtp/vhCMvmULNQ+TJ677ExkFEzf6A7ZEwWf4YrGHxUPqQm3++iMwcyuesnj15
	 Kvc6W8yOZ2RdlrLAMzobt69vSCda0CsPA+BxEmMSqllzgmvrd+wiwkCUN1P1joi8h/
	 YP+6F1UZ4L82c4JLMn43rXkiMNhzjCw3LyHAI2izvsbAIKlOcs3+zrctQdY66jay3q
	 8+qVXJQg1Mf/w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 407E7D4F15E;
	Tue, 16 Apr 2024 15:30:28 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next 0/2] Fix incorrect bpf runtime stats for arm64 and
 riscv64
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171328142826.29407.1876399986836922707.git-patchwork-notify@kernel.org>
Date: Tue, 16 Apr 2024 15:30:28 +0000
References: <20240416064208.2919073-1-xukuohai@huaweicloud.com>
In-Reply-To: <20240416064208.2919073-1-xukuohai@huaweicloud.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, ivan@cloudflare.com, ast@kernel.org,
 andrii@kernel.org, daniel@iogearbox.net, bjorn@kernel.org, pulehui@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_083033_529701_24B2A453 
X-CRM114-Status: UNSURE (   5.95  )
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

This series was applied to bpf/bpf.git (master)
by Daniel Borkmann <daniel@iogearbox.net>:

On Tue, 16 Apr 2024 14:42:06 +0800 you wrote:
> From: Xu Kuohai <xukuohai@huawei.com>
> 
> Fix incorrect bpf runtime stats for arm64 and riscv64.
> 
> Xu Kuohai (2):
>   bpf, arm64: Fix incorrect runtime stats
>   riscv, bpf: Fix incorrect runtime stats
> 
> [...]

Here is the summary with links:
  - [bpf-next,1/2] bpf, arm64: Fix incorrect runtime stats
    https://git.kernel.org/bpf/bpf/c/dc7d7447b56b
  - [bpf-next,2/2] riscv, bpf: Fix incorrect runtime stats
    https://git.kernel.org/bpf/bpf/c/10541b374aa0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
