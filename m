Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D72AC46CA0
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 12:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=IbKn0kfwfXKWm3U/SHr/R8G4n/wEf9IpSSX848NTIrQ=; b=WFXMoP/BDiLFrSCqWzazi5gJN2
	D3xFOlVzKULSiWZan2yJB5YDzPrrBYIVlc966oRcVcZNijMr/1YPYtkH/PbyQX+w52XuK3mP581k0
	6/e6j3PQu7giVsBMrFqwG9YdjvP0KuWm8GJsUevm8T3CcbrmDIsWy/1v98pf9DsaPwNpJ9pVFTDW2
	ricBz388C4YLQ3ZoWE+S5REfF2PjbUeO+GRAn25qM2tcvRKZr9rKe00ns/v1LjYatw6AQwP0CuXLL
	DnZ9p1jrKT68CSndiE96oKMJ1vILmNb7LqD2Os3jUCaYvjsB6KiiM38NEu9t96VqxBn7W4/+WvssR
	/GMvqpfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7wtE-005GmN-0C;
	Tue, 28 Nov 2023 12:08:32 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7wtA-005GlG-0n
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 12:08:30 +0000
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EDFE344435
	for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 12:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701173301;
	bh=iOZrwSPmspp94JeIuHB4gK1Gx/cQjCpWhXKzSprsIjI=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=HIdGdYurwvY4jLzjhJ5FG3GlajPU4BhpSs13VcRRfDnBRdy5qBzXacJu4SeeEje37
	 3/tPWTxTdQ4kP5lS8lgzbsqUdogzvw0k87bBb1fbuAKhu6mzXj2R5dq9L0rAWRnfbU
	 T+tLmc9NF5OOoymiSZ9F58B5l4SLJbkWo+ogKIc001zuZOsU83BEEjRQ3+AgYdiVXw
	 6bAQi/Fn7oK6xXOc/saZ2PrZdCTU7K1df/WT7BuN6xoBEucInMaB09YfDuj0ItiPNf
	 Og3+vA1Ix0WZ3qhxtAz23OX4jRSkVnBqo5xwBN1nRUlTBtFEqVtxSs1zYPbbPXTnw8
	 yBxIJakdNVv8Q==
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-677fb25cfe5so63964776d6.3
        for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 04:08:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701173300; x=1701778100;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iOZrwSPmspp94JeIuHB4gK1Gx/cQjCpWhXKzSprsIjI=;
        b=PXYcxoM6DVcsEa0wtZz8mmaRq2l40k7UMWopl0biG+JxicCrqTuJvmc+LW1sjJs70v
         hndOTTWWUNOF41oIer844MIWxjm7hhXueAJFs27XQjWIe0/cSF85lYShT6r0OG137t7M
         I//MCVF0iBOontnzFz3VUiBVm5Dwc1LHEeHyRtcXkrUBzRqfzwkOvGPmDmv1XTQb09Bo
         fLJDm3NGu2mkyPyGM7Ve++xFWUaGKaR2LCT5qmNskz/vfR85B3Ey9dQL6/FU1bwgtzoB
         DAy6s/cXrJgihpYSmkdQkXba+7r9nJRUO623FZnCc+Pd+PelpxsNrXK9UUrKqo5CfLPj
         HggQ==
X-Gm-Message-State: AOJu0YxkhhCfI52y13OjVWhjxoQihj6F6PvcJ+7945rbTfI06ZS5o1+V
	YduXc1XIk6Wy/hh6XKVh0qoGkcHxhGoEkmBkTgHniwAkvz6/kpPT4Mjo0crrdl+lICOKNBrjNbX
	+N08Afne2Yx80RjkxjgwQ3zmgOmHLBOd8ycdWtuIGD5xbBYQeKX0hHTyyMW5zTA==
X-Received: by 2002:a0c:c788:0:b0:67a:4bb0:693a with SMTP id k8-20020a0cc788000000b0067a4bb0693amr5088412qvj.55.1701173299945;
        Tue, 28 Nov 2023 04:08:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBEBEjzW+Uph8+AZgkvAUsq8GnJE2nUXrDjraYHJF2flj0Zg8LkQf+0YqL9hF83A1yoS4DqWVvh0w1JaGFdxE=
X-Received: by 2002:a0c:c788:0:b0:67a:4bb0:693a with SMTP id
 k8-20020a0cc788000000b0067a4bb0693amr5088373qvj.55.1701173299631; Tue, 28 Nov
 2023 04:08:19 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Nov 2023 13:08:18 +0100
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <2f06ce36-0dc1-495e-b6a6-318951a53e8d@collabora.com>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-13-cristian.ciocaltea@collabora.com>
 <CAJM55Z9e=vjGKNnmURN15mvXo2bVd3igBA-3puF9q7eh5hiP+A@mail.gmail.com> <2f06ce36-0dc1-495e-b6a6-318951a53e8d@collabora.com>
Mime-Version: 1.0
Date: Tue, 28 Nov 2023 13:08:18 +0100
Message-ID: <CAJM55Z8vkMbqXY5sS2o4cLi8ow-JQTcXU9=uYMBSykwd4ppExw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231128_040828_471882_E039F731 
X-CRM114-Status: GOOD (  32.53  )
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
> On 11/26/23 23:10, Emil Renner Berthing wrote:
> > Cristian Ciocaltea wrote:
> >> The BeagleV Starlight SBC uses a Microchip KSZ9031RNXCA PHY supporting
> >> RGMII-ID.
> >>
> >> TODO: Verify if manual adjustment of the RX internal delay is needed. If
> >> yes, add the mdio & phy sub-nodes.
> >
> > Sorry for being late here. I've tested that removing the mdio and phy nodes on
> > the the Starlight board works fine, but the rx-internal-delay-ps = <900>
> > property not needed on any of my VisionFive V1 boards either.
>
> No problem, thanks a lot for taking the time to help with the testing!
>
> > So I wonder why you need that on your board
>
> I noticed you have a patch 70ca054e82b5 ("net: phy: motorcomm: Disable
> rgmii rx delay") in your tree, hence I you please confirm the tests were
> done with that commit reverted?
>
> > Also in the driver patch you add support for phy-mode = "rgmii-txid", but here
> > you still set it to "rgmii-id", so which is it?
>
> Please try with "rgmii-id" first. I added "rgmii-txid" to have a
> fallback solution in case the former cannot be used.

Ah, I see. Sorry I should have read up on the whole thread. Yes, the Starlight
board with the Microchip phy works with "rgmii-id" as is. And you're right,
with "rgmii-id" my VF1 needs the rx-internal-delay-ps = <900> property too.

>
> > You've alse removed the phy reset gpio on the Starlight board:
> >
> >   snps,reset-gpios = <&gpio 63 GPIO_ACTIVE_LOW>
> >
> > Why?
>
> I missed this in v1 as the gmac handling was done exclusively in
> jh7100-common. Thanks for noticing!
>
> >>
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >> ---
> >>  arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >> diff --git a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> >> index 7cda3a89020a..d3f4c99d98da 100644
> >> --- a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> >> +++ b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> >> @@ -11,3 +11,8 @@ / {
> >>  	model = "BeagleV Starlight Beta";
> >>  	compatible = "beagle,beaglev-starlight-jh7100-r0", "starfive,jh7100";
> >>  };
> >> +
> >> +&gmac {
> >> +	phy-mode = "rgmii-id";
> >> +	status = "okay";
> >> +};
> >
> > Lastly the phy-mode and status are the same for the VF1 and Starlight boards,
> > so why can't these be set in the jh7100-common.dtsi?
>
> I wasn't sure "rgmii-id" can be used for both boards and I didn't want
> to unconditionally enable gmac on Starlight before getting a
> confirmation that this actually works.
>
> If there is no way to make it working with "rgmii-id" (w/ or w/o
> adjusting rx-internal-delay-ps), than we should switch to "rgmii-txid".

Yeah, I don't exactly know the difference, but both boards seem to work fine
with "rgmii-id", so if that is somehow better and/or more correct let's just go
with that.

Thanks!
/Emil

>
> Thanks,
> Cristian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
