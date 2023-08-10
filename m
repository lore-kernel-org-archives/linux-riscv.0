Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE56C04A94
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 09:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHTybVy3YpcuPjl0/rexvyE/etE/j4vaRQEtQyeeu50=; b=PpUTZnjliPaIZ4WA4sY6P88vwU
	GDbMkFft3hyM35mRMSM5iNFuceHx5OS31zB6rVpOa3DgSePaBk3u3neYw8noc5ygytabkrhMc6aLA
	72LsYByNufoqAMq9f1PrlODyCY9fB0qao+T/cqi0lQY00I5+iPlAXwDxsyD4r8Tu9XCVurc0XNxQ2
	xyY7ahmua/9b7bREQNXZlaTKb7mFghSorWGVY6n0DsVWho3c4vTUG9coz5DG9y7u75C7oRmZM6mXf
	/jHPcXDS5C1s1eD753UDC5iOMQNpLUHJ8S0VuNmRPDItTTwuctrGaaZuu2Jj8G5rsMD6t58DhG9qW
	TWllf3VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU1eB-006w5p-2l;
	Thu, 10 Aug 2023 09:07:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU1e7-006w3Y-22
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 09:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1691658475; x=1723194475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XjNuV56YbluVNxCDCUR+x11NSBYonlIx/g3LtAfg0tM=;
  b=nMQFnch4Bkd5mddqNwodXOQMfkpl7crMOqrJzobo23H9JQ81TNPdnGKn
   TGQu8qnMMukMZPhSyZ/9oCyn7yJ7wnYWNQgd088vuzUwFnvH8GkYN660S
   gp6GwwKQCvscaJ+V5zsvyXklsTWThzwA+j8+cnjEX02XGyjdr2FZd8+Q9
   inLsAe+nZ9tTb7kgiETLvRqlfk/hDchuI7ZQ4kuXbAXWI+49D0pr7/hGG
   Xyylk26mD+ep0L1HxSUB2ZfEfRMXgwwlUt5A+dD+QPTzzBgbklIGF6ATW
   hNsLrJfiOgVrCJKR45pD8F+YhxI1sWjWIveyDzOGcs6qajbBhe5WHjABL
   w==;
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="asc'?scan'208";a="165797387"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Aug 2023 02:07:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 10 Aug 2023 02:07:50 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 10 Aug 2023 02:07:48 -0700
Date: Thu, 10 Aug 2023 10:07:10 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Atish Kumar Patra <atishp@rivosinc.com>
CC: Conor Dooley <conor@kernel.org>, <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, Alexandre
 Ghiti <alexghiti@rivosinc.com>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?=
	<bjorn@rivosinc.com>, Song Shuai <suagrfillet@gmail.com>, JeeHeng Sia
	<jeeheng.sia@starfivetech.com>, Petr Tesarik <petrtesarik@huaweicloud.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: Re: [RFT 1/2] RISC-V: handle missing "no-map" properties for
 OpenSBI's PMP protected regions
Message-ID: <20230810-crewless-pampers-6f51aafb8cff@wendy>
References: <20230802-purse-hydrant-6f44f77364b0@wendy>
 <20230802-detention-second-82ab2b53e07a@wendy>
 <CAHBxVyGgSJ66zMj65tRup2u23KP4=RJ5zN7hj5=K9e91NA9eog@mail.gmail.com>
 <20230808-handbag-mushily-f884178d29f5@spud>
 <CAHBxVyFNng2JOAQNfJSnabeq=+NYCSefk7OJEzkGMXEFY1tmFg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHBxVyFNng2JOAQNfJSnabeq=+NYCSefk7OJEzkGMXEFY1tmFg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_020755_870214_190DE4F9 
X-CRM114-Status: GOOD (  48.42  )
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
Content-Type: multipart/mixed; boundary="===============1972397317082486609=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1972397317082486609==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zgJmOBen9W7e17Dn"
Content-Disposition: inline

--zgJmOBen9W7e17Dn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 09, 2023 at 02:01:07AM -0700, Atish Kumar Patra wrote:
> On Tue, Aug 8, 2023 at 6:39=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
> >
> > On Tue, Aug 08, 2023 at 12:54:11AM -0700, Atish Kumar Patra wrote:
> > > On Wed, Aug 2, 2023 at 4:14=E2=80=AFAM Conor Dooley <conor.dooley@mic=
rochip.com> wrote:
> > > >
> > > > Add an erratum for versions [v0.8 to v1.3) of OpenSBI which fail to=
 add
> > > > the "no-map" property to the reserved memory nodes for the regions =
it
> > > > has protected using PMPs.
> > > >
> > > > Our existing fix sweeping hibernation under the carpet by marking it
> > > > NONPORTABLE is insufficient as there are other ways to generate
> > > > accesses to these reserved memory regions, as Petr discovered [1]
> > > > while testing crash kernels & kdump.
> > > >
> > > > Intercede during the boot process when the afflicted versions of Op=
enSBI
> > > > are present & set the "no-map" property in all "mmode_resv" nodes b=
efore
> > > > the kernel does its reserved memory region initialisation.
> > > >
> > >
> > > We have different mechanisms of DT being passed to the kernel.
> > >
> > > 1. A prior stage(e.g U-Boot SPL) to M-mode runtime firmware (e.g.
> > > OpenSBI, rustSBI) passes the DT to M-mode runtime firmware and it
> > > passes to the next stage.
> > > In this case, M-mode runtime firmware gets a chance to update the
> > > no-map property in DT that the kernel can parse.
> > >
> > > 2. User loads the DT from the boot loader (e.g EDK2, U-Boot proper).
> > > Any DT patching done by the M-mode firmware is useless. If these DTBs
> > > don't have the no-map
> > > property, hibernation or EFI booting will have issues as well.
> > >
> >
> > > We are trying to solve only one part of problem #1 in this patch.
> >
> > Correct.
> >
> > If someone's second stage is also providing an incorrect devicetree
> > then, yeah, this approach would fall apart - but it's the firmware
> > provided devicetree being incorrect that I am trying to account for
> > here. If a person incorrectly constructed one, I am not really sure what
> > we can do for them, they incorrect described their hardware /shrug
> > My patch should of course help in some of the scenarios you mention abo=
ve
> > if the name of the reserved memory region from OpenSBI is propagated by
> > the second-stage bootloader, but that is just an extension of case 1,
> > not case 2.
> >
> > > I
> > > don't think any other M-mode runtime firmware patches DT with no-map
> > > property as well.
> > > Please let me know if I am wrong about that. The problem is not
> > > restricted to [v0.8 to v1.3) of OpenSBI.
> >
> > It comes down to Alex's question - do we want to fix this kind of
> > firmware issue in the kernel? Ultimately this is a policy decision that
> > "somebody" has to make. Maybe the list of firmwares that need this
>=20
> IMO, we shouldn't as this is a slippery slope. Kernel can't fix every
> firmware bug by having erratas.
> I agree with your point below about firmware in shipping products. I
> am not aware of any official products shipping anything other than
> OpenSBI either.

> However, I have seen users using other firmwares in their dev
> environment.

If someone's already changed their boards firmware, I have less sympathy
for them, as they should be able to make further changes. Punters buying
SBCs to install Fedora or Debian w/o having to consider their firmware
are who I am more interested in helping.

> IMHO, this approach sets a bad precedent for the future especially
> when it only solves one part of the problem.

Yeah, I'm certainly wary of setting an unwise precedent here.
Inevitably we will need to have firmware-related errata and it'd be good
to have a policy for what is (or more importantly what isn't
acceptable). Certainly we have said that known-broken version of OpenSBI
that T-Head puts in their SDK is not supported by the mainline kernel.
On the latter part, I'm perfectly happy to expand the erratum to cover
all affected firmwares, but I wasn't even sure if my fix worked
properly, hence the request for testing from those who encountered the
problem.

> We shouldn't hide firmware bugs in the kernel when an upgraded
> firmware is already available.

Just to note, availability of an updated firmware upstream does not
necessarily mean that corresponding update is possible for affected
hardware.

> This bug is well documented in various threads and fixed in the latest
> version of OpenSBI.
> I am assuming other firmwares will follow it as well.
>=20
> Anybody facing hibernation or efi related booting issues should just
> upgrade to the latest version of firmware (e.g OpenSBI v1.3)
> Latest version of Qemu will support(if not happened already) the
> latest version of OpenSBI.
>=20
> This issue will only manifest in kernels 6.4 or higher. Any user
> facing these with the latest kernel can also upgrade the firmware.
> Do you see any issue with that ?

I don't think it is fair to compare the ease of upgrading the kernel
to that required to upgrade a boards firmware, with the latter being
far, far more inconvenient on pretty much all of the boards that I have.

I'm perfectly happy to drop this series though, if people generally are
of the opinion that this sort of firmware workaround is ill-advised.
We are unaffected by it, so I certainly have no pressure to have
something working here. It's my desire not to be user-hostile that
motivated this patch.

--zgJmOBen9W7e17Dn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNSougAKCRB4tDGHoIJi
0q6bAP48E8ofWxr0+xY4r2c1p/SzPcfP2e5RyZz2ZPahAqStFgD/eXdLG4FbmUeV
2e8kchwIWBo7MYPA1++yKqsUa5xgUgA=
=HRr4
-----END PGP SIGNATURE-----

--zgJmOBen9W7e17Dn--


--===============1972397317082486609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1972397317082486609==--

