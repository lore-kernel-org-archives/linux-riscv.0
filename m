Return-Path: <SRS0=k0Aq=WY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D55C3A5A1
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2019 09:44:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD2CB20856
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2019 09:44:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CLRAGIcz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD2CB20856
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Fnufgk2bPXE2zzygA1/LKBM2NbUmvxBDxA8zVYFKr0M=; b=CLRAGIczRaXI/ivq9zV8yYVZE
	eKL85FShuBpBeN+dTaGJuE6Ez0HAO8GGBzmylwhoZSGPHRrP9ZB0gsJADESBf6mEnNl/7gbLycuJA
	IM76Y633QZwVSwESjOope0ElOlgT401zdmIRohudEUZburCoLbXxRMKh1G/qPmppD4lezWm3IMhFv
	A+ZGwDX1Q28ZWPx2Y/jj73vf+OOgV2qDfKtw7L12YWe1KS724XR2UGo0V80butFU/kbSaAhJpvB9i
	uWT8O1nlZ4GGH9Y5+VVpwTTxVATHHZWTWA/ubHd0vC+wBYxlqy8K0AxofNFG+3FN4TQpVnjdkhTZA
	tmyO9lSWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2uVN-0002CR-EK; Wed, 28 Aug 2019 09:44:41 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2uV3-0001yd-ML; Wed, 28 Aug 2019 09:44:23 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7A77DAD26;
 Wed, 28 Aug 2019 09:44:16 +0000 (UTC)
Message-ID: <5271f3041cf16ec06a8266b0072f294384280f54.camel@suse.de>
Subject: Re: [PATCH v2 01/11] asm-generic: add dma_zone_size
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Christoph Hellwig <hch@lst.de>
Date: Wed, 28 Aug 2019 11:44:12 +0200
In-Reply-To: <027272c27398b950f207101a2c5dbc07a30a36bc.camel@suse.de>
References: <20190820145821.27214-1-nsaenzjulienne@suse.de>
 <20190820145821.27214-2-nsaenzjulienne@suse.de>
 <20190826070939.GD11331@lst.de>
 <027272c27398b950f207101a2c5dbc07a30a36bc.camel@suse.de>
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190828_024422_020942_DA698A0E 
X-CRM114-Status: GOOD (  21.65  )
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
Cc: catalin.marinas@arm.com, eric@anholt.net, linux-riscv@lists.infradead.org,
 frowand.list@gmail.com, m.szyprowski@samsung.com, linux-arch@vger.kernel.org,
 f.fainelli@gmail.com, will@kernel.org, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, marc.zyngier@arm.com, robh+dt@kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 phill@raspberryi.org, mbrugger@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 wahrenst@gmx.net, akpm@linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: multipart/mixed; boundary="===============2812521241347977303=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2812521241347977303==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-HuE7CYEmA0DlmwKJIinl"


--=-HuE7CYEmA0DlmwKJIinl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-08-26 at 15:46 +0200, Nicolas Saenz Julienne wrote:
> On Mon, 2019-08-26 at 09:09 +0200, Christoph Hellwig wrote:
> > On Tue, Aug 20, 2019 at 04:58:09PM +0200, Nicolas Saenz Julienne wrote:
> > > Some architectures have platform specific DMA addressing limitations.
> > > This will allow for hardware description code to provide the constrai=
nts
> > > in a generic manner, so as for arch code to properly setup it's memor=
y
> > > zones and DMA mask.
> >=20
> > I know this just spreads the arm code, but I still kinda hate it.
>=20
> Rob's main concern was finding a way to pass the constraint from HW defin=
ition
> to arch without widening fdt's architecture specific function surface. I'=
d say
> it's fair to argue that having a generic mechanism makes sense as it'll n=
ow
> traverse multiple archs and subsystems.
>=20
> I get adding globals like this is not very appealing, yet I went with it =
as it
> was the easier to integrate with arm's code. Any alternative suggestions?
>=20
> > MAX_DMA_ADDRESS is such an oddly defined concepts.  We have the mm
> > code that uses it to start allocating after the dma zones, but
> > I think that would better be done using a function returning
> > 1 << max(zone_dma_bits, 32) or so.  Then we have about a handful
> > of drivers using it that all seem rather bogus, and one of which
> > I think are usable on arm64.
>=20
> Is it safe to assume DMA limitations will always be a power of 2? I ask a=
s
> RPi4
> kinda isn't: ZONE_DMA is 0x3c000000 bytes big, I'm approximating the zone=
 mask
> to 30 as [0x3c000000 0x3fffffff] isn't defined as memory so it's unlikely=
 that
> we=C2=B4ll encounter buffers there. But I don't know how it could affect =
mm
> initialization code.
>=20
> This also rules out 'zone_dma_bits' as a mechanism to pass ZONE_DMA's siz=
e
> from
> HW definition code to arch's.

Hi Christoph,
I gave it a thought and think this whole MAX_DMA_ADDRESS topic falls out of=
 the
scope of the series. I agree it's something that we should get rid of, but
fixing it isn't going to affect the overall enhancement intended here.  I'd
rather focus on how are we going to pass the DMA zone data into the arch co=
de
and fix MAX_DMA_ADDRESS on another series.

Regards,
Nicolas


--=-HuE7CYEmA0DlmwKJIinl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl1mTOwACgkQlfZmHno8
x/5rEQf/a0hgCNBuEJW0dF6JOgmq1B1AUgrpu1lR5mCYvRYKaWrIH0GEWk7/DMYN
5P/0pfK8WcmvSuTsH3kAL9FVcqCF1fm+KHxDUfHg0WM4TbfF/SNx8nzM0thhMSGg
vcgA6AP1aXP4wkqXKPhjga2uBewFfdD02TKqIvsSKEXAUge69kAkVjSAy/Sz8Rj9
NUwJ6GbY5Clul7ZkO6eRe39K/bnmICJytZCvmxas+x3YQN5eiml9ooPhHoCa48l1
tzjKhxg5VSCVPYdvIdauSRDsuHKcYzezXiaX/mX8Rz6h2/4bWbX9/Lt9Y5UZyikO
2DdZK0hdYuTCw2X0qHF5x4sS1s9Tew==
=HHcK
-----END PGP SIGNATURE-----

--=-HuE7CYEmA0DlmwKJIinl--



--===============2812521241347977303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2812521241347977303==--


