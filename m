Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BADC36012
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 04:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LczKsrT31TVNncY5XVF6YDPs3ns5K739Rc4rG8BmS2M=; b=rTWoIfnW/e5vVx
	E3SXofpr+pVpGIjLH75e6fQ9XaTkRhk5JJxyXNHukqRuAF+gDGFVW2Rgh2SHBrgcv5GjCZ34bA1Vm
	vYtEJz1hh0OhFOFFyBOTnMiQxuoc+D2EKcXr/g0Ub1UXvur7iqlBeqCAdlN87D20gvPYbj4w/dLYg
	OMidejCKHBDFL74hcfDdFRrMR8rxfvdTbivisT71pQyQ17yt0uygO13zQq1cFbFg00/TqOK2a2RvI
	KEIy/fGCAon2pDpGxOoZTNTwLqAkjzdNY3XsSkOtPDVFsPe6O0n+nbViXPeZ2kKrrTBrvGnlVIta1
	L2VSRVLIYdHJMk5AnVjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txf12-0000000A9tA-1t6T;
	Thu, 27 Mar 2025 04:38:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqs-0000000A4J7-3Uqg
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 03:24:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 12D77A41A94;
	Thu, 27 Mar 2025 03:18:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8449C4CEDD;
	Thu, 27 Mar 2025 03:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045857;
	bh=WzetoZhZ3xgmg7YT1JVI8VQIr1knizpmPZxAty/JhrQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MFQvA/7IvgHjr9FBj2XUvLSoh5DCWxLOPIdNMV41tZ/ibMnHjH/QwD7XVC+hGviCs
	 XWOOYdRLNQZQbpZkGUw9d08ZdR6lnHDfbzukv/PqwO0goKTKTgJ5Af+XqwwNgARw0t
	 04CtsnK0aUiTDc9CK5Ow/b3DP3igVDsrXtlInymy9HwOSLsEsCGQbJaMunNlludfrZ
	 GT9gtGkQiA+9YiJ7rk8Xi5juD+/3Ry0xHtXjK0c64ZOyYmBbm71C5gnx8aQPqeSna1
	 pAvjR2JKQsfcuux/GBwwyMQEQgNNqBegey99IZIKBeoQjV7yhJucnkzsARAMuF6x7I
	 M8ZzOlSxRlcUw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CE8380AAFD;
	Thu, 27 Mar 2025 03:24:55 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: defconfig: Disable Renesas SoC support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304589376.1549280.13761384336382427228.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:53 +0000
References: <e8a2fb273c8c68bd6d526b924b4212f397195b28.1738764211.git.geert+renesas@glider.be>
In-Reply-To: <e8a2fb273c8c68bd6d526b924b4212f397195b28.1738764211.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_202418_958129_FEC0EE25 
X-CRM114-Status: UNSURE (   7.62  )
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Wed,  5 Feb 2025 15:07:17 +0100 you wrote:
> Follow-up to commit e36ddf3226864e09 ("riscv: defconfig: Disable RZ/Five
> peripheral support") in v6.12-rc1:
> 
>   - Disable ARCH_RENESAS, too, as currently RZ/Five is the sole Renesas
>     RISC-V SoC,
>   - Drop no longer needed explicit disable of USB_XHCI_RCAR, which
>     depends on ARCH_RENESAS.
> 
> [...]

Here is the summary with links:
  - [v2] riscv: defconfig: Disable Renesas SoC support
    https://git.kernel.org/riscv/c/c2db83fe1033

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
