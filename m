Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6B4CE79AD
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 10:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UjD63OzG3eKrYFSCggxpQctc9MCW4EA4CRwi7xS0SbQ=; b=w+hLJbhnSxnf0aylMgXceGfaDy
	ZDI2Q9awi2lUX065UwRxL7vb9s69j6weA9xk8u/i3ioqhAVDsVOpDMgqZKzaykXiDRqGbkI6z/FF7
	FG0M29jWMHlnSOBk96DrvOJ0GPGkt1l7mj+GSAK6ZCSeelZ1P1vDhGSuTCQ2yzBsImJBhEZZuZrwf
	9qOBKeTmtEqPACe9l2moTOB7B3B4k3wHTW/mgumYYLajOJnB0I7yDt9kZTipNsVb/nDdEq3sjKGBk
	ECUZB9WUT9UXq098SJb0sxkQyZUzIXLY5porHl2x3glLryWmaK6mPrOV/nBl3dMF1AlmujSByQDix
	+VMUIB3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiu0S-002XEI-2c;
	Wed, 20 Sep 2023 10:00:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qit35-002NA5-1l
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 08:59:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695200348; x=1726736348;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=twi5zzTRqTKRTREdHFD+3H5EbT4iC9Y0KWjXkGJdNK0=;
  b=zJM8A0Vp/OxzauMuww7YP9l0t8/gLIdYniOKn2un5B5akARF+Tts1w8E
   VMpTMep08zSS8FbYgaFc5K+c5PpAvdpSxSGuj0zXfARtdA1bRlicd9CBK
   ld9p9uH3fAlaokFTFQ5d82IYV+0qwpAxG0ZuXm2NGQbcKcK65w8Vgd/oc
   7buSO5pizGIW3BkF2H3Q1SiDMmyguGOamHO1KkkOvE05ny+C98tHdw/7q
   QRrO8KgFgJ8MEmX/RCj8G1fVMT73bUKZDoGAkE0PyFl1tgu+vubbfFtEs
   IFBSUkEjtlKrxYUJCI+OXVtxM7avzFl/pD7gpUrg4dOmPUX4zlQNe8sbH
   g==;
X-CSE-ConnectionGUID: fFUBSqm4QZClaOyC4aCkiQ==
X-CSE-MsgGUID: e4NomMjsTjGUqQ7luszpIQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="asc'?scan'208";a="236155192"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Sep 2023 01:59:07 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 20 Sep 2023 01:58:12 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 20 Sep 2023 01:58:09 -0700
Date: Wed, 20 Sep 2023 09:57:52 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Chen Wang <unicornxw@gmail.com>
CC: <aou@eecs.berkeley.edu>, <chao.wei@sophgo.com>, <conor@kernel.org>,
	<devicetree@vger.kernel.org>, <emil.renner.berthing@canonical.com>,
	<guoren@kernel.org>, <jszhang@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <robh+dt@kernel.org>,
	<xiaoguang.xing@sophgo.com>, Chen Wang <wangchen20@iscas.ac.cn>
Subject: Re: [PATCH v2 05/11] dt-bindings: interrupt-controller: Add SOPHGO's
 SG2042 PLIC
Message-ID: <20230920-crisped-gumball-eddd475e8345@wendy>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
 <11eca9395bf730f41f142be2f8d26f527e36517b.1695189879.git.wangchen20@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <11eca9395bf730f41f142be2f8d26f527e36517b.1695189879.git.wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_015907_631678_DB786F7D 
X-CRM114-Status: GOOD (  12.04  )
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
Content-Type: multipart/mixed; boundary="===============1719803613941247444=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1719803613941247444==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qqReSDsxlih5FLto"
Content-Disposition: inline

--qqReSDsxlih5FLto
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2023 at 02:39:03PM +0800, Chen Wang wrote:
> Add compatible string for SOPHGO SG2042 plic.
>=20
> Acked-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifiv=
e,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/=
sifive,plic-1.0.0.yaml
> index dc1f28e55266..16f9c4760c0f 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> @@ -65,6 +65,7 @@ properties:
>        - items:
>            - enum:
>                - allwinner,sun20i-d1-plic
> +              - sophgo,sg2042-plic
>                - thead,th1520-plic
>            - const: thead,c900-plic
>        - items:
> --=20
> 2.25.1
>=20

--qqReSDsxlih5FLto
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQq0EAAKCRB4tDGHoIJi
0gUKAQDTMfZH/bBKr8ry7SDqs/ZWnIK4aoO3JGYe2TJppMC6xAEAp1tCQRon5/sM
fITPQIYNo2LcI73JJchrSPGWIywK2gw=
=ZZ8D
-----END PGP SIGNATURE-----

--qqReSDsxlih5FLto--


--===============1719803613941247444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1719803613941247444==--

