Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4B9CCD185
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 18:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RfWtfhCabUWW/49XIxC3SYQf4GLgtowd3dX+yAYQ9rA=; b=NcmdA1OwPU8Czq7n+NjYhkaXlj
	UmEnSFv5xjeHLzi8EHxd8j3bqIvp5sODkZ1d/sY0SUj64zwCvJJ57EjSkIckVm923bdpWoLlUlU2z
	g8SU/uG0OG+sNh2XzFROnXLHqqLIDLIbXdeUJMj25Tj+YDnRIBz6OEZ+smtj2jYwnDKxrINRHRG5/
	RJJ4wU9ub119BtSPxL4nhBHlMIDUoKAr1T91Sq4RutfJT/UDzq5N/aPpbPOQbUGhn8sHsXNrcjoDo
	CDpa7jOz0vJ+7DaS0MK2icSx+iGlzu2KkTnIM3RTURCLciklxp3D39KNh7iI8w/0nDHboo3HdHCc1
	CwLdtMEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8NFM-0000000E96b-22gm;
	Mon, 13 Oct 2025 18:26:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8NFM-0000000E96C-0Lw6
	for linux-riscv@bombadil.infradead.org;
	Mon, 13 Oct 2025 18:26:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7jsMMwcGTM9dYmLsR7gsClTiC/KIvhzRC8EFYB5lfiE=; b=TGG1GSf2x4ldtqG6ibpAZ1GQJe
	yxZAVYe4AQKv1byiVCA1OEZ/T+mYghrDM7PPSZo/wM7U87KmTuzYp74mHKNrNmjIG+Z4R01YJBX4D
	Wvv5wbx7dSR/09V2K5vhUrqg5QsoV38U/ewnQS+zBlxSA/D4rVkhlNfG/DozU7Mm6Uok1vUwbKgDa
	PuFHEW5RRYT6SpIR4OHyZxsExQw19WFCsbEFkx4cvy1Mm8mbUlibfy9XVA8BnGuyolQIoiJAcIN7N
	eScAMFSc7alFmA/2lo7AMBrSW+PKrGnrxj1D9gqLvyiiu8EdFMPSl+bIIjm5F583dQhhxoxPdxP/W
	NGeEP8/w==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8NFG-00000004Xpd-36u1
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 18:26:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B8B9C40B9D;
	Mon, 13 Oct 2025 18:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA8C8C4CEE7;
	Mon, 13 Oct 2025 18:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760379959;
	bh=fp7n/OOANDDliKGGy2ySxRmFqBsywUsfLoN+oaMFd0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aRURLY3C9C8FjB3TlBWIqqo3yWGvkrvJmuPRgQ+pKDdL05ZQApdR3TtgFSNrjvmIS
	 TphiU/sdUT2P9f2gcv/tHfNFyHyzuUZMTrBdjXna0qFPlwr34iCTO+SvMjvHlWeKj7
	 hXVep5z8Bjm3mnQXg9aqhr2v5zefiOGlhpwke1Jfg2Nyex4U8Fu+LW+MSNDEYTJWT3
	 4oSrN2RKwSqoPZ5nO9Xe/LZzCvYgV0nlXru5eEiYDfAlrBDTxQkVS0+6iG1+fI8pEJ
	 sqnqDsMR0YjHSrn2+u4VE1HvByz9tl8ed925A0TrBeLkljJrB4eTgw0vahqq7EmQGk
	 Y+TZxGzUvnNWg==
Date: Mon, 13 Oct 2025 19:25:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Lucas Zampieri <lzampier@redhat.com>
Cc: devicetree@vger.kernel.org, Charles Mirabile <cmirabil@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <dramforever@live.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: interrupt-controller: add UltraRISC
 DP1000 PLIC
Message-ID: <20251013-commute-bountiful-208ade035c86@spud>
References: <20251013111539.2206477-1-lzampier@redhat.com>
 <20251013111539.2206477-3-lzampier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20251013111539.2206477-3-lzampier@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_192607_130133_01A94C0A 
X-CRM114-Status: GOOD (  14.16  )
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
Content-Type: multipart/mixed; boundary="===============3396892150505082167=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3396892150505082167==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wFtD2X/HwE536WvW"
Content-Disposition: inline


--wFtD2X/HwE536WvW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 12:15:37PM +0100, Lucas Zampieri wrote:
> From: Charles Mirabile <cmirabil@redhat.com>
>=20
> Add a new compatible string for UltraRISC DP1000 PLIC.
>=20
> Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
> Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml        | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifiv=
e,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/=
sifive,plic-1.0.0.yaml
> index 5b827bc24301..a419de50f5a8 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> @@ -74,6 +74,8 @@ properties:
>                - sophgo,sg2044-plic
>                - thead,th1520-plic
>            - const: thead,c900-plic
> +      - items:
> +          - const: ultrarisc,dp1000-plic
> +          - const: ultrarisc,cp100-plic

Based on your cover letter, this is problem not incorrect, but this fails
the eye test and looks wrong. Please mention in your commit message that
dp1000 is an soc and cp100 is a purchasable IP core.

pw-bot: changes-requested

>        - items:
>            - const: sifive,plic-1.0.0
>            - const: riscv,plic0
> --
> 2.51.0
>=20

--wFtD2X/HwE536WvW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO1EMgAKCRB4tDGHoIJi
0tGzAP0dGNd0JliXtDwRb8D0K4PzFMBq3ub1ejdol4QlhY6Z7wEA3xBHPIr6Yi17
qe/9vOFHNa0ggaottW5iXQNZoRx2twc=
=1jAl
-----END PGP SIGNATURE-----

--wFtD2X/HwE536WvW--


--===============3396892150505082167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3396892150505082167==--

