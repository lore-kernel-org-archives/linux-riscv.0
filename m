Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F590CD5BAC
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 10:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P1e3kn45qE0pizKMoziGcJ2Sx6cChFnBPANi+ZIfkQU=; b=LRCiNDtEIbuW8m
	Cql7da7bqsL1Q8+vZJz/J71YmSKKbf/5EAH4MjUHiZ318NS7teyF6cpqw+hRXzibsJWecZse9Z7/D
	R4zNKrrU6f5xdd/B0eEnVs2NpIYeKe06bLiKyvA4bYtA0WEbFXA+ZPPBJ3XsteF2G9uYaTu1aJxIL
	u3hPstcLKha1UoeFfxiFoMShHpdDoDPsVJTajEQ3LmgZ31DBDgRxW51JoOawPgD//jTsOkjUil4BG
	CKpa0DDsMXQutMXPiEgvesfTZs7UEdJxQVGZaDlSVX9SV2h+tlFMBcSjXq+o3Bbt7l9pXBW7PzV9Y
	iluqeSLgbO5YVnVDEcNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQN2b-0000000AVPs-2v0m;
	Fri, 22 May 2026 10:23:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQN2Z-0000000AVPX-2hU7
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 10:23:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B9EEA60136;
	Fri, 22 May 2026 10:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361DD1F000E9;
	Fri, 22 May 2026 10:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445418;
	bh=yDrstzdR7pm6qgaRcXyznHIDlRMMlAK2eQAaoYy6AYg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=g+ecN4c9DTbwGbx2PFY2yRiHeTH1ikc3KEeS6J12JW30l5zWHW91IeChQ5gKbijYO
	 MIKjGOcX07D4IATt8V188hUuOt3l/ygLpTkhTbEXBkwPmgecEl2fiMn4MXVQQNQnSM
	 DeKHixuqmb0cnE8Dxwjqo5U5FFdXvqgVj4mt4shV0rbOfJ+s2bEB0huPm6bMN4bvrX
	 2l7y/udXrpTxJ+5f+9oZQGIBuDezrkJvKz8BIUu2hbHMSk/LiKUYvZTHPqTlBlL5+V
	 wfZLEnPcX7NG9wdOYyZk7AbE7EY490xcd90vaIHY9vHxDSPGwzVfm5mkj0FeLvq8y5
	 TJ1Z6kMJbV3UA==
From: Mark Brown <broonie@kernel.org>
To: Han Xu <han.xu@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Zhengyu He <hezhy472013@gmail.com>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Wei Fu <wefu@redhat.com>, Cody Kang <cody.kang.hk@outlook.com>
In-Reply-To: <20260521-k3-pico-itx-qspi-v2-for-next-20260521-v2-0-52bce26e5fd8@gmail.com>
References: <20260521-k3-pico-itx-qspi-v2-for-next-20260521-v2-0-52bce26e5fd8@gmail.com>
Subject: Re: (subset) [PATCH v2 0/2] spi: enable the SpacemiT K3 SoC QSPI
Message-Id: <177939697296.58022.13134350906146797210.b4-ty@b4>
Date: Thu, 21 May 2026 21:56:12 +0100
MIME-Version: 1.0
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1313; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bG53QNlIvVM95nt6OrzkbN1Uag816hCHZAR/0R9tVdQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC6mrJSZNWN8SmN4CqNtHx2CW/DeWM7t3Y7z6
 wBsv7IFkeaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAupgAKCRAk1otyXVSH
 0J6lB/4sm2AekTdbwKgM4nO4GaonO8gR4rnmaqoMa48pK5P2wSta2B2HgLEeCK6BTuDBMGe4PP1
 BjQjUQ5xmFT1H+BTQTx35lk09mODpVXMd2cnirYR2MPc6L0f5n3PcPGzQrkO3/nwGLA70FDesDP
 AMfOkgaR+2WKYaIUtvDf1avZwt3nfBGXfVcvUwDMQsC3ME0GS9kJ3MERs7zTOkuV+xTqqsNsjlV
 VDkYkOXFai1bzHzQZLEMe0G02IujZouXPTBbek2tJIC5TgsOr8/Ck04zcjGjn4RcOfFFXbtKi8Y
 s9UJzxhsOARNT0GIxhmw0brPZIAdgqBJJO0sosbbFvlAqUAy
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

On Thu, 21 May 2026 22:44:44 +0800, Zhengyu He wrote:
> spi: enable the SpacemiT K3 SoC QSPI
> 
> Add the SpacemiT K3 QSPI compatible and enable SPI NOR flash on the
> K3 Pico-ITX board.
> 
> K3 and K1 use the same QSPI controller, so the K3 devicetree uses
> "spacemit,k1-qspi" as fallback.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.1

Thanks!

[1/2] spi: dt-bindings: fsl-qspi: support SpacemiT K3
      https://git.kernel.org/broonie/spi/c/27cd2dde35b2

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
