Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5F1CD5BB0
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 20:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6k4LSMAOZM18HIMGrwSgLgtkOg5SyfC4WvP9SjWT+U4=; b=RiXaPfTL8EpmBoPjyoq++97Kmo
	pmd+BFCLbAn8zwUpF444l9rP3b7tuW5CXhT8HKRhI9eMND5Wuty0I0oZf+/q+gql+1DzBBqbWq/IF
	SB2o2l8GMGdWmMQSWrrUkQ/oQDsDwuDaEOXyAVxVsDRRDfWkcrux/khgoUCRoEb7pntsZYxKZmkBL
	yyVwn44HsD9z3uH8THsSjPZKHR8bYx/oz0x0yJIC/sSRO2BI6ZqwXWZxt0h3z72LsAwROM6iPqMdO
	u/Sgbmw2RxbuxK9IR2CI/G5njZO9ZV0CCzr197/4/2O8B03Ly0C5IabO/Wcdc2v/1rpunOR8A4Blv
	Fv64mEkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQWeb-0000000BtXX-1ZgW;
	Fri, 22 May 2026 20:39:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQWeZ-0000000BtXJ-3gBd
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 20:39:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E86F60136;
	Fri, 22 May 2026 20:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C6D1F000E9;
	Fri, 22 May 2026 20:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779482371;
	bh=jzyuahkmJrkIfcmMx4CX9UsZ36wBGpvzYs+R4VQvaag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W9eEG1/WTyNg852Hc717laNEoKKcGetjNVIvMZJe0jRfjVNwR/rtIROUZKnvsGopP
	 UAsIwpCC55xZQz5WU4fJWt4UOjFxHIeki0sS4KRubt7IEFpIPxUlBVrWs6xKoBTxkl
	 Oynw85NLsHrVPPLjafi4rqd5IeVMmt3nKlOhHO8Aj7n1kC/8T2M5lTYMF6OliO5TvE
	 pyIwcZkYsvEccxYOjc9lSTfelbdPaWJhSO7jLJBmBo8qIuemIaFm1cvq8ZFLfa85sX
	 8c1n7UzmHUzSTbGvh6w50rU6o+datR4+aNBlgcgPbsT5ozgQuwlR31R1fimQ5d5HOc
	 NJvdmX5czQmZg==
Date: Fri, 22 May 2026 21:39:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Xukai Wang <kingxukai@zohomail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Troy Mitchell <TroyMitchell988@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] clk: canaan: k230: Fix sparse warnings reported by LKP
Message-ID: <20260522-removed-lyricism-7c879febc3b3@spud>
References: <20260522-eligible-vivacious-3ce9bc30dd53@wendy>
 <dee4605ca30f9bbd55ccb4fcce9590ceee1fa10b.1779453284.git.kingxukai@zohomail.com>
MIME-Version: 1.0
In-Reply-To: <dee4605ca30f9bbd55ccb4fcce9590ceee1fa10b.1779453284.git.kingxukai@zohomail.com>
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
Content-Type: multipart/mixed; boundary="===============2531900281692637321=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2531900281692637321==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6w0P95clb1jZsxRa"
Content-Disposition: inline


--6w0P95clb1jZsxRa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 08:59:12PM +0800, Xukai Wang wrote:
> Fix all sparse warnings detected during LKP randconfig testing:
> - Replace plain integer 0 with NULL.
> - Add static modifier to k230_plls and k230_pll_divs.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202605220724.j4ZeM3KI-lkp@i=
ntel.com/
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>

Forgot to reply earlier, but I went and squashed this in.

Cheers,
Conor.

--6w0P95clb1jZsxRa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahC+/QAKCRB4tDGHoIJi
0hSIAQCWDWG3TSikZRlt68Uwd3kshWGbSzsv40UokBTQi61KAgD+LGC81U7fOT85
ukUFrT5pG/T/xAV/bsq/DJl2h1YafAk=
=tMpn
-----END PGP SIGNATURE-----

--6w0P95clb1jZsxRa--


--===============2531900281692637321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2531900281692637321==--

