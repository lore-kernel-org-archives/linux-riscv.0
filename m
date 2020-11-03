Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09251C2D0A3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 17:00:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98F4D2080D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 17:00:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zgfZGHAu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98F4D2080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hQzYEBrB6+nRqWPxF7/+ZoBSc8PXB75gqLvUWmObKlk=; b=zgfZGHAuem1wHEplbCPUsD50M
	PJWkwr0iQTL+jSVROQRwL1YxY8Yk9IWvShwbmsCduRSYph4STKPTja+ZeHG+S/63BB/fD0mEgdUtl
	ADmfa5PXdzEVq32qTMC7ARvP4femp9dxm9oOA0cWk63XJr2RrS335ohxh4Ti4Y3RhaxN20WIqgKZh
	HTdse8NIsIQxMmPDSexEIW5lcNDvVheuEaukM4QkPoAf13oRZlN4tuL/L+yB9FWlTMM6v+FeahuLs
	niwHvMjwvlG6xTZLHN5teTtfbpnFlFILblENzxP5KZSB8lDmEdG2ba23qh/aO3UXBXyPoLu/vlVCK
	Y2qdK0EwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZzfo-0000MV-Hh; Tue, 03 Nov 2020 17:00:44 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZzfh-0000FO-GR; Tue, 03 Nov 2020 17:00:38 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D9FF7AC97;
 Tue,  3 Nov 2020 17:00:35 +0000 (UTC)
Message-ID: <0fc240575aad6a538fdc282e419411a615ba93f3.camel@suse.de>
Subject: Re: [PATCH v5 0/7] arm64: Default to 32-bit wide ZONE_DMA
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Catalin Marinas <catalin.marinas@arm.com>
Date: Tue, 03 Nov 2020 18:00:33 +0100
In-Reply-To: <20201030181134.GE23196@gaia>
References: <20201029172550.3523-1-nsaenzjulienne@suse.de>
 <20201030181134.GE23196@gaia>
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_120037_802073_4FE11383 
X-CRM114-Status: GOOD (  32.75  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com, linux-mm@kvack.org,
 will@kernel.org, linux-kernel@vger.kernel.org, jeremy.linton@arm.com,
 ardb@kernel.org, linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
 robh+dt@kernel.org, linux-rpi-kernel@lists.infradead.org, guohanjun@huawei.com,
 linux-riscv@lists.infradead.org, robin.murphy@arm.com, hch@lst.de,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0354818195387005478=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0354818195387005478==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-e4mvEaSQmsP7NUXAJ5iB"


--=-e4mvEaSQmsP7NUXAJ5iB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-10-30 at 18:11 +0000, Catalin Marinas wrote:
> On Thu, Oct 29, 2020 at 06:25:43PM +0100, Nicolas Saenz Julienne wrote:
> > Ard Biesheuvel (1):
> >   arm64: mm: Set ZONE_DMA size based on early IORT scan
> >=20
> > Nicolas Saenz Julienne (6):
> >   arm64: mm: Move reserve_crashkernel() into mem_init()
> >   arm64: mm: Move zone_dma_bits initialization into zone_sizes_init()
> >   of/address: Introduce of_dma_get_max_cpu_address()
> >   of: unittest: Add test for of_dma_get_max_cpu_address()
> >   arm64: mm: Set ZONE_DMA size based on devicetree's dma-ranges
> >   mm: Remove examples from enum zone_type comment
>=20
> Thanks for putting this together. I had a minor comment but the patches
> look fine to me. We still need an ack from Rob on the DT patch and I can
> queue the series for 5.11.

I'm preparing a v6 unifying both functions as you suggested.

> Could you please also test the patch below on top of this series? It's
> the removal of the implied DMA offset in the max_zone_phys()
> calculation.

Yes, happily. Comments below.

> --------------------------8<-----------------------------
> From 3ae252d888be4984a612236124f5b099e804c745 Mon Sep 17 00:00:00 2001
> From: Catalin Marinas <catalin.marinas@arm.com>
> Date: Fri, 30 Oct 2020 18:07:34 +0000
> Subject: [PATCH] arm64: Ignore any DMA offsets in the max_zone_phys()
>  calculation
>=20
> Currently, the kernel assumes that if RAM starts above 32-bit (or
> zone_bits), there is still a ZONE_DMA/DMA32 at the bottom of the RAM and
> such constrained devices have a hardwired DMA offset. In practice, we
> haven't noticed any such hardware so let's assume that we can expand
> ZONE_DMA32 to the available memory if no RAM below 4GB. Similarly,
> ZONE_DMA is expanded to the 4GB limit if no RAM addressable by
> zone_bits.
>=20
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> ---
>  arch/arm64/mm/init.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 095540667f0f..362160e16fb2 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -175,14 +175,21 @@ static void __init reserve_elfcorehdr(void)
>  #endif /* CONFIG_CRASH_DUMP */
> =20
>  /*
> - * Return the maximum physical address for a zone with a given address s=
ize
> - * limit. It currently assumes that for memory starting above 4G, 32-bit
> - * devices will use a DMA offset.
> + * Return the maximum physical address for a zone accessible by the give=
n bits
> + * limit. If the DRAM starts above 32-bit, expand the zone to the maximu=
m
> + * available memory, otherwise cap it at 32-bit.
>   */
>  static phys_addr_t __init max_zone_phys(unsigned int zone_bits)
>  {
> -	phys_addr_t offset =3D memblock_start_of_DRAM() & GENMASK_ULL(63, zone_=
bits);
> -	return min(offset + (1ULL << zone_bits), memblock_end_of_DRAM());
> +	phys_addr_t zone_mask =3D (1ULL << zone_bits) - 1;

Maybe use DMA_BIT_MASK(), instead of the manual calculation?

> +	phys_addr_t phys_start =3D memblock_start_of_DRAM();
> +
> +	if (!(phys_start & U32_MAX))

I'd suggest using 'bigger than' instead of masks. Just to cover ourselves
against memory starting at odd locations. Also it'll behaves properly when
phys_start is zero (this breaks things on RPi4).

> +		zone_mask =3D PHYS_ADDR_MAX;
> +	else if (!(phys_start & zone_mask))
> +		zone_mask =3D U32_MAX;
> +
> +	return min(zone_mask + 1, memblock_end_of_DRAM());

This + 1 isn't going to play well when zone_mask is PHYS_ADDR_MAX.

Regards,
Nicolas


--=-e4mvEaSQmsP7NUXAJ5iB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl+hjLEACgkQlfZmHno8
x/5wjggAjwdWMN+H9Cj7ukCCZxIw/mZ7tdk+jtxD8++ocqSv/BLWzfPJhliE31of
ShuRaGhx2UpgX/fny9Ng9cEMWPdjYb6wpyI7EEm2As3R8aWDXwEFh1bu6PkdPyLu
VBm0BkVSUY5Iu9fQYym1yA1KukGrzijxEW7+QFIUwrm1Bdralpg+67WLbOWUxmdI
SGlntSKWlUcfRXCg+/XzLFfODu+htiXHSSBW1zMWx/OsNPHb6Mupfrtdogqv65UP
aQpkzoqyZBlC9ueBXHtWUiDEv7EUdosKbia5mxa7i9apZ5ZPSy/OkGkY9mZq3evn
XiCaUCaYMdiZx1RCUE2VRr9HqZnuEQ==
=QpfN
-----END PGP SIGNATURE-----

--=-e4mvEaSQmsP7NUXAJ5iB--



--===============0354818195387005478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0354818195387005478==--


