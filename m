Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65E2CE8349
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 14:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqC+2puMz2x1Hqbh9y/as0IcNT71vHEX/2rsTXlYNLE=; b=WYeNF55GU0pvJKf7aUHunBM+L2
	J7mevWEFv/mI6CN5gymkzo/m85qEugux67UuxvGTSs7i9WbF8MvSKXI2qd5z6eW8NrkgaocCmWtCY
	Qvu52eSs2LiCvnNGUrZH59yJVr5H78NMZdFL94NScWQ8Puvj8KbL4ppeJYCDXET78otQ7a9lWBS9V
	JfmwNACec1phsnxWpjkTCflCy1+smBo5kdawqP1KJJmR4RLNjH/MTePLaNbZusXo/Yl1i6K0BweAM
	FUum2I16fipHl2fEsgvF3i8FLMcRNB1jRj4tHniPot/whjTws4zG9VHS+RYMhON+e9lVO7pIR2JXa
	zdDtgSCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svHAG-0000000HSxQ-1Tak;
	Mon, 30 Sep 2024 14:14:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svGkm-0000000HNCM-284k
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 13:47:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 479B5A410E9;
	Mon, 30 Sep 2024 13:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE964C4CEC7;
	Mon, 30 Sep 2024 13:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727704075;
	bh=XzNX2t1xxnZjsa7RwzNfCX2nQJVLYaCqjyt7jh1gGFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FV97WcvEspdNiIELdtSLP0YgKC1mXjqYTLWmnYS+2VcsRv3+ZQ5Dl8JmAQ3Q0vP5r
	 62xEk7CbD9QzZzTax9fNs48PgkJfmdKO8uW54DVHmWJLEMfpQVyYw4WtOECC53eqYK
	 HavTuduBMipJQvS/lUyQ9S7hY0VcPv85i7tqwSUDUJwFYQ0FzqEAKfVuezOlNNk/dT
	 gvRknUCS+jh1MGm5LaXY1x/UIHXCCpytGlgmephdhnBLoymxg0ymce772lJxqG6RBT
	 zoAdkLb/HeY8NOmZSQXrGi5BBUTLbj4dWIUDNgUJpiKVkllF6Z7BDcP+9xZtdngRyH
	 G2vlT3i20/yqQ==
Date: Mon, 30 Sep 2024 14:47:50 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Linux4Microchip@microchip.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [linux][PATCH v2 08/20] dt-bindings: clock: mpfs-clkcfg: Add
 PIC64GX compatibility
Message-ID: <20240930-twister-coveting-2861bab77048@spud>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
 <20240930095449.1813195-9-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240930095449.1813195-9-pierre-henry.moussay@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_064756_635843_4FFEEB99 
X-CRM114-Status: GOOD (  14.68  )
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
Content-Type: multipart/mixed; boundary="===============9041285479606613775=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9041285479606613775==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nX8cDUaRrz3hvHbN"
Content-Disposition: inline


--nX8cDUaRrz3hvHbN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 10:54:37AM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> PIC64GX has a clock controller compatible whith mpfs-clkcfg

NAK, v1 comments need to be addressed before this can be done.

>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> ---
>  .../devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml    | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcf=
g.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
> index e4e1c31267d2..ca889f5df87a 100644
> --- a/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
> +++ b/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
> @@ -19,7 +19,11 @@ description: |
> =20
>  properties:
>    compatible:
> -    const: microchip,mpfs-clkcfg
> +    oneOf:
> +      - items:
> +          - const: microchip,pic64gx-clkcfg
> +          - const: microchip,mpfs-clkcfg
> +      - const: microchip,mpfs-clkcfg
> =20
>    reg:
>      items:
> --=20
> 2.30.2
>=20
>=20

--nX8cDUaRrz3hvHbN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvqsBgAKCRB4tDGHoIJi
0kWoAP90aUTipNz/ZVbmJigGdbXIDI8KgMG45+NYCz6lVdWSYAD/aANBl+86hp5W
hdXibaIItA0jDG1eYPCvKYWoUVxHvA8=
=fM/P
-----END PGP SIGNATURE-----

--nX8cDUaRrz3hvHbN--


--===============9041285479606613775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9041285479606613775==--

