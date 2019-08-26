Return-Path: <SRS0=VR9W=WW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD4DFC3A5A4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2019 11:09:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94FA62070B
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2019 11:09:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AAlNeCtL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94FA62070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1qLa05X1LAj9Oyp7qOC/onhuSNKF8xkDIXZCvoXTsnk=; b=AAlNeCtLcGk0cQiToLnrUIMoM
	NlmHDJ+lFOnZTpYcE7fRcqG+PtV+RaYWLWUHZ/rXnm4Q/bGXYiP0OjpEORSH1AcgNkqhq7xjRVbIa
	MR/qjmt7ueKY3gvnOU+lI9bpWqualzpXy1YtLRm07jpUyXGmRxqC/S0lSeH1+LQT0II8G1+XSAzot
	CQUvcYw94neJhS+ir7Gf1MNHXnmPbKfcSdmT7hk+AAT7byBbqb6gU7+R5UgnsQpSkMNi8cGlgrIjG
	MNxsi4hScjbXh3gmaXz6yHX5OLaDY1DZAcxTkcGnweKgwsKx+Y/UPMGEVj1R6UeDkE4GENrusP+LC
	NWFsq5YcA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2Cry-0006R9-VE; Mon, 26 Aug 2019 11:09:06 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2Crs-0006KO-1q; Mon, 26 Aug 2019 11:09:01 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E9BAEAF23;
 Mon, 26 Aug 2019 11:08:55 +0000 (UTC)
Message-ID: <4d8d18af22d6dcd122bc9b4d9c2bd49e8443c746.camel@suse.de>
Subject: Re: [PATCH v2 10/11] arm64: edit zone_dma_bits to fine tune
 dma-direct min mask
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Christoph Hellwig <hch@lst.de>
Date: Mon, 26 Aug 2019 13:08:50 +0200
In-Reply-To: <20190826070633.GB11331@lst.de>
References: <20190820145821.27214-1-nsaenzjulienne@suse.de>
 <20190820145821.27214-11-nsaenzjulienne@suse.de>
 <20190826070633.GB11331@lst.de>
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_040900_245950_8FDA0AAF 
X-CRM114-Status: GOOD (  11.52  )
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
Cc: linux-arch@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, f.fainelli@gmail.com, will@kernel.org,
 eric@anholt.net, marc.zyngier@arm.com, catalin.marinas@arm.com,
 frowand.list@gmail.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org, wahrenst@gmx.net,
 mbrugger@suse.com, linux-riscv@lists.infradead.org, m.szyprowski@samsung.com,
 Robin Murphy <robin.murphy@arm.com>, akpm@linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, phill@raspberryi.org
Content-Type: multipart/mixed; boundary="===============2999757752184543896=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2999757752184543896==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-RvTUUUche1DA67AZeVhb"


--=-RvTUUUche1DA67AZeVhb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-08-26 at 09:06 +0200, Christoph Hellwig wrote:
> On Tue, Aug 20, 2019 at 04:58:18PM +0200, Nicolas Saenz Julienne wrote:
> > -	if (IS_ENABLED(CONFIG_ZONE_DMA))
> > +	if (IS_ENABLED(CONFIG_ZONE_DMA)) {
> >  		arm64_dma_phys_limit =3D max_zone_dma_phys();
> > +		zone_dma_bits =3D ilog2((arm64_dma_phys_limit - 1) &
> > GENMASK_ULL(31, 0)) + 1;
>
Hi Christoph,
thanks for the rewiews.

> This adds a way too long line.

I know, I couldn't find a way to split the operation without making it even
harder to read. I'll find a solution.

> I also find the use of GENMASK_ULL
> horribly obsfucating, but I know that opinion is't shared by everyone.

Don't have any preference so I'll happily change it. Any suggestions? Using=
 the
explicit 0xffffffffULL seems hard to read, how about SZ_4GB - 1?


--=-RvTUUUche1DA67AZeVhb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl1jvcIACgkQlfZmHno8
x/6y/wf/XTe7dlASMoYApyVt+lL6chBcap2r7MVKOVhCbC1oJQb7UdRyW7MVDO6k
gwdo2WmXqD3wUwhY5djX0adczLOJye1iGEdrrQfheRqm1rh07um3quT3TzgCSPat
OuX+vHuNsUE+3GyI+0OoOF0tu/TzOKJjgs4H645cnbuCaXbQFbL94yBctsDTF5hc
m4Bx+nksz99ddodUnw9CF4Ss5DPwkX23I3h7okwMMjvVuegIPUa9edppw3Za0Kby
k8b9QGCiMsGcwyq3+uSXTCq4iIU8reLTfvpZmVZ9QugMn8TkjjIQFyWS0HrXt2pz
r9iNomMe9w20W9Y9jS5Aj8bxByoK+Q==
=nQ/V
-----END PGP SIGNATURE-----

--=-RvTUUUche1DA67AZeVhb--



--===============2999757752184543896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2999757752184543896==--


