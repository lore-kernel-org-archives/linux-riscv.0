Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA03FCD4F49
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 10:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGuydBVaTWEUHushFc5x76bYooQW/C6w9/1pijmJ4UI=; b=L+eMVBxOS89on7aunJkzF6yDVp
	LAzOhuO1jOKR5A2u3sJC84nwVRvuNhWlxFbEi8HlVdREirDG41ygLvvppjQrkJB0x3HuQ4wm5vPZp
	IPi/jLeAwLtpBk/dpUKVtMRq7cfTQA20VoYcyqXm23ulitOv1K/Gt0NnurLTe9STlilQ7o7oJfUUF
	1Jmsq7Ss6NhN39dLNCvjt6boRSHZcYrXxBVmPhKB3ce9XSXcPZUoOfYd9Gb11Q2UeXasEMb4IbXku
	Gs+Zp49jzYl+xKJeVC/W00Ot0sSRmg5Lj6nPAMtmwgrvzCqCDknMu67iEPdvea/FgLRU55JJ2aEN+
	EnMJm7mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjd77-008ghJ-2F;
	Fri, 22 Sep 2023 10:10:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjd74-008gfO-3A
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 10:10:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6FE77B81F3C;
	Fri, 22 Sep 2023 10:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 414A5C433C7;
	Fri, 22 Sep 2023 10:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695377416;
	bh=qs6BuWtU48wuJV1hE2FTPkk1Gp3WAFAPmGlZE30SDtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pqqGDqA84PemrzoFyHVx8rz37BMj3iNrdZJXtYP6pIR4gpcn5DUZk92WSSS2XQk4a
	 ARQILOyvPvBptaRiNIqPZiCSjKZwmZvsiQJ7qizCebai5dFqC/DtN0FrbipbTnm9GY
	 L0n807vXhpLbgVTVVuwX+z3fOKlPscV6cP/sUN/Peq5Z++UhdTRE/KRnFUInYUUk4O
	 D5yYWrpi9bamvkJ0vvq7FQMFQt81MLzSNnYGdrVuHAwX/xtORauLMDpLVBJuID1qto
	 I5GPva9QkOnWtY9ZR3js7SyJmqCragXR0/Z1pJXdhC+sTNGZtvRXnH3mC1zW+uuzZw
	 B+8SiBiXTVuqg==
Date: Fri, 22 Sep 2023 11:10:10 +0100
From: Conor Dooley <conor@kernel.org>
To: shravan chippa <shravan.chippa@microchip.com>
Cc: green.wan@sifive.com, vkoul@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, conor+dt@kernel.org, palmer@sifive.com,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	nagasuresh.relli@microchip.com, praveen.kumar@microchip.com
Subject: Re: [PATCH v1 0/3] dma: sf-pdma: various sf-pdma updates for the
 mpfs platform
Message-ID: <20230922-uninstall-catchy-0986e5b03ae5@spud>
References: <20230922095039.74878-1-shravan.chippa@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20230922095039.74878-1-shravan.chippa@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_031019_177037_966C2858 
X-CRM114-Status: GOOD (  12.19  )
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
Content-Type: multipart/mixed; boundary="===============7567361581128731471=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7567361581128731471==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RO6bI1l+vKniNdqv"
Content-Disposition: inline


--RO6bI1l+vKniNdqv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Fri, Sep 22, 2023 at 03:20:36PM +0530, shravan chippa wrote:
> From: Shravan Chippa <shravan.chippa@microchip.com>
>=20
> This series does the following
> 1. Adds a PolarFire SoC specific compatible and code to support for
> out-of-order dma transfers=20
>=20
> 2. Adds generic device tree bindings support by using=20
> of_dma_controller_register()
>=20
> Shravan Chippa (3):
>   dmaengine: sf-pdma: Support of_dma_controller_register()
>   dt-bindings: dma: sf-pdma: add new compatible name
>   dmaengine: sf-pdma: add mpfs-pdma compatible name

It looks like you're missing a patch here that adds this new set of
compatibles to the devicetree?

Thanks,
Conor.

--RO6bI1l+vKniNdqv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQ1oAgAKCRB4tDGHoIJi
0hETAQD3M7YmAYcVjH2SfvhEE8ixW2UyQGqhtPDtF4p+qJZUlQD+PK9qylqRlXx7
sWZDm79u7daNsqBrQd5W434CWITDHgg=
=wohC
-----END PGP SIGNATURE-----

--RO6bI1l+vKniNdqv--


--===============7567361581128731471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7567361581128731471==--

