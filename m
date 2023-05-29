Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AC8C7EE29
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xa1tVo0OvPSNtkVIfz1n7uz5yPPw0zZOivLdRG48iHo=; b=tzGauruTFHbF7U
	3igjQlK4BrNWrf8RUFtr1YDp8m+hGXQ+SxE+0gIcN/BLvA6y/UuIl0d/lir6uuMGBd5fJHaQJd7jc
	EkP33m5mgdEcpA7vW+1sagx4h9kh9poHYo0n2M1x1aRqBuSSzkeTaqYUbh9O40jsYjjfoeGx01wcE
	ECdXfjms8CTcyJ6xsraxG1TDXEYQKKZZKZOEdvGoRIKIQN5ZV+8piyyCEdmj0ikWdgRFJKS9VPW0e
	pV/Hn+hBLg36E6EiJsM7ubjZPr+veGS1m65LjHJ2dwR33gnM8/TSfZo3sJiIOaLOkamw7diVEuQ5q
	Sh8m315X/L+l2DuVxmUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3eEi-00Aqed-16;
	Mon, 29 May 2023 14:52:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3eEf-00AqdK-2B;
	Mon, 29 May 2023 14:52:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E079C625D9;
	Mon, 29 May 2023 14:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85F0C433EF;
	Mon, 29 May 2023 14:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1685371956;
	bh=ruooO/hib2eTqtlqdlGt216wI4HkJrfG1ILQsX52itE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nJebyKeflDMM5C6oB2CfMassfdovNwMUV+z1ZshUEw77BFvbe9bZvCSW7Xn9Dy8y+
	 aHzdo6eK+u4d1Y3xC0idUGt5RHO192gedw0PG09MTuNPIxJVnCR6so+WtCWJyPL1tN
	 WgelPvDMo/qoPKhhnRCwd7xVd7nVnopNNv6kcKpM=
Date: Mon, 29 May 2023 15:52:34 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Conor Dooley <conor@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Peter Chen <peter.chen@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Mason Huo <mason.huo@starfivetech.com>
Subject: Re: [PATCH v6 6/7] usb: cdns3: Add StarFive JH7110 USB driver
Message-ID: <2023052926-shiny-unelected-5d5f@gregkh>
References: <20230518112750.57924-1-minda.chen@starfivetech.com>
 <20230518112750.57924-7-minda.chen@starfivetech.com>
 <2023052951-humbly-dentist-cb9c@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2023052951-humbly-dentist-cb9c@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_075237_749223_807FEBC0 
X-CRM114-Status: GOOD (  18.25  )
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

On Mon, May 29, 2023 at 03:50:04PM +0100, Greg Kroah-Hartman wrote:
> On Thu, May 18, 2023 at 07:27:49PM +0800, Minda Chen wrote:
> > Adds Specific Glue layer to support USB peripherals on
> > StarFive JH7110 SoC.
> > There is a Cadence USB3 core for JH7110 SoCs, the cdns
> > core is the child of this USB wrapper module device.
> > 
> > Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> > Acked-by: Peter Chen <peter.chen@kernel.org>
> > Reviewed-by: Roger Quadros <rogerq@kernel.org>
> > ---
> >  MAINTAINERS                        |   6 +
> >  drivers/usb/cdns3/Kconfig          |  11 ++
> >  drivers/usb/cdns3/Makefile         |   1 +
> >  drivers/usb/cdns3/cdns3-starfive.c | 246 +++++++++++++++++++++++++++++
> >  4 files changed, 264 insertions(+)
> >  create mode 100644 drivers/usb/cdns3/cdns3-starfive.c
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5519f81c8296..06c63f43bb17 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -20168,6 +20168,12 @@ F:	Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
> >  F:	drivers/phy/starfive/phy-jh7110-pcie.c
> >  F:	drivers/phy/starfive/phy-jh7110-usb.c
> >  
> > +STARFIVE JH71X0 USB DRIVERS
> > +M:	Minda Chen <minda.chen@starfivetech.com>
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
> > +F:	drivers/usb/cdns3/cdns3-starfive.c
> 
> Does not apply anymore, please rebase and resend.

Nevermind, I fixed it up.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
