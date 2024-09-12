Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB18EE6457
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 07:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dbYgW6axpXZ/JOXCF+HfpMY0KFOTr9jyacjTWwYeynk=; b=odf0b/p+6Yg3IluSwRz8p11qmD
	ytX4IJBC7J9fTYVIIgbxwEBObnrtZIklzkwvdIkp4quLozeVXn2TW4R8FkZ+hbtBLzMJSHLfJi78b
	Zil4VXWF5PwE0bt18jw3qjeoFW9SvWvxIYtPtRQBSryuI2Q1qmPa6x+YDvN9eQOUYdLqVac6NmG8Z
	JZ2s+FG6tJz84hneAIvS1Sd5WofvsxN9gkxEnocCj37cYEqWgu3+ucobdXuJRxf3GFkHcB/9Jrs7/
	16iqMfWJo5HWRL+IkV5Hx4WGfRV3/vaR1GsBpUgACDkeD0oql8fKAdvCY/DYG1nvvt8AOIKtYg6vp
	hrh7p6FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soeQw-0000000CCnO-1lRq;
	Thu, 12 Sep 2024 07:40:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soeK4-0000000CBI3-3alK
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 07:33:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726126380; x=1757662380;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A0OLi+CRloHyK/Ua4rHjaFAPFQYO8jOgh8kX9YifaN0=;
  b=CWEpvclX97d2Yrq9XxSVEETrq4ydiUk4STBJlqts65R3soA9H7FCMvxl
   v4OkInI78IHyNMjW66LuKKJREh7gVkaDTerHhwXhLMdXGJvStPPIKpou3
   6KloXlGhdDHAcMsgN0Ss/1S4/hSaKmO8QIW7sEai9XordKoPbU1C0jr7p
   CKkCWn3zAOB1YCiMV6G9be8iiDyWGnC9dtZZG8+PD2Rj5GY3WLSBxbQq8
   2jND3WG4xF3up5uhkBMiGiqdLO+kseaNSgieHHssu/f5zJNHZ1xGUFFwy
   Q9/Wjb+UN+yz5kaZNLqulIw5hYbDOrRFh8Rv/QN5rBIKfnPoS6kBgj2y6
   A==;
X-CSE-ConnectionGUID: LpRQBBlMQkGueR9dw36uBA==
X-CSE-MsgGUID: f7yaRPOpS069i9Newcnl4A==
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; 
   d="asc'?scan'208";a="31577165"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Sep 2024 00:32:58 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 12 Sep 2024 00:32:23 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 12 Sep 2024 00:32:20 -0700
Date: Thu, 12 Sep 2024 08:31:46 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: WangYuli <wangyuli@uniontech.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<stable@vger.kernel.org>, <gregkh@linuxfoundation.org>, <sashal@kernel.org>,
	<william.qiu@starfivetech.com>, <emil.renner.berthing@canonical.com>,
	<xingyu.wu@starfivetech.com>, <walker.chen@starfivetech.com>,
	<robh@kernel.org>, <hal.feng@starfivetech.com>, <kernel@esmil.dk>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<richardcochran@gmail.com>, <netdev@vger.kernel.org>
Subject: Re: [PATCH 6.6 1/4] riscv: dts: starfive: add assigned-clock* to
 limit frquency
Message-ID: <20240912-sketch-research-ad02c157cbf3@wendy>
References: <D200DC520B462771+20240909074645.1161554-1-wangyuli@uniontech.com>
 <20240909-fidgeting-baggage-e9ef9fab9ca4@wendy>
 <ac72665f-0138-4951-aa90-d1defebac9ca@linaro.org>
 <20240909-wrath-sway-0fe29ff06a22@wendy>
 <DBEFAD22C49AAFC6+58debc20-5281-4ae7-a418-a4b232be9458@uniontech.com>
MIME-Version: 1.0
In-Reply-To: <DBEFAD22C49AAFC6+58debc20-5281-4ae7-a418-a4b232be9458@uniontech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_003300_992338_183C1D4C 
X-CRM114-Status: GOOD (  25.65  )
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
Content-Type: multipart/mixed; boundary="===============5842094888769631763=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5842094888769631763==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dUrs2a+ddceNZFId"
Content-Disposition: inline

--dUrs2a+ddceNZFId
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 10:38:20AM +0800, WangYuli wrote:
>=20
> On 2024/9/9 19:17, Conor Dooley wrote:
> > [6.6] in the subject and Sasha/Greg/stable list on CC, so I figure it is
> > for stable, yeah. Only one of these patches is a "fix", and not really a
> > functional one, so I would like to know why this stuff is being
> > backported. I think under some definition of "new device IDs and quirks"
> > it could be suitable, but it'd be a looser definition than I personally
> > agree with!
> These submissions will help to ensure a more stable behavior for the RISC=
-V
> devices involved on the Linux-6.6.y kernel,

I'll accept that argument for the first patch, but the three that are
adding support for audio devices on the platform cannot really be
described as making behaviour more stable. I don't hugely object to
these being backported, but I would like a more accurate justification
for it being done - even if that is just that "we are using this board
with 6.6 and would like audio to work, which these 3 simple patches
allow it to do".

> and as far as I can tell,they
> won't introduce any new issues (please correct me if I'm wrong).

I don't know. Does this first patch require a driver change for the
mmc driver to work correctly?

> > Oh, and also, the 4 patches aren't threaded - you should fix that
>=20
> I apologize for my ignorance about the correct procedure...
>=20
> For instance,for these four commits,I first used 'git format-patch -4' to
> create four consecutive .patch files,and then used 'git send-email
> --annotate --cover-letter --thread ./*.patch' to send them,but the result
> wasn't as expected...
>=20
> I'm not sure where the problem lies...

I'm not sure, I don't send patches using that method. Usually I output
my patches to a directory and call git send-email using the path to that
directory.

Cheers,
Conor.

--dUrs2a+ddceNZFId
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuKY4gAKCRB4tDGHoIJi
0r2pAQDK9tw50M9/pd5jx1uyrtkDT/RUbd0s3qpnx1Z0YSYF9AEA+k8EKSF51lvO
hrrZQj9ToA2Lnoo4N8es473eQLiq+g8=
=6MvV
-----END PGP SIGNATURE-----

--dUrs2a+ddceNZFId--


--===============5842094888769631763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5842094888769631763==--

