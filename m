Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C364FC3DA5D
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 14:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LxfYy6/M3ehMppaEBOjJRye1t9y1FT+YSzsQTYcXv0=; b=Odz4F8jCJNHiPA3nQ+o0Nc/Yqp
	7DXae3PS0ZWUymLqZDBa7sy9gD1caqkWY5HvdGwQiQNsg1Mcgy5P64E3ZhcIw0zLdBP/Qc4jF0Nx0
	cCLVftorJw9lIHjC19gngEa3TkQuzWfQo4kYPI9AjxedMTZ4192/6hOJEf+sNl6eF68GOfBn+i4Hl
	Gka6phxU0stxJyNZvMxx4Rpvrvr4JyAyhHADcKvMT5ASkQBLgquhTcRpBI2RRZ8s0vDe937IQ42th
	AmOwTuJvLoyFEGSOb8lBKjR35VK3u7PJX3Bvba/U8CyGo2Yii9ztBl6xUXQCGp6L1nxgQB560jHYz
	5LQLs1qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWzBv-00000001CwR-0umU;
	Thu, 25 Jul 2024 14:11:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWzBj-00000001Cqo-2sbn
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 14:11:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DF53E61198;
	Thu, 25 Jul 2024 14:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E6E3C116B1;
	Thu, 25 Jul 2024 14:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721916682;
	bh=K2jntEM2NdwIXR7woB2lurOGQ31Ad2/rOHMmjfH1G4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QV9i8yAE4X67/HuPTmdg3c21biU527XqS5W8o4IAPOOEJkqK07d4/knl/sc78SHfh
	 C853fWnul+h7vVsYkFMNpFHcf2qpaFgx7Ts7HAMhAq62E7RPZPR121WqFRFFLbxsD+
	 hZgAxfTVQgEdKSeEKRkHN7lDKF1raqLCHrroTKc7rqy0kPqHUvQLN5ht2IjWOig6Rd
	 QXgi9lT/lmH/ixNnGI6cZQAmUN1WCkMSJ0TZcOAYLT4swfjADYeGErxYh/5skPTAtC
	 9t7G1PsVE+JmN6EZYdfC1YDi1LuyOK+3eWpzDZ57GfOZk4PFb5svjhklZt/fXG91bM
	 B8Fdq4JnqYBvw==
Date: Thu, 25 Jul 2024 15:11:18 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/17] dt-bindings: riscv: sifive-l2: add a PIC64GX
 compatible
Message-ID: <20240725-widget-ebook-1f34438355de@spud>
References: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
 <20240725121609.13101-7-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240725121609.13101-7-pierre-henry.moussay@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_071123_815243_549C0008 
X-CRM114-Status: GOOD (  13.99  )
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
Content-Type: multipart/mixed; boundary="===============4442924383442254831=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4442924383442254831==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YV+Pv3m+MnxQFIob"
Content-Disposition: inline


--YV+Pv3m+MnxQFIob
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 01:15:58PM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> The PIC64GX use an IP similar to MPFS one, therefore add compatibility wi=
th
> MPFS as fallback

It's the same, not similar ;)

$subject should start with "dt-bindings: cache:"

>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> ---
>  Documentation/devicetree/bindings/cache/sifive,ccache0.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml =
b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> index 7e8cebe21584..9d064feb2ab1 100644
> --- a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> +++ b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> @@ -47,6 +47,11 @@ properties:
>            - const: microchip,mpfs-ccache
>            - const: sifive,fu540-c000-ccache
>            - const: cache
> +      - items:
> +          - const: microchip,pic64gx-ccache
> +          - const: microchip,mpfs-ccache
> +          - const: sifive,fu540-c000-ccache
> +          - const: cache
> =20
>    cache-block-size:
>      const: 64
> @@ -93,6 +98,7 @@ allOf:
>                - starfive,jh7100-ccache
>                - starfive,jh7110-ccache
>                - microchip,mpfs-ccache
> +              - microchip,pic64gx-ccache
> =20
>      then:
>        properties:
> --=20
> 2.30.2
>=20

--YV+Pv3m+MnxQFIob
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZqJdBgAKCRB4tDGHoIJi
0qoPAQDiWmbC30Jswzi04zwSiokBIT65V56No17WIdstMpQawwD/XR7qsT5GSXbW
xP2sbx7bJboOZtoU9RKv4M8P0KcwJgY=
=H2JB
-----END PGP SIGNATURE-----

--YV+Pv3m+MnxQFIob--


--===============4442924383442254831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4442924383442254831==--

