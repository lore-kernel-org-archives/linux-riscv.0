Return-Path: <SRS0=VR9W=WW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B253EC3A59F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2019 13:48:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A0E62070B
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2019 13:48:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pqXQMVs8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A0E62070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VbOYgJGSEqMydiqPupqhyAbwCtbOm1RiO5Qe9t0n37Y=; b=pqXQMVs85e2c2njbg7O0tu9Bm
	KEgNuRQieR10cYlLd4XpyLtz0kBjTKhbtkrRnTh1tNxgonIQ5MEgKdaAWp5nObHfQdg2J70sEMsYM
	V76JOsh72WiziZFICKmXEhl3z+RoUxAuuxCumNiq8eKNRD/VMk5c3F4+v8OAZv2E316GMNQjnG+Pc
	HFB3AfAjdBz+iAfaekcPwBnH+7eFOxY3GAeDWNwD7YMNyCoOMjWntPn52MOLoKkA6vuhjBocVAisz
	NxK1nfi5GXIv1IX24CV+AIsoDv6ZgIjuJhvnkt7dbkHoWuehduzapdI10uj9M7Gls0jZomRcGKw9A
	CFjnRFc5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2FLp-0002St-7n; Mon, 26 Aug 2019 13:48:05 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2FKl-0001pA-GF; Mon, 26 Aug 2019 13:47:01 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4C2D6B038;
 Mon, 26 Aug 2019 13:46:57 +0000 (UTC)
Message-ID: <027272c27398b950f207101a2c5dbc07a30a36bc.camel@suse.de>
Subject: Re: [PATCH v2 01/11] asm-generic: add dma_zone_size
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Christoph Hellwig <hch@lst.de>
Date: Mon, 26 Aug 2019 15:46:52 +0200
In-Reply-To: <20190826070939.GD11331@lst.de>
References: <20190820145821.27214-1-nsaenzjulienne@suse.de>
 <20190820145821.27214-2-nsaenzjulienne@suse.de>
 <20190826070939.GD11331@lst.de>
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_064659_837847_3352C425 
X-CRM114-Status: GOOD (  15.20  )
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
Cc: catalin.marinas@arm.com, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, will@kernel.org, m.szyprowski@samsung.com,
 linux-arch@vger.kernel.org, f.fainelli@gmail.com, frowand.list@gmail.com,
 devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 marc.zyngier@arm.com, robh+dt@kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, phill@raspberryi.org, mbrugger@suse.com,
 eric@anholt.net, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, wahrenst@gmx.net, akpm@linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: multipart/mixed; boundary="===============3428903287585707877=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3428903287585707877==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-rvg1En4pB30QD7Cei8XS"


--=-rvg1En4pB30QD7Cei8XS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-08-26 at 09:09 +0200, Christoph Hellwig wrote:
> On Tue, Aug 20, 2019 at 04:58:09PM +0200, Nicolas Saenz Julienne wrote:
> > Some architectures have platform specific DMA addressing limitations.
> > This will allow for hardware description code to provide the constraint=
s
> > in a generic manner, so as for arch code to properly setup it's memory
> > zones and DMA mask.
>=20
> I know this just spreads the arm code, but I still kinda hate it.

Rob's main concern was finding a way to pass the constraint from HW definit=
ion
to arch without widening fdt's architecture specific function surface. I'd =
say
it's fair to argue that having a generic mechanism makes sense as it'll now
traverse multiple archs and subsystems.

I get adding globals like this is not very appealing, yet I went with it as=
 it
was the easier to integrate with arm's code. Any alternative suggestions?

> MAX_DMA_ADDRESS is such an oddly defined concepts.  We have the mm
> code that uses it to start allocating after the dma zones, but
> I think that would better be done using a function returning
> 1 << max(zone_dma_bits, 32) or so.  Then we have about a handful
> of drivers using it that all seem rather bogus, and one of which
> I think are usable on arm64.

Is it safe to assume DMA limitations will always be a power of 2? I ask as =
RPi4
kinda isn't: ZONE_DMA is 0x3c000000 bytes big, I'm approximating the zone m=
ask
to 30 as [0x3c000000 0x3fffffff] isn't defined as memory so it's unlikely t=
hat
we=C2=B4ll encounter buffers there. But I don't know how it could affect mm
initialization code.

This also rules out 'zone_dma_bits' as a mechanism to pass ZONE_DMA's size =
from
HW definition code to arch's.


--=-rvg1En4pB30QD7Cei8XS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl1j4swACgkQlfZmHno8
x/7+5Qf/RG+HHfwkIbvgTeNBR6PGQMv7ZNDSxgeVo0caYiQnN2w01vHWnEXBnsNK
sj6p2ip+d5CQbSOMO2oVO7qS4+BoOjcdnFTNSLH0uN5coZj6sr8u5N/FFdeb2cI+
6B9opO7apUCnnuwaBeV5Ocepk1gr4rNoRnrOWmFwnqoc9dBRBuKV4ejcEB43ySw6
wxwOswOu17wPR3o6969vTlP29cTItzXnrjmlTn+lKyQpR6pOzC0IpU1tmO0KkfHM
+U0Kypzbtb5Z9uCWvbS42mvT9oV3/El8iqrw1mPxbwRDgwDsBf2awc+fNmnQTsRK
4pDSxPGJ5wST3O0WUjysQ9u+RJC+Cg==
=y9Dx
-----END PGP SIGNATURE-----

--=-rvg1En4pB30QD7Cei8XS--



--===============3428903287585707877==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3428903287585707877==--


