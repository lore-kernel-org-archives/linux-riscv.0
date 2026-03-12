Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645B3105A585
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 11:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kiV7gZ6WcT21BH7m/JAt9y9/smolykBvJ5F0whuG7Ao=; b=NnJ8Wbf2xzZVmn
	InOb3M80nXQiTCHf/JDGbjslUYyez9rQHkPRa9cYqA9siqZVRExpA5aRmrz7b+nB+fYxjlUphEJCv
	86UQ/nJrMUQqUw2s66g+WbO7do1HjB1EQojX/UNcw2/l4zaUiP+k9fMoao79ywoaeqXszzOFif1xc
	XjfKG3TvnSv95aJfMnNabSC+cqv3nkraoYq799sBpgM/MGZeew6qzU6MGY5vihZJ+ism+vIzhvitD
	Nb1mTJx04p4kn3AdfbL1ZWPYIeQSaC37SedTWvNq/Q/6dk4JW/ZnKi3li4zH1Fik9KI7za5FvqjEY
	4LimaqfA0lNOnAJlrvBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dxS-0000000Dv2Y-3oZd;
	Thu, 12 Mar 2026 11:12:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dxQ-0000000Dv2N-48Ur
	for linux-riscv@bombadil.infradead.org;
	Thu, 12 Mar 2026 11:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dkFxUJvLFy7PG+sW5v0z0zZEoSP9mAM2HbiJXFxHiMQ=; b=GDz543iKk0ZjuGwpZW4/+yLT85
	d3Xl8YMAh6j9bMmC0EcQtbxccgtnBXQograMCDw80ZoYYx5oEcg6jRDoJoS6NXBqQwGC4LWJTl3kQ
	tHhCi2ghBNeC8zVR0q7lka+kULIpD3OqOfJZ5wgitWQvYdFx8Ifal7LWUcZ8vvvgjezsgaoUmmPPP
	H9y2+O2aKQFhOYooLva5HLH3EllPW31YDSXq8j3iQOtN0pfNS3kdOJbv49HNJHYcBafSG2tAZVEqD
	vLW4ma9npZz00vW0HaxKkaRlQR6WhY12tLoImsA0IhnPF4KRqLXI/Bc/0ntoIdYRyDs2vEXHNFnzE
	urr6THCw==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dxN-00000000yxV-1duy
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 11:11:59 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w0dxE-0002E1-LA; Thu, 12 Mar 2026 12:11:48 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w0dxD-0050dx-0B;
	Thu, 12 Mar 2026 12:11:48 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w0dxE-000000006Ie-1L98;
	Thu, 12 Mar 2026 12:11:48 +0100
Message-ID: <075052918fdd3c279347b0a2ffd85c8a0db36379.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] reset: spacemit: k3: Add individual reset lines for
 USB, PCIe
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Junzhong Pan <junzhong.pan@spacemit.com>, Guodong Xu
 <guodong@riscstar.com>, 	devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, 	spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Thu, 12 Mar 2026 12:11:48 +0100
In-Reply-To: <20260312-01-k3-reset-usb-pci-v1-2-022b24b7340f@kernel.org>
References: <20260312-01-k3-reset-usb-pci-v1-0-022b24b7340f@kernel.org>
	 <20260312-01-k3-reset-usb-pci-v1-2-022b24b7340f@kernel.org>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_111157_580615_72207211 
X-CRM114-Status: GOOD (  12.74  )
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

On Do, 2026-03-12 at 10:34 +0000, Yixun Lan wrote:
> The DWC3 USB host controller in K3 SoC has three reset lines - AHB,
> VCC, PHY. The PCIe controller also has three reset lines - DBI, Slave,
> Master. So, decouple USB and PCIe reset line to individual ones.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/reset/spacemit/reset-spacemit-k3.c | 50 ++++++++++++++++++------------
>  1 file changed, 30 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/reset/spacemit/reset-spacemit-k3.c b/drivers/reset/spacemit/reset-spacemit-k3.c
> index e9e32e4c1ba5..9f58526b0119 100644
> --- a/drivers/reset/spacemit/reset-spacemit-k3.c
> +++ b/drivers/reset/spacemit/reset-spacemit-k3.c
> @@ -112,16 +112,21 @@ static const struct ccu_reset_data k3_apmu_resets[] = {
>  	[RESET_APMU_SDH0]	= RESET_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(1)),
>  	[RESET_APMU_SDH1]	= RESET_DATA(APMU_SDH1_CLK_RES_CTRL,	0, BIT(1)),
>  	[RESET_APMU_SDH2]	= RESET_DATA(APMU_SDH2_CLK_RES_CTRL,	0, BIT(1)),
> -	[RESET_APMU_USB2]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
> -				BIT(1)|BIT(2)|BIT(3)),
> -	[RESET_APMU_USB3_PORTA]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
> -				BIT(5)|BIT(6)|BIT(7)),
> -	[RESET_APMU_USB3_PORTB]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
> -				BIT(9)|BIT(10)|BIT(11)),
> -	[RESET_APMU_USB3_PORTC]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
> -				BIT(13)|BIT(14)|BIT(15)),
> -	[RESET_APMU_USB3_PORTD]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0,
> -				BIT(17)|BIT(18)|BIT(19)),

If there are already APMU reset users around, these either need to stay
or the driver needs an of_xlate that makes sure the deprecated ranges
are never given out to consumers.

Or, if there are no RESET_APMU users whatsoever yet, we might be
allowed to renumber RESET_APMU_* into a contiguous range.


regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
