Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E255C531F9
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 11:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E+zOsxpP8FDH1UJ0XVp/p426/DdZxsfzyJrzpivtugk=; b=tYsv5a9tJeBFrM
	qWuwSp0qXWiiIXBk6ZQoC6n6X2UBM2p1ep8SuzOT1ToM7NS4norDrWOuBSzSwP/sYH/h2EXNMPtEo
	wfu15BDE8T4dmHhN5QpVZ0P9nVCFCZUSjPdNGsIUIC2WO4CY6GcONroXOZHtusDpHd3R01BCvjt/y
	mRyI1AkTetn+GrdiDdkA4NYVxiPt2l4R+tTvxla1HLsv0YcWbPUQ+0OuG0Ao9YxEMNXuZmJRpLeKy
	O132umBBxWzR1cP1HFYzp33aQJzhGZGLwSkzgzZzsGbjOiB6oWnCGA17g9cfoQAKavDFpbHLCszdE
	ff61Cf37ZwJjJ5b6UFPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogB0-000000056L6-0Q1f;
	Tue, 28 Jul 2026 11:40:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogAy-000000056Ks-1RIB
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 11:40:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C390660AA1;
	Tue, 28 Jul 2026 11:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D88D1F000E9;
	Tue, 28 Jul 2026 11:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785238847;
	bh=eNeWYbTR74tZP7nHL7GdGElQBSXq6Vsaucp/Nwsmf7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OynG/Nt+c3Ep7wsaOFwFD57+iTBqHdirtUCye4OEcO6JdhCCbBcoXaYjvAYpTU1rm
	 9yDhQ0uU5gAeh1WS/zO6jwaAGkzZLH/DOFxlwt+35q4oHtm6P4SbgXInW4QYYW8JTY
	 4SrIkJW/ahu6r5XMFOUVfAb6vy8qdHAzumAjBf0kJJUTYOgO9VKNkTu877NSzhE6/q
	 QnUFhmOxcRE2ruqz2YqxKtphODCoDnxAyW1/cTgqUiP0xael3iiidSOsZDsQrPkrUW
	 PmZLjZBb/tT88EQBpZ/OotqsRI2/Fal6/7vo9tVODYhUR54od/MtQYqhS9CcCvfoKZ
	 bR2COLcrCFNZg==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Mark Brown <broonie@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Zhengyu He <hezhy472013@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	wefu@redhat.com,
	liyeshan <yeshan.li@spacemit.com>,
	Guodong Xu <docular.xu@gmail.com>,
	Cody Kang <cody.kang.hk@outlook.com>
Subject: Re: (subset) [PATCH 0/4] spi: spacemit: support K3 SPI controllers
Date: Tue, 28 Jul 2026 11:40:36 +0000
Message-ID: <178523880270.625143.9262496497470921817.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-0-969a1b0f783f@gmail.com>
References: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-0-969a1b0f783f@gmail.com>
MIME-Version: 1.0
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


On Fri, 17 Jul 2026 07:45:24 -0700, Zhengyu He wrote:
> This series adds K3 PDMA request numbers, documents the K3 SPI
> compatible, and enables SPI0 on the K3 CoM260-IFX.
> 
> This series is available here:
>   https://github.com/imguoguo/linux/tree/k3-com260-spi-v1
> 
> This series is based on v7.2-rc2.
> 
> [...]

Applied, thanks!

[1/4] riscv: dts: spacemit: add K3 PDMA request numbers
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=e57a4beb33df5b5b91e8af7c8abac5f49838d524
[3/4] riscv: dts: spacemit: add SPI controllers for K3
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=324c9c10839bec6da848b8947ca33e0b23d6b735

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
