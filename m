Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05AAEB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 13:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ULZlBboIi7RG1QO8UWLh53E/h51irniNH6Aurg5oXJk=; b=AXUIwClMU8DgHZ
	obSzUkNB4yhG745NY/DZLmBPKt0Rd0gfNCBKCwc/K1nIzK6aNd3V5GsssNKJOw40TtG/9T50Z7+xv
	0ALyP1uDvOdhI4imHsxU+XThrPHQCMIXwHfRkjlpOR0tfyMGJJkrFGIhOIXbhAkQNiVICDC/fXtWr
	HCA9wl4TxCmSJQjIaZi58bG0pTuYU2elvx0y62rkG5SYSPnBA0LYPePuQdc+Ks0PEDDSIyHmg2Rp4
	SGaExp4CyA3OlOYPjUbDslCE7KYUTmk7SLok295TbyDP6Eb5Ayi3iPumdKqdJ6qHQ715lmbgy2RcZ
	B0uBnCnASWn4U+tGsH2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBF2z-008ZXI-05;
	Mon, 19 Jun 2023 13:35:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBF2w-008ZVy-1M;
	Mon, 19 Jun 2023 13:35:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C71E860C68;
	Mon, 19 Jun 2023 13:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6B1C433C8;
	Mon, 19 Jun 2023 13:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1687181752;
	bh=0Clqdzr8ksnDkV+ZCSDshro8OIUJJGdZ5wYLpnZqzUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fwzq1KJKGuiDsTlLvIiQh0/jqhtxg5tocu13OII5gIvkOGmNEhDza3mmh9Gee3JdZ
	 0OBPYmd9hVUIlvldbvP3kzO3I8/jV9fG4dVfth4nhqB0wbmQreSQj3eizRIlwyVqDQ
	 7veBCotYt2cLnodWKa/VCMMjMwMUEi1NEfQOGfVU=
Date: Mon, 19 Jun 2023 15:35:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor@kernel.org>,
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
Subject: Re: [PATCH v6 5/7] dt-bindings: usb: Add StarFive JH7110 USB
 controller
Message-ID: <2023061941-bok-gooey-c4fc@gregkh>
References: <20230518112750.57924-1-minda.chen@starfivetech.com>
 <20230518112750.57924-6-minda.chen@starfivetech.com>
 <20230525-shopper-handbrake-27fc06aede32@spud>
 <5124e6a8-8ca6-71a5-19d6-8c15e954c458@starfivetech.com>
 <20230526-grain-cubical-e0af96202007@wendy>
 <a91f4167-e797-435f-8867-dbef4b109df8@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a91f4167-e797-435f-8867-dbef4b109df8@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_063554_518969_BA002FAE 
X-CRM114-Status: GOOD (  21.15  )
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

On Sun, Jun 18, 2023 at 08:22:05PM +0800, Minda Chen wrote:
> 
> 
> On 2023/5/26 21:13, Conor Dooley wrote:
> > On Fri, May 26, 2023 at 06:24:48PM +0800, Minda Chen wrote:
> > 
> >> >> +title: StarFive JH7110 wrapper module for the Cadence USBSS-DRD controller
> >> > 
> >> > I think you told Krzysztof you'd rename this to "StarFive JH7110 Cadence
> >> > USBSS-DRD SoC controller"?
> >> > 
> >> The previous title describe whole USB controller for previous dts node is
> >> merged. Now the dts node is split. 
> >> "starfive,jh7110-usb" just contain starfive wrapper layer dts configuration.
> > 
> > Okay, I must have misunderstood the conversation on the previous
> > version. Sorry about that.
> > 
> >> > Otherwise, it looks like all the stuff from him and Rob have been sorted
> >> > out, so other than $title this is
> >> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > 
> 
> Hi Greg
> Can this patch can be applied to Linux-USB-next tree? Since this patch is reviewed by Conor.
> 
> List Below is Conor's previous E-mail.
> 
>    I think I missed this mail somehow. 5/7 had the binding for the driver
>    so probably that should've gone via the USB tree too?
>    Should apply on its own (no deps on the phy patches) & has dt-binding
>    maintainer reviews.
> 
>    `b4 am -P 5 20230518112750.57924-6-minda.chen@starfivetech.com` if
>    that's your cup of tea.

Thanks, I missed that, now applied!

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
