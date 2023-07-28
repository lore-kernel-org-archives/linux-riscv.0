Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3334C0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 08:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1FoIKXJdbeUibOg/dIvVWFOUJzadfGebVTRjkS8MrPE=; b=x251By8k20rz7MH3Gz/YmJeVOS
	D+kcw3O15WalM9AaSaK12r0t30QXG1NU0j5Y+NAACZOYq+lBGqsnRxvQA34U7Q4qFKpfOhxq6EFK6
	P1ZjJEH0BG8blBjNnVR04KnzURcjL9l1TmeRifSuVjhgHQ1mAVL5gP+CxTCCS/i6qliMhjLvGI16f
	IVV9mdy6DkTd1jtik32vv3PpcFSlRHIjOTDfebZjFMDvv1dYCXT/NHOUjimh93VbCAMTfGL0pFgNQ
	LJLE6SPiDra6MINbwU/48NRMZ3vpNIKgYYACut3vi3n84GZHlEqvXzY5zxpwwj/4Ip/M6HLfjzKM6
	LnRz6I4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJJj-002W5h-2c;
	Fri, 28 Jul 2023 08:59:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJJg-002Voj-2T
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 08:59:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690534760; x=1722070760;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MiL4JcDaa63IArou+91r6pY5u0LcbVgPl5qQ2hlkSVE=;
  b=Ltm2nUzsYs0YnTJ1JeKjJkE4Qan6nAmgJZ5USxwGfoION2Q5rh7cntM6
   b1rmv697C+zSWoo9yFfvzUf/OYx1DrCOm5/UlK1pqHXk6OpIE6yW6g7To
   K5d2XDMwVWIJLWWOpNJxR5C6xmq8eBfaIt2TjRbBUeHK6uZOEYOB6jacX
   /NAm2QCkPV6p+qQ3a3YKu4Ie3KvMC5BjLynCDy3k31fTA4Kj1aGI4xK4k
   AukGA87+XFRoUpLxKfdc50x32szQs/xQkLtE6oRZa49RXl6HW8Y/eTYW+
   3n3/rr80jYPPeIjSCXCX1o72Ay29EJBwvPW4L+BrFXVm3ywCtcv9kYyRq
   A==;
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="asc'?scan'208";a="227039084"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jul 2023 01:59:12 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 28 Jul 2023 01:59:06 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 28 Jul 2023 01:59:04 -0700
Date: Fri, 28 Jul 2023 09:58:29 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: William Qiu <william.qiu@starfivetech.com>
CC: <devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Mark Brown
	<broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Emil
 Renner Berthing <kernel@esmil.dk>, Ziv Xu <ziv.xu@starfivetech.com>
Subject: Re: [PATCH v5 2/3] spi: cadence-quadspi: Add clock configuration for
 StarFive JH7110 QSPI
Message-ID: <20230728-retread-starch-3399b921718a@wendy>
References: <20230719092545.1961401-1-william.qiu@starfivetech.com>
 <20230719092545.1961401-3-william.qiu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230719092545.1961401-3-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_015920_872385_C0BAB6B7 
X-CRM114-Status: GOOD (  11.70  )
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
Content-Type: multipart/mixed; boundary="===============6338618673265416282=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6338618673265416282==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xNYFoGrA1aUBT3jU"
Content-Disposition: inline

--xNYFoGrA1aUBT3jU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey William,

Since you pinged things, I had a quick look.

On Wed, Jul 19, 2023 at 05:25:44PM +0800, William Qiu wrote:
> Add JH7110's clock initialization code to the driver.
>=20
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>

> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202306022017.UbwjjWRN-lkp@i=
ntel.com/
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Closes: https://lore.kernel.org/r/202306040644.6ZHs55x4-lkp@intel.com/

These, as pointed out on the last version, should not be here.
kernel test robot complaints about un-applied patches do not get a
reported-by etc in subsequent versions of the same patchset, just as
comments from human reviewers do not require reported-by tags.

These tags should only be used when the code has been merged & you need
to create a new patch to fix the issue.

Hopefully, if the code is otherwise fine, Mark can fix this when he
applies the patches.

Thanks,
Conor.

--xNYFoGrA1aUBT3jU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMODNQAKCRB4tDGHoIJi
0mzeAQCBPYWIWHeooX+CXBqGc/l9282J1oE6BHOrLzocw8kPYgD/W6c8DOiiyTgN
vgn7W2EhtJn/VjCn1htwnUyT49JAdw8=
=BRBz
-----END PGP SIGNATURE-----

--xNYFoGrA1aUBT3jU--


--===============6338618673265416282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6338618673265416282==--

