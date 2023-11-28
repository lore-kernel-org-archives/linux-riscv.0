Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7676C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 11:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVp8KWieX/trPgxsqmIDoNeWsjZ6nHie1uGg63MMjPc=; b=uZKvieqFBvU9IxU8krwe5CJkDo
	dniTWzyyiOA3JgvwfFa1lDuH5e2Z3/rm9WhIiNhhCdDGEnvJNk4oYIUMLptpJiOnvoeuMh7zET0jo
	/TrkCBzRjxLS3FGcQj+I/AxMGVgIMbB+sGCJw9nQV2TpeCnHNEO0O6qL2BX9etnvE+LhwVGvW2+bw
	2eBnZixHP/FeDeeAF0r7lcGrj1pPQjBbeUax3L/WuWGvTFoNOVfCLaQYFgbDnhLiw+kTkhzLaRh2L
	puMu/tZvY59CNV1LeylJ7F935bRV4vhsGTXRIYbfN9eMBQLARgvldQ8yQAFJkzhmi/58+yK1GYjrT
	U3iKB7Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7vpL-004zci-2J;
	Tue, 28 Nov 2023 11:00:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7vpI-004zbV-06
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 11:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1701169224; x=1732705224;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ju4q9Np0g+GExAiNW7U8BnmxssgNRro0n3fZCX/XO0E=;
  b=PN9o8cBkWxtXDMFDVHp2mNAMLW+P7qGfgSNuqZvSBAI67zT3N8qxevWH
   mvq3jBmqpqTEnE31aENg/MueJoF42oEy/HkRl6a7oYqk4dIe904RnIxz9
   DC4CwiNB8ZORZzd1dYOJ/BlumMFeFOabcg9s7TMsOvksyIWsK+fRb+Jch
   o0dGMhHvtx12VGlQ5aUcko0s6KXKhZDhlD54xH2xdSc067BCI1McT1iEW
   q6Y+umC0RHMdlDhYHVqQBQECeosV7PP8AC63XmJHXdXsZQkePUptsHeGn
   mWuttc3/FIH8lkiinMg6CYs/RFtLNaI6ICav9i4u0aMOCgPMdaRSG2wxW
   Q==;
X-CSE-ConnectionGUID: FuQ6AW+5TlCMn49POgamoQ==
X-CSE-MsgGUID: 4qyKv6pGQZm7ZXNIOjqjwQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="asc'?scan'208";a="243074126"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Nov 2023 04:00:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Nov 2023 04:00:14 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 28 Nov 2023 04:00:12 -0700
Date: Tue, 28 Nov 2023 10:59:44 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Nam Cao <namcao@linutronix.de>
CC: Jia Jie Ho <jiajie.ho@starfivetech.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: Kconfig: Add select ARM_AMBA to SOC_STARFIVE
Message-ID: <20231128-grandma-guru-4fc6e6950a75@wendy>
References: <20230525061836.79223-1-jiajie.ho@starfivetech.com>
 <20231128102722.fQizGKfo@linutronix.de>
MIME-Version: 1.0
In-Reply-To: <20231128102722.fQizGKfo@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_030024_094327_443457A7 
X-CRM114-Status: GOOD (  20.06  )
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
Content-Type: multipart/mixed; boundary="===============1506905336503619329=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1506905336503619329==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="omVPbJ2Lyr3mnpXp"
Content-Disposition: inline

--omVPbJ2Lyr3mnpXp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 11:27:22AM +0100, Nam Cao wrote:
> On Thu, May 25, 2023 at 02:18:36PM +0800, Jia Jie Ho wrote:
> > Selects ARM_AMBA platform support for StarFive SoCs required by spi and
> > crypto dma engine.
> >=20
> > Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> > ---
> >  arch/riscv/Kconfig.socs | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index 1cf69f958f10..381cd46e6373 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -29,6 +29,7 @@ config SOC_STARFIVE
> >  	bool "StarFive SoCs"
> >  	select PINCTRL
> >  	select RESET_CONTROLLER
> > +	select ARM_AMBA
> >  	help
> >  	  This enables support for StarFive SoC platform hardware.
>=20
> I'm considering sending this to stable trees. Without this, it is not
> possible to configure the kernel with SPI driver for the starfive board.
>=20
> I just want to check with you first, in case I miss something obvious.
> Any objection to backporting this patch?

Personally I would be okay with that, otherwise the driver is dead code
in those stable versions. Just be sure that the rename of some pl011
variables (I think that's what it was) that was a pre-req for this being
merged is in said versions of stable. An allmodconfig should flag
whether that has happened pretty quickly.

--omVPbJ2Lyr3mnpXp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWXIHwAKCRB4tDGHoIJi
0tIeAP0Qk6kC+Ph4/2dh6HoswPR2MR7gF+g4jYowYymzMnpjGgD/Ta9CcqG6AtL4
G2djjaaTDhNFaiNDoiAAcZ7Y62SUCA8=
=Ertc
-----END PGP SIGNATURE-----

--omVPbJ2Lyr3mnpXp--


--===============1506905336503619329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1506905336503619329==--

