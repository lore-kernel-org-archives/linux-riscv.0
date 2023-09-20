Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A6CCE79AC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 08:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XdwVcXQ7eoP8x9AZI9sJO7AECRnleLyaT/0RZs2GYDU=; b=1NDrP3jJG+gOM5CN+dvjX/UpMt
	glwfaUw8rqHs/6Q4F7eJqr7rX6eMVt/+OMxJcRZFRuvAxjQJtJ+ogG2aqfT1VDy4q6J26byYanBPP
	wck8zbMqrRz7iDct7Bf/zxZ1M8p011O7vCr3oHRFm84ZXA5mqkxE/3BlyG0j6Xpl6rfT/b5rRk4xr
	RcY9XZ1NIflFAyTThan1la/JAHvbrbqLYZfb+cqYtq7TwKCHKXPeyHU+MpbtV9PG61GgLmhRhAkzj
	JRGND1k4RQjB+SODBMWJakpa9VoXHecA2mNMjBY8tMNnJqbWmKOL7LUcJz+Kj6SOQX+RMejoHTSNK
	dvRiY+kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qisiV-002ImT-0j;
	Wed, 20 Sep 2023 08:37:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qisiS-002Im3-2X
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 08:37:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695199069; x=1726735069;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+ubhK+ohsrm/rVYz4hePic08sMvDAPezKqgxUkBOSE4=;
  b=LS9WIeZH/bqcyoTy5WAyQ1eh7hn9Hm/q6hYi0gwFPNzN/4ysvJX94ZKV
   voBpa2EdMoVm6GDKDIG3OQmizs0bQLNSakyAdssCNJrYvPb/A8B0WEQgh
   Z39YdkBVtBuTyAyncqbmOkOHVag6+9PkIINRjTBdajSJyIalYDEHQWYWK
   CVi4dFC1u9bayNabMaebjOLhT3gI0TMEKwwl3l4AfxXrTnEaePjOFHU5v
   lyvimokNxajdoJ9o0juAu8MguJseNWM/31OVIRcU2ESp2cJQOmOqQwH2T
   u/efE3RI3zXvgl3wqwZzU0l8e1R2uOS14ld0tADWqnDqlUZ50zLkSptqT
   g==;
X-CSE-ConnectionGUID: WjP0000pQd28t1EnxNpDvg==
X-CSE-MsgGUID: ZLmgIhqLQDq6kpTwpBgavw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="asc'?scan'208";a="5615763"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Sep 2023 01:37:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 20 Sep 2023 01:37:46 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 20 Sep 2023 01:37:43 -0700
Date: Wed, 20 Sep 2023 09:37:26 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Chen Wang <unicornxw@gmail.com>
CC: <aou@eecs.berkeley.edu>, <chao.wei@sophgo.com>, <conor@kernel.org>,
	<devicetree@vger.kernel.org>, <emil.renner.berthing@canonical.com>,
	<guoren@kernel.org>, <jszhang@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <robh+dt@kernel.org>,
	<xiaoguang.xing@sophgo.com>, Chen Wang <wangchen20@iscas.ac.cn>
Subject: Re: [PATCH v2 04/11] dt-bindings: riscv: Add T-HEAD C920 compatibles
Message-ID: <20230920-borax-swipe-dbf4aa8ed4e2@wendy>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
 <c5061fbe8ef9c4971cd45de7b5d8408dc1b848b4.1695189879.git.wangchen20@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <c5061fbe8ef9c4971cd45de7b5d8408dc1b848b4.1695189879.git.wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_013748_833038_6E0690FE 
X-CRM114-Status: GOOD (  13.32  )
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
Content-Type: multipart/mixed; boundary="===============5388628801499619915=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5388628801499619915==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BiR7UZp5nLCqNrq7"
Content-Disposition: inline

--BiR7UZp5nLCqNrq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2023 at 02:38:08PM +0800, Chen Wang wrote:
> The C920 is RISC-V CPU cores from T-HEAD Semiconductor.
> Notably, the C920 core is used in the SOPHGO SG2042 SoC.
>=20
> Acked-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
> Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index 38c0b5213736..185a0191bad6 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -47,6 +47,7 @@ properties:
>                - sifive,u74-mc
>                - thead,c906
>                - thead,c910
> +              - thead,c920
>            - const: riscv
>        - items:
>            - enum:
> --=20
> 2.25.1
>=20

--BiR7UZp5nLCqNrq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQqvRgAKCRB4tDGHoIJi
0s4+AQC6Ty5DsHJBz4+NX28nmY1bLvz9GbBkvEyXpaBaCnRxLwEAjZQNYITGCtsr
MOaERg3cYcLTGM30m/i2J4lYLmSsiwA=
=wDzS
-----END PGP SIGNATURE-----

--BiR7UZp5nLCqNrq7--


--===============5388628801499619915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5388628801499619915==--

