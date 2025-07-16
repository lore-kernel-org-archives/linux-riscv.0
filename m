Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45682C83F1B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 15:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3bGc6UfmkMOtVo/cXimEgXbJSRAzS4PmQOq42i5LGo=; b=MtCklMum4GrPd1k7upeEcH7c5Y
	G4f84xhXKswwzRleb6fGIGEFnQtN5QU1MdykjY13PdPCFY7HeSLO+WXgobZrEv+TlkLx91fSy5OSi
	okZ67z/HZHRmSaU1PFcDIzzbnKIbhyLG+5QQ/evTkMoTdwWAajFsRaTxk60/A7+KccWO3wTra9IK7
	i7SPcoBsEDwGFEzYq0YqzB+ux3PG+SXuhRUbQaTptNlP1/Nx12q44TFrF55rKwOlxvW2Uv/GuuHEQ
	sKFqdY5prpPbH5V01ASS91ZmmFrcrnVzhqHe6FrzN6jo/v+qtbuaKuFNL5E6bRsILGo1T5iSnFzTp
	8eXBIohg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc448-00000008410-1VMq;
	Wed, 16 Jul 2025 15:29:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc43G-000000083qY-1jmG
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 15:28:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D0D25C4C62;
	Wed, 16 Jul 2025 15:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C82A7C4CEE7;
	Wed, 16 Jul 2025 15:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752679689;
	bh=PLaFyrTZSgPQxnnq5A6CsW2wAd/VIdnrpt20+r3fAqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YY0GfXzVmoPInSKmyKY/Dem+gyeSPVk1nZbMmjfs+Gbv9kC+svGl8eg1H7yt9hW14
	 9WKr+U2TdMkCUq/XdSpXNy/f2l/ccVo1XAaERlXa3walgi2ymbSthHZN/I9Ba21vp8
	 REuJles6/tMu05ytWKYkyYJolPvn9pSogMuTl3BxZKLdnrq/gPDIZxFteuBribazZl
	 dO3WZISNcig0RO4eEYvmP8D35jItJpXegGkIoPfL36uCQqUxGSzgvYgZG8ogER8l6p
	 FJ9dB9v+tmSVzSdNuvwfd5xImb+alBlHBrWYrekY2+WXhGQ16mCLjCLoIGmCUtCBVP
	 Rfe86LtYJI9qQ==
Date: Wed, 16 Jul 2025 16:28:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: E Shattow <e@freeshell.de>, Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-milkv-mars sort properties
Message-ID: <20250716-strategy-evasive-57b400af9366@spud>
References: <20250716061940.180231-1-e@freeshell.de>
 <CAJM55Z_77aygReSPJyZMtfZWk_UPYTzYLH5E5uEw6K=GSu0LNQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z_77aygReSPJyZMtfZWk_UPYTzYLH5E5uEw6K=GSu0LNQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_082810_495340_E53CDED1 
X-CRM114-Status: UNSURE (   9.25  )
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
Content-Type: multipart/mixed; boundary="===============1105675794540778107=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1105675794540778107==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QY1VDzpXbH2iHrik"
Content-Disposition: inline


--QY1VDzpXbH2iHrik
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 02:17:34AM -0700, Emil Renner Berthing wrote:
> E Shattow wrote:
> > Improve style with node property order sort of common properties before
> > vendor prefixes
> >
> > Signed-off-by: E Shattow <e@freeshell.de>
>=20
> Thanks!
>=20
> Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

I'm going to pick this up, but it may be very late for 6.17.

--QY1VDzpXbH2iHrik
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaHfFBAAKCRB4tDGHoIJi
0tbhAP49A33ooW0x1UZXm/4k6+tATPIUCFgFOI0V3816kY6f2QEA20//CID/p17f
FFRatvbs4sk7aWNyYzP3AzOCETAfYQY=
=T7Vt
-----END PGP SIGNATURE-----

--QY1VDzpXbH2iHrik--


--===============1105675794540778107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1105675794540778107==--

