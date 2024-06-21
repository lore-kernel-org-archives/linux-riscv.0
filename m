Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9963C2BA1A
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 10:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQTYiy/qgLTHJDH2m7dF3RBv6tPL9/UhbWgOxPPSDxk=; b=RParInQOm/NDJGjQ0ppMa4+PVp
	0grC5Ca4HMyZwIXdlT2zhD7QJa9RgC+KrpCiUgLBDpPaAX8Sn8PZB/GA9stHcEMiV/QwmVP/DsJZ2
	oS33uqZuF+NPe+3ycLLtpPmKbBtricyIZOVKhVMqYtEHOZIVjaQ0mwy/YRlr9l43KEhQDhzH2+rDm
	7szVswlJRx7m9rYn/prRyriSJ6lZlbA3bNggocicoYuMfuGEPGUV9oPFWpufDZm2bk8+kM7jgj6wb
	F/9hIXaKfWkbf1mvLI+WNQhtUGJvgImMGbLpNZYg26upBbCyoNOlGRbqhIflb2BoXb2Lk+M0qW0iO
	aK1hj7QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKbGH-00000008hXc-3J0e;
	Fri, 21 Jun 2024 10:12:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKbGE-00000008hWP-01SU;
	Fri, 21 Jun 2024 10:12:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718964769; x=1750500769;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qIPAKUsfdrunLjZpUxB95w4pFXbAFx7meVdFYH0CVL0=;
  b=i22lz4kT2Pc0+93HW90c6wGq6uu5m7U+Ahao/l30/2/YPdG78+s72KRq
   ocRahZVNp7XkwWGjgCTA1nnibcwAUWPU0Ob4FKlqSFINWfnIDlNpxRPMJ
   xtsaFYifE6PpiqdGxy/PZydsXbsv5wXuN8wm4Gpqv+CNKRKcxegAAwnn0
   D00YgCbEMhPhZSpE/WFuDgr1pyjc4vBo8F77E7Rlk5fvCirazE45v30fj
   NpwYlgEeNa18PHvNINm2LJBSqJCpAwpDOSsAZKTlRrDfP4fDG6xNFnTPN
   6LA1hJos8M8Rs1RAFQSVC21axHtqujNCK6gLweWakkrZkcEZHd+Lzqzr7
   Q==;
X-CSE-ConnectionGUID: +aZhim/bRGe+fZL72SyFNQ==
X-CSE-MsgGUID: nsaDAPolS1GA6r4yoC3nFw==
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="asc'?scan'208";a="28315238"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Jun 2024 03:12:48 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 21 Jun 2024 03:12:17 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 21 Jun 2024 03:12:14 -0700
Date: Fri, 21 Jun 2024 11:11:56 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Anup Patel <apatel@ventanamicro.com>, Conor Dooley <conor@kernel.org>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <kvm-riscv@lists.infradead.org>,
	<kvm@vger.kernel.org>, <alex@ghiti.fr>, <greentime.hu@sifive.com>,
	<vincent.chen@sifive.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v5 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
Message-ID: <20240621-flanking-twiddling-c3b6c9108438@wendy>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-3-yongxuan.wang@sifive.com>
 <20240605-atrium-neuron-c2512b34d3da@spud>
 <CAK9=C2XH7-RdVpojX8GNW-WFTyChW=sTOWs8_kHgsjiFYwzg+g@mail.gmail.com>
 <20240621-10d503a9a2e7d54e67db102c@orel>
MIME-Version: 1.0
In-Reply-To: <20240621-10d503a9a2e7d54e67db102c@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_031250_131640_A8B68F34 
X-CRM114-Status: GOOD (  25.02  )
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
Content-Type: multipart/mixed; boundary="===============4568042003984510123=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4568042003984510123==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uIOl3MGYsZNkzbCU"
Content-Disposition: inline

--uIOl3MGYsZNkzbCU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 10:33:03AM +0200, Andrew Jones wrote:
> On Thu, Jun 20, 2024 at 11:55:44AM GMT, Anup Patel wrote:
> > On Wed, Jun 5, 2024 at 10:25=E2=80=AFPM Conor Dooley <conor@kernel.org>=
 wrote:
> > >
> > > On Wed, Jun 05, 2024 at 08:15:08PM +0800, Yong-Xuan Wang wrote:
> > > > Add entries for the Svade and Svadu extensions to the riscv,isa-ext=
ensions
> > > > property.
> > > >
> > > > Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> > > > ---
> > > >  .../devicetree/bindings/riscv/extensions.yaml | 30 +++++++++++++++=
++++
> > > >  1 file changed, 30 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yam=
l b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > index 468c646247aa..1e30988826b9 100644
> > > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > @@ -153,6 +153,36 @@ properties:
> > > >              ratified at commit 3f9ed34 ("Add ability to manually t=
rigger
> > > >              workflow. (#2)") of riscv-time-compare.
> > > >
> > > > +        - const: svade
> > > > +          description: |
> > > > +            The standard Svade supervisor-level extension for rais=
ing page-fault
> > > > +            exceptions when PTE A/D bits need be set as ratified i=
n the 20240213
> > > > +            version of the privileged ISA specification.
> > > > +
> > > > +            Both Svade and Svadu extensions control the hardware b=
ehavior when
> > > > +            the PTE A/D bits need to be set. The default behavior =
for the four
> > > > +            possible combinations of these extensions in the devic=
e tree are:
> > > > +            1. Neither svade nor svadu in DT: default to svade.
> > >
> > > I think this needs to be expanded on, as to why nothing means svade.
> >=20
> > Actually if both Svade and Svadu are not present in DT then
> > it is left to the platform and OpenSBI does nothing.
>=20
> This is a good point, and maybe it's worth integrating something that
> states this case is technically unknown into the final text. (Even though
> historically this has been assumed to mean svade.)

If that is assumed to mean svade at the moment, then that's what it has
to mean going forwards also.

--uIOl3MGYsZNkzbCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnVR7AAKCRB4tDGHoIJi
0oVHAP4siHUZEfCCwMM83p0CPjCOAJEGoNcOdr0nkhPzLVIczAD/Q7yiuanMfYXr
nzrBjtDPUd3Y5QR0QzLeGN78fexxmAw=
=728p
-----END PGP SIGNATURE-----

--uIOl3MGYsZNkzbCU--


--===============4568042003984510123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4568042003984510123==--

