Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF3BCCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 17:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRQOuaAJ3flEnedhu5eFos7XUrH71IcFUWsFB+8aiCk=; b=PRFjJR/djvYwFBXVzVYcNAvhNE
	u9XJvLkGmYjfqF93scqfIaAiusVuTFM1Xht2mqSpPk8Shx0Ivqrsr+tF6yGvMA80J8h6IRIDOvu/F
	N17sV7xdcuHbMnJplufe80EyKWSczZdRuJ/6hue1LFplDKFa+jVsGPZ6YJLxUUtEdUSSBQzUA6OLT
	K1G5EL7ndAeSF3nc5ThkV7JWuRifGu0MYmAo4Wb4XDTQmRfknTlXYu3J0hY8+atew6xjQQ92jyASt
	IDNrjaPK5X9VNUImI/1pDBxFO5g9PxqZRY0cxdlp9UJ1e9fZuVun1pTbI4JbgYou2PoqcNGrE2mSi
	r+eJrWDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8j4m-0000000H6SO-1oIf;
	Tue, 14 Oct 2025 17:44:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8j4k-0000000H6SE-0buA
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 17:44:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 91EFC60409;
	Tue, 14 Oct 2025 17:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B73C4CEE7;
	Tue, 14 Oct 2025 17:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760463881;
	bh=PND3tMFcHSXQbftmY3sVLMvaNBKZSZ0hGpr0vDTs9sE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hvL3sS4O0/9Rp25fZny11LsDbx8NYa863vhybCfL5A96ugwuGYbS5uKASWQbsO200
	 XT3CeYL63+CYtUITLF0WuMgsTYwHiAApLc3S3MmF+BQXZTv8hwTu3kqyddnK1nYZg8
	 0NXQZD1JNENF/DcAfg8vSUlyuT0aiqfqk9F34lU3rEUBQQBVEdxyBpWxejZGZ6QzF3
	 eD9HP7P1Nv9iCxnEFYKrat/ahxk3u0SsEjezu4HfXs/iRmW4AEwmeLi8a5jorS8npe
	 d7E3UqwiFejKguvpLz1t90LebXig7Fgkys2bK915snVhBqj41dUvFK1k3e3sZ37A3J
	 Vke1bYn3IQVJQ==
Date: Tue, 14 Oct 2025 18:44:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Lucas Zampieri <lzampier@redhat.com>
Cc: linux-kernel@vger.kernel.org, Charles Mirabile <cmirabil@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <dramforever@live.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/3] dt-bindings: interrupt-controller: add UltraRISC
 DP1000 PLIC
Message-ID: <20251014-petted-papyrus-435129236562@spud>
References: <20251014154100.168236-1-lzampier@redhat.com>
 <20251014154100.168236-3-lzampier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20251014154100.168236-3-lzampier@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============7830882144511315139=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7830882144511315139==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SBMBPhePSwNwsQCs"
Content-Disposition: inline


--SBMBPhePSwNwsQCs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 04:40:56PM +0100, Lucas Zampieri wrote:
> From: Charles Mirabile <cmirabil@redhat.com>
>=20
> Add compatible strings for the PLIC found in UltraRISC DP1000 SoC.
>=20
> The PLIC is part of the UR-CP100 core and has a hardware bug requiring
> a workaround, so the driver will match on the more generic core-specific
> compatible (ultrarisc,cp100-plic) to apply the quirk across all SoCs
> using UR-CP100 cores.

The exact driver behaviour itself is not really appropriate here, all
you need to do is say that the core has the bug!
With the prescriptive bit about driver matching behaviour removed,
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: changes-requested

>=20
> Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
> Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml       | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifiv=
e,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/=
sifive,plic-1.0.0.yaml
> index 5b827bc24301..34591d64cca3 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> @@ -74,6 +74,9 @@ properties:
>                - sophgo,sg2044-plic
>                - thead,th1520-plic
>            - const: thead,c900-plic
> +      - items:
> +          - const: ultrarisc,dp1000-plic
> +          - const: ultrarisc,cp100-plic
>        - items:
>            - const: sifive,plic-1.0.0
>            - const: riscv,plic0
> --
> 2.51.0
>=20

--SBMBPhePSwNwsQCs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO6MAwAKCRB4tDGHoIJi
0gnNAP9TKWqhJhzUUp3cCJPe5+VCmmPgdq2b1gK6o5qQaZNGSQEAvjL2WCBzA58u
c8FoKcIciUJjkEw/LooNWCUxOKL2Ywk=
=cYxS
-----END PGP SIGNATURE-----

--SBMBPhePSwNwsQCs--


--===============7830882144511315139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7830882144511315139==--

