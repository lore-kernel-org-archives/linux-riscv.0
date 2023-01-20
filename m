Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF11CC05027
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 10:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SzIZBFM9EDfaonehoJka8mBiC64OmmpEp+zBlnzYEA=; b=d+Ug9sfla6te2f/4eB8VpDujXR
	s2Q4enR4wK9LuMNo8k86uX08c1/Rt7abT0KfSL1rFIspqlj26per1HUgzJivEwQXsZE5+GuR4W9ce
	QcHk6/x2pTA8IwdcehjZ+IgGsBvII4U8jW6G5OshRa2JzKCw4dw+FvYB7KJJfrnSfTSABC8x6wXbg
	SpWw6ZoPTvysZT/Qqe8qPKaCcrr5BN0j3EDhNU0guP2xuXhrjmhLzPa5J1mZPbY/WlUfA/TYzh29R
	830STCuRQG1wubV11vxy3Ssxko/MSVXrH6wCQYDm7TSoi93OwBk3af+Z3Zb1ZGtpBiESd5Fzs75X7
	TnH0LO5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIoym-009t1E-U5; Fri, 20 Jan 2023 10:50:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIoyk-009sye-1h
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 10:50:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674211838; x=1705747838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HVxjOlrNxTX4w4hEmxDKY12/recHY5kWHUzbvS7si4c=;
  b=QEFpv8+tOv0kOk/CMbCBTdJUxUO7KBBzs3qSPLrIGW0Nr0Z95Va+/I3/
   i0j8jD4vOeHfhbKo3/HZGXRDg71urbbsa3zCaiiI1mjJudC7sGvl8CtPt
   froaQQVCDWIQVleIYTjsPU7QLNnaDA97KmVVi9zGmO38qFG6upBIJrXEz
   qeIASYQ/FNP8Ut9NZJh2juXgbE5rPYX6cN5++U76cZElVjHaG9i4dPWEi
   J5RXN5WVUFSSpQO+e/QMkddDezZ7OS1u82IfK2jZl4Levej9/iwCXw6uX
   X/R3quYkvWY/ZVKhvt4kMPogdMnQBQ60ve8+/NqbeuxxaZf58lKosaPGn
   w==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669100400"; 
   d="asc'?scan'208";a="196679949"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jan 2023 03:50:26 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 03:50:25 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Fri, 20 Jan 2023 03:50:24 -0700
Date: Fri, 20 Jan 2023 10:50:01 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: shravan kumar <shravan.chippa@microchip.com>
CC: <green.wan@sifive.com>, <vkoul@kernel.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <dmaengine@vger.kernel.org>
Subject: Re: [PATCH v1] dmaengine: sf-pdma: pdma_desc memory leak fix
Message-ID: <Y8px2Qky3GZ5wazl@wendy>
References: <20230120100623.3530634-1-shravan.chippa@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20230120100623.3530634-1-shravan.chippa@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_025038_195418_18305595 
X-CRM114-Status: GOOD (  12.25  )
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
Content-Type: multipart/mixed; boundary="===============4890171932064071901=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4890171932064071901==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OF1t+SvYHzumvf3V"
Content-Disposition: inline

--OF1t+SvYHzumvf3V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Shravan,

On Fri, Jan 20, 2023 at 03:36:23PM +0530, shravan kumar wrote:
> From: Shravan Chippa <shravan.chippa@microchip.com>
>=20
> Commit b2cc5c465c2c ("dmaengine: sf-pdma: Add multithread support for a
> DMA channel") changed sf_pdma_prep_dma_memcpy() to unconditionally
> allocate a new sf_pdma_desc each time it is called.
>=20
> The driver previously recycled descs, by checking the in_use flag, only
> allocating additional descs if the existing one was in use. This logic
> was removed in commit b2cc5c465c2c ("dmaengine: sf-pdma: Add multithread
> support for a DMA channel"), but sf_pdma_free_desc() was not changed to
> handle the new behaviour.
>=20
> As a result, each time sf_pdma_prep_dma_memcpy() is called, the previous
> descriptor is leaked, over time leading to memory starvation:
>=20
>   unreferenced object 0xffffffe008447300 (size 192):
>   comm "irq/39-mchp_dsc", pid 343, jiffies 4294906910 (age 981.200s)
>   hex dump (first 32 bytes):
>     00 00 00 ff 00 00 00 00 b8 c1 00 00 00 00 00 00  ................
>     00 00 70 08 10 00 00 00 00 00 00 c0 00 00 00 00  ..p.............
>   backtrace:
>     [<00000000064a04f4>] kmemleak_alloc+0x1e/0x28
>     [<00000000018927a7>] kmem_cache_alloc+0x11e/0x178
>     [<000000002aea8d16>] sf_pdma_prep_dma_memcpy+0x40/0x112
>=20
> Add the missing kfree() to sf_pdma_free_desc(), and remove the redundant
> in_use flag.
>=20
> Fixes: b2cc5c465c2c ("dmaengine: sf-pdma: Add multithread support for a D=
MA channel")
> Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--OF1t+SvYHzumvf3V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8pxygAKCRB4tDGHoIJi
0qXaAQDZziGG9P3c05/6Z1kseB+iYCmBwoVXkIs3fvUu4pMVbAEAuy3QU4BuPBtT
yRzTBRue4wpLPBr8+CnJMHfbDl0n4wM=
=S7BN
-----END PGP SIGNATURE-----

--OF1t+SvYHzumvf3V--


--===============4890171932064071901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4890171932064071901==--

