Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AD1C4451B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 15:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6uPkgItTF3K6KECDPXl5TKxftw+BHLv+sh/VFO8Ibc=; b=eC9TUK3/IjHtvmKtQALfWfZwEg
	tZDzq19PDA0z17DZc8usqRn/iCkRLqDuUwLHK5ZS1/ctgul7gGEp/fPdN1IzaRjVt2paQoFaOArtj
	6G+OvazPiTi7gu+mywBJihzxLNJ2JVVD22i+uKnJQemrfV4SlmVgT47xsgNugJob0hwBfSG0TKcYu
	hNabY/7s5nHgCy5AN8aO/d+TF0ipNQAWNXIBLl+WUE06xArRYAhVgXjFcH1eJl5UMKBG5nxFP6Lue
	wuLZ6zAfytYUy+UmOi61BICNAFafXuZzBvv8zcxOeX8EE36qnt3JntqI+iUKWkFfbK1N0jztFKSlw
	nmC4Jc+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkv4-00000002gG3-2Zfl;
	Fri, 17 Jul 2026 15:56:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkv1-00000002gFV-1pbf
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 15:56:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1784303767; x=1815839767;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZC+aybt/xs01TSo2+OGzHuUqZUn64HDjZmRVPTsj9XE=;
  b=kb79sHzjBXAb7UZngKEAtCr+EnmcL9wp/zdLZHi3k/CSz52DwTfGJsTm
   DXOovooo1W7mk3JObKW3LNQJH0ypYMYlFH8gx+VcIx2m11ibHPhAgzknE
   Y1c91lo5ixo3QZDXh1wyeK8BPm1Wahguzi4QZlUPWehtLdKWAxeayG3ul
   G/FflFBZO0uC+RERupizLusyR2v879qOU3FFf/Z5HmK7RNR56kCaKyaaQ
   EORKha4ENKMPilWgbDq126xFBTey8inOYLRpZjlT+YCOEBMqQyZFArma3
   auXIkHpskrXdlxmfH3bLmguXCubezQl/m+fU2ivnSv3WunIHr4N8RoJ/1
   w==;
X-CSE-ConnectionGUID: ZN/leDicTCiSEFrhkwE2NA==
X-CSE-MsgGUID: g38FcU1tTXG+bOBprlDStQ==
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="asc'?scan'208";a="61112917"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 08:56:03 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.43; Fri, 17 Jul 2026 08:56:02 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 17 Jul 2026 08:55:57 -0700
Date: Fri, 17 Jul 2026 16:55:00 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
CC: Conor Dooley <conor@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <samuel.holland@sifive.com>, <dlan@kernel.org>,
	<guodong@riscstar.com>, <dfustini@oss.tenstorrent.com>,
	<michal.simek@amd.com>, <junhui.liu@pigmoral.tech>,
	<darshan.prajapati@einfochips.com>, <akpm@linux-foundation.org>,
	<zhangchunyan@iscas.ac.cn>, <luxu.kernel@bytedance.com>,
	<pincheng.plct@isrc.iscas.ac.cn>, <nick.hu@sifive.com>, <jim.shu@sifive.com>,
	<zong.li@sifive.com>, <greentime.hu@sifive.com>, <robin.randhawa@sifive.com>,
	<scott@riscstar.com>, <dave.patel@riscstar.com>, <raymond.mao@riscstar.com>,
	<pawandeep.oza@oss.qualcomm.com>
Subject: Re: [RFC PATCH 2/3] dt-bindings: riscv: Add Worlds per-hart
 properties
Message-ID: <20260717-imitation-corridor-ce127d4093fd@wendy>
References: <20260619105834.1277302-1-peter.lin@sifive.com>
 <20260619105834.1277302-3-peter.lin@sifive.com>
 <20260622-profanity-herbs-1cc1bcf6206f@spud>
 <aj5m00m4KxRAPAnB@plin-1878>
 <20260626-chitchat-purity-33af51f88380@spud>
 <akOkXpPi46LBHuIA@plin-1878>
 <20260630-frisk-excavate-7d562df75585@spud>
 <aloGd39fAlev7+4p@plin-1878>
MIME-Version: 1.0
In-Reply-To: <aloGd39fAlev7+4p@plin-1878>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_085607_552167_D24390BC 
X-CRM114-Status: GOOD (  46.81  )
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
Content-Type: multipart/mixed; boundary="===============8697407890554924477=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8697407890554924477==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7P4celFdWTWKZ/T/"
Content-Disposition: inline

--7P4celFdWTWKZ/T/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 06:39:51PM +0800, Yu-Chien Peter Lin wrote:
> Hi Conor,
>=20
> On Tue, Jun 30, 2026 at 07:06:14PM +0100, Conor Dooley wrote:
> > On Tue, Jun 30, 2026 at 07:11:26PM +0800, Yu-Chien Peter Lin wrote:
> > > Hi Conor,
> > >=20
> > > On Fri, Jun 26, 2026 at 03:36:38PM +0100, Conor Dooley wrote:
> > > > On Fri, Jun 26, 2026 at 07:47:31PM +0800, Yu-Chien Peter Lin wrote:
> > > > > Hi Conor,
> > > > >=20
> > > > > On Mon, Jun 22, 2026 at 06:12:47PM +0100, Conor Dooley wrote:
> > > > > > On Fri, Jun 19, 2026 at 06:58:33PM +0800, Yu-Chien Peter Lin wr=
ote:
> > > > > > > Add per-hart DT properties for RISC-V Worlds architecture:
> > > > > > > riscv,pmwid, riscv,pmwidlist, and riscv,pmlwidlist. These
> > > > > > > platform-defined values are primarily used by M-mode firmware
> > > > > > > to configure World ID CSRs and restrict WID usage across
> > > > > > > privilege levels.
> > > > > > >=20
> > > > > > > Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> > > > > > > ---
> > > > > > >  .../devicetree/bindings/riscv/cpus.yaml       | 21 +++++
> > > > > > >  .../devicetree/bindings/riscv/worlds.yaml     | 77 +++++++++=
++++++++++
> > > > > > >  2 files changed, 98 insertions(+)
> > > > > > >  create mode 100644 Documentation/devicetree/bindings/riscv/w=
orlds.yaml
> > > > > > >=20
> > > > > > > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yam=
l b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > > > > index 5feeb2203050..4b5778b6d3e7 100644
> > > > > > > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > > > > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > > > > @@ -26,6 +26,7 @@ description: |
> > > > > > >  allOf:
> > > > > > >    - $ref: /schemas/cpu.yaml#
> > > > > > >    - $ref: extensions.yaml
> > > > > > > +  - $ref: worlds.yaml
> > > > > > >    - if:
> > > > > > >        not:
> > > > > > >          properties:
> > > > > > > @@ -120,11 +121,31 @@ properties:
> > > > > > >        thead systems where the vector register length is not =
identical on all harts, or
> > > > > > >        the vlenb CSR is not available.
> > > > > > > =20
> > > > > > > +  riscv,pmwid:
> > > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > > > +    description:
> > > > > > > +      Platform-defined M-mode World ID (WID) assigned to thi=
s hart.
> > > > > > > +    minimum: 0
> > > > > > > +    maximum: 63
> > > > > > > +
> > > > > > > +  riscv,pmwidlist:
> > > > > > > +    $ref: /schemas/types.yaml#/definitions/uint64
> > > > > > > +    description:
> > > > > > > +      Platform-defined bitmap of M-mode World IDs (WIDs) tha=
t this hart may use.
> > > > > >=20
> > > > > > I don't understand what the difference is between this property=
 and the
> > > > > > one before it are.
> > > > > > Is this one meant to be used by m-mode software to then select =
one which
> > > > > > will appear in riscv,pmwid?
> > > > >=20
> > > > > pmwid (single value) is the reset default, while pmwidlist (bitma=
p)
> > > > > defines the allowed set. The root-of-trust M-mode software may se=
lect
> > > > > an allowed value from the pmwidlist and write it to the mwid CSR.
> > > >=20
> > > > I don't understand the point of the property then. If it is the res=
et
> > > > default, just read it out of the register?
> > > > Unless I am missing something, it's useless to s-mode because it may
> > > > not be what m-mode chose and useless to m-mode that has access to
> > > > the csr.
> > >=20
> > > Smwid is optional. In the no-Smwid case:
> > > - M-mode's WID is fixed to pmwid (hardware-defined via fuse/pinstrap/=
SoC
> > >   registers, exposed to software via riscv,pmwid DT property)
> > > - S/U-mode's WID depends on opensbi-domain configuration [1]:
> > >   - If next-wid is specified: S/U use that WID (via mlwid CSR)
> > >   - If next-wid is absent   : S/U fall back to pmwid (M/S/U in same
> > >     world)
> > >=20
> > > So riscv,pmwid serves two purpose:
> > > 1. Source of truth for M-mode's WID when mwid CSR doesn't exist
> > > 2. Fallback value for OpenSBI to write to mlwid when domain config is
> > >    absent.
> >=20
> > So it is not the default at reset at all then. The reset default is
> > something else entirely and this is used to overwrite that.
> >=20
> > > - M-mode's WID is fixed to pmwid (hardware-defined via fuse/pinstrap/=
SoC
> > >   registers, exposed to software via riscv,pmwid DT property)
> >=20
> > In this case, it seems like pmwidlist would just contain a single entry,
> > and there is no need for pwmid.
>=20
> The pmwid and pmwidlist properties cannot merge because pmwidlist represe=
nts
> an optional hardware mask. On physically unrestricted platforms, pmwidlist
> doesn't exist, making pmwid essential to define the hardware reset defaul=
t.
>=20
> >=20
> > Quite frankly, it seems like you need to decouple these properties from
> > being 1:1 mappings to your extension's CSRs and both name and explain
> > how they are to be used by software.
>=20
> These properties are actually not 1:1 CSR mappings. pmwid, pmwidlist, and
> pmlwidlist are the exact terms used in the RISC-V specification to descri=
be
> these platform-defined hardware values, so I prefer to follow it.

CSRs or terms in your extension, it matters little.
Your properties should reflect how software will actually interact with
the devicetree and wordguard. There's no point having a bunch of
properties that relate to aspects of the extension if software is not
going to actually use them.=20

I fundamentally do not understand why software ever needs both both the
singular and list properties. What does software actually do with the
list property when both it and the singular property are provided?

I expect to see something simpler and/or much better explained in the next
revision.

> > Again same point applies here, why can a single-entry riscv,pmwidlist
> > not suffice here?
>=20
> As explained above, a single-entry pmwidlist cannot replace pmwid because
> it would fail to represent the exact hardware reset default for platforms
> without physical WID restrictions.

If there is one entry, use that, and if there are multiple entries, pick
one?

Thanks,
Conor.

--7P4celFdWTWKZ/T/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCalpQVAAKCRB4tDGHoIJi
0jrAAQD2HsxRZGdaMTjHcT10zblTSWUgCgqW990Vx+F307i2cwEAkCpsPtBdCPdm
ggloawOyflqzbNxyB17YUKeQz3W86wE=
=5mfd
-----END PGP SIGNATURE-----

--7P4celFdWTWKZ/T/--


--===============8697407890554924477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8697407890554924477==--

