Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7961BE7849A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 10:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYRoQRjoWGEHu32Z1agPMeJTDU0ntyX+sazSDkh2OGE=; b=i6xXfnvAXP/c3F8/3lN73B2jDC
	YgGsHaNuIP7JSBxW8z+UnvGqjfRkPmJXDGvcb/iHeo9r5XHFB6ZVQb89WsT6uZcB/ClDYXsZ4BtGl
	V0tBAA+cPxploaW0QHR7rMR+3gXlrT49U6lH1U4dTIhSqy1no/zsqBmCfSAaZU1I30W7yFPRKGWRj
	oGTmdfWoTILNwmnC7UAf4OgXtu/X+5zLR+1MMWSCXV1IErFqHZHojA+1A2De5iKwgfUKhITWWLk0A
	VVBumoTqagyX9ypgLYUkwF4eX8WGS/rPdewWVyJCucv70BW4VsL1aCPIeRfLCSHQHNbNBymw60u5V
	bcIzlyog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnGaR-00CUzH-14;
	Mon, 02 Oct 2023 10:55:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnGaO-00CUyD-2q
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 10:55:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ED28C60DC1;
	Mon,  2 Oct 2023 10:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2DBC433C8;
	Mon,  2 Oct 2023 10:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696244135;
	bh=F5fHvFLRPSXGAJr5Hur9dBSrn1AlR9jGY19xXDVZ+To=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ebkPo+WRr0ngMFnObD+G/SsGSqtuAZEKlpHHoqkawi7RHXBd0sxsUG1QkXKc4cspE
	 yXV9hVW556TzPBMhNay2gmLR0xCSP7cTqvz24ZSxXFPJHxS7EbVrLlkbu5tPn/va28
	 KiRrn96lV6TFqopL8izAFIlDB1GsqBvOqDGZbicqpaER2bm9y9z60L/vIcN48UqDMr
	 ldNgeV+OVuCnO8knQ+oMMYiDA8FCXzE1s/WQCoYF6JqHlaCnS6Q9U7ae2hcazzxqQP
	 7HD6J9uiy4kr71HI+xrd4V1XoE+8q8CmsuaLjEAQr3KbLmBTmTaQA+bP9OVyYNXc5U
	 3E2ep5dWxtknw==
Date: Mon, 2 Oct 2023 11:55:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v2 1/2] riscv: errata: thead: use riscv_nonstd_cache_ops
 for CMO
Message-ID: <20231002-angles-utopia-6c6c7b18231e@spud>
References: <20231001103433.3187-1-jszhang@kernel.org>
 <20231001103433.3187-2-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231001103433.3187-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_035536_963065_CB56881D 
X-CRM114-Status: GOOD (  14.60  )
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
Content-Type: multipart/mixed; boundary="===============1460728414589532236=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1460728414589532236==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="U/Lf1c64QYsza03U"
Content-Disposition: inline


--U/Lf1c64QYsza03U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 01, 2023 at 06:34:32PM +0800, Jisheng Zhang wrote:
> Previously, we use alternative mechanism to dynamically patch
> the CMO operations for THEAD C906/C910 during boot for performance
> reason. But as pointed out by Arnd, "there is already a significant
> cost in accessing the invalidated cache lines afterwards, which is
> likely going to be much higher than the cost of an indirect branch".
> And indeed, there's no performance difference with GMAC and EMMC per
> my test on Sipeed Lichee Pi 4A board.
>=20
> Use riscv_nonstd_cache_ops for THEAD C906/C910 CMO to simplify
> the alternative code, and to acchieve Arnd's goal -- "I think
> moving the THEAD ops at the same level as all nonstandard operations
> makes sense, but I'd still leave CMO as an explicit fast path that
> avoids the indirect branch. This seems like the right thing to do both
> for readability and for platforms on which the indirect branch has a
> noticeable overhead."
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Tested-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--U/Lf1c64QYsza03U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRqhowAKCRB4tDGHoIJi
0piXAP9YVt+cUOHo4WTwqUZ7/v9f9zmKv0aMbkueUtWc8W5O7QD/RBTXAJXMS6mi
pEEyPYGX00rO85GTDF1mlRpvqiiPKAA=
=KGQg
-----END PGP SIGNATURE-----

--U/Lf1c64QYsza03U--


--===============1460728414589532236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1460728414589532236==--

