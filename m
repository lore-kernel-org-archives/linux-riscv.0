Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF55C79F82
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 17:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i0M8fNarcK6gHpzq5oEHfTvDed+n7gaWVgevRzvpVOw=; b=GMlW4nw+xu6OgR
	FAw/iaQUvqIE4e9x7sXRNS1y1tmhvbYxnFIlOkLdqhBWhHZ+LZ3XocmFhOuS8hkiedgwhkCV/e3Uw
	74i2iy9ibp3gJEDw+1lkKYga6Yag27hhnkhgGVGf7xP1Jv2xxZ1z5NNkEmoab1NvvXzkn8RdwuGJT
	KqBGfuHuIbDY/NY7hqw/3iohvMuJF3+vrH653rqU4VCoeHlO/qJsrHaCPCc97OnP84Bl+gfvMv5M2
	lCL2+gi5u82rFn9j+OaM617BuO5N9HljET9gQzdwrej4hxFjrURmpkoovJbT5Q0Zi4yuz4Naqi4UK
	zxrgQrMmhAgpS86Bl30A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zcd-00000009pFH-31s5;
	Tue, 08 Sep 2026 17:28:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zcc-00000009pEr-399y
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 17:28:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 81B5941880;
	Tue,  8 Sep 2026 17:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F721F00A3A;
	Tue,  8 Sep 2026 17:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788888518;
	bh=qytXKT2Bs7Fj1a5oD427rFJpl/QRHKEtRWn23VJps5A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WcwZE00YZbCat3B23bNr4yvETUSPHmGcFwHwli5puCoV/nKZSlLPPnCCu2sV1hXDz
	 KEYJKjRv0QpbCh143LAQGn3mCRa+acyQIOUPVqykojXA3b2sWZw19MBoTsC9igc1mm
	 K6qztxRoLbqRV8cbVJagrGH2qMz558V5IfiYHI7kTX48Cy5dH8wW+NKNFmDsMJdhUD
	 Db3JxFJWCae7yglsazmkOU4Uu0WdPlgPPKv5xS+OKQiUxG4B+BPqtFpwvlCIOdeRLx
	 Ku59HsAhvtYi61F9LAmnimiKt1u40XqEeZtv3PsgmyOnLfnHNpmX8ZDfD1DQNiFEzg
	 ecwCmQ8fZRrCQ==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Jia Wang <wangjia@ultrarisc.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-i2c@vger.kernel.org, dmaengine@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260907-ultrarisc-dts-v2-0-5eb4c97477c5@ultrarisc.com>
References: <20260907-ultrarisc-dts-v2-0-5eb4c97477c5@ultrarisc.com>
Subject: Re: (subset) [PATCH v2 00/10] riscv: Add device tree support for
 UltraRISC DP1000
Message-Id: <178888166750.78527.9666350258521008763.b4-ty@b4>
Date: Tue, 08 Sep 2026 16:34:27 +0100
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1576; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cN+0Yh/iVR9Fq/yw46i3itGh4OTIcS9+F+vcebxnKBM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqoEW/xx71ld8bGzQNGA75RuPnRLPcvcpsICXtZ
 m2ConXuoN+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqBFvwAKCRAk1otyXVSH
 0A0NB/9SicyMaMYqHrQpLTGrZEEoTKW/jaXP5bTkxZNIo5G02ydXYGJkNEhvzFH0FiXF9Un86d/
 BL4XtHkrdRciyXPc0cgH0WYW9PYnp7ZInE2zlMjv6XNZvfI7J4Rmq0jFXIvrWv2FIWaqFHeBDap
 RmhpQgOJUlP+zmnvK8kWL6MrCUcg+Td1KdQHD6nCZDY29cHnp/QS08+Xvmf6693lxU+DfhV9O5h
 NHZcRxWuN+UPgCcNJ9LWyBmunRUkzzvADKvmCPoS6JjUt+WiCKV0GXKjLhPOqkCkvVeYeHMHN0q
 +6+RAT82inmKbaaIieZZNo5ZhX1nH4+jZYCRpU3YN4/MrBbP
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Mon, 07 Sep 2026 17:54:39 +0800, Jia Wang wrote:
> riscv: Add device tree support for UltraRISC DP1000
> 
> Add Devicetree support for the UltraRISC DP1000 RISC-V SoC and two
> DP1000-based motherboards: Shenzhen Rongda M0 and Milk-V Titan.
> 
> DP1000 integrates eight UltraRISC CP100 CPU cores.  The SoC description
> includes the CPU and cache topology, CLINT, PLIC, clock controller,
> pinctrl, GPIO, four UARTs, two SPI controllers, four I2C controllers,
> three PCIe root complexes, GMAC, and the DMA controller.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.3

Thanks!

[05/10] spi: dt-bindings: snps,dw-apb-ssi: Add compatible for UltraRISC DP1000 SoC
        https://git.kernel.org/broonie/spi/c/f77de4c33f0e

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
