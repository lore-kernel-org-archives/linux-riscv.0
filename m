Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6407CC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 11:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16OgwE7M6dLJq/B93zFX4Tc/u4waxbQN2ulkD45jKbo=; b=VN0aAf6F1fRJF17OqmTnuT8Q/6
	rpo2AM5YS38xUtJEu+YWYUK+tyjTnLaB4d/f31zB6qak0SBQie1Kk2+CzZVhTqcO7t2f7vMK1oLbo
	bpzV6o6SlKEPlQfuCUBu4DK2j45y0yp7LYirJtx7m0AMBCd6/CoxQAtDBD8ZIUkd6dHLDFDv7hSlI
	zac+nKXMH341ys+ZlqTDdZaTKOBa7YvzecmeOPYEawJeo/ufjm+w3hNbubmcGm9FaGhpf21gylqdT
	bUZrQqJOH+l2luWq1muoJp+b05hCbB0zmajmEXifsXOC76z/RuCc9sOzSVWKUtEYqX2MVdXsW+tQ/
	rwKVoZBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryrii-0000000DKwn-16zt;
	Mon, 22 Apr 2024 11:20:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryrie-0000000DKuC-2gXs;
	Mon, 22 Apr 2024 11:20:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1713784820; x=1745320820;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XRSUgOnTV4XErsz5ecolHV/4A/hQBybGq5GAfiFEyPU=;
  b=RG6zkBpI2gJrLi5Sh2XoRo4u9FL2Y52W69xHdwWonGAondY+oVKghkzR
   E7UYf7cpjwWQYQ1cab+80fVDJvtRv6jGjgQo/RSvtsDB/GrscjlC+nq+2
   Nn53g9iteEGeCsnD19g7WRji/UlxDSS6QpKqawjWhnJMaV1b7qbhaK3YC
   4x8ODvvAMPWs/ks2l/71tf/YFWcULZKaUA0A3/c+FRfM/vxf0ZslnwYah
   4+In20h8LGMLL09rimOl5y/D/+LSuowy1hYug8eX0SMcgkuAtjEAuPz/t
   6J1dgnkjfeTjOim+/Ug3Igc9WCNHexVLU6Oy1RN63ekTtfHc6p3gN02+T
   g==;
X-CSE-ConnectionGUID: EwlQHltERQKVoL1uwoRBeA==
X-CSE-MsgGUID: nEu1AlljSHG4Ko1fQpekdA==
X-IronPort-AV: E=Sophos;i="6.07,220,1708412400"; 
   d="asc'?scan'208";a="22052345"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Apr 2024 04:20:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 04:19:55 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 22 Apr 2024 04:19:52 -0700
Date: Mon, 22 Apr 2024 12:19:36 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
CC: Conor Dooley <conor@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Anup Patel
	<anup@brainfault.org>, Shuah Khan <shuah@kernel.org>, Atish Patra
	<atishp@atishpatra.org>, <linux-doc@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <kvm@vger.kernel.org>,
	<kvm-riscv@lists.infradead.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v2 03/12] dt-bindings: riscv: add Zc* extension rules
 implied by C extension
Message-ID: <20240422-stumbling-aliens-b408eebe1f32@wendy>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
 <20240418124300.1387978-4-cleger@rivosinc.com>
 <20240419-blinked-timid-da722ec6ddc4@spud>
 <f89c79f7-a09e-4fcf-8e16-0875202ade4a@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <f89c79f7-a09e-4fcf-8e16-0875202ade4a@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_042020_774625_FAD80175 
X-CRM114-Status: GOOD (  39.34  )
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
Content-Type: multipart/mixed; boundary="===============8757938869428453707=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8757938869428453707==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="poViDq5TvQtnA831"
Content-Disposition: inline

--poViDq5TvQtnA831
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024 at 10:53:04AM +0200, Cl=E9ment L=E9ger wrote:
> On 19/04/2024 17:49, Conor Dooley wrote:
> > On Thu, Apr 18, 2024 at 02:42:26PM +0200, Cl=E9ment L=E9ger wrote:
> >> As stated by Zc* spec:
> >>
> >> "As C defines the same instructions as Zca, Zcf and Zcd, the rule is t=
hat:
> >>  - C always implies Zca
> >>  - C+F implies Zcf (RV32 only)
> >>  - C+D implies Zcd"
> >>
> >> Add additionnal validation rules to enforce this in dts.
> >=20
> > I'll get it out of the way: NAK, and the dts patch is the perfect
> > example of why. I don't want us to have to continually update
> > devicetrees. If these are implied due to being subsets of other
> > extensions, then software should be able to enable them when that
> > other extension is present.
>=20
> Acked.
>=20
> >=20
> > My fear is that, and a quick look at the "add probing" commit seemed to
> > confirm it, new subsets would require updates to the dts, even though
> > the existing extension is perfectly sufficient to determine presence.
> >=20
> > I definitely want to avoid continual updates to the devicetree for churn
> > reasons whenever subsets are added, but not turning on the likes of Zca
> > when C is present because "the bindings were updated to enforce this"
> > is a complete blocker. I do concede that having two parents makes that
> > more difficult and will likely require some changes to how we probe - do
> > we need to have a "second round" type thing?
>=20
> Yeah, I understand. At first, I actually did the modifications in the
> ISA probing loop with some dependency probing (ie loop while we don't
> have a stable extension state). But I thought that it was not actually
> our problem but rather the ISA string provider. For instance, Qemu
> provides them.


A newer version of QEMU might, but not all do, so I'm not sure that using
it is a good example. My expectations is that a devicetree will be written
to the standards of the day and not be updated as subsets are released.

If this were the first instance of a superset/bundle I'd be prepared to
accept an argument that we should not infer anything - but it's not and
we'd be introducing inconsistency with the crypto stuff. I know that both
scenarios are different in terms of extension history given that this is
splitting things into a subset and that was a superset/bundle created at
the same time, but they're not really that different in terms of the
DT/ACPI to user "interface".

> > Taking Zcf as an example, maybe something like making both of C and F i=
nto
> > "standard" supersets and adding a case to riscv_isa_extension_check()
> > that would mandate that Zca and F are enabled before enabling it, and we
> > would ensure that C implies Zca before it implies Zcf?
>=20
> I'm afraid that riscv_isa_extension_check() will become a rat nest so
> rather than going that way, I would be in favor of adding a validation
> callback for the extensions if needed.

IOW, extension check split out per extension moving to be a callback?

> > Given we'd be relying on ordering, we have to perform the same implicat=
ion
> > for both F and C and make sure that the "implies" struct has Zca before=
 Zcf.
> > I don't really like that suggestion, hopefully there's a nicer way of d=
oing
> > that, but I don't like the dt stuff here.
>=20
> I guess the "cleanest" way would be to have some "defered-like"
> mechanism in ISA probing which would allow to handle ordering as well as
> dependencies/implies for extensions. For Zca, Zcf, we actually do not
> have ordering problems but I think it would be a bit broken not to
> support that as well.

We could, I suppose, enable all detected extensions on a CPU and run the
aforemention callback, disabling them if conditions are not met?

Is that something like what you're suggesting?

--poViDq5TvQtnA831
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiZHyAAKCRB4tDGHoIJi
0rO4AP0QdAfLNIEXKBuCIoQC9LRKn1TSnfbXrn8RTgLezI5EdwD/T7Y7u53/krkw
V1xB2TSmkQhvtE4QZxoxvt3Mk5aKWwA=
=Pef2
-----END PGP SIGNATURE-----

--poViDq5TvQtnA831--


--===============8757938869428453707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8757938869428453707==--

