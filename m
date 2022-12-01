Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBEEC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 07:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Op/rYOdnPFhOj2WqFx8YzdbFyP9Zu6q2TAOjsHrm3E=; b=topb7BvZdKew1U
	c4ZGr7uKWmweHCb3rrh3Bpx3L5Lk+JfCuUT4QvQCKr/ZGzfgBIzCaRk5gcjCy06jvhJJp92/epv3f
	MMHcqkp7mbl+ucxTf8v+MTn/g8a5PatocrmBvmAmfvKy+kkbV7+7/9Ry4Thym1b6FzGhhNe2Qdw9q
	MjeNUDf8RRd7fQSs6a+30t+A++gArC4LmJs20IROsf2pIUtWCzA0R+TbYXcUHI4KC2FiOXAjVq37k
	YbDfRfuHVjkosvcJHoDBjbGl4z2yqCZvzxVxFN6ACGwtZ4tBLDS0QZp2rgi643NFhE4TmRhH7PqeP
	CBdwPGVYQ9FjkrK78A4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0dxg-005VnY-Aq; Thu, 01 Dec 2022 07:26:24 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0dxb-005Vho-Tp
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 07:26:22 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 0767C24E37C;
	Thu,  1 Dec 2022 15:25:56 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 1 Dec
 2022 15:25:55 +0800
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 1 Dec
 2022 15:25:55 +0800
Received: from EXMBX068.cuchost.com ([fe80::c4da:cbc4:bb39:ca7e]) by
 EXMBX068.cuchost.com ([fe80::c4da:cbc4:bb39:ca7e%16]) with mapi id
 15.00.1497.044; Thu, 1 Dec 2022 15:25:56 +0800
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH 6/6] riscv: dts: starfive: Add crypto and DMA node for
 VisionFive 2
Thread-Topic: [PATCH 6/6] riscv: dts: starfive: Add crypto and DMA node for
 VisionFive 2
Thread-Index: AQHZBH/4vZHP2U3n+EalaiuTkXOjPK5W7jsAgAGzxIA=
Date: Thu, 1 Dec 2022 07:25:56 +0000
Message-ID: <37089b7591f74034aad58c7d29021c3d@EXMBX068.cuchost.com>
References: <20221130055214.2416888-1-jiajie.ho@starfivetech.com>
 <20221130055214.2416888-7-jiajie.ho@starfivetech.com>
 <6de013d9-f2ab-a2d8-1022-2474c037c737@linaro.org>
In-Reply-To: <6de013d9-f2ab-a2d8-1022-2474c037c737@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_232620_262296_4A67E91A 
X-CRM114-Status: GOOD (  16.48  )
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



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: Wednesday, November 30, 2022 9:22 PM
> To: JiaJie Ho <jiajie.ho@starfivetech.com>; Herbert Xu
> <herbert@gondor.apana.org.au>; David S . Miller <davem@davemloft.net>;
> Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>
> Cc: linux-crypto@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-riscv@lists.infradead.org
> Subject: Re: [PATCH 6/6] riscv: dts: starfive: Add crypto and DMA node for
> VisionFive 2
> 
> On 30/11/2022 06:52, Jia Jie Ho wrote:
> > Adding StarFive crypto IP and DMA controller node to VisionFive 2 SoC.
> >
> > Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> > ---
> >  .../jh7110-starfive-visionfive-v2.dts         |  8 +++++
> >  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 36 +++++++++++++++++++
> >  2 files changed, 44 insertions(+)
> >
> > diff --git
> > a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> > b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> > index 450e920236a5..da2aa4d597f3 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> > @@ -115,3 +115,11 @@ &tdm_ext {
> >  &mclk_ext {
> >  	clock-frequency = <49152000>;
> >  };
> > +
> > +&sec_dma {
> > +	status = "okay";
> > +};
> > +
> > +&crypto {
> > +	status = "okay";
> > +};
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > index 4ac159d79d66..745a5650882c 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > @@ -455,5 +455,41 @@ uart5: serial@12020000 {
> >  			reg-shift = <2>;
> >  			status = "disabled";
> >  		};
> > +
> > +		sec_dma: sec_dma@16008000 {
> 
> Node names should be generic.
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-
> devicetree-basics.html#generic-names-recommendation
> 
> No underscores in node names.
> 
> Does not look like you tested the DTS against bindings. Please run `make
> dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
> for instructions).

I'll fix the node name and run dtbs_check for the revised series.
Really appreciate your time and effort reviewing this patch.

Thanks,
Jia Jie
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
