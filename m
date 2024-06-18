Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B84C2BA18
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 17:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OihOWmdD80lJMYdu6lSUzdLcSp6RWvNL8CMg4qF8z6E=; b=lmdgYAqmZtsbBv7D0R4mbUh5mD
	0W8yHGqYpptoNIh1TOT4lKNRR4SKAUZqfPdEZo+tKCAq06v9M10VXr9g9NY9a0L/KOhy9Spfik/y1
	DE6HJLxJ6nW136jLFUdvYOzxqf7E+DDSkeuhRBYmXsM5wH+kOJlLT2Klecjqf/Gyk7PXRX/+wBLkY
	wFhogq75q8Dfh9K5v0DBn4RuhvLIkjOiES4Fi9Y06+lAc8KUX4H4b8tavfvhM44Ta17ypPUO2hLIG
	+EwiwQkdfRW1Z7FWNzaacyne8nVpNi099dmWA4+ZgFUmjk88z7Ohru8GThp4T4cuNIGDVjZbOijLu
	85V8p8Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJcjY-0000000G3r7-2cUG;
	Tue, 18 Jun 2024 17:35:04 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJcjU-0000000G3pg-44Xq;
	Tue, 18 Jun 2024 17:35:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 278D2CE1BAA;
	Tue, 18 Jun 2024 17:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EAE1C3277B;
	Tue, 18 Jun 2024 17:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718732097;
	bh=Eg9SpS2Lrzw+GME75YTsQ7NIJ1lZ88nPumulLSrni4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UqjUMCIBfZ961IPd1+RltT7pZDVUeV56jBdGUE33xuEuVk3+7qC4NP2Sv/OlEzaiO
	 pF071j7ZS4Yk7zQ4BwaFZ50arxlTh/1Q8fZA9ja95OxfKj8fVrsL6qgk6YOTdMHA6e
	 H0miICxZXLEtla+86g5cODiFbB1Q4YSXBaUGX/mRDDxH+vbKQVTz85Sd85tqk5FCav
	 ukOki3h1U/UFPTvO8Ve5E4BJppdP30bDWyvYfRHwccumfQAOk2U1Qv3hep3nxPacrG
	 JLW3MUNs9tqPzff0kiXv7UQfpGkcdFdEsT4SLPRwiFDQeD3uIKdwUqLxsY+fjmBcfL
	 Nya+Iq4mSOeig==
Date: Tue, 18 Jun 2024 18:34:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, anup@brainfault.org,
	atishp@atishpatra.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	christoph.muellner@vrull.eu, heiko@sntech.de, charlie@rivosinc.com,
	David.Laight@aculab.com, parri.andrea@gmail.com,
	luxu.kernel@bytedance.com
Subject: Re: [PATCH v3 4/6] riscv: hwprobe: export Zawrs ISA extension
Message-ID: <20240618-hurler-aerospace-1e42dc3c7fe9@spud>
References: <20240426100820.14762-8-ajones@ventanamicro.com>
 <20240426100820.14762-12-ajones@ventanamicro.com>
 <d0abe3e0-af0f-4693-b943-57ea3fc2189f@rivosinc.com>
 <20240618-581fb4c20b4fe05d76eafa44@orel>
 <20240618-deftly-operation-de4f8ac260d5@spud>
 <20240618-e898082d22cbc508c5655f84@orel>
MIME-Version: 1.0
In-Reply-To: <20240618-e898082d22cbc508c5655f84@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_103501_583119_946F53BE 
X-CRM114-Status: GOOD (  20.34  )
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
Content-Type: multipart/mixed; boundary="===============2018527483155313212=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2018527483155313212==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XaeHdozvGsU2g9qA"
Content-Disposition: inline


--XaeHdozvGsU2g9qA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 07:05:41PM +0200, Andrew Jones wrote:
> On Tue, Jun 18, 2024 at 05:59:22PM GMT, Conor Dooley wrote:
> > On Tue, Jun 18, 2024 at 06:01:04PM +0200, Andrew Jones wrote:
> > > On Tue, Jun 18, 2024 at 03:48:59PM GMT, Cl=E9ment L=E9ger wrote:
> > > > On 26/04/2024 12:08, Andrew Jones wrote:

> > > >=20
> > > > BTW, the spec also states that "When the TW (Timeout Wait) bit in
> > > > mstatus is set and WRS.NTO is executed in any privilege mode other =
than
> > > > M mode, and it does not complete within an implementation-specific
> > > > bounded time limit, the WRS.NTO instruction will cause an illegal
> > > > instruction exception." so I guess the process will be killed in th=
is case ?
> > >=20
> > > We don't expect mstatus.TW to be set. If it is, then wfi would likely=
 kill
> > > the kernel before wrs.nto gets a chance to, but one or the other will
> > > certainly ensure usermode never gets a chance to try it :-)
> > >=20
> > > We have a handful of these assumptions about how M-mode has configured
> > > things prior to Linux starting. It'd be good if we documented them all
> > > somewhere.
> >=20
> > Boot.rst :) If you're adding a new assumption, I think it should go
> > there.
>=20
> It's an old assumption (wfi has been counting on it since the beginning of
> time). But documenting it, along with anything else similar to it, in
> boot.rst is a good idea. I've added that to my TODO.

Misunderstanding of "new" I think, I meant new to documentation not just
new to the kernel :)

--XaeHdozvGsU2g9qA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnHFOgAKCRB4tDGHoIJi
0hdZAP96LbqLFt2MaBozG2La5ffSTyWhHlM4MRkvTGUYw1JObgEAjxFOUiYt642G
EOEzP7700TwtctflvGwM6iVYrmX+Ggw=
=TKEy
-----END PGP SIGNATURE-----

--XaeHdozvGsU2g9qA--


--===============2018527483155313212==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2018527483155313212==--

