Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB33C54EBD
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 18:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7N9Jhl3ig3Clbw5zmWcZUrfp5e/B106R6g6a9ynRp8=; b=GHRvzCQvrTMxVqsbkWRM66UFS6
	K9FiLhL88oPniruK+b/1QDs6Cv7u6dKFIstw/gGP6kGDDLsz6bL+YwX3xDxdGRPg4xIa+r9WJ7edN
	IiTS/U/IugqnSptkf7okm8ah+4QRU6mH7oNFSdxO9WhaoQIj3MaKj4vahB5ivFg0PnI8VXShTzoqI
	3ySH1TbNaK5fAUq6pVDRapHs+nhGEmXWjfUSW3jmlsYwmVwTGC5L/T2E0Yaz6CTJqiWsGE3iK4/FX
	KBgDZLpAR9xLMnz6x/ibH65T5aGk2hatczLFUzRIQF2UZpFqzHolBi7sN+zULhhKmP3CMs+dHvg74
	FoQTV06w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEwX4-0038MI-SU; Mon, 09 Jan 2023 18:06:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEwTi-0036jv-MK
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 18:02:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DEEAF612BB;
	Mon,  9 Jan 2023 18:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA426C433EF;
	Mon,  9 Jan 2023 18:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673287353;
	bh=yf5mr/XUHMGP26V3S8whUabC4LgE+gULhklh2fekhqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tiKWcPvN2EP9szwQsYz8wiktbRFB/Vvb73jkesKsu/8tsSCKdOBPIdAzDuujQtsW3
	 qWxpR1JnsqQSlsveciFG6w6eRqIjuoINTlKiAQaWslGgzSKYhFcdqsrk3ge8JB72IU
	 LbM51uM+GdmIaJGCmYJFjZTirYfdv21Pw7TfddEMK3tR5E2PzJ9ZhL2+s1pB/iZgYW
	 W9mISuZ8B783dusHCq2VfeGxmhr/ZCyJ8yM2+Y4WJsbgDUsao+E3P2sXRI0ZNlkQn3
	 ElHr5mQMgNs4dw0VsjuCwKLv28kSl+Q5rIp7Q/0AZE9SVPWCFHkumYINasEetSqL2Z
	 XSKMJkdlsT5Lg==
Date: Mon, 9 Jan 2023 18:02:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>
Cc: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/3] riscv: dts: starfive: Add TRNG node for
 VisionFive 2
Message-ID: <Y7xWtFZO/Y7GaYRQ@spud>
References: <20230109165249.110279-1-jiajie.ho@starfivetech.com>
 <20230109165249.110279-4-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230109165249.110279-4-jiajie.ho@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_100241_239470_CCDEEC92 
X-CRM114-Status: GOOD (  16.39  )
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
Content-Type: multipart/mixed; boundary="===============3911082465578620683=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3911082465578620683==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JVAKPLOcMe7iVNga"
Content-Disposition: inline


--JVAKPLOcMe7iVNga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey folks,

On Tue, Jan 10, 2023 at 12:52:49AM +0800, Jia Jie Ho wrote:
> Adding StarFive TRNG controller node to VisionFive 2 SoC.
>=20
> Co-developed-by: Jenny Zhang <jenny.zhang@starfivetech.com>
> Signed-off-by: Jenny Zhang <jenny.zhang@starfivetech.com>
> Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/d=
ts/starfive/jh7110.dtsi
> index 4ac159d79d66..3c29e0bc6246 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -455,5 +455,15 @@ uart5: serial@12020000 {
>  			reg-shift =3D <2>;
>  			status =3D "disabled";
>  		};
> +
> +		rng: rng@1600c000 {
> +			compatible =3D "starfive,jh7110-trng";
> +			reg =3D <0x0 0x1600C000 0x0 0x4000>;
> +			clocks =3D <&stgcrg JH7110_STGCLK_SEC_HCLK>,
> +				 <&stgcrg JH7110_STGCLK_SEC_MISCAHB>;

Which clock source is this? I see syscrg and aoncrg in the v3
devicetree:
https://lore.kernel.org/linux-riscv/20221220011247.35560-7-hal.feng@starfiv=
etech.com/

Have a missed a patchset which adds support for this particular clock
controller? At the very least, I don't think one has reached the
linux-riscv mailing list.
The clock driver patchset only has aoncrg & syscrg:
https://lore.kernel.org/linux-riscv/20221220005054.34518-1-hal.feng@starfiv=
etech.com/


> +			clock-names =3D "hclk", "ahb";
> +			resets =3D <&stgcrg JH7110_STGRST_SEC_TOP_HRESETN>;
> +			interrupts =3D <30>;
> +		};
>  	};
>  };

Thanks,
Conor.


--JVAKPLOcMe7iVNga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7xWtAAKCRB4tDGHoIJi
0uNDAP9jdeHkVB4dTr5svGhfs6/VBx1ob6hYWtNCnd0OmytrFQEA/69ADWZjFeQG
DA1v1P6YpTm6kYvzkrt0UNumEQ3suAo=
=V4up
-----END PGP SIGNATURE-----

--JVAKPLOcMe7iVNga--


--===============3911082465578620683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3911082465578620683==--

