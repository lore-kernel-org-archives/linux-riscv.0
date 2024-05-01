Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED20FC10F1A
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 09:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukAIIG1mszkRs1diJEnFM/R6URF+xyiVW4n731LO1rg=; b=szkOCaf5cq84Mb5saADBKIhWCM
	q0UO3OvsSjSCujFqJl/A/glNRhkp8kGoOltnrOB7CV7QRdHfkCLCoeOlfov/6wWpIzKQdH84/US7d
	/mwRgCmDdQ/yOgVaxdbqQ9XE2uibWIE+miwe/HFY1oVKy4ALamnTnBvHXov7MzCqq4SrVqzMf9VOS
	HP9EwpOcg9Llp0FlUKKACotEAywKWKq0yDoTtWm5K4AN88bz2GeNXxNz7QTqj5+ABWVMECxgrzoZi
	Egnw+IvOOjAT0in664LRjEJzUkrjvHiGSbBFCa8TK/1Du1qAV6hdIKqyq/7jVSnUuU01b7GwPjOEB
	mmNTwAnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s26L5-00000008zq7-40tx;
	Wed, 01 May 2024 09:33:23 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s26L1-00000008znb-44pC;
	Wed, 01 May 2024 09:33:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5A91ACE127E;
	Wed,  1 May 2024 09:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4761AC113CC;
	Wed,  1 May 2024 09:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714555996;
	bh=DclVSrlrdkcZr1ObaRHJvxosciV2uhyezrUD7sSt2m4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IoyiRHvDC5flpZ/DSE5pjSTFZXfBhn4045k0KTJ2GdINO/K0dfQxuXvQ5kJZfrD2v
	 zL49ouEdNeCtucCnhGMrmZkG15cOO7qk9mBV54mj239E15LuSBe9cq3rZ7spKvn3GK
	 VSXpB50YRUGC1ZMAJQ+k+sLgnkFRjs1yHiZHn/4XPj5XlJRFp3sIjpi5+3L96p9g5/
	 yS2a87JFuJ74y9SHIjU2dLti59i3PuPdtwAzE9Jl1eF/N9xRuFbq7o7V3tc4UtHhZB
	 ZrHR5OSOp8VgPnkuKNMXPlDLsN9lK3nuGgFO5KQSeEVnEDOwIXdOSZ/EAkM6mxNuq6
	 1Q2e+LF8TG+lQ==
Date: Wed, 1 May 2024 10:33:11 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 08/11] riscv: add ISA extension parsing for Zcmop
Message-ID: <20240501-dazzler-sandworm-defb8d7345e1@spud>
References: <20240429150553.625165-1-cleger@rivosinc.com>
 <20240429150553.625165-9-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240429150553.625165-9-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_023320_238041_E56EEE1A 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============7352267378772822397=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7352267378772822397==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bzCcwQgeWm10dOJ9"
Content-Disposition: inline


--bzCcwQgeWm10dOJ9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2024 at 05:05:01PM +0200, Cl=E9ment L=E9ger wrote:
> Add parsing for Zcmop ISA extension which was ratified in commit
> b854a709c00 ("Zcmop is ratified/1.0") of the riscv-isa-manual.
>=20
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.


--bzCcwQgeWm10dOJ9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjIMVwAKCRB4tDGHoIJi
0qS2AQDd5pQQV1Lo9gk6mG0PPGVg8VQ3JQTP3B6Td3sgZ3TSUwD/VRGQ9RYmks2d
95wqK6MMvSBVf0bbdPHFZ7rwAOMKXAw=
=7zWw
-----END PGP SIGNATURE-----

--bzCcwQgeWm10dOJ9--


--===============7352267378772822397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7352267378772822397==--

