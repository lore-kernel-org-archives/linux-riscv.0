Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127FBC25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 23:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SoLUB16nu/hd/tOZKz6U9No+wWlyyoww8wTz76qqrWo=; b=yIyn1wdq+M6sdn
	Je9oT/n9/4YapGGgeEySJ22Zdb+CQG2S4S3Ch5GQPp3NfA2T6yF828xyV7HQ0IYh+zfbW/lKeAGmg
	DVoH1sPhXY2jmCymzAP0UVBNSRNWKJTgD6yIXCq1p/LYxAKeHwpfKA0HLvi1FJ8I8d6+K2VB//GEk
	cZkCty+WKC11sMfMHtO0BZQ2AjI3AXv4fnsN+ycANS/pvzYhOYKm0xcgpvom39eM4jBeunKH7Mdj3
	fWsF5eqiQ5RgGw10UC0s0KfhuGf2kR2DHDwublV2lcXGLLOLyE9Cz6A4fT3LNWBu9qirwzNvsADlB
	pNaUt6wm8gMpzNFpUyxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vRe-00000004RUp-1BZV;
	Wed, 22 May 2024 23:32:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vRZ-00000004RRj-2MJ7
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 23:32:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6F4FC62BFD;
	Wed, 22 May 2024 23:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0791C4AF0D;
	Wed, 22 May 2024 23:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716420743;
	bh=tEHrjijHfI1dW0qehjRUeQTBRs2hxXM4LHxZP9ugrHc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bMFLPMK/srok+FyjdHtbHkP+ZgL5XHdr2nMDlz3R/AiQk7J6GWWuCYpHf6Hc4QEGj
	 YNcTJfbYyYqyQ/EOjlGQ1OMPsBJbP24gN7+b5fQQ/ips+o4jGvIAuhfLhP0bq0ZnRK
	 aXdQzA+eTgDk/wDII14GbvuaUNUCDV+HRTY9EE9DoygEw7sZAFKeBWAa5eixwP+5R+
	 9VPI/VbwsXbg4rvK2YNLfNWmwwbukxfZzhhVp6Iwe42YwN4L48ri9oMXnAXM74UT2K
	 Vu5P2+0QxQDzzp9AZzwBuTI9w24o/w9wSD4DshN1zkLczfdE4YXrco0sduX6a+/S7+
	 hHEXqgLYa4siA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8DAFAC4361C;
	Wed, 22 May 2024 23:32:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1 0/5] BeagleV Fire support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171642074357.9409.6131755278467232949.git-patchwork-notify@kernel.org>
Date: Wed, 22 May 2024 23:32:23 +0000
References: <20240327-parkway-dodgy-f0fe1fa20892@spud>
In-Reply-To: <20240327-parkway-dodgy-f0fe1fa20892@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, conor.dooley@microchip.com,
 daire.mcnamara@microchip.com, jamie.gibbons@microchip.com,
 valentina.fernandezalanis@microchip.com, linus.walleij@linaro.org,
 brgl@bgdev.pl, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_163225_870709_F3016725 
X-CRM114-Status: GOOD (  10.08  )
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

This series was applied to riscv/linux.git (fixes)
by Rob Herring (Arm) <robh@kernel.org>:

On Wed, 27 Mar 2024 12:24:35 +0000 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Yo,
> 
> Wee series adding support for the BeagleV Fire. I've had a dts sitting
> locally for this for over a year for testing Auto Update and I meant to
> submit something to mainline once the board got announced publicly, but
> only got around to that now.
> 
> [...]

Here is the summary with links:
  - [v1,1/5] dt-bindings: riscv: microchip: document beaglev-fire
    (no matching commit)
  - [v1,2/5] dt-bindings: gpio: mpfs: add coreGPIO support
    https://git.kernel.org/riscv/c/6e12a52c1459
  - [v1,3/5] dt-bindings: gpio: mpfs: allow gpio-line-names
    https://git.kernel.org/riscv/c/f752a52d34cb
  - [v1,4/5] dt-bindings: PCI: microchip: increase number of items in ranges property
    https://git.kernel.org/riscv/c/649bad67d4b1
  - [v1,5/5] riscv: dts: microchip: add an initial devicetree for the BeagleV Fire
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
