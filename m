Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D9BC77B71
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Apr 2023 13:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5mQ+dMZbe8pqP/ohuOI/rYiBOQshzWv/Xn7hwDYIUU=; b=uYbC9k9m6YNmTKZ55Pel4N4zT5
	ZKKg058uDeiYhLgynHYUdQz46NAGKSFG1G4QGzy0nPOM0v/UnxuWoKAX1u8cF2oNOEecEF6VkbTH1
	RbrYTZ3s1yZagHAGFZgkYwbEXexhZ7pzdbQvoOa6w6G49lxsyWeFJC0MItSPRJdCfC9m3pqpPDAdp
	p37bIQOM3ctS0XMddmRaz2AELWu0pdTmEIUi+xMBhjSSXbLLowfhmRW0xqKjwgFfnhZOauEOt8Jg1
	F9bpVhH2y554v7AHmmc/us++FGq3nE1fLa+oOpFutcY6CkDUr5AN7Zda7DYwBG0MgBo96Gf1x144v
	RKjwgHVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prImz-001FX5-1E;
	Tue, 25 Apr 2023 13:33:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prImv-001FTW-1Z
	for linux-riscv@lists.infradead.org;
	Tue, 25 Apr 2023 13:32:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1682429577; x=1713965577;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n+UYdOVx4WUXne2QA73wy1xrjCHvnCZyxya9YmSho+E=;
  b=RzZaykfJaGxaFL5bN0j45S7NoDvP4VgZUrqJg2ZsBHadK8SQQV+TAb/q
   kqNd+VbZZgKZa3TwYbooOukpKBi+JfE9zZCb6iOiDEHUMI+W4XKVJn7tZ
   p1U97N1AYebHIAaNx8rMCPSf0UZl8zS3TNGDpoUy6pR8hrqYIV3GxOHJt
   5aVgjEB7qbGftL0mJidVpcixeijgGpzDhNnABv3Bx+UYm1b2FpAVQOpK/
   8ZJq1EnD+ZojTKKO5EmXuMeX87qtLqCXLZ6zRE/OeXp7Zvh+ais+udPSy
   BdBpYcC+roW+Gwa+a+wxIcaOVgF4uc807xZk2XePQQkOaW3/DruErcGaG
   w==;
X-IronPort-AV: E=Sophos;i="5.99,225,1677567600"; 
   d="asc'?scan'208";a="208183674"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Apr 2023 06:32:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 25 Apr 2023 06:32:39 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 25 Apr 2023 06:32:37 -0700
Date: Tue, 25 Apr 2023 14:32:20 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Yangyu Chen <cyy@cyyself.name>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Wende Tan
	<twd2.me@gmail.com>, Soha Jin <soha@lohu.info>, Hongren Zheng
	<i@zenithal.me>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/2] docs: dt: allow case-insensitive RISC-V ISA string
Message-ID: <20230425-echo-elusive-bc38bc625053@wendy>
References: <20230425120016.187010-1-cyy@cyyself.name>
 <tencent_221A82C2DAF38E66B85B313221958DDD7C08@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_221A82C2DAF38E66B85B313221958DDD7C08@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_063257_584314_AFAA1BAC 
X-CRM114-Status: GOOD (  18.09  )
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
Content-Type: multipart/mixed; boundary="===============6163322047268164775=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6163322047268164775==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/hVUEV3z0EeUnQAU"
Content-Disposition: inline

--/hVUEV3z0EeUnQAU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Yangyu Chen,

On Tue, Apr 25, 2023 at 08:00:16PM +0800, Yangyu Chen wrote:
> After allowing case-insensitive ISA string parsing in the kernel code,
> the docs should be updated.

As I pointed out in my reply to your cover letter [1], I don't think this
patch is backwards compatible, and should instead be fixed in
rocket-chip's codebase, where it appears the capital letters were added
without actually testing the output against the binding.
If we allow caps here, booting old kernels with new devicetrees may
experience the crash you mention in your cover letter.

NAK, on the basis that this should be fixed in rocket-chip (or any other
core-generator that outputs invalid devicetrees).

Otherwise, the $subject doesn't match what is used for dt-bindings (use
`git log --oneline -- /path/to/file` for examples) nor did you CC the
output of get_maintainer.pl, with the devicetree maintainers notably
being absent.

Cheers,
Conor.

1 - https://lore.kernel.org/linux-riscv/20230425-flyable-prompter-5b1e4cebf=
9db@wendy/

> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index 001931d526ec..70afd1e8638b 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -79,11 +79,10 @@ properties:
>        User-Level ISA document, available from
>        https://riscv.org/specifications/
> =20
> -      While the isa strings in ISA specification are case
> -      insensitive, letters in the riscv,isa string must be all
> -      lowercase to simplify parsing.
> +      According to RISC-V ISA specification, the isa strings are
> +      case insensitive.
>      $ref: "/schemas/types.yaml#/definitions/string"
> -    pattern: ^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[a-z])+)?(?:=
_[hsxz](?:[a-z])+)*$
> +    pattern: (?i)^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[a-z])+)=
?(?:_[hsxz](?:[a-z])+)*$
> =20
>    # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
>    timebase-frequency: false
> --=20
> 2.40.0
>=20

--/hVUEV3z0EeUnQAU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEfWZAAKCRB4tDGHoIJi
0kXEAQCz6v6VsoqWREz45zSf4bLpIftWmQRW94Qb4+4AhCYrFgD7B+LRePncGOQL
yoi9Mw9yN2LKGNsxMgXC+I80FU9lMQE=
=yiKa
-----END PGP SIGNATURE-----

--/hVUEV3z0EeUnQAU--


--===============6163322047268164775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6163322047268164775==--

