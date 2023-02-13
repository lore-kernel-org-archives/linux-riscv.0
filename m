Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD571C6379F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 19:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+fFPiJhy8z4hrhzeKlDHFP9RGe9RoTZBwT/U90BrwQ=; b=zedvEV2u/u22DbijtibdnYoZaJ
	mtZvVUAcKqnzl0DIf2Ni+tLASTa3dBglKTJtz1VHhU+6vA46Hl18Ve0WpT7/VEubtITFmrrJtiTMm
	JX8UZnKGKybc+gPEuXPTKfcrcjQci32/e3C9gxQWVZFDv6hFBsowCiD9x7kfzD2/8VN/mbVcml5zS
	RvrMtKY05SC30FZG3Bt+kzHCAbcM7uERU9WJKmshRHalpchzLlExjGVhU64BNN9ZtIb/oxsC8lw6A
	L6xa0Ixm//GWzJUkgdu7pkWTalu3R4ZnCb24dimT6JjK18hvFSB3Sh1HkOa/Jcc1w03Pam3yFiMZL
	vA8Xrw7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pReim-00G2vJ-Ot; Mon, 13 Feb 2023 19:42:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pReik-00G2uj-Gh
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 19:42:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D894661297;
	Mon, 13 Feb 2023 19:42:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A0AAC433EF;
	Mon, 13 Feb 2023 19:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676317357;
	bh=guXZkW5cd9rxMRD0z8ewEgH9k03dg98yNz1cKBNWipY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dMZmMbhe+Fiha3PJmP+rBKyZPRXcwK9eSq71zoLh6/W/rYZlByKZqPyLjHR0niVpn
	 B1wWfNO6kx9sHBmgnARW97QbEikoFBo/04wl4ZqTVB/g+FZ3jhRdwvHlVdnj5CqkkG
	 GAMvEIGsORCb8szwjcv5VUzKzI143Y7oh+xXGFDQN28HpgqfXKxyV1kcVPRFBn+4NJ
	 cKscnBMvf8gQhC00Vg2eBK/g1RJk68cAMrfSOR5lIHqL9plS4kPF9r07WwrK8nv2pC
	 jMrWZIKekzd6/i3cPvRgt8hevNqSwrx3/I7YBbOwW0ZDJTmq2LTH1bkcw5TJyfiMz0
	 GzexHuoksiTDQ==
Date: Mon, 13 Feb 2023 19:42:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yimin Gu <ustcymgu@gmail.com>, Waldemar Brodkorb <wbx@openadk.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 1/3] clk: k210: remove an implicit 64-bit division
Message-ID: <Y+qSqHDhcFZNqOMg@spud>
References: <20230212205506.1992714-1-Mr.Bossman075@gmail.com>
 <20230212205506.1992714-2-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230212205506.1992714-2-Mr.Bossman075@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_114238_615681_9D55872C 
X-CRM114-Status: GOOD (  20.61  )
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
Content-Type: multipart/mixed; boundary="===============8687941641549940512=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8687941641549940512==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ydD/mnLxnoLWogXe"
Content-Disposition: inline


--ydD/mnLxnoLWogXe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 12, 2023 at 03:55:04PM -0500, Jesse Taube wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> The K210 clock driver depends on SOC_CANAAN, which is only selectable
> when !MMU on RISC-V. !MMU is not possible on 32-bit yet, but patches
> have been sent for its enabling. The kernel test robot reported this
> implicit 64-bit division there.
>=20
> Replace the implicit division with an explicit one.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/linux-riscv/202301201538.zNlqgE4L-lkp@intel=
=2Ecom/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

btw, you'll need to run get_maintainer.pl on this patch so that the k210
and clock maintainers are CCed.

It's also worth adding Damien Le Moal <damien.lemoal@wdc.com>

> ---
>  drivers/clk/clk-k210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
> index 67a7cb3503c3..4eed667eddaf 100644
> --- a/drivers/clk/clk-k210.c
> +++ b/drivers/clk/clk-k210.c
> @@ -495,7 +495,7 @@ static unsigned long k210_pll_get_rate(struct clk_hw =
*hw,
>  	f =3D FIELD_GET(K210_PLL_CLKF, reg) + 1;
>  	od =3D FIELD_GET(K210_PLL_CLKOD, reg) + 1;
> =20
> -	return (u64)parent_rate * f / (r * od);
> +	return div_u64((u64)parent_rate * f, r * od);
>  }
> =20
>  static const struct clk_ops k210_pll_ops =3D {
> --=20
> 2.39.0
>=20

--ydD/mnLxnoLWogXe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+qSqAAKCRB4tDGHoIJi
0rTyAQC5cOGbbN+5i2RQw624EEXHxdskW6y+HKXlZl7Fs/EqigEAgv0xBo1B/SIy
xsSbgqfgyutZNCHM9/+mcAF8KQpn2Aw=
=sh6D
-----END PGP SIGNATURE-----

--ydD/mnLxnoLWogXe--


--===============8687941641549940512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8687941641549940512==--

