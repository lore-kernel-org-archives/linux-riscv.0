Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B0ECA5FC7
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 14:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3zn7ejgh8YZ4axDnmepwwDgun4OO7ftmEs+nEZdRwA=; b=RctCuiMNbKR4wtNiZ/qKc6W/NQ
	dgVpon/zhAmD7c50tzO5bx/UA7PQ/31JpW3qmQEerzkoZmRF1EOjNiVCI6iTXsC3+46qweRhczFF0
	O6whslfXRr/olhgYgrHF3LmkcgLAiaXjtXIumnhFu0m+MFEnBtH3ETbJx339b940EdP71NHs0EP1R
	/8joBo+BEywfGyqjmRPxt1REdGFR3EYxN2qzUrAHEaW+a0sR51s92WtZq2YWtvjM+uzymVn0ltbnE
	lV9rsMO6OX2iOfULyxNiuaLvKB2ST0tAFTfT8OfmntcUks7xRd9EtYB/JInEsF6iF3Su1gt2r+WQx
	SY1Cf1aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvAr-00000006IGl-2Ttf;
	Wed, 30 Sep 2026 14:20:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvAc-00000006I4o-09yK
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Sep 2026 14:20:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YgBBDnZj+4lj/46sh1ItVGh01XPhzmJ40O9z6m2d/As=; b=BHuyc+xwi/gXG26EEC4bn1A7ld
	msJ0M5Ul44S9JTvoMmv/LHIqJtkJNjow6q4607BgQsnORfYK0zgut+MidYU1Qrq4646hDBQNGxwu2
	PQl2zWPPKmM1cCPSz25OjiWhqElZYtCVNqxCOdumf3EnLw232WPMKfM5nr9pjJFKc0owAj87+0gtl
	EDDFKcgN+bycgVty0ef8NXM0DObLjfWH3ewUiulkCSaq3iMQGkfz+41hm25T//ranPYbQSvpOL045
	PT3xIctpyC0l2bj9QUUuwgRoEeG8rDurL0djgAwrTaEy37th2FoUNo64ey/UICqYnzRgcy2K13qR2
	0adg6ZOg==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBvAV-00000003ugM-1mjg
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 14:20:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790778023; x=1822314023;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kCB4rMy72t6lstrsvtZpL3+kGrYokSHmdSQFAird/Fc=;
  b=qcrBPLokrr/unrWdvo50XZ4iXHNSnfiGWKQAt+/RYvRBMIxUoKtKf5hk
   59pcNNgs3m9KCxET4zc2fBn6tCAjqII23JAsJgKjRGJ/bg8BDngfAp3i/
   hbudROWkqJO/xJY4Dpa2l4PJoe3hxdGrhK/nZOQhcmd5akP2xow9niw71
   puhM50jIzg35I9uCjnzc8JBHvZPr1sgaEDn7mHAF0/lUuvvb3qceUZb/g
   yvl7f8uARCdKA2bUJnK5Zs4G+YCn5bjzBQAy/DEI035FbWDCIQWIZi7Un
   eXg2G506BVnYv1vhnw39Oou7MzX13Fr4lB5oqxbeBL6JjrlwM2mA6QWGU
   A==;
X-CSE-ConnectionGUID: 5UlyJrXIRiKfRQ7wTS9rwg==
X-CSE-MsgGUID: 9gbWqOU1Ts6BYkfY4HLAGQ==
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="asc'?scan'208";a="295783353"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 07:20:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Wed, 30 Sep 2026 07:20:13 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Wed, 30 Sep 2026 07:20:11 -0700
Date: Wed, 30 Sep 2026 15:18:52 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [RFC PATCH 0/2] drm: add a noncoherent mapping checking helper
Message-ID: <20260930-zippy-container-d48f72432c1f@wendy>
References: <20260930073528.3369325-1-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20260930073528.3369325-1-zhengxingda@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_152024_249225_B995DD05 
X-CRM114-Status: GOOD (  25.67  )
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
Cc: Simona Vetter <simona@ffwll.ch>, Dominique Belhachemi <domibel@debian.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, Michal Wilczynski <m.wilczynski@samsung.com>, Paul Walmsley <pjw@kernel.org>, David Airlie <airlied@gmail.com>, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1257231661477502048=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1257231661477502048==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OqEFKY6wsUz/m5my"
Content-Disposition: inline

--OqEFKY6wsUz/m5my
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 03:35:26PM +0800, Icenowy Zheng wrote:
> This patchset tries to address the lack of uncached mapping support on
> several SiFive-core-based SoCs, currently targeting JH7110 but EIC7700
> would have the same problem (although it uses DC8000 display controller
> instead of DC8200 and real display support is pending).
>=20
> Because other users (either SoCs with Xuantie cores, which have
> Xtheadmae extensions or non-RISC-V SoCs) of the driver have proper
> writecombine support, a helper is added to check whether coherent
> (cache-bypassing) mapping is available. This helper currently returns
> true for all architectures except RISC-V, and checks whether
> pgprot_writecombine() is a no-op on RISC-V.
>=20
> The patch really enabling manual cache maintenance for the verisilicon
> driver is picked from Dominique, and reworked to check both
> dma-noncoherent property and the platform's mapping capaibility.
>=20
> Tested on VisionFive 2 with the display enablement patchset at [1] (and
> its dependency).
>=20
> Also tested on Lichee Pi 4A (TH1520, which has Xtheadmae), operation is
> not affected, map_noncoherent isn't set and Xorg says kernel dirty
> updates aren't required.
>=20
> [1] https://patch.msgid.link/20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7=
@samsung.com

Out of curiosity, have you seen Bo Gan's series from a few months ago
that creates an extension/erratum to get these devices working?
https://lore.kernel.org/linux-riscv/20260316060328.1173634-1-ganboing@gmail=
=2Ecom/

I've been meaning to reply to it over and over again for the last number
of months, but I just haven't had the time to actually understand the
detail of the EIC7700 solution or check whether it works yet. I know
this is just one driver because the JH7110 only has this problem for the=20
display pipeline, but according to Bo Gan this applies to all
peripherals on the EIC7700.=20

>=20
> Dominique Belhachemi (1):
>   drm: verisilicon: support non-coherent DMA framebuffers
>=20
> Icenowy Zheng (1):
>   drm: add a helper function to check availbility of coherent mapping
>=20
>  drivers/gpu/drm/verisilicon/vs_cursor_plane.c |  9 ++++++
>  drivers/gpu/drm/verisilicon/vs_drm.c          | 32 ++++++++++++++++++-
>  drivers/gpu/drm/verisilicon/vs_drm.h          |  7 ++++
>  .../gpu/drm/verisilicon/vs_primary_plane.c    |  9 ++++++
>  include/drm/drm_cache.h                       | 21 ++++++++++++
>  5 files changed, 77 insertions(+), 1 deletion(-)
>=20
> --=20
> 2.55.0
>=20

--OqEFKY6wsUz/m5my
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar0aTAAKCRB4tDGHoIJi
0gIjAQCmqfpa8F+zRS9qou6Cpt/edun4UcrGLDrhAT9zS7xYcAEAxJhi1xxX/pOq
tlDO5YLG1EFJ07bqeI4vPVUnFSYXcgU=
=z16F
-----END PGP SIGNATURE-----

--OqEFKY6wsUz/m5my--


--===============1257231661477502048==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1257231661477502048==--

