Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE33606A31A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 19:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PRIavIMq;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pui3m9Aj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C38d0CW6wHVNFHnMvE0I/7xtzpXtnroP/CZ0yUyX5z0=; b=PRIavIMqqxyagAGXzSxDcwIFRY
	DxhsQfnNMLTfOjAonuqfXNnBK6Z6cUcS/i0ujqB61KaJ8+ovD3FC6nPtoxzLScy89JA1vdADACMvf
	rFYcsJgPwSoGA2djom55o3YFnnyJl5cDvxF4eELGb05Krk2flUVRkAZJFbOPyJLmAEAuRNBePvuQv
	oiBkG5nRU0IDVuxx37C9T14MzRfD6WeNzceZdRflfFJuGyRolekq0IRgzvuzHOfozV5ArNduRKiX6
	xLG/CnR66DWvxkcgAw6+KXX+czmZGOstVYXXdLeOqzcLuLBhJnyyLDRhINdMzzFJWhC+D3ZP7D+ny
	8YqOnAwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVRC-0000000ACzS-269Z;
	Thu, 29 Oct 2026 19:05:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVRA-0000000ACzJ-0316
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 19:05:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C0D13600DA;
	Thu, 29 Oct 2026 19:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 747CA1F01816;
	Thu, 29 Oct 2026 19:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793300718;
	bh=ZIrKddf6pvxQavxN4Amy5fMjCUZq8twVYnoaojmCO50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pui3m9AjSPH1MZlpcaehf1JH5eg/ZnS7g/erGiLGLK4BqVVBUQtlnOkYVhg5IENyl
	 TJqWo6nwpnO27pqSFlm4w+r4s/rg3NBrFhOJReBK9LK+wzY0RvRduLQaMqRgDc6d1S
	 zm0uDg3CaFEOQjDcJrgihZwxjE8a8GML5q/e1susNgAdpcFvbPPmc3YJvbf2sx1iDM
	 n+Hkt1rSjyDElXicwNDqQ0JGnCtVzVEEq7ERoTZZFeo2MAkvudTi8lAznndem5DQ/A
	 4Fh62FFYdq8oh4cXpBPjFaHUH2PTJR27Cz5SDtgnQHgLobCmyPcU+1IoO2GjIzPAPN
	 zifHWKznRsZ3g==
Date: Thu, 29 Oct 2026 19:05:10 +0000
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
Subject: Re: [PATCH RFC 09/12] riscv: dts: bouffalolab: Add BL808 SoC
Message-ID: <20261029-rimless-could-7b96455c785b@spud>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-9-b736ee920078@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261029-rust-bl808-console-v1-9-b736ee920078@gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5684684138122755960=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5684684138122755960==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9JO81ZQA/u1VUulC"
Content-Disposition: inline

--9JO81ZQA/u1VUulC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 01:05:50AM -0400, Kwanghoon Son wrote:
> Add the BL808 D0 CPU, PLIC, CLINT and UART3. Leave UART3 disabled for
> boards to enable. UART3 connects directly to PLIC source 20; firmware
> sets up UART clocks and pins.
>=20
> Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
> ---
>  arch/riscv/boot/dts/bouffalolab/bl808.dtsi | 70 ++++++++++++++++++++++++=
++++++
>  1 file changed, 70 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/bouffalolab/bl808.dtsi b/arch/riscv/boot=
/dts/bouffalolab/bl808.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..c739c77960c4578b87fcf2bc0=
96ef7c8cda089bd
> --- /dev/null
> +++ b/arch/riscv/boot/dts/bouffalolab/bl808.dtsi
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	compatible =3D "bflb,bl808";
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu0: cpu@0 {
> +			compatible =3D "thead,c906", "riscv";
> +			device_type =3D "cpu";
> +			reg =3D <0>;
> +			mmu-type =3D "riscv,sv39";

> +			riscv,isa =3D "rv64imafdc";

Please drop this property, there shouldn't be any part of the stack that
needs it anymore.

Cheers,
Conor.

> +			riscv,isa-base =3D "rv64i";
> +			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c",
> +					       "zicsr", "zifencei", "zicntr", "zihpm";
> +
> +			cpu0_intc: interrupt-controller {
> +				compatible =3D "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells =3D <1>;
> +			};
> +		};
> +	};
> +
> +	xtal: clock-xtal {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +	};
> +
> +	soc {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +		interrupt-parent =3D <&plic>;
> +		dma-noncoherent;
> +
> +		uart3: serial@30002000 {
> +			compatible =3D "bflb,uart";
> +			reg =3D <0x30002000 0x1000>;
> +			interrupts =3D <20 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&xtal>;
> +			clock-names =3D "baud";
> +			status =3D "disabled";
> +		};
> +
> +		plic: interrupt-controller@e0000000 {
> +			compatible =3D "bflb,bl808-plic", "thead,c900-plic";
> +			reg =3D <0xe0000000 0x04000000>;
> +			interrupts-extended =3D <&cpu0_intc 11>, <&cpu0_intc 9>;
> +			interrupt-controller;
> +			#address-cells =3D <0>;
> +			#interrupt-cells =3D <2>;
> +			riscv,ndev =3D <82>;
> +		};
> +
> +		timer@e4000000 {
> +			compatible =3D "bflb,bl808-clint", "thead,c900-clint";
> +			reg =3D <0xe4000000 0xc000>;
> +			interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_intc 7>;
> +		};
> +	};
> +};
>=20
> --=20
> 2.47.3
>=20

--9JO81ZQA/u1VUulC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauOY5gAKCRB4tDGHoIJi
0msBAP4795/OI4/Z/fe0Yr9RRuYypthWWhBXNyzAEDKFE8sLdQEAtwkfNDEfXRMn
ii8vn56yY4seLAp/qcClM7GtoSAN2Ak=
=DS5v
-----END PGP SIGNATURE-----

--9JO81ZQA/u1VUulC--


--===============5684684138122755960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5684684138122755960==--

