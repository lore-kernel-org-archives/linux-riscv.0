Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014A9CD4F54
	for <linux-riscv@archiver.kernel.org>; Fri, 29 May 2026 16:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9jWbg4GLBdFc1ZqXIhzfiARUKSDxfm5UsKZhERHnLIw=; b=Z9SddD6Cbc4zdbTIeork6PNBuD
	RNx32QbD4adiHO96Nn4D7r7GNphwPzUh9i5jPz3NU58i7WDvOHjL8j97abAW35/Um/CN5s+HIJ1iX
	UhGv1yMl6NfYzMGsTnjreBmw5QQzxbXdwn+jqVEexiad4O9E8jnESrwPwuhGjmVXfSpGAHzO+0kY4
	B8S3b4LbmcEIgfC1xe+my6DRYvBOT0ZL0XZroUlAfT2GhBYDOhnlMsqZCK1Jy62wckNhcJLZSuW1F
	0LAscZAuEFRe/Uep97jnPqPaaPGd5p2BX6jHaYidcY0TL3I5s1hB7C0cRLB/bV+UVvVCJ2ohGpKXj
	II1zasOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzjR-00000007pkU-3MW6;
	Fri, 29 May 2026 16:06:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzjD-00000007pYT-3QvV
	for linux-riscv@lists.infradead.org;
	Fri, 29 May 2026 16:06:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A33643D51;
	Fri, 29 May 2026 16:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E649B1F0089C;
	Fri, 29 May 2026 16:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780070791;
	bh=jy1Vna5n/pf5t6QN3pX0+QNIculqo5cTILdYN8VG3T0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lq9kypbVinuwhXYOjjb87O40JTy6+GuEb6zFm8q8WVg+vf6biRDTe51RYq5LC6aD2
	 TFhXeBsSlRAIvxqKzJEvqNAAh2VouZUOENnWORECcRDl9YxwJa4sYlU/QEaAPaxw8n
	 isl9BPOchsnp7Sk+DTYozEDWSJdIsqrU0gucbPREB5KL9wJjwqRtrRD5WWlBs6DRHU
	 55zwzzP4HBUOBVagm7gT0fMHm5RfeJN6+Wu5ZYdy0rdXOeZtyPnIC4JEf3PiZ5I+5E
	 EG/ICgk5Obg2LCo4WefOXZ7CdsYq44CfF6LZoBeggVDl473bKqyksI81S9PfkfwHpN
	 3bZinsAXXaI+Q==
Date: Fri, 29 May 2026 17:06:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Vivian Wang <wangruikang@iscas.ac.cn>,
	Paolo Abeni <pabeni@redhat.com>, Guodong Xu <guodong@riscstar.com>,
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] riscv: dts: spacemit: k1: Split gmac_clk_ref into
 independent pinctrl groups
Message-ID: <20260529-casing-carat-23f471ce6ea2@spud>
References: <20260528-bpi-cm6-v2-0-d0eb3f236cea@pigmoral.tech>
 <20260528-bpi-cm6-v2-2-d0eb3f236cea@pigmoral.tech>
 <20260528-mushily-suffrage-5162d4ffdaf2@spud>
 <DIUT907819JD.MG7B60VQLZ8L@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <DIUT907819JD.MG7B60VQLZ8L@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_090631_934411_D3E0EF19 
X-CRM114-Status: GOOD (  25.08  )
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
Content-Type: multipart/mixed; boundary="===============6920768597137248489=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6920768597137248489==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n7EcFU5F5S286T6/"
Content-Disposition: inline


--n7EcFU5F5S286T6/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 10:38:38AM +0800, Junhui Liu wrote:
> Hi Conor,
>=20
> On Fri May 29, 2026 at 1:13 AM CST, Conor Dooley wrote:
> > On Thu, May 28, 2026 at 01:22:48PM +0800, Junhui Liu wrote:
> >> The gmac_clk_ref signal is optional for the GMAC controller and is not
> >> strictly required for all hardware designs. The pins for gmac0_clk_ref
> >> (GPIO 45) and gmac1_clk_ref (GPIO 46) may also be used as GPIOs for
> >> other functions even when the Ethernet controller is active.
> >>=20
> >> Split the refclk pins into independent pinctrl groups so boards can
> >> request them only when the reference clock path is actually needed.
> >>=20
> >> Among the already mainlined boards, BPI-F3, Jupiter and MusePi Pro have
> >> optional hardware paths for the GMAC refclk pins. BPI-F3 and Jupiter
> >> route both GMAC refclk pins to the PHYs through NC/0R option resistors,
> >> while MusePi Pro only does so for GMAC0. Keep referencing the new
> >> clk-ref pinctrl groups on these boards so the optional hardware paths
> >> remain usable if the option resistors are populated.
> >>=20
> >> OrangePi R2S has no publicly available schematic, so also keep the
> >> clk-ref groups there to preserve the previous pinmux behavior.
> >>=20
> >> Fixes: 60775f28cfb7 ("riscv: dts: spacemit: Add Ethernet support for K=
1")
> >> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> >
> >> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv=
/boot/dts/spacemit/k1-pinctrl.dtsi
> >> index 4e9a62d0e85b..8c57ca05dabd 100644
> >> --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> >> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> >> @@ -27,8 +27,16 @@ gmac0-pins {
> >>  				 <K1_PADCONF(11, 1)>,	/* gmac0_tx_en */
> >>  				 <K1_PADCONF(12, 1)>,	/* gmac0_mdc */
> >>  				 <K1_PADCONF(13, 1)>,	/* gmac0_mdio */
> >> -				 <K1_PADCONF(14, 1)>,	/* gmac0_int_n */
> >> -				 <K1_PADCONF(45, 1)>;	/* gmac0_clk_ref */
> >
> > The point sashiko made here seems valid, odd that these aren't added to
> > another group.
>=20
> Do you mean Sashiko's point about not adding these groups to the
> OrangePi RV2 board? That is because GPIO45 and GPIO46 are used as
> TP_RST_1V8 and TP_INT_1V8 respectively on the OrangePi RV2. These are
> the reset and interrupt signals for the touch panel, and are not
> connected to the optional GMAC PHY refclk path. So with this patch,
> GPIO45/46 can be properly used by the touch panel without pinmux
> conflicts once display/tp support is added in the future.

Okay, that sounds fair enough!

--n7EcFU5F5S286T6/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahm5gQAKCRB4tDGHoIJi
0j6HAQD9yT0EvjvfBz74b/0p8nGpyOr/6dWhXyFM9Ci1R1AVWQD+Kev51HUz4QEU
Yp2KAliIYhPeIibILnEX5d1vVKqUUgw=
=s/LD
-----END PGP SIGNATURE-----

--n7EcFU5F5S286T6/--


--===============6920768597137248489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6920768597137248489==--

