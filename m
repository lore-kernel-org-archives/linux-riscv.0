Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF26C3DA6F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 19:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EzMvoSDDtgYkDe+i6lbRVTjHd6Pg/0Mhbe8OXvvBamg=; b=cbgACyncoo3Jfn
	59wZgVN2b8fKhum63PVJQ1JayCsLfzpwQVcRTLeVClcZJAq3nDYkc/gVmHV61bqksCwxaJnW3UvI1
	v5krw9Q4IqZyW8L2YLqpRyYXSMy2PPs5RXZwaPtlIXafcQe5C8YAHi97zWpCwDKygD+vx+Fz7Sxzi
	3+kwFhfvYdcI5lyILmuG8bLduKyh6oE97WNOHzdh4J/Z1C9GrNrgjjrtSJJNpLP56EALrROJGiRWl
	o27CXfKhTxbUyKSxhE4bf1xsYcJ7CpwcW8TXRcgPTi0vqgHdr+TjxKpEWnRNmUKo4CdWebB8vLhjx
	0BBjqD8z+kiKy7jMpT6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYtvj-001SOR-2e;
	Wed, 23 Aug 2023 19:54:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYtvg-001SO0-2y
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 19:54:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3A341663B1;
	Wed, 23 Aug 2023 19:54:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42180C433C9;
	Wed, 23 Aug 2023 19:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692820451;
	bh=3BXs+jmGfRUvLPCNF0fDwwzaEF8pVwCZrH829bm0Kew=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OAKJrwAlS/gLuUkE4X9F5RAUBilBnnGnk/ewUI94zRnebGNp2469Jryfw0s3M+2aZ
	 7/8ROIvEAd/gC5uVzkOH92jLlomxPrqYfwOVqRLOmG53ljnFe5NGnjxQsYkAqdAFIs
	 nLsJVZATA5n8Edq+6u5JgnncHNxiogTu0GuWNom6Bl0Q8MwY3yBTX4dCr9HHeK6/ll
	 qqdpjkhwnADy5auD+gGkEF9typ6Vs3Jdgl+OoSEkx1R4urPPVj2tttlnktt41WRTaJ
	 2Kjm+t6fJn33DFzlfawZurcmaJCXbXKfq3aArzRiUDSJyy0Hwc7b3qSy+sBnDYT5Nk
	 cIFQFhYefzOWQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Claudiu Beznea <Claudiu.Beznea@microchip.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Maxim Kochetkov <fido_max@inbox.ru>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Jose Abreu <joabreu@synopsys.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Walker Chen <walker.chen@starfivetech.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-riscv@lists.infradead.org
In-Reply-To: <20230821144151.207339-1-xingyu.wu@starfivetech.com>
References: <20230821144151.207339-1-xingyu.wu@starfivetech.com>
Subject: Re: (subset) [PATCH v2 0/5] Add I2S support for the StarFive
 JH7110 SoC
Message-Id: <169282044586.176026.15255891850559347673.b4-ty@kernel.org>
Date: Wed, 23 Aug 2023 20:54:05 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-034f2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_125413_044047_2B52A776 
X-CRM114-Status: GOOD (  18.75  )
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

On Mon, 21 Aug 2023 22:41:46 +0800, Xingyu Wu wrote:
> This patch series adds I2S support for the StarFive JH7110 RISC-V
> SoC based on Designware I2S controller. There has three I2S channels
> (RX/TX0/TX1) on the JH7110 SoC, one of which is for record(RX) and
> two for playback(TX).
> 
> The first patch adds support for the StarFive JH7110 SoC in the
> Designware I2S bindings.
> The second patch adds the ops to get data from platform bus in the
> I2S driver.
> The third patch adds support for the StarFive JH7110 SoC in
> the Designware I2S driver.
> The fourth patch fixes the name of I2STX1 pinmux.
> The last patch adds device node of I2S RX/TX0/TX1 in JH7110 dts.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: dt-bindings: snps,designware-i2s: Add StarFive JH7110 SoC support
      commit: 206110c74c4af6772916acacae5f28993085bf18
[2/5] ASoC: dwc: Use ops to get platform data
      commit: d6d6c513f5d2d14651336fb4e30f097822b46f29
[3/5] ASoC: dwc: i2s: Add StarFive JH7110 SoC support
      commit: 52ea7c0543f8a39da8a6fc17a5ab36b7b58d5431

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
