Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39798C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 05:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CM58xlF7/+NZFGtLrP5pX73CJE5Y1VfS1IBSUJFzGDo=; b=EItZqNttCir+QE
	VrTB75HdHTSrNUlrd7LMHgLXoJZKUidyZP4SulAfRlWqjtLXP+mohWxrYfsyqhzeDdeGRIHSrgNmi
	JVxD6cRo3cVeV24bfa85EnNtzcxBMDU0bRWMbjRSdtQJARS4KHDW64VxXtgXpl+f9ko/hRztYdvv1
	O4fxhFxFb/GAfqkJDki8c3x57qnSC+TPXWX3FtHGlfCYmt/M8vPMeOrAS66ZSoYSgu0YWJe7ck/6W
	zv18FO80goS7BWo3n3XsNbBKNZkv1nyqoBGij6/EkCY/HPRbA0aLTD0wBRS99mh8ae97f2xMw6uUL
	IFayVNJ1Smoa3ZustJkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxLGs-00AyWg-2p;
	Fri, 12 May 2023 05:24:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxLGo-00AyVu-3B;
	Fri, 12 May 2023 05:24:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4540063AA7;
	Fri, 12 May 2023 05:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D0BAC433D2;
	Fri, 12 May 2023 05:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683869085;
	bh=tX7KXgnuK8lqbNh920fj8SiOGOJFJBgIs9eJVO2OaCo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Xf9JOuaYCM3EPmqhsz48M30Y+Tb9ZyOYop62KsGUdEDtoCz0F52/nnFRdjRQuiu8i
	 3JhjWP18oVH7yU5vJXwyys0q89EX/828pwuuiyyo1g1ZltMy8bIx6u1elxGBypct0j
	 ZyI5ZrIu3qsg/TG6RZgamtwzQfDoBAeW7bC0nWGrM63qzQe+SfTCy5Qk/foOBeniPK
	 FkTHlJlOI1rR9xFWOVA5bBxoQMgtRMCsYgc+JCwTif2Xs5eeQGeUCq90RnpvaaTOQh
	 cxQUu7Jp4RF9S1rtflEEXAtO9rp9XCQyqgHNRtT8S0y/o1tizAunDgRl5qCrAMeuxX
	 fd5ge+cyFGtkw==
From: Mark Brown <broonie@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>, 
 Maksim Kiselev <bigunclemax@gmail.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Maxime Ripard <mripard@kernel.org>, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
In-Reply-To: <20230510081121.3463710-1-bigunclemax@gmail.com>
References: <20230510081121.3463710-1-bigunclemax@gmail.com>
Subject: Re: (subset) [PATCH v5 0/5] Allwinner R329/D1/R528/T113s SPI
 support
Message-Id: <168386905416.366566.2289755397704500905.b4-ty@kernel.org>
Date: Fri, 12 May 2023 14:24:14 +0900
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-bfdf5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_222447_065278_636E8D73 
X-CRM114-Status: GOOD (  12.18  )
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

On Wed, 10 May 2023 11:11:07 +0300, Maksim Kiselev wrote:
> v5:
>   - fixed DT bindings (Allowed three-string compatibility)
> 
> v4:
>   - fixed SPI sample mode configuration
>   - sorted DT bindings list
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/5] dt-bindings: spi: sun6i: add DT bindings for Allwinner R329/D1/R528/T113s SPI
      commit: f603a3f083aeb9438865975c28b27be0afaae0c1
[2/5] spi: sun6i: change OF match data to a struct
      commit: b00c0d8932f1e7e36570edf0f000c64399e985e0
[3/5] spi: sun6i: add quirk for in-controller clock divider
      commit: 8e886ac838ef12f6994ed9b13ab87784c4f0bc35
[4/5] spi: sun6i: add support for R329/D1/R528/T113s SPI controllers
      commit: 046484cb214b43dc4463343e8c49133d9edb5454

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
