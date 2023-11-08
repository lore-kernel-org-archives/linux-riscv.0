Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34987C04A95
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Nov 2023 15:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BnfnGKYckk9ju2gyfvUqsAQ+nJc4YCkXAz4EABDWcTo=; b=aCspdCeHsPVGMp
	JBXeH13Xjkt1xx32EnYxxaOEdxnVPyGxidX48MXETCFc7TQGNwR6vK+/bZTIFb44Km2SPzAxBuwhu
	Hi4x5ql8cwrS6PQe4Nxz3EpIj+s6haKUjAEks08MZ5jn1R0BLM42XyM09hszyCh30vjXQfsKXpXoN
	6mregWZuI60/LbyNM/uSBb3zChor2Sow3zNEJdD46vogm0qT7EDjz50S3HDB3pzj9TTShIliXowrU
	BXM8/A/bbLyIUY5IITjABD6ixL692ALD99OZmeUqijB5Dh+4gZCjEydDjiEnZID9A1xUSRtRWoGUh
	cVElh5gHB23X94zTD39g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0kCR-0049cE-0Q;
	Wed, 08 Nov 2023 15:10:35 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0kCM-0049WT-1p
	for linux-riscv@lists.infradead.org;
	Wed, 08 Nov 2023 15:10:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CDD94CE10F6;
	Wed,  8 Nov 2023 15:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3EDDC433CB;
	Wed,  8 Nov 2023 15:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699456224;
	bh=C/DziRIHGly0hzyXBjvR83dpdc5msI2/7d6N6DBgPFM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=u45mpJzUveoEKJRCvgNvyEs4l8ENyIuLOplGFiEcX1K07VGWlpm2yPp9p4eg/nrX0
	 CYi5FMX7MRM7zF8s+rDsWLGcaBDVtUZB0YM5EW+Js+5qpoVmuUv4K5E3yPAt2tTuXW
	 FEgG3+UAqgLT80O2RJXZf8EwUs6kTWKfyL4coCdLjKxfpLQ20sdmzDBmL9asOfrXOq
	 ZX72v9eanVnxVQgdhhu3xqnL4o/PiNVTuPtaoayPesmX5DPmJEGZ2lGbEbuVnmENvT
	 O8d/Uj4KPI6jlZgvlup51XfiFijGK1+a7reeiKYWfU7yu3slIT4t2uLHdh/dLlbgQO
	 qkX0MK5zTU0Ug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DAB7FE00084;
	Wed,  8 Nov 2023 15:10:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: Remove __init on unaligned_emulation_finish()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169945622388.21527.8406137134389161734.git-patchwork-notify@kernel.org>
Date: Wed, 08 Nov 2023 15:10:23 +0000
References: <20231106231105.3141413-1-evan@rivosinc.com>
In-Reply-To: <20231106231105.3141413-1-evan@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, palmer@rivosinc.com, cleger@rivosinc.com,
 aou@eecs.berkeley.edu, bjorn@rivosinc.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_071030_804163_61B744C7 
X-CRM114-Status: UNSURE (   6.84  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon,  6 Nov 2023 15:11:05 -0800 you wrote:
> This function shouldn't be __init, since it's called during hotplug. The
> warning says it well enough:
> 
> WARNING: modpost: vmlinux: section mismatch in reference:
> check_unaligned_access_all_cpus+0x13a (section: .text) ->
> unaligned_emulation_finish (section: .init.text)
> 
> [...]

Here is the summary with links:
  - RISC-V: Remove __init on unaligned_emulation_finish()
    https://git.kernel.org/riscv/c/6eb7a6445b76

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
