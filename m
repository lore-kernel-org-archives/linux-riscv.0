Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE63CC001E0
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 06:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k8d3nt+VnuAEZ46FKvs0HFi/8FQ7LeMY3PQXw27/8I8=; b=y47IR9+GTOPEfuBSJdWeDVKIIR
	/0dBCANARQPfmscAkn9n+8WzM0aYmQEmb8gXer43Qedkyk0Jqc6WxLO0cfSQQK5Qjdlj9RFKJM5t5
	kjsCH3HY4fNx+x4Pvra6lpm8RCRo1MAP17eZ2BpfzSal0UcKxa+IO/pPz3ZNaZNt129rZh18N69Uz
	46EGAxC+AwTbdR2SljqK8i+Bb8dV0gYHtNBnpzzKouMfjB4ghPsku7Eb1w4+ivJR+yayZBL/cerql
	xldPz4ujNKQJ4vcXZd+C0GadYALgUCFQ2QcyRUfpKKmzb4YW8zgUfo4Os391jd090GMp8abZ5NanL
	9oaCZJ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPHFz-001wNJ-2F;
	Fri, 28 Jul 2023 06:47:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPHFx-001wMK-19
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 06:47:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690526841; x=1722062841;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YtvQho51fiUQiVv7pUWMWChlYR1zLZ8AT/WHvdmM9Ww=;
  b=2kZJOcga8pZXl+RvGx3mul0FxvM4+WXwpXT1YXFkZGYf8uQaB4W+h/Wd
   Pxg4p0nIryQfQP4jgMi1c/sY9BuG7ySWFroBsbsQt6qIZWS8+hX3GJlfD
   TzngdGFvtqLVMPPG+rE+6gGPupklLdOydLWifQ536HLgfTSbpohYiBWUy
   9CRkUe0shf00WMJqjZoxcDA19q7T+FO0XW2A/Y/qt1Jn0tibySReAkrme
   LdZGVvRo1fOsum3ausdr7gc+9I15g2hSfn2VmDnlTqTNEVyOJQr/wzrP1
   jlRELA/QFGdQGjfVaA3VY4Y/b6bo7Y0WNee0uV1v9FMElmi6fuBnUo/sW
   g==;
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="asc'?scan'208";a="227024283"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jul 2023 23:47:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 27 Jul 2023 23:47:13 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 27 Jul 2023 23:47:11 -0700
Date: Fri, 28 Jul 2023 07:46:36 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Eric Lin <eric.lin@sifive.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<zong.li@sifive.com>, <greentime.hu@sifive.com>, <vincent.chen@sifive.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: sifive: Add SiFive Private L2
 cache controller
Message-ID: <20230728-penpal-prelude-29a952c03827@wendy>
References: <20230720135125.21240-1-eric.lin@sifive.com>
 <20230720135125.21240-2-eric.lin@sifive.com>
 <cbf0a8fd-3479-1684-fe90-81f2159804ef@linaro.org>
 <CAPqJEFr5h+5+F4TdNuRMaWsrmeedbfGgbgd9wh8sUUQsj2Pw-A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPqJEFr5h+5+F4TdNuRMaWsrmeedbfGgbgd9wh8sUUQsj2Pw-A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_234721_545724_EB57235B 
X-CRM114-Status: GOOD (  18.29  )
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
Content-Type: multipart/mixed; boundary="===============3374181904372060277=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3374181904372060277==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DkvLLUDHEo/ixRke"
Content-Disposition: inline

--DkvLLUDHEo/ixRke
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 02:01:28PM +0800, Eric Lin wrote:
> Hi Krzysztof,
>=20
> On Fri, Jul 21, 2023 at 4:35=E2=80=AFPM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 20/07/2023 15:51, Eric Lin wrote:
> > > This add YAML DT binding documentation for SiFive Private L2
> > > cache controller
> > >
> > > Signed-off-by: Eric Lin <eric.lin@sifive.com>
> > > Reviewed-by: Zong Li <zong.li@sifive.com>
> > > Reviewed-by: Nick Hu <nick.hu@sifive.com>
> >
> >
> > ...
> >
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - const: sifive,pl2cache1
> >
> > I still have doubts that it is not used in any SoC. This is what you
> > said last time: "is not part of any SoC."
> > If not part of any SoC, then where is it? Why are you adding it to the
> > kernel?
> >
>=20
> Sorry for the late reply. I didn't describe it clearly last time.
> Currently, we have two hardware versions of pl2cache: pl2cache0 and pl2ca=
che1.
> The pl2cache0 is used in unmatched board SoC.

Wait a second, does the fu740 on the unmatched not have a ccache as
it's L2 cache?

> The pl2cache1 is
> utilized in our internal FPGA platform for evaluation; it's our core
> IP.

--DkvLLUDHEo/ixRke
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMNkSQAKCRB4tDGHoIJi
0n12AP4h2vY+IY4Xw3D7EqF9UHWzxcPq70z+ADbj7pY81bxvgAD/eTAguxDbLB8q
4QcYSxEmzDs/Mr2qOF0gN0xCG6+3KwQ=
=Vu0G
-----END PGP SIGNATURE-----

--DkvLLUDHEo/ixRke--


--===============3374181904372060277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3374181904372060277==--

