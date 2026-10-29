Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70916606A31E
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 19:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4HRod8jz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nI8tmPMp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qA102YxSD7CF37ufeHqkLXLPX/XhYdOi9/utBVLvKRw=; b=4HRod8jzQmAhowYNI/IUVGF1LV
	MlqRxAcP1WrNOCyFJ0D01Q86q5IsD3S1nLg8/gMwaBrYKwe/CMN/H7CZfrA80vLja0KArWXyfVwQ4
	xIq0HshByaHjQN8t2rmyGY53MDaA8g2kjV2W9V7t0XMQeXfXyLAc7rZNzV3STsnCs9TkYZO7v7r2r
	HQkVlh9cQQcdE/O6//OdGDh7PNmKnsGfcjfczDdGUAP+viCo38A4HeuapCoU/Q/lZ+ewFTQ+G+S2x
	17BJUCjhuo9yj+mtlSiMumlRb32V9jJVS2/5xbiV1ZmVkzX1dHgk77niqvzaVZQ4+mchlw0e+g6lY
	MiUgAX9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVUo-0000000ADZV-3mo0;
	Thu, 29 Oct 2026 19:09:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVUn-0000000ADYq-2IgX
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 19:09:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8101C6020F;
	Thu, 29 Oct 2026 19:09:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CEA91F01816;
	Thu, 29 Oct 2026 19:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793300944;
	bh=kS/R8HTbrTEVSzc0sDiS50P+LYYbuH1Vr7HCMcSsi7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nI8tmPMp2izrsUe1uVlEWG+U/sSI9rWUs1pcSVvyzIP5t9ggGpQA/mXTeMWNqgfIG
	 9oAW5R9oSroaGdf19I3FZG1e2e/dG6meHt2pdG9OB5CC63z7dQrmKgLx5SYokQu7Lr
	 m/z4IRMauE76ndjaELomMjlJBEySbNuzm0M8xLkRQUBLcfHCynH7u3Cavspv/ACgbS
	 foH27kI9ZhUDaia2GvWEFaaOXLi+ae1wb8u4IdAiPLgt0tW9taWKfFgvx6QsFEk2GL
	 wQu6wfSuaiBB+uLzD+DK5SxhrTM0KpEOZrQQSutL27XzHcjLqdAf+6izWU/uSqCEZD
	 ZNsi4ZEtedRnQ==
Date: Thu, 29 Oct 2026 19:08:56 +0000
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
Subject: Re: [PATCH RFC 12/12] MAINTAINERS: Add Bouffalo Lab BL808 support
Message-ID: <20261029-spyglass-evasion-772697094cb9@spud>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-12-b736ee920078@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261029-rust-bl808-console-v1-12-b736ee920078@gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============9049760620228207197=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============9049760620228207197==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vJMdIjEZ3fPHpCkZ"
Content-Disposition: inline

--vJMdIjEZ3fPHpCkZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 01:05:53AM -0400, Kwanghoon Son wrote:
> Add a MAINTAINERS entry for the Bouffalo Lab BL808 platform, device trees
> and Rust serial driver and abstractions.
>=20
> Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
> ---
>  MAINTAINERS | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 801f964899ba790a8f71fe61f9b3777a494dabd5..b76d3e168468bf6139c958a81=
b626c73b422c0d4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4926,6 +4926,19 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/iio/imu/bosch,bmi323.yaml
>  F:	drivers/iio/imu/bmi323/
> =20
> +BOUFFALO LAB BL808 SUPPORT
> +M:	Kwanghoon Son <asdfkwang@gmail.com>
> +L:	linux-riscv@lists.infradead.org
> +L:	linux-serial@vger.kernel.org
> +S:	Maintained

Missing git tree, unless you're expecting me to apply patches for the
platform for you?

> +F:	Documentation/devicetree/bindings/riscv/bflb.yaml
> +F:	Documentation/devicetree/bindings/serial/bflb,uart.yaml
> +F:	arch/riscv/boot/dts/bouffalolab/
> +F:	drivers/tty/serial/bflb_uart.rs

> +F:	rust/helpers/serial.c
> +F:	rust/kernel/serial.rs
> +F:	rust/kernel/serial/

These should probably not be maintained under the arch support since
they're not platform specific.

> +
>  BPF JIT for ARC
>  M:	Shahab Vahedi <list+bpf@vahedi.org>
>  L:	bpf@vger.kernel.org
>=20
> --=20
> 2.47.3
>=20

--vJMdIjEZ3fPHpCkZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauOZyAAKCRB4tDGHoIJi
0txfAQCJj90MdzNeIW71uOj8ZchBf4iq/DaenSiyECeFKc/rzgEA/V1dbc9W1Ay3
WdGm94JT3+kvaO1cTEk9MGjJE2KCmAE=
=NWZF
-----END PGP SIGNATURE-----

--vJMdIjEZ3fPHpCkZ--


--===============9049760620228207197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9049760620228207197==--

