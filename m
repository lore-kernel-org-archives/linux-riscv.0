Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8597EC5516F
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Aug 2026 02:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fKY/BJvmMPPWiDxHYTlFYO+YIxlR3PrdI3c01evlRyE=; b=PjxDl/fo1TUEy+
	ihrcQnG93lWj6o55nFfoP+NiPgQHeoVUhPoLjC38a4ExkUCci6fg5UxHtXkvtRY6OC/AvjO5kA9jD
	KU+yiJ/5EakaJm10+FfZXNPsU9lGSBzEZTbMzsk+KiKc6lpLNM30x4I3YVt17GQCsqgM/eA/hWF3l
	2OcUsGlUCx5Pn8wBNlKwv0uJ9P8JlMXO1Vi1s7bCbHgUMqFDSRf5BaX6HoNm5axC1EQ/ntNLsvSFW
	LyPqFz7gFCh00bjt+2mPDPn5vLb6jYevGUcNH0cYRr/knFc3tHQmVT+gU0+G0SpxiCGP/taGmPHE4
	uIB7nT5hZ048BQ5Z7wwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqLmx-0000000FHPe-2iaA;
	Sun, 02 Aug 2026 02:18:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqLmw-0000000FHPY-3q0E
	for linux-riscv@lists.infradead.org;
	Sun, 02 Aug 2026 02:18:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 896B642E9F;
	Sun,  2 Aug 2026 02:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9710D1F00AC4;
	Sun,  2 Aug 2026 02:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785637134;
	bh=ha/y3iJzugwKfDfSEUohk4Wr/4wbO8BU3nBFbQbxb4U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nVXWPbTUEXgWkUO0Zk9bfXhP9uVCNbNV8mgtb7OTKNWdUOhf1x6CVgOAqKFMSFi0b
	 VQaewISYmEZnK+PNaIb/LwUPkuXFQ/W+0tXLL7cc/uw7LmcUdtt7sjZcywTE3rLaIG
	 A/dzU2nGm/v/eOj7gyJUHp9k4UJLzxuD7+ErAqYeT5yxM4ACK4fsxM/jFskATZ7866
	 dJL8xhKb7TWVvyF06sZEOTpb1py500buhABf4+ymjWv0QXpXc3N6vGwzjNDIDXry26
	 J7uGYjk7QL5g5BWgRtkAfI3o20mA4n/lfr5zbKd6njqhCCQCYDwZ4cVSa1NREXqVqQ
	 cJZUXmIb2QTtw==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Make dtschema recognize the etherent PHY correctly on K3 pico-itx board
Date: Sun,  2 Aug 2026 02:18:47 +0000
Message-ID: <178563711049.1616541.10192420990220597678.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729012418.154652-1-inochiama@gmail.com>
References: <20260729012418.154652-1-inochiama@gmail.com>
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


On Wed, 29 Jul 2026 09:24:16 +0800, Inochi Amaoto wrote:
> Since the previous commit does not change the phy node name,
> the dtschema can not recognize the type of the ethernet phy,
> so the following error is produced:
> 
> /arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: phy@1 (ethernet-phy-id001c.c916): $nodename:0: 'phy@1' does not match '^ethernet-phy(@[a-f0-9]+)?$'
>         from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
> /arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: phy@1 (ethernet-phy-id001c.c916): Unevaluated properties are not allowed ('reg', 'reset-assert-us', 're
> set-deassert-us', 'reset-gpios' were unexpected)
>         from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
> 
> [...]

Applied, thanks!

[1/2] riscv: dts: spacemit: Make dtschema recognize the etherent PHY correctly on K3 pico-itx board
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=9b371a8b13fd0e8e6f3b12f4ef7e58927d6f62ee
[2/2] riscv: dts: spacemit: Make dtschema recognize the etherent PHY correctly on K3 com260 board
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=bff5af3c934740481a316c5ae1cd4a09a43134d0

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
