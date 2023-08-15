Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0510FC0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 13:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnudYcQNDWoxSQ0upgBl/ke/pEZaKAp0B61ES5V1RdY=; b=TxE7fNh6mSAwBIOOvDRJAzWubX
	njMzL3RD1bRUj15uGlDFRBm2sCOLbeTzJRtf0gcXo+VxyZdlQO4zgt9cph6+/SCr4/ae+Zqhq/yjS
	ksQ6Epp5VKjc7swmZ0KMjubemjz47KqAraxKPlTLGAlNziOJFtE2AaffECpm+R+IQthuwwHWAPAY+
	0Oc/iUivBM9h2/DTgHZidlcgEuJgZanI2VqPhB6KUF3ArLBGfO/znXTQnkwXoWeHn6PDx4QsfMZao
	oOqQaOZdvSa4fbHGagzGGLFIfBcYxwYvfPKICZszud2whE8VcfgKYxZopD+YzDHy8c0Orkgjy0D4f
	dGyUHBbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVtpQ-001fOi-18;
	Tue, 15 Aug 2023 13:11:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVtpN-001fOK-1E
	for linux-riscv@lists.infradead.org;
	Tue, 15 Aug 2023 13:11:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AAA75614EA;
	Tue, 15 Aug 2023 13:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D53C433C7;
	Tue, 15 Aug 2023 13:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692105076;
	bh=fxLQn7G8NKCIulwKp9YBaEwTHFcd16tQqNSCGDeE3/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mctXEb2qdlOCfYwVyM1iF+Jo9WO8j6aRzuEBwJEAJX8XXUVabnZIlbpiYuGKOx2Lt
	 Ouw99X+Pq5Vdeo1qUTDRmn3x8elOW7mJ7uORHH5L99BMTfGUT/TdTifUot+otgJYme
	 d1TNeKS/ZT6KVQH18h/hXXkeFT5YSMX4hNbMYmNWSF/n+iZpUgt79or2pw6iguVpDb
	 f1OWUk0wFWWoQuOhSNM6Ia62+uAjwJ/Dr/pikln1fgEBghlnKMAarCcHz5ARAXgYwQ
	 YyJfk1nZChIEtz66Murubc3iyFhL6eXJIpZsBL5+6/4jPzPZiTwLLK8S6BkpT4C9+L
	 kqX9hVC45IgvQ==
Date: Tue, 15 Aug 2023 14:11:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v3 06/11] PCI: plda: Add event interrupt codes and IRQ
 domain ops
Message-ID: <20230815-five-comment-cff5fb01909f@spud>
References: <20230814082016.104181-1-minda.chen@starfivetech.com>
 <20230814082016.104181-7-minda.chen@starfivetech.com>
 <20230814-episode-untidy-c66107a33ea0@wendy>
 <f983f3cc-ebb5-18fb-891a-adc073742bb9@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <f983f3cc-ebb5-18fb-891a-adc073742bb9@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_061117_527707_8AA3A35A 
X-CRM114-Status: GOOD (  21.51  )
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
Content-Type: multipart/mixed; boundary="===============2918528099131175195=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2918528099131175195==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y/9ZHub3+HOs9Hmr"
Content-Disposition: inline


--y/9ZHub3+HOs9Hmr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 15, 2023 at 06:12:07PM +0800, Minda Chen wrote:
>=20
>=20
> On 2023/8/14 21:52, Conor Dooley wrote:
> > On Mon, Aug 14, 2023 at 04:20:11PM +0800, Minda Chen wrote:
> >> For PolarFire implements non-PLDA local interrupt events, most of
> >> event interrupt process codes can not be re-used. PLDA implements
> >> new codes and IRQ domain ops like PolarFire.
> >>=20
> >> plda_handle_event adds a new IRQ num to event num mapping codes for
> >> PLDA local event except DMA engine interrupt events. The DMA engine
> >> interrupt events are implemented by vendors.
> >>=20
> >> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> >> ---
> >>  .../pci/controller/plda/pcie-microchip-host.c | 29 +++---
> >>  drivers/pci/controller/plda/pcie-plda-host.c  | 99 +++++++++++++++++++
> >>  drivers/pci/controller/plda/pcie-plda.h       | 19 ++++
> >>  3 files changed, 133 insertions(+), 14 deletions(-)
> >>=20
> >> diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drive=
rs/pci/controller/plda/pcie-microchip-host.c
> >> index c28840315019..b42f1aac3ec3 100644
> >> --- a/drivers/pci/controller/plda/pcie-microchip-host.c
> >> +++ b/drivers/pci/controller/plda/pcie-microchip-host.c
> >> @@ -96,20 +96,21 @@
> >>  #define EVENT_LOCAL_DMA_END_ENGINE_1		12
> >>  #define EVENT_LOCAL_DMA_ERROR_ENGINE_0		13
> >>  #define EVENT_LOCAL_DMA_ERROR_ENGINE_1		14
> >> -#define EVENT_LOCAL_A_ATR_EVT_POST_ERR		15
> >> -#define EVENT_LOCAL_A_ATR_EVT_FETCH_ERR		16
> >> -#define EVENT_LOCAL_A_ATR_EVT_DISCARD_ERR	17
> >> -#define EVENT_LOCAL_A_ATR_EVT_DOORBELL		18
> >> -#define EVENT_LOCAL_P_ATR_EVT_POST_ERR		19
> >> -#define EVENT_LOCAL_P_ATR_EVT_FETCH_ERR		20
> >> -#define EVENT_LOCAL_P_ATR_EVT_DISCARD_ERR	21
> >> -#define EVENT_LOCAL_P_ATR_EVT_DOORBELL		22
> >> -#define EVENT_LOCAL_PM_MSI_INT_INTX		23
> >> -#define EVENT_LOCAL_PM_MSI_INT_MSI		24
> >> -#define EVENT_LOCAL_PM_MSI_INT_AER_EVT		25
> >> -#define EVENT_LOCAL_PM_MSI_INT_EVENTS		26
> >> -#define EVENT_LOCAL_PM_MSI_INT_SYS_ERR		27
> >> -#define NUM_EVENTS				28
> >> +#define NUM_MC_EVENTS				15
> >> +#define EVENT_LOCAL_A_ATR_EVT_POST_ERR		(NUM_MC_EVENTS + EVENT_A_ATR_=
EVT_POST_ERR)
> >> +#define EVENT_LOCAL_A_ATR_EVT_FETCH_ERR		(NUM_MC_EVENTS + EVENT_A_ATR=
_EVT_FETCH_ERR)
> >> +#define EVENT_LOCAL_A_ATR_EVT_DISCARD_ERR	(NUM_MC_EVENTS + EVENT_A_AT=
R_EVT_DISCARD_ERR)
> >> +#define EVENT_LOCAL_A_ATR_EVT_DOORBELL		(NUM_MC_EVENTS + EVENT_A_ATR_=
EVT_DOORBELL)
> >> +#define EVENT_LOCAL_P_ATR_EVT_POST_ERR		(NUM_MC_EVENTS + EVENT_P_ATR_=
EVT_POST_ERR)
> >> +#define EVENT_LOCAL_P_ATR_EVT_FETCH_ERR		(NUM_MC_EVENTS + EVENT_P_ATR=
_EVT_FETCH_ERR)
> >> +#define EVENT_LOCAL_P_ATR_EVT_DISCARD_ERR	(NUM_MC_EVENTS + EVENT_P_AT=
R_EVT_DISCARD_ERR)
> >> +#define EVENT_LOCAL_P_ATR_EVT_DOORBELL		(NUM_MC_EVENTS + EVENT_P_ATR_=
EVT_DOORBELL)
> >> +#define EVENT_LOCAL_PM_MSI_INT_INTX		(NUM_MC_EVENTS + EVENT_PM_MSI_IN=
T_INTX)
> >> +#define EVENT_LOCAL_PM_MSI_INT_MSI		(NUM_MC_EVENTS + EVENT_PM_MSI_INT=
_MSI)
> >> +#define EVENT_LOCAL_PM_MSI_INT_AER_EVT		(NUM_MC_EVENTS + EVENT_PM_MSI=
_INT_AER_EVT)
> >> +#define EVENT_LOCAL_PM_MSI_INT_EVENTS		(NUM_MC_EVENTS + EVENT_PM_MSI_=
INT_EVENTS)
> >> +#define EVENT_LOCAL_PM_MSI_INT_SYS_ERR		(NUM_MC_EVENTS + EVENT_PM_MSI=
_INT_SYS_ERR)
> >> +#define NUM_EVENTS				(NUM_MC_EVENTS + NUM_PLDA_EVENTS)
> >=20
> > Is this change not in the wrong patch & should be changed alongside the
> > movement of defines?=20
> EVENT_xxx is new added one for PLDA codes and The event num start from 0.=
 This add association to PLDA events.
> Maybe this can be moved to patch8 or a new patch.

It feels like it should be in patch 3 to me.

--y/9ZHub3+HOs9Hmr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNt5XAAKCRB4tDGHoIJi
0ibSAQDzTMya4WyGRaKayC8dXzfWOFoV0m26PddhCyqWuBme3wD+Knf7YQM8iaqS
nlBsWj+sLO1ExkovRY+V/9w6aPl/CgI=
=+JHy
-----END PGP SIGNATURE-----

--y/9ZHub3+HOs9Hmr--


--===============2918528099131175195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2918528099131175195==--

