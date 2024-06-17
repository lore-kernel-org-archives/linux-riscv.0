Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08DFC27C6E
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 07:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qk5tr9yn0X266gCXnflhW2Mhu1zGI7eVmOzYzhgbKw=; b=mUXArGTHFz4Wu673GoE6rnZuuj
	PTJxu/G7sCC5Mic05RzAlqpbeXPvQlpvO8tostjwySD5lWwV+8CeZfITiLP9WCoZEBQ6ZzKUYHbL6
	aU3BXWfqOdYRX74NeEfcPHJSjPlIETfI1HMHGiECOybcsRfzyinECU8YXADoqETlyy2l7v6z9O2UT
	ekaAy1cOwC0OjGla9CegiFExMr5L9jWjURIJK58eHPGMvB4BtEygYwz1kPpAWwuxpYpIUC8fbRld4
	Kz05b3Xs73BN5kjcnxZp+KwXmnYN3qmK7rqFK5WALMvmWVkTmerltCIuGzX0KRHeF01zMd4epIYuN
	5PEAortA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ6qM-00000009fMy-3Mga;
	Mon, 17 Jun 2024 07:31:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ6qJ-00000009fMG-1C0V
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 07:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718609515; x=1750145515;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/SFuD9InR9+QblOhm36ftW37ZdNDPCvj1CPIDtGPO3o=;
  b=IR1ru7+i51gz1PFbTQexoc0O0ZQOi5EzShFaP0rOk/ByO3tslW1TYVFE
   UX5GGCZhytqdmrSoF8DlXeLZ24f1oTz2M9H4kXqeYiT7VAjFuxyXgG1Cz
   mg0DvFr/PQwaUovMIIY5HGQ67XI7O5AfOr+gFkigZ/u4RR6QNuU/4KTPk
   M4GUanKeoYXkz4bi9r4Jja0VOkJONtKizp225xZAMSZckMNWjKl6UKJOd
   pNolRUTLDGF+Qd3Q1sJlMt2MbXy8VuczsShxTFZ7Cfdam5NtIOgpLyAHj
   T7MGCmrnCw7OeiBNm3HexXLLIug7GR2Ux/UMCM0kl1OtNAwtdUpFPCI5v
   A==;
X-CSE-ConnectionGUID: 0jzbtD/eTbm4vVE2ltasdQ==
X-CSE-MsgGUID: wp8sBtHDRnWLcnDDAGF3Kw==
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="asc'?scan'208";a="28483881"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Jun 2024 00:31:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 17 Jun 2024 00:31:23 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 17 Jun 2024 00:31:21 -0700
Date: Mon, 17 Jun 2024 08:31:03 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Yixun Lan <dlan@gentoo.org>
CC: Yangyu Chen <cyy@cyyself.name>, <linux-riscv@lists.infradead.org>, Conor
 Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Samuel Holland
	<samuel.holland@sifive.com>, Anup Patel <anup.patel@wdc.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 7/9] riscv: dts: add initial SpacemiT K1 SoC device
 tree
Message-ID: <20240617-haiku-coasting-2f1cdca0ed30@wendy>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <tencent_701082E2DAE48E2FB857316321778D737C08@qq.com>
 <20240616225314.GA3988639@ofsar>
MIME-Version: 1.0
In-Reply-To: <20240616225314.GA3988639@ofsar>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_003155_433112_EBB974DA 
X-CRM114-Status: GOOD (  10.07  )
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
Content-Type: multipart/mixed; boundary="===============1536661847860023417=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1536661847860023417==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Z64oah3OWAsjo2wQ"
Content-Disposition: inline

--Z64oah3OWAsjo2wQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 16, 2024 at 10:53:14PM +0000, Yixun Lan wrote:
> On 01:20 Mon 17 Jun     , Yangyu Chen wrote:
> > Banana Pi BPI-F3 motherboard is powered by SpacemiT K1[1].
> >=20
> .. snip
> > +		uart0: serial@d4017000 {
> > +			compatible =3D "intel,xscale-uart";
> are you sure the uart IP is fully compatible with xscale?
> otherwise I'd suggest to introduce a vendor specific one..

Definitely add a soc-specific compatible here, even if fully compatible
with the xscale uart. There's a marvell device doing this already.

--Z64oah3OWAsjo2wQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZm/mNwAKCRB4tDGHoIJi
0uqJAQDNF2/7eSUIK6hC7bqxfYOJcPlPqFDqUHQacO8mrupUjgD/bJ+wVPc5a+L+
nLQwbj4t1epe50jzdz9Zbciau9Dmfgs=
=gR1T
-----END PGP SIGNATURE-----

--Z64oah3OWAsjo2wQ--


--===============1536661847860023417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1536661847860023417==--

