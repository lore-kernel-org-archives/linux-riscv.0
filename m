Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17281C77B7A
	for <linux-riscv@archiver.kernel.org>; Sat, 13 May 2023 18:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2FjpB75DyGMN0XfLw1bmJmGl4rnb60vKSDXsUOj3GY=; b=wbz0lWquVzoQQaL7c2gkYzZnnT
	wT4pY/rtMhW5oZLbRlPuWkAV71SBLvHfWNiOrF5fTYFx6wE13/HqDjN4Rsp9RyoJU8KHQPVUML6ah
	FVkfe65khfPDywQwiW2CVxuHUpBRM6+kZc3XmouxiGtjVIk79bUueSo9V80iY9B7qUAu9xeerGgqo
	YhWcswT6fN8HuD9Gb29GqQ4689pwSadSgROAY7mwSpsLtxB0abTWLwE1JyjbCKgu68WLnYryTxgCv
	fVS0uzsBuFGmuflehi7o8TT3vkOW8YWb52SB9KsZdlNYLSgPIL5Mr3ZvJKvHBTsYNoul0cT5LoNmN
	Kyiji8ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxtXv-00FXID-25;
	Sat, 13 May 2023 18:00:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxtXs-00FXHo-1E
	for linux-riscv@lists.infradead.org;
	Sat, 13 May 2023 18:00:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E63CC60F6E;
	Sat, 13 May 2023 18:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B36F6C433D2;
	Sat, 13 May 2023 18:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684000839;
	bh=cRm0MQi7YAIbwZp7hUzWj9ox4SWbb/lO1iti+PZt1+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tvw6uXW7iASonTRQJCOuCXlSkPLSfq5GK2E+f15KT54whDftiNN+AIqDGqUtyra3f
	 0hHCOYVYKPtq6LicQ1PKqxJIVp+2Tonwwjp4/FbaM9SgbgR3teve1C9Oa9uTKBEiSl
	 jVwA3PZXRHBHxOvHraKA0LpI/qXlJTudl+xz41ieu7m8uIHb9ziHUxyNtRRzCQN0IU
	 UvJHg7KEWPp7dYqGjDzsasraxq0RSYSHo/krf3L9pgzxwYK8s8CfcWfVopwty254CF
	 rlSJQfdO6wOU1EEZy3pX8lKMiFRXqjyND7KnyWJifJOJKfPDcwayuozNtBe0xEri3l
	 ZYruYzAh2cWEA==
Date: Sat, 13 May 2023 19:00:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [RFC 2/6] dt-bindings: riscv: add riscv,isa-extension-* property
 and incompatible example
Message-ID: <20230513-sixth-pushing-7fb12ee62410@spud>
References: <20230508-hypnotic-phobia-99598439d828@spud>
 <20230508-sneeze-cesarean-d1aff8be9cc8@spud>
 <90f24883-4653-d099-14cc-38e2ecbbd189@linaro.org>
MIME-Version: 1.0
In-Reply-To: <90f24883-4653-d099-14cc-38e2ecbbd189@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230513_110040_596184_896B3A08 
X-CRM114-Status: GOOD (  24.28  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============8782639266597758872=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8782639266597758872==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zcUWM9LxFOFmjxdp"
Content-Disposition: inline


--zcUWM9LxFOFmjxdp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 13, 2023 at 07:50:22PM +0200, Krzysztof Kozlowski wrote:
> On 08/05/2023 20:16, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > This dt-binding is illustrative *only*, it doesn't yet do what I want it
> > to do in terms of enforcement etc. I am yet to figure out exactly how to
> > wrangle the binding such that the individual properties have more
> > generous versions than the generic pattern property.
> > This binding *will* generate errors, and needs rework before it can
> > seriously be considered.
> > Nevertheless, it should demonstrate how I intend such a property be
> > used.

> > +    oneOf:
> > +      - const: v1.0.0
> > +        description: the original incarnation
> > +      - const: v1.0.1
> > +        description: backwards compat was broken here
> > +
> > +patternProperties:
> > +  "^riscv,isa-extension-*":
>=20
> Are all these -i/-m/-a extensions obvious/known to RISC-V folks? I have
> no clue what's this, so the question is: do they need some explanation
> in the bindings?

Yes, these should be well known. In the same way that "neon" should mean
something to someone doing arm64. Nevertheless, the plan is to drop the
string side of this entirely & actually document the meaning of -i/-m/-a
etc.

> > +    description:
> > +      Catch-all property for ISA extensions that do not need any speci=
al
> > +      handling, and of which all known versions are compatible with th=
eir
> > +      original revision.
> > +    $ref: "/schemas/types.yaml#/definitions/string"
>=20
> Drop quotes.
>=20
> > +    enum:
> > +      - v1.0.0
>=20
> Your example should not validate here... you have there v2.0.0 and v1.0.1

As noted in the commit message, this is illustrative only & cannot work.
There doesn't appear to be a way to make the patternProperty fallback
more specific than the explicitly defined properties.
I wanted to get something out for initial thoughts before trying to do
further wrangling, lest it be a complete waste of time.
Consensus seems to be that versions are a thing of the past and that
property-presence based probing is a better idea. See the discussion
on the cover for that.
It does conveniently mean that all this complexity can be thrown in the
bin.

Cheers,
Conor.

--zcUWM9LxFOFmjxdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZF/QQgAKCRB4tDGHoIJi
0sYDAP0ZxrGsgo+DHXtLrkTV5KSGFz1w+5RyzsrFhyfkJeOvkwEA/nOZ3HL/4L9R
h97MiW43ULDBeIrMaddFAm1yluImLQk=
=a1mF
-----END PGP SIGNATURE-----

--zcUWM9LxFOFmjxdp--


--===============8782639266597758872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8782639266597758872==--

