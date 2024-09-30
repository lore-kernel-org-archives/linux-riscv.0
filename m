Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966E5CE8349
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 14:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oBr86f4Po6FXalG6taXSTvFUj1PFmW24Ra6TA+YPhBU=; b=mAGrxRXGXIv6UUeEZnw4iWCua5
	RtOqiaVehpXoZxP9CVVsBTAoXKnPiZ8UFTngA/C7z0c4lO5eOjj4B+Ej2W+Jzat/1O+UGRKko/vRP
	1dx33UTUBhmSQvgFG4boiJmaDR1+eompR0J7Q9AuJVXesia9sCiV6q0g7uRW2O2k1TzUOX7Zovyas
	aCp5gxWwmoeBVfnlj3lAJHDLIwUlGo9P2cLDq8liIK2XosTCprOHPnnMbp00J+pxObJ2dtd8FGrxm
	K7liNbHtHqN0EL/myliF9likeZHSBRHYrZYlrMcdjeAtMr90apoAxT3W6+lA9vEFqjUOskKDV8QPA
	9vzZWNZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svHAB-0000000HSu9-1K7r;
	Mon, 30 Sep 2024 14:14:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svGhZ-0000000HMDH-04cp
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 13:44:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7124B5C2705;
	Mon, 30 Sep 2024 13:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D176C4CEC7;
	Mon, 30 Sep 2024 13:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727703876;
	bh=WII6XIL5oH0khuAitO4UjfztUkSH5Op+eXwv29J9F0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DjnP+VHpKy+LxbuIGuetn5TadwJJPcxwPHfHO/T363/vp+vA/BiQZtcd7sKa/I/l4
	 j4LMuFuOXmmuCWkvu84nqTVG7TSTKgN/43Dvv7V1Pc/2aTlWReObPiplH8nX2X/aDZ
	 oPIyorQMad8IapFoA6Vz2YmDgWm6a/TXZWneyQrN0wZM9wIATDPp10uikasUvd802y
	 Q2pihoSViDxkGMgj0sQZIF+pvNGafs3Ab4bVQAhCrGkwfJlfrTsLPJAbxcRz4jMOpm
	 qcYmBt7rOqt/ox9loPqNhklKu8aRnpbg2eI3y5n/G1Run7zcn7DZiuusKkfckAizMa
	 cCjZGrlNBPmSw==
Date: Mon, 30 Sep 2024 14:44:32 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Linux4Microchip@microchip.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [linux][PATCH v2 03/20] dt-bindings: mbox: add PIC64GX mailbox
 compatibility to MPFS mailbox
Message-ID: <20240930-undoing-hardener-90cf6b7ec292@spud>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
 <20240930095449.1813195-4-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240930095449.1813195-4-pierre-henry.moussay@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_064437_120664_064D3CB3 
X-CRM114-Status: GOOD (  15.45  )
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
Content-Type: multipart/mixed; boundary="===============6641311428173088359=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6641311428173088359==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xotCooLs1WDY6rNk"
Content-Disposition: inline


--xotCooLs1WDY6rNk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 10:54:32AM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> PIC64GX mailbox is compatible with MPFS mailbox, just add fallback
>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

NAK, needs the stuff that I mentioned on v1 to be done before it is
applicable.

> ---
>  .../devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mai=
lbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbo=
x.yaml
> index 404477910f02..9e45112e185a 100644
> --- a/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.ya=
ml
> +++ b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.ya=
ml
> @@ -11,7 +11,11 @@ maintainers:
> =20
>  properties:
>    compatible:
> -    const: microchip,mpfs-mailbox
> +    oneOf:
> +      - items:
> +          - const: microchip,pic64gx-mailbox
> +          - const: microchip,mpfs-mailbox
> +      - const: microchip,mpfs-mailbox
> =20
>    reg:
>      oneOf:
> --=20
> 2.30.2
>=20
>=20

--xotCooLs1WDY6rNk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvqrQAAKCRB4tDGHoIJi
0nPRAQDFscKG3KN9tD4+0li5RZxHUVxEdMkrdWLN6zamj//N9gD7BHzDW+nGvnfU
TXaLVumrP6iTqAAcV6CwbDof5BEWdwY=
=c7Z6
-----END PGP SIGNATURE-----

--xotCooLs1WDY6rNk--


--===============6641311428173088359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6641311428173088359==--

