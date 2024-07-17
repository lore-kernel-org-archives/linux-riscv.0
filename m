Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEDEC3DA4B
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 11:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81hE9DssdRFeFBojOBO5RtdXEFpFNsCAITjt8m+BgHk=; b=zfR6b4yw5C0VRWI4aSWjxDXNOQ
	KacRLHfmHO2rzFowlngVcnse79DH9yfAh2aXKUu+qDprHZANp+pTZDK42cnRbShUiHMiP+pJtIUKd
	dpGpFNzXrwnvOcrXNdhOjzeE+/iiCTBkdAEf4sCJUJEzCeAJLvZHJXp/KZn02ibvgHlKRkH7tEStD
	zWZNGu2RQuloiO4Bg0yPiNlL5GFWnPmSs3bGPKjnHGocdmgG4L246+OlNniSwDooVLDBTL9wbKN/n
	8GUdDfDZexsG5VGlY4+rg3xP3En5g3o0AKinKsWkbDybYTjjezwS/9QMsQ9FGhjfXXzHeCGOy1Viq
	7cXA8j6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU2tZ-0000000Ddlu-1z4J;
	Wed, 17 Jul 2024 11:32:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU2tW-0000000DdlW-3V99
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 11:32:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0ACEB6132F;
	Wed, 17 Jul 2024 11:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7CCC32782;
	Wed, 17 Jul 2024 11:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721215945;
	bh=flHhtXPXSXPa/MuixsU//ACv+ux6XIZuEc3LtB5sTfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fPC9kDzix/T6vvU8OcpTXLcWC1NotvFforrkq+dybb+9xzZLcv5dktrzJIxioMbuh
	 x7tBq00XgDovdFjN8DGMtHDG0zJahSycdTXDdmrqv8UXy89XJlv6BXHuFMH7m6io37
	 BXo0mH4UrvyGdV0is3r8ZdoznUAeZIXY+apbl2ubV5EgqE3Vr7gacrKXLpZ6MjQK4e
	 NFbd+RqVXh5ISZjyqmZz23uPsNZaAYSw7i40S/qXAc8skD5KCQdNBrX6/nsGhd4VJI
	 BB9Q0aSS4nW5bCn3HtgasUMFIkm1YP+qqCwmN/Gc0LWUGQxbmK011tRhinaQbOAV7d
	 BaSo6CNbjPPUw==
Date: Wed, 17 Jul 2024 12:32:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH RFC] riscv: Allow to build only with LLVM >= 17.0.0
Message-ID: <20240717-synapse-decade-a0d41bd7afce@spud>
References: <20240717111716.157149-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240717111716.157149-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_043226_970726_F0A95F87 
X-CRM114-Status: GOOD (  19.99  )
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
Content-Type: multipart/mixed; boundary="===============6369380486002166843=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6369380486002166843==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TF/YrikB1RktwJDs"
Content-Disposition: inline


--TF/YrikB1RktwJDs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 01:17:16PM +0200, Alexandre Ghiti wrote:
> The following build failure happens when using LLVM < 17.0.0:
>=20
> kernel/sched/core.c:11873:7: error: cannot jump from this asm goto statem=
ent to one of its possible targets
>=20
> This is a known issue [1] so let's upgrade the minimal requirement for
> LLVM to the version 17.0.0, which is the first version to contain the
> fix.

I think doing this unilaterally is kinda insane, LLVM 17 isn't even a
year old. Debian testing doesn't have anything later than 16. Why does
it need to be done unilaterally rather than just when the qspinlock
stuff is built?
>=20
> Link: https://github.com/ClangBuiltLinux/linux/issues/1886#issuecomment-1=
645979992 [1]
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202407041157.odTZAYZ6-lkp@i=
ntel.com/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

If Nathan wrote the patch, you need to set him as the author of the
patch :)

> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>=20
> This patch was done by Nathan, I'm just sending it as an RFC to get quick=
er
> feedbacks.
>=20
> I tested it successfully.
>=20
> Note that the build failure happens on the not-yet merged qspinlock
> patchset.
>=20
>  scripts/min-tool-version.sh | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
> index 91c91201212c..e81eb7ed257d 100755
> --- a/scripts/min-tool-version.sh
> +++ b/scripts/min-tool-version.sh
> @@ -28,6 +28,8 @@ llvm)
>  		echo 15.0.0
>  	elif [ "$SRCARCH" =3D loongarch ]; then
>  		echo 18.0.0
> +	elif [ "$SRCARCH" =3D riscv ]; then
> +		echo 17.0.0
>  	else
>  		echo 13.0.1
>  	fi
> --=20
> 2.39.2
>=20
>=20

--TF/YrikB1RktwJDs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZperxQAKCRB4tDGHoIJi
0gdEAP9qtuD78DbyTCIpoH5rcVAZnR0Q3JTpPVcwNFbIh+LTQAEAo+7SP8L4lcz0
B2xFk3t/Af8fu8ktYXwz/L+plR/tmww=
=BgLp
-----END PGP SIGNATURE-----

--TF/YrikB1RktwJDs--


--===============6369380486002166843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6369380486002166843==--

