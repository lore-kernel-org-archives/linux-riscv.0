Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF49DC4706C
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 07:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csJ0RdbckIZVp2Br9456yuehCGFCa83EftMc5TpEJMg=; b=4PTlLW1AgU8+FfmuuoxD/uJj1f
	0JHhHsDG9GB5Uy23dYLGhPR5gCyghkSjyzntj+q8IGNmc3gXhsmVX+udeywjQx3xCY0+hOACh7gzn
	OjD5qQ4WIin1IfjiTquARfqqm+Kjj8euYnXow/JgyYpoOu9wEc1laNiHgkpK9SsBMjaT0gH29FOBi
	sMe3kUi5cjG2TlNUw5G1upc+QwXeGPfjLoW880ncgip2vZOakKXKvp/o5zAl1iuVxgfHE0XGccGRm
	pooQkQuVn1h/iOlEX0qIya9q3B+ccbCDCzuZmt9Ou368L+RLVwQ0866zuxsQ8jUXzN61aAQQzHtUs
	ejPYqYvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPe16-00BF4g-2g;
	Tue, 16 Jan 2024 07:37:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPe13-00BF2M-1C
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 07:37:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1705390665; x=1736926665;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W2Z5WovOkoDhRrX3oZ/2SAj8+B2nb1yllR5MhnzNHik=;
  b=0iU7h7D1xA6W3VUaUtn808AG54mNC9VSZiQ/T9Vp5Na3YmYeqtfCqY1H
   hhIJcigMA2LCgdESgr8TvkHi1SF4J06FIgp23vT0xD0CmiqpO78nqZenC
   NPku32lkm4JJc9ux9Vv4dUu8tGg0g6624dyb1y7U+U3w9hVUfUFlUnBV9
   Ehf5rmdV2FRjLTSVloxWkTaxL2bp2+Zyy8SACWr8eLS0yDEXre7UD/JjR
   QXlKTkwd/dSVWTgJXOgQU4e1jmFSK7hA0SWH+o8vDzmJxDcAUg8dQpHVG
   u28oMKCB/B+dBro8YijiHl2PqCilBIv5CnCwwpXTJ6rYuV1oqGEg32HIs
   g==;
X-CSE-ConnectionGUID: IsWRT3HCQVmB2vjRJZ30Vg==
X-CSE-MsgGUID: fn1riB1hQsScBhpbjzpgYw==
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
   d="asc'?scan'208";a="14788093"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Jan 2024 00:37:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 00:37:38 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 16 Jan 2024 00:37:34 -0700
Date: Tue, 16 Jan 2024 07:36:58 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Inochi Amaoto <inochiama@outlook.com>
CC: Conor Dooley <conor@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Chao
 Wei <chao.wei@sophgo.com>, Chen Wang <unicorn_wang@outlook.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, Liu
 Gui <kenneth.liu@sophgo.com>, Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	<dlan@gentoo.org>, <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v6 1/4] dt-bindings: clock: sophgo: Add clock controller
 of SG2000 series SoC
Message-ID: <20240116-doubling-fanning-2a46405942ae@wendy>
References: <20240115-spendable-achiness-cff7918fe810@spud>
 <IA1PR20MB4953C0E6DCC3C4CC0A398529BB732@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB4953C0E6DCC3C4CC0A398529BB732@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_233745_584953_DAD12141 
X-CRM114-Status: GOOD (  24.88  )
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
Content-Type: multipart/mixed; boundary="===============0004254836102199693=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0004254836102199693==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eB8X+Pg8BaNk7w+A"
Content-Disposition: inline

--eB8X+Pg8BaNk7w+A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 08:27:59AM +0800, Inochi Amaoto wrote:
> >On Sun, Jan 14, 2024 at 12:16:58PM +0800, Inochi Amaoto wrote:
> >> SG2000 series SoC has the same clock as CV1810 series, but the clock
> >> related to A53 is functional in SG2000 series. So a new compatible
> >> string is needed for the new SoC.
> >>
> >> Add definition for the clock controller of the SG2000 series SoC.
> >>
> >> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> >> Link: https://github.com/sophgo/sophgo-doc/releases/tag/sg2000-datashe=
et-v1.0-alpha
> >> ---
> >>  Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk=
=2Eyaml b/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
> >> index c1dc24673c0d..59ef41adb539 100644
> >> --- a/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
> >> +++ b/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
> >> @@ -4,7 +4,7 @@
> >>  $id: http://devicetree.org/schemas/clock/sophgo,cv1800-clk.yaml#
> >>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >>
> >> -title: Sophgo CV1800 Series Clock Controller
> >> +title: Sophgo CV1800/SG2000 Series Clock Controller
> >>
> >>  maintainers:
> >>    - Inochi Amaoto <inochiama@outlook.com>
> >> @@ -14,6 +14,7 @@ properties:
> >>      enum:
> >>        - sophgo,cv1800-clk
> >>        - sophgo,cv1810-clk
> >> +      - sophgo,sg2000-clk
> >
> >I recall before you mentioned that the Sophgo folks were considering
> >renaming one of their devices. Is the sg2000 the renamed one, or a
> >different chip?

> The sg2000/sg2002 SoCs have one A53 core which cv1812/cv1813 SoCs
> don't have. I prefer sg2000/sg2002 are different chips, or at least
> an enhanced version of existed cv1812/cv1813. It is not a simple
> rename.
>=20
> For this patch, the sg2000 doesn't need to disable A53 related clocks
> like cv18xx series. So this compatible is needed to bind to this new
> logic.

I'm not disputing the unique compatible - you previously mentioned that
Sophgo were considering rebranding the cvXXXX series of chips going
forward and that one particular chip might undergo a name change.
I was wondering if this was that chip or just another device in the
series.

Thanks,
Conor.

--eB8X+Pg8BaNk7w+A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaYyFgAKCRB4tDGHoIJi
0ny6AQD8jsSGjB9PRHJIURaIii46XV0kYNTdn/N7cJvxFm0LXQEApESH0dzNDVT/
TL70OnJGXzymk7n0pSlvQzK/NlNa2gY=
=HiGa
-----END PGP SIGNATURE-----

--eB8X+Pg8BaNk7w+A--


--===============0004254836102199693==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0004254836102199693==--

