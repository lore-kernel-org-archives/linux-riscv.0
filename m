Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C19C47258
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jan 2024 18:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AOz+MDM5biTCQY90zVhYR0JzW3LHXFNwXlZsPISl0J8=; b=gIcI6EQ0EZmbV5hvQuGBfx+G6e
	/UYeZ9uh3fuaQkvsE+Bf9bprd88aDTTz9zl4N1fN672ifMuZc04Ry/xEJvvXXREkaNXd26+P1MWby
	syWDzaMpo8GB7q5hL8PqDLOIyqqCx2PVI2TGIVQQFbeiVOv5bb1cakF18gelBziVUSAqZ0c33TcZx
	wbI6i63RhYO9HueFnVyOTiBN7nR71SQAf90Q07s8SkczvKfCBX31jXqx/BTY8ClnE5o5QilDkVl95
	zASa8gzfslLNPSSoEMoWJZMyRKWi5f7jVeXPvIv6cVHS8TpLeRASFFdX8B4FcpdocHKjWlbwvRQlu
	En8IO9WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUA5U-0000000AGBY-0Y6U;
	Sun, 28 Jan 2024 18:41:00 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUA5R-0000000AGB4-395T
	for linux-riscv@lists.infradead.org;
	Sun, 28 Jan 2024 18:40:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E5BA1CE0BA5;
	Sun, 28 Jan 2024 18:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE945C433C7;
	Sun, 28 Jan 2024 18:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706467251;
	bh=OXtCQ+vQ1QllQ0fm1DWTp+AwShfUxJ41JAM9Q4D/3mU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZiJ7vVVwcmAM/YaQGCAQKsbQ3hGv1k6H7huHXmuJSjcpKHI3p4X9IHlf3BOJKQWkU
	 mfHVyTZUoWOml3cpuc1sKTEy/9456nMCeXnwkVyCLSMbRVJjeO8FIPUZ32elLRfZl2
	 9ohbg208dzlMfcWLi832BIp/1ryvtXn3AAf/aO2Tpv2Schm3it2tNzwcgHYM7EAiE0
	 NB53IUv5nSUlQS824qGMJUuMn2NFuNnNJpSYTD/TAF5Tmq7SDfOqHx9t4OlGffVqYH
	 dC8DQc8SRRhm7V13n0nBa0cWTWWitzU37dDLFlTT5poI5YG7LSRVfnN87FEBJ7GCm8
	 fEQWAsCmI33fA==
Date: Sun, 28 Jan 2024 18:40:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: riscv: cpus: reg matches hart ID
Message-ID: <20240128-wind-democrat-1de3e3463a34@spud>
References: <20240128180621.85686-1-heinrich.schuchardt@canonical.com>
 <20240128-simile-endocrine-9e8af979d361@spud>
 <3f751ed6-871e-424e-a50e-4362e1bfb527@canonical.com>
MIME-Version: 1.0
In-Reply-To: <3f751ed6-871e-424e-a50e-4362e1bfb527@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_104058_010206_0F64B1D2 
X-CRM114-Status: GOOD (  17.18  )
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
Content-Type: multipart/mixed; boundary="===============2073621427823539197=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2073621427823539197==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RMll9tqlxaIRdVcU"
Content-Disposition: inline


--RMll9tqlxaIRdVcU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 28, 2024 at 07:23:39PM +0100, Heinrich Schuchardt wrote:
> On 1/28/24 19:20, Conor Dooley wrote:
> > On Sun, Jan 28, 2024 at 07:06:21PM +0100, Heinrich Schuchardt wrote:
> > > Add a description to the CPU reg property to clarify that
> > > the reg property must match the hart ID.
> >=20
> > That is the expected usage alright. Did you come across something where
> > it was not being used in that way?
>=20
> No. I was simply missing it in the documentation.
>=20
> There is a page
> https://www.kernel.org/doc/Documentation/devicetree/bindings/riscv/cpus.t=
xt
> but that seems not to be generated from the kernel tree.

I think the hosted docs keep alive links files that were deleted in more
recent kernels. I have no idea about the details of that though...
The text binding was deleted back in 2019 in commit 4fd669a8c487
("dt-bindings: riscv: convert cpu binding to json-schema")


--RMll9tqlxaIRdVcU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbafrwAKCRB4tDGHoIJi
0moSAQDmPjOOz770QqI7z7KSmgpBa++6nZ4ck6nCmwz4Ls5xUAEAstDvKMdK75zM
oorEXj0qITKBvzmMbcQZHPpM9yX8UgU=
=gXZf
-----END PGP SIGNATURE-----

--RMll9tqlxaIRdVcU--


--===============2073621427823539197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2073621427823539197==--

