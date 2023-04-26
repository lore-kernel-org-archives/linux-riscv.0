Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62249C7618E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 12:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fiFX4Bul/17MuG8dGAEwrKfJkLwUO4Mzq/Shuz1z3xE=; b=vEaUvI/e98FtGzrNuFzIuIE5mY
	aLGy4a8upO6qCmlgIuO6gO2TiZkI4PJY8Z2maZ7Gfc653vaUokHihisFQwcxG2q1ftFspwhAPp/9e
	EIpEuOhqO5ByiWY/6v7b88QkrXee2FuBPM+7GOBoGVnuYaEKQEz/H/TwLyr1cab67sVcL9Y3fa2Jt
	Ht+BBgfn4xe4dpzAo29iorw6cgIO1La2c2Bf2R0jo2IfDpil4RQqP6j1jI3YpILlZp40NVNL8QK7v
	FfWoj4vRoD5+eMVZP9jVVauW+EjnnbyHgjm4SNdQuzdlxpoRjV4t4FCPTc5/WzqtDB4J1jPNju6E1
	D5KAvl8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1preZ5-003xwy-3A;
	Wed, 26 Apr 2023 12:48:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1preZ1-003xvZ-3D
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 12:48:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1682513284; x=1714049284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7abIa9Fa73+PqQnL1yYwEJJ5u6R981a/poEDnA+YJeA=;
  b=XtEkdoiONC6upVwu3L2r7Y55JOzAhAXc02iB98PRHF/LKNGtEv6CuTZ+
   gOKUlDs0xNRDQFB4u4562jPjGiqnTa9zI1kl5yFfALNUkEmBPhoTvEEDK
   gpgeiVQuW6qBy3hUghUiUnHHk3F6IVXuVGcVkKpHuKxmjniLP8X4PYt3c
   OkLL0f/SVv0YIhm/3hEnCiwyoKulV/ZekXPLCalUMPo+WNTSv04cRj89U
   QoD/dAje3jlWoIbEv/CBvyoDXAFqxGT96VG/EEK6HrkTuG+L5sUYcqqtt
   7y7O0ra1yk55sy8JdFzDuhe6OmOcG9qmhWMo+STo/ky/yG005PRZtaXJ2
   A==;
X-IronPort-AV: E=Sophos;i="5.99,228,1677567600"; 
   d="asc'?scan'208";a="211277383"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Apr 2023 05:47:59 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 26 Apr 2023 05:47:58 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 26 Apr 2023 05:47:56 -0700
Date: Wed, 26 Apr 2023 13:47:39 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: <palmer@dabbelt.com>, <conor@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Wende Tan <twd2.me@gmail.com>, Soha Jin
	<soha@lohu.info>, Hongren Zheng <i@zenithal.me>, Yangyu Chen
	<cyy@cyyself.name>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v1 1/2] RISC-V: skip parsing multi-letter extensions
 starting with caps
Message-ID: <20230426-slinky-preface-0f40f3fefb0f@wendy>
References: <20230426-satin-avenging-086d4e79a8dd@wendy>
 <20230426-devalue-enlarging-afb4fa1bb247@wendy>
 <zzxnphgq34d7pbbvjaoxal4i3mtn57x7avujr2brb3ddxorzno@3fsb57layf7m>
MIME-Version: 1.0
In-Reply-To: <zzxnphgq34d7pbbvjaoxal4i3mtn57x7avujr2brb3ddxorzno@3fsb57layf7m>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_054804_035197_A2A6B4D5 
X-CRM114-Status: GOOD (  24.16  )
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
Content-Type: multipart/mixed; boundary="===============2076536341798845853=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2076536341798845853==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2+PhMxZ3REZzaIR2"
Content-Disposition: inline

--2+PhMxZ3REZzaIR2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 26, 2023 at 02:18:52PM +0200, Andrew Jones wrote:
> On Wed, Apr 26, 2023 at 11:43:24AM +0100, Conor Dooley wrote:
> > Yangyu Chen reported that if an multi-letter extension begins with a
> > capital letter the parser will treat the remainder of that multi-letter
> > extension as single-letter extensions.
>=20
> I think the problem is that the parser doesn't completely abort when
> it sees something it doesn't understand. Continuing is risky since
> it may be possible to compose an invalid string that gets the parser
> to run off the rails.

Usually I am of the opinion that we should not seek the validate the dt
in the kernel, since there are tools for doing so *cough* dt-validate
*cough*. This one seemed like low hanging fruit though, since the parser
handles having capital letters in any of the other places after the
rv##, but falls over pretty badly for this particular issue.

In general, I don't think we need to be concerned about anything that
fails dt-validate though, you kinda need to trust that that is correct.
I'd argue that we might even do too much validation in the parser at
present.
Is there some attack vector, or ACPI related consideration, that I am
unaware of that makes this risky?

> How about completely aborting, noisily, when the string doesn't match
> expectations, falling back to a default string such as rv64ima instead.
> That also ought to get faster corrections of device trees.

I did this first actually, but I was afraid that it would cause
regressions?

If you have riscv,isa =3D "rv64imafdc_Zifencei_zicbom", yes that is
invalid and dt-validate would have told you so, but at present that
would be parsed as "rv64imafdc_zicbom" which is a perfect description of
the hardware in question (since the meaning of i was set before RVI made
a hames of things).

So that's why I opted to not do some sort of pr_err/BUG()/WARN() and
try to keep processing the string. I'm happy to abort entirely on
reaching a capital if people feel there's unlikely to be a fallout from
that.

Cheers,
Conor.

--2+PhMxZ3REZzaIR2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEkdawAKCRB4tDGHoIJi
0rCYAQDAFdV3IwWNOtyPBFQVrzZ7oJg8v+xKBvTanwY2FvPdNgD/UKcpqYjj7Pf+
31qZI/sGuZGsO6Zm4B2R0g7n1fKbQw4=
=GslL
-----END PGP SIGNATURE-----

--2+PhMxZ3REZzaIR2--


--===============2076536341798845853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2076536341798845853==--

