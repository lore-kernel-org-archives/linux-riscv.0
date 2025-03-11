Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79007C28B2F
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 18:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ms9PHvbIIyOsMYNz8pLHS0bwo6ecFKeVF1S/ATAYcSo=; b=junqahj+BXYBq9gluTJ6oo2zdS
	DwoX3j+JDrm/V2MxHv7GS96x1Msb0QK/CzAF9K4bpoNbN6NoAqu+zyw4LwaQ8v+FNq/Mu5dhtBTeH
	GdTOIVowx9pWQkbJwAqU8SsUg7q+azBack/o5+4epPqnzFA+NKfTXEDmfUl4fcuyhgm6MLGFDr/l3
	y43Mc5MvR/4cXBkvKhrLmxvO5MeSzAtcv8RrpDVM+SJn2XBJav5tJc8kEoZMk7ELebmsqqn1l2t3x
	tb5pN8FYiED9M8mE+Dd7vV70C56E2l+FRR0p8j7eMtvAlEXzVjnJhBOHZXSOIy6ML52g6g+JQo3XZ
	AyU1ufQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4Rs-00000006duT-08QM;
	Tue, 11 Mar 2025 18:35:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts485-00000006arb-0gV2
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 18:15:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5D15BA460C8;
	Tue, 11 Mar 2025 18:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62BEDC4CEF1;
	Tue, 11 Mar 2025 18:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741716900;
	bh=qKC9xsxTullwYiRAcFeKtLDDwqjv7fFwHbm/txds7og=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a78aZzCJtVPS47kMKaz+ebwHuaS9mFA8vMhn8ALHLlquew2QCtmomYFfe1PbUuhE5
	 wEzIlk1N2DEQwJOUeioLPweuxGPAAq8e9xLZKuAZL5SMlApnTp0fVWWii45x7SLWOj
	 ggeEtO+c1qQSioX2uixE21ruN8hyRsdsBLXwktbSD6pS+yFs4OaC7RE4HuZ5ZE48Aa
	 8QlVEQnDF91m9GHrclBPPFwY6dIBBR4jddZ7yWcXaDgflUmnxSUxZphjkqIJTdAN6q
	 40XTQZ/VD2Tuu+wyN/NMxoxD1cyqtR47LpzxzCJ4KS6/vL9ZBJn7cHUQHZI8UohfR1
	 5gHZNrWZXcBAQ==
Date: Tue, 11 Mar 2025 18:14:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl, Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] riscv: Add Kconfig option for ESWIN platforms
Message-ID: <20250311-cache-trance-c47cf760b587@spud>
References: <20250311073432.4068512-1-pinkesh.vaghela@einfochips.com>
 <20250311073432.4068512-3-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
In-Reply-To: <20250311073432.4068512-3-pinkesh.vaghela@einfochips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_111501_277040_46D5EC84 
X-CRM114-Status: GOOD (  14.50  )
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
Content-Type: multipart/mixed; boundary="===============5385903063550586480=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5385903063550586480==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gTWFNBVZUIgcSRSc"
Content-Disposition: inline


--gTWFNBVZUIgcSRSc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 01:04:24PM +0530, Pinkesh Vaghela wrote:
> Create a config option to build ESWIN SoC specific resources
>=20
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  arch/riscv/Kconfig.socs | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 1916cf7ba450..35594e365ca6 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -1,5 +1,11 @@
>  menu "SoC selection"
> =20
> +config ARCH_ESWIN
> +	bool "ESWIN SoCs"
> +	help
> +	  This enables support for ESWIN SoC platform hardware,
> +	  including the ESWIN EIC7700 SoC.
> +
>  config ARCH_MICROCHIP_POLARFIRE
>  	def_bool ARCH_MICROCHIP
> =20
> --=20
> 2.25.1
>=20

--gTWFNBVZUIgcSRSc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ9B9nQAKCRB4tDGHoIJi
0piOAQDBEp6shZBbErVBsFvqooF6qHFZVJBgt99fCviN3m0tJwD/TPRPqGdZYreb
d8Thviu+G4uckrxwOoQuXDLeFCE0Bg8=
=Xehl
-----END PGP SIGNATURE-----

--gTWFNBVZUIgcSRSc--


--===============5385903063550586480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5385903063550586480==--

