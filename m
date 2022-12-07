Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416F6C352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 16:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/dYcwkwGEMQMoe98B0D+D8pzZLQVqdvR4kZTrUScbU=; b=xr26PG5TYgFT97XALtU7Rm4TFg
	+zzwjY8oeGWLq2+GVDQn8IKbAIjo3Az1HZRGEeGfmaBdESAj/Fl0gg/c/1KFtOtNm8qjZNfBX9t2U
	8PNOD2E1gwXN7Ed7QAQMi6oRnOOnOoUIljZJrOGppksxkAd9iheJw4OCGSKgqd+ZceSl8pvv9611a
	8oSFOvkvLjiNVuEZy4yQBf1M1J5/ICnA1sc4IXpmNNQMtSWz3u2ImvJV4HHf548XoIp1M34zj/yTG
	V5I2TB2ZiTkD9wbbsshSUSLLon1raTbPlHQuUE5agRurrlAOsw2KagHCBNn+tr+XcQjWeWJP/2vsi
	CPd4Ratg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2xSv-006orz-QY; Wed, 07 Dec 2022 16:40:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2xSt-006ooe-Pt
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 16:40:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 290FD617CB;
	Wed,  7 Dec 2022 16:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A02C433C1;
	Wed,  7 Dec 2022 16:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670431210;
	bh=g5fGGrWSIRqwNSexjwtqPOCti3BgIlEU85pKTBf8T0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oo5QBkISEd5C93re2xC0MAd5GbmcJS0EQqCFX92m+ZL2Nnj+W+l6Aa8NisLDN8s2+
	 T/59VugOVhDKZk6+JfIq19yMgs9W72I7zpqEoVvLjqhwYaGveEsjBalrCI/i9FYgpi
	 GRSSZt4wnoHmFdjJya2qZ2v6WPaiqIAOgtedaL1X6wHhznVa3upGa5A4T7yrYIH67B
	 E4KovPtFNabXUFMrqkNctQza7wTDUZlfNqI0Y0kN7wBNdJAqcQgul/ISBt0ja9HSUx
	 24oqNM/bS5VlKbyeAGSVDrOv390/2jSLOD5C3VBU1dHcR9zdD6AcLhueUri6w+Obo/
	 RZQPBhowOylmw==
Date: Wed, 7 Dec 2022 16:40:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Bin Meng <bmeng@tinylab.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v2 2/3] riscv: Implement semihost.h for earlycon semihost
 driver
Message-ID: <Y5DB5c7O4oAMkTa/@spud>
References: <20221207135352.592556-1-bmeng@tinylab.org>
 <20221207135352.592556-2-bmeng@tinylab.org>
MIME-Version: 1.0
In-Reply-To: <20221207135352.592556-2-bmeng@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_084011_898741_4C6676AE 
X-CRM114-Status: GOOD (  10.17  )
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
Content-Type: multipart/mixed; boundary="===============4654530229974192025=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4654530229974192025==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="P16++YdENF2wGyvg"
Content-Disposition: inline


--P16++YdENF2wGyvg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Two tiny nits for whenever other comments require a v3.

On Wed, Dec 07, 2022 at 09:53:51PM +0800, Bin Meng wrote:
> Per RISC-V semihosting spec [1], implement semihost.h for the existing
> Arm semihosting earlycon driver to work on RISC-V.
>=20
> [1] https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-semih=
osting-spec.adoc

Could you please use regular Link: tags? Also, for a multi-patch series
please send a cover letter :)

Thanks,
Conor.


--P16++YdENF2wGyvg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY5DB5QAKCRB4tDGHoIJi
0pZKAQCwhsweZT35rE6Qa9nOrzhd5VKjCEPMMwbXWCfug86MmAEAmCRVZoYRpUvE
E1k+9d6yojCvx8N+tjKoPiR/Bzb88w4=
=64rp
-----END PGP SIGNATURE-----

--P16++YdENF2wGyvg--


--===============4654530229974192025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4654530229974192025==--

