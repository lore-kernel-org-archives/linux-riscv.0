Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C86ACCF9F8
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 10:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sd9oiCZs0n9y6z1WNus51Av1bMQTroqJ0YBcqVYX1kY=; b=VL4wphdpRb7mEd
	lbKncKfjtsgvdtJWSGoP+Ff/F7JLsz7BaT9O5m18Aeylx2XI1M+G1XHKPcliDIAhX1N/e97R3LoxN
	OTAoVI272DB4ya0z9/9QCQcpH9hGbvUoAK/PaxHsK8AAGmTh1UitQaYgD1tCOg9ulTFCAb3/z5vMi
	4/jQ3HfdQo1Q3mbqT8xqxBOM+O/pQ3S33l+hRvUYRe2TmKVYyqRu1HEuGjGnKS9c9RGnbX7cq2h/c
	vxtCrVd/3qglKi/0wicFGkrRbbAACdT6FujAmFg13bikqUx1TiqvIpCf5WYyzXEnaPcHMmr5Y05Em
	9UrQxS2JrotzVGoTsqbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJVi-0000000H3bw-2F47;
	Fri, 07 Nov 2025 10:16:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJVh-0000000H3bo-2ccV
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 10:16:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A7329601BD;
	Fri,  7 Nov 2025 10:16:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8FA2C19425;
	Fri,  7 Nov 2025 10:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762510560;
	bh=qviGVDBTi1qrAbuFnDyLf1pcDfPGvS8U5aiSjvqCc4k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fJMvVnBgY9P2M/E2U68QDNumtskhL7X39tpAM1FOV7uOwn2plb6s6Z6ramQhQiAGK
	 PxgjFOMBNsLXOzryveuR9aZFUZb4WoYpjLXzEyNKdyeTuU60IUEqXm0hX+8TYaUWYh
	 TgHfqO8mKuf/9BiCJGcX1t4j9aCwwkYoSqZ4adc1deFXrbtc298cTrVJkEd4QmzW2w
	 WCcbi4DY+VweCjvqvqp/18otSfyqozwhdfEuQFLuSVrscNYEjMniCuyqy286yS9QMU
	 00Nh5J9UbwmXI/UrgpwGZ54c8Dse4aF7X94pVtt0XgNX7kwakkF3CVx+2XKDQyhPk6
	 t5zevqH9KYuPg==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 han.xu@nxp.com, dlan@gentoo.org, pjw@kernel.org, 
 Alex Elder <elder@riscstar.com>
Cc: Frank.li@nxp.com, p.zabel@pengutronix.de, guodong@riscstar.com, 
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
 apatel@ventanamicro.com, joel@jms.id.au, geert+renesas@glider.be, 
 cyy@cyyself.name, heylenay@4d2.org, conor.dooley@microchip.com, 
 fustini@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, spacemit@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251027133008.360237-1-elder@riscstar.com>
References: <20251027133008.360237-1-elder@riscstar.com>
Subject: Re: (subset) [PATCH v4 0/9] spi: enable the SpacemiT K1 SoC QSPI
Message-Id: <176251055452.2492712.5964458337079179341.b4-ty@kernel.org>
Date: Fri, 07 Nov 2025 10:15:54 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-a6db3
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

On Mon, 27 Oct 2025 08:29:58 -0500, Alex Elder wrote:
> This series adds support for the SpacemiT K1 SoC QSPI.  This IP is
> generally compatible with the Freescale QSPI driver, requiring three
> minor changes to enable it to be supported.  The changes are:
>   - Adding support for optional resets
>   - Having the clock *not* be disabled when changing its rate
>   - Allowing the size of storage blocks written to flash chips
>     to be set to something different from the AHB buffer size
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/9] dt-bindings: spi: fsl-qspi: support SpacemiT K1
      commit: bd352547df647be8a1e6c9d4ca2b54b459f3abc1
[2/9] dt-bindings: spi: fsl-qspi: add optional resets
      commit: 873a46141460d209bb62eaa0dc9e7b67bff924a6
[3/9] spi: fsl-qspi: add optional reset support
      commit: 106d7641e55a472e7523c1f525c77fb6d420064d
[4/9] spi: fsl-qspi: switch predicates to bool
      commit: 6b398c1d3da7a673b13b1857f9fff4c15ee20cef
[5/9] spi: fsl-qspi: add a clock disable quirk
      commit: 1797d254f5c4b46b295527a635af7321a3fe1318
[6/9] spi: fsl-qspi: introduce sfa_size devtype data
      commit: 56931105074fe7e5fc9d54e3163df3b95075643c
[7/9] spi: fsl-qspi: support the SpacemiT K1 SoC
      commit: abc9a349b87ac0fd3ba8787ca00971b59c2e1257

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
