Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A3ECE79AB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 08:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Bv75AHw9iyTZ2ptzDSnnJ8M7wvHHvE5z7zHhKgVG/Q=; b=Acl1zbv03BTTRnOXG5X0gg1uEm
	S5CD8P89TUEikBGSyaWDpWqFzhwW61LtEsSiLg6vjbY0P/YKCeBZmqf/IRJtIm0cnhpYRt1w+bfas
	044sdSSHjDDc2bu6Qzv05sENNTxlIR8Xv+ovctJRi9CGaFakuTDDvOukuOhyQZ8PNNl48oK7H/Mem
	S3QQZkS0yWo13mFkVsSWAaEeHJ4ZukWNIjogY6ajwYty79SvC1xYnZqyw74UAppVP0HQZlwgPCDpj
	eNxe2D5Lg9juV3Hjk8tM4hItxKx4Q6K5cfKVY1FAQcSHe2VRhbrdiowr568HXXfpN89RWTML1bOIk
	M5Z3vzOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qisiv-002IrE-2b;
	Wed, 20 Sep 2023 08:38:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qisit-002Iqf-1J
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 08:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695199095; x=1726735095;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ib3NY21SFhiuriCmUuptRiwj4Fxat7usIIH8aA6pySA=;
  b=i5JQa8U9+Ni4QvCIZucj/ijumeQFdR7WvYL9F5X/gjxvc658jxe+BfaL
   FQQbDwPKi1zLgsL9YYLtqrjhcu+Fbd0TsQxkpcajdcciM7AwKzBKimyxm
   F/29qKkns4+0g/jX2/xodLdh/KSDuJes1/rAiVyKju2VtsGZs+UfE04DF
   +j9SM0uFrBrIHd1OZHZ3uahFCcO0hsIaWjgnfcOxgl+7PE47Qptm3emHA
   ee1/GtpzyPaqrMt6p60EXb9CMgT2sabDyQ01IYXKM9Pf8jTqD8OKKvoS1
   6m6xSUpPVEuAhZpx+UglTHq9JcklfiOOADqqdxLrZ9f60jXSZLXhZb7dR
   A==;
X-CSE-ConnectionGUID: TDHxoFc6SfigoLslkDh3sw==
X-CSE-MsgGUID: E4nCx99yTOCLcMPHLH1OGQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="asc'?scan'208";a="236152345"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Sep 2023 01:38:14 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 20 Sep 2023 01:38:13 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 20 Sep 2023 01:38:10 -0700
Date: Wed, 20 Sep 2023 09:37:53 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Chen Wang <unicornxw@gmail.com>
CC: <aou@eecs.berkeley.edu>, <chao.wei@sophgo.com>, <conor@kernel.org>,
	<devicetree@vger.kernel.org>, <emil.renner.berthing@canonical.com>,
	<guoren@kernel.org>, <jszhang@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <robh+dt@kernel.org>,
	<xiaoguang.xing@sophgo.com>, Chen Wang <wangchen20@iscas.ac.cn>
Subject: Re: [PATCH v2 07/11] dt-bindings: serial: snps-dw-apb-uart: Add
 Sophgo SG2042 uarts
Message-ID: <20230920-pursuable-liquid-ed0b6d0b60b0@wendy>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
 <05fcf91d60468323a6c7cdb8ac57c356ab4a3050.1695189879.git.wangchen20@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <05fcf91d60468323a6c7cdb8ac57c356ab4a3050.1695189879.git.wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_013815_449412_80B804E4 
X-CRM114-Status: GOOD (  12.80  )
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
Content-Type: multipart/mixed; boundary="===============1195941040167966297=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1195941040167966297==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fN0bv+HktN9C4V9U"
Content-Disposition: inline

--fN0bv+HktN9C4V9U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2023 at 02:39:58PM +0800, Chen Wang wrote:
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>=20
> Add compatible for the uarts on the Sophgo SG2042 RISC-V SoC.
>=20
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.ya=
ml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> index 17c553123f96..011d89e6df0f 100644
> --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> @@ -45,6 +45,7 @@ properties:
>            - const: snps,dw-apb-uart
>        - items:
>            - enum:
> +              - sophgo,sg2042-uart
>                - starfive,jh7100-hsuart
>                - starfive,jh7100-uart
>            - const: snps,dw-apb-uart
> --=20
> 2.25.1
>=20

--fN0bv+HktN9C4V9U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQqvYQAKCRB4tDGHoIJi
0iuWAP92pOVGoRVDilmFwSOHZ0wTYrKYCSnQBPWoG7A4nrtTygD/VuZ5gfsopuP/
esA/RiT+UAEgupeg3FWJ/qygDCSDqQg=
=+ir7
-----END PGP SIGNATURE-----

--fN0bv+HktN9C4V9U--


--===============1195941040167966297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1195941040167966297==--

