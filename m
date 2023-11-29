Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3B4C10DAA
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 14:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uNSxZeeRP4SJqPqcDmuc3b4cKWU12mbjHrHiv3Fst8M=; b=BJAyFlp1LQ27DGu2Z1mWlNSbYW
	k3BDblgrhp0uAHYGx24sbPnzTq0CrFlXCXclEZE/4iEUOJF9uUqKkHl7LyE5Ua49GfckTy133PWo+
	D2XORARrsMqbfzwVtTTpmzxzrIw6GZXcHbgA6OvOfH206WIjTnd/qIqhT9IHoPfHaOluYu2JrAuaN
	XXjJEPKgx9rtwjQNRHu+GH6Nh/9caAGFIaRcFD2f4x19k80t/2PWIqgdo8p0Fa4AMakjv1e1vhLaK
	uhiVHla3ttsMYW8w4ok1AzNSMWCXmr9RkdNCRyKwXvxTqmnNiwHi160md17GI8ou3DWWLqSESjE8o
	cdQccB/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8LYk-008ccD-1V;
	Wed, 29 Nov 2023 14:29:02 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8LYg-008cau-0y
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 14:29:01 +0000
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4489340332
	for <linux-riscv@lists.infradead.org>; Wed, 29 Nov 2023 14:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701268132;
	bh=vWP9CYe3KKvgAhmJq37cx8p7ADw60XqsLAUIuzsXUeA=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=TlqTWwxxMeA/16DIFbDDRcOZOtl9iWru7hpsDBcRfQ0874GhOpczVkgVEBzp8cHYo
	 4IyNuPwAUYXocwrdq/ljILbmep5pnXySA62LyRf/ewuCbRaDSLiyiFT+UXmlsXhTlF
	 IiF9z0UY52koueqHni6zBE8nMvwg5pTeV5/wg3lul7by65hmhRdnqaxVUWwcYiwZjR
	 JG+TXgCi2f4kS28hHb42XGq/8rwD3NoWRN7GBcR0MEUxBhpuXgWVpctT/nC/PjWDL2
	 qtBmMMKXfaGANpS1lXjC7oJrdIY5BbF6y7n/EwNV++JmqHbv25J1lLkNY7XAz6sgDS
	 Y1YbbOMfj66zA==
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-679ff96b259so85040806d6.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Nov 2023 06:28:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701268131; x=1701872931;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vWP9CYe3KKvgAhmJq37cx8p7ADw60XqsLAUIuzsXUeA=;
        b=Qku5qBLdifk2KsFBq1xB6+GBBbyOuOh5go3RgPDm9MGMlv1i/mFWReIV+9UWu/kXoy
         cP2yVNo7mwiGY0LURzDLRZ4l9SU4NBBfDvR2Qy55QfBBx3FnaGbuZJ76+Hb2gELdVRUR
         Ksb2QkPUiABYUTnwgDeXlMhoXoui7pHoZH9fYe7CJEPcGZMZLG34DLEjCG9e8PE4FzJa
         3T9nde5XWUim3uETdQV/9fn5hAv9MDLkVeUSSpp2vEvpEQOG2Mud5PRC5R7dzXpuEQ4+
         bLaklXqN0Vhgd84s8RjC2+BR7d9STYCno0dGtyUwRbqyk92HG1uiGgSUbPl6IVXIlz3x
         hfEw==
X-Gm-Message-State: AOJu0Yy8xvW1lqm6U3y0N8bOZbiSk/zKm0Bjag/W92l1d9jxJb8ri5eU
	qkxoFp1ICdY/vzfZR5QqrtzpokpFlk8tIuKl8r71s5yjvvEFGn8IXQBBcQaijO32J11ubykDLm1
	sTFNUVVeQhOxj4LwRWqH4lvLrCbimUgdcnRMGCk9pRqsRJGn82BJenOme2XEdIg==
X-Received: by 2002:ad4:5042:0:b0:67a:674:ed88 with SMTP id m2-20020ad45042000000b0067a0674ed88mr19792154qvq.28.1701268131044;
        Wed, 29 Nov 2023 06:28:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEONtigUGKk4Y3Xk0mTpJLPt7Y7eqdmWiLh7OaZgii+ClWP4Bwqi3efc7dvejFZ/cmdUo7bZdxEtkDa6yrOEjc=
X-Received: by 2002:ad4:5042:0:b0:67a:674:ed88 with SMTP id
 m2-20020ad45042000000b0067a0674ed88mr19792134qvq.28.1701268130726; Wed, 29
 Nov 2023 06:28:50 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 29 Nov 2023 15:28:50 +0100
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <5395f3ce-f9ec-474b-b145-5f62a3b7c4fc@collabora.com>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-13-cristian.ciocaltea@collabora.com>
 <CAJM55Z9e=vjGKNnmURN15mvXo2bVd3igBA-3puF9q7eh5hiP+A@mail.gmail.com>
 <2f06ce36-0dc1-495e-b6a6-318951a53e8d@collabora.com> <CAJM55Z8vkMbqXY5sS2o4cLi8ow-JQTcXU9=uYMBSykwd4ppExw@mail.gmail.com>
 <054bbf2a-e7ba-40bf-8f8b-f0e0e9b396c6@collabora.com> <CAJM55Z9+j6CmfjNkPLCk1DR3EBuEMspsRtNvygDbPWJDCytQpw@mail.gmail.com>
 <5395f3ce-f9ec-474b-b145-5f62a3b7c4fc@collabora.com>
Mime-Version: 1.0
Date: Wed, 29 Nov 2023 15:28:50 +0100
Message-ID: <CAJM55Z-ff8btSQwJcWViUKLTJ8F2C_b70AaKJMwxgxZurUyGBA@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] [UNTESTED] riscv: dts: starfive:
 beaglev-starlight: Enable gmac
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Samin Guo <samin.guo@starfivetech.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_062858_704500_EB1D46A0 
X-CRM114-Status: GOOD (  45.83  )
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

Cristian Ciocaltea wrote:
> On 11/28/23 18:09, Emil Renner Berthing wrote:
> > Cristian Ciocaltea wrote:
> >> On 11/28/23 14:08, Emil Renner Berthing wrote:
> >>> Cristian Ciocaltea wrote:
> >>>> On 11/26/23 23:10, Emil Renner Berthing wrote:
> >>>>> Cristian Ciocaltea wrote:
> >>>>>> The BeagleV Starlight SBC uses a Microchip KSZ9031RNXCA PHY supporting
> >>>>>> RGMII-ID.
> >>>>>>
> >>>>>> TODO: Verify if manual adjustment of the RX internal delay is needed. If
> >>>>>> yes, add the mdio & phy sub-nodes.
> >>>>>
> >>>>> Sorry for being late here. I've tested that removing the mdio and phy nodes on
> >>>>> the the Starlight board works fine, but the rx-internal-delay-ps = <900>
> >>>>> property not needed on any of my VisionFive V1 boards either.
> >>>>
> >>>> No problem, thanks a lot for taking the time to help with the testing!
> >>>>
> >>>>> So I wonder why you need that on your board
> >>>>
> >>>> I noticed you have a patch 70ca054e82b5 ("net: phy: motorcomm: Disable
> >>>> rgmii rx delay") in your tree, hence I you please confirm the tests were
> >>>> done with that commit reverted?
> >>>>
> >>>>> Also in the driver patch you add support for phy-mode = "rgmii-txid", but here
> >>>>> you still set it to "rgmii-id", so which is it?
> >>>>
> >>>> Please try with "rgmii-id" first. I added "rgmii-txid" to have a
> >>>> fallback solution in case the former cannot be used.
> >>>
> >>> Ah, I see. Sorry I should have read up on the whole thread. Yes, the Starlight
> >>> board with the Microchip phy works with "rgmii-id" as is. And you're right,
> >>> with "rgmii-id" my VF1 needs the rx-internal-delay-ps = <900> property too.
> >>
> >> That's great, we have now a pretty clear indication that this uncommon behavior
> >> stems from the Motorcomm PHY, and *not* from GMAC.
> >>
> >>>>
> >>>>> You've alse removed the phy reset gpio on the Starlight board:
> >>>>>
> >>>>>   snps,reset-gpios = <&gpio 63 GPIO_ACTIVE_LOW>
> >>>>>
> >>>>> Why?
> >>>>
> >>>> I missed this in v1 as the gmac handling was done exclusively in
> >>>> jh7100-common. Thanks for noticing!
> >>>>
> >>>>>>
> >>>>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >>>>>> ---
> >>>>>>  arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts | 5 +++++
> >>>>>>  1 file changed, 5 insertions(+)
> >>>>>>
> >>>>>> diff --git a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> >>>>>> index 7cda3a89020a..d3f4c99d98da 100644
> >>>>>> --- a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> >>>>>> +++ b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> >>>>>> @@ -11,3 +11,8 @@ / {
> >>>>>>  	model = "BeagleV Starlight Beta";
> >>>>>>  	compatible = "beagle,beaglev-starlight-jh7100-r0", "starfive,jh7100";
> >>>>>>  };
> >>>>>> +
> >>>>>> +&gmac {
> >>>>>> +	phy-mode = "rgmii-id";
> >>>>>> +	status = "okay";
> >>>>>> +};
> >>>>>
> >>>>> Lastly the phy-mode and status are the same for the VF1 and Starlight boards,
> >>>>> so why can't these be set in the jh7100-common.dtsi?
> >>>>
> >>>> I wasn't sure "rgmii-id" can be used for both boards and I didn't want
> >>>> to unconditionally enable gmac on Starlight before getting a
> >>>> confirmation that this actually works.
> >>>>
> >>>> If there is no way to make it working with "rgmii-id" (w/ or w/o
> >>>> adjusting rx-internal-delay-ps), than we should switch to "rgmii-txid".
> >>>
> >>> Yeah, I don't exactly know the difference, but both boards seem to work fine
> >>> with "rgmii-id", so if that is somehow better and/or more correct let's just go
> >>> with that.
> >>
> >> As Andrew already pointed out, going with "rgmii-id" would be the recommended
> >> approach, as this passes the responsibility of adding both TX and RX delays to
> >> the PHY.  "rgmii-txid" requires the MAC to handle the RX delay, which might
> >> break the boards having a conformant (aka well-behaving) PHY.  For some reason
> >> the Microchip PHY seems to work fine in both cases, but that's most likely an
> >> exception, as other PHYs might expose a totally different and undesired
> >> behavior.
> >>
> >> I will prepare a v3 soon, and will drop the patches you have already submitted
> >> as part of [1].
> >
> > Sounds good. Then what's missing for ethernet to work is just the clock patches:
> > https://github.com/esmil/linux/commit/b5abe1cb3815765739aff7949deed6f65b952c4a
> > https://github.com/esmil/linux/commit/3a7a423b15a9f796586cbbdc37010d2b83ff2367
> >
> > You can either include those as part of your patch series enabling ethernet, or
> > they can be submitted separately with the audio clocks. Either way is
> > fine by me.
>
> I can cherry-pick them, but so far I couldn't identify any networking
> related issues if those patches are not applied. Could it be something
> specific to Starlight board only?

No, it's the same for both boards. The dwmac-starfive driver adjusts
the tx clock:

1000Mbit -> 125MHz
 100Mbit ->  25MHz
  10Mbit -> 2.5MHz

The tx clock is given in the device tree as the gmac_tx_inv clock which derives
from either the gmac_root_div or gmac_rmii_ref external clock like this:

gmac_rmii_ref (external) -> gmac_rmii_txclk     \
gmac_root_div  (500MHz)  -> gmac_gtxclk (div N) -> gmac_tx (mux) -> gmac_tx_inv

..where N defaults to 4 and the gmac_tx mux defaults to the gmac_gtxclk, so
the gmac_tx_inv clock defaults to 125MHz suitable for 1000Mbit connections.
See /sys/kernel/debug/clk/clk_summary for another overview.

When the dwmac_starfive driver request to change gmac_tx_inv to 25MHz the clock
framework will that it has the CLK_SET_RATE_PARENT flag set, so it will try
the gmac_tx clock next. This is a mux that can choose either the
125MHz gmac_gtxclk
or the external gmac_rmii_txclk which defaults to 0MHz in the current
device trees,
so the request cannot be met.

That's why we need to set the CLK_SET_RATE_PARENT (and CLK_SET_RATE_NO_REPARENT)
flags on the gmac_tx clock so the clock framework again goes to try setting the
gmac_gtxclk to 25MHz, which it can because it's a divider and setting N=20
does the trick.

On your board you can manually force a 100Mbit connection with
ethtool -s eth0 speed 100

That fails on my boards without those two patches.
/Emil

> >>
> >> Thanks again for your support,
> >> Cristian
> >>
> >> [1]: https://lore.kernel.org/all/20231126232746.264302-1-emil.renner.berthing@canonical.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
