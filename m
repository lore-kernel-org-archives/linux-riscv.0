Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7271C001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 10:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4PdjkNZpDGMKKwEdA/f3yPFOLFvYoSbGzn1tJ3mV9JA=; b=wSpUxwN4/p5P7u/Ka9Z07to1Oc
	1PV6qlnn0wXECKD9mFnf5ekOXNIqCutmXabfS7qVMq3xbekaRyWyS09SPMwBguEhG4ZsuRvj/K4Ef
	Ocal6a0rfnymrK/cWYx3t6OFqttaevp2htQOTjEwfb9yJtUeqLQeAdC2Frukvv4wXbMoCke5MyxSK
	rdJViqrVuQLP9poRYKyIpwl9fEz9PCBwgaOWvGYqx11vlWep+j3+UY37SF4ROEej5fCBIw6gIFVZm
	XotlVVIYV4MghqP1uD6twL0s8/wJheiIXkFepewsmaJrce4W+/Yo433lvMB8EYofrd36KIqpgIiVQ
	j5q87DCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsxa-003qPQ-0m;
	Mon, 24 Jul 2023 10:38:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsxX-003qOf-1O
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 10:38:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690195115; x=1721731115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eUPS2eKQuZV1PS+dulQY1U13BfYH8VlPDUoaYrp3SCU=;
  b=yc0piY3wQiXZ2WZUhJQXC2mTxpEyBSgXyVfCB0xDigcWOFEu7Q2OBmev
   DBoV6ikuP0Z4pFEphO5U7VIpENouTIpIwbDW1AW+GS3K7Yfk/HKmFX8rh
   Zi6UumWHKrsWPh+XhmKQW9hAnqnM/DjAARN0CjLHLcGlfSh0jKU30X9WU
   eiGzUEediNdFFchSwR7e3DFJmkNMtSfhvrgKwpV25MCSXlZqFqOxsN3bd
   tfEkUPoYuDxx3IMAiKHEIGrCTKH9tFi0feGCpFa2mOnxfwY7WvzpLuMEI
   Va9tXc/FA0PYbtHlwMMaSbpNkD0KaK73MN9R2wsAR1lDvrE+9R1ha3Gbb
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="asc'?scan'208";a="237301218"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Jul 2023 03:38:33 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 24 Jul 2023 03:38:33 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 24 Jul 2023 03:38:30 -0700
Date: Mon, 24 Jul 2023 11:37:56 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jisheng Zhang <jszhang@kernel.org>
CC: Drew Fustini <dfustini@baylibre.com>, Conor Dooley <conor@kernel.org>, Guo
 Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Robert Nelson
	<robertcnelson@beagleboard.org>, Jason Kridner <jkridner@beagleboard.org>
Subject: Re: [PATCH 1/3] riscv: dts: thead: add BeagleV Ahead board device
 tree
Message-ID: <20230724-census-party-0a50d1563075@wendy>
References: <20230722-upstream-beaglev-ahead-dts-v1-0-ccda511357f4@baylibre.com>
 <20230722-upstream-beaglev-ahead-dts-v1-1-ccda511357f4@baylibre.com>
 <20230723-savor-trolling-e35ed4a7a751@spud>
 <ZL1jlacHj7sgNg8M@x1>
 <ZL3Eenj4lGZDhZTM@xhacker>
MIME-Version: 1.0
In-Reply-To: <ZL3Eenj4lGZDhZTM@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_033835_495810_1535C2FF 
X-CRM114-Status: GOOD (  20.73  )
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
Content-Type: multipart/mixed; boundary="===============5883982424388382988=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5883982424388382988==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IYmJ4PmQz3geta1F"
Content-Disposition: inline

--IYmJ4PmQz3geta1F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2023 at 08:23:22AM +0800, Jisheng Zhang wrote:
> On Sun, Jul 23, 2023 at 10:29:57AM -0700, Drew Fustini wrote:
> > On Sun, Jul 23, 2023 at 11:32:17AM +0100, Conor Dooley wrote:
> > > On Sat, Jul 22, 2023 at 02:55:39PM -0700, Drew Fustini wrote:
> > >=20
> > > > +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > > > @@ -0,0 +1,61 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > >=20
> > > Hmm, should this not be dual licensed?
> > > I notice the other th1520 stuff isn't either..
> >=20
> > Good point, I'll resubmit with a dual license.
> >=20
> > Jisheng: are you okay with the other arch/riscv/boot/dts/thead files
> > changing to a dual license?
>=20
> When cooking the initial patch, I wrote the lpi4a dts files from
> scratch based on sipeed opened sch file, and currently only I made
> contributions to them, so it's easy to make the lpi4a dts files
> dual license.
>=20
> However, when constructing the th1520.dtsi, I refered the T-HEAD's
> opensourced yocto repo(in fact, that's the only sourcecode/doc I have
> at that time), and the license there is GPL-2.0. That's
> also the reason why copyright of Alibaba Group Holding Limited is
> added to th1520.dtsi. I'm not sure how to make th1520.dtsi dual
> license. At least, this needs help from Guo Ren. Any suggestion is
> appreciated.

I think Guo Ren Acking the change should be sufficient. It'd be good to
have them dual licensed to make it easier for other projects to include
the dts files from Linux. Almost all of what we have at the moment is
dual licensed, other than the Canaan stuff & some board dts files I got
=66rom customers that were only GPLed.

--IYmJ4PmQz3geta1F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL5UhAAKCRB4tDGHoIJi
0t3eAP0SIcy6zSf49cO2g9xepgYH48UogCXzOT92cUu2NKH05QEA5Fk0An0caUmn
SbO0ODosTVbVLHdioxciWhf1orRGXQM=
=Ii48
-----END PGP SIGNATURE-----

--IYmJ4PmQz3geta1F--


--===============5883982424388382988==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5883982424388382988==--

