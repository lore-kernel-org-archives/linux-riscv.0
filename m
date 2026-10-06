Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEDACA5FFC
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 15:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FOU3KtsIIlzpaeYEqtW543FEK4eGaoi7mvKjOQIcjkU=; b=p0oue/3Y3RgbXs
	D0Qo3wlhjxRKH9dK941ATyHceMxX3TkYFh3IlOzbEQOkMhmEVXeso6GXQoyeg1au9piYBQS7K0N3s
	RJE9loGwLnB31G1+LgYXrD2sN0yMMBqbMNeTlriUfXGsKXWzuvJWdBZK5PgZPK7FG/SjCPkIDP9Zx
	JP9ec4PmZ/1YkoGTVzT/XlCzL+/AYAdCtecOfCoqZZGyF2D9sNSCzJKqblzrzWW3dfY3GXgNG0B0w
	luzjcBZ7tTISDnILNnCCP0qkXo1X7SdbbA1qIh6xlQOWT7TMJjElxhT3qA0kRUCav7lfUm5GDE2y9
	TEPVTzKILtaDeiLFz2uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7Qh-000000014Aq-2VJi;
	Tue, 06 Oct 2026 15:50:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7Qf-000000014Aa-1J4h
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 15:50:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6AD98601E4;
	Tue,  6 Oct 2026 15:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D39061F0089B;
	Tue,  6 Oct 2026 15:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791301808;
	bh=MlmHww92f1vJW/S4QWSB1ZbKlcGagch0hBEyJ9FR60o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wn6W2CEmZCc1wmFlg+Vnsz5z3biQCNIJb9RVhkJBf4RvFhE+uWjpdf5k0lorTthIQ
	 invFXp/KL8IDg+OnlSlRFjV5eyhrb8e+r2lOg17d52DbQRWvfQhZfBV7lqXZmRXKf5
	 o6w+Hk4T/V78X2waoJ+VyxIBS7VnQkCuJ2iv0mkmnOV7JHUj3vup+cg/ECNdsOS8zT
	 FGUT0cvciRM2yj5bWY8C+Tz7ICdz0KMlxzy57kwy5vAkzdBMkzHlDBEpjHgk6w7Dqi
	 au0bqnftLOeUjqX3EOZIQRipBwqWnairTN3neiFfHgzQP1rAbR/ij4K7ZmrmzxdENu
	 HZpPC88ailUuQ==
Date: Tue, 6 Oct 2026 10:50:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
	Frank Li <Frank.Li@nxp.com>, linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@kernel.org>,
	Vidya Sagar <vidyas@nvidia.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	devicetree@vger.kernel.org,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Yixun Lan <dlan@gentoo.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Longbin Li <looong.bin@gmail.com>,
	Randolph Lin <randolph@andestech.com>, spacemit@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alex Elder <elder@riscstar.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v7 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3
 PCIe host controller
Message-ID: <179130180665.2390774.18094483716506116545.robh@kernel.org>
References: <20260929083755.458238-1-inochiama@gmail.com>
 <20260929083755.458238-6-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260929083755.458238-6-inochiama@gmail.com>
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


On Tue, 29 Sep 2026 16:37:51 +0800, Inochi Amaoto wrote:
> Add binding support for the PCIe controller on the SpacemiT K3 SoC.
> This controller is almost a standard Synopsys DesignWare PCIe IP,
> with some extra link and reset state control.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../bindings/pci/spacemit,k1-pcie-host.yaml   | 55 ++++++++++++++++---
>  1 file changed, 46 insertions(+), 9 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
