Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77955C83F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 23:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGz81/vRabDkZt6Mcp78h8Tg2RN7prkc1G35eiBurGg=; b=mlgERWHhKyC9N6KOmyomj7SE8F
	liC7RKbDVww1nztef3jIQOasNnHdJM4e19PtssCfh6NO3wcjww/eD/6q4jOw4FiMXec3iCynbDEsW
	tXr+yzqbur/I9aW9r9HnKR8iCkFTHzwD1gyPIssMHBmdiu9ZQjbeK6YX09QYRsvxwe1j8QYKs4M5q
	Phmb4YSd4rGikhwfe09ek9OX6iklrg9T7DAjt/DFE1cJKMA4r6Z2HhAmCPGw/q7JDyTDSdEXcJVe4
	OVzJM1yRQvCylhJEbTmtwLkQ9qVeTEgnBKP5M428yRIDVxVnID1vrGUUMer839aMUVY+/5PuKlo0/
	JgPwIqYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua0l9-0000000DHue-3dBV;
	Thu, 10 Jul 2025 23:32:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyG8-0000000CyiT-3N4w
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 20:52:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 86A04466B5;
	Thu, 10 Jul 2025 20:52:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC609C4CEE3;
	Thu, 10 Jul 2025 20:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752180768;
	bh=Mglw2ksv6p0jmkNc6ppoxSBvG/wPI1OuhGnfRBEN8og=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DORON7vgn8ny5uJ0L+QkdObMERtukYD5htopGHQZ3hHzt2UVpAtAvylvK9HNubGh8
	 lO8TkEc0vxQ1jLydCGrkdTklJgguo2YcLxyPDASsimPQoP+oYSihcdXks+cjwti4Yw
	 S0lxYVKFH79tz84Qnnv4VCm5d4w3xFiWHR3ode/fv+wpS5NTeK+mozGPykVAuYoMzy
	 b4U9vDkhwdXjwQVqeXjAzJW6kepyG6g2eq/Fg8jYjj4ah/4OecNk2qirhKh/EqUeFe
	 jET2nhXRgHjQjtzRt8mOjrl3XBy+FNFrQ4EzmFGAsfrPcD45tk0ukc1sjxB7EhoNxA
	 CcB0ybi7BPCXw==
Date: Thu, 10 Jul 2025 22:52:45 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Benno Lossin <lossin@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v11 1/3] pwm: Export `pwmchip_release` for external use
Message-ID: <tepvopkizn4jezpqcbhwrcsnsrjacztv6kuv53hidcjbrnrs3c@pfcp45jarcoy>
References: <20250710-rust-next-pwm-working-fan-for-sending-v11-0-93824a16f9ec@samsung.com>
 <CGME20250710185439eucas1p2684255d83d807dfd6f8b9b3caea65df6@eucas1p2.samsung.com>
 <20250710-rust-next-pwm-working-fan-for-sending-v11-1-93824a16f9ec@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20250710-rust-next-pwm-working-fan-for-sending-v11-1-93824a16f9ec@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_135248_883003_2165C73B 
X-CRM114-Status: GOOD (  15.67  )
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
Content-Type: multipart/mixed; boundary="===============7392486233796979959=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7392486233796979959==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="52heviwukb62zeme"
Content-Disposition: inline


--52heviwukb62zeme
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v11 1/3] pwm: Export `pwmchip_release` for external use
MIME-Version: 1.0

Hello Michal,

On Thu, Jul 10, 2025 at 08:54:28PM +0200, Michal Wilczynski wrote:
> diff --git a/include/linux/pwm.h b/include/linux/pwm.h
> index 8cafc483db53addf95591d1ac74287532c0fa0ee..8f0698c09e62b893d63fc258d=
a3c34781183056f 100644
> --- a/include/linux/pwm.h
> +++ b/include/linux/pwm.h
> @@ -478,6 +478,7 @@ static inline bool pwm_might_sleep(struct pwm_device =
*pwm)
> =20
>  /* PWM provider APIs */
>  void pwmchip_put(struct pwm_chip *chip);
> +void pwmchip_release(struct device *dev);

I want this in a separate section because "normal" provider don't need
that. Please add a comment that this is only public for technical
reasons for the Rust wrappers.

I understand you are eager to get this merged, but still I'd ask you to
slow down your patch sending frequency. Currently I tend to not apply it
for v6.17-rc1 as I'd like to have that in next for some time.

With you waiting a bit longer before v11 I would have written that in
reply to the explanation in the v10 thread and we might have saved
one iteration ...

>  struct pwm_chip *pwmchip_alloc(struct device *parent, unsigned int npwm,=
 size_t sizeof_priv);
>  struct pwm_chip *devm_pwmchip_alloc(struct device *parent, unsigned int =
npwm, size_t sizeof_priv);
> =20
> @@ -551,6 +552,10 @@ static inline void pwmchip_put(struct pwm_chip *chip)
>  {
>  }
> =20
> +static inline void pwmchip_release(struct device *dev)
> +{
> +}
> +

Is this needed? There is no user of this function that doesn't depend
on CONFIG_PWM?!

>  static inline struct pwm_chip *pwmchip_alloc(struct device *parent,
>  					     unsigned int npwm,
>  					     size_t sizeof_priv)
>=20

Best regards
Uwe

--52heviwukb62zeme
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhwKBoACgkQj4D7WH0S
/k7Blwf+LeGyU+ZX3f7XS0pHm8zBWkJ0woOP+GYaAZLba3sufqsqBh90rQuPvYFG
yfOmrF9i/IpGim42booPz1OZD+PGe17Wx6+iQ57RuLkXxKfIwqAGfQnBW5BunJWL
b7xkg1vRjmnZdQgixsTRSZoE/QjqSzKYzooogPg/bAtUy92n5vzpafgxy9zqsfZ/
6wtM1Kc/nRir2TbVMFBNlu2ZzjNd9gyTk42gxQBgXqzG7PzA+gdaN1A2n58tdzUd
44aN7WhPOEUPT3GJwyLrkwcKulGPyGY8Do3sYujEV98E5HbRdy5K/Ctsrm3ixD+A
X994v6aaOHQQA0XiVBE695HLVVwLCQ==
=vBNR
-----END PGP SIGNATURE-----

--52heviwukb62zeme--


--===============7392486233796979959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7392486233796979959==--

