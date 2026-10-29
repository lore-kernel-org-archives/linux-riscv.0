Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59881606A32F
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 19:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QDOvbiOK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C4nsDuHy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xRAVnJ5Axb7sAh48JdleVgxy5gSwkgZ5bkyQIrf1Dt8=; b=QDOvbiOK7An5oAhifLwCZfhr51
	9rSrnDW5Sq9FSbAg6o72a/nxfy4Km0OCPunZ8IqgFWdq2aM0WmNrSW1JkFUSIQFvJB1uClJY4ILCu
	5PKJO5MAUS9GalU9RkdLV94Y6IDn1KaT4UCOeabtq7tlDj4W563dmQ7rOWAxtxzr0uW1NTNoBPAdQ
	CZUukoZivXAyH9HBXc+UZ8wQYUtd4QJZQ9xeS/7Q3jyDMsHT0tTQIv43SnywlsSH21JHlljJIQCUn
	1bGMZ/1HMzCsOFAVxyW/nTT18xtHSxK0nDXYKQ0dWb3brTNC/SlrYtmRaCZuzQ7vzs2mT+GZDhpip
	2amUYEiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVSw-0000000AD7v-3GSo;
	Thu, 29 Oct 2026 19:07:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVSv-0000000AD7V-2Ik7
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 19:07:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C4A1440A13;
	Thu, 29 Oct 2026 19:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E831F01816;
	Thu, 29 Oct 2026 19:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793300828;
	bh=Q/k77D2FVuph6npJ0a+RTbXmZgoRa6iV3ban8Ate6SQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C4nsDuHyQXW1fnF05v4Ne8m9yjO9uZCBOH8EBKrlr1y0AX998WQEcdzrtKr1gUXuT
	 znDGwOjXUkl7D4e2nYf09JZcN/aTd6egr2sfvCIbSILDQlaP2UIuf41s/zsres0t+k
	 Dx60kUSfUpKOuU2ueNsrg3YlDXMrivcBVKEIKPhRg+5TkXrnhnTKOE6YtssTLz4BVg
	 KroXqcjbrcX/OPe5PMWekwiFWUxwOHvqsXn1Yqj1Dsv78v6EFh7DFPpJcHItUYCUdt
	 HhJX9kMFOHO8+BRtJwuGKqShYs1P+fsjAhtpVCicwAUMrYNFPvMWHLmEidb64xY67f
	 8zViiAWgtKrkw==
Date: Thu, 29 Oct 2026 19:07:00 +0000
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
Subject: Re: [PATCH RFC 10/12] riscv: dts: bouffalolab: Add Sipeed M1s Dock
Message-ID: <20261029-pork-resonant-fb692b84bef7@spud>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-10-b736ee920078@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261029-rust-bl808-console-v1-10-b736ee920078@gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7431056645367713954=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7431056645367713954==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J9vR3WpxbNmjOFyr"
Content-Disposition: inline

--J9vR3WpxbNmjOFyr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 01:05:51AM -0400, Kwanghoon Son wrote:
> Add the M1s SoM memory and 40 MHz crystal, and enable UART3 on the Dock
> with a direct stdout path and 115200 8N1 settings.
>=20
> Boot firmware initializes PSRAM, UART pads and shared PLLs. The tested
> firmware configures D0 TIME at 320 MHz / 380, represented as 842105 Hz.
> Firmware using another timer configuration must fix up timebase-
> frequency. The declared 64 MiB PSRAM range must retain firmware
> reservations or be narrowed by firmware when memory is assigned to
> another core.
>=20
> The stdout path selects the native polling printk console; userspace TTY
> I/O is deferred.
>=20
> Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
> ---
>  arch/riscv/boot/dts/Makefile                          |  1 +
>  arch/riscv/boot/dts/bouffalolab/Makefile              |  2 ++
>  .../boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts    | 18 +++++++++++++=
+++++
>  arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi | 19 +++++++++++++=
++++++
>  4 files changed, 40 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index 69d8751fb17c803f0efb8003e111ee24144c222b..294f9c119f8f1d608c878ca1f=
95891843301f07e 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -2,6 +2,7 @@
>  subdir-y +=3D allwinner
>  subdir-y +=3D andes
>  subdir-y +=3D anlogic
> +subdir-y +=3D bouffalolab
>  subdir-y +=3D canaan
>  subdir-y +=3D eswin
>  subdir-y +=3D microchip
> diff --git a/arch/riscv/boot/dts/bouffalolab/Makefile b/arch/riscv/boot/d=
ts/bouffalolab/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..4d63365edc095fbe9df31c4b1=
2e29c4b624cbd1f
> --- /dev/null
> +++ b/arch/riscv/boot/dts/bouffalolab/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_BOUFFALOLAB) +=3D bl808-sipeed-m1s-dock.dtb
> diff --git a/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts b/=
arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..c719a53c6e2de45f3718b48ba=
2116e99c70e559b
> --- /dev/null
> +++ b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +
> +#include "bl808-sipeed-m1s.dtsi"
> +
> +/ {
> +	model =3D "Sipeed M1s Dock";
> +	compatible =3D "sipeed,m1s-dock", "sipeed,m1s", "bflb,bl808";
> +
> +	chosen {
> +		stdout-path =3D "/soc/serial@30002000:115200n8";

You should be able to do this normally, with an alias. Why are you not
just using what Jisheng did?

> +	};
> +};
> +
> +&uart3 {
> +	status =3D "okay";
> +};
> diff --git a/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi b/arch=
/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..ae54e6e301ed2c5a1448d52c5=
30c5074515ee38c
> --- /dev/null
> +++ b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +#include "bl808.dtsi"
> +
> +/ {
> +	compatible =3D "sipeed,m1s", "bflb,bl808";
> +	memory@50000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x50000000 0x04000000>;
> +	};
> +
> +	cpus {
> +		timebase-frequency =3D <842105>;
> +	};
> +};
> +
> +&xtal {
> +	clock-frequency =3D <40000000>;
> +};
>=20
> --=20
> 2.47.3
>=20

--J9vR3WpxbNmjOFyr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauOZVAAKCRB4tDGHoIJi
0hefAQCx6AghS4pcdmANbBU2tVNMmclGvVSFzmC/lcvaVeI8XQD+LPMSJc5dKINU
zz5nZFMqfz/eATnkpvTcsHFkGQ/XgQU=
=IKb1
-----END PGP SIGNATURE-----

--J9vR3WpxbNmjOFyr--


--===============7431056645367713954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7431056645367713954==--

