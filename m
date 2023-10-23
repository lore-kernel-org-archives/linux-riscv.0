Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3026CDB474
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 08:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8TdNjPUxMk7p5YvYhPgjwKPK4X8izLLv/eVKMM0qqEk=; b=SSlh943JYfmwBUt8D4t/OoMzwH
	0dC95/s8pfKJJI5s4j3vrBNzcHFCqKlWJW7MLaLmdhcGJPqOnhKTIi0o7EPA8tPJtdd91YR4XJJy7
	RuVtk7Xe0a4icmwog5/k5yKUMgbQiHa5ZKBMtD+IWOwb1iytL6JZCwMeziJbYXBNelX4mlDl7lT8r
	d0GYf8WpMZfd1yyr1cYyp3J1e+kTFbj/ODEEPvlvCPuWA4zeQcRCSejaSOPdyQHJefdEtBs5IC0YH
	Dk5LIr/PEuehfRtVzc+ZRQfaHSUr2BbbiFn2E6VNxZ/I15A6g37zk3WKuQbLiI5n0xVHBwfqCx+Bx
	FHBO2RGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqHL-006kVX-2R;
	Mon, 23 Oct 2023 08:27:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqHJ-006kUi-16
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 08:27:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id AE780B81879;
	Mon, 23 Oct 2023 08:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB43C433C7;
	Mon, 23 Oct 2023 08:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698049631;
	bh=VMTJfimWxD2ILNYWo5Q0hGhuuxNAiNQL2dtWaGJDBpw=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=jZAm89CXNCvRLVD0qs765vwkdARbZ/9snD8N/JQ6Hcc03nuQkEMBg44K6dVaWto9B
	 q5hGkg1GBU/IcjmkgseTGzzkLsEBfa+fO5F7AhdJZ2kKN4YPBXqUfrPNnXUh5wxbdR
	 nzrmIPKPlMzzc+kwbvt4wp2298sjtFnUs3pPB47Vb1HsQwgSJkifSRjW7A7aAzbM79
	 QObeaPTXWDsU+NKIGcjx0dC3A0D0ftrC0h3Gx2YKSSNlJKEkjWGiFMtEDvNwZkKTS+
	 k5PuIN2/MvCYLDeuxtBKxaB8GgEdjgocIjxUY4VQaq4RFjfTR2QzbY/a7OTDwGWKr+
	 jwDPQU64rCaxw==
Date: Mon, 23 Oct 2023 09:27:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: soc@kernel.org, linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH] riscv: dts: thead: convert isa detection to new
 properties
Message-ID: <20231023-factor-unashamed-2fd76c2ad02b@spud>
References: <20231022154135.3746-1-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231022154135.3746-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_012713_539388_3BA84218 
X-CRM114-Status: GOOD (  10.28  )
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
Content-Type: multipart/mixed; boundary="===============7890393455533421820=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7890393455533421820==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uZzXzpTKTGrgzgtU"
Content-Disposition: inline


--uZzXzpTKTGrgzgtU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 22, 2023 at 11:41:35PM +0800, Jisheng Zhang wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> Convert the th1520 devicetrees to use the new properties
> "riscv,isa-base" & "riscv,isa-extensions".
> For compatibility with other projects, "riscv,isa" remains.
>=20
> Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> Acked-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>=20
> Hi Arnd,
>=20
> This is the only one thead patch for v6.7, could you please apply it
> directly?

FYI, this is missing your signoff, since you are resending my patch.

Cheers,
Conor.

--uZzXzpTKTGrgzgtU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTYuWwAKCRB4tDGHoIJi
0gaxAP4r49NwCNjROW78Q/G+7YoLWCXPATofAPsnsGVWgGdhCwEAirNvgyRE5s5y
xqcf7cE9bbEfurl/6ye2sL0ITB7oKwc=
=Nj8q
-----END PGP SIGNATURE-----

--uZzXzpTKTGrgzgtU--


--===============7890393455533421820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7890393455533421820==--

