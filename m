Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C06EC27C79
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 13:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mTff0O8IHT7Q+1m7GE2fYkWzKn0Jywc44auBo7OSwko=; b=qXdK1+Wo/kLr3NCLzA9bIkjHIn
	7Y6JrObHfLTAslBI8N5Vu32RyB+gsAFEXAg6/QyQL3F8dCfWmsSiAlanGy4cAneg/AsPXHDHeX6/+
	H2YqgSNSxSUKgWQU+SxiWjnyU3kEY5pb39hb0NQTaJLppUwSKnGIR/gxFuYEviPy2qPyavZP6Dxkx
	gA3Xg4yCcwX9Oynz9dWWQEDJGW2rLYzOWhHS2VM/PnfDP4L5sL23mCz5uvum2ncceRc74sv+a7J3g
	GOqQ7dKB9fkH9v6QrqZQ9a468imTlZD1ucM0gkL0aiPszX9VGbKRJG6hyz/tM95jcB5h8s6ceyHWT
	mt2FDoXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCR8-0000000ArLL-2IZS;
	Mon, 17 Jun 2024 13:30:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCR5-0000000ArKO-0nAV
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 13:30:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718631015; x=1750167015;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KSb3mRso17rcUhqb1Oro4xaRLDBSd9Y8je7X+EGQxKI=;
  b=t23Aw6uoYYTtuCZ79T7xKJN8iX+j8wZbmR/UwxJjqXI0J+/P08pKzgAo
   XNyC7mAveW8wemlXWB34HwZ+kTp/ZvGmPAlhkg1Sr1pImVjhgrL7WIyea
   M4nsGPAKRfweEdYtyl20LWqYyI+mr/KHoE9Ca5NoZfFXQ946UrVM05RiR
   o9XMWq6aCoZK8ots0UIwP/qu9awjTcmdeAB6AaJkiVG5cSgRnkAn61ohA
   wLO5Xr9O+/Tc/AFIyslZDa5WzplhTHPudbJGsxAwvR6EyhO0G6mwLK3nH
   w5qMbO7EcFUJDpSaAsP45dL/rbrLNiY6hhcGK6cuUnIyKbYVbQ8/0kfX+
   g==;
X-CSE-ConnectionGUID: vs/KqhXwTIKMnwb8mVJ4mg==
X-CSE-MsgGUID: jnR8qmdfSTeSCRZB+zW6Sg==
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="asc'?scan'208";a="28519325"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Jun 2024 06:30:13 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 17 Jun 2024 06:30:06 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 17 Jun 2024 06:30:04 -0700
Date: Mon, 17 Jun 2024 14:29:46 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jisheng Zhang <jszhang@kernel.org>
CC: Yangyu Chen <cyy@cyyself.name>, <linux-riscv@lists.infradead.org>, Conor
 Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Samuel Holland
	<samuel.holland@sifive.com>, Anup Patel <anup.patel@wdc.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 7/9] riscv: dts: add initial SpacemiT K1 SoC device
 tree
Message-ID: <20240617-carat-poise-ee63ed6a224e@wendy>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <tencent_701082E2DAE48E2FB857316321778D737C08@qq.com>
 <ZnAw9QrSD-svYqQ5@xhacker>
MIME-Version: 1.0
In-Reply-To: <ZnAw9QrSD-svYqQ5@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_063015_447773_602DADAB 
X-CRM114-Status: GOOD (  19.65  )
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
Content-Type: multipart/mixed; boundary="===============4609703327041219278=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4609703327041219278==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oT9/HnCyP3m+8Cht"
Content-Disposition: inline

--oT9/HnCyP3m+8Cht
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 08:49:57PM +0800, Jisheng Zhang wrote:
> On Mon, Jun 17, 2024 at 01:20:52AM +0800, Yangyu Chen wrote:
> > Banana Pi BPI-F3 motherboard is powered by SpacemiT K1[1].
> >=20
> > Key features:
> > - 4 cores per cluster, 2 clusters on chip
> > - UART IP is Intel XScale UART
> >=20
> > Some key considerations:
> > - ISA string is inferred from vendor documentation[2]
> > - Cluster topology is inferred from datasheet[1] and L2 in vendor dts[3]
> > - No coherent DMA on this board
> >     Inferred by taking vendor ethernet and MMC drivers to the mainline
> >     kernel. Without dma-noncoherent in soc node, the driver fails.
> > - No cache nodes now
> >     The parameters from vendor dts are likely to be wrong. It has 512
> >     sets for a 32KiB L1 Cache. In this case, each set is 64B in size.
> >     When the size of the cache line is 64B, it is a directly mapped
> >     cache rather than a set-associative cache, the latter is commonly
> >     used. Thus, I didn't use the parameters from vendor dts.
> >=20
> > Currently only support booting into console with only uart, other
> > features will be added soon later.
>=20
> Hi Yangyu,
>=20
> Per recent practice of cv1800b and th1520 upstream, I think a complete
> initial support would include pinctrl, clk and reset, I have received
> the complains from the community. So can you please bring the pinctrl
> clk  and reset at the same time?

What sort of complaints have you got? That the support is too minimal to
be useful?

--oT9/HnCyP3m+8Cht
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnA6SgAKCRB4tDGHoIJi
0na7AP9um0KeWsttwnNSGE2JtwpFCri+BagSptLaplA4idDWBgD/a2Bs8pedwuex
lnoPGQJ1Ty98RoIrkROV8cur2alHbQU=
=LKni
-----END PGP SIGNATURE-----

--oT9/HnCyP3m+8Cht--


--===============4609703327041219278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4609703327041219278==--

