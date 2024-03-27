Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0915BC47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 17:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PrITLdvQQSVbhCxgvyOPufoo+g/Vcg4ThcPNyCnFSEU=; b=p1rdDiPKVBc9iX
	RPIeaAF6Fs9NxDYea+dbzV5Lsx7nllELHhjk8vjEVbt58sBqH22C7oR0l18DROwPzcsFJG9+IvfNT
	uur1AuYsI/PTMIzhGq08JyAvhEARHVZBCBVpiPR/EGiQU94lovZ8coTV/MEPS8essycmHOml5BuoJ
	GxhK9z5AdoDqkndMesOTutHQ1zsctCAdEfUnlF0/jyPikBcVVwHal0nDS1FA8UbvrT57OWwKlYpJW
	Y4PdPRT0jl+Ck41LWLLK9UX82J3nU5DvTgUH2pPql5x4DA9euSdoJyZd6/rF64Fyo8mi7wCWtyTHp
	DWrjCfxwyKdNFo46X3pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpXWr-0000000AQ7A-2xff;
	Wed, 27 Mar 2024 17:57:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpXWo-0000000AQ5N-3p9o
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 17:57:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 40096CE2774;
	Wed, 27 Mar 2024 17:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57813C433C7;
	Wed, 27 Mar 2024 17:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711562252;
	bh=AlaqdPkks2T8kN3/XZCb1mzjIR6gKPmZMmB62NcvVGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=msWePaHd45WWSJoItV1wa5g5P8rLteY6n27odI4pjYb1E8Ru5fv01kMwFf8bG9Nlc
	 q6fTwx/Uj03xlPJ2PsOoPHrInspsC5FXDpeRGfHAJnbYxCB6z8XxkDJwC2FJVbgZe2
	 80GM2BZ+8cUClG+HWasgzYWN1rR05Dk/5qRzUIh0Q2c+vnfCSvhEkTOSvC92y1to0t
	 BVZPd73DtPLmgK51qe7J8vIECdorCQxQe+fKeracEuncB2SrddW1zayrMUrrMLnE3D
	 lmoluO91BwEUqF0JMCtxshY4NdrP+YTClN8bqXF22MGLjSejXIgdnvD3i5uoMS9pE3
	 Oeujp1xFRyBhg==
Date: Wed, 27 Mar 2024 12:57:30 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-gpio@vger.kernel.org,
	Jamie Gibbons <jamie.gibbons@microchip.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Subject: Re: [PATCH v1 3/5] dt-bindings: gpio: mpfs: allow gpio-line-names
Message-ID: <171156224981.3706851.349408739787363074.robh@kernel.org>
References: <20240327-parkway-dodgy-f0fe1fa20892@spud>
 <20240327-overrate-overuse-1e32abccd001@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240327-overrate-overuse-1e32abccd001@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_105735_334477_E5576F02 
X-CRM114-Status: UNSURE (   9.16  )
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


On Wed, 27 Mar 2024 12:24:38 +0000, Conor Dooley wrote:
> From: Jamie Gibbons <jamie.gibbons@microchip.com>
> 
> The BeagleV Fire devicetree will make use of gpio-line-names, allow it
> in the binding.
> 
> Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
