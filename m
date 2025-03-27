Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D22C3600E
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 03:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c67maqrqY36NEl7TVd6D9mJwO5vyl6ZZ3aoNMUH5Lgs=; b=FLxg+vbKcl34Nl
	P9EkbnAm4KkGCy9NweJHdwI1G+2v1rBbV4pLbT9OPFajRB58pTI7r6PKzh0nZ0PajF3D7zJIoyt77
	+Y7yORnPcs0WJAwVNTSCPza/PRnpfNQtkxyv0ZSpImEi3SZ8IDZVtyWLbFrxASw8Dqfbd/cQ1Nk3o
	wVKRm1wMN3Ek5JMPEUyAhEUysZkXkO9J82ZVzVEKmtkVMktRDgkh7NblL+v6WKpLlWzyonTdp/jCd
	rwGKd/8pjJd21mJ0i3Z59q7hB54fntdK3mNeoxWwVYpNVy5FNSsQEkBCPIK2GGNP5miOJJlb4cUst
	uZje5SBMu2CfYVmMAcFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqY-0000000A3yd-1T4u;
	Thu, 27 Mar 2025 03:23:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqT-0000000A3wx-1Ueq
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 03:23:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 235ADA41084;
	Thu, 27 Mar 2025 03:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0AD5C4CEDD;
	Thu, 27 Mar 2025 03:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045831;
	bh=MQhcmVMYslup6LMuf3wI469Rp6j+4KOBFl4QW6WH2ps=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cylU1Ld428ydr51w5e0flPy+LqyTLOSg2LlqPrpePd5oHB8HePBVwPJbhH9XxUx8B
	 uZTTg2t1jgl/XxBxmQsPpjD5bqcRmrDRy0G9sxbtnIs9qXqcFMs0iWrufDlvrf3Ch5
	 axLZt4jcoiZ9ofb+dZjuV56junB8mrZsNLryoFt8HMl7y7sAOho5WeiKr7W8jlztE8
	 S5Ola6+X3xZDtcO6uNsfo+D7t+WWrBAnNJZcGScat6gLuyhTqDZw+l211Gj3Mcr9JC
	 eQ9rUvzjqUv3K9jyGjovklgZc+hFL7FwusGgs1kqbkHm5y0M+YMz2qA+lpbrc/BzeD
	 w6GnP97Jl3sSg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CE7380AAFD;
	Thu, 27 Mar 2025 03:24:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v10 0/2] riscv: Add runtime constant support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304586800.1549280.4422095379937225029.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:28 +0000
References: <20250319-runtime_const_riscv-v10-0-745b31a11d65@rivosinc.com>
In-Reply-To: <20250319-runtime_const_riscv-v10-0-745b31a11d65@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, ardb@kernel.org, ben.dooks@codethink.co.uk,
 pasha@rivosinc.com, emil.renner.berthing@canonical.com,
 alexghiti@rivosinc.com, rostedt@goodmis.org, mhiramat@kernel.org,
 mark.rutland@arm.com, aou@eecs.berkeley.edu, peterz@infradead.org,
 jpoimboe@kernel.org, jbaron@akamai.com, ajones@ventanamicro.com,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_202353_461202_A7F10BC0 
X-CRM114-Status: UNSURE (   9.71  )
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

This series was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Wed, 19 Mar 2025 11:35:18 -0700 you wrote:
> Ard brought this to my attention in this patch [1].
> 
> I benchmarked this patch on the Nezha D1 (which does not contain Zba or
> Zbkb so it uses the default algorithm) by navigating through a large
> directory structure. I created a 1000-deep directory structure and then
> cd and ls through it. With this patch there was a 0.57% performance
> improvement.
> 
> [...]

Here is the summary with links:
  - [v10,1/2] riscv: Move nop definition to insn-def.h
    https://git.kernel.org/riscv/c/afa8a93932aa
  - [v10,2/2] riscv: Add runtime constant support
    https://git.kernel.org/riscv/c/a44fb5722199

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
