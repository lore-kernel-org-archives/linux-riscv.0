Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79777C001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 15:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X32xL4/fnKkRLXbECIvgXC3VN832QRe4i0lenBzGv6o=; b=xOMIx9VHo4PWbdkL15qGQ45I7e
	WnkNVOWUv9y+P7Qa+Q5sVRjxfvg0WXyEdhULZPI1xu0W+LSBgOPpIIkBqJXKbpulTOIkwJXO8WhR8
	dB9+h3untS8ls1rhjxXXlUS6fZHfDHtECBKm+Vw3Fiv2o8mHPXPYNkqq6olnoyzBoYWV7hsWY21T+
	vpNw4K39BDgLPwgbiFUZ+MzurE5ExPcc1NRdiCGgG2/PGxDWUGNiC1b1mc8hw4jsPTvu6ta5a39P/
	9fe4bvYrmtBWXl4OR5R7LsrFga/cnXoV/XbBh8RfCCtq/rNIAFJ8BK3XquzwoTf0aMOW13fZneBaC
	PrJSUkmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVZDu-00HQey-0M;
	Mon, 14 Aug 2023 15:11:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVZDq-00HQeN-28;
	Mon, 14 Aug 2023 15:11:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 35D126124C;
	Mon, 14 Aug 2023 15:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499EAC433C7;
	Mon, 14 Aug 2023 15:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692025869;
	bh=Dt5BVAQdSjIe1Gomkpd3GvHSDeu1QXbEtdk1UuLfTmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hco40UkJ/LJ974yCNovaxYm5+FuXkpGJqf9VEAvMiChsrSVDkG6SkRQdmzGJEGnfJ
	 5PHxFW7NZq+3NPOr+Fl2MgdWimMpeZY2ODf902I5upRxdjvbZ3i0fWNFUFKVwz5376
	 sarKa7OOOmqN/wrbVDCJTG4jon4CbwwBw/fMEWtj0gdyFevO8l3EYhABnul7TmpeJ3
	 J2Qh+B4nHNwZBd77uPfXF8ft5fZDD0mgmRia2eYof5ixddUxV6IVllEdVeGowEEDqe
	 3iVa1mENjSpEmJXHud3qJCJuECpkAklEwqWqCHBi0S6l7LgijA24hx7OeAXNACAARy
	 myO+UMm8U9FWw==
Date: Mon, 14 Aug 2023 17:11:06 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: brgl@bgdev.pl, conor.dooley@microchip.com, daire.mcnamara@microchip.com,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org, Zhu Wang <wangzhu9@huawei.com>
Subject: Re: [PATCH -next v2] i2c: remove redundant dev_err_probe()
Message-ID: <ZNpECrxK2/4yliDG@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, brgl@bgdev.pl,
	conor.dooley@microchip.com, daire.mcnamara@microchip.com,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org, Zhu Wang <wangzhu9@huawei.com>
References: <20230801134814.247782-1-wangzhu9@huawei.com>
 <169100562785.1919254.291391952713888023.b4-ty@kernel.org>
MIME-Version: 1.0
In-Reply-To: <169100562785.1919254.291391952713888023.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_081110_764309_8849E954 
X-CRM114-Status: GOOD (  14.81  )
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
Content-Type: multipart/mixed; boundary="===============4518235316633430388=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4518235316633430388==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rWooky9arVmQwvma"
Content-Disposition: inline


--rWooky9arVmQwvma
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2023 at 10:10:36PM +0200, Andi Shyti wrote:
> Hi
>=20
> On Tue, 01 Aug 2023 21:48:14 +0800, Zhu Wang wrote:
> > When platform_get_irq() is called, the error message has been printed,
> > so it need not to call dev_err_probe() to print error.
> >=20
> > As the comment of platform_get_irq() says, it returned non-zero value
> > when it succeeded, and it returned negative value when it failed.
> >=20
> >=20
> > [...]
>=20
> Applied to i2c/andi-for-next on

Applied to for-next (via Andi's branch), thanks!


--rWooky9arVmQwvma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaRAoACgkQFA3kzBSg
KbZtWA//aMSewd2WeHjx8tMHiurdNOLPVmSF4FrIGKH2SKdG3UEmEspSi0kcT5O0
KPyR3ka1bjNg1EMfdsc36SHeg5kb+DWt6VPpU0ndxhVttQC2ws2W+94pIOWwifGZ
NrTwlxslSkYj08ymo8E/LY0dz8oviEvLNtfs7YPJ/T91VkgCaT0YPQ7fsjph4AHt
rYz7INAMdq9grT60mxTXnJ2M25GFCChi9bPm1/6h210fo8ZNJ/7Z4nfakoQAxI/6
W12VskqhzNn5rt0cv6YIiFHD26UBPFcjT3XuJnKUonGcRdPDzYFcNyzjefyTyTPR
8gzFJVZuE14yjVUT0BAlo8rp3QHyet87Y7/6xtM9wKa8nu0Iw5zaOhSjK9LAuY0N
gKVnxtPS9wuUjA8M/tGA+bnxYXHHne8bIIHBl/td3k/hCYlnOLYY0rfCVzjI1P8y
ZhX2ngVwwEe3Gel5CTdvC0Es2urTNrfTQNRwewV8dv33Z2l5qnB3lzKRTfc8tahI
UCylYP2oy0ecJuCv+FjuSGo30u5tsSsbg9aus2T/2T0FuLTW+fgk7/1P3Tzr8k6D
SzORsNKEaBBnmPHvZ8KO43rvATgXPU/4Qt68qQ4ZbIZweAkabwaZrtFNZTBYAXAY
p0rDCA3UBd34e8BB6509bDTWR2d6BkSWzPDNh3a5tAAJCvn7jLU=
=ID1a
-----END PGP SIGNATURE-----

--rWooky9arVmQwvma--


--===============4518235316633430388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4518235316633430388==--

