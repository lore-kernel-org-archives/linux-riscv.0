Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D482C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 22:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gR43pi3hsImQAWYrhW9yFeEGWqoBPY5fxv7mJN645Pk=; b=LHhI3Ye/PW3+HU
	YWmQupo5DcNAftnxZAB1fnsPkLQJg7Ovve6feSaWC8qOHMPxqMS2hL82566Yw9Ns40nrws3uWTgAa
	ohMQ4K83qe5bZ6JN+54o6XRilSScJa9vhYz1byy0nfemoWVGUquOcSpxqkPTgjyBvaaIexYWY0nRB
	l4WvU1QotJVkZ6rpGWCbE5PZTj/36CvWn30MQ807PLgYTFmsIO44fGP4w2Mhz0XSnoUcIlPbSoEGX
	qm2FvQYNH+rqW+fKfwUpbSYDXtqIKM/SWGNV1xRbauGhe856jsnl8WhbKLTBU7jkonhiEfJggQJDI
	QoOH+kSccPNhhzNFvUvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHWHm-0000000EIxB-2sr1;
	Wed, 12 Jun 2024 22:17:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHWHj-0000000EIwU-2gCz
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 22:17:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 145B061773;
	Wed, 12 Jun 2024 22:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B88C116B1;
	Wed, 12 Jun 2024 22:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718230658;
	bh=ab9gxDF+pv9y5GqIwIDOyA5hgnkyctwuFMMl8d05w5A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lcgjuefBzLb++dSDcsDU9ub+6kukg5XLcDffztcSjpoHnCT41FxoDk0tMt2cteF+/
	 Nn5WWB87kF27fnqelYyzuccl9UvqQjmF5z5pf0ox6LAPlOF0lrkrdCpDK+ikBFNnmk
	 YvdkUqQK7l6nFkyHvVw7QNPdQBrLp5z5YNxzpTvFjnl1WnrriVUQpxMgKsoPwrwOmI
	 7uJCeHu0FRpSs2AlJgaTy2EXjFGbaEC58vN45EBzTLP837WesHhGVxmw24l+kkod+U
	 BD0rkJkYrGs3L99xzsZ1ycHclZFnvCrDbZnUG/6/33l3kks3ehNqHCeKN9awRnxXRT
	 p6rcAYI5Q95oA==
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] riscv: defconfig: Enable StarFive JH7110 drivers
Date: Wed, 12 Jun 2024 23:17:30 +0100
Message-ID: <20240612-starving-oak-e5c1139c95d6@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605071701.13737-1-hal.feng@starfivetech.com>
References: <20240605071701.13737-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=562; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=kwvEV7h9fafWAM0Xgw52j8nyzhHS8hng0oyJZ2yOCpk=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGlZcpWqfi8fVskFiuWU7O0QmGT/ZtZrpSNapetjPtY3H 5Hmrd/bUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgImUVzAy/PpeoFt9UdRoSvZ0 o/Db5tpK1Ufnn55j61H7MFuiIrDYm5Hhc1T4/Odupp72zzb9nHNUcJbjfYUbzSI9X4WsdR5cubG FBwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_151739_758836_B3E6AEF6 
X-CRM114-Status: UNSURE (   5.61  )
X-CRM114-Notice: Please train this message.
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

From: Conor Dooley <conor.dooley@microchip.com>

On Wed, 05 Jun 2024 15:17:01 +0800, Hal Feng wrote:
> Add support for StarFive JH7110 SoC and VisionFive 2 board.
> - Cache
> - Temperature sensor
> - PMIC (AXP15060)
> - Ethernet PHY (YT8531)
> - Restart GPIO
> - RNG
> - I2C
> - SPI
> - Quad SPI
> - PCIe
> - USB & USB 2.0 PHY & PCIe 2.0/USB 3.0 PHY
> - Audio (I2S / TDM / PWM-DAC)
> - MIPI-CSI2 RX & D-PHY RX
> 
> [...]

Applied to riscv-config-for-next, thanks!

[1/1] riscv: defconfig: Enable StarFive JH7110 drivers
      https://git.kernel.org/conor/c/d8a7d89abb09

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
