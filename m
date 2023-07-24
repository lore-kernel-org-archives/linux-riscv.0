Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC86BEB64DD
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 18:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yY+eAP+j+fkgwBbvsUe8M6MsQMz3IaWMxUhXhX06gek=; b=wBZu4MnZ+n5YBN
	v3iKiA3qIgr9EoWVKGZ4FRRJlG5Dw3TQoCSTDRmBKUxBNIdCtPMTBwcteHfRk4paKacWh5Qn2HH69
	j4PAmII1BfxIkwT3fCKPH4t1UBprVjjzPwDIGCtuxcKHQfRwbG9RJdu7aM8xwkWMWotnGinyZznHr
	bioTt3bRmMKupm2sc14zpDyWAaV7i+FrZKNHu9JwOKNF+9x4iZNUtc3IXIRzgIbWwBq+DGUCMRjQq
	4RAALMZ3unC+mTicRUSpbzlVyC8r0Q4CxTfSITLk8R3WfeA/0SHkW3gMQLcy6z3lwO1SPX2LNTxC8
	J8AqNtZfSerAM5xn2+sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO0IC-005CJs-2I;
	Mon, 24 Jul 2023 18:28:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO0I9-005CJH-1i
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 18:28:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D7EBE61380;
	Mon, 24 Jul 2023 18:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B60CC433C7;
	Mon, 24 Jul 2023 18:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690223300;
	bh=PKZT/f9kEO15ObxVb4uDCgsik4xstwNkFBHIeXf5KIc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BT6HEQv0l3zOKhSzGl6ozeNZpY9eq+9cssh/yG+7MhrsUAfnEcOepzg8PSV9x+XK+
	 rv+PhA2ntqsBM9XR/2tFoN5vPdnrFWe3nJhf2a12uEOoi4YvTLr2Ctc6uVanXz+qlC
	 WnyhQ9T2lhFAPvk3n53fIrZWsE0I4qbN/cjhrSlbFytzZW1CpNPoUyvUqIFKb1AlzU
	 hJZ0XisT5k/s+N7rN611k6zWcRkh+FAbHErVClyWuAfu9kdJ8F6Rptupn82+jennli
	 C87wGRDRPE84tIrFvi1/Xme3QVfDgzwwL5fP5p50l7DcPJisvbHym9yueiPTISfa1e
	 ObHyGxL7KwLRQ==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 William Qiu <william.qiu@starfivetech.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, 
 Linus Walleij <linus.walleij@linaro.org>
In-Reply-To: <20230713090015.127541-1-william.qiu@starfivetech.com>
References: <20230713090015.127541-1-william.qiu@starfivetech.com>
Subject: Re: (subset) [PATCH v2 0/3] Add SPI module for StarFive JH7110 SoC
Message-Id: <169022329775.1044366.2232599476103441607.b4-ty@kernel.org>
Date: Mon, 24 Jul 2023 19:28:17 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-099c9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_112821_641870_BE6879DB 
X-CRM114-Status: GOOD (  13.87  )
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

On Thu, 13 Jul 2023 17:00:12 +0800, William Qiu wrote:
> This patchset adds initial rudimentary support for the StarFive
> SPI controller. And this driver will be used in StarFive's
> VisionFive 2 board. The first patch constrain minItems of clocks
> for JH7110 SPI and Patch 2 adds support for StarFive JH7110 SPI.
> 
> Changes v1->v2:
> - Rebaed to v6.5rc1.
> - Submitted reference file separately.
> - Dropped 'status' node as it was 'okay' by default.
> - Dropped Co-developed-by message.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] dt-bindings: spi: add reference file to YAML
      commit: 8858babff615ee366bf570c1facfbd0845dd924e
[2/3] dt-bindings: spi: constrain minItems of clocks and clock-names
      (no commit info)

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
