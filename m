Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC490E71087
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 15:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=3h047tmvkVv3qqiAdIdrOV/PGa85fcAAfhZZ67qCRlc=; b=X5UcDS+bcDqQLo
	zqi16n9KRGnpNbWMmNExifWeiQP835U0KV9aKgfRsCPq2l5Bx1mY8d+oj59eBIhynBknD/YJ/HVah
	RKAWuZo/1bdek3jIhDXFN4vjG8iqR/Zcb93DK3HOPQ29iN7U/NNVoJs8ad8Y49dBytBEpXYoUbErz
	Rag81uMLJvYe5NDrLHcfMVUVRDJswdgQvsJz4aWQTts6Bch0fauDb+ZGxYfnfvK6ZeIv4KKtJlBE4
	k6X/UUA3FMvSQcdw8s712OWPfQUMxumzRIOa3wtGTD3WDjavwuAPi+fc9/lE6RTfoV0MHjIb3TyXM
	FYZoGBEmziuyS3ctOWQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjLI2-006Mmz-1Q;
	Thu, 21 Sep 2023 15:08:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjLHw-006Mko-2P
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 15:08:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 83B7ACE2238;
	Thu, 21 Sep 2023 15:08:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75DA4C4E761;
	Thu, 21 Sep 2023 15:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695308896;
	bh=L0Y9YCcXIfYgNBjuyvMWPQWu9ej2m027Mk4wviryPFc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=gFqOvKwD82XZsHe76trqDACk/ukmKSHQJwz7bCZ7MJEH6nifbgBEjKRk6FWVzvDum
	 ooqrhdbeY3pDtPMG4uXEcnIVGNJGRkxhdeX81V/m+WYU6IG4sOSGXuQOwEfFfHhY8/
	 cQ3dnRizGPzyY24kv5ahl5Qxo2rqKrpqZqQNU6zkqXhBy36+wTFXYaYfAH9NH3701w
	 3tk7aPFDVUmL5+XcB13lGwt7TITWrmlIM+um0rBia3JEQEPMyQWXUXGogl03F+zXUs
	 I6fouyBEvFdignF5f+LWfr7ti9Gvs6tWnXCG+Y0wACYnSmQvrXmLQf/FjekRCApaKS
	 lwKCQM68yqdAg==
Date: Thu, 21 Sep 2023 10:08:14 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Minda Chen <minda.chen@starfivetech.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v6 08/19] PCI: plda: Add event interrupt codes and IRQ
 domain ops
Message-ID: <20230921150814.GA330660@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916-rescuer-enroll-dd4fb1320676@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_080820_987299_107AC5FD 
X-CRM114-Status: GOOD (  13.37  )
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

On Sat, Sep 16, 2023 at 01:11:29AM +0100, Conor Dooley wrote:
> On Fri, Sep 15, 2023 at 06:22:32PM +0800, Minda Chen wrote:
> > For PolarFire implements non-PLDA local interrupt events, most of
> > event interrupt process codes can not be re-used. PLDA implements
> > new codes and IRQ domain ops like PolarFire.
> > 
> > plda_get_events() adds a new IRQ num to event num mapping codes for
> > PLDA local event except DMA engine interrupt events. The DMA engine
> > interrupt events are implemented by vendors.
> > 
> > Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> 
> Perhaps not important as they will go away in the next patch, but for
> this patch the riscv patchwork stuff noticed:
> drivers/pci/controller/plda/pcie-plda-host.c:114:36: warning: unused variable 'plda_evt_dom_ops' [-Wunused-const-variable]
> drivers/pci/controller/plda/pcie-plda-host.c:118:36: warning: unused variable 'plda_event_ops' [-Wunused-const-variable]

Details like this *are* important because fixing them makes the
individual patches more readable, thanks for noticing!

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
