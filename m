Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E881061B0E
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 15:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4lLLrBfCESQr2JGln7sAlNphblO4JUYMj8hziY/O9I=; b=mmSgGmQHpzPJZtZxGnylx6/swj
	cZCU4rBNentqSUu9iIoycc/NY3xsqpIf29KTnjfFV1HmgViVoWMwi9vmtKU+XK+v4w5eCjJdgbeOy
	6pgHvLdlIlVfZB4qhLNwtg8sUz9A3ZfHPIXxwE8Y4ZKV36+693ZERmeM5CDLSNnS0U4u/jXuo8GiA
	O1rQ9fVWv+utMzlNQJjA6oNsu7JXuYTsUQibXcXiV9deOoNjx20y2VH/xxYDhkOdm3w6UWSGR3NKV
	R2v7zt9F3hzyD6aJ3Bf1A+JnrYI+/ccvnILxiWhuR3F1aztCPbcC1/jysy1AG4AURnIIow0dD4ZtO
	8QkOBqNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ESs-0000000BYz2-0l5T;
	Mon, 30 Mar 2026 15:23:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ESq-0000000BYyv-3lJx
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 15:23:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CFB2260054;
	Mon, 30 Mar 2026 15:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D43C4CEF7;
	Mon, 30 Mar 2026 15:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774884219;
	bh=VULu542ABKvcNdY+7D9CdlmIg9J7r7UGrQBVKdeLiMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=prqTKGyKEq6bTMdFHWFNCYT/lKNg2YpV5IlAQwiIXHGhkCSZWIL3OCS5TpKgH8Wgf
	 XLZGHVoliDtSLgDYHhKQnVtc/Ls03TOKKqU3Wj0wwKUQ+VxQ+VJI8OfqUiv2vkOOoS
	 NGntgeCI2idZ0VBEPbG4PiWV7R2YM6GaCwinftD2PCvkrpIEKa/O7mmO6oDOOUeczc
	 u2gLeC/R3Z/DayowwA12TxHzD3ZYvH/WTn55qNZDSFKjoN5z9+K6EVIxsgGwxRPQQg
	 UVpIf1muwbocTSqJ9u66iCI8wQ7oNQdixAVTsqwFWT07WzHnYTy+SraeSgsmugk7yJ
	 Fs0w5WGFHfJRA==
Date: Mon, 30 Mar 2026 16:23:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hui Min Mina Chou <minachou@andestech.com>, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	geert+renesas@glider.be, prabhakar.mahadev-lad.rj@bp.renesas.com,
	magnus.damm@gmail.com, ben717@andestech.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	jonathan.cameron@huawei.com, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, tim609@andestech.com,
	alex749@andestech.com, az70021@gmail.com
Subject: Re: [PATCH 2/7] cache: andes_llcache: refactor initialization and
 cache operations
Message-ID: <20260330-rug-coeditor-82f88ac95e7f@spud>
References: <20260330102724.1012470-1-minachou@andestech.com>
 <20260330102724.1012470-3-minachou@andestech.com>
 <8c01c910-21b4-4a16-98e4-197c20883d23@kernel.org>
MIME-Version: 1.0
In-Reply-To: <8c01c910-21b4-4a16-98e4-197c20883d23@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============0631600642542658875=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0631600642542658875==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XSEEsXFnQ9xlKiil"
Content-Disposition: inline


--XSEEsXFnQ9xlKiil
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 03:02:11PM +0200, Krzysztof Kozlowski wrote:
> On 30/03/2026 12:27, Hui Min Mina Chou wrote:
> > This patch cleans up the Andes LLC cache driver:
> >  - improved error handling in andes_cache_init() by using goto labels
> >  - updated andes_dma_cache_inv/wback() to check for !size instead of
> >    start =3D=3D end
> >  - cache-line-size mismatch from an error to a warning
> >  - Use ALIGN and ALIGN_DOWN helpers instead of the alignment logic in
> >    andes_dma_cache_inv() and andes_dma_cache_wback().
>=20
> Please read submitting patches document. One thing per commit with
> proper rationale WHY you are doing this.

Applies to multiple patches too. Anything here with a bullet list needs
to be several patches.

--XSEEsXFnQ9xlKiil
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacqVcgAKCRB4tDGHoIJi
0vBhAQCwaaV8c1kS1cbuCi/Pa4fZ8f4Oq1pfsKXH8bMxDxOimgEApnKQp+tY6hDU
KPlDV7uSgwfAYilwkjTxwTIG7cKTkQI=
=gqdu
-----END PGP SIGNATURE-----

--XSEEsXFnQ9xlKiil--


--===============0631600642542658875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0631600642542658875==--

