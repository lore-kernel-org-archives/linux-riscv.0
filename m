Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76457CDE012
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zBBr8RdnYuskM5l5uKVEyl4lpp9vC7aLMPcVE9JIjjI=; b=JB763iJ0UmeK8X
	imxGCMeww3nghfpD6s9b7RQzoPiZ/PXJL3KaIcFR/E3LvZGqJnkhzJzPHC1K9vYmBRBT20U81mptv
	aaenvzQfMpHByur1q0oQTjJnoeXsAYPcxKR/chtfVWUtpWzKE3PJLX9S/3hG7u0sfydTPuQ2vEhG3
	9Q1EsujjpIc1LOWAToXpgh6aXURdfQUw1PYD82ZTeB32WbDWviqBeYi6AaZG/8eGfWKzLkq6Buugd
	xQ3DT+4GyfuFpcwoRGQdZijwQpKMaXvhYbcGZ6/bGPSsevuAVVKwaLtz5J/xCWAGvWpz/jnI+XnCm
	37dTwMDzYTnKpjFBd8ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1p6-0000000Aojp-1cWc;
	Fri, 26 Jun 2026 08:22:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oh-0000000AnmM-2q7x
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 08:21:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A3E8C6021C;
	Fri, 26 Jun 2026 08:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57AA61F000E9;
	Fri, 26 Jun 2026 08:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462098;
	bh=OcfJataYZCIIYP70MrY9Og+F3eHYjF96zIois1cHY+M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=BJM5zP4GDATae9/zW4iR8aZvtylByM4rIKA7jgZg+y/9sRqYyzGZs08y0oIdoYlPN
	 PShzN3N+HxTOX6+SIIJmw115s8z3nZC66sBI//P9lakJTw4xt0FNP6KYT7PxX/VOLQ
	 0txPPdqzvOoxWmdhSnSlZ5tvaDAcOhUpRfKYXjTe49tJ/WDGrUH4H/X+NloN6tyteA
	 m0D7MD4OfvNqYnFvbwbuy8OSYy5rzdoxjOpLOnnnzDlW6C9vUVGyo7jT91qMLqjqNR
	 dx907T+7em6jm0UJQWZDoYTnU4hloDE3pYPx7DtxCXGjDtqvQHIrF9k4O5c+Fd3bfG
	 AygpfoSrMrQCQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9396539389E8;
	Fri, 26 Jun 2026 08:21:26 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1] dt-bindings: soc: microchip: document irqmux on
 pic64gx
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246208525.3816447.14558154449045550945.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:21:25 +0000
References: <20260407-headache-reward-ae93bacdba0e@spud>
In-Reply-To: <20260407-headache-reward-ae93bacdba0e@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, conor.dooley@microchip.com,
 daire.mcnamara@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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
by Conor Dooley <conor.dooley@microchip.com>:

On Tue,  7 Apr 2026 16:29:31 +0100 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Being practically identical to PolarFire SoC, pic64gx has a irqmux
> that's entirely compatible with that on mpfs.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> [...]

Here is the summary with links:
  - [v1] dt-bindings: soc: microchip: document irqmux on pic64gx
    https://git.kernel.org/riscv/c/17d9064987ca

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
