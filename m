Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DF9C64ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 10:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nooj5dn1m5sQP+2otVNyWqRCyh8yScYDbT/rByhJ2jY=; b=iTk+JTJZ/E1fWJdgV5nTjwyN7Q
	pCai5dDEtgKJ7X+cV7uTCS6Q5t6m5pJmNc3TE9FT0oEAUkCAp3sMrkfxwhJnozoPzOMIqCZuCefw4
	wdu+JXWAwQPcv9FmwzwDcpu/NN3HoXxESEPiZD+4r2FIZIPQSO8D8u/o3vGRQYR2qqVzFwR8I5Bo4
	UrrqmJHLWAnOxsK594bur6VOZpQQCgVbx2kUYlyU/r2IP3uS1mYf4ZZtDam0ToVD5hiIe5sb1DJjB
	2WSCyz6OX+NWAb2t1+j6ioc+JVOjnm9lo4P6Q9Gay2ic9iTLhK+UtJgyrSim6+hJXo1e14p9zomL3
	Wp4rVyRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxg8-00CpjW-PM; Tue, 28 Feb 2023 10:57:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxaE-00CmCM-Md
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 10:51:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677581506; x=1709117506;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EmV1CDA32bCw5Yuxlf/FrxK14FNdKdtOjrbPPzU8wDE=;
  b=z1Os/oiOZGfaldW+FyA97H1XZr9P8P0qRAN2JVXp5vp9Qua9RalKne40
   wHYU0cUFICxHTvg93VLpo5A8HEqzWw6xfb47NFM+PbSoyJoIkSDzdIq0K
   PQf4VxHuTuqzMXL6n7n0uXBMrmAgM3ea3BWxAxevu6lxDIhuWuE9tkWYe
   7Y39nwnTcySD2sP3IHOK1NusOQWDiyFLmwGk13lkpnEAjnEny4bL+L9Nd
   hr8ernowl5mkR0eF/ECFK/B+fI3nAVYVFehQBtvCVVxRpXqfLSESy3Eig
   VXn3m5+p9oGAE28kDqAPWyPohyayYwdbCcNdq4emAMtzgzWU3s6JvG1bT
   A==;
X-IronPort-AV: E=Sophos;i="5.98,221,1673938800"; 
   d="asc'?scan'208";a="202531380"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Feb 2023 03:51:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 28 Feb 2023 03:51:42 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 28 Feb 2023 03:51:39 -0700
Date: Tue, 28 Feb 2023 10:51:12 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: Xingyu Wu <xingyu.wu@starfivetech.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-watchdog@vger.kernel.org>, Wim Van
 Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Philipp
 Zabel <p.zabel@pengutronix.de>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v3 2/2] drivers: watchdog: Add StarFive Watchdog driver
Message-ID: <Y/3coFvMWOLaaY9p@wendy>
References: <20230220081926.267695-1-xingyu.wu@starfivetech.com>
 <20230220081926.267695-3-xingyu.wu@starfivetech.com>
 <CAJM55Z823iqUqD8enM0qJ_MA3Tw94Mn0mq71fbLT1Qjo2s2J3g@mail.gmail.com>
 <0ffb02d2-0bbd-fd0d-b0f6-cb5605570050@starfivetech.com>
 <CAJM55Z_hRpUYueZ-XuWUx1NfAsL9E+-4ry9TYeRWM_bKXvym-g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z_hRpUYueZ-XuWUx1NfAsL9E+-4ry9TYeRWM_bKXvym-g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_025146_870561_4EE3B38D 
X-CRM114-Status: GOOD (  11.32  )
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
Content-Type: multipart/mixed; boundary="===============7812319830381222620=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7812319830381222620==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UcWmcqa/y1djr3DO"
Content-Disposition: inline

--UcWmcqa/y1djr3DO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2023 at 11:36:49AM +0100, Emil Renner Berthing wrote:
> On Tue, 28 Feb 2023 at 10:44, Xingyu Wu <xingyu.wu@starfivetech.com> wrot=
e:
> > On 2023/2/26 22:14, Emil Renner Berthing wrote:
> > > On Mon, 20 Feb 2023 at 09:21, Xingyu Wu <xingyu.wu@starfivetech.com> =
wrote:

> > So the dt-bingdings need to rename, and which one could be better,
> > 'starfive,jh71x0-wdt.yaml' or 'starfive,jh-wdt.yaml'?
>=20
> Sure, starfive,jh71x0-wdt.yaml sounds good to me.

I feel like a common comment I see from the dt folks is to not put
wildcards in filenames & just pick the first compatible.
I could very well be wrong on that front though...

--UcWmcqa/y1djr3DO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/3coAAKCRB4tDGHoIJi
0mvBAP9uweiso5de1r1kZ9I8IGm1fB/JEam5Oz1DY1O5dqwAJwEAtMmWjEj8tDy+
yYIgRtECs4sOifuXiJ6LkiIXnV0JHQg=
=Issj
-----END PGP SIGNATURE-----

--UcWmcqa/y1djr3DO--


--===============7812319830381222620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7812319830381222620==--

