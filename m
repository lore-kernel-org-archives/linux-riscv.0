Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14151C43602
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 09:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hcfUmphWdqu+VX4imz+1T/m5yr/ONSojsB/xbN4vwIw=; b=PIXY6Za5N6JUdI
	QCwpxRSgLww38Avxrootn4aZ9RlS3YRCBJBUYKIY9hjHKvl4O8agtnVedT8hToCiiSK3DN9Mq0mbp
	Z3RARdZO67H3iPaevuP4LbACG10MxuEVK4xRvQ4CyjvlcRsqg5wUpMVFQNRvsW6+g6BYOovttpPBO
	ngd/kow9TRNKNnW2LgbYcZmkwNhaWZS6fDnCETseKJwZBmrh4TuNEomcdwqo0qbq9E/zYeEKBwIMi
	QtPtjuDsVDxuVKnTTVrO8I3km8pC1YTXS/Rx6/aNS2ehc5d9RrD0q+RQGxQJ9emtj1LUK9ModVe6I
	HsmTMUxEl7eVwdLvBvwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgJHu-00000009Cd2-3mEy;
	Sun, 05 Jul 2026 09:37:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgJHt-00000009Cct-1WTs
	for linux-riscv@lists.infradead.org;
	Sun, 05 Jul 2026 09:37:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 250864080F;
	Sun,  5 Jul 2026 09:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D819A1F000E9;
	Sun,  5 Jul 2026 09:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783244239;
	bh=OMATudwiezEO78XYuEQmPCbDsJhZp6+LpEDgDoEb6vk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HmXltLFHrI/qpw4LNwl/aaSXFFQpk5KB3sfHpPGVQMn51Fkvtrf9WW0r2YxbP5z6c
	 chMtlhxCPbfoevKv54icziilQKdUhBBBY5sEaJxjmBRm+9cSGkRjqlZ0P+lrFSRu2d
	 erilJLv/Stfkdl3dYERyfACZtBmmJ0wp/DMge9cYI/UapBeD38QtZMgQ+mAxzfbMgB
	 JhzyeiRj8YtI72iHI3pP419nrAfLUcYgpqWA37+X2pTf0a34xq2kT0NEZqZqZFmGMo
	 Y06iF/j7kVYZll6fU7FUhpfTuRIdg64JYo2FFwGvXr1YHlezEkV0YIRTGaNKCZWJWr
	 0D4dVrtEEBSIA==
Date: Sun, 5 Jul 2026 11:37:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Christian Bruel <christian.bruel@foss.st.com>, 
	Frank Li <Frank.Li@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Xincheng Zhang <zhangxincheng@ultrarisc.com>, Alex Elder <elder@riscstar.com>, 
	Randolph Lin <randolph@andestech.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Vidya Sagar <vidyas@nvidia.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v3 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3
 PCIe host controller
Message-ID: <20260705-versed-leech-of-glory-db5cfc@quoll>
References: <20260703020003.485436-1-inochiama@gmail.com>
 <20260703020003.485436-6-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260703020003.485436-6-inochiama@gmail.com>
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

On Fri, Jul 03, 2026 at 10:00:01AM +0800, Inochi Amaoto wrote:
>  required:
>    - clocks
>    - clock-names
>    - resets
>    - reset-names
> -  - interrupts
> -  - interrupt-names

Why?

>    - spacemit,apmu
>  

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
