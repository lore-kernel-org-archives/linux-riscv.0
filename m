Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45638EE0ADC
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 14:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9GcmbuEutNI9dUhUY/QmtP9iFEKh0Ag2zKIlfSZtUxI=; b=HgD6EDjvrQ6OoGYvvJIyptTr27
	T6pK0fle2epzny+7fN61QDT+1ohGfIN5R/k4pLPIJaSn6cMMv7wmDZOGCVPY/DUG3XzTRhdYz0C8h
	Rpr+gF/F8s9v96h0diAPfwQp4SwP1imik6InK2/0TjHJI1vwkqwPo4Q62PLTGeCKWx7+z7Wm4F7QQ
	yVMPlJiq5XNy9Az/A/ttPkQog+qk5LVOGC6VsTF/7T5gMo4Wjp2emttmHdzuCvnh07f+XX5zEB13R
	S9dxxuvVg9joFTU30WUUYLLjx3sh9+g1hV9IvHlKqioDWwvOVM9o+TYy2ozkCLb20JdWf+VLM2TNL
	suvlc/QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vojiW-0000000CYR0-3TC9;
	Sat, 07 Feb 2026 14:55:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vojiU-0000000CYQo-3tiH
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 14:55:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5DA8B6001D;
	Sat,  7 Feb 2026 14:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3EDC116D0;
	Sat,  7 Feb 2026 14:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770476122;
	bh=/Vn1e2hoVlCMMBL+WFkQl4UcnH2Hfa5hsCRlW3VBLWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rei9Oyl4Wxf2xzDBJ9LwHboVDd0CBlU2GARJoyFyj1VldpMGSmc/r1sHbhjwVzbFQ
	 jA5mH24TAFNtiLcE22pTKmo/kg/qFkk1I1ONJWyKeRTvlpF5jKV/CsQhwW+MvgxXCU
	 PlHwaWzAjcYXzlIQt+CVOqXycKWu5encomi/wDThmt9jgL9dK1eY2hi6e1Jb1Vzgfp
	 nJDulxCwkAYxInL0vypevNk8UyeGxW3zwq/oUUuKUpevEmZB6s3+QL2h+Qtz3IYU63
	 NUv1zUKNkOhvQMpAIyBP+9BKM0hbwNCl4wvkiDRxWzngc0/B5Ycuja/ckHK+SqrnsO
	 xGt0RX3aqKNog==
Date: Sat, 7 Feb 2026 14:55:16 +0000
From: Conor Dooley <conor@kernel.org>
To: Lv Zheng <lv.zheng@linux.spacemit.com>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jingyu Li <joey.li@spacemit.com>, iommu@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/8] dt-bindings: iommu: Add spacemit/t100 features
Message-ID: <20260207-gap-taekwondo-40c0661eaa08@spud>
References: <cover.1769562575.git.lv.zheng@spacemit.com>
 <cover.1770195980.git.lv.zheng@linux.spacemit.com>
 <A0E91F323138E92F+a27d73b00f3324f0d3885128f5596230b3f1370b.1770195980.git.lv.zheng@linux.spacemit.com>
 <20260204-primer-wrought-6f64b14bf152@spud>
 <53171BEB06F43599+7c1f54bc-e72d-4cbd-9d10-194ae6b13744@linux.spacemit.com>
 <20260205-attitude-customer-129fe2bd5dc7@spud>
 <B8005DB6301AACB4+374512e1-f561-4d2f-afd6-7a4b51012501@linux.spacemit.com>
 <20260206-buffed-scrubbed-36fc49ada496@spud>
 <7433DA16B96EE987+9b6398e6-edad-4a2e-814d-921483e5f1da@linux.spacemit.com>
MIME-Version: 1.0
In-Reply-To: <7433DA16B96EE987+9b6398e6-edad-4a2e-814d-921483e5f1da@linux.spacemit.com>
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
Content-Type: multipart/mixed; boundary="===============7796107975879175106=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7796107975879175106==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mN4chUiAHJni2zvS"
Content-Disposition: inline


--mN4chUiAHJni2zvS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 07, 2026 at 12:24:30PM +0800, Lv Zheng wrote:
>=20
> >=20
> > Also, I don't see an answer to my question about whether the hardware
> > will work without the driver changes this series introduces and enables
> > with the new compatible?
>=20
> Basically, T100 is riscv,iommu compatible, its IOATS part should be able
> to work using standard HPM events with standard riscv,iommu HPM
> compatible driver.

That's fine, that's all I wanted to know. The riscv,iommu compatible can
stay :)

--mN4chUiAHJni2zvS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYdSVAAKCRB4tDGHoIJi
0n51AP4035S/CKCxinCsG9YuPN4rFYU+scihXululGWkNe1FfwEAi9PnqZh5dPw+
dqNXvYjrQVtAVZ215qZDKcazpcqFHAI=
=pm4A
-----END PGP SIGNATURE-----

--mN4chUiAHJni2zvS--


--===============7796107975879175106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7796107975879175106==--

