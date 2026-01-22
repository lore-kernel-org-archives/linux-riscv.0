Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44C0D3EE66
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 13:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jy8UfyL2Ck0KB5RS00Vvf52OF+vkNRWPn7fKRMr2lj4=; b=ZXKrDcUkS8+OL5QDXDdV4i41kf
	Gh8MSn7MLl3OZb6gSAtQAK0fs1QPBg/mvwq+1KzPI69U8Vor4GeCnMCXjlYk+52YfOFQfmy6ZhazS
	9eSZ4V2CNB09fujsLjTDAVIrUTxQVOUB/0uU6FUe4EWVOnWVqv0uBDZQ+Jg/JIrAqe9/IuZcvYEyY
	O4DWxKPGRBX6YI9DbyEHChAf+OTLaliMKGYPlPHInRfwNAOTvVWTg/ba0h74tZUXSmcvOo80C87I0
	AxACf59HYqw4S9/jDEX0fiNayQKNm+FddD0fXPoyW8VOhHrVio76Gjk8ww3ebsyzos/m1Hx3WEVv3
	1x21GNnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuk4-000000079N7-2GyN;
	Thu, 22 Jan 2026 13:28:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuk3-000000079Me-3Qwp
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 13:28:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A9C3A600C4;
	Thu, 22 Jan 2026 13:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 454A8C116D0;
	Thu, 22 Jan 2026 13:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769088534;
	bh=52bFlLCjpaAqJM6IZE7KAn/Q37ooiXw/wizRM6zt/xQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K6yDXSO1YpUO26K5U/Gq8/6AzV+Ef0rfUJ7IdRd9v5VgaGoMEa1D8Zo3an5DMseVu
	 0/PaTPWxG3G49Y6z4bsTkivp02iNzrkf30npoQaYQbkqdFtjUDWxn0b9/8/i06jiQY
	 1/TiT9oZ3Wp6Fz+m55hv2Q3QovoEO97ySPzR1DjFx1+Xui+vk/GpppYVp/RZovnf4i
	 lqtMhKv7HvIkP8fDhmtu1fDz6U9cf/BxeZyadYOaZncwS1zlwdjwEBbZgBn0+oVtWJ
	 gdSrw1ajtAuddT3pi+KWYuPxkdpmF2t1jForPUDwT45GsCcvrJxqY3KU4sXvvWxxJ4
	 C9aPiVCeWIFuA==
Date: Thu, 22 Jan 2026 13:28:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Guodong Xu <guodong@riscstar.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/4] regulator: spacemit-p1: Fix voltage ranges and
 support board power tree
Message-ID: <2e2c2754-fd3e-4fd3-aae4-d7af63e3b528@sirena.org.uk>
References: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
 <20260122101122-GYA63789@gentoo.org>
 <77bc5a5f-666d-4beb-ab78-99a242d72a39@sirena.org.uk>
 <20260122121223-GYC63789@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <20260122121223-GYC63789@gentoo.org>
X-Cookie: Don't read everything you believe.
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
Content-Type: multipart/mixed; boundary="===============8519666281012654143=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8519666281012654143==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WKJxnpfC+M+6T011"
Content-Disposition: inline


--WKJxnpfC+M+6T011
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 22, 2026 at 08:12:23PM +0800, Yixun Lan wrote:
> On 11:27 Thu 22 Jan     , Mark Brown wrote:

> > Patch 1 looks like it should be OK as is?

> then with patch 3, and for other boards (milkv jupiter), should have similar
> DT fix as patch 4..

Yes, changing the supply names would at a minimum need all the boards
updating (it's an ABI change so shouldn't really happen, but perhaps
there are few enough users for everyone to coordinate and it's what you
all prefer).  Patch 1 shouldn't have any effect unless a board already
specifies a wider range than the driver currently supports.

--WKJxnpfC+M+6T011
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlyJg8ACgkQJNaLcl1U
h9DKQAf9HE685HxQLs0onmPPl4HIvattESVKNH804D87n1xEfNY43egCIlO7Pzsn
ZKT7pyTrFRmzgks+R8V05qzLs6+G2AguJCYMu73OG1JCIbPBfSZ01dY9MytIPbl/
1PSgsoZNin9mXKIK+OeIT+XrmSshq4eW3f8qTCgP5F4X83gk/OO/t6Rnt/iY9zNJ
cqUjOrt6qgOyHjH3NWXzm2mjqJvmwa9u6TjliylVdwKv4qVSwB99/IwJVTpsnIw8
QzrJqRkxx8TOTUvffXACYw/aATHaixZDVGicmSjHJCS2Z0h8j5+5SeIgP8A3Q120
cbSNSBhroZx2d09AZG622VSZuuhtTg==
=naTG
-----END PGP SIGNATURE-----

--WKJxnpfC+M+6T011--


--===============8519666281012654143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8519666281012654143==--

