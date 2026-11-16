Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4102B606A329
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 14:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UNtUFUIT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GvLDnJ7t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/F6/lpvmwuDSu/cfhex3/0WRPHFx8oF8jaPvL8T7KPo=; b=UNtUFUITswyGmQsXwSJshw5mpZ
	hz7DcxfzxGDy5e9vLv0bD2ZX49NE+6OaLdEypaMn/pkjWTLgbsfO+h2B61Q/Oo/b4X9xxGb2xKUDC
	xYuHpJpDIqQX84QLsBu2R188JMmk+AE38abH4HJqRxaYmcTxJb2l3zuXPX2w6//qXAspOlZa9ibsa
	aL+B+Stim7YjcNpxFtknHDjS3VZOBHBC6YHNu5rA+usoXmf4trbVPhwiwtCZ40uM3a1BTfmR7W4E/
	vTPYSgoJNPPMQvQfKHI0gd9/hvVGQSc06llLHc49gJax5vgAiV/rB8b002dP6x+xYlfkv2vYKbGjT
	Wxq5Dqgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSy9Y-00000002xIb-1ZSI;
	Mon, 16 Nov 2026 14:57:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSy9W-00000002xII-1uMR
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 14:57:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 8129162800;
	Mon, 16 Nov 2026 14:57:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id A8D4C1F000C4;
	Mon, 16 Nov 2026 14:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794841069;
	bh=sWhxqk4MyTmV2zxNqrN/BVQOIcVMMLVIl275tsyfp4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GvLDnJ7tqn7SWEhm8067ZOt2cIfSr5mt0Ly5WIf70koqp1MUQWj2ztrY0Em6BMg51
	 QFJxDphZ91Qg9A3yY8zHEXF/0jmvgtyQ+JaFN0yk4zQxBb4BTXJGDVqs/AG4Gv+Jdv
	 C78u7Izi1V/9N3M6ogeEuYQ4pDFSnn+Svh2LeWlcBm1C2ONomCwakgauB04lGi6UpN
	 iIdcfIataY5uTKGnE78qxVCfE9Tg78kCu8rL9b7YQEW/5kB1tY5diw4zrTMR34g9CY
	 2Vj9ngBIK6Q0qGXe1vM/AvtaLkdPwEvEFuF0bu4g4HEe1lEkHRYVMbrnaEPGsAldFe
	 SWV/OR8P2jKxQ==
Date: Mon, 16 Nov 2026 15:57:46 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, 
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: fustini@kernel.org, guoren@kernel.org, ojeda@kernel.org, 
	wefu@redhat.com, a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, chenhan0017.work@gmail.com, dakr@kernel.org, 
	daniel.almeida@collabora.com, gary@garyguo.net, linux-riscv@lists.infradead.org, 
	lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v3 2/2] pwm: th1520: Fix 32-bit build with COMPILE_TEST
Message-ID: <avsZPKgzc9DIIsh8@monoceros>
References: <20261030020209.3833766-1-tomo@flapping.org>
 <20261030020209.3833766-3-tomo@flapping.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261030020209.3833766-3-tomo@flapping.org>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7145816192083767795=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============7145816192083767795==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tbxmqwzfkfcttcdq"
Content-Disposition: inline


--tbxmqwzfkfcttcdq
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/2] pwm: th1520: Fix 32-bit build with COMPILE_TEST
MIME-Version: 1.0

Hello,

On Fri, Oct 30, 2026 at 11:02:09AM +0900, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>=20
> Fix the following build error on 32-bit ARM with COMPILE_TEST:
>=20
>   ERROR: modpost: drivers/pwm/pwm_th1520.ko: symbol '__aeabi_uldivmod' un=
defined!
>=20
> The driver divides u64 values when it converts between nanoseconds and
> clock cycles. On 32-bit ARM, these divisions are compiled to calls to
> __aeabi_uldivmod, which the kernel does not provide.
>=20
> Use div64_u64() and div64_u64_round_up() for these divisions, in the
> same way as C drivers use div64_u64() and DIV64_U64_ROUND_UP(). The
> results do not change.
>=20
> Fixes: 3c180003dffb ("pwm: th1520: Fix missing Kconfig dependencies")
> Reported-by: Andreas Hindborg <a.hindborg@kernel.org>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/291565-Help/=
topic/64bit.20division.20in.20.60pwm_th1520.2Ers.60/near/626825599
> Suggested-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>
> Assisted-by: LLM
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  drivers/pwm/pwm_th1520.rs | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
> index 728993998446..bd05fe49650e 100644
> --- a/drivers/pwm/pwm_th1520.rs
> +++ b/drivers/pwm/pwm_th1520.rs
> @@ -31,6 +31,10 @@
>          mem::DevresIoMem,
>          Io, //
>      },
> +    math::{
> +        div64_u64,
> +        div64_u64_round_up, //
> +    },
>      of,
>      platform,
>      prelude::*,
> @@ -68,13 +72,13 @@ const fn th1520_pwm_fp(n: u32) -> usize {
>  fn ns_to_cycles(ns: u64, rate_hz: u64) -> u64 {
>      const NSEC_PER_SEC_U64: u64 =3D time::NSEC_PER_SEC as u64;
> =20
> -    ns.saturating_mul(rate_hz) / NSEC_PER_SEC_U64
> +    div64_u64(ns.saturating_mul(rate_hz), NSEC_PER_SEC_U64)
>  }
> =20
>  fn cycles_to_ns(cycles: u32, rate_hz: u64) -> u64 {
>      const NSEC_PER_SEC_U64: u64 =3D time::NSEC_PER_SEC as u64;
> =20
> -    (u64::from(cycles) * NSEC_PER_SEC_U64).div_ceil(rate_hz)
> +    div64_u64_round_up(u64::from(cycles) * NSEC_PER_SEC_U64, rate_hz)
>  }
> =20
>  /// Hardware-specific waveform representation for TH1520.

For me (being at most half-literate in Rust) it looks ok, and I'm fine
to let this patch go in together with the first patch of this series via
the Rust tree.

@Michal: If you have objections speak up quick!

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--tbxmqwzfkfcttcdq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr7Gd8ACgkQj4D7WH0S
/k7jwwgApmKdGIB2twgVr/wJDmt0FgXcvfoRPfuzeIYwDKDRWsY5ot//hqEcmyth
Aae4eMor0twnfU/jai/yFCiXQAACMZT1EmKCB3CLWHrjyUYYOkvHDOxZs8PYFyyG
dn178AwEVuyzov3nDye9+lKK+ADuchzyw91n02z501wQbIOj0RVQf7iHOSRlGRmn
kHKztPxlt4uCIOz7/cRgrB2jC4ifcGwFG2w7TGn9x2D/h+WJV/AhYQMWP537z1kb
55Wwc9p7Si/Q0+GYFMk00/I+4DbLK8QB9pXHLmiEuf+wCr3FyZVnN03bfAs1iu5r
xWayczrwFNyU9lyhNv7ZTx0ob5qjew==
=aLxg
-----END PGP SIGNATURE-----

--tbxmqwzfkfcttcdq--


--===============7145816192083767795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7145816192083767795==--

