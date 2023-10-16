Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB98CDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 13:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+AzvwdvMeN1iXM8ICmlUaMqrqkWCpCymObmkSolUngY=; b=CaNkhehB5jbg0amvsdR9Drl/nr
	gtHQID/2djewkfJKOwLxdWkaXHSArsk812cpr6itKtWbFgTh07NBNjiVvBtZy41qbJ+9AZkOefEHt
	CI2XhEYI68kjqsWo0SoeVCvSiYAgO2V9os2JPIcIKSpnxhZLewRLTRQyJClXVTgfuw7bnaBHIrLS1
	IK4HeRMLdiKqiw9Yxo6v2/4KN+eapxG2NdI+8aoNHKSLyVmOzabWow8UY9G26h7Bjcu8axpdKHfaz
	s8B6HuTGYeG7ZsSz90hKVFJsQZDzNiUsAdzITy8pfbqyPkJ9nZb2FU4QwyIVOpYB814/NUDDgTHYZ
	CWRvlqLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsNg7-009kED-0W;
	Mon, 16 Oct 2023 13:30:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsNg4-009kDp-0T
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 13:30:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1697463035; x=1728999035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L74gHPCkBuK8xNMGAh1zvXNAucTnSwRTolNX+SQdDIY=;
  b=l5PCrf0OCqFSZsL1fYO3uU/sreExzp4aMm0gn4RbJzygmhrPmn+NBbZ6
   ej1K4mktmD32Jv5DClYCliRM6w9QsGnjKFvO/nGbNlYcHzJZjtTDx9uER
   BPlS2sMKilzDx1xVdzhbg2c+TBcNvpsoOdMg2dFs5+QS03MtYrVXLkQsS
   oPEjI058+XPL+RWxa0uEO79r2tTN+BHQCRUbvJtF2FC7F/txUfVhlepDe
   3ZTn/XxKPgv0jEcTOO32my/4EEnFymy/Cnd/8jufQWmFX5aUG9RfBNLOd
   LJ5zh8zXtz5QBVzdRJAAIkbu39ed3lEwbcMEE4dIRVFmvgBqJuvlPPzav
   w==;
X-CSE-ConnectionGUID: 6cXb+oOzSa6V6Bq0KOVSUA==
X-CSE-MsgGUID: LgC+lP7BTB+nfnKJPbMbig==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="asc'?scan'208";a="10554384"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Oct 2023 06:30:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 16 Oct 2023 06:30:30 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 16 Oct 2023 06:30:29 -0700
Date: Mon, 16 Oct 2023 14:30:07 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Nam Cao <namcao@linutronix.de>
CC: Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Jia
 Jie Ho <jiajie.ho@starfivetech.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: Kconfig: Add select ARM_AMBA to SOC_STARFIVE
Message-ID: <20231016-scrunch-sabotage-27e12b446c47@wendy>
References: <20230525061836.79223-1-jiajie.ho@starfivetech.com>
 <20230709-rundown-unsettled-403e8bf5cca5@spud>
 <20231016132613.m8o1+AMG@linutronix.de>
MIME-Version: 1.0
In-Reply-To: <20231016132613.m8o1+AMG@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_063036_308913_5C312A71 
X-CRM114-Status: GOOD (  15.01  )
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
Content-Type: multipart/mixed; boundary="===============8224227347705793255=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8224227347705793255==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MWRFTSvKhAmZnZ/b"
Content-Disposition: inline

--MWRFTSvKhAmZnZ/b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2023 at 03:26:13PM +0200, Nam Cao wrote:
> On Sun, Jul 09, 2023 at 11:10:47PM +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > On Thu, 25 May 2023 14:18:36 +0800, Jia Jie Ho wrote:
> > > Selects ARM_AMBA platform support for StarFive SoCs required by spi a=
nd
> > > crypto dma engine.
> > >=20
> > >=20
> >=20
> > Applied to riscv-soc-for-next, thanks!
> >=20
> > [1/1] riscv: Kconfig: Add select ARM_AMBA to SOC_STARFIVE
> >       https://git.kernel.org/conor/c/1fcaaa1d489c
> >=20
> > Thanks,
> > Conor.
>=20
> Sorry if it's a stupid question, but did this patch get lost somehow? It
> hasn't made it to Linus's tree, and there is this message in your tree:
> "Notice: this object is not reachable from any branch."

No, it is not a stupid question sadly. I screwed up and forgot to send a
PR for that branch to Arnd, only realising _after_ the merge window had
closed already. It'll be in 6.7, the branch got rebased so the hash is
no longer valid.

--MWRFTSvKhAmZnZ/b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS063wAKCRB4tDGHoIJi
0qJPAP4xIZq34xZVWYByUGebA+um/WpfShd4dQRjxtzcfVPaBwD/dI/ACmp8MGZU
ycygHR0nvv/4WtirGpx8EI2eKvabOgo=
=/5xt
-----END PGP SIGNATURE-----

--MWRFTSvKhAmZnZ/b--


--===============8224227347705793255==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8224227347705793255==--

