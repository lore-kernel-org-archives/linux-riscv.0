Return-Path: <SRS0=HNmv=LB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 153F3C47094
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 12:13:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C30DD610E7
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 12:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C30DD610E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VceBYux+bY5GdN2qlC/hj5cp0hP/sTLdFaWdse0d2E=; b=I8VurB5KCDtvhIymEwDpkGbV7N
	cPR/ccrASayNES3rZ2WdmuCq0PuXqbS4BTYn0+bJjc9O951wRCLlJOm05lu5R3K3Uca/lmMrGzGlh
	qqE+5hQd2nsIwdxn26+1W7al/LDnm2rsKIYZbnzqYkxlRwqg8YrqJuAewLRnvVzC9tSWqfhOSxncj
	QJfiD4O8brV3dxyVdRRh+sWwSj2+hrmiKxonm8fNUiKMBpFWSWBWDKXc3k3WeKXHQbskaCQE6PpWr
	wCDOuFGGjU+R/MSYC02C0Utm3m21SPrzCbLfYV6ulrZgaB7Prbez53MRbEbs5D3IySDlwTyEGsYJ5
	WYiO/iTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqE7N-003ULn-FQ; Mon, 07 Jun 2021 12:12:33 +0000
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqE7G-003UKV-QO
 for linux-riscv@lists.infradead.org; Mon, 07 Jun 2021 12:12:32 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 4D0041B0;
 Mon,  7 Jun 2021 08:12:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 07 Jun 2021 08:12:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=bdOV5shNGSbudXo1jwtzb6I/I3t
 HHcGm1Y59GzTTJXo=; b=XS6uS76xyfeS/NYAouenRxCHoyQE+SRP65aLaZGI6hw
 IN/3lQdjW+4UtOsR0kZgl6AnVpUOsyX/hzMIBan0xQqm+0O7zLaqovNZLZ7WIy6v
 xvacgtC1QbHSMvxaASM3CIbudxtJrO3tnRju7K0+LiGGVudFcO6ub+RLkzA5pLVe
 AcUh7YRCXRkeRaLu0KVjZEKkvvBxnmq5YRAplF5u5Tu0iWuRT4+VCFIxEUvFPvGD
 1xLGYUKNCVdoDqQ6VET3W74UtSHLV39x3O8+jS88AjRFsX9SAf9mSzT1MX9OVEbm
 GDD2ji8g3pHgrefEer3mlxMTrM9jGrZyuR7DHkOP7+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=bdOV5s
 hNGSbudXo1jwtzb6I/I3tHHcGm1Y59GzTTJXo=; b=dcR5U7o+ZFK6ssgmBRE2NB
 sO1tZWdllAJYK7ztLKKm9gdAB/E3jFPrR04sKRfzRKx/jQA7j/MihPOQa5+Xs74F
 0GgXfeN+lDdU2Gs/hQze5S7koNIraVZRxH0kFQ3nT4g+mt8bO/SB7FUo2XSHkxmN
 +1HUPFeyrWPnc+0ZQb6Qigl4qP9O+CY2zQVFRzaOp+dHkBl8A3uM+p9XIilmfIv6
 tPIC3bSj2V0kHzqsDoYVQKGzUYy5teyVyemgE3q8sO0+GUp/J8EE5bGapw4iMMZq
 +3l1mTOxI5Sec8kSi6w4Ile64Rh7ITXevxDPqgoXJ7yq9tGZVndaaXgwj448nnUA
 ==
X-ME-Sender: <xms:Iw2-YMLB4VWUqQZzO985pEpbj8o6VPd9Ci0OWGRR5TduaFbtnCuq7w>
 <xme:Iw2-YMLnAYhJcFtmWahBrMZL9cwSSmCpjepUw4ljAhKTolbV0fl6MxzpjF2UuQUj_
 Ofx-dARGpQODw9pHLs>
X-ME-Received: <xmr:Iw2-YMtRQHnU45TaMtPodTCT2usv4X9A_LfYyaCeDXuZw60HTKG1KRS-EbVFXWLE2r48F_c4SYUO4fs__aq75Uk7ihgER4-JPkmT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtjedggeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Iw2-YJah5h_UePXZpbGIQgdSkdOOIlsEE0qjvih2CtERvBF2wh4hcw>
 <xmx:Iw2-YDZV6xCk3oBVhlWRk3rnOA5wGtVZYY6mUEPhy2540hL-G0HPJA>
 <xmx:Iw2-YFBocIU_-sAYpaRPrTM8PUOgjRppOnmUhcsErWx1TumMlonU2A>
 <xmx:JQ2-YJzQhjl_JXbJxXc-wX3Klz5FnHdw4ounZ_k54XtDqOOLUDmq6ynMGVc>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jun 2021 08:12:18 -0400 (EDT)
Date: Mon, 7 Jun 2021 14:12:16 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Drew Fustini <drew@beagleboard.org>, liush@allwinnertech.com,
 Wei Wu =?utf-8?B?KOWQtOS8nyk=?= <lazyparser@gmail.com>,
 wefu@redhat.com, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>,
 Atish Patra <atish.patra@wdc.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [RFC PATCH v2 10/11] riscv: soc: Add Allwinner SoC kconfig option
Message-ID: <20210607121216.ypoehirsdypul3br@gilmour>
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
 <1622970249-50770-14-git-send-email-guoren@kernel.org>
 <20210607071916.kwdbtafbqp3icgia@gilmour>
 <CAJF2gTT=aLNpwuQmOPw=L8eoezwX8DmGOunmPx0H_WzbaOpO+g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTT=aLNpwuQmOPw=L8eoezwX8DmGOunmPx0H_WzbaOpO+g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_051226_901887_4D79807F 
X-CRM114-Status: GOOD (  25.66  )
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
Content-Type: multipart/mixed; boundary="===============4895260653554518800=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4895260653554518800==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="secwxumdfbdnmyjv"
Content-Disposition: inline


--secwxumdfbdnmyjv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 07, 2021 at 03:43:03PM +0800, Guo Ren wrote:
> On Mon, Jun 7, 2021 at 3:19 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi,
> >
> > On Sun, Jun 06, 2021 at 09:04:08AM +0000, guoren@kernel.org wrote:
> > > From: Guo Ren <guoren@linux.alibaba.com>
> > >
> > > Add Allwinner kconfig option which selects SoC specific and common
> > > drivers that is required for this SoC.
> > >
> > > Allwinner D1 uses custom PTE attributes to solve non-coherency SOC
> > > interconnect issues for dma synchronization, so we set the default
> > > value when SOC_SUNXI selected.
> > >
> > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > Co-Developed-by: Liu Shaohua <liush@allwinnertech.com>
> > > Signed-off-by: Liu Shaohua <liush@allwinnertech.com>
> > > Cc: Anup Patel <anup.patel@wdc.com>
> > > Cc: Atish Patra <atish.patra@wdc.com>
> > > Cc: Christoph Hellwig <hch@lst.de>
> > > Cc: Chen-Yu Tsai <wens@csie.org>
> > > Cc: Drew Fustini <drew@beagleboard.org>
> > > Cc: Maxime Ripard <maxime@cerno.tech>
> > > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> > > Cc: Wei Fu <wefu@redhat.com>
> > > Cc: Wei Wu <lazyparser@gmail.com>
> > > ---
> > >  arch/riscv/Kconfig.socs      | 12 ++++++++++++
> > >  arch/riscv/configs/defconfig |  1 +
> > >  2 files changed, 13 insertions(+)
> > >
> > > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > > index ed96376..055fb3e 100644
> > > --- a/arch/riscv/Kconfig.socs
> > > +++ b/arch/riscv/Kconfig.socs
> > > @@ -69,4 +69,16 @@ config SOC_CANAAN_K210_DTB_SOURCE
> > >
> > >  endif
> > >
> > > +config SOC_SUNXI
> > > +     bool "Allwinner SoCs"
> > > +     depends on MMU
> > > +     select DWMAC_GENERIC
> > > +     select SERIAL_8250
> > > +     select SERIAL_8250_CONSOLE
> > > +     select SERIAL_8250_DW
> > > +     select SIFIVE_PLIC
> > > +     select STMMAC_ETH
> > > +     help
> > > +       This enables support for Allwinner SoC platforms like the D1.
> > > +
> >
> > We probably don't want to select DWMAC, STMMAC_ETH and the 8250 options,
> > looks good otherwise.
> >
> > Maxime
> Remove DWMAC, STMMAC_ETH is okay.
>=20
> But I think we still need:
> select SERIAL_8250_DW if SERIAL_8250

Well, even the UART is optional. Just enable them in the defconfig

Maxime

--secwxumdfbdnmyjv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYL4NIAAKCRDj7w1vZxhR
xXytAP4mGdQrlps0ZkdQRDvgGoPmv63wCOgw7ukUbY9jEwIJGAEAwSHuyXFN1JP5
4ZeSdV0JY7fJXuRP01GiYXItu7FXhg8=
=/iVS
-----END PGP SIGNATURE-----

--secwxumdfbdnmyjv--


--===============4895260653554518800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4895260653554518800==--

