Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A64C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 10:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sgytpiuFF1EmLIthAz2AQXm/qBeaxgPbu0fiQRd2CV0=; b=pKI5lmkgdSerC2
	Bgm3goy0ExnbHb13j4jYlOjuB0eQ4IIL0k9/ssO+rG018icJVxZi9gBRcyrveWToIRHgSe3fUL06s
	HlHf5UpqL3rUtCk9n/MubWJswonCHaaUbxpKpl0VdKB0avpFKgibNLDeiol/j6qH8OfOjkxVFEIl1
	76N6kIgZtoj49mtbC++Sy3pH9HG1iOBdP3/6KimZtUkwCGQVLnvt/FYxjsjZY75+Illhm+uxafb/T
	Txy2Aeo4mV3NNl2MlHCgntDBL5iWc0LBgVTHQTQcblum50V7LY8YW5sfaL7s9mXJDH9LbS6Ktpv9m
	EJsNIgBnyjow+yBXqeaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Dvp-0045LW-29; Fri, 01 Jul 2022 10:31:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Dvm-0045Kf-5I
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 10:31:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C8EBD623F0;
	Fri,  1 Jul 2022 10:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58122C3411E;
	Fri,  1 Jul 2022 10:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656671480;
	bh=PzSQe20vyGgKjj7bh4FY+eUYxZ15YBI0Skb7DjyLz/8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kwBlRyc/+7zHK/+D1Orop4T33zg2uPrmUjsGkNZAU52FjlKmpsb++xU1wPmV1Sdrw
	 k4lB1lGBPqolSXmaVZcNAGFjgST13USJwcNorRHO0OGx/hzi0VABG7ZTo8N7/TuHE2
	 HxaECpn986NnZFTn1yzoeBsf+ZI4OSJnoey0UsvUno7oDZ+pMXkeNnXKR1PwQQv7H/
	 N9kuWrxo5c2iCitQqKmW068YiY9uPx4FEOea91RPuRZGwW8oY4qU7G4DXYqbe8FC8m
	 c/Z3X/cBEeVfPh/ZqshT/s0Jav6xLxcoMGxNTeEs/B5Wuklqf7C6n5RtWyUg6RAJla
	 6Gx1v1dJgB63g==
From: Mark Brown <broonie@kernel.org>
To: mail@conchuod.ie, palmer@dabbelt.com, palmer@rivosinc.com, lgirdwood@gmail.com, thierry.reding@gmail.com, fancer.lancer@gmail.com, daniel.lezcano@linaro.org, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, daniel@ffwll.ch, sam@ravnborg.org, vkoul@kernel.org, airlied@linux.ie, Eugeniy.Paltsev@synopsys.com
Cc: conor.dooley@microchip.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org, niklas.cassel@wdc.com, linux-kernel@vger.kernel.org, damien.lemoal@opensource.wdc.com, dmaengine@vger.kernel.org, aou@eecs.berkeley.edu, joabreu@synopsys.com, tglx@linutronix.de, dillon.minfei@gmail.com, alsa-devel@alsa-project.org, geert@linux-m68k.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, masahiroy@kernel.org
In-Reply-To: <20220629184343.3438856-1-mail@conchuod.ie>
References: <20220629184343.3438856-1-mail@conchuod.ie>
Subject: Re: (subset) [PATCH v3 00/15] Canaan devicetree fixes
Message-Id: <165667147407.1756128.12037224598634241859.b4-ty@kernel.org>
Date: Fri, 01 Jul 2022 11:31:14 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_033122_282199_091F906E 
X-CRM114-Status: GOOD (  12.75  )
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

On Wed, 29 Jun 2022 19:43:29 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey all,
> This series should rid us of dtbs_check errors for the RISC-V Canaan k210
> based boards. To make keeping it that way a little easier, I changed the
> Canaan devicetree Makefile so that it would build all of the devicetrees
> in the directory if SOC_CANAAN.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[04/15] spi: dt-bindings: dw-apb-ssi: update spi-{r,t}x-bus-width
        commit: 8b037cabc4966b010c44a76e05a43d276318bc49

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
