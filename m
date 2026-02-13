Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C08BEDF148
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 10:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cF9mtoDmvboTDncBEInmUnLqyEkzTwduPkbMvBnviBw=; b=0mT+GikzKreru9i9ZmtuGKD5Qg
	vcmdWZIyEZaMoNaILiJv44UTLyO5ENiDDJ28JBt4JVXopAQi3lmpb7LRB0Cn/0t5cx9ej0SWkDNpO
	rNoH+Qv4AMn+BS5lC1HccSQwGMNudYwZDtQsquUHlrMXCJaXTwggBw+5qiyu5kJz23Q+toZElXfaP
	B2nsoz5WJ4XkUAj8BtIRINYDpUAF42Hs9RVgc6i8LRgt5JKOs2J1ZG3A9ko74+RYeGZVihgk2GTFM
	iMQPa+l4DJWt0iiDrt7eeJPrI2t4DmhVhWlGebYmLovYDeCFlhwAGDne/f24yIQ2NnqwChCAhPW0a
	H5UY2MTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqqeT-00000003LCL-1QOL;
	Fri, 13 Feb 2026 10:43:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqqeQ-00000003LBw-2FJM
	for linux-riscv@lists.infradead.org;
	Fri, 13 Feb 2026 10:43:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38AA943EF9;
	Fri, 13 Feb 2026 10:43:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8ECC116C6;
	Fri, 13 Feb 2026 10:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770979433;
	bh=vGc3n4emY398xDLM5KRJZpeBd9ipRoZH+lOVT/weyAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WRz4wTuwQ5rXtLBd0Vv+UgoG0NKSsDkuqRg9ok2YkBLqAEXrQnFuGE6BNP68glFL+
	 eZyFgfXziOerWq68iLb0FlihIrZ47RndofRBQr0jr0xpQSHRw9UtExpIG+mjaj788I
	 YA5pPgmPEw+F/I8T5ehlLt83VUkuRkn/6GS4m1/lqkGY0GjoflihVZy2jC3GSIV8Ek
	 VPnzO2Rh7c3tUIcrrdNXFfxqsjm42hVlehfTcOuCF573AYdfr2k8hpOrzpR2ZSwPru
	 NQCBtYKsbI9Rn81auxoHbbJWiIaZq6ExEu0atNMciNziSjYORpPZjp5TCp1HUYPYNc
	 vPh6f+fX/BweQ==
Date: Fri, 13 Feb 2026 10:43:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: Nam Cao <namcao@linutronix.de>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Zhouyi Zhou <zhouzhouyi@gmail.com>, Frederik Haxel <haxel@fzi.de>,
	Vitaly Wool <vitaly.wool@konsulko.com>
Subject: Re: [PATCH] riscv: Remove support for XIP kernel
Message-ID: <20260213-canteen-diffuser-5ecc80f264b4@spud>
References: <20260202115403.2119218-1-namcao@linutronix.de>
 <e5bb59c7-efd9-4706-978d-cb8f1249a535@linux.dev>
MIME-Version: 1.0
In-Reply-To: <e5bb59c7-efd9-4706-978d-cb8f1249a535@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_024354_647054_2320E95E 
X-CRM114-Status: GOOD (  17.00  )
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
Content-Type: multipart/mixed; boundary="===============4558267156188092159=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4558267156188092159==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="71d8aEI9VjEj3On7"
Content-Disposition: inline


--71d8aEI9VjEj3On7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 05:37:45PM +0800, Kunwu Chan wrote:
> On 2/2/26 19:54, Nam Cao wrote:
> > XIP has a history of being broken for long periods of time. In 2023, it=
 was
> > broken for 18 months before getting fixed [1]. In 2024 it was 4 months =
[2].
> >
> > And now it is broken again since commit a44fb5722199 ("riscv: Add runti=
me
> > constant support"), 10 months ago.
> >
> > These are clear signs that XIP feature is not being used.
> >
> > I occasionally looked after XIP, but mostly because I was bored and had
> > nothing better to do.
> >
> > Remove XIP support. Revert is possible if someone shows up complaining.
> >
> > Link: https://lore.kernel.org/linux-riscv/20231212-customary-hardcover-=
e19462bf8e75@wendy/ [1]
> > Link: https://lore.kernel.org/linux-riscv/20240526110104.470429-1-namca=
o@linutronix.de/ [2]
> > Signed-off-by: Nam Cao <namcao@linutronix.de>
> Hi,
>=20
> Please don't remove CONFIG_XIP_KERNEL.
>=20
> Zhouyi Zhou zhouzhouyi@gmail.com <mailto:zhouzhouyi@gmail.com>and I are
> willing to take over
> maintainership and keep it build-tested and maintained going forward.
>=20
> We will send a MAINTAINERS patch shortly.

I dunno what a MAINTAINERS patch for something like this would even look
like, since XIP stuff is scattered all over the place. More meaningful
would be fixing the purported break due to runtime constants? Sounds
like it would something that could demonstrate your ability to do what
you claim.

Cheers,
Conor.

--71d8aEI9VjEj3On7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaY8AZAAKCRB4tDGHoIJi
0hArAP9H2Auz8yTI+UQl9RBGxsEx28/znC807eXSxRAq4QkyOAD/ejFzgZAd948F
PIFJT1XG7YjxW5l5zbK+7c2E/5yXTQI=
=U/SE
-----END PGP SIGNATURE-----

--71d8aEI9VjEj3On7--


--===============4558267156188092159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4558267156188092159==--

