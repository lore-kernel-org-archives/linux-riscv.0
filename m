Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F39BC77B7E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 14:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f29WTezScDAsszQU0ZQsaKPJpRfLOar6w2uBBd9Yqbk=; b=2oQ5O+QmYJQyuk
	1F/98BSu0t0JJ8Vd2+PGj/s0enZaG7lXOTOap62nNY1VH5c9Ujcv/Bg5/S2KZTvm+G73VTbzErtuZ
	Ix0Zr2nPfYgrisJuODElHs0ZLzlaatYisRw5S3YOeNhD2xf6TsI4kC+7HmnZQMlNp6kRpyGEdZhOK
	uGAySRE1Z0BZl88IdZLtj7yPXf2rM0NVGN1TVmE13m0j7XQ9T8ViyM5BjhUsQbY4b2TgwUp7N+0U2
	ZFZqYcUMGZLG/wcrR4w9lulXbG0cOyCT2tR0H/qZbqvqH4Rc0JwsHBug136EgwUHZZE37+2s01wsy
	JFfEtY+Qshuu1KPOE14Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3e8i-00AorO-0C;
	Mon, 29 May 2023 14:46:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3e8f-00AoqY-0n;
	Mon, 29 May 2023 14:46:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5371B62597;
	Mon, 29 May 2023 14:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E8EFC433EF;
	Mon, 29 May 2023 14:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1685371583;
	bh=5wmKnDZ1QEngg8pOAg+VZ7IcLSNHMh6tgnuCIJY0KSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j0zwE0C2bchW/nCkKx0WuUE4N+VcdWvivrZIcC7oeulj9O4e9E6ifH9eVAe7VtelF
	 K0V5lIgRgHxQs91wwtM9bATdulCPqjvshLAJAx2nrv/TLCreNEmd8WA3Zxst7ZeDoA
	 d/FsKO4/JEvKATeWrfk8gmy7K9xKvXBDve+1gp0w=
Date: Mon, 29 May 2023 15:46:21 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Conor Dooley <conor@kernel.org>
Cc: Minda Chen <minda.chen@starfivetech.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Vinod Koul <vkoul@kernel.org>,
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
Subject: Re: [PATCH v6 7/7] riscv: dts: starfive: Add USB dts configuration
 for JH7110
Message-ID: <2023052909-speed-cackle-294e@gregkh>
References: <20230518112750.57924-1-minda.chen@starfivetech.com>
 <20230518112750.57924-8-minda.chen@starfivetech.com>
 <20230525-cross-daybreak-24dfed69e5d0@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230525-cross-daybreak-24dfed69e5d0@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_074625_324666_8D150E61 
X-CRM114-Status: GOOD (  17.05  )
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

On Thu, May 25, 2023 at 10:36:38PM +0100, Conor Dooley wrote:
> Greg,
> 
> On Thu, May 18, 2023 at 07:27:50PM +0800, Minda Chen wrote:
> > Add USB wrapper layer and Cadence USB3 controller dts
> > configuration for StarFive JH7110 SoC and VisionFive2
> > Board.
> > USB controller connect to PHY, The PHY dts configuration
> > are also added.
> > 
> > Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> 
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > index 71a8e9acbe55..b65f06c5b1b7 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > @@ -366,6 +366,59 @@
> >  			status = "disabled";
> >  		};
> >  
> > +		usb0: usb@10100000 {
> > +			compatible = "starfive,jh7110-usb";
> > +			ranges = <0x0 0x0 0x10100000 0x100000>;
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +			starfive,stg-syscon = <&stg_syscon 0x4>;
> > +			clocks = <&stgcrg JH7110_STGCLK_USB0_LPM>,
> 
> Please don't pick this patch, if the rest of the series is applicable,
> as this will break building the dtb as stgcrg does not yet exist in any
> maintainer tree.

Ok, I'll just take patch 6/7 then.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
