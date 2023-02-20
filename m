Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E020C636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 10:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zB16pgbeVJONyg1qOyrfY/zFSRDMqfPrQp2RW4VXmPE=; b=OqpawttOOFyLKAr9YVo1MMOz1M
	AA8bX8O/U0UiOLedp3Q+lM1HWRLdqO0o+kvquzgy3vu91vOb7T3SKtdHvICEkwhzrVUQfaO/2KwLV
	jY2KDDftnEVNSwhXkhgI0o8K9yVbEEaMzs7ywNaXLMfLOaHBbkBe1p/3VE2FlO1UvU/WJKgklqVKE
	+6gF3m9Y5eqEIn1WPCEeYV59rkgUlVqTctVKN7h8LoxBLOjyrQi54RXc6UOrU3IPEfPpE2e8Oua3E
	jPFUHNWBp1o7/qIYaiyXB0j9AgNVwmP93JTWtwWWnUSMUI2WFLuvlPPFMnWft5uidu3STT9tPxEKF
	4jDBgYvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU3UH-003ewb-6o; Mon, 20 Feb 2023 10:33:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU3UB-003eud-CV
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 10:33:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676889211; x=1708425211;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gMmZ0r6hf7TDjajRLymz5GG8FbL+fuZU7Rc97O5DCnI=;
  b=VAvuE/x5clH0VarJ0Vov+jZTLvIUorRe+UMZkzMpbLMpHu+SXcaICGl5
   nk62vcNwPgU83urvzmFT5FgiVWucLsft5Q7QLs0mc3cxSiJLWtTmvlNIj
   VTD1oeFAKLRd3lAsyUy7dOU04+2qb3v1fybWvfDTo6CcZCGvGSxX7l6Yt
   TYs9lXSbj6g0jkAmScINYDSfOJq4cGdD73+pcG0NuQ8xEm0rwLZZaMvfn
   MHDnxwoTViNaOACt6cDCpZoInmKZMukOIqvOWE6J2JjrGO+rfo1MNOVx4
   ZTzLOzx1C/5haOWk5TkHHkWu3s8hcS+oPJwmIgqLTm2QmEhme0C5Bz3XW
   A==;
X-IronPort-AV: E=Sophos;i="5.97,312,1669100400"; 
   d="asc'?scan'208";a="201712956"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Feb 2023 03:33:26 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 20 Feb 2023 03:33:25 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 20 Feb 2023 03:33:23 -0700
Date: Mon, 20 Feb 2023 10:32:57 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Anup Patel <apatel@ventanamicro.com>
CC: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Atish Patra
	<atishp@atishpatra.org>, Alistair Francis <Alistair.Francis@wdc.com>, Anup
 Patel <anup@brainfault.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 6/9] dt-bindings: interrupt-controller: Add RISC-V
 advanced PLIC
Message-ID: <Y/NMWZAW4KAqKXEs@wendy>
References: <20230103141409.772298-1-apatel@ventanamicro.com>
 <20230103141409.772298-7-apatel@ventanamicro.com>
 <Y7X62v5Zp6+thx5A@spud>
 <CAK9=C2UPa5SATTG1pJdckqaoJxh-8EBz8xsENirZQ-vbaHTgjg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK9=C2UPa5SATTG1pJdckqaoJxh-8EBz8xsENirZQ-vbaHTgjg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_023331_473231_C9F19B45 
X-CRM114-Status: GOOD (  19.96  )
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
Content-Type: multipart/mixed; boundary="===============8110069369278534396=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8110069369278534396==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oq5et5R3KJ6LBPlj"
Content-Disposition: inline

--oq5et5R3KJ6LBPlj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Anup,

On Mon, Feb 20, 2023 at 10:06:49AM +0530, Anup Patel wrote:
> On Thu, Jan 5, 2023 at 3:47 AM Conor Dooley <conor@kernel.org> wrote:
> > On Tue, Jan 03, 2023 at 07:44:06PM +0530, Anup Patel wrote:
> > > We add DT bindings document for RISC-V advanced platform level
> > > interrupt controller (APLIC) defined by the RISC-V advanced
> > > interrupt architecture (AIA) specification.
> > >
> > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > ---
> > >  .../interrupt-controller/riscv,aplic.yaml     | 159 ++++++++++++++++=
++
> > >  1 file changed, 159 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/interrupt-contr=
oller/riscv,aplic.yaml

> > I'm sorry Anup, but this child versus delegate thing is still not clear
> > to me binding wise. See below.
>=20
> There are two different information in-context of APLIC domain:
>=20
> 1) HW child domain numbering: If an APLIC domain has N children
>     then HW will have a fixed child index for each of the N children
>     in the range 0 to N-1. This HW child index is required at the time
>     of setting up interrupt delegation in sourcecfgX registers. The
>     "riscv,children" DT property helps firmware (or bootloader) find
>     the total number of child APLIC domains and corresponding
>     HW child index number.
>=20
> 2) IRQ delegation to child domains: An APLIC domain can delegate
>    any IRQ range(s) to a particular APLIC child domain. The
>    "riscv,delegate" DT property is simply a table where we have
>    one row for each IRQ range which is delegated to some child
>    APLIC domain. This property is more of a system setting fixed
>    by the RISC-V platform vendor.

Thanks for the explanations. It's been a while since my brain swapped
this stuff out, but I think delegate/child makes sense to me now.
Just don't ask me to write the dt entry as proof...

Thanks,
Conor.

--oq5et5R3KJ6LBPlj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/NMWQAKCRB4tDGHoIJi
0sA5AQCb+6M/fBkWGw999APet2trx8vgEFPEqNrYEq/4Ao54SQEA2x1nyqApHLMa
7qdYK/TB1TlgBDnZ0TvxpDcYLBPaiAI=
=VmEP
-----END PGP SIGNATURE-----

--oq5et5R3KJ6LBPlj--


--===============8110069369278534396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8110069369278534396==--

