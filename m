Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAD8C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 15:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xw3eyowbyTXH6CCeyNrz9BbPKIhbX6BZehP3ZxQl4Ko=; b=ZQiqMn5t40UTCtkyUBvaVidrtn
	fzOUooxbjhCwXcw71X9zitoIuzCLntQAYyNmsTDttoqr4rwOqsx3wXQfYGJpogvWu9fp6n4+BuQo8
	Ko7I5etKBXS2gge0JTEHHCaJcrvmNpA2lnrKCV6UJoiUR/sqIReXWWC9Vc7Z5GxjTz2XBT26QCheX
	JhaodhDV3eJ3Q0HoXp1X9god5tFZKvDMQtjdWPM2lxQ9jjVI/OfXlnh+P8+XLE/2EgzM1GM/dKEHg
	7iHMBhbY/khFxD1D2q/FH4PtIeRCnmQ2Sm++Sg35RlrOIwt7ybnirpP9hrU+JYHbWpdIW6OLo3Ee6
	XKtePHyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzITZ-00000000cMc-2z1R;
	Tue, 23 Apr 2024 15:54:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzITW-00000000cLF-0iGu
	for linux-riscv@lists.infradead.org;
	Tue, 23 Apr 2024 15:54:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 037FC614ED;
	Tue, 23 Apr 2024 15:54:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E224C116B1;
	Tue, 23 Apr 2024 15:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713887668;
	bh=ygI09t554nLoyr6BkmW7OLrmKfZMJOQw1a4wokqN6Zw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eHVcwrr3RiJYhKjscVZo+51SROohKtrZd5sgQRoiG0GWmNdjLzMpcXdJnEyl5KSRe
	 4X63eAqmtA8PT7Fvo6pRkUCuAEcjNq7jTdJpPQnV3u0ZRUynku/5beXpTvP8o3D9H6
	 pJadn+GdCeRNfMYolqVjG71p5INF+GexAyzPmMyUwFWWC5fcSlybNdYFmADibv4NtA
	 IcnpjjGTRofh+HFe6AuR+OIMXca1nPH2N1xFVMd6grvHanqWu+qcU28GqnPrUfmrUd
	 3QU0qmHFEfT4kvvp5a2N5cftLxr5StDZ08py9RG3EEBNcQCZw2eJE9YVglE7kgHF6i
	 okMJUfFaEx50Q==
Date: Tue, 23 Apr 2024 16:54:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	leyfoon.tan@starfivetech.com, jeeheng.sia@starfivetech.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] cache: Add StarFive StarLink cache management for
 StarFive JH8100
Message-ID: <20240423-clique-despair-ead97b78b186@spud>
References: <20240423072639.143450-1-joshua.yeong@starfivetech.com>
 <20240423072639.143450-2-joshua.yeong@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20240423072639.143450-2-joshua.yeong@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_085430_349920_0ACCAE70 
X-CRM114-Status: GOOD (  12.20  )
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
Content-Type: multipart/mixed; boundary="===============6674135141155442231=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6674135141155442231==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="i/ONzq50GI9VXLjz"
Content-Disposition: inline


--i/ONzq50GI9VXLjz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 23, 2024 at 03:26:38PM +0800, Joshua Yeong wrote:
> +
> +#include <asm/dma-noncoherent.h>
> +
> +#define STARLINK_CACHE_FLUSH_START_ADDR			0x0
> +#define STARLINK_CACHE_FLUSH_END_ADDR			0x8
> +#define STARLINK_CACHE_FLUSH_CTL			0x10
> +#define STARLINK_CACHE_CACHE_ALIGN			0x40
> +
> +#define STARLINK_CACHE_ADDRESS_RANGE_MASK		GENMASK(39, 0)
> +#define STARLINK_CACHE_FLUSH_CTL_MODE_MASK		GENMASK(2, 1)
> +#define STARLINK_CACHE_FLUSH_CTL_ENABLE_MASK		BIT(0)
> +
> +#define STARLINK_CACHE_FLUSH_CTL_CLEAN_INVALIDATE	0
> +#define STARLINK_CACHE_FLUSH_CTL_MAKE_INVALIDATE	1
> +#define STARLINK_CACHE_FLUSH_CTL_CLEAN_SHARED		2
> +#define STARLINK_CACHE_FLUSH_TIMEOUT_US			5000000
> +
> +struct starlink_cache_priv {
> +	void __iomem *base_addr;
> +};
> +
> +static struct starlink_cache_priv starlink_cache_priv;
> +
> +static void starlink_cache_flush_complete(void)
> +{
> +	volatile void __iomem *_ctl = starlink_cache_priv.base_addr +

Why does this variable have an _ prefix?

> +                                      STARLINK_CACHE_FLUSH_CTL;

This link only has spaces, it should be tabs + < 8 spaces.

> +	u64 v;
> +
> +	if (readq_poll_timeout_atomic((_ctl), v,
> +	    !(v & STARLINK_CACHE_FLUSH_CTL_ENABLE_MASK), 1,
> +	    STARLINK_CACHE_FLUSH_TIMEOUT_US))
> +		WARN(1, "StarFive Starlink cache flush operation timeout\n");
> +}

I'd fine this easier to read as:

static void starlink_cache_flush_complete(void)
{
	volatile void __iomem *_ctl = starlink_cache_priv.base_addr +
				      STARLINK_CACHE_FLUSH_CTL;
	u64 v;
	int ret;

	ret = readq_poll_timeout_atomic(_ctl, v, !(v & STARLINK_CACHE_FLUSH_CTL_ENABLE_MASK),
					STARLINK_CACHE_FLUSH_POLL_DELAY_US,
					STARLINK_CACHE_FLUSH_TIMEOUT_US);
	if (ret)
		WARN(1, "StarFive Starlink cache flush operation timeout\n");
}

Cheers,
Conor.


--i/ONzq50GI9VXLjz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZifZsAAKCRB4tDGHoIJi
0kwUAP9bkTUM8ATatR50WkFrHITbtXJUqI6lq/ynn3qCblRkwAD/UXOExyXwpn1X
kW+/o0c8/SZKNz5wUqVXAWo0PcC+CQg=
=gZdu
-----END PGP SIGNATURE-----

--i/ONzq50GI9VXLjz--


--===============6674135141155442231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6674135141155442231==--

