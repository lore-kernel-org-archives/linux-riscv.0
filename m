Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CACC2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 12:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0COM8OON/k4ohvfOupd5IIoOhfuzECM38roAT6g4s4o=; b=hFeFS0/1/McmMZDWFK0jgjkR3p
	3oeApD4zOA1jYfBQ3yE+Mhwptp7zzSLKH4GFr5U1doygWV1z1T3bBHsegurngONJ6mqpIBOUbMUAR
	d8UOT3nWvgKRmWY71rG3QJWaFE5GvNRu5pkiHe6AAXMNASavDGAeAk+CoXOnkTMagDCq8JaW1b6SM
	MOiIGxNKPJjELWmL6PXdqeV77GZ71qx35sGDIFxEECQSe9NFGoHiG8tCNDfBKGFR5gbn8Cn3bw7Lu
	hXj7brmwqxTGoZZgyDcxydknnzLUETUUs8pQpcoU7UgjbSSyebSZFwudJc04tuWm1kDWqfsRMZlou
	8VBuBADw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGHR-00000003GjF-24xB;
	Mon, 01 Jul 2024 12:37:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOG31-0000000398f-2lJE
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 12:22:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 428AF6126C;
	Mon,  1 Jul 2024 12:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3BD2C116B1;
	Mon,  1 Jul 2024 12:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719836537;
	bh=lB4vzUltPKp8Kgm9znNaj4KrCjdwhhj+1lVTd42bv/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mpuQy5VFFjmKEaPMXsaETetKV78tb4S4on+ABIVOJo9oHW+Uj8aT8Wa+vv/JaKuRh
	 0EUUXhymZuu9UsRpzTNrWXTiJqHaATz4ypD9KabeQXBtjtcsA9xUPQzqDQ/mkmXdEW
	 5eG6MgwqQeXrh9oahZmpaPbiEaiDo9ni8+Gv0fBlPs2rukaJ2pzuCbjPU/BPnMAu4V
	 6c4xPxujWKzJeOYASMDS6iz0BnrAIMM/3m+FnsymVqxMEC3G55Qq/SwN0leImN3WRw
	 6CcHcO0OnEWXmJtaQfByrgbakY/gIY4tCM02kFfkauF3cHULXCyXihK0g/sAOPhpqj
	 Hnwdpa/ZE3qbw==
Date: Mon, 1 Jul 2024 13:22:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Yangyu Chen <cyy@cyyself.name>
Subject: Re: [PATCH v2 06/10] dt-bindings: serial: 8250: Add SpacemiT K1 uart
 compatible
Message-ID: <20240701-recycler-snowbound-49f1a91a6777@spud>
References: <20240627-k1-01-basic-dt-v2-0-cc06c7555f07@gentoo.org>
 <20240627-k1-01-basic-dt-v2-6-cc06c7555f07@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <20240627-k1-01-basic-dt-v2-6-cc06c7555f07@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_052220_023985_72D2954C 
X-CRM114-Status: GOOD (  15.19  )
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
Content-Type: multipart/mixed; boundary="===============3297405261803621317=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3297405261803621317==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wspCxHI5UDPUaivK"
Content-Disposition: inline


--wspCxHI5UDPUaivK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 03:31:20PM +0000, Yixun Lan wrote:
> Found SpacemiT's K1 uart controller is compatible with
> Intel's Xscale uart, but it's still worth to introduce a new compatible.
>=20
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/serial/8250.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documen=
tation/devicetree/bindings/serial/8250.yaml
> index 692aa05500fd5..0bde2379e8647 100644
> --- a/Documentation/devicetree/bindings/serial/8250.yaml
> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> @@ -111,7 +111,9 @@ properties:
>                - mediatek,mt7623-btif
>            - const: mediatek,mtk-btif
>        - items:
> -          - const: mrvl,mmp-uart
> +          - enum:
> +              - mrvl,mmp-uart
> +              - spacemit,k1-uart
>            - const: intel,xscale-uart
>        - items:
>            - enum:
>=20
> --=20
> 2.45.2
>=20

--wspCxHI5UDPUaivK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoKfcwAKCRB4tDGHoIJi
0jw/AP4tdlnJrm8aDYdcj85Bo0J++w0haA2Ofa6Obysppu2ygAEAvIKKHt6m4Diy
fSxNVb9CC9136Is0ni/ZvK4dY/fqeQo=
=cMlK
-----END PGP SIGNATURE-----

--wspCxHI5UDPUaivK--


--===============3297405261803621317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3297405261803621317==--

