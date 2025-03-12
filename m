Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D649CC28B2F
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 13:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k5q9R0ccXi3W0Rg3R3gzNk19c6UZPzlVWe5yRIsaT3M=; b=W+CS63EOiKl4oE
	7wvHUjJ2vs5A+NXoi53MrWHfadaZ3jgFZ32EDs36sHI5TCWwghawO+HTMvcABVEvRVVzwpdoBYOeF
	qKIkHzgRzwiuAEKj6ml4X7PkUEYS/fdhRoC/mHtkl14gzq4Y0vLPS4/g8eMe5sDKdc9iiYWwaPZS+
	syGAbdkz3BXOMC956yt+9VAU11xw0gd9VHplrp4uWxkPzaVOMuQR5aIHxFPXJd/vJVfSvO3GuWZIc
	6nfFWOSJou05Pk5Q5EhTN0VoHbyEAUcncAejXFu6WBvZL/b5KX7ZnqRDKzGKkoHoCKwY7ZklF/2ah
	Y3lLcAhZcjl7VMiRB3AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLnI-00000008VTx-36Hl;
	Wed, 12 Mar 2025 13:06:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLNN-00000008Qd8-01rR
	for linux-riscv@lists.infradead.org;
	Wed, 12 Mar 2025 12:39:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3BE9FA45BD5;
	Wed, 12 Mar 2025 12:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E249C4CEE3;
	Wed, 12 Mar 2025 12:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741783195;
	bh=uZiOVB8yQ9iEfQm3YhLtHeR0IQkVJXdxQFzGtq4+Wns=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bbQ4ukLvpEYQWQ1qWqxi0sY7vsSyUPCOm3PHti24zHG0WGJnQqmiwt9xEuUHr3KMt
	 htqoqorYex7ALPwAKmFH+rihbbwBKpjrpGMOS7DLt/jlJSfU67Ft4tYTaLO4hxQEtH
	 VOTHI062k12tz9zfAWsPF0fNYVJIJa64nLWxWq6ze8PkSbfqfIgB4brTphVOPRFxHt
	 SfmDpuucqlTH763Nfx6t8hYed2lg3MCcQTB176yG8fD7a39lOAm8ANOY1rD8nhQzF7
	 dnWrMIwVLdyj8Wv28N1fVFtHori2uW3SPtBxNmOUq+HHSiVvZeTVrxFi/YN1Zx968V
	 oOogCKhPP5P0g==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Longbin Li <looong.bin@gmail.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sophgo@lists.linux.dev
In-Reply-To: <20250304083548.10101-1-looong.bin@gmail.com>
References: <20250304083548.10101-1-looong.bin@gmail.com>
Subject: Re: [PATCH v2 0/2] spi: sophgo: add Sophgo SPI NOR controller
 driver
Message-Id: <174178319298.22638.1373062138685342011.b4-ty@kernel.org>
Date: Wed, 12 Mar 2025 12:39:52 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_053957_114073_0C5550C7 
X-CRM114-Status: GOOD (  10.39  )
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

On Tue, 04 Mar 2025 16:35:41 +0800, Longbin Li wrote:
> Add SPI NOR driver for Sophgo, including read, write operations.
> This driver is only suitable for NOR flash.
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] dt-bindings: spi: add SG2044 SPI NOR controller driver
      commit: 9f95e2dff3fe6a5f4cec786a106558bb8f268a16
[2/2] spi: sophgo: add SG2044 SPI NOR controller driver
      commit: de16c322eefbe9026d4eabc8ae934bb778cffd1d

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
