Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE19C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 12:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8Ho0UCV+M8ItBIZq9WBLps4u7MbPuZkOl3nBAjrZ+g=; b=JvBp7ziLd5JyFJv0bGDjYTTZ2A
	3EG6XyrffeVLUQH+bG57UNs8sSRPeEvv/NcuGr1GvWIo8F+o2btiFUwubJphhBqyQYaZWapjepTDI
	wurmwgERgw9zd+aZHMejMPBDUNGM/GAT3AYd6Y+4n1YYd0dwyjJujYsgrtF4mZUsHNd6TihQwJ7WJ
	t+mVLIhTPlj+CbgYJb8iwNzCm3Z26nfM5HgbfCxrYs9Wx5ZgZuLZSsESgUyQcTk7+92wKx7ghRUjc
	0d60d1MqnlwFXo0f8KnQLEfYAB5Ktom8JQJ4nX5dfpICtvqSlUw3ZoZQGEZw06Xp9/8YKdgriYDcq
	esPi2APw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s52hA-00000001Okq-402W;
	Thu, 09 May 2024 12:16:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s52h7-00000001Ok3-1Oc2
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 12:16:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1715256978; x=1746792978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xv+8EY80PprWDIrphFPGiwYWzI8mMjfVvHBAlRZAjVQ=;
  b=L22XHm/UTiYeMzpr5fGS67UFFUufpTNHSwA+NSAuSdcWSq+Ok6alMxXk
   A132r1eueZJK0lkem2phlizdsJUM5HbGqu6VaoNvCUArPPya/ygJH3ziX
   5S79ucx5laRlk59f91z+ssQYo+C5DdW+gYCUhF5aLQmgUJI5aqE11zSTo
   vrn2cmaeBRPBqnCieih0T7T77y7luxGVW7wwS0/h3GERpIq4IrWmUS86+
   WZgWbgLTPWVr7Q1vojHakze+efj4M8dd0lDwJohdt36E2lq8CmYkqOVhM
   nkY4dpqFedFY7vgiPT7f9Yk8BActrOoNwCqF/30zaJSAUeZyngVaWW7jT
   Q==;
X-CSE-ConnectionGUID: vyZ8CGhFQVqGx8FDY47/hA==
X-CSE-MsgGUID: CXov5e8bRyuYi+nK6g4mHg==
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="asc'?scan'208";a="24313807"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 May 2024 05:16:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 05:15:41 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 9 May 2024 05:15:40 -0700
Date: Thu, 9 May 2024 13:15:30 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Yangyu Chen <cyy@cyyself.name>
CC: <linux-riscv@lists.infradead.org>, Conor Dooley <conor@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: dts: fix isa string for Canaan Kendryte K230
Message-ID: <20240509-humility-sliceable-fc22f8d64d90@wendy>
References: <tencent_B61C1370E7632842D61BB7F9FA0515B44D09@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_B61C1370E7632842D61BB7F9FA0515B44D09@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_051617_448181_3CD2CC01 
X-CRM114-Status: GOOD (  13.06  )
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
Content-Type: multipart/mixed; boundary="===============7519525462893302644=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7519525462893302644==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yzTCDg/qHC1C/s+B"
Content-Disposition: inline

--yzTCDg/qHC1C/s+B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2024 at 05:33:11PM +0800, Yangyu Chen wrote:
> The original is a string in dts that has no "zfh" or "zvfh" extension,
> but the K230 chip has them, so I am adding them to the dts. This
> patch also reordered the Z* extension in the isa string and used
> canonical order for the category as the first key and then alphabet
> order as the second key to meet RISC-V ISA Extension Naming
> Conventions.
>=20
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>

I'm just gonna squash this one into the original patch, since I had to
drop it from v6.10 material.

Cheers,
Conor.

--yzTCDg/qHC1C/s+B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjy+YgAKCRB4tDGHoIJi
0jGiAQD7pc1KyZymIGJlsegKO1WYvefd963SGPkomtSKGL1bfwD/Xnsyh56Pzfcd
OXdMDHsYbfBT7F78lGFCKrwFVRE03AQ=
=XNdt
-----END PGP SIGNATURE-----

--yzTCDg/qHC1C/s+B--


--===============7519525462893302644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7519525462893302644==--

