Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BA4C636D7
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 15:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00N4UqHsRLvmyq8H9BNOxbdYrfOQLcRBRdksPe4mhmQ=; b=qvdy0lnBTcmj+l
	LuxJDf7tV1vu3oP2Z8pyRU8cq9ZSntT7U1dsv5ZR1+ADjBSRRfzaBkC6h4797P194rG7sVvXTMmmg
	pgBkjDH3BS9Fnga4qGUF2G4EoD2h5ttig4RrTo4rptUYSWOU7bnKZQiSRoB/WFWMFDy26urrrdhn2
	Y261P3dJwFKHCcTwTPAF93X0xFh/JVoCAEFw9Su9VqH7CGSuugVHHN8OfTUpNmG4hB+qBjnCsrC1f
	g/wA1vk1mAnm2iQ97SeG5EOIceO5zRMbF+1I244bEie7/fcCJBciFWnAdNuML5UbOFVq11P2DfMbj
	EDqtvNJmrZLJoUhbyDiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJGl-006IxP-MR; Wed, 15 Feb 2023 15:00:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJGi-006IwS-Fe
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 15:00:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2CBF861C44;
	Wed, 15 Feb 2023 15:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4E0BC4339B;
	Wed, 15 Feb 2023 15:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676473220;
	bh=bFui1Nv/gPLHGVLgr6OZmJgykMB4++rCHmtubzlyLKg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=is71kKYLPs3i17aVGQPtOB9ltgLTwSX6Bw0xwAAoMxOZH7esJVYw9mAF/k53UTAao
	 MulL4EMd9x+U2pP4C/Y+jBpSriRp8DoyBjoT8L0Ala6YeJdSGoWb+h9JFtfISFu2uY
	 ATZ0pkyAO7/UYTd3KiZfuDqPnfSuT3KYblz9bNd0MzNyxOsAbvWOPnSeRHEIFFQRcc
	 IGWIAz1YB3ncsz9c7GiEmz3adnK/BFB1fSMS38rm5JY8KPQBCzTVay0rR1wfK/2smG
	 Z2Xlby9gXOCeO7Tk+nYJXTPxioI3xscf7WwRq9xnWPn6OSfH8/kzNbC+zyD/BWYPV0
	 qMItikgPg+GqQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8854DE29F41;
	Wed, 15 Feb 2023 15:00:20 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] Documentation: riscv: fix insufficient list item indent
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167647322055.11521.14296165976216354601.git-patchwork-notify@kernel.org>
Date: Wed, 15 Feb 2023 15:00:20 +0000
References: <20230129235701.2393241-1-conor@kernel.org>
In-Reply-To: <20230129235701.2393241-1-conor@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 conor.dooley@microchip.com, linux-doc@vger.kernel.org, corbet@lwn.net,
 lkp@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_070024_601668_9FAC35BA 
X-CRM114-Status: UNSURE (   9.28  )
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

On Sun, 29 Jan 2023 23:57:01 +0000 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> When adding the ISA string ordering rules, I didn't sufficiently indent
> one of the list items.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: f07b2b3f9d47 ("Documentation: riscv: add a section about ISA string ordering in /proc/cpuinfo")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> [...]

Here is the summary with links:
  - Documentation: riscv: fix insufficient list item indent
    https://git.kernel.org/riscv/c/2a5303b499b1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
