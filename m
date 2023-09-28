Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97123CE7AFD
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 06:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZF9+fV62hI/1b3a/PCllRY6+jFPBW6AofXpiOfG9MPc=; b=vWh9/tPBKnYt4dJ7FKxeBlcY8r
	z/VhnZwAZF/zt6SjrzXdKZZ9DQZkQAfjOZpASyvrUu7DKs6JZ4G9KdfuMxR8F1354NGGFUkKw4ucC
	Cmo54QzdndjYV2me+EtzG9vHUBAlxYyRnhwIWgEJTvTWE8mL8o3aEOlpnfrr4yQdsxP4GsR5IHtZR
	ivYY1f34KmXKjYvJb7UP40l8UgmgmrOUIYQloAK2FK7c6FzPxvnYW4xQdlODFC07LhQ1eFbcP6BWK
	Dy0EJe27cpq4E+vR6EwouhXN94vyUjQXih35PvJCR4Cp0xrmm+9LS8nbJa1dlzXeYBo67DZyp60lU
	tfjpMmIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlkVB-002Nxp-14;
	Thu, 28 Sep 2023 06:27:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlkV8-002Nx0-11
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 06:27:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695882474; x=1727418474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mBkNygKzMaSU02DnlJ0mWUgp02ttdarWgUm5ztFYDpE=;
  b=P3TR/SidbcPkpa1iNdzf++Fr9HhA3q0oeY4e7yd5aNYa+icMKByNBgfZ
   qSVz53A5SXnhknW26NWp8rATUtfle0W+M9kctF3sToNGKJUVf50/nW61u
   l+KFbnFMLgO1isl41Xa1SnsVBrmSHrEp0x3l5JZdRSYnvDM9PHlpb1xLI
   oALqSROc7617x5TmJFttroN5Jvvr2n44dzOEjbrWYO8JwNthHPBWXlxaz
   X9zdsZUgu0G65v8nOL04CwVJ/cAO7rSvLKTPLg8u0kxulNf4EhyLVu34V
   fWpi52ATPS5unML4pOyW8C9T3dugCAsu7Chmx/w9X7K4plt0NlD2f/Jup
   w==;
X-CSE-ConnectionGUID: ESpAaoDnSL2M9L5hctp+oQ==
X-CSE-MsgGUID: SxFkAdzQTq2FWm/6/W8BNg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="asc'?scan'208";a="7286625"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Sep 2023 23:27:50 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 27 Sep 2023 23:27:30 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 27 Sep 2023 23:27:27 -0700
Date: Thu, 28 Sep 2023 07:27:09 +0100
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
Message-ID: <20230928-bring-gnarly-05eeeb85f3c5@wendy>
References: <20230927-uncorrupt-bronco-72e35232b1cc@spud>
 <IA1PR20MB49534EDF586FCC784C81C5ABBBC1A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB49534EDF586FCC784C81C5ABBBC1A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_232754_540762_7B0A7D3C 
X-CRM114-Status: GOOD (  19.68  )
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
Content-Type: multipart/mixed; boundary="===============2349487313938002982=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2349487313938002982==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UHaWB33MwrDFW0WP"
Content-Disposition: inline

--UHaWB33MwrDFW0WP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 08:34:42AM +0800, Inochi Amaoto wrote:

> >> +properties:
> >> +  compatible:
> >> +    oneOf:
> >> +      - items:
> >> +          - const: sophgo,sg2042-clint-mtimer
> >
> >There's only one of these, so you don't need the oneOf.
>=20
> Thanks
>=20
> >Also, is the clint here not a thead IP? In which case, you need to add a
>=20
> Yes, The clint is a thead IP, like that of th1520 and allwinner D1.
>=20
> >second compatible IMO. That second compatible then would be the one that
> >appears in opensbi etc.
> >
>=20
> As this is a thead IP, maybe use thead,c900-clint-mtimer is fine?

I would suggest calling it -aclint-mtimer instead of clint-mtimer.

> If so, whether we should replace the "thead,c900-clint" with these separa=
te
> DT to describe the thead clint?

No, since that's a different device, right?

> The DT binding said the thead clint is not
> compatible with the sifive clint, so maybe this is a chance to just move
> them out.

I don't think that it really makes sense to do that.

Thanks,
Conor.


--UHaWB33MwrDFW0WP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRUcuQAKCRB4tDGHoIJi
0vArAP9fAULrrTApZmFmDl2++GE7+UOVwdl43Vjc4kOusjA+0AEA5UD0/+yLvol9
iUxnGTrAiIOBHo3ManpsssXg5sNniQ0=
=VnCU
-----END PGP SIGNATURE-----

--UHaWB33MwrDFW0WP--


--===============2349487313938002982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2349487313938002982==--

