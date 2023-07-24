Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A3AC0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 07:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atRGsuLgH2YWqG9cBEDtD0bi4Y/YgOK1tbXxmZIUAS0=; b=eTF9aJM6vINSkDGN6TVJiyGAX6
	HuPVb5LWEGXccG8dw/sSh6IsB2to41wAzR/Fl8gNvw+WnWz5jjVCQ0X6SyF8t21nyzLmEb3zmd02V
	QWiONX5AB4ka3PtqhqUzhWJhQA8+5FtxTaA7/v4FCWtlVGASYfjY+4/hB9VJogG+PQ2ad7xEGxwoC
	S5QZNdmL1pOlq5ijStKWj6eQyiTbUL9ZjbxxzG1WTJw7ehOkBYV5vYzPagb/yc8BapaHM7Z71BZgz
	Z+I6svKOjAliTt+bxKEIIM0+5KRKdSI7Y/aKKU7WktYM/5wjiOVpR+MuS1Q476XWGGTrTrJvStY+q
	vySLkalg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqKe-0038ag-0O;
	Mon, 24 Jul 2023 07:50:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqKa-0038a1-2T
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 07:50:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690185012; x=1721721012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cFSk2zmVNjF+ma0HjJ0LslmgIPzvLIjCxHLecSYlzvM=;
  b=cKEsHDYyYvRFg7qrK9kgZ8L+MXW7o5LbWl43YoHOnrOWjeeyt7Rm3zVn
   bdzesjEjy5VFEy7MX1MSPCHeqQkidUsDmY2sJwD2lIx10Jj5IrdFOMgel
   Z8CrDdm6r+G15jUrZra9Ck+wm22Jt/2lnMpCgOqXFlaAzfybIAPWvj6Yg
   N2OD3AcOjqO4CVnNiuJcBYcc9Fiqg4ghtZ6Yt3Q8P4DXPCZeuaPVYZNNe
   lCql04DxwwDZS7JxTfeN1qpl+FpQzC2DcyuDJuyBPFl77Qod4RDLGmdn1
   1p53w/LIWspzrXptOBINXqLi7It/lJbC76FzYExO71DBGmC1TQqXdgaTo
   A==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="asc'?scan'208";a="237267499"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Jul 2023 00:50:09 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 24 Jul 2023 00:50:02 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 24 Jul 2023 00:50:01 -0700
Date: Mon, 24 Jul 2023 08:49:27 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jisheng Zhang <jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] riscv: allow kmalloc() caches aligned to the
 smallest value
Message-ID: <20230724-next-shifter-3ec32114b34e@wendy>
References: <20230718152214.2907-1-jszhang@kernel.org>
 <20230718152214.2907-2-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230718152214.2907-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_005012_840051_6C30C7EC 
X-CRM114-Status: GOOD (  20.53  )
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
Content-Type: multipart/mixed; boundary="===============4594076665616904814=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4594076665616904814==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lbLuWTJ0u5bINZ3+"
Content-Disposition: inline

--lbLuWTJ0u5bINZ3+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2023 at 11:22:13PM +0800, Jisheng Zhang wrote:
> Currently, riscv defines ARCH_DMA_MINALIGN as L1_CACHE_BYTES, I.E
> 64Bytes, if CONFIG_RISCV_DMA_NONCOHERENT=3Dy. To support unified kernel
> Image, usually we have to enable CONFIG_RISCV_DMA_NONCOHERENT, thus
> it brings some bad effects to coherent platforms:
>=20
> Firstly, it wastes memory, kmalloc-96, kmalloc-32, kmalloc-16 and
> kmalloc-8 slab caches don't exist any more, they are replaced with
> either kmalloc-128 or kmalloc-64.
>=20
> Secondly, larger than necessary kmalloc aligned allocations results
> in unnecessary cache/TLB pressure.
>=20
> This issue also exists on arm64 platforms. From last year, Catalin
> tried to solve this issue by decoupling ARCH_KMALLOC_MINALIGN from
> ARCH_DMA_MINALIGN, limiting kmalloc() minimum alignment to
> dma_get_cache_alignment() and replacing ARCH_KMALLOC_MINALIGN usage
> in various drivers with ARCH_DMA_MINALIGN etc.[1]
>=20
> One fact we can make use of for riscv: if the CPU doesn't support
> ZICBOM or T-HEAD CMO, we know the platform is coherent. Based on
> Catalin's work and above fact, we can easily solve the kmalloc align
> issue for riscv: we can override dma_get_cache_alignment(), then let
> it return ARCH_DMA_MINALIGN at the beginning and return 1 once we know
> the underlying HW neither supports ZICBOM nor supports T-HEAD CMO.
>=20
> So what about if the CPU supports ZICBOM or T-HEAD CMO, but all the
> devices are dma coherent? Well, we use ARCH_DMA_MINALIGN as the
> kmalloc minimum alignment, nothing changed in this case. This case
> can be improved in the future.
>=20
> After this patch, a simple test of booting to a small buildroot rootfs
> on qemu shows:
>=20
> kmalloc-96           5041    5041     96  ...
> kmalloc-64           9606    9606     64  ...
> kmalloc-32           5128    5128     32  ...
> kmalloc-16           7682    7682     16  ...
> kmalloc-8           10246   10246      8  ...
>=20
> So we save about 1268KB memory. The saving will be much larger in normal
> OS env on real HW platforms.
>=20
> Link: https://lore.kernel.org/linux-arm-kernel/20230524171904.3967031-1-c=
atalin.marinas@arm.com/ [1]
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--lbLuWTJ0u5bINZ3+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL4tBwAKCRB4tDGHoIJi
0jIWAQDK3i9Q+yWDW+zT3HKMI/9vFe2vBFuaDRF2zhYd1DnQmAD/eQucZDuJ1yvE
Dnzs8qBMYSXxWuN7amY5rN5pjrjroAo=
=PbNw
-----END PGP SIGNATURE-----

--lbLuWTJ0u5bINZ3+--


--===============4594076665616904814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4594076665616904814==--

