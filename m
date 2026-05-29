Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAD8CD6E43
	for <linux-riscv@archiver.kernel.org>; Fri, 29 May 2026 02:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5C1AJp+1hREIlpY+qVbJrWAw0WTHW6cs+SrVWDd0JAY=; b=RPYYuW74RTLLDl
	g5rJZqP/Q0CdfVGPJKX1R6GsJFccgNVWTcAnf3MtS2tQfnXCA5X+4eQ7nYZ2h/65rzm0CQJwkQl0S
	X5ecUIp5hhVxHw2TndSO/2S1quKRx8yrRw+akqa8xDW2emhUkHZqMNNT0UhPIFNSH5CeXAkaaQAzK
	ag0sWFiSjEFhOcGCBQWGXX4RM7TcBsRJhiaqXSFdKAPq7w9Hjhmi1AwLWUfa473EwhES4zXWywxB7
	KlSFkbcsmYzpog76JjkpeoqopVqaPr5bNKaTj325j7lDkMTvRgzegXKkd7n4APAQB8xtcIYjpKlIh
	lHR6XirKnC19wvF8hg4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSn7w-00000006fBR-2dBC;
	Fri, 29 May 2026 02:39:12 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSn7s-00000006fB2-3TrL
	for linux-riscv@lists.infradead.org;
	Fri, 29 May 2026 02:39:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1780022337; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=giyP3l0BARjwV15MaD3ByOc48OVlaO+H1pfwiKo+JWthAO63lPjWa2i0cqtCk7asgsIqz78LyEEWF2uyfT3ZKDsogU/Sss4FLGjSLuG+OwPrsJcTIPDQSD673NuqmRgAaj0rJjje8lukR+rPKjf8CKP/Plk/7jpKoVC+PRt/LC0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780022337; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1l7GHRNeIy9vc/Rt447hMzgbRk0U1YWWPSN6x53wVYA=; 
	b=WhMFoT8Ck6GLWtfOmPuGyPzj1AGvnyeWsapa+5wdZcs5IieyBUmM9nuqysEYfU3p3g7NxPALKCt3oANib2TWTTFVq1JKsISZv2DCGPCncvWPFJI7B1/ztPzgBm5wzlbsmXX/B5NQ+Pcsh+lmOvvM33YFWQUy2+VFEqHz5tUIN58=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780022337;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=1l7GHRNeIy9vc/Rt447hMzgbRk0U1YWWPSN6x53wVYA=;
	b=DVbRBlppbQg5/6AEZ+mozmpZRFQAego/NoV9P7RWYIyInmHed9UDsvXnpbhBQ2sL
	v+gALEluOCS5cYtmZrRDQHPAgN2xLInOAXmDWhVIU6XEw56sVWKPellABudZ4ebFXDl
	knoeQpq3693RNWsmq3/E9jMUokGSL0GDmPof8fbM=
Received: by mx.zohomail.com with SMTPS id 178002233430168.40681398454296;
	Thu, 28 May 2026 19:38:54 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 29 May 2026 10:38:38 +0800
Message-Id: <DIUT907819JD.MG7B60VQLZ8L@pigmoral.tech>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Vivian Wang" <wangruikang@iscas.ac.cn>, "Paolo Abeni"
 <pabeni@redhat.com>, "Guodong Xu" <guodong@riscstar.com>, "Yangyu Chen"
 <cyy@cyyself.name>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] riscv: dts: spacemit: k1: Split gmac_clk_ref
 into independent pinctrl groups
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Conor Dooley" <conor@kernel.org>, "Junhui Liu"
 <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.21.0
References: <20260528-bpi-cm6-v2-0-d0eb3f236cea@pigmoral.tech>
 <20260528-bpi-cm6-v2-2-d0eb3f236cea@pigmoral.tech>
 <20260528-mushily-suffrage-5162d4ffdaf2@spud>
In-Reply-To: <20260528-mushily-suffrage-5162d4ffdaf2@spud>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_193909_251651_3AF5617D 
X-CRM114-Status: GOOD (  17.10  )
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

Hi Conor,

On Fri May 29, 2026 at 1:13 AM CST, Conor Dooley wrote:
> On Thu, May 28, 2026 at 01:22:48PM +0800, Junhui Liu wrote:
>> The gmac_clk_ref signal is optional for the GMAC controller and is not
>> strictly required for all hardware designs. The pins for gmac0_clk_ref
>> (GPIO 45) and gmac1_clk_ref (GPIO 46) may also be used as GPIOs for
>> other functions even when the Ethernet controller is active.
>> 
>> Split the refclk pins into independent pinctrl groups so boards can
>> request them only when the reference clock path is actually needed.
>> 
>> Among the already mainlined boards, BPI-F3, Jupiter and MusePi Pro have
>> optional hardware paths for the GMAC refclk pins. BPI-F3 and Jupiter
>> route both GMAC refclk pins to the PHYs through NC/0R option resistors,
>> while MusePi Pro only does so for GMAC0. Keep referencing the new
>> clk-ref pinctrl groups on these boards so the optional hardware paths
>> remain usable if the option resistors are populated.
>> 
>> OrangePi R2S has no publicly available schematic, so also keep the
>> clk-ref groups there to preserve the previous pinmux behavior.
>> 
>> Fixes: 60775f28cfb7 ("riscv: dts: spacemit: Add Ethernet support for K1")
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> index 4e9a62d0e85b..8c57ca05dabd 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> @@ -27,8 +27,16 @@ gmac0-pins {
>>  				 <K1_PADCONF(11, 1)>,	/* gmac0_tx_en */
>>  				 <K1_PADCONF(12, 1)>,	/* gmac0_mdc */
>>  				 <K1_PADCONF(13, 1)>,	/* gmac0_mdio */
>> -				 <K1_PADCONF(14, 1)>,	/* gmac0_int_n */
>> -				 <K1_PADCONF(45, 1)>;	/* gmac0_clk_ref */
>
> The point sashiko made here seems valid, odd that these aren't added to
> another group.

Do you mean Sashiko's point about not adding these groups to the
OrangePi RV2 board? That is because GPIO45 and GPIO46 are used as
TP_RST_1V8 and TP_INT_1V8 respectively on the OrangePi RV2. These are
the reset and interrupt signals for the touch panel, and are not
connected to the optional GMAC PHY refclk path. So with this patch,
GPIO45/46 can be properly used by the touch panel without pinmux
conflicts once display/tp support is added in the future.

I have added the new gmac_clk_ref groups to all boards where I found
these signals may actually be used.

Best regards,
Junhui Liu

>
>> +				 <K1_PADCONF(14, 1)>;	/* gmac0_int_n */
>> +
>> +			bias-pull-up = <0>;
>> +			drive-strength = <21>;
>> +		};
>> +	};
>> +
>> +	gmac0_clk_ref_cfg: gmac0-clk-ref-cfg {
>> +		gmac0-clk-ref-pins {
>> +			pinmux = <K1_PADCONF(45, 1)>;	/* gmac0_clk_ref */
>>  
>>  			bias-pull-up = <0>;
>>  			drive-strength = <21>;
>> @@ -51,8 +59,16 @@ gmac1-pins {
>>  				 <K1_PADCONF(40, 1)>,	/* gmac1_tx_en */
>>  				 <K1_PADCONF(41, 1)>,	/* gmac1_mdc */
>>  				 <K1_PADCONF(42, 1)>,	/* gmac1_mdio */
>> -				 <K1_PADCONF(43, 1)>,	/* gmac1_int_n */
>> -				 <K1_PADCONF(46, 1)>;	/* gmac1_clk_ref */
>> +				 <K1_PADCONF(43, 1)>;	/* gmac1_int_n */
>> +
>> +			bias-pull-up = <0>;
>> +			drive-strength = <21>;
>> +		};
>> +	};
>> +
>> +	gmac1_clk_ref_cfg: gmac1-clk-ref-cfg {
>> +		gmac1-clk-ref-pins {
>> +			pinmux = <K1_PADCONF(46, 1)>;	/* gmac1_clk_ref */
>>  
>>  			bias-pull-up = <0>;
>>  			drive-strength = <21>;
>> 
>> -- 
>> 2.54.0
>> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
