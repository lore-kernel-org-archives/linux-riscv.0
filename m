Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BEAC64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 19:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJo+yO52X1Sr8LQocf36Bgbc10hnLzOnNueRJ7ip9/A=; b=qISMxMqOq5SuTC8Crztp1gXIh0
	pzVf+xhpzmNWn2+gtV0aVZYOa2zMwe+ka4U9MAeyTR4JOKyc80hotxkJKpM1DZrY4Epasz30MpWO9
	dQw5YNvQi1ga9Cn6KCb6U1B3xabQOD64TP6TjBhSrxgy+njL558K4KqqrkK3TGhUJu2wOuKvDUWIi
	Wpf0xN8sHrc4LgIVz8/zRgLPZMBtQ4gBlF9A1TXW9PlLVOJjw/l5GoFqSSA+aSANxLLUoqloe6i4d
	WQxQjKOu3ygg6mMpbXRNf2UF8yGFp0Lk0S1D5YYYcIucnlRjK7ehT/+1YbNI8C55vUt55aO2pmAXx
	NPZQXFgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX5Vm-00E4TF-8K; Tue, 28 Feb 2023 19:19:42 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX5Vk-00E4S8-52
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 19:19:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BF2CEB80E72;
	Tue, 28 Feb 2023 19:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31FAEC433EF;
	Tue, 28 Feb 2023 19:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677611977;
	bh=fo0jm9LIFRTBLWMyXrRtWlqKUsGki35LZNiy0Ybfk6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V/vEXAL6MEcX2zrFrn1ooCXm/U/Qvczx09vMgM+M51u/u6WOmi+A6bhT5b7D6inYF
	 MBn9Q68VHUvJxbUZ2QtxMtTgY+YgZ4FD4t2PUQPUp5H++zCRuimzwcbwqNpNbOI0pC
	 dU4uIFCCYgCLTGD3JNY2dhgTaXmrDWUMS552KY74nI5wggf8xgHOGLAjcp4FuKcAG2
	 gvdmjM4V95xI9eGgfu3ppqxpJwMXPVR4Qh3o/Lc3UdBSfRka0I8hO880mm33eesT5i
	 c7z6fAT9VzZ5h61c1E12YjEiUKKC1kvjvv83RjfmrsTIdgAhR8NdAjt5JPX9dApvP0
	 n5zbALL3o+Afw==
Date: Tue, 28 Feb 2023 19:19:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: mcgrof@kernel.org, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 12/20] clk: microchip: mpfs: remove MODULE_LICENSE in
 non-modules
Message-ID: <Y/5TxBLcTDIdv2eM@spud>
References: <20230228130215.289081-1-nick.alcock@oracle.com>
 <20230228130215.289081-13-nick.alcock@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20230228130215.289081-13-nick.alcock@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_111940_504085_F209EB26 
X-CRM114-Status: GOOD (  19.03  )
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
Content-Type: multipart/mixed; boundary="===============1525956673083687075=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1525956673083687075==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J9YrWK5U4Nxh9aHS"
Content-Disposition: inline


--J9YrWK5U4Nxh9aHS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2023 at 01:02:07PM +0000, Nick Alcock wrote:
> Since commit 8b41fc4454e ("kbuild: create modules.builtin without
> Makefile.modbuiltin or tristate.conf"), MODULE_LICENSE declarations
> are used to identify modules. As a consequence, uses of the macro
> in non-modules will cause modprobe to misidentify their containing
> object file as a module when it is not (false positives), and modprobe
> might succeed rather than failing with a suitable error message.
>=20
> So remove it in the files in this commit, none of which can be built as
> modules.
>=20
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> Suggested-by: Luis Chamberlain <mcgrof@kernel.org>
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: linux-modules@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
> Cc: Conor Dooley <conor.dooley@microchip.com>
> Cc: Daire McNamara <daire.mcnamara@microchip.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
>  drivers/clk/microchip/clk-mpfs.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk=
-mpfs.c
> index 4f0a19db7ed74..d85b345f4c08d 100644
> --- a/drivers/clk/microchip/clk-mpfs.c
> +++ b/drivers/clk/microchip/clk-mpfs.c
> @@ -513,4 +513,3 @@ MODULE_DESCRIPTION("Microchip PolarFire SoC Clock Dri=
ver");
>  MODULE_AUTHOR("Padmarao Begari <padmarao.begari@microchip.com>");
>  MODULE_AUTHOR("Daire McNamara <daire.mcnamara@microchip.com>");
>  MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
> -MODULE_LICENSE("GPL");

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

I'll take this via the microchip/at91 clock tree after v6.3-rc1 has been
released.

Thanks,
Conor.


--J9YrWK5U4Nxh9aHS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/5TxAAKCRB4tDGHoIJi
0qRYAP4hAGmSiUtr+YIBtvnpss72NXfOb3W3G/mOzk1iYpD5WwEAqOGVxkikgTDE
dmyRBIRrLaGFnutuZJDaqnQBnAUB6QQ=
=p4yC
-----END PGP SIGNATURE-----

--J9YrWK5U4Nxh9aHS--


--===============1525956673083687075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1525956673083687075==--

