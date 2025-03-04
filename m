Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BF5C282D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 19:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=1XtoMD8Cw03/wyGlsthh9Pf2rE6PAAQgO9uEOOrOtgk=; b=sRe6vMeWyyxwDR
	sGtuWPDDI1A0F18Um2FgnkOFMHtNL+5D49HiZqMZAlNw+EuxW4/qXwfdz8pFd4kmbhDZAM5y3IwFi
	7JF/BskwvG1oeJoRuG5hMXJtcM/KZcJz4aMZEvOLVs54kRmylg2u82sD8PUy5TAJaSEEeQD6mD9Xj
	w2v/9PUlEGdlJShhKQasvO3RvcP2dshn/2CxW0pCuzon23svC+ZT3T8xfx7cw+oGjhCxETESanZGO
	l2WmVwNrCJ/Dx2eAecTVqVkPL3D1QiKTJTtX52nBQW71l9ipwhQDo/W8m07JaCfThnBCAATeXUS3A
	1JL0hBP0IN55SFN7LNlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXe1-00000005xvO-1Tp8;
	Tue, 04 Mar 2025 19:09:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWCE-00000005f9h-3XDK
	for linux-riscv@bombadil.infradead.org;
	Tue, 04 Mar 2025 17:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:References;
	bh=NRSffwJr3NrNdZ6TOovjX4sP1/4UF2xVzxV2/+IGyBg=; b=Bv1YT2fa9S/pm1Drs2fqQu3Fan
	R5fdtfwSlWcNfqfDuxIGK+IMVNGPUpF6bkAm3lTLsyPndf8XAs5zATEYBY8RwTOooBGMO1+Vw4Myj
	wPD52/l7mHUZTxG45XKPIjw2ra51iGAkQOwWLStSed722fTuWiEt/pGterF+qdwsycMtO2+93SMr1
	XlQU0i1MOE0O6BVpi1Ock7B1M99WicQCmRsYha9cHj8gb/NEGCl8R0QeEEeFeeG7hVQQjZlO/f7LC
	EcZ21V90eBntaF9M18W4TF9G32Jy0h3tyf1qIpMwWakLpJZ0PHjTFqmvBy+Iq4P4gDQS1AjRqtE98
	cD+tvEVQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWC7-0000000086z-0qH2
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 17:36:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 908F5A45ADC;
	Tue,  4 Mar 2025 17:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C95C4CEE7;
	Tue,  4 Mar 2025 17:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741109794;
	bh=4xp4+anK14JQk+kT/F+uLJnv73+F1a80g9z7dafx3bU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=bKYyMLJ+yOp+0aO9VyEpW+tSgo9qctpb7iguPytHoQU0sfJKJ+XoZAJZmaQkjyTfT
	 hehyQtmSyO4BUnQZBl+mhm/sv2wrBZoIEYviegMRdxEJ7ET4WyniNFxMd4W+Rb3kTi
	 V4pUatRzJzPAIaZ1OapVH/ueOT+AATjfwo/PhvKnT8xKN0v9sIquCXlF2f+VQfkpd2
	 nROLiqP3ksHB+/N4ZvMOdbFJQC9N5s0sN2YamzMzDksrwVwOR5iuJQf1tKMdAM0Nig
	 cnCboG+5xb+FcRmw2NSvQAEIEaIRnEld5eCqvecQ5KY0OWd1es3JFcFiU37U+HAXLH
	 2Bi6Nt2CvY5AQ==
Date: Tue, 4 Mar 2025 11:36:32 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Johan Hovold <johan+linaro@kernel.org>,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>,
	Niklas Cassel <cassel@kernel.org>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] PCI: sophgo-dwc: Add Sophgo SG2044 PCIe driver
Message-ID: <20250304173632.GA243820@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250304071239.352486-3-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_173641_289947_664DCDB8 
X-CRM114-Status: UNSURE (   9.47  )
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

On Tue, Mar 04, 2025 at 03:12:38PM +0800, Inochi Amaoto wrote:
> Add support for DesignWare-based PCIe controller in SG2044 SoC.

> +static void sophgo_intx_irq_eoi(struct irq_data *d)
> +{
> +}

The empty .irq_eoi() is unusual.  Why do you need it?

I see that the existence of chip->irq_eoi() makes a difference in
chained_irq_enter() and chained_irq_exit(), but I'm surprised that
this is the only driver in drivers/pci/controller/ that implements an
empty .irq_eoi().

A comment here about what is special would be helpful.

> +static struct irq_chip sophgo_intx_irq_chip = {
> +	.name			= "INTx",
> +	.irq_mask		= sophgo_intx_irq_mask,
> +	.irq_unmask		= sophgo_intx_irq_unmask,
> +	.irq_eoi		= sophgo_intx_irq_eoi,
> +};

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
