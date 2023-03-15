Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6BEC61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 18:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=li39uQUFdlMRaETZbr5MTOxpfrY4M4P8Jpb4nvgmGkc=; b=ChgYWgHDzvkyGUOkgzwHKDQovr
	e814uJOBEvHhfyiDo/aS5hkVvxc6RDrIkLjJtSTTbLz9Stl6izebBqK5eLg+Kv2gNVcy77ZaCfRui
	MRbn0D7LuYyvfvVOuAU6OOlVK6CMmo70j1FDYH8+Ln7WFTOj4Oaq/OUpaVFpacuCu13ZhYYKFLLY6
	SCiXwfLboFDNOGoOR9PBZhrj730CeJcZBBqKiCeCIt/jxktlb5lm4BSsSBR8WyEa1Y/7155YYlNz1
	7I7vAVljXY4pqF+hrnmhk7WXzUJzXXNslS7xd42v1iGpe6kYxs+dngd8ccoR5f6n1XNoE7k0dSIz+
	ls7Rfx6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcWK0-00EH2D-2u;
	Wed, 15 Mar 2023 18:58:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcWJy-00EH1g-1w
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 18:57:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 82315B81ED4;
	Wed, 15 Mar 2023 18:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0B02C4339B;
	Wed, 15 Mar 2023 18:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678906675;
	bh=I0UDNiTMp2YFiKPkZl2w3FQBWHX0Z4P3ko4mnfKYiU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CgI2bVMZ4EIKrXRngubGO2dMG8A16X/Dk8/Wkg9p/g0RotfV3jwuIWT/z2k4wIamE
	 YMdxhRUVyOmBvtzv/Pw5EDBW2DqHGX2/Dcm7GDiDeZKwcVk/8434hVKzBg8JhQOIrO
	 g0cCsi7y8YDlfmA+FE00dWC4PQ+PZNTEEkeGtezKW/QkYZwlm3B1WWFJ3Rvesx1gN5
	 SsxZv1mnpun5bpJAf673pXRt+Ds43HWewyqZA1aw1lxLxJBiien9VJTyFbIvhXpNrp
	 63eoL1eNcylWi9Ym++QwggKrhjBd1GmGP7zCxP69bzuom8JvFJ34mGfyhnQ7vyLdKg
	 PzI5Ih1talEBA==
Date: Wed, 15 Mar 2023 18:57:51 +0000
From: Conor Dooley <conor@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>
Subject: Re: [RESEND v6 2/2] riscv: dts: starfive: Add syscon node
Message-ID: <a3338a34-11f7-4770-a475-95e1a83f9cc9@spud>
References: <20230315055813.94740-1-william.qiu@starfivetech.com>
 <20230315055813.94740-3-william.qiu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230315055813.94740-3-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_115758_786632_152A5A6C 
X-CRM114-Status: UNSURE (   7.46  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============0643300202097726058=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0643300202097726058==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="032GwhlaTlfyOX8z"
Content-Disposition: inline


--032GwhlaTlfyOX8z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--032GwhlaTlfyOX8z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBIVLwAKCRB4tDGHoIJi
0mLnAQCc1uls/STlQZJH8Fn8Ps+XS2C92fN2HH/f2T8WT3W6dQD8Ddbp0qYDv6WP
FZ1JLXopXlhGxhijr1hrMW59jr/4+Qk=
=fyIZ
-----END PGP SIGNATURE-----

--032GwhlaTlfyOX8z--


--===============0643300202097726058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0643300202097726058==--

