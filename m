Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C578EB64D9
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 15:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2HYrQqdH4kC86T/coEaJAg1CV7fhiFr0GlJhqYIw7M8=; b=SCdtKWKVChC45g
	0MEL4eZ0rZWXWpfVC+dPF2CgqjqjGgsTw9SMauhT+Nj0rWUW/BMvv4MN+X5xLgvJMWe1jYsgh3uxF
	3OuCjrT1EMkXWONETWh367jmShHyF31nHLblK+4ELExZJovdR7nWtLRo+TnqGS2gPYPuLye/SE2b1
	0AWVLIgmq7196s+DFFVf6tYyJJAR2IqSFLKocg9i7+Uy9eRzHMhDKE2XzXdYZ7Zb2/H44K3s7GYHo
	zvXCsH2uwXPnQ0WjbRI7GrehSFSTk36w7MGaVCOcK60hfApWQaoO1RR0SlKwzLfZNS7rjm7fNfUFM
	FRP3U2e+M40OfT2v+iQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHn6J-004zEB-2c;
	Fri, 07 Jul 2023 15:10:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHn6H-004zDE-17
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 15:10:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1BA7A619F2;
	Fri,  7 Jul 2023 15:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7BF51C433C9;
	Fri,  7 Jul 2023 15:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688742623;
	bh=0zVXLprUpQU+oJMwLsb3lwhShv/mpv3ilpjhA5PWGGg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ubXCBmIX/zxWd+xAxTItNg8C/lpNTMnHDkxZ8jv85smVGtsy6TXYKwKYoCIJog2xb
	 wMg1czLeDcNHofMPP+0sKukLLTiWH51ZjpNfeGCih6jvp5bqe40a/UEvXubTggyz7c
	 Vhvri0hkV0FG2wfd2Jq9O29hKVl8loXlbdIp2yEk+mgP7VYW7yAl8Fzl7UFbEfH+xB
	 b+rOcUPr8oXn9H6F/P2LraUeNG2y8HQh+JeBz2cGvdVWzemUCqOiKRpCqbdJUqakrS
	 OH7mNhY3H8Q3gBDmbwNcDqUO6GO4TGHgXoGh8SfnUnI7n2DzyRuVK4ag4OpNwzSNBM
	 qgWJcTEGAg+YQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5CF07C0C40E;
	Fri,  7 Jul 2023 15:10:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Select HAVE_ARCH_USERFAULTFD_MINOR
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168874262337.15275.12046013710547039140.git-patchwork-notify@kernel.org>
Date: Fri, 07 Jul 2023 15:10:23 +0000
References: <20230624060321.3401504-1-samuel.holland@sifive.com>
In-Reply-To: <20230624060321.3401504-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_081025_432352_688A2D50 
X-CRM114-Status: UNSURE (   8.69  )
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

On Fri, 23 Jun 2023 23:03:20 -0700 you wrote:
> This allocates the VM flag needed to support the userfaultfd minor fault
> functionality. Because the flag bit is >= bit 32, it can only be enabled
> for 64-bit kernels. See commit 7677f7fd8be7 ("userfaultfd: add minor
> fault registration mode") for more information.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> 
> [...]

Here is the summary with links:
  - riscv: Select HAVE_ARCH_USERFAULTFD_MINOR
    https://git.kernel.org/riscv/c/a2492ca86c98

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
