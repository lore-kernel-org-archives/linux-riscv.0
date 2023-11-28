Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE56FC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 16:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zqZox+DrFAjl/WFu8ln9ERi+8cTGogtwygveE0WkH4c=; b=0OH1bJJjLrQ1BN76YdwTIiKmk5
	omKuJ55iKcDxhxXzIXVASVUnwhcZVHkk508hRph91DdJNAajQ35siO/0cHLWjJDqekbVFaFtJAIOv
	V4fhz4PnSZqnausQrkF2EqjroZmKBTRD6+Rzz3pEr+/Dn3FCqLMEvTxYjBtKcSw7fd6KhZ8BDbhWU
	QPbH9BqQzget/KAoqxV4k1jTRPbJHKT68GbjRzAddjjKaFIZ+dqKNrIE0IEBX/+1j2Q9inUze0EMi
	pn5efwM+ESOSGidtntUNOkr76o6AUpKyC6fnLuj50pe2JCAMYLG367AOUlv/KfyhSPVja9uJQB5H6
	tpVT5xFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r80el-005mOP-18;
	Tue, 28 Nov 2023 16:09:51 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r80ei-005mNK-1M
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 16:09:50 +0000
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2AF764443B
	for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 16:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701187784;
	bh=pEKPe8cq8iCO+hKEkwpNbBcU/bv+bYZjuOAiUbbFTmw=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=GhasgKWyW7fhGu/IKEgFYSNL+npeH4JsKBaXgYMyhS5xtNAlmr4CGgcZRzugMpDI9
	 vEtY4xkrwYvqVNalqMSaJ+kLFgtD3/v2+UZhGXn+tIIbab5kpMmljRg/N2SEQaDLyN
	 Z7lr5v3AHdr19YpYCtqd1fGuLL5Uubdj12CLSc4wB3VjoB+GZp8RCWIfjHdBR5H4kS
	 jtZk6IYFVnB5ZtSA3Xbowj1AOOxxQRrDH3CJPdgzFkhT6+mBuw95BeDrFiy7B2LABv
	 Rr8KoUYcNf2rIMj6hZ1ZXPDPwH2YIREaCjmTjpWMC5YYnb5PIzi7KJ+nd9oOYxKV7e
	 wImOHw7xLoC4w==
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-67a238351b7so41950406d6.2
        for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 08:09:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701187782; x=1701792582;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pEKPe8cq8iCO+hKEkwpNbBcU/bv+bYZjuOAiUbbFTmw=;
        b=nWJbFkqtyn980W37oDYB+OWBkWsrdgIosNhbJ8S+JbQ72ub1WkzEVG0I3lbQTObeXN
         /xrh3wJgZx5t0hqrjZQdVLCk+iCKmJ30D+R6Gs1ipuTJATJP5ZVD1sj2RgRq/b0sr3Vs
         lREMA06JJpwN2VAXiBiX4ASkYNwLum3gGq6J7YbGsDr95keXU59o7pAxd0lRNuj+++YI
         VOVN20SNpHgaUA+9HAPl11bGgmh4xoAtBg0hoe+Nf+8F+IadW5s/r/4gbJaAHlgaTeQ7
         H59PyjF9OMYz3bxaxEopHCSRMW3azTkd3Xf0paFjKdBKBnPHWOYOzG3AQ4LebtWFI+1j
         bcuA==
X-Gm-Message-State: AOJu0Yxa6LkKZ5YZ4knDYbPVTgWkQ6QpUXlyPUax9hmvjxOkTnTQN5kE
	zzQqkU4tLtlUCDS3ve/MVa9yspI7PNe5qD68Ylbbcz/ezKQ+t6llq5zycTfN7ibVS2dkQrIBoK/
	vTw+SJCqf8njqO1ypFOiClVPPzzPLze90Lkv8m1Vd/UeoJCrEgc8N5kS1rabaQA==
X-Received: by 2002:ad4:5144:0:b0:67a:3863:d126 with SMTP id g4-20020ad45144000000b0067a3863d126mr10046208qvq.44.1701187782202;
        Tue, 28 Nov 2023 08:09:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBKpSSFbtesM/25uZwKIDezsMT1jPt3i9azPNVI4N4TMfmDOkXhoCn8EiGeenreU73yagsK6uZPTXiBRU8kPg=
X-Received: by 2002:ad4:5144:0:b0:67a:3863:d126 with SMTP id
 g4-20020ad45144000000b0067a3863d126mr10046174qvq.44.1701187781933; Tue, 28
 Nov 2023 08:09:41 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Nov 2023 17:09:41 +0100
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <054bbf2a-e7ba-40bf-8f8b-f0e0e9b396c6@collabora.com>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-13-cristian.ciocaltea@collabora.com>
 <CAJM55Z9e=vjGKNnmURN15mvXo2bVd3igBA-3puF9q7eh5hiP+A@mail.gmail.com>
 <2f06ce36-0dc1-495e-b6a6-318951a53e8d@collabora.com> <CAJM55Z8vkMbqXY5sS2o4cLi8ow-JQTcXU9=uYMBSykwd4ppExw@mail.gmail.com>
 <054bbf2a-e7ba-40bf-8f8b-f0e0e9b396c6@collabora.com>
Mime-Version: 1.0
Date: Tue, 28 Nov 2023 17:09:41 +0100
Message-ID: <CAJM55Z9+j6CmfjNkPLCk1DR3EBuEMspsRtNvygDbPWJDCytQpw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231128_080948_859176_6CE14F3B 
X-CRM114-Status: GOOD (  37.64  )
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
> On 11/28/23 14:08, Emil Renner Berthing wrote:
> > Cristian Ciocaltea wrote:
> >> On 11/26/23 23:10, Emil Renner Berthing wrote:
> >>> Cristian Ciocaltea wrote:
> >>>> The BeagleV Starlight SBC uses a Microchip KSZ9031RNXCA PHY supporting
> >>>> RGMII-ID.
> >>>>
> >>>> TODO: Verify if manual adjustment of the RX internal delay is needed. If
> >>>> yes, add the mdio & phy sub-nodes.
> >>>
> >>> Sorry for being late here. I've tested that removing the mdio and phy nodes on
> >>> the the Starlight board works fine, but the rx-internal-delay-ps = <900>
> >>> property not needed on any of my VisionFive V1 boards either.
> >>
> >> No problem, thanks a lot for taking the time to help with the testing!
> >>
> >>> So I wonder why you need that on your board
> >>
> >> I noticed you have a patch 70ca054e82b5 ("net: phy: motorcomm: Disable
> >> rgmii rx delay") in your tree, hence I you please confirm the tests were
> >> done with that commit reverted?
> >>
> >>> Also in the driver patch you add support for phy-mode = "rgmii-txid", but here
> >>> you still set it to "rgmii-id", so which is it?
> >>
> >> Please try with "rgmii-id" first. I added "rgmii-txid" to have a
> >> fallback solution in case the former cannot be used.
> >
> > Ah, I see. Sorry I should have read up on the whole thread. Yes, the Starlight
> > board with the Microchip phy works with "rgmii-id" as is. And you're right,
> > with "rgmii-id" my VF1 needs the rx-internal-delay-ps = <900> property too.
>
> That's great, we have now a pretty clear indication that this uncommon behavior
> stems from the Motorcomm PHY, and *not* from GMAC.
>
> >>
> >>> You've alse removed the phy reset gpio on the Starlight board:
> >>>
> >>>   snps,reset-gpios = <&gpio 63 GPIO_ACTIVE_LOW>
> >>>
> >>> Why?
> >>
> >> I missed this in v1 as the gmac handling was done exclusively in
> >> jh7100-common. Thanks for noticing!
> >>
> >>>>
> >>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >>>> ---
> >>>>  arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts | 5 +++++
> >>>>  1 file changed, 5 insertions(+)
> >>>>
> >>>> diff --git a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> >>>> index 7cda3a89020a..d3f4c99d98da 100644
> >>>> --- a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> >>>> +++ b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> >>>> @@ -11,3 +11,8 @@ / {
> >>>>  	model = "BeagleV Starlight Beta";
> >>>>  	compatible = "beagle,beaglev-starlight-jh7100-r0", "starfive,jh7100";
> >>>>  };
> >>>> +
> >>>> +&gmac {
> >>>> +	phy-mode = "rgmii-id";
> >>>> +	status = "okay";
> >>>> +};
> >>>
> >>> Lastly the phy-mode and status are the same for the VF1 and Starlight boards,
> >>> so why can't these be set in the jh7100-common.dtsi?
> >>
> >> I wasn't sure "rgmii-id" can be used for both boards and I didn't want
> >> to unconditionally enable gmac on Starlight before getting a
> >> confirmation that this actually works.
> >>
> >> If there is no way to make it working with "rgmii-id" (w/ or w/o
> >> adjusting rx-internal-delay-ps), than we should switch to "rgmii-txid".
> >
> > Yeah, I don't exactly know the difference, but both boards seem to work fine
> > with "rgmii-id", so if that is somehow better and/or more correct let's just go
> > with that.
>
> As Andrew already pointed out, going with "rgmii-id" would be the recommended
> approach, as this passes the responsibility of adding both TX and RX delays to
> the PHY.  "rgmii-txid" requires the MAC to handle the RX delay, which might
> break the boards having a conformant (aka well-behaving) PHY.  For some reason
> the Microchip PHY seems to work fine in both cases, but that's most likely an
> exception, as other PHYs might expose a totally different and undesired
> behavior.
>
> I will prepare a v3 soon, and will drop the patches you have already submitted
> as part of [1].

Sounds good. Then what's missing for ethernet to work is just the clock patches:
https://github.com/esmil/linux/commit/b5abe1cb3815765739aff7949deed6f65b952c4a
https://github.com/esmil/linux/commit/3a7a423b15a9f796586cbbdc37010d2b83ff2367

You can either include those as part of your patch series enabling ethernet, or
they can be submitted separately with the audio clocks. Either way is
fine by me.

/Emil

>
> Thanks again for your support,
> Cristian
>
> [1]: https://lore.kernel.org/all/20231126232746.264302-1-emil.renner.berthing@canonical.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
