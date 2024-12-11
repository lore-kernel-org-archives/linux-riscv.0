Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1B3E7717D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 23:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uGPsKRa0MvRjLbls134nrUHDUye97udDmPB+4QGuVx4=; b=Z/wx3aKYWQwmuA
	cVw0j//FkcwhXBymf3kFHEu35NgR34BkZEyrfYxH82XDThbDRNd88gLmRW+WU+EchRIVczEouyWDK
	416H9D1+N6w/pCU/DGYnICsRlvpQsIBMo5ehWg4fAoHhA5whB15F4LG7dPaAy7clOM1tV1a4Wcmi3
	5ht46i703KQHNR+48GgM0yGx6egAwin6Df5x1CGmoPw3LsjFz/1LWit4oVvBzREdm5NntOV9rWBzU
	jMBwT5Iwrba7mgBKXmXSn8KV8TDn+ky9RqLi7rOg9UW7znJPvC8QsIEaWTMXryTxmTYgwtdCAUzn8
	iIWiT+gliUxqrDIERcsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWOb-0000000GWhe-2ZlJ;
	Wed, 11 Dec 2024 23:45:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVGI-0000000GKoD-0TPM;
	Wed, 11 Dec 2024 22:32:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 110A35C67ED;
	Wed, 11 Dec 2024 22:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24AB1C4CED3;
	Wed, 11 Dec 2024 22:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956373;
	bh=cVsBRq85rissDz94gS1APPLak1L31WJ3t5TGTSYE/as=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cqZ00nyo1Apj+jfDOCjAb0Dxj/1hdrSgL4z0d1BQUgbsnfyS1cxj2Bs3BmSupO9YI
	 ZrIs7UmW8cKEp43GKNoiniGEMwWKwmjdnER3WeCSCGcRBKWotkXLcx8jndR1TkSpRP
	 uiVGhMx/F4anBNn2cXEIgvbbMNAcLgjaLi7WcLTW60LB7hq+FQhuXx3i6Ic5UlnfEU
	 vzGsMum9i7o+4Bz2yDi5hvchzvThH3EecYX333iWDVqDeJrI5DcrWWqj0yc7VIBVVl
	 GPNr0CGIC5KgEmOa8jzIJQb3v4R6rhXRyTCF1prrQpAlkKDu/E5iMLuOrlL7ULHRg3
	 dPb253YfD0mvw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CC8380A965;
	Wed, 11 Dec 2024 22:33:10 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] soc: Switch back to struct platform_driver::remove()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395638899.1729195.5401091299734997866.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:33:08 +0000
References: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40baylibre=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, arnd@arndb.de, olof@lixom.net,
 joel@jms.id.au, andrew@codeconstruct.com.au, christophe.leroy@csgroup.eu,
 herve.codina@bootlin.com, qiang.zhao@nxp.com, hasegawa-hitomi@fujitsu.com,
 lihuisong@huawei.com, linusw@kernel.org, kaloz@openwrt.org,
 kgugala@antmicro.com, mholenko@antmicro.com, gsomlo@gmail.com,
 zhuyinbo@loongson.cn, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, conor.dooley@microchip.com,
 daire.mcnamara@microchip.com, krzysztof.kozlowski@linaro.org,
 andersson@kernel.org, konradybcio@kernel.org, heiko@sntech.de,
 alim.akhtar@samsung.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 nm@ti.com, ssantosh@kernel.org, michal.simek@amd.com,
 andriy.shevchenko@linux.intel.com, duje.mihanovic@skole.hr,
 broonie@kernel.org, david.wu@rock-chips.com, jay.xu@rock-chips.com,
 jay.buddhabhatti@amd.com, radhey.shyam.pandey@amd.com,
 izhar.ameer.shaikh@amd.com, naman.trivedimanojbhai@amd.com,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143254_204215_A376F8BD 
X-CRM114-Status: UNSURE (   9.87  )
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
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 29 Oct 2024 08:48:58 +0100 you wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/soc to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> [...]

Here is the summary with links:
  - soc: Switch back to struct platform_driver::remove()
    https://git.kernel.org/riscv/c/511c06e39035

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
