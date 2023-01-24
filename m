Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A0BC38142
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 14:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8RfGEyRd4axWslyqXoM+us7m/BOrro0a1MK2OCgkeA=; b=xNioMHqvFTPXpjwIkEAlK65Udq
	fT2NjTiPL4yCsXUSrxvyIb7CzHOoLMAP+vvs7aMhZDBN4FyXG23846Jwa/4ldyRo01zVcbK9L4Agy
	TNnP171LrqmoiBYmxGEV/QST83nBpdVfSNwMGM+ZawQTjriv+zS9uFAYb+qHJcHhStXFoEhU0rCvE
	SoNXoIPpP2si39nJUwVV9YKaiLgFzU+NGe/tx/mfruAlvLhxzzx+n/11PUOTwunxJM8SaZmwkVweF
	uqh5RuA25pWIX7aY0tyDIhtfLQyzYJeey5u64uuNSHUTxEwXv2/hh7t+rTPzL3Clo/40uvL0z9BDh
	Wx2/9vcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKKT3-004Mjn-AZ; Tue, 24 Jan 2023 14:40:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKKSr-004MhZ-TT; Tue, 24 Jan 2023 14:40:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674571198; x=1706107198;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QYC/3AGiRj6sLnDRHA1FuZ9RfMd2Lv6xm2a4QznoPBo=;
  b=BX4oS/eUw0ADB7uJntk8fcifYJF+HKXE1g6XDsNMwSPNKEaR32WxkY+w
   yvDrsohjjmTjeYMwzsDCsqFcJGLynPJUSTxv97kP3SWg4/wb4RkxOya1h
   gjqJZN1MFg+dVsryczGG4LQdnpDWFvq31l6aRs8vcs2L7ePPrFFt2bNh4
   ONuLhboBxfu6MoCw00uTjAHal6HeH7THvouv15DWgTnKkG+iWZAuC0Y2w
   H8MY9KQd2EeLKtxP7OK9tPH3/IYyTsv5UxQUMw/yf37Op7qT/efs7axub
   zZCH/B5EzSSXUF74VJufDOGjuyFAMia7kSRAzHbPbCrUV9KJ76qaGjYsn
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669100400"; 
   d="asc'?scan'208";a="193633516"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Jan 2023 07:39:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 24 Jan 2023 07:39:45 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 24 Jan 2023 07:39:42 -0700
Date: Tue, 24 Jan 2023 14:39:19 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>, Pierre Gondois
	<pierre.gondois@arm.com>, <linux-kernel@vger.kernel.org>, Palmer Dabbelt
	<palmer@rivosinc.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
	<will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Len Brown <lenb@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Gavin Shan <gshan@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>
Subject: Re: [PATCH v4 6/6] arch_topology: Build cacheinfo from primary CPU
Message-ID: <Y8/tl999NQwbPL/R@wendy>
References: <20230104183033.755668-1-pierre.gondois@arm.com>
 <20230104183033.755668-7-pierre.gondois@arm.com>
 <CAMuHMdUjgxgOXf5He1x=PLn7MQTjZgFQUHj8JrwbyweT4uOALQ@mail.gmail.com>
 <20230124140420.4srnufcvamvff77v@bogus>
MIME-Version: 1.0
In-Reply-To: <20230124140420.4srnufcvamvff77v@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_063958_076374_C01BDB2F 
X-CRM114-Status: GOOD (  25.64  )
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
Content-Type: multipart/mixed; boundary="===============2131458541024688789=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2131458541024688789==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Vk/U8mTs5k/Wt3P9"
Content-Disposition: inline

--Vk/U8mTs5k/Wt3P9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2023 at 02:04:20PM +0000, Sudeep Holla wrote:
> Conor might help me remember the details.

And I can't shirk either since you know I just replied to Pierre!

> On Tue, Jan 24, 2023 at 02:50:16PM +0100, Geert Uytterhoeven wrote:

> > > @@ -840,6 +840,14 @@ void __init init_cpu_topology(void)
> > >                 reset_cpu_topology();
> > >                 return;
> > >         }
> > > +
> > > +       for_each_possible_cpu(cpu) {
> > > +               ret =3D fetch_cache_info(cpu);
> > > +               if (ret) {
> > > +                       pr_err("Early cacheinfo failed, ret =3D %d\n"=
, ret);
> >=20
> > This triggers on all my RV64 platforms (K210, Icicle, Starlight,
> > RZ/Five).
> >=20
> > This seems to be a respin of
> > https://lore.kernel.org/all/CAMuHMdUBZ791fxCPkKQ6HCwLE4GJB2S35QC=3DSQ+X=
8w5Q4C_70g@mail.gmail.com
> > which had the same issue.
> >
>=20
> I need to recollect my memories reading all the thread, but even after the
> fixes there were few platforms that failed with so early allocation but w=
ere
> fine with initcalls. Are these such platforms or am I mixing up things he=
re ?
> Do you still see all the cacheinfo in the sysfs with initcalls that happen
> later in the boot ?

IIRC that stuff was failing back then because riscv calls
init_cpu_topology() far sooner in boot than arm64 does, and therefore
caused allocation failures. You made that warning go away in the below
patch by moving detect_cache_attributes() to update_siblings_masks(),
which both arches call later during boot IIRC:
https://lore.kernel.org/all/20220713133344.1201247-1-sudeep.holla@arm.com

Pierre's patch has added fetch_cache_info() to the problematic
init_cpu_topology() which is called before we can actually do any
allocation in smp_prepare_boot_cpu() or something like that.

That's what I get for only reviewing the patch that was specifically for
riscv, and not the rest of the series... D'oh.

This actually came up a few weeks ago, although I kinda considered the
reason it was triggered to be a bit bogus there, since that dmips property
is not (yet?) a valid property on RISC-V. The patch for that is here:
https://patchwork.kernel.org/project/linux-riscv/patch/20230105033705.39461=
30-1-leyfoon.tan@starfivetech.com/
I tried it on a PolarFire SoC (unfortunately not an Icicle, I just went
and bricked mine an hour ago) & it should be a fix for this problem too.

My suggested commit message for that is somewhat prophetic now that I
look back at it:
https://lore.kernel.org/all/Y7V4byskevAWKM3G@spud/

I'll ping Palmer about that patch I guess...

Cheers,
Conor.


--Vk/U8mTs5k/Wt3P9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8/tlgAKCRB4tDGHoIJi
0sDmAQC5A7U+zC3XFE9IoI8mjgdAUswG9Sc9F3KPSROMrGNuzAD/RYD2MWaKYUqC
sZ+0vgdr9ZaNFfw9F1XIgPCOYWjBcQ8=
=jqYz
-----END PGP SIGNATURE-----

--Vk/U8mTs5k/Wt3P9--


--===============2131458541024688789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2131458541024688789==--

