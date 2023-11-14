Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12290C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 21:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZquVvDO4OrYQLMrIxft3wUf5DLKLN+H8x0rWIirKa0=; b=2gNha91nYLbm4B1UP9Tly0tXj1
	flxlHTcgGkG5cJIh5aaTtNrFbdhaXLqMx74ptzFawAAfRcHEQwz/37mM5aMmLkA5xqW/lnx9PXLRa
	2yCAG355ja/7qiSC8RxNmAVVqyTJY+ANL1Ru0oSZB+uUXEjQNIb9g1v7E48XqEAX77sVnunvioqsc
	RfAmweccOjohOOgEzDwuxa0GlTMXml3Glo5LnnjuLeMHUZBOMT4w8D4GhLrNkeTRpvLcv6/HwRyuw
	s7XJeuLUChVp12NpscvlrtWIodStShQNC6k9x6kSifJGjxfA9335Eq1pvIv20mFBOkWNlKacXo+5g
	+TwAfvxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r30ts-00GqFF-0p;
	Tue, 14 Nov 2023 21:24:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r30tp-00GqEf-0z
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 21:24:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F51F61382;
	Tue, 14 Nov 2023 21:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B0FC433C7;
	Tue, 14 Nov 2023 21:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699997084;
	bh=rU5BTK7MCrWJgidozp4gErYmRVfFdOvPFsoWYPOMOVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HOMsLcbIOCjcghFxtftq0kqj2pEDJqeoI+K/155mlqiI9bpBNLVkoDczf1gL/3qez
	 pwHe4gt4RQxNMNXE/A11+HHD/DoCKmLjdCmawX7D86TjMMWxN1bHyvWecsofMKf1+n
	 kl3SsV6DsuQyhFVcDU1/VVr5cdk6WkP6yOAh7I76LASv9baa8Jon3m+MyCdUvmb3iC
	 BGYE+dWzYbB5egrR4sKDSEijrtYnUur8PIAf5jHYz9ypYcJXGHY48Qk2ceVhcqMCDR
	 fWorUWkhm4i5Wd918ftpW7rd/r0wg4UFNeu8ElEa6gGJ6eiEH0dOCYmT+2i5Oqmdmp
	 CzP9L3xr6b7Ww==
Date: Tue, 14 Nov 2023 21:24:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <dfustini@baylibre.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v6 6/7] riscv: dts: thead: Enable BeagleV Ahead eMMC and
 microSD
Message-ID: <20231114-subsiding-tipoff-f3c15ef22985@squawk>
References: <20231114-th1520-mmc-v6-0-3273c661a571@baylibre.com>
 <20231114-th1520-mmc-v6-6-3273c661a571@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20231114-th1520-mmc-v6-6-3273c661a571@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_132445_410323_F2655C4B 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============0756937362745315130=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0756937362745315130==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qL6YxW9uEMvtG3Cb"
Content-Disposition: inline


--qL6YxW9uEMvtG3Cb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 14, 2023 at 04:08:00PM -0500, Drew Fustini wrote:

> +&mmc0 {
> +	bus-width = <8>;
> +	max-frequency = <198000000>;

> +&mmc1 {
> +	max-frequency = <198000000>;
> +	bus-width = <4>;

If there's another iteration of this patchset, can you use a consistent
ordering for your properties please?

Cheers,
Conor.

--qL6YxW9uEMvtG3Cb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVPllQAKCRB4tDGHoIJi
0sbHAQCV9T84dReER590s82MvicWkpUR4l10x54e8/+ODO+eqAD/VSf4O8IzwsIw
xhsEnXZ9t0gQ0DPtoaAnudKdE8hG7gI=
=Nvey
-----END PGP SIGNATURE-----

--qL6YxW9uEMvtG3Cb--


--===============0756937362745315130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0756937362745315130==--

