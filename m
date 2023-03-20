Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA38C6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 12:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFtw6aZwwAsFSCMGKSVEhL5n+yjDyGJFXaVt9jLYwSc=; b=qLMOkODB+QFMrphS9vOS63xktk
	d6CF4kWWP6viE60+BaDNKXdaiT4EZRuomxlu9W/3nszz7zeL5qUOLxTiUsDw06SYYHjgigBQ3CmgH
	L5wOSeKCgWoVyH3pBTACl7UOTGvQpqz5ku4WL/IDvXkKDknUOpFSyYAiO/atT1KmqESLtsoo+Xi+c
	pzezF5Gt3Sm5tyk8mpKNrpjU40xqcEyECfjSxhJLqiKx3M+D81OzC7oQWus0QtKrzk8zaeou9H9Jk
	fdAyV+Li0q80v2jCJ+bnS7oEU21Cm7qIPvUbeMBis14OR+/OoWxi24tasBJsmkQztZWSf99wVoI/S
	JrdF77KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peEiT-008yfb-2h;
	Mon, 20 Mar 2023 12:34:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peEiR-008yeq-0g
	for linux-riscv@lists.infradead.org;
	Mon, 20 Mar 2023 12:34:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679315658; x=1710851658;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LcnN2qGl2Pur4dc2QuLgMq8NqxxsuBO2ZuAmWpHomJ0=;
  b=Xrx/63RsAGjEQTzndBwrzRAFZqOTbOwwvpjBiBmG2Qku/fp63cm92kX6
   Ig6AihtLQYcNOwCqLu6wahrUhz/IvN8OXtPQUK/BPUVfC1DZFXGyMnz9x
   FPsXtOaJa03SYVO3fecvYzBFgS/+VuWEYNB1hPm8Jl8r0O48WBcvE9uyA
   QS09DxxrQMl35NisbYARjrGK6QqoDrPLJQvsML4KqGz7GDKvXBbAt9v/n
   M13E7nfPyN9/ASx5ByhhBrtZ2wIF2k0yrcmG3k8nROPRCTuhWWgPOWQB4
   hLi1yXzxCKnG+sD9kHlpDDAd2omKlC7fBWBqw3Nj9Wl6BRGxJUjwK2dZZ
   w==;
X-IronPort-AV: E=Sophos;i="5.98,274,1673938800"; 
   d="asc'?scan'208";a="205505745"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Mar 2023 05:34:18 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 05:34:18 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 20 Mar 2023 05:34:16 -0700
Date: Mon, 20 Mar 2023 12:33:46 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
CC: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>
Subject: Re: [PATCH v6 0/4] RISC-V Hibernation Support
Message-ID: <d7588d2b-882c-4d9c-b2c8-228db57f56cc@spud>
References: <20230314050316.31701-1-jeeheng.sia@starfivetech.com>
 <1a2b03d49ce1440b9e50ca8a13320782@EXMBX066.cuchost.com>
MIME-Version: 1.0
In-Reply-To: <1a2b03d49ce1440b9e50ca8a13320782@EXMBX066.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_053419_251524_3A00A3AD 
X-CRM114-Status: GOOD (  10.17  )
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
Content-Type: multipart/mixed; boundary="===============4607554699976096469=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4607554699976096469==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HaYFqWzWKiEzet2y"
Content-Disposition: inline

--HaYFqWzWKiEzet2y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2023 at 07:20:58AM +0000, JeeHeng Sia wrote:
> Hi,
>=20
> I understand that you must be extremely busy, but I was wondering if
> there are any comments for the below v6 patch series?

> > -----Original Message-----
> > Sent: Tuesday, March 14, 2023 1:03 PM

It's not even been a week chief, relax :)


--HaYFqWzWKiEzet2y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBhSqgAKCRB4tDGHoIJi
0isRAQC8xqECPojT7k8KLP/g0gxIKh0GbuzK/rus2SdRX/7gxAEA4fdVWWR7jRBN
8UJBhDFoCHdK5+6jjdAwESpbv+bUzwI=
=4n11
-----END PGP SIGNATURE-----

--HaYFqWzWKiEzet2y--


--===============4607554699976096469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4607554699976096469==--

