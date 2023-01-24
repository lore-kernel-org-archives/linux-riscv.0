Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED987C38142
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 14:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GjwRP6mSgmJUaNeONKRkXKr+rmMbCAdrhObwOjGWzq4=; b=WILwr7F5NyDwOU6G8nKSBJ+fuh
	00VLUDNhS2Rjrym/IygQJH7qY0sz2mwOoYwAsY2WGPsjepn6w9V4EvD00abGtJ/Hy2kYWi3Ltyhc/
	pSwubfs5Km7/vjsyiJfgLXW5U2JYrjrYjefwTGm9E3n1N9j6GJYQ3fTzkjnvt87JQpn0xjb6XOfaj
	h9t7QPNrlCM3htyT9iKjMCv9RsHCcXV5q2Ujb9yvoAG36yGZYX8d4Hc6tZzFDeymHZH0Y0r61kHtQ
	M7VQP96wR8uoy2NPgkurIeNfMy8CxFIK2Mf6N1XZ86XpiZhVj3p0rOqJpQosSHocsMZQ38ew/C8Ux
	5JTIzbAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKKhX-004QkF-TI; Tue, 24 Jan 2023 14:55:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKKhN-004QgY-AK; Tue, 24 Jan 2023 14:54:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674572098; x=1706108098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Aqg7OTmodw3SWwmONFkR7fFT/auEU1rbO2adYYQQeo=;
  b=SQfO+z6wGm2KceuJj54GpYyTeruHYdoqbzhBksjif5oRMxweKgPRS0Y7
   2cdJdqWQmxkmdL4Evbi2u1bvD2ChrQ6nySNryZLl2IHnCBypt/ICw+vQf
   syXCFj6h04Vkgn1eFQmlpkVMvQonP5DCSFt993dIdIx5CGs/K3fL4/TpJ
   U6KXtaDCV3x+mpVVS/Nw0m/rv8RO2U49wYZnyHW0i2XS2NX6rDz8b8P8T
   hgdDNz1ehcE7FCse+DvuZSnmdWJ+hOms0aHjg+jX/6XQ7ncejXfhTO4vs
   +0mfRXNP4VerySlbZuMTqDmaj+zAOgpeRCrPQxX0jk/Ag7akTXUAVvcce
   w==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669100400"; 
   d="asc'?scan'208";a="198078663"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Jan 2023 07:54:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 24 Jan 2023 07:54:54 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 24 Jan 2023 07:54:52 -0700
Date: Tue, 24 Jan 2023 14:54:29 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	ALKML <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, Pierre Gondois <pierre.gondois@arm.com>
Subject: Re: [GIT PULL] cacheinfo/arch_topology: Updates for v6.3
Message-ID: <Y8/xJZOourqBvxVR@wendy>
References: <20230120121856.1407369-1-sudeep.holla@arm.com>
 <CAMuHMdUZzLkWvhQ=YeH2KfQ_FRidemfOvbbHf_b1AHROK9HFNA@mail.gmail.com>
 <20230124144245.ddphvqbcxpzrlgek@bogus>
MIME-Version: 1.0
In-Reply-To: <20230124144245.ddphvqbcxpzrlgek@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_065457_380432_A2D996B5 
X-CRM114-Status: GOOD (  18.86  )
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
Content-Type: multipart/mixed; boundary="===============7246562256937643756=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7246562256937643756==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WNceExkhTMtKXWOE"
Content-Disposition: inline

--WNceExkhTMtKXWOE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2023 at 02:42:45PM +0000, Sudeep Holla wrote:
> On Tue, Jan 24, 2023 at 02:44:10PM +0100, Geert Uytterhoeven wrote:
> > Hi Sudeep,
> >=20
> > On Fri, Jan 20, 2023 at 1:22 PM Sudeep Holla <sudeep.holla@arm.com> wro=
te:
> > > It has been tested on RISC-V which is the main users outside of arm64.
> >=20
> > Has it?
> >
>=20
> Hmm, I might have mixed up things then. I was on a vacation for quite some
> time and might have assumed Conor response on the thread with testing.
> Extremely sorry for that. However it was in -next for few days before
> Greg applied to his tree.

Sorry chief! The CI stuff we run on the RISC-V patchwork only provides
build coverage etc & my CI against linux-next doesn't check for this kind
of thing.
I'll put it on my todo-list to add that, both for patchwork and in our
internal CI.
I only reviewed the patch that was moving the code to common group and
not the others unfortunately. Next time I'll be sure to review the lot!

Thanks,
Conor.



--WNceExkhTMtKXWOE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8/xJQAKCRB4tDGHoIJi
0tp/AQCZb4MIIYgEB3TFMu5py4DRir2pfY2mDK/y9ErwoNDKsQD+JjbUCxk+P5TI
GnCI0mjKSnBOpe7Xwz7qxOTETGES7QU=
=LjqK
-----END PGP SIGNATURE-----

--WNceExkhTMtKXWOE--


--===============7246562256937643756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7246562256937643756==--

