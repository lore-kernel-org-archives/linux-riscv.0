Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C19EE645D
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 14:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cu1taa9wLRr1g6vH8hDdSOtSGOBxhBz96SQm9gh2BsI=; b=vLKzURdmLBjo49M/5AnRY4puhZ
	fVWeFTPBFZFWCKyy9nCertFShRPoJE78u8/+56U0pHb4D8S2CITyEFaSI6qIx01Qwp4bzeuZQMvBk
	Y3qHxoHzOoTgAxYbzESvicU/6Qr3XubGr9X9iVoSxmLtDT6OpWDWElY152PZ05Xz5f/9grdwiLDGi
	3fL6KBBccmgXZE2Ko0S6/tcVpxbcBmMc59eoi8GGu6fm7cXfFu1fErYfJCo5tioM/XYJc2SyEHxrv
	DNBN2zBGTsOcgjmAHG7uREBEXsftMfG0wGlDFWG+Ky+DkN50pgM/niSWPF0pOqE4TgrREoIJbw4JC
	X9OtPmkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh9Y3-00ArXz-2L;
	Fri, 15 Sep 2023 14:11:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh9Y1-00ArWs-0J
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 14:11:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8B00661FED;
	Fri, 15 Sep 2023 14:11:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C4AC433C7;
	Fri, 15 Sep 2023 14:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694787109;
	bh=7eWWvHfw6GRqHLXpTAHNgpwMQoiTfPM79bZDUURySQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aot5xG/6zIolsjLGE5BJmtgsqhht4rr+me+2ndd8awnkztVbNhAiLAvvsME7T59k+
	 ouRa5EjpKsSiMqOfu4anPN+YLXYZS8GiuNVwRqGMMD1OFinsUUn/vO99YLghxFT/GX
	 J5LRTFmw+yyemnwpFV9q4rzR4yA8b1KoDXUiLhO///f7jPZaiCjfx9vPJf+sdmwBCN
	 ZunHALiK4sZKZmvJfO2pCw9BqLXTKETuaXYX3s+giP4i8tgy11zPmrNH/1JkvgiES4
	 d+TNqqCfrrtawHn759zJpSAfW5zmH98hjcV96BpnV3A9TOxik/0n7uJGaAd3Dbskve
	 H+BQwEJghQsBw==
Date: Fri, 15 Sep 2023 15:11:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Wang Chen <unicornxw@gmail.com>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	jszhang@kernel.org, guoren@kernel.org, chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com, Wang Chen <wangchen20@iscas.ac.cn>
Subject: Re: [PATCH 04/12] dt-bindings: riscv: Add T-HEAD C920 compatibles
Message-ID: <20230915-muster-viability-93d7d4ec2b49@spud>
References: <20230915072333.117991-1-wangchen20@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20230915072333.117991-1-wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_071153_178690_FB0997FE 
X-CRM114-Status: GOOD (  15.07  )
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
Content-Type: multipart/mixed; boundary="===============8050258628535142870=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8050258628535142870==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="53Jv7XerkC9sk4oP"
Content-Disposition: inline


--53Jv7XerkC9sk4oP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 15, 2023 at 03:23:33PM +0800, Wang Chen wrote:
> The C920 is RISC-V CPU cores from T-HEAD Semiconductor.
> Notably, the C920 core is used in the SOPHGO SG2042 SoC.
>=20
> Signed-off-by: Wang Chen <wangchen20@iscas.ac.cn>
> Signed-off-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>

I figure this is missing a From: or Co-developed-by line.

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

--53Jv7XerkC9sk4oP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQRmHwAKCRB4tDGHoIJi
0u3xAP9AR6sV69ClVxJ4lGrLIj47Y3q7kzaeM9RHU7cVbQz/ywD/Z/QLPAHkU4kN
CB9Z/+WTN9m9fMZFb3S9e2+975eH2gY=
=4q42
-----END PGP SIGNATURE-----

--53Jv7XerkC9sk4oP--


--===============8050258628535142870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8050258628535142870==--

