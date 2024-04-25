Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B90C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 09:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olOQy41xgqJrAbSS370r1Cnmrts4KT1PNGozgFXsc6E=; b=or4LfmY0CHndFgpQbYCgQ0A5an
	tfhjs4PJd6bcsy4BSeebMUPNwqYhTTs23DBXSgsT+F9kD+RtPwY6/hC3287ylH1ke2sbWp0j+I14S
	r5T97Xi8UNIleK4uw+E+vJQnYWnWr6iikZaw1d9GmjfOYdck5B5SXPu+d01x3Z3F9PzxIkplBNBK9
	tGDgrqwIwOJ14M9B92DIF3s63iwsi5SGIYX+55il7LC60Ox9HDOmNjC1oLd7SHgxgb/w9f4Ldc4XF
	d/01HBHtHayfbu5jqD62mmJBoDWTEKlXZpgZ663M0NQbY6G4sVTi5uHLPTPYkILYOtxO4StZAHPIm
	D3U5cugg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzuyR-00000007Vud-2tRv;
	Thu, 25 Apr 2024 09:00:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzuyO-00000007VuA-020x
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 09:00:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1714035656; x=1745571656;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wPeg0IqiY+o/vc4YdB3Yt/sWLRBKKZcicUVDHUyXfR8=;
  b=0NPNd0SLFShzieqLAS4jnL1OxSMFEuHYXy+Y80urb9fRFpYZRmx3Cv85
   jaa8mHV//wpUWSnRGgajWkf6EafAHwNuQ1Td6m/ZiDAPErGc3e+/zXrDm
   v6JloNAuQl0yB7EC9PWHZ69YM8H7/3A7uMe9Dc2s8tapzCifbgagSv/sy
   eCaYNZL/nUtZ2m6ccr4/aX5ch675ss/PcTvrZsAV/ivFV9mJ4DMgeBsX2
   5dQJhFPmJEiywfUQRqijEcfWARnEhizi8M+WC/pES2fmkbGolKhqaMh/L
   u7fOPQfc97spGnIFgoCSuNRAYrliIhJPGJma1xat3DzRYkpUVhWaUyAvr
   A==;
X-CSE-ConnectionGUID: /8g22YwRTJWm2ALCCzb01w==
X-CSE-MsgGUID: vJF5Dj9pTq+mEs5pThBumA==
X-IronPort-AV: E=Sophos;i="6.07,228,1708412400"; 
   d="asc'?scan'208";a="22604673"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Apr 2024 02:00:53 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 02:00:29 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 25 Apr 2024 02:00:26 -0700
Date: Thu, 25 Apr 2024 10:00:10 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
CC: <jszhang@kernel.org>, <guoren@kernel.org>, <wefu@redhat.com>,
	<andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <miquel.raynal@bootlin.com>,
	<thomas.petazzoni@bootlin.com>, <linux-riscv@lists.infradead.org>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Drew Fustini
	<dfustini@tenstorrent.com>
Subject: Re: [PATCH 0/4] Add I2C support on TH1520
Message-ID: <20240425-boxcar-maroon-f07c5aba9272@wendy>
References: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_020056_178153_7C24F89E 
X-CRM114-Status: GOOD (  13.35  )
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
Content-Type: multipart/mixed; boundary="===============5681633717983868330=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5681633717983868330==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ChY57WC1c4Rd39Ve"
Content-Disposition: inline

--ChY57WC1c4Rd39Ve
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 25, 2024 at 10:21:31AM +0200, Thomas Bonnefille wrote:
> This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
> and a default configuration for the BeagleV-Ahead. It appears that the
> TH1520 I2C is already supported in the upstream kernel through the
> Synopsis Designware I2C adapter driver.

> As there is no clock driver for this board as of today, this patch
> series uses a fixed-clock named i2c_ic_clk.
> There is also no pinctrl driver yet so pinmux must be handled manually
> for now.

https://lore.kernel.org/linux-riscv/20240103132852.298964-1-emil.renner.berthing@canonical.com/
https://lore.kernel.org/linux-riscv/20240110-clk-th1520-v1-0-8b0682567984@tenstorrent.com/

These seem to be the most recent versions of each. I guess they're both
just waiting for their authors to have the time to get another version
written.

--ChY57WC1c4Rd39Ve
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiobjwAKCRB4tDGHoIJi
0m3oAP4tAD2kosaFcYvaXiFZn6dyRnma6alALn7IOrD+fGMjIAD+J6CU6uKzRjBl
1LEW+b76173fZg3Ov1Ds6FNSXUQKLg8=
=i8Ye
-----END PGP SIGNATURE-----

--ChY57WC1c4Rd39Ve--


--===============5681633717983868330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5681633717983868330==--

