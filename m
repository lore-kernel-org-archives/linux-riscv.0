Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3396DE77180
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 22:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SlPTajXcGCFAYnFE2jrli+NIs8Lr0qUzIr5jlndPFiQ=; b=yaOQqB/J4bXt6+
	5B6jQtnGiwRch8Zpxy+Co1pXD3hFFxgitrwwqw9oOetxURYUTLkgKlABnT30hNCpZT2vF4eeaYqZ1
	gqRsX9rMjfgKLsNI9Gre0o8TOy0Lbn7J4sdi17Vu8ojCf4bbw0s2Y6giCB9W2Xjv4+IL5BCY4cjR3
	P9d9w7XsVflW/cAkyf4nbyxLJBusQH1hAgSne22mwR8eCpD+BNuTj25w2ihmmVuBYv42vPb+bN0jX
	54kJ1jzwltWT5QEEljRBkjoH8tUCb1Qu92BhwgGF/VIMmJfW2wfUuKvsV4+Loxu83RV/hbXn5b3nT
	Cm21vrFtnYx286rEoQ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVN6-0000000GNOY-0Ol5;
	Wed, 11 Dec 2024 22:39:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVGF-0000000GKm7-1saO;
	Wed, 11 Dec 2024 22:32:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3B2BAA41D7A;
	Wed, 11 Dec 2024 22:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF38C4CEDD;
	Wed, 11 Dec 2024 22:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956370;
	bh=HsV2hgf0fbYGgHmLxzKHUU+rPda90YFsJKEFrTRZGjc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=vOONck9QSCmGFAHL/+qROtp77YjI5J4I/SNx0ir3wUFq4T7bxTbb2voI8ut/Ww9hs
	 umsbLAHyc22326U3EC8FWHJ3RCF4ulGvVPT8unOrZjZcpbnYzq8lhQ8KZU/C75OtUl
	 TO35ohplFrGjkcnKUJpkMytFDmtP45NC6yfOPGcqz1mXjqA+0VDaJ219FdT3oRfhjQ
	 +iTuIQURyuJN/K99Xa7QwlpMG5dyEGecunWyNHIBydjo4JIfHZWyknpdRE7t11ztmj
	 /DFlKfV5HP6jQUF0INgFoLP6GW3gvNPKM3C4afp9/wcwEriIMhkxgMsNY64t5aAjCO
	 +zJCDNgxMnL1A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 710F2380A965;
	Wed, 11 Dec 2024 22:33:07 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] firmware: Switch back to struct platform_driver::remove()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395638610.1729195.7835904976463124425.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:33:06 +0000
References: <36974feb6035201d53384557259ec72fe311053b.1731397962.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <36974feb6035201d53384557259ec72fe311053b.1731397962.git.u.kleine-koenig@baylibre.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40baylibre=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, sudeep.holla@arm.com,
 cristian.marussi@arm.com, tzungbi@kernel.org, briannorris@chromium.org,
 jwerner@chromium.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, conor.dooley@microchip.com,
 daire.mcnamara@microchip.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, somlo@cmu.edu, mst@redhat.com,
 florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 dinguyen@kernel.org, michal.simek@amd.com, gregkh@linuxfoundation.org,
 wahrenst@gmx.net, laurent.pinchart@ideasonboard.com,
 jay.buddhabhatti@amd.com, ronak.jain@amd.com, radhey.shyam.pandey@amd.com,
 praveen.teja.kundanala@amd.com, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 chrome-platform@lists.linux.dev, imx@lists.linux.dev,
 linux-mediatek@lists.infradead.org, qemu-devel@nongnu.org,
 linux-rpi-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143251_560475_F7B02967 
X-CRM114-Status: UNSURE (   9.65  )
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

This patch was applied to riscv/linux.git (fixes)
by Greg Kroah-Hartman <gregkh@linuxfoundation.org>:

On Tue, 12 Nov 2024 09:35:20 +0100 you wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/firmware to use .remove(),
> with the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> [...]

Here is the summary with links:
  - firmware: Switch back to struct platform_driver::remove()
    https://git.kernel.org/riscv/c/5770e9f237b6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
