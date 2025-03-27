Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6B1C36016
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 04:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YwyJj1zTW+BmNZO9DNrdL1SfYQ6+inFWuFQCeReR+mI=; b=4ey9UkV43DSsS5
	pKyylEj1VFEu+IzqoQscuauxiwx4ui3aIWLR4mJV7qgksI61dBB24B0sf9vi7yecn+NYcJip3QsQB
	3j313AQqYzEN3LjVYBTty+XJCEZAZs0OOPxVAPfvDCISUXZXg3BL4PprXe0FKe3sFB4tVpejG4/DI
	KzIvLulpMdOyD48t9fg6xLiU2veKKirjutsMTxx6A2xKDx7nlP2yizM6rz5LBxqF55n6KgFLNshWG
	AilC3l+dzLZsMvOck9vi3DetOeHoxFPMSdp9onwuAk7CK8DUKWTFqasB6UFoCBfm3KXUBQ92iqq8J
	Gwr6Q6RUpxOQK2+JjR6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txf17-0000000A9wl-2IAF;
	Thu, 27 Mar 2025 04:38:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdr4-0000000A4aY-0c7G;
	Thu, 27 Mar 2025 03:24:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7ABCFA41ABA;
	Thu, 27 Mar 2025 03:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D112C4CEDD;
	Thu, 27 Mar 2025 03:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045869;
	bh=GMWGFlfqXsIrDR5aUMYGk61kFRdCVSidy91sgsWSi0A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QwD9Oer0sNtwY2gMQPv8ziVxIeWCDyZx7MLkWbceo6hRAL3VqSSeLN6TJJHub3M1q
	 1+jCUY31MUE7mkMXcUZjhUPa4qMe3HGWPaej9dgx8NXQvfUXm5uwWPHVn0bAR/zTVz
	 /9gJPJuW1j4JM2poQpyb7BTY4RfAB/prFyfJIR1uYzTOhLjcRm7FytaoHSlZsdVyNu
	 +E0lO6UxifCwUettv3IBzCOtLStwIrjA17dKqdi/hhw+eXFsxEKeas0fugjkPqUQdn
	 zN1xDPRwJMWvUreFAsOLH+7iAP5q5NmqldUP+1uM9scVk9iM6tw/tOBSp1m/hysSer
	 dFmpZElY6Cspg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADBD7380AAFD;
	Thu, 27 Mar 2025 03:25:06 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Remove duplicate CLINT_TIMER selections
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304590525.1549280.12521028074935026513.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:25:05 +0000
References: <448dba3309fe341f4095b227b75ae5fc6b05f51a.1733242214.git.geert+renesas@glider.be>
In-Reply-To: <448dba3309fe341f4095b227b75ae5fc6b05f51a.1733242214.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, dlemoal@kernel.org,
 anup@brainfault.org, atishp@atishpatra.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_202430_267594_9279AA3B 
X-CRM114-Status: UNSURE (   8.29  )
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

On Tue,  3 Dec 2024 17:15:53 +0100 you wrote:
> Since commit f862bbf4cdca696e ("riscv: Allow NOMMU kernels to run in
> S-mode") in v6.10, CLINT_TIMER is selected by the main RISCV symbol when
> RISCV_M_MODE is enabled.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/riscv/Kconfig.socs | 2 --
>  1 file changed, 2 deletions(-)

Here is the summary with links:
  - riscv: Remove duplicate CLINT_TIMER selections
    https://git.kernel.org/riscv/c/72770690e02c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
