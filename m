Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B19C71136
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 17:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZvVcvA2hn2nGvUWU1B85BknSrd9LcjkopVyFxbdzYc=; b=LVpC1A/W3njRvG
	+axsXn+/Vz2mK3wHoeSn09lwB72eDxbvqWoDUbRARNWcmv9Hy2Q0Bbl6dfLUBXSSHPVvh8YmruhEh
	uGqD/2m5oReTxICk2qSqTn2fKXI8NFly2R7yB9mS7PxkO8EvY1gtZiytl/zmHWLhdYKpxmSotcKq6
	41LaaKRSZbTeGKEeghdn9drPfL4CprJ64eibmYSQiAfc5mgMXG8TFkPBU/A91CMXr/KJLu0kI2fU4
	q80c/v4SFdIlNgMkarHJm6R9F1lMchX+xPfD87KCpa0n7ZGEQSrhxHDZNHsk0nR8XFZBjMr1wfQD6
	UkIy9ne9iVekSHRCrscQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRa8D-000000083EF-0ZjK;
	Tue, 17 Jun 2025 17:29:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRa8C-000000083E7-0eMu
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 17:29:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 34A2A614BC;
	Tue, 17 Jun 2025 17:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE75AC4CEE3;
	Tue, 17 Jun 2025 17:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750181394;
	bh=kP7DtPobetpD8bDkvcYCTMcEVbz+KzFg7wDQrlKUqKQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nFyj07kMSeHI22kL0ri0CoBmyqpg+75j55Xz+grZh1JBQ0M8Nw93ijsbWsLg201cm
	 CTDpDR3MGpekcIM0ol1iK9alHd28sFBTJmLsdmNAssAbMYx2083F2kWC3EY6A65ie0
	 QtGJHodFUApA6ak8u/529aLXDPefdcLRKpPlG28GNoBXOkDx/AJY2Fh5/ZXpdl8qcp
	 TblkEjEulg5TKI9aC9N86NuIvYEHSjkI/pO4rxNy7EgV+v+O4cHkBrpV0HMm9YAQhg
	 0U30SvS6CIcL1pjjdEj1rva/4ErLB5psnbCL5tfH1JqhkrHWayRQVVeZrk9azFM9ZO
	 YS3kPy4ZB4tog==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Inochi Amaoto <inochiama@gmail.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
 Longbin Li <looong.bin@gmail.com>
In-Reply-To: <20250611081000.1187374-1-inochiama@gmail.com>
References: <20250611081000.1187374-1-inochiama@gmail.com>
Subject: Re: [PATCH v14 0/2] riscv: sophgo: add dmamux support for Sophgo
 CV1800/SG2000 SoCs
Message-Id: <175018139039.182101.4835726385229916529.b4-ty@kernel.org>
Date: Tue, 17 Jun 2025 22:59:50 +0530
MIME-Version: 1.0
X-Mailer: b4 0.13.0
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


On Wed, 11 Jun 2025 16:09:57 +0800, Inochi Amaoto wrote:
> As the syscon device of CV1800 have a usb phy subdevices. The
> binding of the syscon can not be complete without the usb phy
> is finished. As a result, the binding of syscon is removed
> and will be evolved in its original series after the usb phy
> binding is fully explored.
> 
> Changed from v13:
> 1. rebase to v6.16-rc1
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: dmaengine: Add dma multiplexer for CV18XX/SG200X series SoC
      commit: 994b5709f9f83c48f607e9a52912c912b8149421
[2/2] dmaengine: add driver for Sophgo CV18XX/SG200X dmamux
      commit: db7d07b5add4d839df74adab9940cf9da488313f

Best regards,
-- 
~Vinod



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
