Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3A8E77197
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 16:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8igYO2MsuNGdFZrKvNzYI6YkEXbTojjgIKb6nHDffA=; b=ul8OjDXlmQu+9G
	JvM8z8bwLPsfSJb5z8+XDvOIykkeLW0gC+ydiBp7UcvZW1+SZ/1e7nQrl6f5jPH2XuUnApJXXSgOY
	XvR4J/cx5cAFiURqhux58gqwd30bA7M4imRe5WEGBp4j3auqwKlRb1o131m0SbsFM2nVTL0Nj9URM
	cHcQYyDIn3RY1Jub2vFQHNox7+KKl0RtpDs+BtAV4ZZJRAuRXjESSqLrq80nR76nn8o9MnGK1tdfx
	8EC4lSkRu10/s+G/2k/B5chJ8lzhGuMzJy5L1qW7oGn7VYaOzBExXpPZOOZJNJGgjeYP8XetRmA5l
	Z7TmOGlRLvQFvMTz0ecQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvD4-0000000Cdtt-03Y0;
	Thu, 09 Jan 2025 16:16:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvD0-0000000CdpC-3yHl
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jan 2025 16:16:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 690C55C5CA1;
	Thu,  9 Jan 2025 16:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EBDBC4CEE2;
	Thu,  9 Jan 2025 16:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736439394;
	bh=Zo7aTOtZCMStwlV1MSIJvJFOSy8vRrar/tAe79yAyhU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SYVPElq4zT6WHFOju/lTErEjyjfJquwPFUHDOhoXRCUk6tyEjFvnAwrSsCOBjF1yG
	 1131S4SIa5l6zKHKhHvVYy9rfe4BoZiZtvqT9dFjJTYwo3zJv1XhAD2WzGw2OGuGpC
	 pgNDSv3LdqMBLE7mZhQNDOvAcmgTzlya6RqXpi/FgEb1ji2M+G6RRKj8F/ePth/OYa
	 cxtsPOolEEJv7hc1fDYpLfy1KpGyiPzqw7lMqmn7Q2KxhyT/VPbtNEAu8DGfKI9YYJ
	 v+GLxUQii3vtyHi0/itAKavO+JK1nx8F6FeYHRs30H2qL8QkcsHjF1RawR4ew4XHFR
	 l4VrXHKmXGkYg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F6B380A97D;
	Thu,  9 Jan 2025 16:16:57 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: kprobes: fix placement in arch_prepare_ss_slot
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173643941574.1375203.12231684795461714656.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jan 2025 16:16:55 +0000
References: <20241216130544.706110-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20241216130544.706110-1-ben.dooks@codethink.co.uk>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, bjorn@rivosinc.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_081635_077243_E2F80B72 
X-CRM114-Status: GOOD (  10.84  )
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

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 16 Dec 2024 13:05:44 +0000 you wrote:
> The second patch_text_nosync() in arch_prepare_ss_slot should be pointing
> after the first instruction, however p->ainsn.api.insn is a pointer to a
> probe_opcode_t which is 4 bytes... this means an instruction of length 2
> moves the pointer by 8 bytes.
> 
> This means a kprobe may fail to work and recurse into the bad instruction
> handler (which then itself fails as the original lock still seems to be
> held?)
> 
> [...]

Here is the summary with links:
  - riscv: kprobes: fix placement in arch_prepare_ss_slot
    https://git.kernel.org/riscv/c/13134cc94914

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
