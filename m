Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21426FD8FF9
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 18:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XURxZjdwLsr3wJyAV2/7rURt0/QTZv7ZhAmITvZY52c=; b=p/wEb86p7ShprG5xu8pqPTYerc
	o9mg+xs3LmK4brF8e1XlsdeSXphGzQZbXSqUYFLXlQ5D7nVnL4zMdEN3iJKgDYDScn9SXRFutg990
	T0Am7HyBeLPqeOGDQ1qab2ZR9gIGICYWqorwFWC5nCvzdY4iaAHFfcNEetDHOU2otPoGca4ELHJcn
	zj32dOy4gM/K9mjJ6hEww73RSMS4DCnW1/gl8zgU7n3ULHFv9cYBnQElnlckdHeh+EfhShGwXj94j
	Q/2c/7bfma7vaouY6N6LX3m0W5MsYFhWFDJ4paAo7V3lRvf6S2LEZsNelYZ64C5HRTg2N9jkzR8yO
	3G1xQhJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvg8L-00000006y1y-3Jsv;
	Thu, 26 Feb 2026 18:30:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvg8J-00000006y1q-0sXo
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 18:30:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E7F160126;
	Thu, 26 Feb 2026 18:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49DA8C116C6;
	Thu, 26 Feb 2026 18:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772130642;
	bh=ooQ6613FOxl28UBORsVNyo3Q4mu19qXN8bOmyNjNBtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BXonYp9b+kbGFH+NmnmOE5Biw0/YZo8IsUqZjZ7NA9+Bdwc1oQvRscPdyewfD/iuP
	 +evHJeHw+77HI7cE03eyEsNNYQPo3MubFW7mgsyqgOZeZVAV/Kph7CsKtz4jSMAaiZ
	 IURjP1qMjEnBkG5uAJU+Ba6TiA+YQ0JR41iLWnKvznYW6NWrmOGob9O/OYy3wr3K1W
	 LJyTP2WwkMtExQghTG4rE5WjdbvIjD8kOdjn+/gttTtKvI7Z7xHtBY+/k2SuL0PuWp
	 8Doe6Qeceb11kQGFFM2ruBgQRtZEUCreTF7O23YUof6RYVsGVfrM7nxa9XDLUgrYgs
	 EIhKIy6fkHwAg==
Date: Thu, 26 Feb 2026 18:30:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: krzk@kernel.org, ulf.hansson@linaro.org, adrian.hunter@intel.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	gaohan@iscas.ac.cn, me@ziyao.cc
Subject: Re: [PATCH v2 1/3] dt-bindings: mmc: Add sdhci support for Canaan
 k230
Message-ID: <20260226-compress-numeric-8de6b177ab30@spud>
References: <20260226115923.75670-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260226115923.75670-2-jiayu.riscv@isrc.iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20260226115923.75670-2-jiayu.riscv@isrc.iscas.ac.cn>
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
Content-Type: multipart/mixed; boundary="===============6725823799755087944=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6725823799755087944==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PTB97KGCvVHNpIBd"
Content-Disposition: inline


--PTB97KGCvVHNpIBd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 07:59:21PM +0800, Jiayu Du wrote:

> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5

> +          maxItems: 5

This maxItems is not needed, as 5 is already the max. Drop it if you respin.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> +        clock-names:
> +          items:
> +            - const: core
> +            - const: bus
> +            - const: axi
> +            - const: block
> +            - const: timer
> +      required:
> +        - canaan,usb-phy
> +
>    - if:
>        properties:
>          compatible:
> --=20
> 2.53.0
>=20

--PTB97KGCvVHNpIBd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaCRTQAKCRB4tDGHoIJi
0jmzAQCXtTuc+dTvEFmME0odNPOCKTG7oRRm9zp/zJWTjD4HyAD/ZEMA+g6KeEMY
G32ztbqM/Vz1NbVdTlcr4NC9mRkY0gI=
=Mp5e
-----END PGP SIGNATURE-----

--PTB97KGCvVHNpIBd--


--===============6725823799755087944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6725823799755087944==--

