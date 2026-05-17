Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8A7CD4F3C
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 20:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/BFUuPug3bqIU4HvlO5LckWpm1+aBUifIoesYvFwN4=; b=0/bULyDqgMe29/LbHHx049vyiE
	zNnU+G+g1Rzj03plpOdxDqxIrxTVr0f20txfjhOTwjltengUBO+YTSVKTa3zSW4clOPctJFppX7zr
	LjHkIVxkr56WuYco1dvZ2wESDt7h7q05Lc8yGFtdXw+x8P+BEUEn2xezfbnVew4sAcxsbSPGDcKnM
	embvoHTHEAunu/PY768Dp65fVo0P1n4lynz3j9KDDXeXpLmLLXzIZYalP3h8Q7KiDn/cc7A9HBJro
	+Z9g6/w8yI36D1qKWiLM5iQ6x7Gy9L3h/v8P7AAmAZ8B87xjgQ2C0+s9QahpI4Tlzq3IVI/x6AM5q
	QBI25DDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOiSz-0000000DRkQ-1fCm;
	Sun, 17 May 2026 20:52:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOiSw-0000000DRjm-1VcQ
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 20:52:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0376F4442D;
	Sun, 17 May 2026 20:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF625C2BCB0;
	Sun, 17 May 2026 20:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779051121;
	bh=Og4fBV0EtD0xhgQyzKrvnJkkN7/Nmm1sRZwXKkR+uWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E1jaTnUpR8hVplCRXocLMST2NUTRStFSqyNR/r0AdCRcRKkgG7wbT2QSTzUGIAaZU
	 5erC8I20OCJEccLXKAm/EeTDPZTW+fAQv7zkZWKf0leDMThsIy2qGBrke9sqc9l3yy
	 VbVGJKs/Nv1YHZiBb6BdrvyHpl63iwpPKc8b+U3AEochNJEN+gwlA/oJZC73FCtKY7
	 xylPAAnVYcqiWg54xErmoNXLWPRP/VzscTYciqzPt0mFQS4WGRS2RzpmPOgLkoUljr
	 hJ6T4V+YzxQnCEvO/rkJs+eG72lYTW7o6AbjuVerwvAyfBsHrxiuQyQ6srB0K+gsXD
	 0fAp99LjNRDNA==
Date: Sun, 17 May 2026 21:51:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: clock: add binding header for
 sf21-topcrm
Message-ID: <20260517-pulsate-shining-547432ab2ca0@spud>
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
 <20260517-sf21-topcrm-v1-2-438f2e0513ff@gmail.com>
 <20260517-cartoon-slather-ec5ad7605449@spud>
MIME-Version: 1.0
In-Reply-To: <20260517-cartoon-slather-ec5ad7605449@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_135202_419855_F8AE42C7 
X-CRM114-Status: GOOD (  12.58  )
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
Content-Type: multipart/mixed; boundary="===============2212359124410971741=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2212359124410971741==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XBSltlWXNSQe/OJJ"
Content-Disposition: inline


--XBSltlWXNSQe/OJJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 09:47:26PM +0100, Conor Dooley wrote:
> On Sun, May 17, 2026 at 10:12:56PM +0800, Chuanhong Guo wrote:
> > +#define SF21_CLK_PCIE_REFP		30
> > +#define SF21_CLK_MAX			31
>=20
> > +#define SF21_RESET_IROM			17
> > +#define SF21_RESET_MAX			18
>=20
>=20
> Having _MAX is not permitted, but is also really confusing that "max"
> appears to be max+1, so actually represents the count not the max?

To be clear, if you need a define like this, put it in the driver.
Bindings having a "_MAX" or "NUM_CLKS" doesn't make sense, and half the
time this number ends up changing anyway.

Also, squash this with the patch adding the clock binding.

Cheers,
Conor.



--XBSltlWXNSQe/OJJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagoqbAAKCRB4tDGHoIJi
0kXQAP9LJgmoesY0Ipn5SDkHI1favq4yEm6Jb5EycZjpUwTLtAEAsN4MhlOWEdtS
0trUPoitDOYu794uOuGQPIOzV0sDKQE=
=ZyXF
-----END PGP SIGNATURE-----

--XBSltlWXNSQe/OJJ--


--===============2212359124410971741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2212359124410971741==--

