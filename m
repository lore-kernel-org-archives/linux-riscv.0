Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0807860A260B
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 18:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DbDtt45I;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KD1wJEbK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mcXDW+g5r7m4UWcDQobpYeLp98hSBAFP6hvRqOaS6eU=; b=DbDtt45IPDWeLUKSm0PK4zvUS/
	0Rzb94Vzog2kAbLJ/qbeFwsVf/Il/mZSHonFsZ0zo9+eFIJpByRw9vzRjmvKZ4HT2tx9M2uGGMgcP
	VkEB0SO2KWlmiWXCAv3a3WluX4RS6x0S3rS+ETML2A35tGB0hVntSSe2N+7BDCv5D2HNAx4gn3mXk
	whuGcHgZUr5HBnJNbIwk5nerCk0pBlXt6ct0gumxNYLohwMjWjWQfPP8IPfkLaVHEUX6vmL/wW4YO
	RBF1phQjK0T661SZtIr/T83UsezuxSrmzH9rDyc4YPnVnmW2vfbA/jT5LDpFH60XHgwnssdWRHsir
	eQfaE0Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVKt-0000000AByb-3b5O;
	Thu, 29 Oct 2026 18:58:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVKs-0000000AByK-450k
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 18:58:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0ED1B60267;
	Thu, 29 Oct 2026 18:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCDA51F01300;
	Thu, 29 Oct 2026 18:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793300329;
	bh=KHONBBdjh7iQh0mapfdJy3cnY06ZDJP4tujkx2v2Pl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KD1wJEbKIuWT4XOC8ifnI/94JBSzXbzTjHdfbSPYxot9vTldReA0Qgz8lBQYeUvb7
	 LskigVpp9/BJotoFwQWnCc7p6Qq0AuSfzVWr/4CuGKDg5Z60HOZf864RjkLRy0YC/Y
	 tYdvmLF6KkManvmNbqWJ6c5kyZUf6QOaZNTSftjTiDHcpCXPKPGSpjK5OPVbgktAnM
	 NQL75YZUQPanIt1Le4tXrnNgdy/clqaa06SMG4He+ms6Gy6HInIpaipN/i30VANb84
	 acKccbgk/3BtPJtoyHLvY8KgotLiBR7og+PkZ3nw4y3EZWctu3Y3gooBOrxpkroLXS
	 pCzj+mcF+5OGw==
Date: Thu, 29 Oct 2026 18:58:41 +0000
From: Conor Dooley <conor@kernel.org>
To: Kwanghoon Son <asdfkwang@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 08/12] riscv: Add Bouffalo Lab SoC selection
Message-ID: <20261029-urging-dimly-3747c8bb9b1f@spud>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-8-b736ee920078@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261029-rust-bl808-console-v1-8-b736ee920078@gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0120965677944266664=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0120965677944266664==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TJwnwN6dd3J6z/rc"
Content-Disposition: inline

--TJwnwN6dd3J6z/rc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 01:05:49AM -0400, Kwanghoon Son wrote:
> Add a platform selection for the BL808 64-bit D0 processor, including
> the T-HEAD errata and common clock framework used by its UART.
>=20
> Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
> ---
>  arch/riscv/Kconfig.socs | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index cecbce0c498384d3283ed23cbf2514391eee361d..ea4667da7716a9a8d2ae156c4=
22b277064b42530 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -12,6 +12,14 @@ config ARCH_ANLOGIC
>  	help
>  	  This enables support for Anlogic SoC platform hardware.
> =20
> +config ARCH_BOUFFALOLAB
> +	bool "Bouffalo Lab BL808 SoC"

Ideally, this should be more generic because it would eventually include
other bouffalo devices.

> +	depends on 64BIT && MMU
> +	select ERRATA_THEAD

> +	select COMMON_CLK

This is not needed, there's a select of COMMON_CLK at the arch level.

> +	help
> +	  This enables support for Bouffalo Lab SoC platform hardware.
> +
>  config ARCH_ESWIN
>  	bool "ESWIN SoCs"
>  	help
>=20
> --=20
> 2.47.3
>=20

--TJwnwN6dd3J6z/rc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauOXYQAKCRB4tDGHoIJi
0m4+APwLLXxq0bZ7C1Uz5V8JPQ30iBNkzxhYIBytaujWnKP6mQEAjbdFyjoBSugn
VC4kWUeUZlKq+dktIimVpN1lv8AjaAE=
=5lfT
-----END PGP SIGNATURE-----

--TJwnwN6dd3J6z/rc--


--===============0120965677944266664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0120965677944266664==--

