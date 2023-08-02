Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE307C04FE0
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 17:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=a9U7lxudScZQh9373w2x36Zzf/1Hswp4x7MHR7CBlEM=; b=SjIEhvc4Ikd7HU
	yP5dl6XbtZlYOFY5owysy5eeMtM7Wegdb2w3hLDy5X0DMeWqNEibiYPo7B2KTLhCxFhAm2b88zdbW
	lASLacpTOTvlA/Iy6qSG7ZQX0HRpMrG++EV476ZsDI1pDhnM1RnD5qSiWUnq2z/Rgm3jGOp7AwVLK
	PrbNZcYoU5Co0q4TmqcNi4VglD8BVQF8FNvzdhWmrR7JsRZTuwVgRJ8zEbbfNvB39HhjAcRckOEpo
	57yD5+uDkTOa3cwJcCLoXwvt7lo6iKzv2zc4jtq2ya/BKjMBZ1z2PfpP2NgcH3a1qdK4VODoh5e+5
	xdETMGEcRIyepzpj0X4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRFQQ-005TQ5-0l;
	Wed, 02 Aug 2023 17:14:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRFQN-005TOn-0U
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 17:14:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 44AE961A33;
	Wed,  2 Aug 2023 17:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE05C433C7;
	Wed,  2 Aug 2023 17:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690996451;
	bh=F/rbjQiOyfgmgFmuIV8uZJPoftBhb6PoDzmZlYlo/mk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=rMetctBa2mih8ulDzZ0ox7FtFspbLeoqpDJNHEjLQqDHnJCex0Ijhf6bQyoSlYyFG
	 meh2Pu/LNy222/iMlJt20h1SIzntJ54dHf6YCbQ8MfOlAiaT2d7PC1VAapbTPXHJcj
	 sForDf/cJabTCpRFm0IgQmuEmVyAgZKqQs7MG1BRSzHVI+AJpoWa81SzOPhOonnGPw
	 tKV3M4aO4f/OHzZFXFdTk6OGdxX4pjB0P8slfchtqkHEmD229HxKkJCMCBp9uaNdFE
	 FQcYaVEMVdg5g+sKb7HdRs9WA+2tbuZoZAMWFS1do3N6ITmFqHKtoy+BCjOmNQwHez
	 WzAyOO+ItsEhw==
Date: Wed, 2 Aug 2023 12:14:09 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: Kevin Xie <kevin.xie@starfivetech.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Subject: Re: [PATCH v1 8/9] PCI: PLDA: starfive: Add JH7110 PCIe controller
Message-ID: <20230802171409.GA62497@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230801071453.afaulygpczpyhopk@pali>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_101415_230795_363FF699 
X-CRM114-Status: GOOD (  14.12  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 01, 2023 at 09:14:53AM +0200, Pali Roh=E1r wrote:
> On Tuesday 01 August 2023 15:05:46 Kevin Xie wrote:
> > On 2023/8/1 7:12, Bjorn Helgaas wrote:
> > ...

> > That's the point, we will add a extra 100ms after PERST# de-assert
> > in the patch-v3 according to Base Spec r6.0 - 6.6.1:
> >         msleep(100);
> >         gpiod_set_value_cansleep(pcie->reset_gpio, 0);
> > =

> > +       /* As the requirement in PCIe base spec r6.0, system must wait a
> > +        * minimum of 100 ms following exit from a Conventional Reset
> > +        * before sending a Configuration Request to the device.*/
> > +       msleep(100);
> > +
> >         if (starfive_pcie_host_wait_for_link(pcie))
> >                 return -EIO;
> =

> Maybe this information can be useful here:
> https://lore.kernel.org/linux-pci/20211022183808.jdeo7vntnagqkg7g@pali/

Yes, thank you!  That is a great summary!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
