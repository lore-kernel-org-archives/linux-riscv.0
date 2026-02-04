Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90670E83EF6
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 17:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEaEwIn82XUXG7QwezLS1STKf+8bcgdhcs7X+VF81Ic=; b=kQYVjV9eT3C61r7R2oi9NhPZkl
	EcUZ6q8uHzIrENYR8EE0jBP46MZ50J3dedp3MmmOVokLKXLOQyBu3bwBmBlNsIZMosx9giYU09BW2
	d9e4ywArnhs69VeohP+4ksKlpHhAh9TwvzL5368ZA9fbC4SOe2/pR9V3SR6xh4TpAwE6Yyxo9rqkB
	sC2S9bcw2XBWZfyuoHz7+fKcWBNUGiYelYUbElOiC4Wqhg98qAyvxUC7wBo07KiHGFT4YmzgMtWsK
	WlJ537MqtCCCIwPYM2YS3g4fdF1SVmxHa+BrYx5072yooPFUIp7e+OzYlPJvDetvnrqmu+ezqy9qS
	wiu8DA6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngpb-00000008rYA-3xff;
	Wed, 04 Feb 2026 17:38:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngpa-00000008rXi-00qZ
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 17:38:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB21C41E65;
	Wed,  4 Feb 2026 17:38:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13636C4CEF7;
	Wed,  4 Feb 2026 17:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770226701;
	bh=szEiRqNQBmBl7xB3+WCKENyasS6skJktBrmm9AAZG38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OK7mxYwl5E5s94aPs5ejbwJwn+I0fRMo+pjfbWuEl14jpm/cuNrxDl6nLpp90CEg4
	 33XUY3dbyIFmQtbo6TJYO+zr5ppcsJbkWWIxWcKxs9J0ZK8ix5Vp0/WedbhUpQsccb
	 9DuUEZudveuh5ObbojfrsmnZP5QDZ4hsD6/cX4Jt8ODok+fwbWHVKm4S5WpFs37lPJ
	 U3DGGW2XCWjaLiIO8Qea9A7RTF4iUsOiPD3VvKtwn49l4LYQBQauSb7f3S+vlWjvU6
	 KmeAvb9OPMU/bHH/1GWkpkFGhlq5yEOpCaNTMirEGJOc/fl+9AqLIDRxALp03Se55B
	 owkMaQ9Waz6Tg==
Date: Wed, 4 Feb 2026 17:38:15 +0000
From: Conor Dooley <conor@kernel.org>
To: Lv Zheng <lv.zheng@linux.spacemit.com>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jingyu Li <joey.li@spacemit.com>,
	Zhijian Chen <zhijian@spacemit.com>, iommu@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 8/8] perf vendor events riscv:: Add support for
 spacemit,riscv-iommu HPM aliasing
Message-ID: <20260204-suds-shush-d85872589cb3@spud>
References: <cover.1769562575.git.lv.zheng@spacemit.com>
 <cover.1770195980.git.lv.zheng@linux.spacemit.com>
 <5242DDF0A783AF08+e141f1898581018f8dd0723cb5c870c23ec679d6.1770195980.git.lv.zheng@linux.spacemit.com>
MIME-Version: 1.0
In-Reply-To: <5242DDF0A783AF08+e141f1898581018f8dd0723cb5c870c23ec679d6.1770195980.git.lv.zheng@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_093822_080784_3D6D37D0 
X-CRM114-Status: GOOD (  14.71  )
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
Content-Type: multipart/mixed; boundary="===============1909441653854423549=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1909441653854423549==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iqh0NaWGo05RcNxz"
Content-Disposition: inline


--iqh0NaWGo05RcNxz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 04, 2026 at 05:09:52PM +0800, Lv Zheng wrote:
> Add JSON HPM event aliases for SpacemiT distributed IOMMU (T100) which is
> general and compatible for all SpacemiT RISC-V SoCs.
>=20
> Signed-off-by: Lv Zheng <lv.zheng@linux.spacemit.com>
> Signed-off-by: Jingyu Li <joey.li@spacemit.com>
> ---
>  MAINTAINERS                                   |   3 +
>  .../arch/riscv/spacemit/iommu/sys/ioatc.json  |  30 ++++
>  .../arch/riscv/spacemit/iommu/sys/ioats.json  | 163 ++++++++++++++++++
>  3 files changed, 196 insertions(+)
>  create mode 100644 tools/perf/pmu-events/arch/riscv/spacemit/iommu/sys/i=
oatc.json
>  create mode 100644 tools/perf/pmu-events/arch/riscv/spacemit/iommu/sys/i=
oats.json
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7c50701b6001..4d91f99aa742 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22459,12 +22459,15 @@ K:	riscv
> =20
>  RISC-V IOMMU
>  M:	Tomasz Jeznach <tjeznach@rivosinc.com>
> +M:	Lv Zheng <lv.zheng@linux.spacemit.com>
> +M:	Jingyu Li <joey.li@spacemit.com>

To be frank, this looks misguided, or at least premature, to me, given the
state of the patchset.

>  L:	iommu@lists.linux.dev
>  L:	linux-riscv@lists.infradead.org
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
>  F:	Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
>  F:	drivers/iommu/riscv/
> +F:	tools/perf/pmu-events/arch/riscv/spacemit/iommu/

--iqh0NaWGo05RcNxz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYOEBwAKCRB4tDGHoIJi
0rAbAP9BQO+rmDwgyVtdWWl0COzirfBZ1h1MHPLEsDSPOC3q8AEAkAY/lFFX/2Ft
ThczQMoz8DL7QCbK+gjE+pWs9vdsNwE=
=n4nj
-----END PGP SIGNATURE-----

--iqh0NaWGo05RcNxz--


--===============1909441653854423549==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1909441653854423549==--

