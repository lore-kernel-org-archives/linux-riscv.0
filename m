Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F6A606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 18:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A7wTsOVX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DGEcPwfk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0THpcFb+1dS+fLMj5T8bqn9qaCpiI9gi9ixJisIop20=; b=A7wTsOVXVI9cvhtT3vDCi27Yel
	i5TCFHPgAgkAm+x1FrtZp6zVkzyP1w6a4x+G2wtZZn8wEkzK2mFc+extdzx4tAGsbKU+3rvn4lw1E
	/kvVHR+q7JKRDugdGAlyToyeihv+uugOvrchBD55qUOfspiE64SGnW7VGXNWz5dEQ30haAF5KuKRj
	7nUwkGwo4En5JCv1fHD8oxBCwubC4VHBweMABo0/SMcz/4qBYIfh+vtR0SLJYdrtNmDeebrGQUnZv
	I4DRxzZStd7UrYCI0J83QPar0QzWdUvQPbDoK83mUfnnZlqYQj2lWUIzK9J6GFpmPGwxSsu4pOS1T
	AwjtVc+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVEg-0000000AB5d-0Ygr;
	Thu, 29 Oct 2026 18:52:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVEf-0000000AB5M-02Lh
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 18:52:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E9712600C8;
	Thu, 29 Oct 2026 18:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D24D1F01816;
	Thu, 29 Oct 2026 18:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793299943;
	bh=XWPYBGnM5MkiXHmVnaCPpYcOP6fueC/bukxMlPBkAzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DGEcPwfkatxrQKJzpfcKlaBXAYxwYS49Sx49GlL2tG4+fEjjG+zm6qvMbCMMYfHvO
	 FmkChSx1ug7A45iUKCoLTkCs2hUmp/rXY3a5HMPnYGsRdPbwVrjDXBr2nH/Rj/m4M4
	 GPmXaLEFAkS8TvMO+WxjjjClYw0trZrfJ7YYF86rd6AHtbpFxJMU6wb6ImaZwp/TmX
	 Nq1BmQNrEcKWR0y26EPbOHfOnALPQylDPhy245z/6HNsio9GsDq4sbzvNgKSOPiIvZ
	 PN9+GPzhF1NTFZBCuwbfwtErfnGWBqgZ2w+UPstL+wEs5I2SGQpM5zxeaoXqYY88/Q
	 YuNj/sWF4ri/Q==
Date: Thu, 29 Oct 2026 18:52:15 +0000
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
Subject: Re: [PATCH RFC 01/12] dt-bindings: vendor-prefixes: Add Bouffalo Lab
Message-ID: <20261029-unpaired-viper-830e55436015@spud>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-1-b736ee920078@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261029-rust-bl808-console-v1-1-b736ee920078@gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5345891353890381402=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5345891353890381402==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rHCtu9GAzIbs5mdw"
Content-Disposition: inline

--rHCtu9GAzIbs5mdw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 01:05:42AM -0400, Kwanghoon Son wrote:
> Register bflb for Bouffalo Lab Technology (Nanjing) Co., Ltd. Reuse the
> prefix already deployed by Zephyr, including its bflb,uart binding.
>=20
> Link: https://docs.zephyrproject.org/latest/build/dts/api/bindings/serial=
/bflb,uart.html
>=20
> Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>

Worth noting that last time this came up, we agreed on "bouffalolab"
because that matched the domain used by the vendor - which is what we
use as the source for compatible strings.

https://lore.kernel.org/all/20230607195027.GA3894404-robh@kernel.org/
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 5471a06f93f1012f08e26f7f105ad846ab3629ac..24c670ff75b6f482ede1bda3b=
59c70ed9116042f 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -249,6 +249,8 @@ patternProperties:
>      description: Shanghai Belling Co., Ltd.
>    "^bestar,.*":
>      description: Shenzhen Bestar Electronic Technology Co., Ltd.
> +  "^bflb,.*":
> +    description: Bouffalo Lab Technology (Nanjing) Co., Ltd.
>    "^bhf,.*":
>      description: Beckhoff Automation GmbH & Co. KG
>    "^bigtreetech,.*":
>=20
> --=20
> 2.47.3
>=20

--rHCtu9GAzIbs5mdw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauOV3wAKCRB4tDGHoIJi
0mtFAQC91Kvt02oSw6bmF5jkMTfZvkF2KHf55Yk+76p/7FQUZAD8Dz2UZOSHhRNH
/FY6RKawJXTzMCT7gGeHa+1gFxncYQU=
=6vqi
-----END PGP SIGNATURE-----

--rHCtu9GAzIbs5mdw--


--===============5345891353890381402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5345891353890381402==--

