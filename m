Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9312FC5CFC1
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 15:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6jbW2xPjB6P6lCXKQEvS6cUxcped0GyDnRoRihRoiPg=; b=oGQWrfhsB5qZdo0HIv1ZqeQqcs
	2t4noWjDby6MCHMcUm7qmE+m+UaXG0XutiTAuNUM1UNW4IAuoW9yLtVBuGNnAZZbOHW+MGEemkPGI
	l1LaDd//j8AfvG/M4cgtiRZDr5ZEyeR/tI+6P4f7DsASnvAleYg/C8if48G9SGWlHShnoGV+pN/F7
	Bp0UxsoLXTIODcv/rHFan7bETNMPWwbJ5Q6PaMj5YJAh2SFIAY4WxD2MyGqTDQz/osxY4XguVMEhz
	RNQWTbrlC3Rhpx0DVulCaYLB3W4IzVSzNLyOYwavhgoGWc18/mHWkAx8dsi6TYxl5hdV6xi8MbQS7
	dypQvzIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wutjy-00000002qy5-2Q8V;
	Fri, 14 Aug 2026 15:22:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wutjx-00000002qxz-1pPE
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 15:22:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AA1BB43B0D;
	Fri, 14 Aug 2026 15:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660031F000E9;
	Fri, 14 Aug 2026 15:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786720956;
	bh=kmorQkK+4Ev4Z3RKxn3fV6jG5tvnbCoqC++sVg0KocY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TTOHoGewibpOLne/UO+Bfp7Lnm6S1ALUwHghNN6Q23tuQ9WrdbOJughJrOwSgqvuT
	 EybCRZ0Mr4hD038YjftrmiXfM0qPEsTMA31sPIKfQod79wc4YLr3To5lJliDDWmHJg
	 q6zOA0PcQqA4u7Gm2tdzQ5BiPCLNMdTDGilvDaPefvos4KU9K0GTLbPS+RtwVdPvdU
	 MY5cQszo6BGs57N9duwT2hPF/EdnN8Gq7pB6WhdTBx5SyNR6fXQYz42wX2lS91K1Wb
	 pYc9b4zuf6J027AA5/A0bcHIrocuyup1MjZwnUPNo+5Mq9EJSR07nh2y9FPwKxJZ7X
	 f7/M+I48v+Iwg==
Date: Fri, 14 Aug 2026 16:22:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Pedro Kopper <pedro.kopper@microchip.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, daire.mcnamara@microchip.com,
	mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com,
	valentina.fernandezalanis@microchip.com, conor.dooley@microchip.com
Subject: Re: [PATCH] clk: microchip: mpfs: fix regmap_update_bits() mask/val
 order
Message-ID: <20260814-boggle-derby-3f55c6c14bc8@spud>
References: <20260814092211.2158337-3-pedro.kopper@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20260814092211.2158337-3-pedro.kopper@microchip.com>
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
Content-Type: multipart/mixed; boundary="===============8696066349760353044=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8696066349760353044==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QEQswmvPTbKtLig7"
Content-Disposition: inline

--QEQswmvPTbKtLig7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 10:22:13AM +0100, Pedro Kopper wrote:
> mpfs_cfg_clk_set_rate() passes the mask and value arguments to
> regmap_update_bits() in the wrong order. The resulting write becomes
> reg =3D orig_reg | val, causing bits to not be cleared if the clock
> divider changes.
>=20
> Pass the arguments in the correct order so the divider field is updated
> as intended.
>=20
> Fixes: c6f2dddfa7f9 ("clk: microchip: mpfs: use regmap for clocks")
> Signed-off-by: Pedro Kopper <pedro.kopper@microchip.com>

CC: stable@vger.kernel.org
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  drivers/clk/microchip/clk-mpfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk=
-mpfs.c
> index ee58304913ef..7f044775aea8 100644
> --- a/drivers/clk/microchip/clk-mpfs.c
> +++ b/drivers/clk/microchip/clk-mpfs.c
> @@ -285,7 +285,7 @@ static int mpfs_cfg_clk_set_rate(struct clk_hw *hw, u=
nsigned long rate, unsigned
> =20
>  	mask =3D clk_div_mask(cfg->width) << cfg->shift;
>  	val =3D divider_setting << cfg->shift;
> -	regmap_update_bits(cfg->map, cfg->map_offset, val, mask);
> +	regmap_update_bits(cfg->map, cfg->map_offset, mask, val);
> =20
>  	return 0;
>  }
> --=20
> 2.43.0
>=20

--QEQswmvPTbKtLig7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCan8yuAAKCRB4tDGHoIJi
0szbAP4r5lkjOU05Z8OBHNcjRlUP+5eVU0Y+j/1qqkhgJWDo7wEApBkqLMPNQqSc
2hBKFESwyLLmkFM/+GEkcYTvKY/U6Ak=
=Po1h
-----END PGP SIGNATURE-----

--QEQswmvPTbKtLig7--


--===============8696066349760353044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8696066349760353044==--

