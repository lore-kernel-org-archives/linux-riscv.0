Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD17C4167D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 15:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AIqnv7IOhf3XHP3qWg2lD/qtYdY9Q8bsISWRWMiaOEM=; b=szJmDT4mexKv3l9sgLLFYHEgHM
	vp4MBBY3SST4tb8ZIpbmzUJTDYlECBEDGn7zY/ZtRe9bhXB+4xKev/D5fAdO5EEHLhtPZtqUx4tz/
	QsCLk+pyR74djRLAW2QFN6zU7dj1y0ZG7MQTOPyUV5P0b0iEArVHja5L41XnlaK0L46qEfRLOb3cP
	KnaIBjhhjYY9hlSe2bdMLKBv+YhBsx66QYJwWJJt4EAmjfTA1CQwmCNX4VkBv5D66JBI7GFyCGiyV
	Wz7ZMEC+bPX7YMOR06/Fzs0b0ECu0yR1Bp4sT0Z4Tc7xaJCLca4Kphz8Z8VUWDCHIZHmiAkWhdxwd
	4uPZyJpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2vEl-00GITp-0I;
	Tue, 14 Nov 2023 15:21:59 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2vEh-00GISo-12
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 15:21:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 19E0BCE116A;
	Tue, 14 Nov 2023 15:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 161B4C433C9;
	Tue, 14 Nov 2023 15:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699975311;
	bh=9wXjIVmd2uGE2frovOidRIeYLd6daeG69AXO48B0PYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=puB7EAV32+9rjtUH1Q5vcxMKFwP1jZvLIynXVyfhDpc4Oj6zh0YiGEBIWZRToxIUa
	 7sFT6q69A4TwRo2PWXUBuRnsZTvb8pS0WrfT1X8mjip4Nx747Gxusr80LXFzDmDnvZ
	 vekW9CWIqf6y73Ogt84t9wBN6rbyGorLH2bxemhfnNk0X/CmwMHI5n9YIKrlNBghiH
	 bkjPJLXO3/FTktfNDkAWMhGAeYoe+vKSuSAvf2JL6xzY3FMBpGf77Oe5VKZbsZV4kS
	 4zemsEpdWoTDYP5OzGOwQSEy5eDKTPuSf6cdtoqnUlTw4lJKgld5rr5tKioItQ4YHW
	 m9QXQio8nsB4A==
Date: Tue, 14 Nov 2023 15:21:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: timer: thead,c900-aclint-mtimer:
 separate mtime and mtimecmp regs
Message-ID: <20231114-outweigh-sandbank-6bbdd7ea3286@squawk>
References: <MA0P287MB03326F420E96FE3198C81C21FEB2A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
 <IA1PR20MB4953EBB4DA58A7170D865B0CBBB2A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB4953EBB4DA58A7170D865B0CBBB2A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_072155_715544_CBFA25AA 
X-CRM114-Status: GOOD (  23.92  )
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
Content-Type: multipart/mixed; boundary="===============3306463908684308098=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3306463908684308098==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gYMgAIUgTJwv6z//"
Content-Disposition: inline


--gYMgAIUgTJwv6z//
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2023 at 09:45:33AM +0800, Inochi Amaoto wrote:
> >On 2023/11/14 8:45, Inochi Amaoto wrote:
> >> The timer registers of aclint don't follow the clint layout and can
> >> be mapped on any different offset. As sg2042 uses separated timer
> >> and mswi for its clint, it should follow the aclint spec and have
> >> separated registers.
> >>
> >> The previous patch introduces a new type of T-HEAD aclint timer which
> >> has clint timer layout. Although the timer has the clint layout, it
> >> should follow the aclint spec and uses the separated mtime and mtimecmp
> >> regs. So a ABI change is needed to make the timer fit the aclint spec.
> >>
> >> To make T-HEAD aclint timer more closer to the aclint spec, use two re=
gs
> >> to represent the mtime and mtimecmp.
> >>
> >> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> >> Fixes: 4734449f7311 ("dt-bindings: timer: Add Sophgo sg2042 CLINT time=
r")
> >> Link: https://lists.infradead.org/pipermail/opensbi/2023-October/00569=
3.html
> >> Link: https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc
> >> ---
> >>   .../devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml  | 5 +++=
--
> >>   1 file changed, 3 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint=
-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mt=
imer.yaml
> >> index fbd235650e52..c3080962d902 100644
> >> --- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer=
=2Eyaml
> >> +++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer=
=2Eyaml
> >> @@ -17,7 +17,7 @@ properties:
> >>         - const: thead,c900-aclint-mtimer
> >>
> >>     reg:
> >> -    maxItems: 1
> >> +    maxItems: 2
> >
> >The first one is for mtime and the second one is for mtimecmp, right?
>=20
> Yes, that is right.
>=20
> >Recommend to add some comment in binding file to make it clear.
> >
>=20
> Thanks for your advice.

Sorry for not noticing that on v1 - you should indeed describe these in
the binding, by using the items property.

--gYMgAIUgTJwv6z//
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVOQiAAKCRB4tDGHoIJi
0pX6AP0XJb92ui0Tkp9pTbUbFAmlVrtlYS0vPCDvHy6caTR3RgEAvzFeJR7FxdHm
a8rrW3n/yQZNKQXoucst7fvwoffvwwA=
=o9jC
-----END PGP SIGNATURE-----

--gYMgAIUgTJwv6z//--


--===============3306463908684308098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3306463908684308098==--

