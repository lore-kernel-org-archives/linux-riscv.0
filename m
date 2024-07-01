Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84399C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 18:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tUXGsMs2qEv7zcQ+mBlbHDqptRwgwbJ6JGN3zIN22Ao=; b=M5zy5++kXN5c5G
	lOH6JdvZLO53JlhnTptoQ+5123sg7aLx07Yrb04BDJ9rLAfPJtCRyHot9PudUGIG3LLCDuc8MotE/
	xXdYQ+xwUOSsIcWuoBRX8K1VLvB8REbSJlH6NATv9WGtvMrMgbtDsfYTt7sZXgxmEnImNRZZFxQKR
	r/qn7ACqIBQX12iqpcmq0O6MjZI5q0JrfcNYQ/xGa3qIyjH1ocHPGDxy+6QCvbh9LylH4yLLrE/D1
	fT8HlFUb9ZNF6qpGGvshJhhFxd3TCAwdqsgRgNwVBnvNSfdZXGDEj+zGoNo8bIcWEXcPfPWDrI94T
	fCcWBovjwpzlOe0Sp54w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOMBl-00000004XTP-0K1b;
	Mon, 01 Jul 2024 18:55:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOMBi-00000004XSi-2sBv
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 18:55:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E7432CE1A4A;
	Mon,  1 Jul 2024 18:55:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59FFBC116B1;
	Mon,  1 Jul 2024 18:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719860140;
	bh=tKT3AF9izf+QcbDm8dkJopSLoYWVl5irBxYlOLSNaR8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PKA+eRc2WG/QVP+QVEAWhNXRYqqGSLfut7VBnaBRpAZJO1xra4VTRl1+VVRG1YFgS
	 GJOeh6qhazQ898pkD26mgVKvEZKXgCIlR1GqdTBtzyRl476Xc2t2JqD4ELuzeA93pv
	 usB5z4YxpOF4ZlR9l8+LirFB7TmIWTEre3iLQ7XyRmP1DC5etOAkz5GEbqQGH+4BAV
	 Rx6IUUdaFI7aEEXPrt87KFMaT5q9qUgPyiY53LsPAXSS1E4T4ANpbi1sFvoF7GStrj
	 1cuSthHxKsH0mlC5cYy5sKMNXMGU50acMP6L9iNiymQXfyUMfYPZZth1pz+Y/iLjBG
	 N3T9Ui15HvpTg==
From: Mark Brown <broonie@kernel.org>
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: Serge Semin <fancer.lancer@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
In-Reply-To: <20240701121355.262259-2-kanakshilledar@gmail.com>
References: <20240701121355.262259-2-kanakshilledar@gmail.com>
Subject: Re: (subset) [PATCH v2 0/3] Add basic SPI support on TH1520
Message-Id: <171986013709.117703.4499828331646855828.b4-ty@kernel.org>
Date: Mon, 01 Jul 2024 19:55:37 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14-dev-d4707
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_115542_939261_182E70ED 
X-CRM114-Status: GOOD (  13.60  )
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

On Mon, 01 Jul 2024 17:43:51 +0530, Kanak Shilledar wrote:
> Implemented basic SPI support for TH1520 SoC. There are two SPIs reserved
> on the LicheePi4A, one on the SPI Flash pads that are blanked out on the
> back, and one on the pins. I implemented the one connected to the pad.
> 
> It is using a fixed clock of 396MHz. The address and clock frequency was
> referenced from the TH1520 System Reference Manual [1].
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] dt-bindings: spi: snps,dw-apb-ssi.yaml: update compatible property
      commit: 6c387fb263363347185bd7a213ad175c174d35dc

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
