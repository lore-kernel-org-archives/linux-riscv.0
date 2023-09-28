Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE362CE7B17
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 09:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOoOmHXZAK3kEel6V3G+3u3clWlKWnIpiu1HUBiv4tA=; b=BhS8l9Sb5ihESn5zDDOVvb81Yu
	bVpTlZD16kKmOMyF/AwfhsalMkzk/zyqgS64HVzKkwC+NF2pLfOVbqNX45tcY7WRH+ocNSP4z6gsH
	4fPf124U5JPJBdlArnkG09Ixnc/MhVQVgNGTDG+uIP51euRnHT13jFzihN8yIYHBmUsbDKq1yZImK
	Bw2w1Z6Q2VGfNxHbEQtPoJMgdUR5ZJFRpCsAyU4gz7WNiIkN3D1qOOa60DOc3NVqLYs6PyQ0NPXRw
	qNmiZ+Nq3n8RVfUH434hvtaAWkf03FS8SBR/qs3Ju4066XjG/5AXgbBduPSj7qiHzRU2Xv1tbcw/5
	qVovUrhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlnkz-002mfY-2q;
	Thu, 28 Sep 2023 09:56:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlnkw-002meh-2J
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 09:56:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695894986; x=1727430986;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gu41GdqWZpyGZbFQhinh3hZ49LqQBY/54l12OPAul68=;
  b=HWew2e7prNQoH5YkU8Jdg4u+ixMy/TNLsRhmbYGVneQ9mG/hKGKrekRV
   6Q/MP/SHbrzZ7YqCHUM1aoyc2eKpVaLPA9bzCI39XSpmtWoounN+i660H
   x8mgRE5igixHKaYf3Eh+PCpNBXGMnVNEH0+W+ZY2owjBWV8YqiBVcKIct
   mYyOdHqC6LrXzWsrDEkpgDe6QT52Kf8ov9tX+E2ljPUoIqCV5uUdQxqLK
   d27bzquloQz5chZ1dT8YFquAOmdFdDyRWlIV9ElyyXJbabPyyo0c0eING
   mWbZ/qyqGjormaUwiMmI3vRwuTcMp5/qYZZVly8wtmYrZ5fPp28Ev8acg
   Q==;
X-CSE-ConnectionGUID: e6oGy2ElS9ywph8O/5SXfg==
X-CSE-MsgGUID: Kkjy0IllSBuMt+urRxxNyQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="asc'?scan'208";a="6909572"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Sep 2023 02:56:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 28 Sep 2023 02:56:21 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 28 Sep 2023 02:56:18 -0700
Date: Thu, 28 Sep 2023 10:55:59 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Inochi Amaoto <inochiama@outlook.com>
CC: Conor Dooley <conor@kernel.org>, <aou@eecs.berkeley.edu>,
	<chao.wei@sophgo.com>, <devicetree@vger.kernel.org>,
	<emil.renner.berthing@canonical.com>, <guoren@kernel.org>,
	<jszhang@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <robh+dt@kernel.org>,
	<xiaoguang.xing@sophgo.com>, Anup Patel <apatel@ventanamicro.com>, Chen Wang
	<wangchen20@iscas.ac.cn>
Subject: Re: [PATCH v3 06/11] dt-bindings: timer: Add Sophgo sg2042 CLINT
 timer
Message-ID: <20230928-scorer-study-0de8672fca01@wendy>
References: <20230928-winter-uranium-cc07496a49e3@wendy>
 <IA1PR20MB495373BAA77A74C5EEB7BE49BBC1A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB495373BAA77A74C5EEB7BE49BBC1A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_025626_914425_F178C28B 
X-CRM114-Status: GOOD (  15.77  )
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
Content-Type: multipart/mixed; boundary="===============6595809620318988334=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6595809620318988334==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SpJlgRxPBtmlA4kN"
Content-Disposition: inline

--SpJlgRxPBtmlA4kN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 05:39:17PM +0800, Inochi Amaoto wrote:
> >>>> If so, whether we should replace the "thead,c900-clint" with these s=
eparate
> >>>> DT to describe the thead clint?
> >>>
> >>> No, since that's a different device, right?
> >>>
> >>
> >> Yes. It seems sophgo defined these by themselves, but the T-HEAD. Sorry
> >> for my mistake.
> >
> >I'm sorry, I don't quite understand this. Do you mean that the IP is not
> >T-Head, but rather designed by Sophgo? If the IP is made by T-Head, then
> >I would expect to see something like
> >
> >compatible =3D "sophgo,sg2042-aclint-mtimer", "thead,c900-aclint-mtimer";
> >
> >in the dts.
> >
>=20
> AFAIK, the clint IP is designed by T-HEAD, not Sophgo. Sophgo change this
> IP layout to fit its weird cpu design. But in my test, the timer and mswi
> of clint is compatible with the T-HEAD one.

> So we should treat this as T-HEAD IP, not Sophgo?

Yes, in the way I demonstrated above probably.

--SpJlgRxPBtmlA4kN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRVNrwAKCRB4tDGHoIJi
0iMwAQC+tShSe2jUxLEY0+NJy2ORpiI7U6yahbJtQgYC6InsgAEAwWsdMan7OX7r
7Cm33/K20+L8n6UV2uJ9Qgolx3/peA4=
=CNXQ
-----END PGP SIGNATURE-----

--SpJlgRxPBtmlA4kN--


--===============6595809620318988334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6595809620318988334==--

