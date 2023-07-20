Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBB7EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 12:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLK4jV0HWwVSYoZGWRB4sCVCjiEPzT6meOTg6SvdDF8=; b=mhTexycGrdk2YPUIlnqgfpG+pK
	GgFSq0i6cRkQkXqgwptXqm8TowF9RX6LbDXEgpEYyGcB3TLmORlH8otplpS0gTmJZYGx2Xm5+gPzm
	rc5UuhhlcUHT4XaWVBFjm7JMBrbDHlAVd2UrA46Gk6BHB5SdhrjnTG+lmaHcjztBm3fsrpfdt9KQa
	lRK63wWkJ8mHmIdoDspHsCC/E8M8AQmXCh5k34jWA53qtlj9e81obetvZgy08O+6Rwd9Z5ldDyzx7
	7BjPjwMZQ31jQQDAzL6pDO8EDfy/5D0mrRtvtNoph/MqIpwO98XG0m+94CeQFWMh7DrEhEmlMEx1S
	wVzQPEsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMSXP-00B6OS-2X;
	Thu, 20 Jul 2023 12:13:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMSXM-00B6NF-20
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 12:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689855221; x=1721391221;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qkDXQ93pEI6ao4XArtWOlAwCt1REKU2ZVqOJKv7aZYo=;
  b=nVsE4vlPQ5MKHSSt3yi2A3oLI0PwMnYYEDVTJaWKbbk6WR+x6sxXKNQJ
   K3yeK9RCcY9lZgAc+7OppYkQnup6RQwS38mp7TUtpniBK3EUXt5oCzYvX
   KO+i510tHi99vzsntj4MZC0iF6/wCHDYyHx973BkFHHxriwWJt4FLH0r5
   V51wxhOZTGbYpJScXfGq6XkbooqycgEmvAXlsT7/K/V5/4ZYHYGImJj6U
   yxghlYAfEdMzz1U+G4blFJNuwuDzVH+9jdNeykgSWUz+RwncggCRGLyGx
   keSrG8MILu0YEGe8K5IfcnDa0hXfCSXuGVXuDBsVcmUgTAzZS4NMXYJJ3
   w==;
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="asc'?scan'208";a="221309888"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jul 2023 05:13:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 20 Jul 2023 05:13:23 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 20 Jul 2023 05:13:19 -0700
Date: Thu, 20 Jul 2023 13:12:46 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Minda Chen <minda.chen@starfivetech.com>
CC: Bjorn Helgaas <helgaas@kernel.org>, Daire McNamara
	<daire.mcnamara@microchip.com>, Conor Dooley <conor@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-pci@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	"Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v1 0/9] Refactoring Microchip PolarFire PCIe driver
Message-ID: <20230720-unkempt-bath-9d320d55577c@wendy>
References: <20230719152626.GA502469@bhelgaas>
 <52ebc991-0e73-8df4-61b2-32989ab4e62c@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <52ebc991-0e73-8df4-61b2-32989ab4e62c@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_051340_719487_F555E8B7 
X-CRM114-Status: GOOD (  12.08  )
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
Content-Type: multipart/mixed; boundary="===============4568421215092211692=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4568421215092211692==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kw3EZ33X58KK0EKz"
Content-Disposition: inline

--kw3EZ33X58KK0EKz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2023 at 10:15:51AM +0800, Minda Chen wrote:
> On 2023/7/19 23:26, Bjorn Helgaas wrote:
> > On Wed, Jul 19, 2023 at 06:20:48PM +0800, Minda Chen wrote:

> >> This patchset is base on v6.5-rc1
> >=20
> > Doesn't quite apply cleanly for me:
> >=20
> I am sorry, The driver need stg clk and syscon driver, which are have't b=
e merge to main line.
> mainly dts is(patch9) rejected, Must apply this series patch first. (I fo=
rget add this link in cover letter)
> https://patchwork.kernel.org/project/linux-riscv/cover/20230712092007.310=
13-1-xingyu.wu@starfivetech.com/
> and this syscon patch=20
> https://patchwork.kernel.org/project/linux-riscv/patch/20230717023040.788=
60-7-xingyu.wu@starfivetech.com/

You could detach the dts patch from the series & send it independently once
everything it depends on is in place. I'm going to pick up both of the
patches you've linked for v6.6 in the next day or two.

--kw3EZ33X58KK0EKz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLkkvgAKCRB4tDGHoIJi
0tHHAQCC0e6XIbYkG6LkrgL69/4niNdKZfvj9lofo9snvGUNxAD+L93odnBwIMIi
9NNg/AiwINvTb2x+ys70gaGFwrSk5wM=
=x0aD
-----END PGP SIGNATURE-----

--kw3EZ33X58KK0EKz--


--===============4568421215092211692==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4568421215092211692==--

