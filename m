Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A11FF8868
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 15:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vT3Vl4x0UrbYdN1BS5ZniYQqcXO5rvsw/QozJcpDEko=; b=4DXJogq+OGLeEOypb/OgaI/jRG
	b7I/t9lKsNJI+NWVeWr5blDrTXz9zDLsGuEEFinkpz1PRACxiBKoLtBdz9J+gaYBZbhB1qe/mCSF8
	QqT/KNVm6tDKA5YkhT4iJrd32BLrEkCa0MD6Hej44oOhpG8XlVUI6pC784+eCBEAx4aNuQzEjG+fj
	ghonA/NZgkSOkkPmzNRSZHO1yS/2S3LP06uvm3aW8svxL646xZnLJ5CJIHOOYFFdRKr9kpK96a+9/
	sA455kXEHIa1WljEz0oL4RgY5Tuabwerj9AOL7kexMEx8Alx4vgTDANVRcyMWVlsUfAGxoMsfqZth
	jvHX+0zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNdd-0000000HAhe-3VLi;
	Mon, 27 Apr 2026 15:12:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNda-0000000HAhI-3PfH
	for linux-riscv@bombadil.infradead.org;
	Mon, 27 Apr 2026 15:12:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lseprM2/jCDdsLjD1wizt/6pD/Wk+1MEjbqOhZ7uZf0=; b=cGmrN5SIneCTUQhNNxa/0cCCid
	EgcvesgdXSuiSLahj4Lx//LRt+f9PM5Ri1TZDxosyySdki1lsEDAlbtsX2aqWLimxr9XLsS2pq1ET
	0gITp2wnrSK+z9MExZTCOT6rK6dyvqTQGMIZtU92h6Dcfh4Lw2mZ4oh/AICoQ5vN01/dcmr/IQ+bx
	Vz1LmB2dxKrKr+5HEHFgPJa1MFDuWq5xRMP1IDYe5UcoBLbRe/ASwK/0DwG9YGsXhEj7LXmctSXJ6
	6As6QYXGhRfPxbpWbTx7JA24o0N9c6cefaC8ZbYkihMd9QURrCq0fpWEAvK91OM4vTJE65vdwLoIk
	fyRGUtgQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNdY-00000000uRj-04AB
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 15:12:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B496944362;
	Mon, 27 Apr 2026 15:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 786ECC2BCB4;
	Mon, 27 Apr 2026 15:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777302754;
	bh=/CqSskoGzdcsqttztytoVUlABn4AorHKr03Sns89Kr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XRuH0LPgJ19c6Dk93dvLfAp7sjAblitcu2mwBzb550aJCiazA9qEdnMg8/4sz1nm9
	 mIPpFXEkUOsKJ/B1+WLZI0c2nxk27o4wWb9rc0zTD5jS0po7WxHgmd6DpJsC3ktT10
	 bGDG260ZfAaWREBJ4WxiFgccHR2GHyeYtn2O+60jaNyu2nSow0z9cxv7j2+bZY2J+6
	 ub0sriAu0nZfYFw01jAZ/NmVWE02SRCZYE/P7CFk1RdQKxlJRWkWJOlW7vCZwpI7PT
	 DEdJBghMb9UdnlHJFwfUMCX1EmuXfpxVLssNe9tWtPI36R6buDFs4JlxSKNzDyxBHy
	 nKQK3JmmaZwEA==
Date: Mon, 27 Apr 2026 16:12:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	greentime.hu@sifive.com, vincent.chen@sifive.com,
	zong.li@sifive.com
Subject: Re: [PATCH] riscv/sifive: remove warning in errata
Message-ID: <20260427-landside-bush-45bf90908635@spud>
References: <20260426-vendor-v1-1-041fbde8918f@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20260426-vendor-v1-1-041fbde8918f@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_161240_293400_36F79D39 
X-CRM114-Status: GOOD (  16.98  )
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
Content-Type: multipart/mixed; boundary="===============2182161596842304252=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2182161596842304252==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mIOY6PRxrGBBmvWp"
Content-Disposition: inline


--mIOY6PRxrGBBmvWp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2026 at 07:53:46PM -0700, Yong-Xuan Wang wrote:
> The patch_id of the availability checking for SiFive vendor extensions
> will always larger than ERRATA_SIFIVE_NUMBER. Remove this unnecessary
> warning.

I'm sorry, I don't quite understand this commit message. Where is the
other warning that makes this one unneeded?
I think the commit message needs to point out where that is.

Cheers,
Conor.

>=20
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>  arch/riscv/errata/sifive/errata.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive=
/errata.c
> index d0c61f86cba3..98edd9143321 100644
> --- a/arch/riscv/errata/sifive/errata.c
> +++ b/arch/riscv/errata/sifive/errata.c
> @@ -94,7 +94,6 @@ void sifive_errata_patch_func(struct alt_entry *begin, =
struct alt_entry *end,
>  		if (alt->vendor_id !=3D SIFIVE_VENDOR_ID)
>  			continue;
>  		if (alt->patch_id >=3D ERRATA_SIFIVE_NUMBER) {
> -			WARN(1, "This errata id:%d is not in kernel errata list", alt->patch_=
id);
>  			continue;
>  		}
> =20
>=20
> ---
> base-commit: ddbf9c76c4020bf63a0799b00faad40caa3de6c2
> change-id: 20260426-vendor-4b4427e0b670
>=20

--mIOY6PRxrGBBmvWp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCae98xAAKCRB4tDGHoIJi
0nBOAPwJ/Rlq+xxj/X9mZX5vmvUYTXkRl/9tGXSZlakDusxxqgD9FZthxAHozeK7
zm/lGbFJ6mk/Nw/gXTEBxhUfAPiygwY=
=SBCq
-----END PGP SIGNATURE-----

--mIOY6PRxrGBBmvWp--


--===============2182161596842304252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2182161596842304252==--

