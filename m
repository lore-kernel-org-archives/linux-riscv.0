Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF96C27C6E
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 08:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXt7NCA2U3TnBsdfWAcCWXlUOt4uTl3jreyUxe3Wpk8=; b=3J1QfmExsebpcGsqewR/9Oc4TC
	MoSVgXIYcDevLSctsody7knY2F8YFabSP8Ck6rrO9P92Pkzw6Yyd1ZPcfmocTzr3//5xFl8VBW4Uf
	O5WqZsd3k/94kEerj5bRWglZQ78ez0k21idh820XGptuRSREsdmk+faHdvApc+QqnMc803pKkG1Hl
	sVGhNeITRN2/1B0Jw/mwVKe4jCav+wLzuM+qcw56eowjxVjHB5IAO38zCnDR3KTRvACQxz6OG3sTu
	lZRMsUPd/5TAnXMcG6uA8wKM0lLxBsbiYrjiHBwIkcJ+kr7g7rc6y2CWpvftnuwFwlduuLPrht6EC
	uKtA1HVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ7Lk-00000009mcN-0hEr;
	Mon, 17 Jun 2024 08:04:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ7Lh-00000009mbP-1VJq
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 08:04:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718611461; x=1750147461;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=46hqN2x9tCodtz4f+p9bKlz4DoolUlXsc2EoKqB+GqY=;
  b=k6Co88Gv7oXk0OqPERPCn0q/t0n/DqYbXtVEQp8aRKqxzfa8DAKVrXzz
   8LVqCmNvUbNWKco9TZiiYAwZBmSCCE5tk5cuHhZXdXD9+FeZ5sz5oQ2qg
   tNunIiZE+dv4tsVtS+6GMj9XNlF6kVQsdjI1LATamcoQiQBlUHR4ggHlP
   XOmU1H0XSJ7KeeOKW5vbCsVJYhzVRE+YNg9eOlQHAHSP8L40dbLJceL1H
   f0O/rGeQQtkKKMRdGP2s7LrP3N2mkcUwfnG+QgQezXwJVjItY4iu0F4FU
   npKJhAgvceLhlaM5U4hsZA9Hp7+V6uJGxMIZLKNlg/81CzI6qkM1FWia6
   Q==;
X-CSE-ConnectionGUID: KTYX6uPmSP2Ap7j89zTe6w==
X-CSE-MsgGUID: LwMaza2HTh6HKQMtkrNe5A==
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="asc'?scan'208";a="27844232"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Jun 2024 01:04:19 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 17 Jun 2024 01:04:00 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 17 Jun 2024 01:03:57 -0700
Date: Mon, 17 Jun 2024 09:03:39 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Inochi Amaoto <inochiama@outlook.com>
CC: Yixun Lan <dlan@gentoo.org>, Thomas Bonnefille
	<thomas.bonnefille@bootlin.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Chen Wang <unicorn_wang@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>, Albert Ou <aou@eecs.berkeley.edu>, Palmer
 Dabbelt <palmer@dabbelt.com>, Samuel Holland <samuel.holland@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 1/5] dt-bindings: interrupt-controller: Add SOPHGO SG2002
 plic
Message-ID: <20240617-arrival-settling-3a98e5939808@wendy>
References: <20240527-sg2002-v1-0-1b6cb38ce8f4@bootlin.com>
 <20240527-sg2002-v1-1-1b6cb38ce8f4@bootlin.com>
 <20240617003627.GA4008871@ofsar>
 <IA1PR20MB4953B2253043C304760A2D12BBCD2@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB4953B2253043C304760A2D12BBCD2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_010421_545106_66FE4055 
X-CRM114-Status: GOOD (  19.19  )
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
Content-Type: multipart/mixed; boundary="===============1043026980196674040=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1043026980196674040==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zYXOfHOY/pRglM2C"
Content-Disposition: inline

--zYXOfHOY/pRglM2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 11:33:00AM +0800, Inochi Amaoto wrote:
> On Mon, Jun 17, 2024 at 12:36:27AM GMT, Yixun Lan wrote:
> > hi Thomas:
> >=20
> > On 12:28 Mon 27 May     , Thomas Bonnefille wrote:
> > > Add compatible string for SOPHGO SG2002 Platform-Level Interruter
> > > Controller.
> > >=20
> > > Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> > > ---
> > >  .../devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml =
     | 1 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/interrupt-controller/s=
ifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-control=
ler/sifive,plic-1.0.0.yaml
> > > index 709b2211276b..7e1451f9786a 100644
> > > --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,p=
lic-1.0.0.yaml
> > > +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,p=
lic-1.0.0.yaml
> > > @@ -67,6 +67,7 @@ properties:
> > >                - allwinner,sun20i-d1-plic
> > >                - sophgo,cv1800b-plic
> > >                - sophgo,cv1812h-plic
> > > +              - sophgo,sg2002-plic
> >=20
> > it's not necessary to introduce a new compatible name, as sg2002 use sa=
me plic IP as cv1800b
> > I feel it's wrong to introduce sophgo,cv1812h-plic at first place, but =
that we can't revert?
> >=20
> > same reason also apply to clint in patch 2/5 ..
> >=20
>=20
> You are right, it is historical reasons. For hardware, they have the same=
 risc-v cores
> across the whole series.
>=20
> It could be better to use something just like "cv1800-plic".

Different integrations of the same IP could result in bugs present in
one device and not another. Unless these SoCs are the same die, but with
bits fused off, I'd appreciate soc-specific compatibles.

Thanks,
Conor.

--zYXOfHOY/pRglM2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZm/t0AAKCRB4tDGHoIJi
0rQZAP4sMNITKIgW0yhdH6QXLJeHlppfCx4teG80f1lrA0Oj4wEA096L9PT3PcMi
4tAca6zqH76nsuJnituv/7lYSa32vg8=
=K7NA
-----END PGP SIGNATURE-----

--zYXOfHOY/pRglM2C--


--===============1043026980196674040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1043026980196674040==--

