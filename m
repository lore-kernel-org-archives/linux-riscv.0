Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC383CDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 14:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOgdbZufolxvH/oZ2+ZmIeaKLHmK64pXIP5uoFI/TyI=; b=n9tGRDzqvXf5OJCW8qV4wCszaV
	5EaYvTPfRSxKS1SiQunJU9sqQcEc/ARmEmcE4h10KsWCeRTFDneC0LpOWiiilUgRMOsaTtEaGPZy7
	Xe0njPcQwVlT6WPR2ekgMsOCf8rTUhDlwbIVJnWB8IQWojjwg1eVEBv1DO58k2CS4uEGZpH/zvWQC
	6BZeRJsEnT0wydJ6ktBEJV7KlJNANQFNoy8s6uSFwpredE/p8vbSHT/SVR/wnShMvXxq5oMMoYp/q
	41A/hxg8G0h690BWX46nRpYExn7ni9wBCHkUuknNMW9oxNu7K5EhnOE234uhzxwGctXm9J/nc0FIh
	tV4kuVbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqwnm-001CHL-36;
	Thu, 12 Oct 2023 14:36:38 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqwni-001CG8-0X
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 14:36:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id ADE4CB82460;
	Thu, 12 Oct 2023 14:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE7CC433C8;
	Thu, 12 Oct 2023 14:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697121392;
	bh=T66Yur/UCraUQwTSXUcC9RiZqqV3VvZWqiVESHrtPY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MJ5DfxWaahvAPHHHHX8MojtEbigSm7v6EfEav0C0orOwLfJvGkfovUPkb3tBVLvER
	 zm+g9r6QTVMjW5xGGYYlu0NIpCokM+fNKVw9BNEzwXu10r0GAAX0xZ/sty+ynEU8dJ
	 oliyneNUpyAFk5zQ5D8TC9X//2xfeODIMy1lRkCydqISyZ2zN8lI/VjVNO0Pe63dfC
	 SFQHAoLqs0K3wUNqrdTVVXT2ArrRSMb1MYbwWGknaIe2lGaWhj1t+HsGjAfs5bfAQl
	 LewTlVrie9IFA9HjWbE44DRVu8U3mFjAxD81uMaYlzPMatHpCUXDtt8Ywj1kLbEzlr
	 zEw0F/UQElxjg==
Date: Thu, 12 Oct 2023 15:36:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] riscv: errata: thead: use riscv_nonstd_cache_ops
 for CMO
Message-ID: <20231012-remindful-coke-f9cfe950425f@spud>
References: <20231012141456.4078-1-jszhang@kernel.org>
 <ZSgA1BtMv/YDHzQX@xhacker>
MIME-Version: 1.0
In-Reply-To: <ZSgA1BtMv/YDHzQX@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_073634_368129_95E15A33 
X-CRM114-Status: GOOD (  22.49  )
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
Content-Type: multipart/mixed; boundary="===============2351321414941613164=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2351321414941613164==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yhohIoGoNmGJsGcL"
Content-Disposition: inline


--yhohIoGoNmGJsGcL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 10:21:08PM +0800, Jisheng Zhang wrote:
> On Thu, Oct 12, 2023 at 10:14:54PM +0800, Jisheng Zhang wrote:
> > Previously, we use alternative mechanism to dynamically patch
> > the CMO operations for THEAD C906/C910 during boot for performance
> > reason. But as pointed out by Arnd, "there is already a significant
> > cost in accessing the invalidated cache lines afterwards, which is
> > likely going to be much higher than the cost of an indirect branch".
> > And indeed, there's no performance difference with GMAC and EMMC per
> > my test on Sipeed Lichee Pi 4A board.
> >=20
> > Use riscv_nonstd_cache_ops for THEAD C906/C910 CMO to simplify
> > the alternative code, and to acchieve Arnd's goal -- "I think
> > moving the THEAD ops at the same level as all nonstandard operations
> > makes sense, but I'd still leave CMO as an explicit fast path that
> > avoids the indirect branch. This seems like the right thing to do both
> > for readability and for platforms on which the indirect branch has a
> > noticeable overhead."
> >=20
> > To make bisect easy, I use two patches here: patch1 does the conversion
> > which just mimics current CMO behavior via. riscv_nonstd_cache_ops, I
> > assume no functionalities changes. patch2 uses T-HEAD PA based CMO
> > instructions so that we don't need to covert PA to VA.
> >=20
> > Hi Guo,
> >=20
> > I didn't use wback_inv for wback as you suggested during v1 reviewing,
> > this can be left as future optimizations.
> >=20
> > Thanks
> >=20
> > since v2:
> >   - collect Reviewed-by tag
>=20
> Oh, I missed the tag collection, but I know maintainers are using b4 whic=
h can
> collect and apply tags automatically ;). let me know if want a new
> version.

It doesn't collect tags (AFAIU) from earlier revisions though.

--yhohIoGoNmGJsGcL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSgEbAAKCRB4tDGHoIJi
0gDdAQDIEazfsbs4xfx2jNJUKGvwicJmPcJtkhPLURqghLYUgQEAwors/NUj/QyD
gd4wjd0Dg12NVYmAeaWwZ3XzoNOXYQw=
=/MRc
-----END PGP SIGNATURE-----

--yhohIoGoNmGJsGcL--


--===============2351321414941613164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2351321414941613164==--

