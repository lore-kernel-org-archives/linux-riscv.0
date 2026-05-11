Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46450CD37BE
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 14:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ecFBpKjav7hI3mnUUMZSzBEQoxEDBAaxZtpMMAak7HA=; b=bLxCYGj25umn2X62TVThQK9OAP
	DcCb56TFr41jF9QeDTMN34CzwoYwvQXsGYg7otwqFeF+ZqKHTXr/I9szzdUnfCBI0sYo90/7AG3ag
	tlEqSdtnTK0yQkl9WsYNZAt3R8yHJZv7OPVk09DdhBZLJV8yULIoomMS1NN9SkR9n6INACWBEdIGC
	S72Wb8rlzoJJ3EDSDibk8CWsbMuc26B7cP7RMx5799SjbfZy2a2TgHUfzUscH22vBobxACBJaFz6Z
	IiTO1aGpxEZ53iC9EmRUYtE5w8foj61w5VcHTYJvhScSOmnirwvSTpBoRodBiKESzfbkyRLULSKsg
	2UPrmSRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRVn-0000000DtXI-3DJh;
	Mon, 11 May 2026 14:21:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRVl-0000000DtWS-2m4L
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 14:21:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC0594339E;
	Mon, 11 May 2026 14:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A955CC2BCB0;
	Mon, 11 May 2026 14:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778509292;
	bh=ZBy4LQy3G5oY+enGMTuTxblEOqHxjUpTY2UJ0Jx24To=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GrpW5tDjVCVBmo8sJAn8DpXIh4s/WpBaTT2/nArzSIqZ0jek4l/5u4Eh5jpBeHTLS
	 WajraIiZPYZM95Wv6LuXi+kt3TSaUvMuAjAKsQMlN8UTdAWtNJdUtafCYILx6WT5ob
	 AKL0SRVLutlOlZXXZ86cNYDXca8POlyAyVTv3QPVEYIZ9v+IzY0p6WC+80oaW0Q1zA
	 mmdnJW4N2z0kN3jEHoVyAzluzETZ+gIiS9D/pRDxx4a2G+fHVvUAq4HbZbtkZAEWWq
	 A7WpeKmoxN+XkdR2Rq5Hep/wnZ0Fxaxnaitu0RRg9NBkz6asOOgEG6GsZgIrgC3ikh
	 kgf9++gagR1Nw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 8E2841AC58A9; Mon, 11 May 2026 15:21:30 +0100 (BST)
Date: Mon, 11 May 2026 23:21:30 +0900
From: Mark Brown <broonie@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Yixun Lan <dlan@kernel.org>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	jinmei.wei@spacemit.com
Subject: Re: [PATCH v2 3/3] ASoC: spacemit: declare shared BCLK for cross-DAI
 rate constraint
Message-ID: <agHl6p-JEjpsPsPX@sirena.co.uk>
References: <20260507-i2s-same-blk-v2-0-ede05a22f732@linux.spacemit.com>
 <20260507-i2s-same-blk-v2-3-ede05a22f732@linux.spacemit.com>
MIME-Version: 1.0
In-Reply-To: <20260507-i2s-same-blk-v2-3-ede05a22f732@linux.spacemit.com>
X-Cookie: Truckers welcome.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_072133_757879_D1E6787C 
X-CRM114-Status: GOOD (  11.04  )
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
Content-Type: multipart/mixed; boundary="===============7311130921247384727=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7311130921247384727==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FToeJ0M9a9mPmegE"
Content-Disposition: inline


--FToeJ0M9a9mPmegE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2026 at 06:31:44PM +0800, Troy Mitchell wrote:
> On SpacemiT K3, multiple I2S controllers share the same physical BCLK
> (c_bclk). Declare this clock via snd_soc_dai_set_bclk_clk() so the
> ASoC core can automatically constrain hw_params when one controller is
> already streaming.
>=20
> For K1, c_bclk is NULL (obtained via devm_clk_get_optional_enabled),
> so this call is a no-op and behavior is unchanged.

We don't appear to have a c_bclk in current code?

--FToeJ0M9a9mPmegE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoB5ekACgkQJNaLcl1U
h9Dtgwf/e8ZiBgJyxowxGkq0N6uC5OBXBADNJx2cI54gJhzEsPEvo5gxrS7a7u5c
PwSNPv/UeigMQI0xIPjzcPEvyKWXP8R0Gs0PoDFbVYhqS+2zxDM68LpM6O/plRYk
Dov/IuOBjWdozrR9LQa5GXouHauZu3qjYreeJcEcv+me6r9n88eG4KoZQcDrgavr
AXe36c1S9svnWzNTdzy/aA1pfl0k1mBEZNekrIERVVH4B2BwzWfTTAqG8ZngBI/W
11tv5H3tHMFyg60+FA06goQ0jhq//DyjiNEy76VCI8uL3nGqyezJdYJx/kXEuDRw
A55UojxM/joMZqDiwjajidaeGnf7OA==
=Z7xu
-----END PGP SIGNATURE-----

--FToeJ0M9a9mPmegE--


--===============7311130921247384727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7311130921247384727==--

