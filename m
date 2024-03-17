Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F92FC54E67
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Mar 2024 15:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTwS7vOAycOc3kbNQMmiOATMyrty4HL8MfrsHvx5qTw=; b=LymF4PVefQKiHRYyEF/sZYvaV8
	0j565h8mcLyj7uBK/cmD80sinZ3O8+5o6ALOaBtujYnmeGVFrsmXkuS9d6H7jj/5zV0uQDN+j73R8
	ZwiaTvxZ9Kpb+mIHxJW9NTxbCcRcCzrdGWtg6boiTJzJJJ7wcybOUHT1Iszzb/b87G9fLR7OENX8s
	YOPnMNfn1j5y4WAAHi5lxs5cC59+x6aki5qzYkgNWHuu9glwzzS/HP9ADU+hQT5Q71vQSw230oQmC
	84sHs4TLJu6UFpYh9JqIpjO1sicgNiovsHQxgmJDjN1MPQVXBDqONyF7NS2XHHCTwwOX4ik1wIOok
	t5d4ORUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rls4K-00000005Ve6-2zBn;
	Sun, 17 Mar 2024 15:05:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rls4I-00000005Vd9-0gIa
	for linux-riscv@lists.infradead.org;
	Sun, 17 Mar 2024 15:04:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B0DF60B21;
	Sun, 17 Mar 2024 15:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC70C433F1;
	Sun, 17 Mar 2024 15:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710687896;
	bh=2ACXqSM+oORIh17fNVnxm9lOfm84HdVokhO3Uq3s6/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PvgYHoZeAUgL7baYLe8VFCYHkij2cmqS3IK210s4biuHcborS1d9cCZ1JDVUg0wA2
	 dMiYrA13I2YJWRANuKZ7yLQnkt4D78yLbQlCjSN/rVPQ9Y3QqpAll+cIaS0omoiuU0
	 w+uX8PBsLJUANfIJ2TImi7K70Z2xQppmqXl2kCXT+P3gOBoHWfcGuRaGiFy/ga/wb2
	 oUXCtdLpXRyWuIWUGiZ83fmqmbioNJ2TCHzXn1l8oIWy2gfD5B9Bs7TFbHvybTXRQu
	 g6phtAsyrA+x997zzrHoVMjyBwYWiFOqKpYDtAiy4BXgBCoYtow8S2DXycW/Gp8neN
	 vMbiSmAO2qPYg==
Date: Sun, 17 Mar 2024 15:04:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH 2/4] riscv: errata: Add StarFive alternative ports
Message-ID: <20240317-tighten-outskirts-de8c44f36853@spud>
References: <20240314061205.26143-1-joshua.yeong@starfivetech.com>
 <20240314061205.26143-3-joshua.yeong@starfivetech.com>
 <b662bb30-d5e2-4bf0-a156-ac38461fcea2@sifive.com>
MIME-Version: 1.0
In-Reply-To: <b662bb30-d5e2-4bf0-a156-ac38461fcea2@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_080458_275332_9F6F34EA 
X-CRM114-Status: GOOD (  10.00  )
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
Cc: heiko@sntech.de, geert+renesas@glider.be, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, jeeheng.sia@starfivetech.com, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, alexghiti@rivosinc.com, leyfoon.tan@starfivetech.com, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, paul.walmsley@sifive.com, jszhang@kernel.org, linux-kernel@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, Joshua Yeong <joshua.yeong@starfivetech.com>
Content-Type: multipart/mixed; boundary="===============8013357668592401299=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8013357668592401299==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JsseNBDqmI6dnw3W"
Content-Disposition: inline


--JsseNBDqmI6dnw3W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 15, 2024 at 06:13:34PM -0500, Samuel Holland wrote:
> > +	riscv_cbom_block_size =3D STARFIVE_JH8100_L3;
> > +	riscv_noncoherent_supported();
>=20
> This patch doesn't add any alternatives, so you don't need to use the err=
ata
> framework. Please move these two lines to the cache driver -- see
> drivers/cache/sifive_ccache.c -- and then you can drop this patch.

And drop the patch adding the vendor ID too I guess, since that'll no
longer be used.

--JsseNBDqmI6dnw3W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfcGkgAKCRB4tDGHoIJi
0pDeAQDgdfT+icPw5jmJ78Y/pSrT5mWSE7Hy7N6+WitU8s1GIQEA/+eOnCRCllnP
bQBprzlW1VcvJbKHuRNXPc9l69MaXwg=
=JUfr
-----END PGP SIGNATURE-----

--JsseNBDqmI6dnw3W--


--===============8013357668592401299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8013357668592401299==--

