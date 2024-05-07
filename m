Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73757C10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 09:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=byX07iO54ChVxnJytP7qlHNcM8U5CJPS58XOLCqAai0=; b=GrQl+Kz/dtDofj3VpsUZkN70Wp
	c1YftH5gYCth948pusKiBUr1X0ddO/VDYayC3XGRhp24st9RTgmaFhDo8In8ETu4Beh1KzoYJ+g+F
	VQ7dvRTSELjCKkgwobOKhpUKU0L/eS8y314f121FjWlh0SoE7EHCF/pR1LyCwNnkLV7Pv0xI6eedC
	Xwk3WL3176JkTQcQzaUVhDIPax7hUHIMcZtceFUIVjLPBuVYeOUU2JsgcynW8EqS+UyAG+/rsr7oB
	Kf7laLIZqCfhMwmZ5HR8aSYgLVA4WXscjqlKmO0R0PTeCXUrTBUjCmuSmJlyJ/G/DnrLQYzaPU+De
	o4CDt9HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4HbI-0000000AR8A-0Mvv;
	Tue, 07 May 2024 09:59:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4HbC-0000000AR6g-2O7L
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 09:59:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1715075943; x=1746611943;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I8R0aOwE5F/0LpDdnQCFDvh+gCCwWQWz4yTbcx0nLZo=;
  b=E/nLu+im2z6447+S65UurN/V2/sZcDRrr9LAx2+ruhjFAAazXCJAjvB5
   rm0ec8yqTn5wf6QfASCN7qfEGv0wxwU52diUCssL/wSncdVHUdShWPrZ9
   bhN0CAx8lTTXDRlNg3dJvhKUQJ1r5jQD6IeM2o95xLLYeVqn4azpKITEw
   PupIxUSftOBcg7A3/kzAzaLCV7hR9YuVAMqq5obnALe/8J8jHCf5f1Eeb
   V852t6lVYphaJFqOrm6dN7pT09PKxCE2yFuym3uu5DCIBfeKlLRANlBx9
   rYRs5L5crU1/Frf/VZb1AYeqjdqqRoKWaD2Yc3ei2g6W07fuNNy9sbJ1Y
   g==;
X-CSE-ConnectionGUID: XpFLPF11T4C9dtakVUdILA==
X-CSE-MsgGUID: Mf+BxLsnQ1+NTzeCIox76g==
X-IronPort-AV: E=Sophos;i="6.07,260,1708412400"; 
   d="asc'?scan'208";a="23954165"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 May 2024 02:58:59 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 02:58:43 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 7 May 2024 02:58:42 -0700
Date: Tue, 7 May 2024 10:58:33 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Arnd Bergmann <arnd@arndb.de>
CC: Conor Dooley <conor@kernel.org>, <soc@kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [GIT PULL] RISC-V Devicetrees for v6.10
Message-ID: <20240507-hungrily-squash-2ac370e05fc0@wendy>
References: <20240503-swimmer-botany-7368a8a17b1a@spud>
 <5222e581-a189-4477-ba6a-edf4ce369eb0@app.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <5222e581-a189-4477-ba6a-edf4ce369eb0@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_025902_767279_6A8AAD54 
X-CRM114-Status: GOOD (  26.73  )
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
Content-Type: multipart/mixed; boundary="===============0140405749452912413=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0140405749452912413==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ONhW0iJrbbQwhIht"
Content-Disposition: inline

--ONhW0iJrbbQwhIht
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2024 at 11:27:36AM +0200, Arnd Bergmann wrote:
> On Fri, May 3, 2024, at 17:24, Conor Dooley wrote:
> > Hey Arnd,
> >
> > Please pull some dt updates for v6.10. The diff here is a little bigger
> > than my tag implies, but I've done this on top of -fixes and wanted to
> > make this obvious. I've also not really mentioned all the Kconfig stuff
> > much as you'll get that in another branch.
>=20
> Hi Conor,
>=20
> I don't have a good feeling about pulling this one, given that it
> is both really late and that it pulls in more dependencies than
> we'd like to have.
>=20
> I was really hoping to be done with new features last week
> as I pulled in the other branches. There are two other DT
> pull requests I got after that (amlogic and aspeed), which
> I added to a "soc/dt-late" branch that I could send in the
> second week of the merge window if everything goes well, but
> those don't have the dependencies.
>=20
> If you are able to extract the DT bits that don't depend
> on other branches (jh7xxx, microchip, bindings and
> new files) and resend those, I could still add them to the
> same dt-late branch.

The jh7xxx stuff does actually depend on another branch, although that
branch is fixes. Do you want that removed too? If you do, I'd say to
just drop the whole PR.

> Basing a branch on top of a fixes branch is usually fine,
> especially if those fixes were originally based on an
> early -rc. I can also make exceptions when there are
> complex dependencies between branches, but I need to be
> able to plan for those and not get them just ahead of
> the merge window.

It hadn't seemed particularly complex to me, so I didn't think to ask
you about what to do with the branches etc when I applied the patches.
I'll be more paranoid in the future...


--ONhW0iJrbbQwhIht
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjn7SQAKCRB4tDGHoIJi
0nMwAQDZCzWCgZr9oQhkMEJubiubko187xG8D7ytfBOQPJYp3AEAxXWcbsAQ2abn
MelI7b/6pYnKOEMkr2ZAjdv7XkGNBwk=
=CwtN
-----END PGP SIGNATURE-----

--ONhW0iJrbbQwhIht--


--===============0140405749452912413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0140405749452912413==--

