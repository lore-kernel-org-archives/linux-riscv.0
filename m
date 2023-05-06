Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B4FC77B7F
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 21:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wC5mWc47xTCi4wtCoxi1SvPfAl34lT8c+mZiy2vTOy8=; b=bT/P2QRETOlsni
	Ob9xamGFQppdkc0PqOwrwGnZIQhyDNn+KpKoWdu9jbANPzb0rVLvJVPWsmdgoZT/CqKkWZ9JPxnr2
	5XREV28eAYL5qSZ7qjutHmQFigiEJ646TBz3yGsDcCRxMuzb2Q5BpvNGCTrzuOsKow+t/arUQzr0e
	lZKweK6sFrIA/SFQvBO+LFDi5V5eX7/3P1zn190o9FO5ENqJtuMcfTFw/GkUZupE6RJvtsyWwyJB+
	cfnO5kdIIW8UrZER6aXj8oDSVZuDTPRlMPm/1SlAshvqJ+KrohU61JdIg0iOlBmJ5MIBE6E9L/Zt0
	kRQhbcq5VZg+LrwopBJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvPvR-00ER9a-0K;
	Sat, 06 May 2023 21:58:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvPvM-00ER7v-1a;
	Sat, 06 May 2023 21:58:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC8FC1FB;
	Sat,  6 May 2023 14:59:14 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 364DF3F5A1;
	Sat,  6 May 2023 14:58:27 -0700 (PDT)
Date: Sat, 6 May 2023 22:58:11 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Maksim Kiselev <bigunclemax@gmail.com>, Icenowy Zheng <icenowy@aosc.io>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Heiko Stuebner
 <heiko.stuebner@vrull.eu>, Maxime Ripard <mripard@kernel.org>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/6] dt-bindings: spi: sun6i: add DT bindings for
 Allwinner R329 SPI
Message-ID: <20230506225811.4e928e46@slackpad.lan>
In-Reply-To: <e38cbcdf-5963-fb00-d7b2-66d4129f9fce@linaro.org>
References: <20230506073018.1411583-1-bigunclemax@gmail.com>
	<20230506073018.1411583-2-bigunclemax@gmail.com>
	<e38cbcdf-5963-fb00-d7b2-66d4129f9fce@linaro.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_145840_630631_FBDB2AD1 
X-CRM114-Status: GOOD (  26.36  )
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

On Sat, 6 May 2023 12:53:07 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

Hi Maksim,

> On 06/05/2023 09:30, Maksim Kiselev wrote:
> > From: Icenowy Zheng <icenowy@aosc.io>
> > 
> > Allwinner R329 SPI has two controllers, and the second one has helper
> > functions for MIPI-DBI Type C.  
> 
> I wonder what is the difference of DBI compatible. You refer to "helper
> functions", which sounds like driver... do you mean some parts of SPI
> controller?

So I checked the manuals, all of the D1, T113-s and R329 are the same
in this respect:
- There are two SPI controllers, the "first" one is what this series
  fully supports.
- The second SPI controller has some additional registers and two
  extra bits in the control register to drive the DBI extension, but is
  otherwise compatible to the first one:

So I'd suggest to introduce the following compatible string
combinations to the binding *now*. We don't support the DBI bits (yet),
but this would be the correct hardware description:

For the R329:
spi0: spi@4025000 {
	compatible = "allwinner,sun50i-r329-spi";
	....
spi1: spi@4026000 {
	compatible = "allwinner,sun50i-r329-spi-dbi",
		     "allwinner,sun50i-r329-spi";
For the D1/T113s:
spi0: spi@4025000 {
	compatible = "allwinner,sun20i-d1-spi",
		     "allwinner,sun50i-r329-spi";
	....
spi1: spi@4026000 {
	compatible = "allwinner,sun20i-d1-spi-dbi",
		     "allwinner,sun50i-r329-spi-dbi",
		     "allwinner,sun50i-r329-spi";

I leave that as an exercise to the reader to convert that into the
minimal set of DT schema lines ;-)
I would suggest to add both the D1/T113s and the R329 bindings in this
one patch, to reduce the churn. I guess if you do this, you could even
drop Icenowy's authorship on this patch, since it has not much to do
with the original version anymore.

Cheers,
Andre


> > Add compatible strings for these controllers
> > 
> > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
>
> > ---
> >  .../devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml        | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> > index de36c6a34a0f..2c1b8da35339 100644
> > --- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> > +++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> > @@ -21,6 +21,8 @@ properties:
> >      oneOf:
> >        - const: allwinner,sun6i-a31-spi
> >        - const: allwinner,sun8i-h3-spi
> > +      - const: 
> > +      - const: allwinner,sun50i-r329-spi-dbi  
> 
> As Conor pointed out, nothing improved here.
> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
