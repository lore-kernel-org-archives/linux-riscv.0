Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B11DC64EC4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 22:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okyuzqd/qwbQ0NAvzkX+EsUGIewGisqeiOdmalmm+F0=; b=4VUbtLuRkUI6AtWpgCOJPvFL/J
	yvnBp67K/di8KOMH7mZ/A38/ZWk3jEd+9dc4M3N/q63FVRJTVqBOSbbTsbA3aA8DgRtHa1krilKGN
	hNBDlHRMKZRES/ffuKTEjOEKAvijiBuoMRQjiU28H49kijY/ftxq824uVq3C6NGRtn+NAmzK065EE
	fZMoN72ak72xPuV+3UnmfUXcmEoRiCgzVJk4jc20TFemFiocgS3+e/EHXdyZCc9gusNDOdJawt6kR
	00j3diAYLxhv9PZE9knibztm7mXIuS5QpntZWe3S+PF/+R1Nh5UbFx4V9KWnjfNLJ0owToF2U/Kcd
	WLfXbqbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZJQE-00FIb8-2l; Mon, 06 Mar 2023 22:35:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZJQB-00FIaE-Vo
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 22:35:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 42E8360F6B;
	Mon,  6 Mar 2023 22:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E32C433D2;
	Mon,  6 Mar 2023 22:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678142106;
	bh=AaKFvPAhK4yNUKY1AwEa3TApIy5qdHabYFMN/Z1jxYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DtKUhs85+91yUOeihxb6gOzKdl1rkMoYVdtYwI7zGwtFFDeGyXL4prr0/l7muZp/b
	 7Ac9RVU46iJ8TXSUyDHFoNgw4XLHlwNp3mgwysLRV0ubOyKhUeGk3jJXErmQUDRvKq
	 HbvFeGkpNWVIqXQZfBL6erQOoTwwl2RpmdKVKDPagDLDLiyUHAb4LiwjKi8LbuEPPL
	 UWrNuJUdtOfFdxb4l12Y92R9yHrNlzxadMQ8/Q6VQmW5P+7aHQbEfUP3QWmIQutMZe
	 bSVv9TRYF+MCkSTQL4LXMmqW7eAJkOGQ6x1ebovw6Qo78c6rT2HOB4rcO0PcZHyHgX
	 EAG/2yWzXOdzQ==
Date: Mon, 6 Mar 2023 22:35:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Jesse Taube <mr.bossman075@gmail.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yimin Gu <ustcymgu@gmail.com>,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Waldemar Brodkorb <wbx@openadk.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 1/3] clk: k210: remove an implicit 64-bit division
Message-ID: <be589843-dfc1-47dc-a488-a4fad645c638@spud>
References: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
 <20230301002657.352637-2-Mr.Bossman075@gmail.com>
 <3b0a1481873a2a7c26015fcedcc673b3.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <3b0a1481873a2a7c26015fcedcc673b3.sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_143508_084048_A478CEC0 
X-CRM114-Status: GOOD (  12.83  )
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
Content-Type: multipart/mixed; boundary="===============3654008250860116758=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3654008250860116758==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ERan6PsFUqxi69zE"
Content-Disposition: inline


--ERan6PsFUqxi69zE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 06, 2023 at 02:31:00PM -0800, Stephen Boyd wrote:
> Quoting Jesse Taube (2023-02-28 16:26:55)
> > diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
> > index 67a7cb3503c3..4eed667eddaf 100644
> > --- a/drivers/clk/clk-k210.c
> > +++ b/drivers/clk/clk-k210.c
> > @@ -495,7 +495,7 @@ static unsigned long k210_pll_get_rate(struct clk_h=
w *hw,
> >         f =3D FIELD_GET(K210_PLL_CLKF, reg) + 1;
> >         od =3D FIELD_GET(K210_PLL_CLKOD, reg) + 1;
> > =20
> > -       return (u64)parent_rate * f / (r * od);
> > +       return div_u64((u64)parent_rate * f, r * od);
>=20
> The equation 'r * od' can't overflow 32-bits, right?

Yah, I checked that when writing the patch. They're 4-bit fields:
> /*
>  * PLL control register bits.
>  */
> #define K210_PLL_CLKR		GENMASK(3, 0)
> #define K210_PLL_CLKF		GENMASK(9, 4)
> #define K210_PLL_CLKOD		GENMASK(13, 10)

Cheers,
Conor.


--ERan6PsFUqxi69zE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAZqlQAKCRB4tDGHoIJi
0iy3AQDEyhSWt9luWK3hsRaGF9IFqJJ5Zv5go86VrRKa8gRWBAEAsE83tegQ4VhX
XtAnn+tuUHde9besO1Nnwd7yn9BQ2AE=
=cLk4
-----END PGP SIGNATURE-----

--ERan6PsFUqxi69zE--


--===============3654008250860116758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3654008250860116758==--

