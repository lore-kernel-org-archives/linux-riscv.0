Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA297C46467
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 21:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uw73UCQuQAKpRRHkmZ0/gPolQUH974hy36ZwKPG44EU=; b=SKT3T8xidZgPFvx62Y8dV6q4ak
	EFUP4eoXW9jDCw/tGJsZb5uWUVBUhiECQbvWU/6jeQS5c3uphR86ZfFWSKtAeNG4V4I7YJfF/TOsX
	BogLyr0gV8iLyVNtkqb34b88Om8WO929HBA1Ga/Ob1urTwMdGQGMeovPOwt5wEIqqrQlRCbwv77GD
	wmd8uJyaDguCEhtwytV23mb1j9u2Yd69f9oHsI8Zdfazw3K+At7upC8wD893KJdPjR04aEklokj5G
	vGC/xBx61AP80j/+17beegc3RUZNcZbnX9PKSRMsm4sp6UMqNInebfwYFtl2eErTe75Lzz84ys9Ng
	zlOXRM6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFMLg-008deu-15; Tue, 10 Jan 2023 21:40:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFMLd-008ddp-BL
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 21:39:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B1665618EB;
	Tue, 10 Jan 2023 21:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C8BAC433EF;
	Tue, 10 Jan 2023 21:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673386796;
	bh=qVXKtBBQ1X0h82PMOewWn1J+Aaea3cCP4S+M/idQd4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NxEQqlEA/7mSxD9IK7usRt4DFRMznJc52DA4fsmXcGN5J4RMOtxmPrRFjD62ZJBnB
	 bR/k9og6cUxkqNVIOYmb3BZX656GlQ9HsKI884yMRuZokkUKan36INvlTd0UC6IkH9
	 hC2y9bNnVv2w+1V5ElhexdxQZtf7LJfTJWpgRVka+KC0O+/CFchxLjicdb6VawHJn+
	 fI5z7/BFwCTSE6Izdf0JvYYvhle9M919R/gM6+6aNO6GAxZr4VuF8F0+3tEKmfkbKd
	 5c3IODgvRh271Wgl250unFleX/rXwRQlkp+af9EwG/IBqvwi2WR65YRwg8lGqT/5YM
	 63q+ICbeig/PQ==
Date: Tue, 10 Jan 2023 21:39:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christoph Hellwig <hch@infradead.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v1 1/7] RISC-V: introduce ARCH_FOO kconfig aliases for
 SOC_FOO symbols
Message-ID: <Y73bJ/kKYo1xJPDK@spud>
References: <20221121221414.109965-1-conor@kernel.org>
 <20221121221414.109965-2-conor@kernel.org>
 <CAMuHMdVoMzox6FdPFsR515nnEYXtCt-Xs5qBgGQigzL2=Q7kPg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVoMzox6FdPFsR515nnEYXtCt-Xs5qBgGQigzL2=Q7kPg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_133957_477736_60AD556D 
X-CRM114-Status: GOOD (  30.59  )
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
Content-Type: multipart/mixed; boundary="===============6482466124515145057=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6482466124515145057==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZJmyUoI6n8jHUvLu"
Content-Disposition: inline


--ZJmyUoI6n8jHUvLu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert...

On Tue, Jan 10, 2023 at 10:14:51PM +0100, Geert Uytterhoeven wrote:
> On Mon, Nov 21, 2022 at 11:18 PM Conor Dooley <conor@kernel.org> wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > To facilitate a transfer from SOC_FOO to ARCH_FOO, over a release cycle,
> > introduce some aliases so that drivers etc that use the SOC_FOO symbols
> > can be converted.
> >
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Thanks for your patch, which is now commit fc43211939bb6874
> ("RISC-V: kconfig.socs: convert usage of SOC_CANAAN to
> ARCH_CANAAN") in riscv/for-next

I see this and I immediately know it is going to be bad news!

> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
>=20
> > @@ -73,6 +91,9 @@ config SOC_CANAAN_K210_DTB_BUILTIN
> >           This option should be selected if no bootloader is being used.
> >           If unsure, say Y.
> >
> > +config ARCH_CANAAN_K210_DTB_SOURCE
> > +       def_bool SOC_CANAAN_K210_DTB_SOURCE
>=20
> This is not correct, as SOC_CANAAN_K210_DTB_SOURCE below is
> not a bool, but a string.
>=20
> > +
> >  config SOC_CANAAN_K210_DTB_SOURCE
> >         string "Source file for the Canaan Kendryte K210 builtin DTB"
> >         depends on SOC_CANAAN
>=20
> Hence
>=20
>     obj-$(CONFIG_ARCH_CANAAN_K210_DTB_BUILTIN) +=3D $(addsuffix .dtb.o,
> $(CONFIG_ARCH_CANAAN_K210_DTB_SOURCE))
>=20
> will do the wrong thing later, and I get a non-bootable system (no output)
> on my MAiX-BiT.
>=20
> Unfortunately there is no def_string, so I don't think we can fix this
> in a backwards-compatible way, and have to replace all
> SOC_CANAAN_K210_DTB_SOURCE by ARCH_CANAAN_K210_DTB_SOURCE,
> and urging users to update their .config manually.

That sucks. I'm not sure how I missed this - I had tested originally on
my k210, but evidently there was something wrong with how I had done it.
I must have not tested a subsequent revision on the k210. Mea cupla.

As it wasn't my intention to inflict this change without time for the
symbols to appear in configs, my immediate feeling is that this part of
the change should be reverted.

Of course, we could so something like:
diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 34a54e5310a1..d36a5f39f13a 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -79,7 +79,8 @@ config SOC_CANAAN_K210_DTB_BUILTIN
          If unsure, say Y.
=20
 config ARCH_CANAAN_K210_DTB_SOURCE
-       def_bool SOC_CANAAN_K210_DTB_SOURCE
+       string
+       default SOC_CANAAN_K210_DTB_SOURCE
=20
 config SOC_CANAAN_K210_DTB_SOURCE
        string "Source file for the Canaan Kendryte K210 builtin DTB"

But I am not sure of how that interacts with the various methods of
updating ones config.
=46rom, admittedly limited, testing it does get updated if
SOC_CANAAN_K210_DTB_SOURCE is changed using menuconfig. Similarly, if
one alters that symbol and does olddefconfig it also gets updated.

I'm sure I am overlooking something here though, what is it?

Thanks & apologies,
Conor.


--ZJmyUoI6n8jHUvLu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY73bJwAKCRB4tDGHoIJi
0qLaAP90hrV10NYQLMM2oCOU3qBdCW5SUhTNI4IlG3b0ja3lCQEApFUfEoyNni6X
UAV07x8iDhu6alw4HN0FQGpSv4CZlQY=
=9odq
-----END PGP SIGNATURE-----

--ZJmyUoI6n8jHUvLu--


--===============6482466124515145057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6482466124515145057==--

