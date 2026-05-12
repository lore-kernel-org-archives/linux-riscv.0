Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E2CCD4F21
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 22:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RthihRqFSTUr0ka5yp/4wKhRrjnypSSJloIouLZxhoA=; b=FqHSKZ6RsJMdJP
	3BnoVdvuAoTBKakM/qFT+boUKsLSXyNaXJqgWlJOAh4gRIxjRVS2RiEIWnTPXOxT46g5XX9Ur1QVv
	+A+8BKxslF/39RrmEnwpQmKEWmm4TF0MQk1vv9KJO33lTpXrjb9z/1cV1H87U2vJMSKqBf9xjHkyE
	1qsGyz6ZGh2PFkXDfuLn9uGCcXYpEtjuL2ID7k8IpSy+BCYlrJyMo3FGIK6mA3qCJfKgTPm4SZzSY
	sqAlihyK+lHeCj+ISMURN/0tELp6rnJuO+7qyeDSnhLWDCW/FMzg6CEBGbE0L8B7cckdipu8ncm4v
	DfBjfUgPfJ4cGRqshrAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMvzD-00000000dn5-1dUW;
	Tue, 12 May 2026 22:53:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMvzB-00000000dmm-32Y2
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 22:53:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 05BBF600CB;
	Tue, 12 May 2026 22:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F78DC2BCB0;
	Tue, 12 May 2026 22:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778626436;
	bh=KaxJ46V/uBhVm6vtn0aABXcVxrwFHKMWYT8RUDytUHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p6RJ/LjZzNlZYnF/N1c34MGwmzwLtB7c/OY4zSj9ZHdmTGhoiimEMm90Tx/n63mgF
	 eXkNPgUdVNIRBZVxXXsrNS4552UE79on4WinhtQ4+Nop17SIsSiV6OUfFAMSZlR7PT
	 mWZOVCgEnQRKbJ/czdsTygt1WIB/IZ58S6fjiDWPx3Aw4Kr1lKSeViyrojerHlM1Hu
	 7P/STKS5c3KJzNjTQvqhAwMHh/BWQZm7+/M7EwTIbjeH2IRvfowfhDsqc4O81Y7v/9
	 Xh9d7dhf5A+3aN40jaaWoYWXWl2n3jUkQPCyn8ZHnlazaBp56dcH9hfEkqTRJ/ZIFX
	 yydt/xb2ztc6A==
Date: Tue, 12 May 2026 22:53:54 +0000
From: Yixun Lan <dlan@kernel.org>
To: Andre Heider <a.heider@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] riscv: dts: spacemit: k1-musepi-pro: add PMIC and
 power infrastructure
Message-ID: <20260512225354-GKK3624147@kernel.org>
References: <20260511111116.1109643-1-a.heider@gmail.com>
 <20260511111116.1109643-2-a.heider@gmail.com>
 <20260512113913-GKH3624147@kernel.org>
 <a41f87cc-55e4-4a48-bbee-d863e5a4b00a@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a41f87cc-55e4-4a48-bbee-d863e5a4b00a@gmail.com>
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

Hi Andre,

On 14:20 Tue 12 May     , Andre Heider wrote:
> On 12.05.26 1:39 PM, Yixun Lan wrote:
> > Hi Andre,
> > 
> > On 13:11 Mon 11 May     , Andre Heider wrote:
> >> Enable i2c8 and add the connected SpacemiT P1 PMIC with its related regulators
> >> for the board's power infrastructure and voltage regulation support.
> >>
> >> Signed-off-by: Andre Heider <a.heider@gmail.com>
> >> ---
> >>   .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 144 ++++++++++++++++++
> >>   1 file changed, 144 insertions(+)
> >>
> >> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> >> index 29e333b670cf0..88c35ad1ef2ae 100644
> >> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> >> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> >> @@ -17,6 +17,7 @@ / {
> >>   	aliases {
> >>   		ethernet0 = &eth0;
> >>   		serial0 = &uart0;
> >> +		i2c8 = &i2c8;
> >>   	};
> >>   
> >>   	chosen {
> >> @@ -33,6 +34,25 @@ led1 {
> >>   			default-state = "on";
> >>   		};
> >>   	};
> >> +
> > ..
> >> +	reg_usb_vbus: regulator-usb-vbus {
> >> +		compatible = "regulator-fixed";
> >> +		regulator-name = "USBVBUS";
> >> +		regulator-min-microvolt = <12000000>;
> >> +		regulator-max-microvolt = <12000000>;
> >> +		regulator-boot-on;
> >> +		regulator-always-on;
> >> +	};
> > I think you can further drop above regulator, which merely serve as vin-supply
> > and not used by devices, plus it's a non-controllable fixed regulator
> 
> It is, but as mentioned on the cover letter I left this one as it's consistent with the other k1 boards.
> I don't care either way, so I'll just drop it.
> 
Please drop

It's a historical reason that we instroduced the unnecessary regulator
before Krzysztof's comment, in other words, we should also fix that too..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
