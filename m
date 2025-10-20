Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1F2CCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 17:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qA9qRqK3Ik9zAtMxDvwubnCbhz1+xYaJfNaIhP2ebmE=; b=HHswfmAYt7kcufdCSmzEp97BG+
	vxUQ3VZs0eqBnKiFT4JMdbABVcoC2AejOCRNjWyp1jlR2vLwK5QQLRJd45TInYzKMr8YJW1OE/s70
	4dYWxigp0sC9jfCb4dRyXSJQvn+ifL/yyMCWUcEBXoB5PI3ClDLm7GeWv754Py6sMLmpsBnrJSIqu
	2aIP2LyW0axQ5RjPuIq3+ijOppBCHs3rFQTPBId080TWsQzvQLbLITb70VD2VBRr9TXxKgYVmHNLz
	EaIK+Luz0SrkbfdjQJb0TOzEUvHd7nWtPveTAreJ9/cX0UZi0qUeLQeiLzfo7WtVE78lPaQznYrnH
	ISoQelsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtr5-0000000EW7c-004c;
	Mon, 20 Oct 2025 17:39:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtr1-0000000EW68-3KYL
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 17:39:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 25F4A489BB;
	Mon, 20 Oct 2025 17:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60184C4CEF9;
	Mon, 20 Oct 2025 17:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760981971;
	bh=CrfF6HDbxJVfeklUuZ9rurUFTFP0Q4f+NGC+Mm7jVfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KMFgLSI1CEJqgyck8ld6dGNIEh9MmHVPLcVhTlTJaO8N1dKogXE0y8tJlggrMaE2e
	 Ibvzjir7DwlIJ4ACY6wMlRCPKB0cN+EI92VvA/6SVbe8wty59wquEgi2md4bCtTtYr
	 oQs462VGImx0oeeajqhQCTAYgunYyr/fzah/wu8T3TGqwn9GNLkMtl9BaamWcwWY4M
	 /NkD2fLKOvBswkbgCQhPzk5Rvi1uIRUCW2x/VDlPc2iy+iuGc1sYSokO7rvGyZZ3yR
	 ZiB/sg105ruiKfWi4z6jKbBB8YNIxwAOEPjEStCGkhI8qjz5ZgZTkAaI/dyEZS8wpm
	 Gcz55/aUitH3w==
Date: Mon, 20 Oct 2025 18:39:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: han.xu@nxp.com, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dlan@gentoo.org, guodong@riscstar.com,
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
	imx@lists.linux.dev, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] dt-bindings: spi: fsl-qspi: support SpacemiT K1
Message-ID: <20251020-blinked-primary-2b69cf37e9fe@spud>
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-3-elder@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20251020165152.666221-3-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_103931_849868_FFBBFA13 
X-CRM114-Status: GOOD (  13.24  )
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
Content-Type: multipart/mixed; boundary="===============0361572352292379682=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0361572352292379682==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h9bnZ0Qvvq6hacya"
Content-Disposition: inline


--h9bnZ0Qvvq6hacya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 11:51:45AM -0500, Alex Elder wrote:
> Add the SpacemiT K1 SoC QSPI IP to the list of supported hardware.
>=20
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml =
b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
> index 0315a13fe319a..5bbda4bc33350 100644
> --- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
> @@ -22,6 +22,7 @@ properties:
>            - fsl,imx6ul-qspi
>            - fsl,ls1021a-qspi
>            - fsl,ls2080a-qspi
> +          - spacemit,k1-qspi

Are the newly added resets mandatory for the spacemit platform?

>        - items:
>            - enum:
>                - fsl,ls1043a-qspi
> --=20
> 2.48.1
>=20

--h9bnZ0Qvvq6hacya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPZzzgAKCRB4tDGHoIJi
0kswAP9b+/liNkMQCp6Ke+y5UQUGUAbD7vBZB+rfyvxgqBNLcwD/Tv29tJBXshLX
kh3QQ3TDjVtGX4xd3SvbxGWnXDGO3Qk=
=idEQ
-----END PGP SIGNATURE-----

--h9bnZ0Qvvq6hacya--


--===============0361572352292379682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0361572352292379682==--

