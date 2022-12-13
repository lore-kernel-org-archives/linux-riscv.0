Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48C4C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 16:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rz+33PYhD1dB5IpOr7XKzX7AEzBp0lhwHoTZ5ZAhUQE=; b=IgDWhU3GjebNQA
	hH06ZuA9EcNTU9+yxpp79iFR7CRgCt780ul6NR8+dg7HmzNkwPMgtBFfpdV/ewybOG8uNrA1LCOsR
	pnowMTbgvPESA54V8jRMHEWR8+cw0TYlUxW2lPWeOPXbEfhK3x4yOoOCaqLHLrpgpbEyja0T9syMY
	Q5HRNSPwiIqdKiP2ByWwTqWVy7yM16jDUNN9tbNYvLjydUKojfo2uOEoC+n7ACIazdqdv59ixONZc
	7d9Rlu6c8jSXOBoOhBbjKNlkuPnHjPLNoITzC+rOZvxi23xwxEO2AjfdQGKp0Dm+VNFjSo0kN2dvj
	hNJHaNg731jmgTeAgKNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p58Ag-002r4W-5C; Tue, 13 Dec 2022 16:30:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p58Ad-002r2g-Gb
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 16:30:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 269DFB81263;
	Tue, 13 Dec 2022 16:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E746EC433D2;
	Tue, 13 Dec 2022 16:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670949016;
	bh=LloHy53SbXLXbE3aV7SnS0epf3d4eEaPG0nvPWm1AfQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ajLW80LQJ3VakJm1vjQtecugwbpUXmVGTeOltV/ruIhdblqugqrCiSNPTuS5u0KxQ
	 +AoXgGKh9IXYpmjNSUbqWDDgfThQoOC0GzictRr7n1Y3EJ/nKg9G531pGCQw5RWrKH
	 dWOi0nZoFHH9czhdqyO7QFd41RZuwKMSrdkx9W8saAaY1BikzPiZUQJyU+ie75EVYn
	 hZe/in+IWMD2AOaeE2m072RgMAtHKWVwExE8N/7go2Cj77QhjyBLIMVV6G+zJklC72
	 9fR5KNR9zkX2JFSRV3KvwfDe5flMLJKBqmFA63/NLhDstGpe3wRG0RVaYokLroUEUR
	 CHGJy/GgMt/RQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C936CE50D97;
	Tue, 13 Dec 2022 16:30:16 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/1] riscv: Fix P4D_SHIFT definition for 3-level page table
 mode
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167094901682.29011.15971870673116736802.git-patchwork-notify@kernel.org>
Date: Tue, 13 Dec 2022 16:30:16 +0000
References: <20221201135128.1482189-1-alexghiti@rivosinc.com>
In-Reply-To: <20221201135128.1482189-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, panqinglin2020@iscas.ac.cn,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_083019_713716_B0166BE5 
X-CRM114-Status: GOOD (  13.02  )
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

On Thu,  1 Dec 2022 14:51:27 +0100 you wrote:
> +cc linux-mm since I'm struggling to know how bad is this issue and
> if this should be picked for 6.1-rc8 or not.
> 
> I tested this fix on an Ubuntu kernel in sv39 mode without any issue
> but the version without the fix seems to work fine too, either this is
> not a real issue or I don't exercise the right thing to make it visible.
> 
> [...]

Here is the summary with links:
  - [1/1] riscv: Fix P4D_SHIFT definition for 3-level page table mode
    https://git.kernel.org/riscv/c/71fc3621efc3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
