Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAA2C54EBC
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 12:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fuf0JeH8K2UvJEz3dzShnlFf2SudTjoV1xIVHTBClPU=; b=MQGRnckHOifdx20AbkceE3S/V2
	oVdUvKpXj8rP1vAAFCC1r+GiH1GHOMXOfteCuqJn4cYOTNkwttEhnBKZJDAHPwX0BXEGG7zpm5+EX
	pV2yZ4QJpMBhFlaPZqWZOikAdH3V/T7+gT52P7FfBlA2hfIG25H4AJvuR2nsLlpyzyoxw09Jgb4EU
	fdKlnTG8S5TvGaJar2HWzAGRpr1RxioUwg63buO2fsjxNisnWKvAg+/OWRUZi6xZ2dRtTY/ObG4YU
	83rPeto41dVPJGcEJ6hQ0nWUHZtSgUuhMw6D7wjceIee6yGaItgl9sEE8XpGEwXgmaHFvglUXIDH3
	5rZ82dcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFwM4-00Ewy8-PY; Thu, 12 Jan 2023 12:06:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFwLq-00EwwM-OD
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 12:06:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673525194; x=1705061194;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x/Ldtlmo85OHHzwftMA/RPWJjrWxcyaPmhh9lRsuUbA=;
  b=O69CpDELWc6OQHneYxpqHbuA9NLDuNF8MWDx3YDgTp601ebZGjVm9LB6
   fYBxvRxc2ylV8RkWGhcAY8ehzY2N1w4Zk3xS6KWx8GexWNahCeh5xE5bs
   N4gb7JuK6f1DRpoz78FtEy1jGYsiVKfGMj1jVmNhAtxy/YAJORwrauS22
   6Wp8R66qN3D1AHEUXL8S7U7DdS3JICMNrza2WIIiow1ozEZzf94IVno3y
   MPjjVl19KMGflY6zxmMpIG5uZA/8HfQutJsn2knOIjIDrJdVxm9rMWNSX
   PKjnhWw/vrLNYJFNrGJmcp/5PyNh3DWeL+L6AEcSzpOdkbHBTB2R5dRYd
   g==;
X-IronPort-AV: E=Sophos;i="5.97,319,1669100400"; 
   d="asc'?scan'208";a="191908039"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jan 2023 05:06:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 05:06:25 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Thu, 12 Jan 2023 05:06:24 -0700
Date: Thu, 12 Jan 2023 12:06:01 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, <palmer@dabbelt.com>
CC: Andrew Jones <ajones@ventanamicro.com>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <christoph.muellner@vrull.eu>, <conor@kernel.org>,
	<philipp.tomsich@vrull.eu>, <jszhang@kernel.org>
Subject: Re: [PATCH v4 5/5] RISC-V: add zbb support to string functions
Message-ID: <Y7/3qc6ppZzie/ve@wendy>
References: <20230109181755.2383085-1-heiko@sntech.de>
 <20230110095720.j7ll3qwmwneodmpw@orel>
 <Y706jSZjUOle32m+@wendy>
 <6183320.UjTJXf6HLC@diego>
MIME-Version: 1.0
In-Reply-To: <6183320.UjTJXf6HLC@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_040644_221207_93392C21 
X-CRM114-Status: GOOD (  13.04  )
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
Content-Type: multipart/mixed; boundary="===============4217231382976281537=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4217231382976281537==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H4ZsaFx/2SK7ltyj"
Content-Disposition: inline

--H4ZsaFx/2SK7ltyj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 12, 2023 at 12:21:38PM +0100, Heiko St=FCbner wrote:
>=20
> I've gone forward and imported that series as a dependency in my tree so =
that the
> ordering becomes correct :-) .
>=20
> Though of course I got a conflict with Andrew's
> commit e923f4625ed3 ("riscv: Apply a static assert to riscv_isa_ext_id")
> but fixed that up - though maybe a rebased v3 may be in order?

To be honest, I "strategically" didn't resend a v3 despite that trivial
conflict since it's at the bottom of the list on patchwork.
I was hoping that it'd get merged earlier in the window so any of the
various bits of extension support stuff could go on top of the re-order,
given it conflicts with, give or take, every other extension related
patch. That's not come to pass (yet?) though.

I can easily respin, but if I do & some other extension bit gets merged
before it, it'll conflict again, so I didn't in the hopes that the
conflict could be resolved...

What you think?


--H4ZsaFx/2SK7ltyj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7/3qQAKCRB4tDGHoIJi
0kccAQCwllzmEL5Fa5Higuh4R/7zY0ReH42mNMjlNIJnwC2t2AD8DBQc2BeV1u8n
xOWsLGZyybHqRheDjxVJNZUfBn9e+wc=
=W0ll
-----END PGP SIGNATURE-----

--H4ZsaFx/2SK7ltyj--


--===============4217231382976281537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4217231382976281537==--

