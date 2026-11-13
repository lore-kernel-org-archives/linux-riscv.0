Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3349F60A381C
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 13:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3YvBV7GL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BJ2BZ3MG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aaaLGEqj5BOCiIDo5O1tzaJ7dinGFd4I+PLhzlp4R1M=; b=3YvBV7GLfD5YwMFboY8SAJBilT
	J0TLJL1jC4poJhcdVy4bUloLZuQuMI2ML03e6et5Iq4iLWPWPeiJJW0Gdmzc3QU3z66ktP1Gva5lz
	2d9DJeR8e02nSsF2HDHkcAOYWJh8UIGHke1pDkrHEdLPpg1RKxm/wH2tUw+Nbq9+7lY/spWnvOY8W
	E490dbVYINBNwvC7loleL9J0xVYOF+6KkoHrXVWU8vH65QDUlXjWt/+aNqKZXpWwPLWp3594JO3H8
	9fP7S/ajX7wToLxUUcVdEAOaDqnndqxxPiKA514f7OEHWEdw1t3iopZDOuQ0ywaJ06IpVBdTgkpGH
	OA5uvIUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrij-0000000D2nI-07sU;
	Fri, 13 Nov 2026 13:53:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrii-0000000D2mu-0h4c
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 13:53:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A491412D0;
	Fri, 13 Nov 2026 13:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96DE1F000C4;
	Fri, 13 Nov 2026 13:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794578015;
	bh=F+S1OY2DdV1BNoaCvOeQiRudx9V3jy52LLaoOUct0hw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BJ2BZ3MGUjHrpJK2WU7o4+s+G1Vt2Y3ele2N7f2wYl9cj2J5BiJa4dMJkE7R9m2+i
	 5fP4GK1XegErUtYmoejk1Z2beYCrpbFjIZ3EtUVilM//iFmgMf6c432nHQkfoOjGbl
	 kGW1rlQv8mNOiNqDBoJ7lotLP+4/AheWVE3ARwYeegbVxUP721CMGTMNMHmlaTsObT
	 sZdKSXNfJWPZ6e8FtjOz2zOqbirBpUBmH4BvyygHEcGQxXgK+QMb+QZDADgdDR9N9C
	 hsTa8ePQNvbfRNPfRYSivlL/IFI7ChHHEU68sPRHiBlu9mp7ESvWaMGTxHx2t1ykOI
	 mqEt74VWGywBw==
Date: Fri, 13 Nov 2026 13:53:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Mina Hui-Min Chou <minachou@andestech.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, jic23@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	randolph@andestech.com, cyyang772@andestech.com,
	tim609@andestech.com, az70021@gmail.com
Subject: Re: [PATCH v2 18/19] riscv: errata: andes: limit the IOCP workaround
 to RZ/Five
Message-ID: <20261113-helping-elsewhere-cbcf0c8f67ce@spud>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113071143.1446167-19-minachou@andestech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261113071143.1446167-19-minachou@andestech.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8241760141764326803=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8241760141764326803==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IzdCK0dvvo63ja0a"
Content-Disposition: inline

--IzdCK0dvvo63ja0a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 03:11:42PM +0800, Mina Hui-Min Chou wrote:
> The SBI-based IOCP check was added for Renesas RZ/Five (R9A07G043F),
> the only upstream-supported SoC whose AX45MP has no IOCP. It matches
> the AX45MP marchid and the mimpid of the RZ/Five core, but it is built
> into every kernel with ERRATA_ANDES_CMO, so the SBI call is issued even
> when the kernel does not support RZ/Five.
>=20
> Move the match into soc_is_r9a07g043f() and make it also require
> ARCH_R9A07G043. Kernels without RZ/Five support then skip the SBI call
> and take the generic Andes cache errata path. No other upstream-
> supported SoC uses this AX45MP mimpid, so their behavior does not
> change.

But a device using this soc that doesn't have a dts in mainline won't
function properly, so this is fragile. Why not just do it properly and
check for RZ/Five specifically?
Can check for of_machine_is_compatible() probably?

>=20
> While at it, rename ax45mp_iocp_sw_workaround() to
> r9a07g043f_iocp_sw_workaround(), as the check is only used for RZ/Five.
>=20
> Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
> ---
>  arch/riscv/errata/andes/errata.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/e=
rrata.c
> index 530d2df216e0..f2535a81b1e2 100644
> --- a/arch/riscv/errata/andes/errata.c
> +++ b/arch/riscv/errata/andes/errata.c
> @@ -25,7 +25,7 @@
> =20
>  #define ANDES_SBI_EXT_IOCP_SW_WORKAROUND	1
> =20
> -static long ax45mp_iocp_sw_workaround(void)
> +static long r9a07g043f_iocp_sw_workaround(void)
>  {
>  	struct sbiret ret;
> =20
> @@ -39,6 +39,13 @@ static long ax45mp_iocp_sw_workaround(void)
>  	return ret.error ? 0 : ret.value;
>  }
> =20
> +static bool soc_is_r9a07g043f(unsigned long arch_id, unsigned long impid)
> +{
> +	return IS_ENABLED(CONFIG_ARCH_R9A07G043) &&
> +	       arch_id =3D=3D ANDES_AX45MP_MARCHID &&
> +	       impid =3D=3D ANDES_AX45MP_MIMPID;
> +}
> +
>  static void errata_probe_andes_cache(unsigned int stage, unsigned long a=
rch_id, unsigned long impid)
>  {
>  	static bool done;
> @@ -51,8 +58,8 @@ static void errata_probe_andes_cache(unsigned int stage=
, unsigned long arch_id,
> =20
>  	done =3D true;
> =20
> -	if (arch_id =3D=3D ANDES_AX45MP_MARCHID && impid =3D=3D ANDES_AX45MP_MI=
MPID) {
> -		if (!ax45mp_iocp_sw_workaround())
> +	if (soc_is_r9a07g043f(arch_id, impid)) {
> +		if (!r9a07g043f_iocp_sw_workaround())
>  			return;
>  	} else if (riscv_isa_extension_available(NULL, ZICBOM)) {
>  		return;
> --=20
> 2.34.1
>=20

--IzdCK0dvvo63ja0a
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavcWWQAKCRB4tDGHoIJi
0qzAAQC7B7sPqS4BTa1bnyUteSZr78QNByD/8OtF59kGw57czQD8CYG7GE3WQIFL
BKxtBdTljwnjq94bH8XP/9L5YptDHwU=
=+VjA
-----END PGP SIGNATURE-----

--IzdCK0dvvo63ja0a--


--===============8241760141764326803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8241760141764326803==--

