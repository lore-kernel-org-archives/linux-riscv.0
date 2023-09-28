Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C58CCE7B0E
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 09:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qUWh99D6SnfQyhribUkNFKsjwomqZ6pxyc2hUeGt4Nc=; b=EkJ/DOmeKstIeQvdTb1lSF7cnX
	JOUMQ7Pdns6C3UQJm1RPnvgJ06ic5w44Whjv7LuBej7uKUxHCh+WagZrFva2R/H6ESPz56eF6PLdo
	NFDK0FM5KnbK3fzMKxe7xh7Mx8O3WfvUP//nXYF3f09aHm88bavB9h72/MLpqrksYlcS0K09bPFqQ
	ONLEWXc/bibnR6fEM4hLGBptaSseMCN5zC9n+rcnMJMwTL4HV34UU6WubcLjg5/pEpMd5O6EKHy+2
	PDGpm2Zq3eDk6wFGnGuU2BfCp06CG+egJipY+KxCJFFCiukQKyAIORTCj5x+TJ0ggN9uNdZNz27l1
	Of9hI+ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlmwE-002h87-27;
	Thu, 28 Sep 2023 09:04:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlmw9-002h6B-1W
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 09:04:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695891837; x=1727427837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OBb0qKSmHLcYJsOeped2EGIbj9N76LFCrWGOCNJOufU=;
  b=yfyMF4xn+cQxCIUG9Ro8lSUOFj/t4ypgaCam7H5UY11xQXTgPY3qjR5l
   chrHhyR31q46GnoM/cnGrjUbOGS//7yRwNReWHKZoNUNstJQSQ6Y8DvF1
   o3XNdobMJRivgjEbYipt3d4XGq/cahHwY3oi6ONLmK2pQtDMBez+X+3Pf
   z4dlysPeeAhJkZYj6XvbWglPYwWrGgg6vVmFg6AF/io/8aCVbfMharwpD
   dR/XkYQ0hj9W+T5YEBjkqWFh7+GTN9EvO4AvkP7nKxSSLxEKp3gIcVe2a
   jBZcL+rHP017s1+ctWPKdCCI17y8/A7ikguKx9PvtEJNJskXGs+Mhsrnk
   Q==;
X-CSE-ConnectionGUID: G7oJAJERQB+qO+xfGDy6Ng==
X-CSE-MsgGUID: 2pAk1O+nRbeRA9AAhduaww==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="asc'?scan'208";a="174047323"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Sep 2023 02:03:51 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 28 Sep 2023 02:03:51 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 28 Sep 2023 02:03:48 -0700
Date: Thu, 28 Sep 2023 10:03:30 +0100
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
Message-ID: <20230928-winter-uranium-cc07496a49e3@wendy>
References: <20230928-bring-gnarly-05eeeb85f3c5@wendy>
 <IA1PR20MB49537BCE9EF342B55174B829BBC1A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB49537BCE9EF342B55174B829BBC1A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_020357_680939_E511B420 
X-CRM114-Status: GOOD (  26.11  )
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
Content-Type: multipart/mixed; boundary="===============2459699631248540768=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2459699631248540768==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b6mSgDjZ5Q8taV3j"
Content-Disposition: inline

--b6mSgDjZ5Q8taV3j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 04:24:54PM +0800, Inochi Amaoto wrote:
> >
> >On Thu, Sep 28, 2023 at 08:34:42AM +0800, Inochi Amaoto wrote:
> >
> >>>> +properties:
> >>>> +  compatible:
> >>>> +    oneOf:
> >>>> +      - items:
> >>>> +          - const: sophgo,sg2042-clint-mtimer
> >>>
> >>> There's only one of these, so you don't need the oneOf.
> >>
> >> Thanks
> >>
> >>> Also, is the clint here not a thead IP? In which case, you need to ad=
d a
> >>
> >> Yes, The clint is a thead IP, like that of th1520 and allwinner D1.
> >>
> >>> second compatible IMO. That second compatible then would be the one t=
hat
> >>> appears in opensbi etc.
> >>>
> >>
> >> As this is a thead IP, maybe use thead,c900-clint-mtimer is fine?
> >
> >I would suggest calling it -aclint-mtimer instead of clint-mtimer.
> >
>=20
> It is OK for me. As I describe below, now use sophgo as vendor is better.
> Anyway, I will add a new second one in the next patch.
>=20
> >> If so, whether we should replace the "thead,c900-clint" with these sep=
arate
> >> DT to describe the thead clint?
> >
> >No, since that's a different device, right?
> >
>=20
> Yes. It seems sophgo defined these by themselves, but the T-HEAD. Sorry
> for my mistake.

I'm sorry, I don't quite understand this. Do you mean that the IP is not
T-Head, but rather designed by Sophgo? If the IP is made by T-Head, then
I would expect to see something like

compatible =3D "sophgo,sg2042-aclint-mtimer", "thead,c900-aclint-mtimer";

in the dts.

>=20
> >> The DT binding said the thead clint is not
> >> compatible with the sifive clint, so maybe this is a chance to just mo=
ve
> >> them out.
> >
> >I don't think that it really makes sense to do that.

--b6mSgDjZ5Q8taV3j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRVBYgAKCRB4tDGHoIJi
0vLWAQCaVGggIAebDnmEiJzjw1X/RgLe0+aKKdWYxJ0fcufvIgD/QjEGmlfqom8m
pARBLjaCCUh5j/+WVtng9mGnCts03wA=
=pEic
-----END PGP SIGNATURE-----

--b6mSgDjZ5Q8taV3j--


--===============2459699631248540768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2459699631248540768==--

