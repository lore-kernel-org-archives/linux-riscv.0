Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF455E9D41E
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 17:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUi6qhaSI3OIqqwKT2HWJcgyG7EECjnWu6GUHVhS0Yc=; b=4uDEhzxgDaniJ36C7EMXFJHVNt
	z15SLtDTveA968bA6cqUWdAvmAiXrMQufimXLfBGKAWEKrjHaaQ1GnQv2lWxUFQMBCQU4m8rLei4A
	sfvlJq4jEY6waQfHyItkVBWvq5R8xwoltSSQQVNDQij8d4G5tmZ0tBAHDJUL9cLPibNsCJ+KnTnRs
	tOZ2L6U7VU+bRGamTor/x8VXSJJ7N7slXXECOt08Sm5toFN6s/QpgTTqPS7fWhCO3Wuri2m6Pozud
	u4pyBfRJD0+WrNq4+wrNME+JwyvAfIMxK7rax7y11dFWV61YnuFskdHTc8m8Xpot43p1PXdGJZ0/+
	ldB5FYyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnh0l-00000008sz2-2eQP;
	Wed, 04 Feb 2026 17:49:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnh0k-00000008syv-2r4D
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 17:49:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C18BB60010;
	Wed,  4 Feb 2026 17:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E690C116C6;
	Wed,  4 Feb 2026 17:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770227393;
	bh=3lnDvNg5TpBuQbJTldCFuO+TEQx0ZJwfaT7kWJHY4XY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RGgwneO6PbRV/MOZB5p9dqDI90TofB2O32zE/Ijq92iXqv1jVNGTg2RlxsGZUBdWK
	 eXPiI7dZgMvoA/SkNnna9s/u8TNMFnCktZ6kR3vVoEKmGRZZGGkjg4W7SGiakAFDS2
	 dA112C1CdZtzmrRm+v/ceDhzHiQSaOION1wxTUfJDb5EphJHqA2Ca/OwGBCi5fPAJq
	 ROY4bmQG4YyXCWYJ1JjlkH+JYC7szFccPzLw6whCKZXiYe/ZOXvxaZBQ9R3QKBX55N
	 X2vtIpNjpjPiwP9jJRqbjiOkK7qM0MLsNPgQQa/zsZj4z6zwpc8GiJu4yj9wjpt1Da
	 0lmb6DmcQlrFQ==
Date: Wed, 4 Feb 2026 17:49:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Anup Patel <anup.patel@oss.qualcomm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	Lucas Zampieri <lzampier@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Mason Huo <mason.huo@starfivetech.com>,
	Zhang Xincheng <zhangxincheng@ultrarisc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Marc Zyngier <maz@kernel.org>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
	Jia Wang <wangjia@ultrarisc.com>
Subject: Re: [PATCH v3 2/2] dt-binding: riscv: Clarify the riscv,ndev meaning
 in PLIC
Message-ID: <20260204-cursor-wad-186f59d9c2ab@spud>
References: <tencent_AEBB719FAF49D05B5BDF7118D729463F6405@qq.com>
 <tencent_720A4669773B1EE15EC720869C35C2F0490A@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_720A4669773B1EE15EC720869C35C2F0490A@qq.com>
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
Content-Type: multipart/mixed; boundary="===============5450735164037875562=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5450735164037875562==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5qZwyZ7ljpTibS5F"
Content-Disposition: inline


--5qZwyZ7ljpTibS5F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 04, 2026 at 01:21:48AM +0800, Yangyu Chen wrote:
> In PLIC, interrupt source 0 is reserved and should not be used.
> Therefore, the valid interrupt sources are from 1 to riscv,ndev
> inclusive. This commit updates the documentation to clarify this point.
>=20
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml        | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifiv=
e,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/=
sifive,plic-1.0.0.yaml
> index 388fc2c620c0..df9578bcac89 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> @@ -109,6 +109,8 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
>        Specifies how many external interrupts are supported by this contr=
oller.
> +      Note that source 0 is reserved in PLIC, so the valid interrupt sou=
rces
> +      are 1 to riscv,ndev inclusive.

The trm for mpfs says "in the plic, global interrupt id 0 means 'no
interrupt'". That sounds subtly different to me than "reserved", but
/shrug
I think this could just be truncated to "Valid interrupt sources are
1 to riscv,ndev, inclusive.".
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--5qZwyZ7ljpTibS5F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYOGuwAKCRB4tDGHoIJi
0pa6AQCwywZTUwL9/gacjMWnPdIFo4Hel12UoD0elnhDgdS3FgEA8GIYZ5djlVCZ
CcGXJzP3PHtS/fu1Sshwx7q1XR5maA4=
=MZ4I
-----END PGP SIGNATURE-----

--5qZwyZ7ljpTibS5F--


--===============5450735164037875562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5450735164037875562==--

