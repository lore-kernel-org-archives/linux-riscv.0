Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2472CC7618A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 18:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SOx+yDDA3if+XJO4gpKf11HfvR9wPPvIhUdpjeRBlvc=; b=SFxUtEMj6w8GhC
	izNz18GtY7AXJJwNJYUJLsekc2qTdTvGwM+k9sHyBpazVgib64OLaoKMkltz+mNNTjzqMvlRVPySP
	cnUlisbmF42IcDsCDwfdGrbb5APWHMAORFz4ILy6DnmIHhy5qJsAwE9QH4A7EoIOtZ2akeNuF0agh
	Zb3B1Gs+XaB1fQok9+kxi3QThQ5znGtxsElbao24lGJF/e9vfPyQlkjzwLKnQwRnC++wMfp2PI3PS
	TjK8y28GuNbZ/1Ns97FW93qeff079YCD1qyncREKHIKG8p5gdDiDWY0uQFCDWNcbkuHhEIF/Lbfr9
	KmR3hpOmfZAcGuXa0uPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peKIZ-00A8ey-31;
	Mon, 20 Mar 2023 18:31:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peKIS-00A8e0-2d;
	Mon, 20 Mar 2023 18:31:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5F3BF6179A;
	Mon, 20 Mar 2023 18:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47034C4339E;
	Mon, 20 Mar 2023 18:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679337111;
	bh=1k2HdZd7GXcK9Rf8Iw4VOgSYsoDP5B0+bCp15WVe8Ss=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Tm7liQ/nAFkV3CyP8a5RNECtveLtuaotxTZ21TXsgIzjk1jw7OqCcVuv5NSZClLep
	 A+YM+EoDWvAq/odu/8f8PeyGDE0GTZ7mII3jhBhwbOwFwfve8X9bPGiPxOZYoicIRJ
	 20oCl/tDXbBYel8S0o+06wWKtlPcbSkhLyu5fEfx2owYwn11EaGWcMfhLn5S7E4/+M
	 eqQBsPmIEofHdZei6aya7XgzWnYrNqKzbu9V9UWiKA/U6KKAnVB4hg8gyW270SN6hT
	 105QGLl+bxcHLDrriY5dCPHD1av/R5D9e7OdcgqJJYlemAvgytJV6awT6gwaLTENb6
	 zrw/M/zLSUxFA==
From: Mark Brown <broonie@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org, 
 linux-riscv@lists.infradead.org, kernel@collabora.com
In-Reply-To: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
Subject: Re: (subset) [PATCH 00/11] Enable I2S support for RK3588/RK3588S
 SoCs
Message-Id: <167933710700.198283.8153226214101331490.b4-ty@kernel.org>
Date: Mon, 20 Mar 2023 18:31:47 +0000
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-bd1bf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_113152_950752_98C59BE0 
X-CRM114-Status: GOOD (  17.55  )
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

On Wed, 15 Mar 2023 13:47:55 +0200, Cristian Ciocaltea wrote:
> There are five I2S/PCM/TDM controllers and two I2S/PCM controllers embedded
> in the RK3588 and RK3588S SoCs. Furthermore, RK3588 provides four additional
> I2S/PCM/TDM controllers.
> 
> This patch series adds the required device tree nodes to support all the above.
> 
> Additionally, it enables analog audio support for the Rock 5B SBC, which has
> been used to test both audio playback and recording.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[03/11] ASoC: dt-bindings: everest,es8316: Document audio graph port
        commit: 2f43ef99ac623b6d9154c26d4f6785df18b4d8e4
[04/11] ASoC: dt-bindings: rockchip: Document audio graph port
        commit: bf4062b7420d01b4fafd7211fd2dc68b916591bd
[05/11] ASoC: dt-bindings: rockchip: i2s-tdm: Document audio graph port
        commit: bfbae373c55e3b1c15a6ba656211dbbe7c390aa1
[06/11] ASoC: dt-bindings: rockchip: i2s-tdm: Document power-domains
        commit: 9971f3358338950d9d3345184fb2c0cfc6fc8552
[07/11] ASoC: dt-bindings: rockchip: Add compatible for RK3588
        commit: b0fe6a91fa9d5599ba3cace2748906e086c5a56e
[08/11] ASoC: rockchip: i2s: Add compatible for RK3588
        commit: 0e6c37610934e9b91f6f5f2599de5e2f1ab59e72

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
