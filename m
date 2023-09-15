Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F23EE6427
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 07:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fz6Ko2+trykARY4hJ+CUE+isuvOGGwxamrQRfruGt88=; b=iI4acYAasGiVKMvhrSoCC/V8b7
	56x8iXEGJUpANsUldb7Nr3LWCgEPJJ9ycKGivBM4CH6abiDc04X5zF2NLCkAzbX529Mzm1MZZcTZF
	F1sUij6cImvelXwSMeBtmanLzcB1VP2VmEnejAkhGE3ywz3USWtrAdMNT5bZsZTdkDLjHC4IXDbU2
	blcpJuoTbbbJtvZGK+MNNMSTN2g16yo3e5qC3WkwhQ0pmiJ65rqJI1dQDwPICGqaa8A0PPgVMdrFr
	Lx8fYsfEaY9wglBi/IEE41uFqQUpSYKJZEOja/M8YswHcsK1dlfcSluA/bZYMwIuc8u3mr/dXTaw3
	T4J31c1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh39L-00A0sn-20;
	Fri, 15 Sep 2023 07:21:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh39J-00A0rc-1A
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 07:21:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1694762517; x=1726298517;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M4MdyYvS188dmohfyr3Ng6SXGiimV/7aAt2AMiSOjC0=;
  b=Xbe5mJ1wp3yNjUZrGZ2lhwObW1K8dm5nOcuhBiI7kTQxrAw1v3+VimXf
   wv6uQzccBhr0SaJVbY6IRc1dPbvRFFdly3Dgcc4jz6E/DQLJtLj+LRtOY
   SRXfVooRZ4Jjrm+gUUMLRKhGHWIUqdRBYpntyrEICTPqg9PAQbmWqdDes
   onoM90roNaqyF5G4riJtoyoBwungY9iP+TTUF1sBpXuuveigEDJkZhs1f
   c+EqIpVyisS2xbzID0Jr7a3UuYkwO6/nmYu12QfhMkNdSFkAjxSI/06H7
   AruRT7mlxyD5M2rJeL0ReyYw+02oebvn9yugX4dW7GvV9pmA+lv/cCcvP
   Q==;
X-CSE-ConnectionGUID: qjf/CPgLSIiOkW0KeB76sA==
X-CSE-MsgGUID: vmFXfJT0Q7+3bnF21wV70g==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="asc'?scan'208";a="4992792"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Sep 2023 00:21:51 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 15 Sep 2023 00:21:38 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 15 Sep 2023 00:21:35 -0700
Date: Fri, 15 Sep 2023 08:21:19 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Wang Chen <unicornxw@gmail.com>
CC: <linux-riscv@lists.infradead.org>, <conor@kernel.org>,
	<aou@eecs.berkeley.edu>, <krzysztof.kozlowski+dt@linaro.org>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <robh+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<jszhang@kernel.org>, <guoren@kernel.org>, <chao.wei@sophgo.com>,
	<xiaoguang.xing@sophgo.com>, Wang Chen <wangchen20@iscas.ac.cn>
Subject: Re: [PATCH 01/12] riscv: Add SOPHGO SOC family Kconfig support
Message-ID: <20230915-groovy-fragile-8c3a3a7b038e@wendy>
References: <20230915071005.117575-1-wangchen20@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20230915071005.117575-1-wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_002157_569688_23494C87 
X-CRM114-Status: GOOD (  18.05  )
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
Content-Type: multipart/mixed; boundary="===============6935530602200831787=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6935530602200831787==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ENGkoMse754EbNpY"
Content-Disposition: inline

--ENGkoMse754EbNpY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Fri, Sep 15, 2023 at 03:10:05PM +0800, Wang Chen wrote:
> From: "xiaoguang.xing" <xiaoguang.xing@sophgo.com>

This needs to be a name, not the contents of their email address.
Probably just needs the . swapped for a space?

> The first SoC in the SOPHGO series is SG2042, which contains 64 RISC-V
> cores.
>=20
> Signed-off-by: xiaoguang.xing <xiaoguang.xing@sophgo.com>
> Signed-off-by: Wang Chen <wangchen20@iscas.ac.cn>
> ---
>  arch/riscv/Kconfig.socs | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 6833d01e2e70..fc7b5e6c7def 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -110,4 +110,14 @@ config SOC_CANAAN_K210_DTB_SOURCE
> =20
>  endif # ARCH_CANAAN
> =20
> +config ARCH_SOPHGO
> +	bool "Sophgo SoCs"
> +	select SIFIVE_PLIC

This should not be needed, this should be selected at the arch level.

> +	help
> +	  This enables support for Sophgo SoC platform hardware.
> +	  SOPHGO is committed to become a provider of universal
> +	  computing power, focusing on the development and
> +	  promotion of computing power products such as AI and
> +	  RISC-V CPU.

This is not a place for marketing blurbs, please take a look at the
other entries.
Also, this should not be placed at the end of the list, it should be
before ARCH_SUNXI.

Thanks,
Conor.

> +
>  endmenu # "SoC selection"
> --=20
> 2.25.1
>=20

--ENGkoMse754EbNpY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQQF6QAKCRB4tDGHoIJi
0oTJAP9c52u8XECYZvn+Qt9RdRvorAS3pVREBUDao12bLGJQcQEAxhTfNeJImtXF
WhPAFatMpxtY1G/qD8E+TiVnTwgm4Qo=
=FBOL
-----END PGP SIGNATURE-----

--ENGkoMse754EbNpY--


--===============6935530602200831787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6935530602200831787==--

