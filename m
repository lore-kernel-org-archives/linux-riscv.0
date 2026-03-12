Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22550105A583
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 11:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bawSQVs6FGsp7UKr6EQGfA0oWXME7ebUFgto/PJqqkU=; b=mibFDZuTUeIgtt
	JZuEixNFGxgm1FEVKeUbiAeg/NWLe9Cmgs3mHYN13MqTVsC0pAG7XVHoW2llPvbuw80KDEfYHgZx8
	c9Kqo+dDTJSwq158NOe99dPywoE4gA6lt/HiuNDD8Z4BKCTiCT4ALx3J5YTuIi10Z7OMUFyN0bwcG
	T1pJfQbzuEZuYFqLhjvD7607W72AICvYuEu3RBl3aImFMzyW3wYylfGoHEiO25koO5Pr8VN2QKVPD
	Oq0v9Ow56retYRMHr/YT0BoTWBlz35MXAoeu0ppbaARgOQ8Eb5tDAVSkU398a6raM5qhFeYeu3D97
	rdrqBZfr4RWcL3pdNgfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dv6-0000000DusI-1Hxd;
	Thu, 12 Mar 2026 11:09:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dv5-0000000Dus7-3Uhx
	for linux-riscv@bombadil.infradead.org;
	Thu, 12 Mar 2026 11:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6yasXwFucZ/+gYDRJ1DJRGqGY5uS6lIBeBISKs005aw=; b=DSmV/fr7GGP6kqp9Cy7anvkEA7
	3gZnaMedtbrJfczqsw/Qaei6AgNChGigf8v/e64cGH991MtN39sGJttNEQgTt+uGarqlX4mJs9iPx
	zecqVrWvq2AjW5oGc/RcBWCRj9OyNum4rDW9dOdPFyFtoTt3ZAN9cYJBNlU4N2+sK7ay+XP9b4ecJ
	UPyXAbsIXviAPNPclMfGxUMJto/aE5Hya74USa5n4brD0V4152C2UeX5XH785mPrA34PpPqAgBIQF
	KNz1+RSeYRnjuevmSV9N3ou2UI5N966e7mOWDatRWFQUN3hZZFXUrkvTrh3E8hFE5lTvGMLhercrC
	SYaQKD8g==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dv2-00000000yqP-3PhW
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 11:09:34 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w0duk-0001vZ-TI; Thu, 12 Mar 2026 12:09:14 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w0dui-0050dj-2d;
	Thu, 12 Mar 2026 12:09:14 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w0duk-000000006H9-0JQn;
	Thu, 12 Mar 2026 12:09:14 +0100
Message-ID: <0abfd76f49e5cedf7bfc84eb4d9a0a1d7543f6f8.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] dt-bindings: soc: spacemit: k3: Decouple composite
 reset lines
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Junzhong Pan <junzhong.pan@spacemit.com>, Guodong Xu
 <guodong@riscstar.com>, 	devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, 	spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Thu, 12 Mar 2026 12:09:13 +0100
In-Reply-To: <20260312-01-k3-reset-usb-pci-v1-1-022b24b7340f@kernel.org>
References: <20260312-01-k3-reset-usb-pci-v1-0-022b24b7340f@kernel.org>
	 <20260312-01-k3-reset-usb-pci-v1-1-022b24b7340f@kernel.org>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_110932_988444_B9E49E89 
X-CRM114-Status: GOOD (  13.84  )
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
> Instead of grouping several different reset lines into one composite
> reset, decouple them to individual ones which make it more aligned
> with underlying hardware.
>
> The DWC3 USB host controller in K3 SoC has three reset lines - AHB, VCC,
> PHY. The PCIe controller also has three reset lines - DBI, Slave, Master.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  include/dt-bindings/reset/spacemit,k3-resets.h | 42 ++++++++++++++++++++------
>  1 file changed, 32 insertions(+), 10 deletions(-)
> 
> diff --git a/include/dt-bindings/reset/spacemit,k3-resets.h b/include/dt-bindings/reset/spacemit,k3-resets.h
> index 79ac1c22b7b5..c12f8bd32047 100644
> --- a/include/dt-bindings/reset/spacemit,k3-resets.h
> +++ b/include/dt-bindings/reset/spacemit,k3-resets.h
> @@ -97,11 +97,7 @@
>  #define RESET_APMU_SDH0          13
>  #define RESET_APMU_SDH1          14
>  #define RESET_APMU_SDH2          15
> -#define RESET_APMU_USB2          16
> -#define RESET_APMU_USB3_PORTA    17
> -#define RESET_APMU_USB3_PORTB    18
> -#define RESET_APMU_USB3_PORTC    19
> -#define RESET_APMU_USB3_PORTD    20

This is backwards incompatible.
Are there any device trees using the APMU resets yet?
If not, I wonder if we should just renumber all APMU resets into a
contiguous range and try to get it into v7.0 as a fix.

Also, this breaks bisectability.
reset-spacemit-k3.c will fail to compile between patches 1 and 2.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
