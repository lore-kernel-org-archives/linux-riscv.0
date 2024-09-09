Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33870ECE579
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Sep 2024 11:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y3n1qROuuEE4byaOwoNsbICcfx0OBsiouByJxOo+auQ=; b=eNGfKNhfT0r0Q4fbybN0kmGESn
	m2s1J289IKCXKxyCwYv0KbTeiHiGWpUZQ8506krwTju3s92i3tHRr7ajQONGhzfjepZ0f2TXw/Shc
	CtUj/f6WWyuloGxBsmenYyG/dEkieZVzv0Nq7eoGMSmIY2Yp9WMuX7Sd/mdMjbXMDJJDrnqGqDgzX
	deYtj8MKyOSR6O6DpmfWWvIpGP0HoHniq1uFMpAwNIg6xiN4P6MGgh67Cn5j9uqycBo+ZcMmsNoJ+
	Yt4YPfPSjQi86TSTLEieKvSKZwxJIgRxiX0/tI9c6jdeDoVLNSsXvANSyb/dXnoq3w0CQesOcwanY
	MbYZCA4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snctd-00000001jra-2b8N;
	Mon, 09 Sep 2024 11:49:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncta-00000001jqe-0Tgk
	for linux-riscv@lists.infradead.org;
	Mon, 09 Sep 2024 11:49:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1725882565; x=1757418565;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=osEgMmc3pSgymuEZ5F4klxDmO7a0n5xJEBKV4k+DAZc=;
  b=X95q3amnXmvlSOXn7QbfDQKGfUbj0z8VXqBfsz437JYumcoNlDWq+KUp
   up9t2Iy2+pMSLrsdsp7olR51lcHtN0HAsXSqnsf8zC/jtqFg9bbc22tSk
   Qp5N+2NMYPq2Ri9g9+t46jQnst+SUxUlvnFGRyn4S+GcNcS+1fQobmQnB
   857SwtLFsSBMNlqau5sUO0M9LS2rnELXR6C+WDP8+RMvyGmsWXkeiSc9I
   cSePhaFKZEb8kCYqz5x1zWbn51EBIy74b0aZLFPn2wVYFJ3wG4jJMqFTA
   oZb32EmimzJhphydzcCXa6AJ5QRL1FkwTY/y/7Z/fhZJNqTcLhv73ZRqX
   A==;
X-CSE-ConnectionGUID: WusmmYi+Rp29pd7EVOjWCg==
X-CSE-MsgGUID: /az8+jGUS0GouVUdPyt8YA==
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="asc'?scan'208";a="34628456"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Sep 2024 04:49:24 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 9 Sep 2024 04:48:44 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 9 Sep 2024 04:48:43 -0700
Date: Mon, 9 Sep 2024 12:48:10 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Miquel =?iso-8859-1?Q?Sabat=E9_Sol=E0?= <mikisabate@gmail.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jesse@rivosinc.com>, <conor@kernel.org>
Subject: Re: [PATCH v2] riscv: hwprobe: export Zicntr and Zihpm extensions
Message-ID: <20240909-botanical-frying-9d6eeaa99fb3@wendy>
References: <20240817075629.262318-1-mikisabate@gmail.com>
 <20240820044749.557349-1-mikisabate@gmail.com>
 <66d9605f.5d0a0220.3dabb6.3586@mx.google.com>
 <20240909-raving-reproach-74431f57896d@wendy>
 <66dede4f.5d0a0220.1ef0e1.c922@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <66dede4f.5d0a0220.1ef0e1.c922@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_044926_264068_18C7DF5C 
X-CRM114-Status: GOOD (  14.68  )
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
Content-Type: multipart/mixed; boundary="===============6292900770481069899=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6292900770481069899==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aaw5R+2YUCgSbkMR"
Content-Disposition: inline

--aaw5R+2YUCgSbkMR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 09, 2024 at 01:38:49PM +0200, Miquel Sabat=C3=A9 Sol=C3=A0 wrot=
e:
> On dl., de set. 09 2024, Conor Dooley wrote:
> > On Thu, Sep 05, 2024 at 09:40:14AM +0200, Miquel Sabat=C3=A9 Sol=C3=A0 =
wrote:
> >> On dt., d=E2=80=99ag. 20 2024, Miquel Sabat=C3=A9 Sol=C3=A0 wrote:
> >
> > By the way, I totally missed this first time around because the v2 was
> > sent as a reply to v1 - it's pretty common for people to view their
> > mailbox sorted by thread, and sending new versions as a reply will bury
> > it.

> Thanks for the review!
>=20
> This is my first contribution to the Linux kernel, as you can tell :)
> Will keep in mind next time!

No worries & welcome.
It did end up in patchwork, so it was unlikely to get permanently lost:
https://patchwork.kernel.org/project/linux-riscv/patch/20240820044749.55734=
9-1-mikisabate@gmail.com/

--aaw5R+2YUCgSbkMR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZt7gegAKCRB4tDGHoIJi
0oS7AQCPejIA2EuGNAVFaYjpLhdFiegbpRs8sEPVNQCZ00INFwD8CINDSoz0A5LH
U5oKuhYn8bJNkG8ICoXMjSGyg+7utAU=
=PbRq
-----END PGP SIGNATURE-----

--aaw5R+2YUCgSbkMR--


--===============6292900770481069899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6292900770481069899==--

