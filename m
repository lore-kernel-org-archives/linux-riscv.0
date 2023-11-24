Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29F1C61DF7
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 12:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=taCruEagEjbb59yJQIn8MqiWMIFns1/b9WZ5fifN9Y0=; b=dXk0EhtWMCjL20Gf7T99L9PmIZ
	t8WDnU4/wwFfBr1frROjB6zDutcfv+5V6zW5CUKbJjyNx2W+/OGB+jnQI6lKiu/fIT1emUD6zUJji
	ff8yh6GKNliEmnV27K/xVWH+p4PuxIzvjB7Nv8JFqxvlh+aJdf85S16zK8ZU9FA9PvziJbj84JeCC
	xwsVufOi9+8g+yH2qyK3iQzCJz8X/2sJVzX9Ir3Q8U3ecZYuXZDLSNt6rd0bHxQ3HMCQBod0DcnJz
	U9qDErxmOqYJuCwGaYBJFT7xLFeb66Zy4K/P68v0Uw84TumLmq9NlWMaQcMcm0xV/q801LlMfmSWF
	40vMndrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6VXs-007E7G-2J;
	Fri, 24 Nov 2023 12:44:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6VXp-007E5l-1A
	for linux-riscv@lists.infradead.org;
	Fri, 24 Nov 2023 12:44:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D9B10B82FF6;
	Fri, 24 Nov 2023 12:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E744BC433C7;
	Fri, 24 Nov 2023 12:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700829867;
	bh=eKoPXmjt1vLT0zHIRWJlxGg5yDvAkaj76XFVfYVmlUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tu77iqqkan/0awoezxvxgdZ58rXcwbBQbr9BDkPshaN/6k2A/ZSrJ2pivmd9lOFY+
	 NREejYYTNhP/hctnKVNlW9xxR9lOl+AAm7HvNldBpZvBaPQMEigjoRdtwfXxrXh301
	 xcE5cM2cmXq5hf51Kdghxsk63Sag2CqgUuB6yNEq28E8L65Oyjl9MWvH7nxnqjZ6ZV
	 bPoST1WHx4nvffOJs/rEx7CMwjv5E2tG76Wfga3NEm1722XSU7nPTOoqxy2VuICMy3
	 CAFsSJdA9pNu8oGTQE5EueslGQ1+Qg0gTqOWNKkRhpsXFw6yEa3xfrggB19O6t3xdL
	 6jFiujCW9LqYA==
Date: Fri, 24 Nov 2023 12:44:21 +0000
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
Message-ID: <20231124-bankbook-scorecard-708d355643c4@spud>
References: <20231110062039.103339-1-william.qiu@starfivetech.com>
 <20231110062039.103339-2-william.qiu@starfivetech.com>
 <afce202d-6234-4c5f-9018-facd9a56b5eb@linaro.org>
 <f4551a7a-61e6-4d97-94c2-da2e4e9e8cb3@starfivetech.com>
 <824cee7b-e4d3-461a-8bfb-4ad095c240fd@linaro.org>
 <20231113-sprung-tantrum-94659009b9d4@squawk>
 <1ba3e8d1-ed89-4aab-ae27-d8d31ee2f150@starfivetech.com>
 <20231122-jokester-reapply-eb000d976d56@spud>
 <701877bd-313f-4604-a398-76a143f009d6@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <701877bd-313f-4604-a398-76a143f009d6@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_044429_670291_F42C10A5 
X-CRM114-Status: GOOD (  33.52  )
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
Content-Type: multipart/mixed; boundary="===============6957896574799094027=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6957896574799094027==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NUcpPRTAaFfrbmlx"
Content-Disposition: inline


--NUcpPRTAaFfrbmlx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 03:38:41PM +0800, William Qiu wrote:
>=20
>=20
> On 2023/11/23 1:36, Conor Dooley wrote:
> > On Wed, Nov 22, 2023 at 03:03:36PM +0800, William Qiu wrote:
> >>=20
> >>=20
> >> On 2023/11/14 4:17, Conor Dooley wrote:
> >> > On Mon, Nov 13, 2023 at 09:07:15PM +0100, Krzysztof Kozlowski wrote:
> >> >> On 13/11/2023 10:42, William Qiu wrote:
> >> >> > Will update.
> >> >> >>> +
> >> >> >>> +allOf:
> >> >> >>> +  - $ref: pwm.yaml#
> >> >> >>> +
> >> >> >>> +properties:
> >> >> >>> +  compatible:
> >> >> >>> +    oneOf:
> >> >> >>> +      - items:
> >> >> >>> +          - enum:
> >> >> >>> +              - starfive,jh7100-pwm
> >> >> >>> +              - starfive,jh7110-pwm
> >> >> >>> +          - const: opencores,pwm
> >> >> >>
> >> >> >> That's a very, very generic compatible. Are you sure, 100% sure,=
 that
> >> >> >> all designs from OpenCores from now till next 100 years will be =
100%
> >> >> >> compatible?
> >> >> >>
> >> >> > My description is not accurate enough, this is OpenCores PTC IP, =
and PWM
> >> >> > is one of those modes, so it might be better to replace compatibl=
e with
> >> >> > "opencores, ptc-pwm"
> >> >> >=20
> >> >> > What do you think?
> >> >>=20
> >> >> Sorry, maybe this answers maybe doesn't. What is "PTC"?
> >> >=20
> >> > "pwm timer counter". AFAIU, the IP can be configured to provide all =
3.
> >> > I think that William pointed out on an earlier revision that they ha=
ve
> >> > only implemented the pwm on their hardware.
> >> > I don't think putting in "ptc" is a sufficient differentiator though=
, as
> >> > clearly there could be several different versions of "ptc-pwm" that =
have
> >> > the same concern about "all designs from OpenCores for now till the =
next
> >> > 100 years" being compatible.
> >=20
> > Perhaps noting what "ptc" stands for in the description field would be a
> > good idea.
> >=20
> I will add.
> >> After discussion and review of materials, we plan to use "opencores,pt=
c-pwm-v1"
> >> as this version of compatible, so that it can also be compatible in th=
e future.
> >>=20
> >> What do you think?
> >=20
> > Do we know that it is actually "v1" of the IP? I would suggest using the
> > version that actually matches the version of the IP that you are using
> > in your SoC.
> >=20
> > Thanks,
> > Conor.
>=20
> There is no version list on their official website, so it is not certain =
whether
> it is v1, but at least the driver is the first version.
>=20
> What do you think is the best way?

I don't have an account, so I cannot open the "ptc_spec.pdf at this link:
https://opencores.org/projects/ptc/downloads
but I would take whatever documentation you have for the spec and see
what it says as the revision on the front cover.

--NUcpPRTAaFfrbmlx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWCapQAKCRB4tDGHoIJi
0t1NAP9EALyfolLJbgjNd+FQ5ayCKSfM6FNoKDfvCNoJQ6STLAEA57A7SXLsPypf
UjTGFuAn6UApcIFw5kzOzYqTjcaCzAM=
=oIwa
-----END PGP SIGNATURE-----

--NUcpPRTAaFfrbmlx--


--===============6957896574799094027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6957896574799094027==--

