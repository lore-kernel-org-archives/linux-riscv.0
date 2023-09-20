Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40974CE79AB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 09:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwKHNler7Fuvh3pWntMiTN1a2xQfx0a3SQcpj/i34DU=; b=gHx2CW52FOvD+VCjlOUKw8ALLG
	wmxMqMl4x2G/HMlUM010N0ESbcIglIywSXppAbo96VBfpK6xxa5u8lusEO5JYCbZDBGeGskLSlds5
	yoA27o/hd5qmLMPVCTOPfUVp5n1HDjZbGmeVh4+x7wyWPYC2x4G+tRmukZQhF0Fj+UH9uS/O779Kn
	evtsh8aYIlpjgNEQj/LtAatnbbyTz9EX4ZgdVHkCv9gMgT7Y+zWOmV17N5mRmBXuxSp0QvbqDpq5f
	rtEnB4ZxL+S5B6qSFf0WCjT1Gs7y4XT0M0Tz+W1hdgkExURrN6Wf0u9g+zrRIMzcft5xdcZqSaRS2
	LENePOWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qit3w-002NrP-0i;
	Wed, 20 Sep 2023 09:00:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qit3u-002NpD-1t
	for linux-riscv@bombadil.infradead.org;
	Wed, 20 Sep 2023 08:59:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vRQAdE5ZWQXaquaGKoXeOQo3CemuhMWn5X6dkbQn4RQ=; b=cLZnmLUcJIcacPEuXtAy7Q2+IT
	8HT3xgD8DsnARFkjWQLh070NJlEBTj0UKZKci7mc9ehYMyMKywmEqnXzak9WVbsgSEPC/q7srikfD
	pEVUEp+maQslW0S77L+ggFav3kzWxZXN3A8/a3Svn2FEZiNNOGvP3BBCZG4VbGtmWCgvP4S2SeJ92
	sUY8s9DwYelsIRZYfMdC1UqaHJAi8Vsf8xjujzf+Z8K0gVrJiaKedAbamAjL9JUsGjZQrlBI41zpK
	i3p8G00xYs87I4uAnmrTBmszSvpIf9bjn2Z19DnPyo9fOzXwIKfDM/kS1vOHvz8/6LYb5W+aFAtlU
	XReCQ9SQ==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qit3r-004skk-1z
	for linux-riscv@lists.infradead.org; Wed, 20 Sep 2023 08:59:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695200394; x=1726736394;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8PzOPFQoSmOSC33X6Zp4pL7iIW194UYvX7j8IZCVDdc=;
  b=w6l2nIJF4TOu+rpRm0pQlPhvvboOQcA/avDUFAch0omqQdqZuGzRi7bV
   3KrJJh7MzKwWz0GAZ1yLhOQcQuScyqtORUqeJRvpD+7Ksu6mg7EjJtSFW
   RQraHBSW1C3q1gBTKVp6coJJk106rOJalN50P4T/pzpRjZE/7aUa9Eywd
   tXqRjMrzGGeieKWJsIAbEQsv16DUyKCiHAYBjXRbASBQhGLCTMM197ENm
   nwYoe1WYaMPXnn26Xvah85LRJjLTVcvXbYV4nKfwe9HDeToZpe+Yh5ZW3
   fu7NJbpnNPlK6ELrRunwMa8t6jkjNyCKc3hhdE+Ao+w+ulbybBAEdeb6c
   w==;
X-CSE-ConnectionGUID: CWR4QgdxQR+GD0PwQx3k4w==
X-CSE-MsgGUID: LmRkfLE8TnWe6x7yeffJGw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="asc'?scan'208";a="5478413"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Sep 2023 01:59:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 20 Sep 2023 01:59:07 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 20 Sep 2023 01:59:04 -0700
Date: Wed, 20 Sep 2023 09:58:47 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Chen Wang <unicornxw@gmail.com>
CC: <aou@eecs.berkeley.edu>, <chao.wei@sophgo.com>, <conor@kernel.org>,
	<devicetree@vger.kernel.org>, <emil.renner.berthing@canonical.com>,
	<guoren@kernel.org>, <jszhang@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <robh+dt@kernel.org>,
	<xiaoguang.xing@sophgo.com>, Chen Wang <wangchen20@iscas.ac.cn>
Subject: Re: [PATCH v2 11/11] riscv: defconfig: enable SOPHGO SoC
Message-ID: <20230920-snuff-margarine-440c00b558ae@wendy>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
 <835006e5c76ba1c53eed1b7806a08ddea3390bc5.1695189879.git.wangchen20@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <835006e5c76ba1c53eed1b7806a08ddea3390bc5.1695189879.git.wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_095955_419378_E299CF64 
X-CRM114-Status: GOOD (  14.40  )
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
Content-Type: multipart/mixed; boundary="===============6662199275677516450=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6662199275677516450==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6j1R++AGjjGXCNir"
Content-Disposition: inline

--6j1R++AGjjGXCNir
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2023 at 02:41:12PM +0800, Chen Wang wrote:
> Enable SOPHGO SoC config in defconfig to allow the default
> upstream kernel to boot on Milk-V Pioneer board.
>=20
> Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  arch/riscv/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index ab86ec3b9eab..bf737cfa1d2c 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -32,6 +32,7 @@ CONFIG_SOC_SIFIVE=3Dy
>  CONFIG_SOC_STARFIVE=3Dy
>  CONFIG_ARCH_SUNXI=3Dy
>  CONFIG_SOC_VIRT=3Dy
> +CONFIG_ARCH_SOPHGO=3Dy
>  CONFIG_SMP=3Dy
>  CONFIG_HOTPLUG_CPU=3Dy
>  CONFIG_PM=3Dy
> --=20
> 2.25.1
>=20

--6j1R++AGjjGXCNir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQq0RwAKCRB4tDGHoIJi
0sEAAP92w6O7JF/MWRDh9o4Mrf/S7GHEcXmVUUv9fQvXN3G0GAEAsIcikzyE4vBQ
SsFBF+I2MMODyYCDHYpHC17vxaJBuQg=
=rt0O
-----END PGP SIGNATURE-----

--6j1R++AGjjGXCNir--


--===============6662199275677516450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6662199275677516450==--

