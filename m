Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDE1606A32E
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 18:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wG25W8M4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XJRgl5Uq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZxEuW2sdFkCtDvr5sa93zC0XPB2V3gwccJzBy+rH6Is=; b=wG25W8M4v3SAFkg8X4nqJwLdfj
	Epxlxw0Rh0H59h7ZRdO2Vvi77OgBolC0OGl/jb/l07SGJl+AGDHWjSFEEGSKIYqM1JR+VdiSDs1Bw
	2ZUlJ2vLyP2IF5J+mALDm1ar7bBlucExRsjjn6rh1lUX143rVu1pxA35hErv8WsM5NFbw340e/S1I
	pL7woLVzsvhHWsQzP7selRH9xIp5I+QhC18WEXArHy0mqLwLS+1WI4LFgm9Z8uuvD3o6NhcrBx7BN
	L2zteXrB3nDHKuxZaUvWoCu0a7waBPANHCsvrUD2ngDocf3Q83kwmPborzHSHQKMPfP40m8mdCl9V
	P4h4Xb7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNwfE-0000000HZr6-1zRP;
	Mon, 02 Nov 2026 18:21:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNwfC-0000000HZqZ-1YBz
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 18:21:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CC31E60254;
	Mon,  2 Nov 2026 18:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F7351F00A1A;
	Mon,  2 Nov 2026 18:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793643705;
	bh=gK9GJJKs/V4qySrVA2fuFkfXf1inzwWdahmhiWz/WSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XJRgl5UqE3HvLu1NZODc4vBFRK4He0SctDo4orhuYZ0M0xMh/WuCPnG5rKdBZsOHQ
	 jpQOjvEB8GlWiHe3t6/Sis9N4D2jlYa3L3f/9L5bvYIwocYHUV7ua0HNMZtQ1yPLLk
	 STwbINqAioLEgckp9upns+IVv4mERXz88vacVUXk6YLP/J1NTLHDU6pVuuYR4sn20l
	 aGlZsuFlxOv6mtvTSBdsBIvJiHBChkOhYIg5RuFqDEgWAjfR201UtVNXW+xvU7RWPb
	 qEYTDPJ70JJ20Rj2F+kQZx1mFgRzVujq3tkbfWNZ4WXEKfJWv4waikM1FtXG9Z1gxX
	 qSoTgizad5VrQ==
Date: Mon, 2 Nov 2026 18:21:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com,
	torvalds@linux-foundation.org, olof@lixom.net,
	aleksa.paunovic@htecgroup.com, arikalo@gmail.com,
	Boqun Feng <boqun@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] riscv: accept the atomic extensions this kernel
 was built with
Message-ID: <20261102-shredder-pauper-67ef6eaae556@spud>
References: <20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com>
 <20261026-lrsc-only-v3-2-ec29c8190fb1@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261026-lrsc-only-v3-2-ec29c8190fb1@mobileye.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6016579474689982152=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6016579474689982152==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lEBywBTz0XLx9/RM"
Content-Disposition: inline

--lEBywBTz0XLx9/RM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 11:20:03AM +0200, Vladimir Kondratiev wrote:
> riscv_early_of_processor_hartid() rejects a hart unless its
> riscv,isa-extensions property contains "a". That rejects a Zalrsc-only
> hart even when the kernel was built to use only LR/SC.
>=20
> Require "a" or "zaamo" when the kernel emits AMO, and "a" or "zalrsc"
> when it emits LR/SC. A normal build defines both toolchain macros and
> still requires the full A extension. The legacy "riscv,isa" fallback
> keeps its rv{32,64}ima check.
>=20
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com
>

IMO, this should not be a separate patch.

> ---
>  arch/riscv/kernel/cpu.c | 28 ++++++++++++++++++++++++----
>  1 file changed, 24 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 3dbc8cc557dd..5d1e39d16e59 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -82,12 +82,32 @@ int __init riscv_early_of_processor_hartid(struct dev=
ice_node *node, unsigned lo
>  		return -ENODEV;
> =20
>  	if (of_property_match_string(node, "riscv,isa-extensions", "i") < 0 ||
> -	    of_property_match_string(node, "riscv,isa-extensions", "m") < 0 ||
> -	    of_property_match_string(node, "riscv,isa-extensions", "a") < 0) {
> -		pr_warn("CPU with hartid=3D%lu does not support ima", *hart);
> +	    of_property_match_string(node, "riscv,isa-extensions", "m") < 0) {
> +		pr_warn("CPU with hartid=3D%lu does not support im", *hart);
>  		return -ENODEV;
>  	}
> -
> +#if !defined(__riscv_atomic) && !defined(__riscv_zaamo) && !defined(__ri=
scv_zalrsc)
> +#error "Need AMO or LR/SC atomics"
> +#endif
> +	/*
> +	 * Require each atomic form this kernel emits. The single-letter
> +	 * "a" extension satisfies either check. A Zalrsc-only build defines
> +	 * __riscv_zalrsc and checks that extension only.
> +	 */
> +#if defined(__riscv_atomic) || defined(__riscv_zaamo)
> +	if (of_property_match_string(node, "riscv,isa-extensions", "a") < 0 &&
> +	    of_property_match_string(node, "riscv,isa-extensions", "zaamo") < 0=
) {
> +		pr_warn("CPU with hartid=3D%lu does not support AMO atomics", *hart);
> +		return -ENODEV;
> +	}
> +#endif
> +#if defined(__riscv_atomic) || defined(__riscv_zalrsc)
> +	if (of_property_match_string(node, "riscv,isa-extensions", "a") < 0 &&
> +	    of_property_match_string(node, "riscv,isa-extensions", "zalrsc") < =
0) {
> +		pr_warn("CPU with hartid=3D%lu does not support LR/SC atomics", *hart);
> +		return -ENODEV;
> +	}
> +#endif
>  	return 0;
> =20
>  old_interface:
>=20
> --=20
> 2.43.0
>=20

--lEBywBTz0XLx9/RM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaujUtAAKCRB4tDGHoIJi
0oR3AQDuE8SstPeiNUwkeTI7ha4bQZGhdcmd7Wg4I5JTJ+qTowEA40aLV19NLCOy
MfKY2cbEpiLTtgUjq04Jv0U6VQb6bg4=
=Urv+
-----END PGP SIGNATURE-----

--lEBywBTz0XLx9/RM--


--===============6016579474689982152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6016579474689982152==--

