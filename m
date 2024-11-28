Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8094D69105
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 12:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sY9z8RNv5XuWSgtzoZ2otDSFT4popDUQwF0DCeISdQI=; b=w5IiStpLkuxwc/JlewO26wjecr
	YSYcjBoQ/+oujc3wweeDB2w7va6tOs1iZn2o28IsHG5aP6HdNUB8+TZTNGfpWdFfejm6blu1+uyev
	Z//kNgZr4kKel3Uvp9CY7ciphTixRILD04qMuitIgWhTrBYhLiF8j3+pR9asFIWbjVdyqoXCrcnTT
	KJZhcaAyCqFS7HvfcsRWK4wcRCcTksHgZhWO/5JT9wH9gMtkbTX4dqGu5ozD5Y5XtuAruRV1uE8gm
	+9Va92W0pNqlau0Fxo5nHfJocEQ44Z5lmO2Hx5cupmrjw66IYuzI0dVxwc+9He5vN0OAvXhdvNn+z
	C+8WxVjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGe5o-0000000FZHb-26qU;
	Thu, 28 Nov 2024 12:58:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGe5m-0000000FZGZ-1ChE
	for linux-riscv@lists.infradead.org;
	Thu, 28 Nov 2024 12:57:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732798679; x=1764334679;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QMSrXLPmS8/rI15I1H6zoqnyGh2Mcn9fOeS/kWycmGc=;
  b=HtrE3yo3AWQTP8kvZ5iukYKgiKHrbCcxCqdDQEy2x6Tc6oBQHxj9udPZ
   rXhOIjcuzd4yBbEQYa3wPUSJp5KzoOpCXuAF+VVamr/ZVk3Q8nxhwpGkQ
   3H+yro9Yw4ufcK8Qz4D/LzwzWYZ8bp75uVzKWDpBMnvMf5u00N4APBH8s
   ZYwIhNLLCQ4UlGETQtjPwaji2F4IVJm7CrSV8z8tZQorxAD0PvSIxp+fq
   XxAdTTTIs/EqDJNCde06MJ8XUCKP/mVZdktxWdZH+6sf1vupfW1/j4CcB
   b4sMd2t33TryIyTZKMX8CGDbri2I7oaV5y52QMYDwu94QO+bVJ+HhAS7R
   w==;
X-CSE-ConnectionGUID: /UvZogjDQyWxjx7e3ftesA==
X-CSE-MsgGUID: Z3VVt8QuQ6eGvsYfIj+DcA==
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="asc'?scan'208";a="266085200"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Nov 2024 05:57:57 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Nov 2024 05:57:26 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 28 Nov 2024 05:57:22 -0700
Date: Thu, 28 Nov 2024 12:56:55 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
CC: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri
	<parri.andrea@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon
	<will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng
	<boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Leonardo Bras
	<leobras@redhat.com>, Guo Ren <guoren@kernel.org>,
	<linux-doc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-arch@vger.kernel.org>
Subject: Re: [PATCH v6 13/13] riscv: Add qspinlock support
Message-ID: <20241128-whoever-wildfire-2a3110c5fd46@wendy>
References: <20241103145153.105097-1-alexghiti@rivosinc.com>
 <20241103145153.105097-14-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20241103145153.105097-14-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_045758_391372_5069DEE9 
X-CRM114-Status: GOOD (  13.42  )
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
Content-Type: multipart/mixed; boundary="===============7703371930796285582=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7703371930796285582==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qajfT6S+474YA1dH"
Content-Disposition: inline

--qajfT6S+474YA1dH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 03, 2024 at 03:51:53PM +0100, Alexandre Ghiti wrote:
> In order to produce a generic kernel, a user can select
> CONFIG_COMBO_SPINLOCKS which will fallback at runtime to the ticket
> spinlock implementation if Zabha or Ziccrse are not present.
>=20
> Note that we can't use alternatives here because the discovery of
> extensions is done too late and we need to start with the qspinlock
> implementation because the ticket spinlock implementation would pollute
> the spinlock value, so let's use static keys.
>=20
> This is largely based on Guo's work and Leonardo reviews at [1].
>=20
> Link: https://lore.kernel.org/linux-riscv/20231225125847.2778638-1-guoren=
@kernel.org/ [1]
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

This patch (now commit ab83647fadae2 ("riscv: Add qspinlock support"))
breaks boot on polarfire soc. It dies before outputting anything to the
console. My .config has:

# CONFIG_RISCV_TICKET_SPINLOCKS is not set
# CONFIG_RISCV_QUEUED_SPINLOCKS is not set
CONFIG_RISCV_COMBO_SPINLOCKS=3Dy

--qajfT6S+474YA1dH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0holwAKCRB4tDGHoIJi
0oxHAQDvlh0ZpqCtx7NHMgqYni9qnQMfa+yBnfL0GReiPZOY6gEAuG43y1PeVjrz
9u1w7lL364g1nfGmc7VfESDSWYuheQA=
=ZDec
-----END PGP SIGNATURE-----

--qajfT6S+474YA1dH--


--===============7703371930796285582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7703371930796285582==--

