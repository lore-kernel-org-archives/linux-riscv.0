Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9BEC3DA7A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 16:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ngPa/JzleYQ5VUFMnYlXqvSrUvbUTTXtowcX2xZLyVE=; b=KaOONlkGXPpu8wZxfK5ZnVrx9G
	2L+z2+KTE0+DihimuTZn/bcGmev3+pknkgoZweVPAu1IQb8UsoCcCWrEmYGxUrtk/tYGkqDic6ya8
	LXQB+NQa6VFhbcJrIEUKi2Mgf2XlyVvxG3jmcABcl9YEaER6paaBUvj5MCcKlk0YNX3TgYHalqX9a
	eRinb4R9IDvpLFo1OWm3H0p6nKpw3Yqxsa/yy87dWp4Adctr0IMerjOCuZZxCIf5al2kv6CQbR87F
	k1paKujOaYsGcA8Tu/bgc9Cf+adpi2ehoVanwSy6Xh6bu4Q0uKBMCKsLLh1L05aGRCyHgb7YwaM+N
	UTEPq2mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1vA-0000000Fyxr-0IBa;
	Wed, 14 Oct 2026 16:33:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1v9-0000000Fyxd-1kZL
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 16:33:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 58EDA6022E;
	Wed, 14 Oct 2026 16:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE07A1F000C4;
	Wed, 14 Oct 2026 16:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791995618;
	bh=hcW6ngQGbiEdWjLMA3uMxUFQ5wn2/yx80RMHMPv3Cnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VBSFI+GSQ9vOqX42H30ft0vMSsO9216xBijfKCOUh0Am5s3XO5xnR3QJ6wDxfEf8y
	 etdgxNnJuvWLKLblPr+M0JCQJKv1EYG18yr1qo+zy/xDRxQt1HROiiKrJCHwRKrEwd
	 leKsk2um9QgK+nLr3gCIqRJ05FRt5gDHRQXIQoYI6TjcRgZd0jxrfjXimNx5Fricx0
	 BnFGT7oQ1W9SA2z5uYIzxpWXZc91ca4KVCdPFYNmEzh07LZ94cv+tuNujRk3/IrOGa
	 23Xd+PsmsKg/X4wRKceJfb+x+4xh2qOBUQjINV89MkXC4B9FkukexkiDaRjtpN0Xjp
	 rM6mLWEQciXwA==
Date: Wed, 14 Oct 2026 17:33:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Cc: "alex@ghiti.fr" <alex@ghiti.fr>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"daniel.lezcano@kernel.org" <daniel.lezcano@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
	"inochiama@outlook.com" <inochiama@outlook.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"radu@rendec.net" <radu@rendec.net>,
	"robh@kernel.org" <robh@kernel.org>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"vladimir.kondratiev@mobileye.com" <vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH 3/9] dt-bindings: riscv: Add MIPS Boston board compatible
Message-ID: <20261014-defection-tiny-3e653ce56e60@spud>
References: <20260915-woof-ducktail-5e2f52bc5762@spud>
 <3d13e372-80da-44bb-845c-14f5022e326a@htecgroup.com>
MIME-Version: 1.0
In-Reply-To: <3d13e372-80da-44bb-845c-14f5022e326a@htecgroup.com>
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
Content-Type: multipart/mixed; boundary="===============4738057547623271265=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4738057547623271265==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZuVNUU8McGEtDGb7"
Content-Disposition: inline

--ZuVNUU8McGEtDGb7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 01:16:16PM +0000, Aleksa Paunovic wrote:
> Hi Conor,
> On 9/15/26 19:58, Conor Dooley wrote:
> > On Mon, Sep 14, 2026 at 03:55:51PM +0200, Aleksa Paunovic via B4 Relay =
wrote:
> >> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> >>
> >> Document the MIPS Boston board compatible with a P8700 bitfile.
> >>
> >> Co-developed-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> >> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> >> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> >> ---
> >>  Documentation/devicetree/bindings/riscv/gf.yaml | 27 ++++++++++++++++=
+++++++++
> >>  1 file changed, 27 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/riscv/gf.yaml b/Documen=
tation/devicetree/bindings/riscv/gf.yaml
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..060910c9b04f482aee6f08=
f8f72232acbad118bb
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/riscv/gf.yaml
> >> @@ -0,0 +1,27 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/riscv/gf.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: GlobalFoundries MIPS SoC-based boards
> >> +
> >> +maintainers:
> >> +  - Djordje Todorovic <djordje.todorovic@htecgroup.com>
> >> +  - Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> >> +
> >> +description:
> >> +  GlobalFoundries MIPS SoC-based boards
> >> +
> >> +properties:
> >> +  $nodename:
> >> +    const: '/'
> >> +  compatible:
> >> +    oneOf:
> >> +      - description: Boston FPGA development board with a MIPS P8700 =
bitfile
> > I'm not convinced that this is specific enough at all.
> > I have absolutely no idea from this description if there's even a
> > specific FPGA involved here - this could mean a bitstream used on an Al=
tera
> > platform or a Xilinx one, with totally different contents.
> I'll document this in v2. FWIW it's the identical board as [1], just with=
 a=A0
> different bitstream.=A0
> > I'm only happy with FPGA bitstream content being supported if it is
> > versioned strictly and matches with some clear and obvious releases from
> > the vendor.
> I'll see if I can find one for v2. A version identifier would also work
> as a SoC-specific fallback, since it's the SoC that's bitstream content i=
n our case.
> I'm not sure anything's public though. If not, I'd keep the board compati=
ble=A0
> without a fallback (if possible).=A0

It's worth mentioning that this is the standard that we've discussed for
platforms on riscv, because of the nature of riscv and the ability of
anyone to create bitstreams for custom "SoCs" running on FPGAs.
It doesn't have to be public what a version actually means, but it must
be there.

Thanks,
Conor.

> >  I cannot even find this board by googling it, let alone find
> > clear information about what this could correspond to.
> >
> >> +        items:
> >> +          - const: gf,mips-p8700-boston
> > "items: - const" is the same as just having "const".
> Will fix in v2.
> >  SoC-specific
> > fallback is also missing, although in this case it'll be tricky to have
> > a meaningful one.
>=20
> Links:
> [1] https://github.com/torvalds/linux/blob/master/arch/mips/boot/dts/img/=
boston.dts
>=20
> Best regards,
> Aleksa

--ZuVNUU8McGEtDGb7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas+u3AAKCRB4tDGHoIJi
0pLpAP9N1JZ12C4zPZ9JHCuy9rcliYJRD7OR/fTGBhZGCPVYzQD/eewiEPg8Uct/
aJiVbVje9Air05SwkTur0ax9CQzOeg0=
=Qud7
-----END PGP SIGNATURE-----

--ZuVNUU8McGEtDGb7--


--===============4738057547623271265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4738057547623271265==--

