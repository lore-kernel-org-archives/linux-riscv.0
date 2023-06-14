Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7B9EB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 15:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KcdAwlKkOnBMbB9AyOhWdZ8qXrsiVAFNrKGIDlq9wSc=; b=gqhAdR8WuEIJK1oLFCieda7dms
	0mc1mz4pvb+cFQCWCw8iVNmpk6c9IXDbU7XtLP5VU4UhO1XziIKcjhHTFREUztbi7v8cwsjim8I1X
	n3q+jRyijk2HQD64m0Dn7vy8KkBlAfKFNhZ9NccCBUjBEPJO/SY0pEd1LrjB11KOLWbOp0HkId16n
	83P8nHW5Pcua/m1pir13mHtfyF9sYXLKE8pCep3LW03Om8Qgy9MldaD/Thya6Ll1c42/g/lCk2tNF
	Cx1cwluI6D3gjhCxJAWMeYYP2ieymm0BH2IBCARvDj86l10m1VpHN9uFvPj9fvch0jt0G+TAzhbF1
	21uy4E5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9S1u-00Bzbr-1T;
	Wed, 14 Jun 2023 15:03:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9S1r-00Bzb0-31
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 15:03:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2DE6664340;
	Wed, 14 Jun 2023 15:03:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AEF5C433C8;
	Wed, 14 Jun 2023 15:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686755002;
	bh=LEt2pBYL7CigE1zEaRaDO5CTS69Z8c7codyCYkofPlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cl5xcE7xsFiWw1tORLb3Cr9abHfqVlN5zVheDN2OuHYk/LGpOY+Z295mDlFLKxLMO
	 2pgKIYBAlJ0GcqVx28nUJNfcM9Bk39NIXXUuSN9++U8rlE8ck+pLGI3TNn1ApR/vQo
	 hAkFb/Rmf+fKdBBrsulw9hxCdf2flgP8XTdhbQcsRwuMPcOptxcIo6lvHv9o6xmQkD
	 PDgQ0nrKTOwxt8IlmCKZTNoSbPsjLoDMnyz8UjcyJXK5SRSYToylgaG6x1CrhxZVvj
	 y9PlQfD49xp+Grmt6UxCqo++jI8JgUYkaXmgi1PU3Uk8T9HanISI2cqzZ+vg4TJVfu
	 wGgLaEncEmIlQ==
Date: Wed, 14 Jun 2023 16:03:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: riscv: cpus: drop unneeded quotes
Message-ID: <20230614-credibly-pluck-0495779ada5d@spud>
References: <20230609-discourse-lapped-5217cc4d7ede@wendy>
 <mhng-c1f5c918-1b72-4a2b-91c0-eea05dab14b7@palmer-ri-x1c9>
MIME-Version: 1.0
In-Reply-To: <mhng-c1f5c918-1b72-4a2b-91c0-eea05dab14b7@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_080324_048090_A5CD942B 
X-CRM114-Status: GOOD (  14.54  )
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
Content-Type: multipart/mixed; boundary="===============5752969284033618033=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5752969284033618033==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PV8595nD57bx5mfz"
Content-Disposition: inline


--PV8595nD57bx5mfz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2023 at 07:46:12AM -0700, Palmer Dabbelt wrote:
> On Fri, 09 Jun 2023 07:21:17 PDT (-0700), Conor Dooley wrote:
> > On Fri, Jun 09, 2023 at 04:07:06PM +0200, Krzysztof Kozlowski wrote:
> > > Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> > > checking for this can be enabled in yamllint.
> > >=20
> > > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >=20
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>=20
> Did you want me to pick this up in the RISC-V tree, or is it aimed somewh=
ere
> else?

Usually subsystem, or in this case arch, maintainers should take the
bindings patches. So that'd be you ;)

--PV8595nD57bx5mfz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZInWtgAKCRB4tDGHoIJi
0un5AQCSNBTFePFa+t7bxX4UnEM53NaEfGDqBHaxM75f0smrwQEAofUW6ZXXVhva
Nm+4b9RihEYapjfffhBtj5KQhVz8LQE=
=8DCH
-----END PGP SIGNATURE-----

--PV8595nD57bx5mfz--


--===============5752969284033618033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5752969284033618033==--

