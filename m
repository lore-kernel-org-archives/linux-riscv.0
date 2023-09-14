Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E9EEDE983
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 06:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NyyhJVxWcuI5p6GKsTigCnsmg02olQeF5+wgQtkJi3Y=; b=j1wH+pPd79+V6Ym/ulFfgmrcti
	xa1f/HUNe5CR5B6F4kNO6n99IpCGYsift3alwHaKZxz8cSO/LTlhttp/aUipdTCwm5YXWicgyPhG+
	m/BchrCcvOj660NobsHImdgPj3z0aVRJDDzHFAzqfYmNqm0WmEwxB0hyM1DTTtdPwrkoQ/iCJkWRl
	V7tdR80FG7vHZmHD3HXWZXw+PjKxnPi9XVxtUuMoK0I9H3g5ZCZpsBy0yuzd0h95JW3+g9VXq3372
	ygQgkutZM9NyAabtVmMOzAHD0uYODvdl3dFmcOsOzQCXELc2WlEWVPCMYunfsK/i/72ZGtKSRgpzH
	V8kSv3RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgg8O-007Xwv-29;
	Thu, 14 Sep 2023 06:47:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgg8L-007XwQ-1l
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 06:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1694674045; x=1726210045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MiNTIYzOJN1wrtxFN5lQC/gqZO2j2q+e6nLCMiBsuN0=;
  b=rwrWNYbah/jT7NgInsW5/w17BDQW3wSvT/YWwW55Y3wCjal0oAOLNmGW
   61kO5zQJ0DBPQAxu68FPfF/qgVUKjv3Bxf4o9tn8XDnr/J4lTLmRyvye1
   fFICEPwWzLZAbXRj5ogc3/eq4ZKGZI9AmoCTKzUyIoT+l3qHmsW5vNl3n
   RR3vEZi4FEExygxS+Jkgc1x7qeGLl8Nl2ynGMSZT3OrWTazK89HtcPRVe
   82ii7UUVnmZMFL3KRITvUkUHCBHtwisXIb6q8GNdF/+QwQzzCbjrEy4LP
   gvNOawPVzOf6ZJjdCoat4MiMGHAc9s8/fFBs5vG4bgyH2DSyqMS7VIIQQ
   A==;
X-CSE-ConnectionGUID: vfMOlH7yTwexRPP1GuH5GQ==
X-CSE-MsgGUID: xoTsubcES+2nTFm4PMX80A==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="asc'?scan'208";a="4463721"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Sep 2023 23:47:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 13 Sep 2023 23:46:45 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 13 Sep 2023 23:46:43 -0700
Date: Thu, 14 Sep 2023 07:46:27 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Conor Dooley <conor@kernel.org>, <arnd@arndb.de>,
	<changhuang.liang@starfivetech.com>, <jiajie.ho@starfivetech.com>,
	<linux-pm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<robh@kernel.org>, <walker.chen@starfivetech.com>
Subject: Re: [GIT PULL 0/5] Missed starfive pmdomain changes for v6.6, now
 for v6.7
Message-ID: <20230914-appliance-vastness-989ded32323a@wendy>
References: <20230913-bloomers-scorebook-fb45e0a2aa19@spud>
 <CAPDyKFoENVp7+VjKkPpJWDecowxYD=QM6TSa6HjyzOZ=z7r81w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPDyKFoENVp7+VjKkPpJWDecowxYD=QM6TSa6HjyzOZ=z7r81w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_234725_671637_A7B694A9 
X-CRM114-Status: GOOD (  19.01  )
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
Content-Type: multipart/mixed; boundary="===============3030276736476752402=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3030276736476752402==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JiM0GHmFjKEmdcha"
Content-Disposition: inline

--JiM0GHmFjKEmdcha
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

I tried to reply a few hours ago from k9, but it appears to not have
landed on lore, so here goes attempt #2. Apologies if you got a mail
twice.

On Thu, Sep 14, 2023 at 12:30:20AM +0200, Ulf Hansson wrote:
> On Wed, 13 Sept 2023 at 15:56, Conor Dooley <conor@kernel.org> wrote:
> >
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > Hey Uffe,
> >
> > Here's those missed changes in patch form. I figured it might be a bit
> > easier this way given the name of the subsystem is in flux, doubly so if
> > you'd like to put the header change of Rob's on fixes.
>=20
> Not sure we really need to queue up patch 1 for fixes - or is it
> fixing a real problem for us?

It was just in case you felt that taking that header cleanup as a fix
was worthwhile. I think I saw some people doing that last cycle & I
think Rob was trying to clean that up for v6.6 which I obviously haven't
helped him with.

> The series applied for next, thanks!

Great, thanks.

--JiM0GHmFjKEmdcha
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQKsQwAKCRB4tDGHoIJi
0r7TAQD81jDl7jfypoYEMa4xfg+xgWZ18aAlvf6l47iUh9yGkwD+IhMwZjeNG32K
QFrjpiM4Bsm9g1HAcfAtmsBVqtwaXwQ=
=YHCd
-----END PGP SIGNATURE-----

--JiM0GHmFjKEmdcha--


--===============3030276736476752402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3030276736476752402==--

