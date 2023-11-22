Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1ADFC61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 17:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/dJjGVQm/LsPsITkEY7qAPH6MZ+VRo1YGZe8PDL+s8=; b=Unlcso0WuDDjtKIzyBr7AyupfF
	eAjJp69miue2x+tRu3juCpK6goHDTGQ2J91Wq+DnW+J1ONpxgr9QWR/wJoq0X4Z5uGnzmquLfy/9t
	+Bihmt4aMdmjO4GAq3biPR3rTgXZPndueiLikWRWMxTYI4DIpN8KInnLa3rEHKhl2B2XRC3ked4O+
	TkmHHUwE2DIblXz/msk9TpkwF589oR3ZP2+nOmo34P9elWKP7Jys4ecucqBYhS3k5p7tSjuIyOCNf
	i+PvzP2xhbC1OAJC/KaxSAll3WeDkNVAanGLH2zqWUsU3neRhY0VB4IG1H0UwpQNK5Fnh7JdP7twZ
	NKAX+ukQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5r9Y-002h7N-0u;
	Wed, 22 Nov 2023 17:36:44 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5r9U-002h60-33
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 17:36:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 3A439B8293C;
	Wed, 22 Nov 2023 17:36:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4854DC433C8;
	Wed, 22 Nov 2023 17:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700674598;
	bh=Vza99+xtq+1wLQeh3rk7M9wfNhph6mzwpTZ+i29+N5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eu8lf+UQ8lxS78Mxw93tY9qK+MnxSy1BtNRiLd8+eS9R31GqQxBBks3Gzx0pFkbcy
	 doqzjlz/x1XXXLbJmai3iZKJbx29szV2aJidObn4mHv49HHst47H0JReAaH6mCB3/r
	 JpLXyIbeatYpCd1+ek6uZhbMXrvRsthb8ZkzRs/M1yte6Hutyh31Y6P7yoRPFYOzcL
	 cM+/FVpaTqjjN3KLj3qqKS9JVO6MYw8fYDkXu3wJ2OBnXh2bg6nkmF8N4inruHZZvP
	 BQQBaC+DUmDBc1t8nQ+inJZWemDM64XSFPhpM/klRR5Sq1o/wvzVEHJsepeXc6UJia
	 aVkW3mkMMwNew==
Date: Wed, 22 Nov 2023 17:36:32 +0000
From: Conor Dooley <conor@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Hal Feng <hal.feng@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v7 1/4] dt-bindings: pwm: Add OpenCores PWM module
Message-ID: <20231122-jokester-reapply-eb000d976d56@spud>
References: <20231110062039.103339-1-william.qiu@starfivetech.com>
 <20231110062039.103339-2-william.qiu@starfivetech.com>
 <afce202d-6234-4c5f-9018-facd9a56b5eb@linaro.org>
 <f4551a7a-61e6-4d97-94c2-da2e4e9e8cb3@starfivetech.com>
 <824cee7b-e4d3-461a-8bfb-4ad095c240fd@linaro.org>
 <20231113-sprung-tantrum-94659009b9d4@squawk>
 <1ba3e8d1-ed89-4aab-ae27-d8d31ee2f150@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <1ba3e8d1-ed89-4aab-ae27-d8d31ee2f150@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_093641_281047_5B79D5DF 
X-CRM114-Status: GOOD (  25.61  )
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
Content-Type: multipart/mixed; boundary="===============2139109042746210355=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2139109042746210355==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9e0gDyQKikb1dEdb"
Content-Disposition: inline


--9e0gDyQKikb1dEdb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 03:03:36PM +0800, William Qiu wrote:
>=20
>=20
> On 2023/11/14 4:17, Conor Dooley wrote:
> > On Mon, Nov 13, 2023 at 09:07:15PM +0100, Krzysztof Kozlowski wrote:
> >> On 13/11/2023 10:42, William Qiu wrote:
> >> > Will update.
> >> >>> +
> >> >>> +allOf:
> >> >>> +  - $ref: pwm.yaml#
> >> >>> +
> >> >>> +properties:
> >> >>> +  compatible:
> >> >>> +    oneOf:
> >> >>> +      - items:
> >> >>> +          - enum:
> >> >>> +              - starfive,jh7100-pwm
> >> >>> +              - starfive,jh7110-pwm
> >> >>> +          - const: opencores,pwm
> >> >>
> >> >> That's a very, very generic compatible. Are you sure, 100% sure, th=
at
> >> >> all designs from OpenCores from now till next 100 years will be 100%
> >> >> compatible?
> >> >>
> >> > My description is not accurate enough, this is OpenCores PTC IP, and=
 PWM
> >> > is one of those modes, so it might be better to replace compatible w=
ith
> >> > "opencores, ptc-pwm"
> >> >=20
> >> > What do you think?
> >>=20
> >> Sorry, maybe this answers maybe doesn't. What is "PTC"?
> >=20
> > "pwm timer counter". AFAIU, the IP can be configured to provide all 3.
> > I think that William pointed out on an earlier revision that they have
> > only implemented the pwm on their hardware.
> > I don't think putting in "ptc" is a sufficient differentiator though, as
> > clearly there could be several different versions of "ptc-pwm" that have
> > the same concern about "all designs from OpenCores for now till the next
> > 100 years" being compatible.

Perhaps noting what "ptc" stands for in the description field would be a
good idea.

> After discussion and review of materials, we plan to use "opencores,ptc-p=
wm-v1"
> as this version of compatible, so that it can also be compatible in the f=
uture.
>=20
> What do you think?

Do we know that it is actually "v1" of the IP? I would suggest using the
version that actually matches the version of the IP that you are using
in your SoC.

Thanks,
Conor.

--9e0gDyQKikb1dEdb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV48IAAKCRB4tDGHoIJi
0nnhAP0dO+HuU6VJxyhYQTYCOgtFy1M7siCtU/9xX8hHaon4MgEA3d9vorRE+CH8
uSLzgEykIwm2UD5v+hkW0uBeHJrQ8wk=
=AWCX
-----END PGP SIGNATURE-----

--9e0gDyQKikb1dEdb--


--===============2139109042746210355==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2139109042746210355==--

