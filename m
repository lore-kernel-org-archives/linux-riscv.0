Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF40FC7EE23
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 22:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfvN+nQBezxj8bLtApTuv7y09wOGLg9tIjDdUJS1sM0=; b=0SHoSo37wnAflatFr2GCYYjy79
	QewCUZbeFgohCBMJ+9ArsgyMerGZ7Tl7NaAZYxOz7f6ZGsdjaTWNkzFdDL2+/t/hMXFElTHoEpB9s
	tF0aWVNyyIAaxwyeNqfESsbXLsAlfRdM4KLMN/n/Yc5aLpFCBgJ89I2hKc/z/wTlaYtvp3pvYekgg
	BnClQjogxFYgQ3k3BjOFlc487/oWD92I7bOe8tCycEtbIeH6SbPmkSFz2KUGIuJXo4wIwOwwIS6Sr
	FWOm7W274UfumFyhHu8kAt9u1PHbXje84hgS78mNCNWrmQZrrtliBrm2GuCq6w/D2dwKb0QqsaRRv
	vsKxG4qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1xIk-00ErBX-1a;
	Wed, 24 May 2023 22:49:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1xIh-00ErAl-0e
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 22:49:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8CE85639B6;
	Wed, 24 May 2023 22:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F20C433D2;
	Wed, 24 May 2023 22:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684968585;
	bh=GVSpmgDJgKvtnAYJ89QgN844pnETkbbglcC/+ts5s7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qYc36qtVDq8cKr5n/fDlSZeY8kAuJ4wIpgJ1hDdKF3Rm44LlF0AKfrYuUVdJRqUyv
	 +7ByDmoIwoJh5WhieEAM6odTnCMOGmFmDR/ifYr8voksEKgq3LjEMCg2t+XXg93H13
	 TIrY2+59udREprIfv+C62vJlIOblMaxQqsA3DEePbbkqY5MI63MkWgG0GPXsxw6i8c
	 NIyiq99BeA/5fsOi9qxAyu0ciR/TGH8CdOilkxdGsIcWZi3rAVf2iT1yvorOw/wSme
	 j3e2owtgwiDUy4dcIVnVeg7OqEFFkzhj9LvJR7Rn4O6kud6KoaMolaioyCE3+ZtiV0
	 yhMyqo3Iu5wUQ==
Date: Wed, 24 May 2023 23:49:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-next <linux-next@vger.kernel.org>,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Subject: Re: linux-next: Tree for May 15 (several RV64 build errors)
Message-ID: <20230524-scalping-number-63ec10c1f7bf@spud>
References: <mhng-e172207d-d67d-46ab-ab95-85f0a854ace2@palmer-ri-x1c9a>
 <65124759-26de-4111-bc54-545a00620d75@app.fastmail.com>
 <8af1acf1-64a5-5868-9702-0929fe279761@infradead.org>
MIME-Version: 1.0
In-Reply-To: <8af1acf1-64a5-5868-9702-0929fe279761@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_154947_321291_13A4BB84 
X-CRM114-Status: GOOD (  22.57  )
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
Content-Type: multipart/mixed; boundary="===============2867088565975750602=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2867088565975750602==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vifRCZgSv5ueTTCK"
Content-Disposition: inline


--vifRCZgSv5ueTTCK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2023 at 03:41:15PM -0700, Randy Dunlap wrote:
> On 5/23/23 23:23, Arnd Bergmann wrote:
> > On Wed, May 24, 2023, at 03:29, Palmer Dabbelt wrote:
> >> On Tue, 23 May 2023 17:22:20 PDT (-0700), rdunlap@infradead.org wrote:
> >>> On 5/23/23 06:07, Alexandre Ghiti wrote:
> >>>> On 23/05/2023 04:28, Randy Dunlap wrote:
> >>>>> On 5/19/23 03:42, Alexandre Ghiti wrote:
> >>>>>>>> /opt/crosstool/gcc-12.2.0-nolibc/riscv64-linux/bin/riscv64-linux=
-ld: section .data LMA [000000000041a000,00000000075bffd7] overlaps section=
 .text LMA [00000000000f09d4,00000000033562ab]
> >>>>>>>> /opt/crosstool/gcc-12.2.0-nolibc/riscv64-linux/bin/riscv64-linux=
-ld: section .init.pi.text LMA [00000000033562ac,0000000003359137] overlaps=
 section .data LMA [000000000041a000,00000000075bffd7]
> >>>>>>>
> >>>>>>> I'll check this one too which seems to be related to kernel/pi in=
troduction.
> >>>>>>
> >>>>>> Thanks to Bjorn: this is caused by XIP_KERNEL, which is known to h=
ave limited size, hence the overlap, so no fix for this one. Is there a way=
 to exclude this config from randconfig?
> >>>>> Does this mean exclude XIP_KERNEL or something else from randconfig=
s?
> >>>>
> >>>>
> >>>> I meant excluding XIP_KERNEL from randconfigs: it has very strict co=
nstraints regarding what can/can't be enabled then it needs human intervent=
ion to make sure the error above does not happen. So I would not bother tes=
ting this in randconfigs if possible.
> >>>
> >>> I can exclude it from my randconfig builds, but I don't know of a way=
 to exclude it from randconfig builds in general (i.e., for everyone).
> >>
> >> Arnd had suggested a trick related to menus that would result in=20
> >> randconfig never enabling some config.  It'd suggested for=20
> >> CONFIG_NONPORTABLE, but we didn't use it because it'd reduce randconfi=
g=20
> >> coverage.
> >>
> >> Maybe we should add a CONFIG_VERYSPECIAL of some sort and hide things=
=20
> >> like XIP behind it (maybe M-mode too)?
> >=20
> > I usually add 'depends on !COMPILE_TEST', that excludes it from most
> > build bots.
>=20
> XIP_KERNEL already has "depends on !COMPILE_TEST", since April of 2021.

Half of me wants to say just remove XIP_KERNEL entirely. Or make it
depend on BROKEN, since noone seems to actually test it and I don't
think we even know if it works right now?

--vifRCZgSv5ueTTCK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG6UhQAKCRB4tDGHoIJi
0gQCAQDJF5AaPKZcpLOA853nW9fm061vxB5oKFNYpcO+ZBM5ogEA0VCjHShKVo6P
t1yS9OcbEhAlJC3/btQ7ILZI557nWA4=
=wzlZ
-----END PGP SIGNATURE-----

--vifRCZgSv5ueTTCK--


--===============2867088565975750602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2867088565975750602==--

