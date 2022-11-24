Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F6AC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 05:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mdZfd/ItVIu8qoA+rMShVL0UgmXa5PwXtVEL+3w6mjk=; b=geyOxHEQliKI4u
	tsdPb0+EoTPApquqnwRghdjz8x5+nDH2w8X68x1wVLplSUvFKrH+9whIgTYJyPHE/PjJpQuJNGCV2
	FaM3/KrninmVw/C7R3qyS8GTJOsC071umy2TXYG94Y9eAHgbv+XeBxNnni6s0qdFMMgNKHFISEG+y
	H72AZ/N6M/LnzhMPuIfTE1Ya+1Qv/zPhWfx598+omFINmk2qWKO06jg+PmxwxH2y3OPz49wHEuDhb
	Tq+9x644JdSQJGbkEI5PYGvnINWHQznmsRSnnqnwiA2tvNlavwt60mMhtVQ40+nV+jjdDiIj9LYZN
	Omk8tgPY3fDvWPIFvNyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy5E3-005QLz-FW; Thu, 24 Nov 2022 05:56:43 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy5Dy-005Q98-Fs
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 05:56:42 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 886F424DECD;
	Thu, 24 Nov 2022 13:56:11 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 24 Nov
 2022 13:56:11 +0800
Received: from [192.168.125.106] (183.27.97.81) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 24 Nov
 2022 13:56:10 +0800
Message-ID: <ca3e341a-3dc3-39d6-7e26-89ba65aa9473@starfivetech.com>
Date: Thu, 24 Nov 2022 13:56:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 1/8] dt-bindings: riscv: Add StarFive JH7110 SoC and
 VisionFive2 board
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Conor Dooley
	<conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks
	<ben.dooks@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier
	<maz@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Linus
 Walleij" <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
References: <20221118011714.70877-1-hal.feng@starfivetech.com>
 <20221118011714.70877-2-hal.feng@starfivetech.com>
 <202211190418.2AJ4IQjc072382@SH1-CSMTP-DB111.sundns.com>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <202211190418.2AJ4IQjc072382@SH1-CSMTP-DB111.sundns.com>
X-Originating-IP: [183.27.97.81]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_215638_822798_B4CE89E0 
X-CRM114-Status: GOOD (  18.45  )
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

On Sat, 19 Nov 2022 01:28:48 +0800, Emil Renner Berthing wrote:
> On Fri, 18 Nov 2022 at 02:17, Hal Feng <hal.feng@starfivetech.com> wrote:
> >
> > From: Emil Renner Berthing <kernel@esmil.dk>
> >
> > Add device tree bindings for the StarFive JH7110 RISC-V SoC [1]
> > and the VisionFive2 board [2] equipped with it.
> >
> > [1]: https://doc-en.rvspace.org/Doc_Center/jh7110.html
> > [2]: https://doc-en.rvspace.org/Doc_Center/visionfive_2.html
> >
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/starfive.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
> > index 5b36243fd674..64008c57e31f 100644
> > --- a/Documentation/devicetree/bindings/riscv/starfive.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
> > @@ -22,6 +22,10 @@ properties:
> >            - const: beagle,beaglev-starlight-jh7100-r0
> >            - const: starfive,jh7100
> >
> > +      - items:
> > +          - const: starfive,visionfive-v2
> 
> I think StarFive has switched to just calling it VisionFive 2 and not
> V2. Please check up on this before committing to the compatible
> string.
> 
> Also there are going to be different revisions of the VisionFive 2
> board, so maybe consider adding eg. starfive,visionfive-2-v1.1 and
> starfive,visionfive-2-v1,2b early.

I checked that the official name of this board is "VisionFive 2". The
board has version A and version B, which are different in gmac and phy
chip. The version A board has one 1000M and one 100M Ethernet ports
while the version B board has two 1000M Ethernet ports. In dts, they
have different configuration parameters for gmac. So I would like to
distinguish them by two compatibles as below in the next version.

      - items:
          - enum:
              - starfive,visionfive-2-va
              - starfive,visionfive-2-vb
          - const: starfive,jh7110

Best regards,
Hal

> 
> > +          - const: starfive,jh7110
> > +
> >  additionalProperties: true


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
