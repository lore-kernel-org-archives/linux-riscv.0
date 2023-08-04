Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913E5C001DE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 19:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GD+yv/edItxy2a6PuMObZq2zKl4bL3nc06LEX9XvmV4=; b=oYUD6cRHgISM5T
	ykofMXQZ9OaH8iWnRPfjaTCBXRdU9bEvvCmujQhe9TA505o6pC/BmyiFKn9QlzUp3dvd/T/BVc6tc
	GTcLjwzvTbQ4HxUG9Kuhhm3zKIHN5GOJvluP4UzRsM1UtE0WkR/s79vkNxRUB9lFTzytFoLidP24m
	wyZLj9cIrG5qTPQCC8tmN0FM3X0da74cTit8fUxBm+JwjPvRdbRUmiEEYJ2c7Sm/Q7t1mqM20fGYx
	YSkXCzJJbWiPOtV3Tv6WRIdrd9d7oTUDl6cnkgYI/om+LVewpGX0gisAfQIe1FIPZPRGaBG+mxYVI
	mR2LBqvzkWMMs0ZO4Ttw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qS06D-00D3lB-1E;
	Fri, 04 Aug 2023 19:04:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qS06A-00D3kM-1m
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 19:04:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D86BB62110;
	Fri,  4 Aug 2023 19:04:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508E0C433CB;
	Fri,  4 Aug 2023 19:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691175869;
	bh=520B+rY2lic+DubRUABO4/l2XzI3W+yK1LeWrhQ29eQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UAcT9Ac3f8LkU11WSIvLmbMd4Ufi9ds698gVhlwy5RpKng8fUTcV1gqP/wxN5ipWN
	 icn5qzNMqe3SeKN2HKV9eF9C9TBZOpO8MIVOS8++eu3sv2lFACFEGnKDmR8UvUm6PZ
	 11ynCvJQPV0g6FHw4TG+zJhUV+xmthHsu0sIgz3iD0/E4HHxR/wbcfJAdmXw/BSCCp
	 qf3HxbN678i1eRa/LSqN9RC46iIXsKSm+f41MncnNp7SZno78ZWsa+L1AO6O4Eoscm
	 ZobGhqn08B/bh76FbWCqtQvW83eereBKB1k1wIRPY2lNTzLVlJdR/BJ4BEjXUEDEJK
	 jCPv/oC0NpLXA==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 William Qiu <william.qiu@starfivetech.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, 
 Ziv Xu <ziv.xu@starfivetech.com>
In-Reply-To: <20230804020254.291239-1-william.qiu@starfivetech.com>
References: <20230804020254.291239-1-william.qiu@starfivetech.com>
Subject: Re: (subset) [PATCH v6 0/3] Add initialization of clock for
 StarFive JH7110 SoC
Message-Id: <169117586705.140468.16858943354312367424.b4-ty@kernel.org>
Date: Fri, 04 Aug 2023 20:04:27 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-034f2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_120430_631094_0DFCCAE9 
X-CRM114-Status: GOOD (  14.66  )
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

On Fri, 04 Aug 2023 10:02:51 +0800, William Qiu wrote:
> This patchset adds initial rudimentary support for the StarFive
> Quad SPI controller driver. And this driver will be used in
> StarFive's VisionFive 2 board. In 6.4, the QSPI_AHB and QSPI_APB
> clocks changed from the default ON state to the default OFF state,
> so these clocks need to be enabled in the driver.At the same time,
> dts patch is added to this series.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] dt-bindings: qspi: cdns,qspi-nor: Add clocks for StarFive JH7110 SoC
      commit: 0d2b6a1b8515204924b9174ae0135e1f4ff29b21
[2/3] spi: cadence-quadspi: Add clock configuration for StarFive JH7110 QSPI
      commit: 33f1ef6d4eb6bca726608ed939c9fd94d96ceefd

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
