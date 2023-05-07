Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B574BC77B7C
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 21:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lHIOUzR1mq/7fyxD0F3Pe9f30zGQo96jqXmkD7G6O4=; b=AjcJ7EnRLXuB+Fim5q8/yq8ra4
	dfDNDHvXN8iA9z/PFIrOC9UYOURK8VLQex3AbOblfn6xK3+66bfC3rBLuLiDmiiTRIyxCMj9/4x6i
	jR9QbRvYAR4/elguDvz9s65hjyHbnRx9Ekx1RVEvrHa4AcQx6S5dPWdNf8khrUEDo8OE4ecEBQge6
	JQcinv6cTDCn1J7i1nNsDIXchxrHPQ1L1LQuderdm7jJJW0bKMUPSMxFr90kB2EDkWqmMginP2kkk
	ADTkATmToUmC5HlBJPhO3fhw0gtnVSAR9K+fkihaKjBWhc7uQKUq9rOqp8unTNAUbdtqMvHJnx4c3
	UJSQes7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvllk-00GhWE-0R;
	Sun, 07 May 2023 21:18:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvllh-00GhVd-0q
	for linux-riscv@lists.infradead.org;
	Sun, 07 May 2023 21:18:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 095FD6111D;
	Sun,  7 May 2023 21:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63D0C433D2;
	Sun,  7 May 2023 21:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683494286;
	bh=1NZQml9zDBqx7taKKzTrx2YDBLgFsAyXf+f6+N6GDoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dn3AWSGljGjMD2p0S8VMI0fOVlM0XNeTp7X8O+57Q5f57bCPuI3kjTT5eGjdjGIiG
	 VtPPFA7lcF7r3ROfl8bk3/G/VurgGG6NGupj051IyDTLqlVJAwyO7eGtV18MkObjAc
	 1feGuiYDzcacZ26mAkR8i3uw3sWdTFg/3BaO8fQDKTV2xA04xyNRFC4w0lPc//6amA
	 Qj7iudIdOqDtbDaR7gu9OUceS0TgHVhFahhezUI2g0YfvOyI95qCjtiLby1qNRRDtB
	 9/z/W60nOVJkv8fCJoTVt2LJZEzqxwQSA2Xd+v3EqaMN+U4sfuEbMXYyD49OKg3g7c
	 UiYhnzB8USLrw==
Date: Sun, 7 May 2023 22:18:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH 1/5] irqchip/sifive-plic: Support T-HEAD's C910 PLIC
Message-ID: <20230507-spiny-purify-bd1a0bc395ee@spud>
References: <20230507182304.2934-1-jszhang@kernel.org>
 <20230507182304.2934-2-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230507182304.2934-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_141809_407229_E99EDC2F 
X-CRM114-Status: GOOD (  19.06  )
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
Content-Type: multipart/mixed; boundary="===============2183017483217555315=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2183017483217555315==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BFuuXvLmezuA9yIP"
Content-Disposition: inline


--BFuuXvLmezuA9yIP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Jisheng,

On Mon, May 08, 2023 at 02:23:00AM +0800, Jisheng Zhang wrote:
> The T-HEAD's C910 PLIC still needs the delegation bit settingto allow
> access from S-mode, but it doesn't need the edge quirk.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml      | 4 ++++
>  drivers/irqchip/irq-sifive-plic.c                             | 1 +

dt-bindings changes need to be in their own patch.

>  2 files changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifiv=
e,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/=
sifive,plic-1.0.0.yaml
> index f75736a061af..64b43a3c3748 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> @@ -62,6 +62,10 @@ properties:
>                - starfive,jh7110-plic
>                - canaan,k210-plic
>            - const: sifive,plic-1.0.0
> +      - items:
> +          - enum:
> +              - thead,light-plic

If "light" is a code name, but "TH1520" is what this is known as to the
wider world, I think we should use thead,th1520-plic here.

Thanks,
Conor.

> +          - const: thead,c910-plic
>        - items:
>            - enum:
>                - allwinner,sun20i-d1-plic
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifi=
ve-plic.c
> index e1484905b7bd..71afa2a584d9 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -569,6 +569,7 @@ static int __init plic_init(struct device_node *node,
>  }
> =20
>  IRQCHIP_DECLARE(sifive_plic, "sifive,plic-1.0.0", plic_init);
> +IRQCHIP_DECLARE(thead_c910_plic, "thead,c910-plic", plic_init);
>  IRQCHIP_DECLARE(riscv_plic0, "riscv,plic0", plic_init); /* for legacy sy=
stems */
> =20
>  static int __init plic_edge_init(struct device_node *node,
> --=20
> 2.40.0
>=20

--BFuuXvLmezuA9yIP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFgViQAKCRB4tDGHoIJi
0ip+AP4np3bd4vMrd0RXgyATUrdb76pBpi/32O/A4+EtjoCCqAEAhjBHhz7U+tAv
V4QSEXP0R6ThmABGVDXyj6/5ver+GAk=
=zm2X
-----END PGP SIGNATURE-----

--BFuuXvLmezuA9yIP--


--===============2183017483217555315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2183017483217555315==--

