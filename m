Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA0BC4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 14:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pc6PSefHsHxRAKVSRhLmWkzYbS7+jP8CsRb+UMctSYw=; b=d9gZkEjHpZWPEXHT484aL1XBLH
	y86yI5TYeCE/y8wnMxl4gNGIPceH38rtKezaeyEx7SnQ2e9ZRBOL8wENPnZvsPk1CoA9Z6LBj6zGo
	oh/zhmBEDiKQR97fml5o1XAIwOzM8uGErRD4WRChcGqtiY56X5muEKUUKSowTUU3dRo7CrAydzg5A
	9xe774JGDKVmNgQ8AUk2nDukYiqQVR03RRBqCP2xkVBv9wk8Ja+URBTBQFO5tJLk9cjb3JtIiJUHZ
	Lw1LHmQXQdZDFTAeAv9UeCBAs294+6lZ71GbpnMuJh5cq1+0EF4wyo8/0NemvZoGvtC3ihjDhRSMk
	uw+M+5nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAsoU-00AU2Z-19;
	Wed, 06 Dec 2023 14:23:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAsoR-00AU18-0f
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 14:23:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B701C61B6F;
	Wed,  6 Dec 2023 14:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 878B1C433C7;
	Wed,  6 Dec 2023 14:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701872622;
	bh=mnkKlN9C7ewzSsx5dXKTbBsTD19GusfsKGChg7+owuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rNKsDjx6fQZrAqHkCZJvkptzy8qEMexQSxpOCFf1IpHw1q6DFN/OxrrIXbCABHsE/
	 B2ESNuZWH7aQHm1Mm/YAPmG8G2U8AkkdnS9VeYNvYbDtJ/e40xA1Z3yfCcL9Xh9yrk
	 Jw3AaulYPBOSAS/MkMXdco47fwcRAamVHLPfOJN+5pBPmYrat8kmSdyUQqs1nmtCEM
	 GWEazc8uTWfzLdQhQZ6D9s765jcDWTNK392PF13YxDYQ3X5SkouY8LNnHALI2BgjfK
	 4APOD4cXMjF5eu04SKKSl8+TezUH1Qk1TaQyAunhz5dzslBWgdPFEqz1Iy6o2vIrgR
	 aRh1iGa9yXCQw==
Date: Wed, 6 Dec 2023 14:23:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, geert+renesas@glider.be,
	Atish Patra <atishp@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, apatel@ventanamicro.com,
	alexghiti@rivosinc.com, Bjorn Topel <bjorn@rivosinc.com>,
	suagrfillet@gmail.com, jeeheng.sia@starfivetech.com,
	petrtesarik@huaweicloud.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Subject: Re: [RFT 1/2] RISC-V: handle missing "no-map" properties for
 OpenSBI's PMP protected regions
Message-ID: <20231206-precut-serotonin-2eecee4ab6af@spud>
References: <20230810-crewless-pampers-6f51aafb8cff@wendy>
 <mhng-550dee8b-a2fb-485b-ad4d-2763e94191b4@palmer-ri-x1c9>
MIME-Version: 1.0
In-Reply-To: <mhng-550dee8b-a2fb-485b-ad4d-2763e94191b4@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_062343_331943_DE8B32E0 
X-CRM114-Status: GOOD (  73.58  )
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
Content-Type: multipart/mixed; boundary="===============5019179180892271366=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5019179180892271366==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1QSBa0wqmM5rZU19"
Content-Disposition: inline


--1QSBa0wqmM5rZU19
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 06, 2023 at 04:52:11AM -0800, Palmer Dabbelt wrote:
> On Thu, 10 Aug 2023 02:07:10 PDT (-0700), Conor Dooley wrote:
> > On Wed, Aug 09, 2023 at 02:01:07AM -0700, Atish Kumar Patra wrote:
> > > On Tue, Aug 8, 2023 at 6:39=E2=80=AFAM Conor Dooley <conor@kernel.org=
> wrote:
> > > >
> > > > On Tue, Aug 08, 2023 at 12:54:11AM -0700, Atish Kumar Patra wrote:
> > > > > On Wed, Aug 2, 2023 at 4:14=E2=80=AFAM Conor Dooley <conor.dooley=
@microchip.com> wrote:
> > > > > >
> > > > > > Add an erratum for versions [v0.8 to v1.3) of OpenSBI which fai=
l to add
> > > > > > the "no-map" property to the reserved memory nodes for the regi=
ons it
> > > > > > has protected using PMPs.
> > > > > >
> > > > > > Our existing fix sweeping hibernation under the carpet by marki=
ng it
> > > > > > NONPORTABLE is insufficient as there are other ways to generate
> > > > > > accesses to these reserved memory regions, as Petr discovered [=
1]
> > > > > > while testing crash kernels & kdump.
> > > > > >
> > > > > > Intercede during the boot process when the afflicted versions o=
f OpenSBI
> > > > > > are present & set the "no-map" property in all "mmode_resv" nod=
es before
> > > > > > the kernel does its reserved memory region initialisation.
> > > > > >
> > > > >
> > > > > We have different mechanisms of DT being passed to the kernel.
> > > > >
> > > > > 1. A prior stage(e.g U-Boot SPL) to M-mode runtime firmware (e.g.
> > > > > OpenSBI, rustSBI) passes the DT to M-mode runtime firmware and it
> > > > > passes to the next stage.
> > > > > In this case, M-mode runtime firmware gets a chance to update the
> > > > > no-map property in DT that the kernel can parse.
> > > > >
> > > > > 2. User loads the DT from the boot loader (e.g EDK2, U-Boot prope=
r).
> > > > > Any DT patching done by the M-mode firmware is useless. If these =
DTBs
> > > > > don't have the no-map
> > > > > property, hibernation or EFI booting will have issues as well.
> > > > >
> > > >
> > > > > We are trying to solve only one part of problem #1 in this patch.
> > > >
> > > > Correct.
> > > >
> > > > If someone's second stage is also providing an incorrect devicetree
> > > > then, yeah, this approach would fall apart - but it's the firmware
> > > > provided devicetree being incorrect that I am trying to account for
> > > > here. If a person incorrectly constructed one, I am not really sure=
 what
> > > > we can do for them, they incorrect described their hardware /shrug
> > > > My patch should of course help in some of the scenarios you mention=
 above
> > > > if the name of the reserved memory region from OpenSBI is propagate=
d by
> > > > the second-stage bootloader, but that is just an extension of case =
1,
> > > > not case 2.
> > > >
> > > > > I
> > > > > don't think any other M-mode runtime firmware patches DT with no-=
map
> > > > > property as well.
> > > > > Please let me know if I am wrong about that. The problem is not
> > > > > restricted to [v0.8 to v1.3) of OpenSBI.
> > > >
> > > > It comes down to Alex's question - do we want to fix this kind of
> > > > firmware issue in the kernel? Ultimately this is a policy decision =
that
> > > > "somebody" has to make. Maybe the list of firmwares that need this
> > >=20
> > > IMO, we shouldn't as this is a slippery slope. Kernel can't fix every
> > > firmware bug by having erratas.
> > > I agree with your point below about firmware in shipping products. I
> > > am not aware of any official products shipping anything other than
> > > OpenSBI either.
> >=20
> > > However, I have seen users using other firmwares in their dev
> > > environment.
> >=20
> > If someone's already changed their boards firmware, I have less sympathy
> > for them, as they should be able to make further changes. Punters buying
> > SBCs to install Fedora or Debian w/o having to consider their firmware
> > are who I am more interested in helping.
> >=20
> > > IMHO, this approach sets a bad precedent for the future especially
> > > when it only solves one part of the problem.
> >=20
> > Yeah, I'm certainly wary of setting an unwise precedent here.
> > Inevitably we will need to have firmware-related errata and it'd be good
> > to have a policy for what is (or more importantly what isn't
> > acceptable). Certainly we have said that known-broken version of OpenSBI
> > that T-Head puts in their SDK is not supported by the mainline kernel.
> > On the latter part, I'm perfectly happy to expand the erratum to cover
> > all affected firmwares, but I wasn't even sure if my fix worked
> > properly, hence the request for testing from those who encountered the
> > problem.
> >=20
> > > We shouldn't hide firmware bugs in the kernel when an upgraded
> > > firmware is already available.
> >=20
> > Just to note, availability of an updated firmware upstream does not
> > necessarily mean that corresponding update is possible for affected
> > hardware.
>=20
> Yep.  I think we're been in a very hobbist-centric world in RISC-V land, =
but
> in general trying to get people to update firmware is hard.  Part of the
> whole "kernel updates don't break users" thing is what's underneath the
> kernel, it's not just a uABI thing.

Yeah, there's certainly an attitude that I think needs to go away, that
updating firmware etc is something we can expect to be carried out on a
universal basis. Or that fixing things in the upstream version of
OpenSBI means it'll actually propagate down to system integrators.

>=20
> > > This bug is well documented in various threads and fixed in the latest
> > > version of OpenSBI.
> > > I am assuming other firmwares will follow it as well.
> > >=20
> > > Anybody facing hibernation or efi related booting issues should just
> > > upgrade to the latest version of firmware (e.g OpenSBI v1.3)
> > > Latest version of Qemu will support(if not happened already) the
> > > latest version of OpenSBI.
> > >=20
> > > This issue will only manifest in kernels 6.4 or higher. Any user
> > > facing these with the latest kernel can also upgrade the firmware.
> > > Do you see any issue with that ?
> >=20
> > I don't think it is fair to compare the ease of upgrading the kernel
> > to that required to upgrade a boards firmware, with the latter being
> > far, far more inconvenient on pretty much all of the boards that I have.
>=20
> IMO we're in the same spot as every other port here, and generally they w=
ork
> around firmware bugs when they've rolled out into production somewhere th=
at
> firmware updates aren't likely to happen quickly.  I'm not sure if there's
> any sort of exact rules written down anywhere, but IMO if the bug is going
> to impact users then we should deal with it.
>=20
> That applies for hardware bugs, but also firmware bugs (at a certain point
> we won't be able to tell the difference).  We're sort of doing this with =
the
> misaligned access handling, for example.
>=20
> > I'm perfectly happy to drop this series though, if people generally are
> > of the opinion that this sort of firmware workaround is ill-advised.
> > We are unaffected by it, so I certainly have no pressure to have
> > something working here. It's my desire not to be user-hostile that
> > motivated this patch.
>=20
> IIUC you guys and Reneas are the only ones who have hardware that might be
> in a spot where users aren't able to update the firmware (ie, it's out in
> production somewhere).

I dunno if we can really keep thinking like that though. In terms of
people who have devicetrees in the kernel and stuff available in western
catalog distribution, sure.
I don't think we can assume that that covers all users though, certainly
the syntacore folks pop up every now and then, and I sure hope that
Andes etc have larger customer bases than the in-kernel users would
suggest.

> So I'm adding Geert, though he probably saw this
> months ago...

Prabhakar might be a good call on that front. I'm not sure if the
Renesas stuff works on affected versions of OpenSBI though, guess it
depends on the sequencing of the support for the non-coherent stuff and
when this bug was fixed.

> On that note: It's been ~4 months and it look like nobody's tested anythi=
ng
> (and the comments aren't really things that would preculde testing).

Yeah, nobody seems to really have given a crap. I was hoping the
StarFive guys that actually added the support for this would be
interested in it, but alas they were not.
I don't really care all that much - the platform I support is not
affected by the problem and I just don't enable the option elsewhere.

> So
> maybe we just pick that second patch up into for-next and see what happen=
s?
> IIUC that will result in broken systems for users who haven't updated the=
ir
> firmware.
>=20
> I agree that's a user-hostile way to do things, which is generally a bad =
way
> to go, but if it's really true that there's no users then we're safe.
> Probably also worth calling it out on sw-dev just to be safe.

And if there are users, the fix is actually relatively straight-forward,
just apply patch #1.

--1QSBa0wqmM5rZU19
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXCD5QAKCRB4tDGHoIJi
0vNWAQDCGbof8O+9ILsMVdHtJTgYIJaul/lGJhqAs/8WQ3rbaAEAtM6Z99MFsAHW
l6Llh3/c8PdSqbs+VHwYeWR3Vsu0nA0=
=404e
-----END PGP SIGNATURE-----

--1QSBa0wqmM5rZU19--


--===============5019179180892271366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5019179180892271366==--

