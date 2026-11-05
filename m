Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49905606A328
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 18:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jMMWtVxj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cfsDYG/L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XNdK3dgWaJFF9uKj+uOcruJc1s4Fx2EJvFm27Ao2eJc=; b=jMMWtVxjTA336mvxeh3XiyiMzw
	mcYVWQ0+wfGb/j682yQ2CMmXQbeLb3odOrm2SShbX/PIeoZew7GvcEzK3ISYjN8h11T76Kv+A9tQc
	KV/Q45pT8WwB2gTL7jJmGco9NhSVBN5qTlWbw+Y2aXTGK8ml0pBtXigVgPptkX2g4em3KqybaVvPF
	xFsM3p9qTGjywKFQJ/yIoLipcl52Ao70iVfmk+4Nf7xGctnbD34fieVGWiXf3piVzal+P8UAV+nfy
	a5L5506Zc6CsSAhaXFc19a9kyDP3i9pKFTQSYvekAhblcCcIvJIzxHyKjxheL9wzsbAYNCsaYlRzi
	hRldPS4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1ln-0000000A3FM-1Lax;
	Thu, 05 Nov 2026 18:01:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1le-0000000A3Ba-1SaK
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 18:00:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7BD6D60145;
	Thu,  5 Nov 2026 18:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC14F1F0093A;
	Thu,  5 Nov 2026 18:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793901653;
	bh=Inlr+njTt/rVY4K43pqcnuWrarYJ/kbkIpHGLKmNG8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cfsDYG/LQYPBMtQD/vm9LvEqZb3NkdrSd39jY/KDXFQZZ5g0HK/qUctGbvmF32zdf
	 VS/ZTjIj+nYx7DVMb7BqoCWX7UbJErh8NYWnq2j3VjmzaUnC0QYnYSyo8//93tLTNZ
	 ES9qXHscRLLhxm5ntqJCvMCTFTsCa8mU/2uKoLeEwHSZ/SNLYpz83UgcUQpNXPMWkW
	 uukldLAqj7yYz6QZ37gy/LpMx2eyQSqzlz3wqc/lkjKKZOwvV2dPJOeZopKmoB5/9N
	 RCDILNTRGePIiP4RKRITZen28EV1AI9/DSTH512zgE8fhsNDyD2nVFt213aU69CJFk
	 I0XuQ1hmdkDOg==
Date: Thu, 5 Nov 2026 18:00:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yixun Lan <dlan@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] riscv: dts: anlogic: drop unused DR1V90 external
 clocks
Message-ID: <20261105-tribunal-eject-539fe27c8271@spud>
References: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
 <20261003-dr1v90-cru-dt-fix-v2-2-6e7d96612ac0@pigmoral.tech>
 <20261002-crimson-unwrapped-b067e86de38c@spud>
 <ar_wmUWEXgIzq1XM@redhat.com>
 <20261008-c59c47fb901176a0137497d9@squawk>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261008-c59c47fb901176a0137497d9@squawk>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0484968149805480444=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0484968149805480444==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C3g66+F14rjrV4Um"
Content-Disposition: inline

--C3g66+F14rjrV4Um
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 08, 2026 at 03:12:43PM +0100, Conor Dooley wrote:
> On Fri, Oct 02, 2026 at 01:57:45PM -0400, Brian Masney wrote:
> > On Fri, Oct 02, 2026 at 05:33:24PM +0100, Conor Dooley wrote:
> > > On Sat, Oct 03, 2026 at 12:28:40AM +0800, Junhui Liu wrote:
> > > > The external CAN and watchdog clock inputs are not routed on the ML=
KPAI
> > > > FS01, the only board currently supported. Drop the two fixed-clock
> > > > placeholders from the common dtsi, as fixed clocks require a valid
> > > > clock-frequency property.
> > > >=20
> > > > Both clock muxes select their internal parent clocks after reset, so
> > > > the CRU operates correctly without the external inputs. Keep only t=
he
> > > > required oscillator input to the CRU.
> > > >=20
> > > > A board using these external clocks should define them in its own
> > > > board-level dts and override the clocks and clock-names properties =
of
> > > > the CRU node.
> > > >=20
> > > > Reported-by: Yixun Lan <dlan@kernel.org>
> > > > Fixes: 7849521aaac2 ("riscv: dts: anlogic: add clocks and CRU for D=
R1V90")
> > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> > >=20
> > > Per the v1, Brian said he would rebase the clock tree, so I'll just
> > > squash this into the original patch I think.
> >=20
> > It's already rebased, and dropped from the clk-next history.
>=20
>  Cool. Note to self: 7,5 material, cos I don't have the headers to do
>  anything with "riscv: dts: anlogic: add clocks and CRU for DR1V90"

7.4-rc1 is out, so I have circled back and grabbed this.

Cheers,
Conor.

--C3g66+F14rjrV4Um
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauzETwAKCRB4tDGHoIJi
0rESAQDbzZS4mTD6EzbYritTQTwi2yB7lkxeAIXr0Jq91Vt2VQEAwXTEKIQpVz0R
9MTIyjWiUDWMR1Doeucqy97kAp7WngQ=
=X8EE
-----END PGP SIGNATURE-----

--C3g66+F14rjrV4Um--


--===============0484968149805480444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0484968149805480444==--

