Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84769C00528
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 18:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ePTuZEOZYnPFyJUI3gnMCTOGDUaDR2ma7iXZYvNXXfM=; b=RyhO3kcrRR5yy8
	UMZHOFaycYhdLWLoLMrZbOAiGI0pXbd8Mtsoe2oX75Gmnx8/qmgRq9uKI5eIiT81UiQ8v4ruB3myQ
	f5RmNNL7t+TeKUjvZP4cr6ev2bo/WGyI9gDbpHBRijXgfWxtXHwRVuhlgruGhms8rJmk5rSzqyTOa
	mKbNKVfhcomeWjlrFmQs2pnlOgAhBkcV9RJmQIVGrMGxVzCPVgUk0oQJuTIQj3XUImjBdHBCFsT1V
	2Zd8C+30aKx+8jezqhzgtyr4DAB5X0+6fQsfHYAR+E1iup2daplXVWXAL8y0odyGRcws4Gu1YITzU
	UD+wcWUv/yQJ6ZGO6pcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO0IH-005CKo-1C;
	Mon, 24 Jul 2023 18:28:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO0IB-005CJe-2Y
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 18:28:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4CC8961368;
	Mon, 24 Jul 2023 18:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1E2C433CA;
	Mon, 24 Jul 2023 18:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690223302;
	bh=x/TDji6c9EOf6CdtqHPxOL7LIWME4rsp6ZMLSc+V2yw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ufbjpu/OPz+c9IWljebyj/kbvEFAhkQ/7lbv37QKEHtgmItO6wEI7PWeMwakMhAqj
	 ELYflae4MEHz2Yg490tdoHYocAZ6g1UkBXooJMn3x369OaLAd5zuJ81M9S3Eq+y1TB
	 9uS51IHFBmxJWEmVcdu6wSDBpNhpbt/6/oiwl6WdiFgVJlfddOKOFImSFs7FInMmAu
	 H789xXQrvkKkYqhj0bcyN4K9hvXUTTeI3+FkqRlVpsF91P91PL/0/ez9m2AqF/fe1P
	 MdRumk31d4H51OrUg9Wyy6FLgO8tODCruVXgnZ1fBSzASZ3Bjg+0lj1LphiYwnSRFw
	 cRmFq0jE2I09Q==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 William Qiu <william.qiu@starfivetech.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, 
 Linus Walleij <linus.walleij@linaro.org>
In-Reply-To: <20230724101054.25268-1-william.qiu@starfivetech.com>
References: <20230724101054.25268-1-william.qiu@starfivetech.com>
Subject: Re: (subset) [PATCH v3 0/2] Add SPI module for StarFive JH7110 SoC
Message-Id: <169022330023.1044366.15536884337765854561.b4-ty@kernel.org>
Date: Mon, 24 Jul 2023 19:28:20 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-099c9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_112823_871026_D801F8E3 
X-CRM114-Status: GOOD (  15.98  )
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

On Mon, 24 Jul 2023 18:10:52 +0800, William Qiu wrote:
> This patchset adds initial rudimentary support for the StarFive
> SPI controller. And this driver will be used in StarFive's
> VisionFive 2 board. The first patch constrain minItems of clocks
> for JH7110 SPI and Patch 2 adds support for StarFive JH7110 SPI.
> 
> Changes v2->v3:
> - Rebaed to v6.5rc3.
> - Registered one more clock.
> - Dropped commit that changed the number of clocks in YAML.
> - Rewrited the commit comment.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] dt-bindings: spi: add reference file to YAML
      commit: 8858babff615ee366bf570c1facfbd0845dd924e

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
