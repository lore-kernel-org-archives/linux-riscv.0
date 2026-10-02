Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E84CA5FDD
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 16:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4mYzVtL7FiaqPflC0tzIuNSnIozNDagDMKRYn2zpaE=; b=Hd45CDKO3u1abb7pvVk4B02e0S
	XYWeQg4TxSkNsWTWa3zZPhwHENQkbFE7jShQARqIZBlYhOP35/DH6AF6Twu5UvEDCc5vXA5q1s+xO
	MPGWD84MmzX08ZjZpa4SRGg2ZoMhJZvm40B65byfO/L2wZh5ocDcdJqQCmSw/ylicxK9LjNUz+n54
	jZT2GWQa8kO3OabhBDtEalsSnftDWpPiCI1YOpZtn4LsZnUSGrVe4gJMwC9/UBoH9rJ0ssjxWR3lf
	4mn1DUn7Ny0TwWTfaOKyn6ycew90Ayn5mvZAKiArczHh6WmfQZKd23+D8zt6ZAjcPv9wD5ygfQzxe
	Ob732iQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgCT-0000000C2jE-128x;
	Fri, 02 Oct 2026 16:33:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgCS-0000000C2iq-1vQe
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 16:33:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A8A8160052;
	Fri,  2 Oct 2026 16:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCBF61F000FF;
	Fri,  2 Oct 2026 16:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790958810;
	bh=DJw/bQXSTRdvAja+ek51LZG2Di+l26iUyTjo6I8rsWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oIJGTR2rkEmjUEjYXbfImIUXSScXQZ+3kK0AyfZaCekj0BU7jQ6MfjeNjK7xSCE6g
	 EG8KIYl0AG+hV7fuQKj+HX0+tDKmA7x4/30Z24snYgNCk0eOwEp1sxsc7/zaaRlXPY
	 jepoTPa6pPcmlFhwTd6pcXciA5Bseh83Jd8UH0hK9YcjpHzQAjcgZjFFSTLF1LLImP
	 ypAEiuogjP4M8jektTkI/t8ZksH3uc95xDt48wNNT1orQxqAcyYzYpX3V+oniPgQCA
	 rQ6CkMWzUYE71j6hIQmeY+EmCB/xzpSWCESdA/+wbJGvnNhSNuocpqdbAVgUE0pD1L
	 HUUXDvDIVsH2g==
Date: Fri, 2 Oct 2026 17:33:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yixun Lan <dlan@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] riscv: dts: anlogic: drop unused DR1V90 external
 clocks
Message-ID: <20261002-crimson-unwrapped-b067e86de38c@spud>
References: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
 <20261003-dr1v90-cru-dt-fix-v2-2-6e7d96612ac0@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20261003-dr1v90-cru-dt-fix-v2-2-6e7d96612ac0@pigmoral.tech>
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
Content-Type: multipart/mixed; boundary="===============3227492596167406138=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3227492596167406138==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eqrbOkMOuuaT2HBv"
Content-Disposition: inline

--eqrbOkMOuuaT2HBv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 03, 2026 at 12:28:40AM +0800, Junhui Liu wrote:
> The external CAN and watchdog clock inputs are not routed on the MLKPAI
> FS01, the only board currently supported. Drop the two fixed-clock
> placeholders from the common dtsi, as fixed clocks require a valid
> clock-frequency property.
>=20
> Both clock muxes select their internal parent clocks after reset, so
> the CRU operates correctly without the external inputs. Keep only the
> required oscillator input to the CRU.
>=20
> A board using these external clocks should define them in its own
> board-level dts and override the clocks and clock-names properties of
> the CRU node.
>=20
> Reported-by: Yixun Lan <dlan@kernel.org>
> Fixes: 7849521aaac2 ("riscv: dts: anlogic: add clocks and CRU for DR1V90")
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

Per the v1, Brian said he would rebase the clock tree, so I'll just
squash this into the original patch I think.

> ---
>  arch/riscv/boot/dts/anlogic/dr1v90.dtsi | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
>=20
> diff --git a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi b/arch/riscv/boot/dt=
s/anlogic/dr1v90.dtsi
> index 574c6608aef0..fe85d01563ad 100644
> --- a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
> +++ b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
> @@ -44,23 +44,11 @@ cpu0_intc: interrupt-controller {
>  	};
> =20
>  	clocks {
> -		can_ext: clock-ext-can {
> -			compatible =3D "fixed-clock";
> -			clock-output-names =3D "can_ext";
> -			#clock-cells =3D <0>;
> -		};
> -
>  		osc: clock-osc {
>  			compatible =3D "fixed-clock";
>  			clock-output-names =3D "osc";
>  			#clock-cells =3D <0>;
>  		};
> -
> -		wdt_ext: clock-ext-wdt {
> -			compatible =3D "fixed-clock";
> -			clock-output-names =3D "wdt_ext";
> -			#clock-cells =3D <0>;
> -		};
>  	};
> =20
>  	soc {
> @@ -128,8 +116,8 @@ uart1: serial@f8401000 {
>  		cru: clock-controller@f8801000 {
>  			compatible =3D "anlogic,dr1v90-cru";
>  			reg =3D <0x0 0xf8801000 0 0x400>;
> -			clocks =3D <&osc>, <&can_ext>, <&wdt_ext>;
> -			clock-names =3D "osc", "can_ext", "wdt_ext";
> +			clocks =3D <&osc>;
> +			clock-names =3D "osc";
>  			#clock-cells =3D <1>;
>  			#reset-cells =3D <1>;
>  		};
>=20
> --=20
> 2.55.0
>=20

--eqrbOkMOuuaT2HBv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar/c1AAKCRB4tDGHoIJi
0t1xAQCzVqDgkscVzsXWZRHTWAoSHRS3DskL95IygBPAybTfHQEAxxJRFD3pJTpZ
XraOBPmmfoHqwPlcPCBeLOsUdpZHSQk=
=jPEu
-----END PGP SIGNATURE-----

--eqrbOkMOuuaT2HBv--


--===============3227492596167406138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3227492596167406138==--

