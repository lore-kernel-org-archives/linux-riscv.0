Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430A7CD98C5
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 16:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6gXR/1+tRaDtT+KRQk3H3+iM0Oc5rPherv4T2x2Zj0=; b=f8Xx4ghuQlni5MeHMo6KUqeqag
	DcmTFRdrw6tPtXCABxPXwv+iS/OHTGrpNqDV9/8k2mzB8VEvFT4WTXP/wSHwEzV3o/NnVofw1QJWn
	Q9bCzsykykpgRODWSAQ1OE0e0EV/e7/gyPYOg+xIqAloCJ8SVyq4TFhC0KDQgWVMwvoa6fi3nCKzZ
	GbH3oHBSwPNvzWTKBz17XV710t1sP8Ml7WBXSRA7iUD0m5XutLaNTpUpPMl0PQY4SLWbU60ZUkupI
	dsXPBrkB1mhpyxYoVaHnP4Iq6p4ZsBRVa+U/9pVZnBiUhlWTQjBDc3JI4WM9XhLjjiUh6SopiGLC7
	nv+MOvQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAB3-0000000EZjA-0n4b;
	Mon, 15 Jun 2026 16:28:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAB1-0000000EZj3-3frK
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 16:28:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F1274600AB;
	Mon, 15 Jun 2026 16:28:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE731F00A3A;
	Mon, 15 Jun 2026 16:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781540922;
	bh=wYvIhixzTwQa3Wj++bivo33Io38lxJyx7TobgBUnf74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M4310Af4AQg7Cbbcyg9QPA1rPUF8NTBagIVGYJqh9Aal/U6WKuJjzqus8QSu9oEf9
	 rgFHSisgIMw/MYweaOSB7JblVvTi9gX9rQ7NJQSzGNTTVrSxV8oWGrRnf1oB0U2Yoo
	 TC4ig3P79GV3qSDSzw5yM+gyj6ZzMwLcEtRhpVddMlitOmKvO6fuWsBSlPV4vTjoN4
	 eWeWQA1vM2GlL7srLe36SQC+q1CQ97IkYdrxskqUFZ8dRA2z/OIaar2fsH2XMUaugZ
	 pJkWOp2n6GZ0PkR6IKY0gDwhWaXi8oVAKESvtZCBRmIjMxCKLPu8SOWQuKTbzZSd0b
	 dPcvLMlIyKn+g==
Date: Mon, 15 Jun 2026 17:28:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>,
	Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: [PATCH 4/7] dt-bindings: mfd: syscon: add ESWIN EIC7700
 compatible
Message-ID: <20260615-buccaneer-garland-0617394e9a45@spud>
References: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
 <20260615122016.1110206-5-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
In-Reply-To: <20260615122016.1110206-5-pinkesh.vaghela@einfochips.com>
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
Content-Type: multipart/mixed; boundary="===============5151354747285896655=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5151354747285896655==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QzOTKnhbdMQfujJ1"
Content-Disposition: inline


--QzOTKnhbdMQfujJ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 05:50:13PM +0530, Pinkesh Vaghela wrote:
> Document ESWIN EIC7700 SoC compatible for syscon registers.

Some detail about what this syscon does would be nice.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

>=20
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Document=
ation/devicetree/bindings/mfd/syscon.yaml
> index e22867088063..7d3365601249 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -62,6 +62,7 @@ select:
>            - cirrus,ep7209-syscon3
>            - cnxt,cx92755-uc
>            - econet,en751221-chip-scu
> +          - eswin,eic7700-syscfg
>            - freecom,fsg-cs2-system-controller
>            - fsl,imx93-aonmix-ns-syscfg
>            - fsl,imx93-wakeupmix-syscfg
> @@ -175,6 +176,7 @@ properties:
>                - cirrus,ep7209-syscon3
>                - cnxt,cx92755-uc
>                - econet,en751221-chip-scu
> +              - eswin,eic7700-syscfg
>                - freecom,fsg-cs2-system-controller
>                - fsl,imx93-aonmix-ns-syscfg
>                - fsl,imx93-wakeupmix-syscfg
> --=20
> 2.34.1
>=20

--QzOTKnhbdMQfujJ1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajAoNQAKCRB4tDGHoIJi
0gNPAP9sNaKKakr1WOIxxXV6OrawVVKnPTVbyEABUhmDFsbmBAEA9qRBENKajLM+
JEPrvLMmhm5ZjzU6auRP6Hb8/+l24AI=
=oLrU
-----END PGP SIGNATURE-----

--QzOTKnhbdMQfujJ1--


--===============5151354747285896655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5151354747285896655==--

