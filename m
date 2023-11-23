Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD90C61D85
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 09:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eOjMwiaISzfjGZ9m7Grpmku/KtKeYHMBVo02rQZQ9j4=; b=iSdokcsQhv2VEXxMkQVkcz2QQF
	1VXU5iG8n9K9cCCL1UbCJ4GA0qQIMFKr/rG1mO6+BuqDTnoKrrSYuMsjcBtfh9/Ea5Xw9L5kr6BgT
	cfZfq4WDdYzusf4ifSWuONZgGe9rGKaXRlsW/KbJAXLUUpzAVS+fwmmKY7G3cV8la0SrKNl4jeJg9
	5ANS9FuuRia2FHqLK1I6qDN/bdt/ztnlv0kZGADmyWCGR7rI2MZrofTv8wsCcohvwdPoml0fXEJC2
	ukDAPiIIvr9jbPma7EzKQI0KjurF4pfETBRjMJ7gOrJI+X5kcDgvk86omG1A8MM8T50Gd3J86O+v9
	ChHvC2CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r66Ga-004IYg-0K;
	Thu, 23 Nov 2023 09:45:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r66GW-004IXd-1D;
	Thu, 23 Nov 2023 09:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1700732696; x=1732268696;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LPFNYR6tLm2ibdzV9smgUSVHDB6vTwM5UIqyj9DLBUM=;
  b=gccQs3ZPwKHUc3wCAPxq0+7ZAvGTo9rG3wJ1JYI3ZFK/mZSwFzjIhlVn
   vDDTGgpE8hUZ8LtBxoOyywqxyCSh6moaqtRPjGoOcsktOjYDX1uIpBZXF
   44zXND1fcNmiW3GQyk8oCosiQcxmaNlOmgXqMaF+gSjffRreth39oXBNH
   JCuJSfKTv72VCZl7QgiDrXbZbGT6mU4DcrdJ+U52y4tj5dbkhYEVx2AGL
   9Pr3ZfyegDPxsbFntT8HxlTGkVChxA03v/wIK2G6NZKOvE/LzYNzmI0Ne
   6DGzB0EaPa9zG+pPlytce6xNhV0LYqdfZEzrjQcLMug16bsQMKFwYKkjL
   Q==;
X-CSE-ConnectionGUID: Zrbw1xdKSOmkRdUe4iw5XQ==
X-CSE-MsgGUID: e8PbdSIKRoap7LBep/y66g==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="asc'?scan'208";a="12925617"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2023 02:44:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Nov 2023 02:44:25 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 23 Nov 2023 02:44:21 -0700
Date: Thu, 23 Nov 2023 09:43:53 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Masahiro Yamada <masahiroy@kernel.org>
CC: Rob Herring <robh@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Conor Dooley <conor@kernel.org>,
	<linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH v2 0/4] kbuild: Per arch/platform dtc warning levels
Message-ID: <20231123-deviator-camisole-645715ad02e9@wendy>
References: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org>
 <CAK7LNASVMjVg4dr=KdSDHwGww_47H78H7rMXA=wf+ncugesDSA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK7LNASVMjVg4dr=KdSDHwGww_47H78H7rMXA=wf+ncugesDSA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_014456_531997_0A7A493A 
X-CRM114-Status: GOOD (  23.98  )
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
Content-Type: multipart/mixed; boundary="===============0192862960530748907=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0192862960530748907==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2G62sYkADi9C8Ekb"
Content-Disposition: inline

--2G62sYkADi9C8Ekb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Thu, Nov 23, 2023 at 04:38:37PM +0900, Masahiro Yamada wrote:
> On Thu, Nov 23, 2023 at 7:12=E2=80=AFAM Rob Herring <robh@kernel.org> wro=
te:
> >
> > This series adds support to set the dtc extra warning level on a per
> > arch or per platform (directory really) basis.
> >
> > The first version of this was just a simple per directory override for
> > Samsung platforms, but Conor asked to be able to do this for all of
> > riscv.
> >
> > For merging, either I can take the whole thing or the riscv and samsung
> > patches can go via their normal trees. The added variable will have no
> > effect until merged with patch 2.
> >
> > v1:
> >  - https://lore.kernel.org/all/20231116211739.3228239-1-robh@kernel.org/
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
>=20
>=20
> There were some attempts in the past to enable W=3D1 in particular subsys=
tems,
> so here is a similar comment.
>=20
> Adding a new warning flag to W=3D1 is always safe without doing any compi=
le test.
>=20
> With this series, it would not be true any more because a new warning in =
W=3D1
> would potentially break riscv/samsung platforms.

We carry a copy of the dtc in scripts/dtc, so I would expect that before
an upgrade is done that would introduce new warnings we can fix them in
the relevant platforms. Perhaps I am misunderstanding something there,
but I'm sure Rob can clear it up if I made a mistake.

> Linus requires a clean build (i.e. zero warning) when W=3D option is not =
given.

For RISC-V at least, there are currently no W=3D1 warnings while building
the dtbs (because I put effort into fixing them all) and I would like to
keep it that way, so that requirement is not a concern.

Cheers,
Conor.


--2G62sYkADi9C8Ekb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV8e1AAKCRB4tDGHoIJi
0sxaAQC2J2yJot6Q+z5RKQ6rY/Oa21cLwAgbgnGOkI0wsdpSGgD/X8W0HHWXxPfn
qGSKWwZvElDt0/4G68GZFIxJXRd/Kwk=
=Wtop
-----END PGP SIGNATURE-----

--2G62sYkADi9C8Ekb--


--===============0192862960530748907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0192862960530748907==--

