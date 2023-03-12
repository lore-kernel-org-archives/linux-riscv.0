Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7903C6FD19
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Mar 2023 13:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/7/ZIt08LadwFWJSTobnbC9RHBj10/x5KY1/80UyPg=; b=THTs/iLH3hJNiDPM8qP/ti4q9X
	XsgkYNNeacF1Hq4FEvfb0hjfTGEdiPWrs0GMK8TcVIdE1+SnkDRTi58U9TJZ3rao55rhL5EKvVID2
	nbP1CdRv7Ib7UCkYGP6xoztOsKkx2JV6dGhCmtnSBC8uJSjfU3lJ00qwroqR8ThRhG8rP1MGFvw7L
	GMQfx0hhjjKWk4j4vWsn3Sq+0gV/OGbfcgyxRSz/ykUzQQoMtO8VZaC45IHdwPM34rbZW8TTxlTO+
	v+Ji0pjV0/ELLCWeY5bbmxVlFNU/yqJCiw2Rjtx5kunzO5QUampS/ogF/agG5F75KemfLKt0bZpSr
	qQKXMDZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLw4-002UET-TN; Sun, 12 Mar 2023 13:40:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLw1-002UC4-Nw
	for linux-riscv@lists.infradead.org; Sun, 12 Mar 2023 13:40:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4B5C860F2D;
	Sun, 12 Mar 2023 13:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F08ABC433EF;
	Sun, 12 Mar 2023 13:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678628423;
	bh=Cc5SkNpX+fJG4RhyUV9lX1ru3SeON0+cWxM07x3k8gc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hCXCY3gQlYG4wYh02Oq5jSSRHPDnRfzATTKm9owjSaO0LGOkx3wHIw17a0xH5za97
	 koz4zAADjjftqSv+BJbQstR4dibA7NjaNqffj/WaIeTIT6Y3Ra39bwCrgoaFzjYY1v
	 lkdv43Z+yG8e0lfh75uL8UeW0WFnYAr8QB7YlUNBvcne76sIFJn9d6D+kdOg9qo5yQ
	 oFu2thUebbZd1r9wfWPR/3ClEuzm8W8PnslQTLC8LrAdY8va5At52SYNnxvU3xIup9
	 /erOa+vf8y1VGQ3Kk0ZvJrMhc7UcKA6VjruSM3r2FA4Yzw/MFY6s8unDNAHjK4LgJZ
	 y8mXWG3kSUP+g==
Date: Sun, 12 Mar 2023 13:40:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Paran Lee <p4ranlee@gmail.com>
Cc: Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Anton Blanchard <anton@ozlabs.org>, Daniel Axtens <dja@axtens.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [RESEND PATCH] perf tools riscv: Add support for riscv
 lookup_binutils_path
Message-ID: <972fcc78-517b-40fa-b46a-ce5dd6f8e980@spud>
References: <20230312130303.87954-1-p4ranlee@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230312130303.87954-1-p4ranlee@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_064025_916272_DC81E272 
X-CRM114-Status: GOOD (  17.99  )
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
Content-Type: multipart/mixed; boundary="===============4461593533967410448=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4461593533967410448==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5/FZjlJfVq2Ptchx"
Content-Disposition: inline


--5/FZjlJfVq2Ptchx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 12, 2023 at 10:03:05PM +0900, Paran Lee wrote:
> Add to know RISC-V binutils path.
>=20
> Signed-off-by: Paran Lee <p4ranlee@gmail.com>
> ---
>  tools/perf/arch/common.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/tools/perf/arch/common.c b/tools/perf/arch/common.c
> index 59dd875fd5e4..6ac7a22244c0 100644
> --- a/tools/perf/arch/common.c
> +++ b/tools/perf/arch/common.c
> @@ -43,6 +43,20 @@ const char *const powerpc_triplets[] =3D {
>  	NULL
>  };
> =20
> +const char *const riscv32_triplets[] =3D {
> +	"riscv32-unknown-linux-gnu-",
> +	"riscv32-linux-android-",
> +	"riscv32-linux-gnu-",
> +	NULL
> +};
> +
> +const char *const riscv64_triplets[] =3D {
> +	"riscv64-unknown-linux-gnu-",
> +	"riscv64-linux-android-",
> +	"riscv64-linux-gnu-",

I don't know anything about perf, so I could be asking a really silly
question here, but how come riscvN-linux- has been omitted here?
The kernel.org toolchains [1] are prefixed that way, although I noticed
in your v1 that you'd seemingly duplicated the arm64 patterns, so I am
curious as to whether the omission is intentional.

Cheers,
Conor.

[1] https://mirrors.edge.kernel.org/pub/tools/crosstool/

> +	NULL
> +};
> +
>  const char *const s390_triplets[] =3D {
>  	"s390-ibm-linux-",
>  	"s390x-linux-gnu-",
> @@ -168,6 +182,10 @@ static int perf_env__lookup_binutils_path(struct per=
f_env *env,
>  		path_list =3D powerpc_triplets;
>  	else if (!strcmp(arch, "sh"))
>  		path_list =3D sh_triplets;
> +	else if (!strcmp(arch, "riscv32"))
> +		path_list =3D riscv32_triplets;
> +	else if (!strcmp(arch, "riscv64"))
> +		path_list =3D riscv64_triplets;
>  	else if (!strcmp(arch, "s390"))
>  		path_list =3D s390_triplets;
>  	else if (!strcmp(arch, "sparc"))
> --=20
> 2.34.1
>=20

--5/FZjlJfVq2Ptchx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZA3WPwAKCRB4tDGHoIJi
0sdJAQCoa+n+1sORACKtBGf6R1h/ZsaFTKclg0mcHVus8Gc65AEA9FeWMCtsjgc+
UDqGOtpYMTAQ6x/ALdE8HA8PFZ1T1Q8=
=Lmym
-----END PGP SIGNATURE-----

--5/FZjlJfVq2Ptchx--


--===============4461593533967410448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4461593533967410448==--

