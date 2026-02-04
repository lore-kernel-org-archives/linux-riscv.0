Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF99E9D41E
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 17:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xCdCadQzFamENnqeODFnXIKKTFlCKZewfCh3XvKWn4=; b=ylzMn7Rjo9JWBlne8rOOuLC/Zo
	sHxdHQWnP4D5Dv0GNgQ3MO4HlL0LT2qThc1/C6M4i94udmJwCDGL3DkmCs6jdIfZrFtbJCwXPD8A1
	8XsPJc/G41zmz7PUHS8yb347wRx2PfaTQg8FYquKcB8reh1Sj2TBaVARbXYPjQ1ayqAg3qDAsWQwG
	57Nybd42zA/K4IEOab5czDma/7wbFA7LVFnUAiXkxQgKOeBaWqepPHboDPNbPU5wBEY8tV5f3kwSD
	2cuh3PsjxxhANBisjTPcDxmNle/iajkhGZavukFbuRvE4nMTHpCg/drSWrv9kQJhUK1jvxNIS6gBN
	RrV55XTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngxi-00000008sbb-1az9;
	Wed, 04 Feb 2026 17:46:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngxg-00000008sb8-3CoG
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 17:46:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 25B14436C9;
	Wed,  4 Feb 2026 17:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D21C4CEF7;
	Wed,  4 Feb 2026 17:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770227204;
	bh=pn/M0MfcHQvMkT7h1BWDNF7KZy03z6oNN6WU6NquQZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CzWXersrCUIkXq3naw8jZT/Cypzo3Zltf0z7i4OBkEVtPmHTTiuxdjjdBTT7xC5nE
	 uD8094XuKecR1080V6LgbDe9FxPaY68FXNrex7SAC9pcCTOhpDsWUfQEN8t0bZ8MSp
	 nsCqfWlOmWVZXyH7LKmV5qeiOk2M3C2MtLtUDlA9rnF83IAp/se7aFCPFYTrvxKYFp
	 KBQ33aArBvr8P0dtxlLiO91st+IzwZdqksOA1QoAramO3NnQ9X/O1HJR7Jzdhfm5gP
	 wh+qsxluTQ6OhhefBaSEbQ83bnLXp6+wLwqRWTpMAfRKbDGwfHD1hUYo4OpVHhNaZ+
	 91o8L1SgnBt+g==
Date: Wed, 4 Feb 2026 17:46:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Anup Patel <anup.patel@oss.qualcomm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	Lucas Zampieri <lzampier@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Mason Huo <mason.huo@starfivetech.com>,
	Zhang Xincheng <zhangxincheng@ultrarisc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Marc Zyngier <maz@kernel.org>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
	Jia Wang <wangjia@ultrarisc.com>
Subject: Re: [PATCH v3 1/2] irqchip/sifive-plic: Fix wrong nr_irqs handling
Message-ID: <20260204-implosion-defuse-f0bb02febc77@spud>
References: <tencent_AEBB719FAF49D05B5BDF7118D729463F6405@qq.com>
 <tencent_3927462924B7319F8F4F90447BDC110FB705@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_3927462924B7319F8F4F90447BDC110FB705@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_094644_824814_350634BA 
X-CRM114-Status: GOOD (  15.22  )
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
Content-Type: multipart/mixed; boundary="===============4798943279666686811=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4798943279666686811==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ikgF83E3PUlqo6C9"
Content-Disposition: inline


--ikgF83E3PUlqo6C9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 04, 2026 at 01:21:16AM +0800, Yangyu Chen wrote:
> Since the first irq source is 1 instead of 0, when the number of
> irqs is multiple of 32, the last irq group will be ignored during
> allocation, saving, and restoring. This lead to memory corruption
> when accessing enable_save beyond allocated memory after commit
> 14ff9e54dd14 ("irqchip/sifive-plic: Cache the interrupt enable state")
> which will access enable_save for all sources during plic_probe.
> Thus, we should allocate irq_groups based on (nr_irqs + 1) instead of
> nr_irqs to avoid this issue. This commit also fixes related loops
> to have all consumer of nr_irqs consistent.
>=20
> This is an long standing bug since Linux v5.6 but since the last irq
> source is rarely used, it may not be triggered in practice until commit

FWIW, on mpfs the 186th and last source is used by the hardware but it's
used by the platform's m-mode firmware not linux.

--ikgF83E3PUlqo6C9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYOF/QAKCRB4tDGHoIJi
0pDSAP9PQB0BBn/A9qA110dayuxYw75k+Pg14c9AiodVFvguygEAt8CiSIAXGohM
dnWhhn5mtxb1+19D/TmCaMQSQirtIwU=
=QgAh
-----END PGP SIGNATURE-----

--ikgF83E3PUlqo6C9--


--===============4798943279666686811==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4798943279666686811==--

