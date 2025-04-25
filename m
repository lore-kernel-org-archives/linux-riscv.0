Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A72C369C2
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 19:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MlcB4UjnnJpN2EMS6I1tCXZfMCx/hjYiW/GSYK3IO7s=; b=SXHiUj0CvkFB62
	4acLPpcDYihhUiOhc+0F2dht4ajRjRGSpgkZU1Qfr+H/MAKZDRQtg+i6UhjvD8sdMhHebLM2DOsMp
	85SS19D+Otm1iFRDnf9wArWxFBZmLljlrPwK3Z5arjLNzap3OdSy6imR/Epd7ui82bg5JNBb7TI/p
	IG4AMNxJexi5I2t/AhrgHjAQevx9l0Z1OSO+eA9Fzv8P5w/rdIT4DV1+xKjNUD6sWPcsGJcKJ1X3j
	0RmmSnRVtMB8cx5OXTUa6V+A/lTiAQsevZ5x2VEEA8aRkZc784g0B0/HyLp9b7V4wArnMZwDwWP+Y
	MOVCp19acsX7QGalvcgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8OUk-00000000ciJ-1sgJ;
	Fri, 25 Apr 2025 19:13:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8OR0-00000000c6s-3oYd
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 19:10:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BD3FA61136;
	Fri, 25 Apr 2025 19:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE858C4CEE4;
	Fri, 25 Apr 2025 19:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745608201;
	bh=LesrsmhbSWqU1lHUIefA8ynfKKgU2mtG7p0AEsjZN88=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=goTFm2rwiCqQJYjGFcgZRE81Bq8qB9LHlup/kh8HtQJXmVmvA27w6BzqdvzcwSy9B
	 6pINSKBnwDv3w9blgWzcQKRp7m+2haABsUoZbxO58HvrY0W/Fr834O4ljXAf8D3mKp
	 WV10C7tasbi22oAbYs63bzZGkWumDG7rvUn9ucnNtkOeBKDVt1NKZ1v6iTlmeLekPh
	 7DuEVcc8jdUFWC//uqkYJSzGQUbxAMo9EGFvWBdhV0F13NUc5Dv1ssPidGcwvtaTka
	 cg2lhZksHnZEtWv6UNqcQ6utAjlP7Q7GDdUYhI5Ab49dU9ugiPRzr1N5hvxKhsidz+
	 DWci7Kld73wtw==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Inochi Amaoto <inochiama@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Zixian Zeng <sycamoremoon376@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 sophgo@lists.linux.dev, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, 
 dlan@gentoo.org, linux-renesas-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250425-sfg-spi-v6-0-2dbe7bb46013@gmail.com>
References: <20250425-sfg-spi-v6-0-2dbe7bb46013@gmail.com>
Subject: Re: (subset) [PATCH v6 0/3] Add basic SPI support for SOPHGO
 SG2042 SoC
Message-Id: <174560819765.249436.3389646166213533296.b4-ty@kernel.org>
Date: Fri, 25 Apr 2025 20:09:57 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c25d1
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

On Fri, 25 Apr 2025 10:28:11 +0800, Zixian Zeng wrote:
> Implemented basic SPI support for SG2042 SoC[1] using
> the upstreamed Synopsys DW-SPI IP.
> 
> The way of testing can be found here [2].
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: dt-bindings: snps,dw-apb-ssi: Merge duplicate compatible entry
      commit: 71cfb1f88f772fb92a68a4ab85b16ccd5cc8535d
[2/3] spi: dt-bindings: snps,dw-apb-ssi: Add compatible for SOPHGO SG2042 SoC
      commit: 0889c4d28ad79b55ee8cf3c818e9d86203ace8f0

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
