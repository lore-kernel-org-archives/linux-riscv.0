Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFCD4C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 07:21:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E3D060234
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 07:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E3D060234
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r6s5tRSymKW3eEND6VqR5yR1OPw6MeE/z+ZMS9Qm6XE=; b=oPm2oOSLTPQUEHfCUFlTfSkf+C
	j0tLde00pdMOuMl/Q+YidPCCq9wZ8j16him3bSuos9v8mX+0q3bg3VUpJ+rv9yPsYB97TaY7BjOaW
	xywFTOvNHKnbnbXu+UUArDZtNj9oGr4hjkWwGvDedTc8DjM1G5pasVgccCZnc/TZNj570tXNOWUj7
	6x1MTN9q4nAnj1dakuvngp2IHh1kN3O8Nkh7aGD7CwYBLlyAUaBhNJBpBoIGQ/Bq0ZwltKfV+VjcW
	iOpfTxJS2rdQU6SrWCg4NF/JCpbcP2WMeTa4SkUBzCChQMv//yoJXWKW+TI1Xdn/0JMKKEPprfxKf
	XbSYihOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ2kU-004RkB-KJ; Tue, 14 Sep 2021 07:20:58 +0000
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ2kR-004RiA-Dw
 for linux-riscv@lists.infradead.org; Tue, 14 Sep 2021 07:20:57 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 9B6392B01244;
 Tue, 14 Sep 2021 03:20:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 14 Sep 2021 03:20:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=r3z+1fszfE1gQgB+PhQEZNe+vTo
 g8UxvAWLg30OlyPQ=; b=G/gD/Kl4b74mLyIJd66lZu5Yo/D9Zk0LH8gY7wH/FeP
 Nz1yR7TGM5Tq0E7jBj+Pe3dw8XmUvCZ2Tf9FwAZziG5eUb7iU5dzblMZ6dbRHN80
 L/jIwwft+KbSprXsqoLwqJ6XHHccmimf0nRcHEclkc6zFCSyrAcGeTMMDhEbUL5g
 wmDRwywS2rXzOQkmC8smWI6tvBmlvvqalWta8k842lHyTCYj+ODRs8ueNNE3/jY2
 gCikhcckj1hv3T3VCwF4to7TgudEPWamZLvkB15itzkpwHnOAnzXMpexWqBbgeWF
 UtFiUKET6oGgH3ZWy4esp18i4Zw+xDoSBxkrsX2BulQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=r3z+1f
 szfE1gQgB+PhQEZNe+vTog8UxvAWLg30OlyPQ=; b=iqgPMLNMOcjMDFc71SsBK/
 pKmNlqq+8UkXZzNtVuUuU7HxNxUaM2hBQD5L1DuNkQpAn6vyH92KREn8xDSa+XjF
 6DGiyYTz8UZmCmOtOnlH93x7oacEqWLjVMn8RUKnjvOJzV0WJsa/LHXu24yGFQ1R
 mdC3MONrY2bsXSKmIR0e2ttQGAPyACnQ9S6dNvojMTe7YsoBA7pjQd32TsoF97rY
 pGqKZ5Gj56rykhpKFyMJ7xveBTs4uQjMd6xsyqDdPd0M13xGZJ2EQihmRRRCfGdq
 6Z8JqfaH6vJ6KeL7nYsbWuQB8OnpSDcjBNuqq7nzOZS3bq6gU29JIg47q0dhqT5g
 ==
X-ME-Sender: <xms:T01AYax4d-hSa4FQiv6LmMkRkyFLGxdEOWkq8BMVndsVOjWkDRC_8g>
 <xme:T01AYWQFz__bZUsK2WkcuQt0Ox356iPNIP6F-JmDVo0Cg1KR4fh7OHSaWOgJrpBIg
 bNnXFUkq1ZSlELUPAA>
X-ME-Received: <xmr:T01AYcV7jZGtMirbdWn8_G8gxUM2TJ0FwLA-l7XlUQOzx95oOCLBUlteiuXkPBKpi49wFkGJHHLtSI62CC-AvXPZfrsF-cLuUWA2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegkedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevgeduteektefhtefggfdtkeekgfehhffffeegudelheegheeiueevfeeg
 vdeigeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:T01AYQgd8Er7NkXUTfsDojYWAB-uSohRL8WzfNGhQ8R3jDwtzoyNxw>
 <xmx:T01AYcBQ9ZHyzc0uvap5l6kDamTJYv4AIw9-WdYEhXvNBf_gWFH_EA>
 <xmx:T01AYRJ-5v0xCO2AOrHEOYLeTYD7ZFMyZrrb-jlsWry0noifvTuTTQ>
 <xmx:Uk1AYc35cNV5-xhOsRonCfKX3hUuZfYfsQaClMSncnytyQXu6A6-Yh4jkvM>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 03:20:47 -0400 (EDT)
Date: Tue, 14 Sep 2021 09:20:46 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: guoren@kernel.org, Liu Shaohua <liush@allwinnertech.com>,
 wefu@redhat.com, anup.patel@wdc.com, atish.patra@wdc.com,
 palmerdabbelt@google.com, christoph.muellner@vrull.eu,
 philipp.tomsich@vrull.eu, hch@lst.de, lazyparser@gmail.com,
 drew@beagleboard.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, taiten.peng@canonical.com,
 aniket.ponkshe@canonical.com, gordan.markus@canonical.com,
 Guo Ren <guoren@linux.alibaba.com>, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [RFC PATCH V4 6/6] riscv: soc: Add Allwinner SoC kconfig option
Message-ID: <20210914072046.s3nhxaut6kihe3tn@gilmour>
References: <20210911092139.79607-1-guoren@kernel.org>
 <20210911092139.79607-7-guoren@kernel.org>
 <20210913084520.kkbsupogkzv226x3@gilmour>
 <e46bb02d-961d-672d-76c7-9844d76ee69b@canonical.com>
MIME-Version: 1.0
In-Reply-To: <e46bb02d-961d-672d-76c7-9844d76ee69b@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_002055_603036_EDE2FAE5 
X-CRM114-Status: GOOD (  26.80  )
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
Content-Type: multipart/mixed; boundary="===============1516432485234482201=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1516432485234482201==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zjkz7mw5vd3whnco"
Content-Disposition: inline


--zjkz7mw5vd3whnco
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 14, 2021 at 05:49:52AM +0200, Heinrich Schuchardt wrote:
> > Hi,
> >=20
> > On Sat, Sep 11, 2021 at 05:21:39PM +0800, guoren@kernel.org wrote:
> > > From: Liu Shaohua <liush@allwinnertech.com>
> > >=20
> > > Add Allwinner kconfig option which selects SoC specific and common
> > > drivers that is required for this SoC.
> > >=20
> > > Allwinner D1 uses custom PTE attributes to solve non-coherency SOC
> > > interconnect issues for dma synchronization, so we set the default
> > > value when SOC_SUNXI selected.
> > >=20
> > > Signed-off-by: Liu Shaohua <liush@allwinnertech.com>
> > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > Signed-off-by: Wei Fu <wefu@redhat.com>
> > > Cc: Anup Patel <anup.patel@wdc.com>
> > > Cc: Atish Patra <atish.patra@wdc.com>
> > > Cc: Christoph Hellwig <hch@lst.de>
> > > Cc: Chen-Yu Tsai <wens@csie.org>
> > > Cc: Drew Fustini <drew@beagleboard.org>
> > > Cc: Maxime Ripard <maxime@cerno.tech>
> > > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> > > Cc: Wei Wu <lazyparser@gmail.com>
> > > ---
> > >   arch/riscv/Kconfig.socs      | 15 +++++++++++++++
> > >   arch/riscv/configs/defconfig |  1 +
> > >   2 files changed, 16 insertions(+)
> > >=20
> > > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > > index 30676ebb16eb..8721c000ef23 100644
> > > --- a/arch/riscv/Kconfig.socs
> > > +++ b/arch/riscv/Kconfig.socs
> > > @@ -70,4 +70,19 @@ config SOC_CANAAN_K210_DTB_SOURCE
> > >   endif
> > > +config SOC_SUNXI
> > > +	bool "Allwinner SoCs"
> > > +	depends on MMU
> > > +	select DWMAC_GENERIC
> > > +	select ERRATA_THEAD
> > > +	select RISCV_DMA_NONCOHERENT
> > > +	select RISCV_ERRATA_ALTERNATIVE
> > > +	select SERIAL_8250
> > > +	select SERIAL_8250_CONSOLE
> > > +	select SERIAL_8250_DW
> > > +	select SIFIVE_PLIC
> > > +	select STMMAC_ETH
> > > +	help
> > > +	  This enables support for Allwinner SoC platforms like the D1.
> > > +
> >=20
> > I'm not sure we should select the drivers there. We could very well
> > imagine a board without UART, or even more so without ethernet.
>=20
> The draft of the RISC-V platform specification is available here:
> https://github.com/riscv/riscv-platform-specs/blob/main/riscv-platform-sp=
ec.adoc#uartserial-console
>=20
> The specification requires in section "2.1.5.1. UART/Serial Console" that=
 on
> platforms with a rich operating system (e.g. Linux) you have a serial
> console. Hence requiring 8250 support for the D1 CPU is justified.

I mean, not really? The platform is required to have a UART, but nothing
requires the kernel to have a driver for it as far as I'm aware.

Maxime

--zjkz7mw5vd3whnco
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUBNTgAKCRDj7w1vZxhR
xbLcAP4ydU6yZPm2aqeZbdBFbajBZuxuBTifIing7bv4DsbamQEAsVTigkpi8Fxu
cJpZogfYIkGjA8oqsLG4qw2IQ3eV8gM=
=Q8eQ
-----END PGP SIGNATURE-----

--zjkz7mw5vd3whnco--


--===============1516432485234482201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1516432485234482201==--

