Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F195DCDB474
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 12:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5bCFebZk5ghu45XU213PlYwk8Wnlr8FpIvAt4JnJLNQ=; b=f56ulGFpj03g+sy7hk1e6VWUp6
	xTAauDoIkrY6Wh2b72tGSf0yCEK5MI7yFgvv38hKo9L/BvVjSeMQx0NXNT0uFrOxGi0DxD7npmygO
	CMB1aJECwN+wXLoSJiRF7fQITy3BF69uY8nOsc9B5B9bJMVbaeZmE08e0CFZrWc1V2xHfXqW/pNpJ
	tU5R8vHpRush15wqu8c2vbBfMsXi4WYCehSGDDYT9jd8QVhypc0WTiSSa2so0XD2l82CKMAPQ/Ktq
	kYDejoi4RVqUQGJhnOUqzGoINFWKF8KqKm45cuULLo0Xd80KPTMmnT7eDRdacqbeDYWD3RWZygnOU
	bafc8O3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quu01-007LQI-1q;
	Mon, 23 Oct 2023 12:25:37 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qutzx-007LPT-1g;
	Mon, 23 Oct 2023 12:25:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6CA76CE23FF;
	Mon, 23 Oct 2023 12:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECCAEC433C8;
	Mon, 23 Oct 2023 12:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698063930;
	bh=pPk74+A5jkmqRdGnbaBEtM5+7L3q3Pdzznl2EygyWmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jADyhn3KDxsVw0aQWNmTregKnwEQBXXcSO49wnCXUkat73pY1hI6KtDnDFQm34yNX
	 7MvHRIx6WL0/cr0s+SK8wS+umGybz2ywN6GuGJC+h5cwD6EifeF5Yk9iUAbDHVrZiZ
	 M9PM0A47pVnRQOKjDrbDLohtInrVJPP7UBLYPglWs/N3lKwNjGeI9gTbM1/uFN1TVs
	 1hIkOP53y97pl2AyOOlYg6AqlBMutyS5PsKih/qqjwfPluxI3+/TVLtL85yMRfmOQD
	 5YTDUdsWTh2M5gRS7LH1ewaNVErSW7f16kdbtGU1DJ2meXbo2aUH1AJFHtx5XHAOAw
	 Mp0AjZVVBiRIw==
Date: Mon, 23 Oct 2023 13:25:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Yu Chien Peter Lin <peterlin@andestech.com>
Subject: Re: [RFC PATCH v3 RESEND 09/13] dt-bindings: riscv: Add T-Head PMU
 extension description
Message-ID: <20231023-facility-phonebook-1be493346bf1@spud>
References: <20231023004100.2663486-1-peterlin@andestech.com>
 <20231023004100.2663486-10-peterlin@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20231023004100.2663486-10-peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_052533_902812_34F5DB32 
X-CRM114-Status: GOOD (  16.21  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: multipart/mixed; boundary="===============1468772764460087531=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1468772764460087531==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qxXWr68G1YeFpESf"
Content-Disposition: inline


--qxXWr68G1YeFpESf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 08:40:56AM +0800, Yu Chien Peter Lin wrote:
> Document the ISA string for T-Head performance monitor extension
> which provides counter overflow interrupt mechanism.
>=20
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
> Changes v2 -> v3:
>   - New patch
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index cc1f546fdbdc..5e9291d258d5 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -246,5 +246,11 @@ properties:
>              in commit 2e5236 ("Ztso is now ratified.") of the
>              riscv-isa-manual.
> =20
> +        - const: xtheadpmu
> +          description:
> +            The T-Head performance monitor extension for counter overflo=
w. For more
> +            details, see the chapter 12 in the Xuantie C906 user manual.
> +            https://github.com/T-head-Semi/openc906/tree/main/doc

This really needs to be linked off to a specific version of the document,
lest there be revisions that remove the document from the repository and
to one that is in English.

Cheers,
Conor.


> +
>  additionalProperties: true
>  ...
> --=20
> 2.34.1
>=20

--qxXWr68G1YeFpESf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTZmLwAKCRB4tDGHoIJi
0mvTAP9Q91MnqFwF0cSPMA8pl6M5OOys/V88dfOQPFy4pUXhywEA/H8ZjdArLD56
bf3grpubAS0ckkD2IOWbV6DHx3P86AQ=
=TH1A
-----END PGP SIGNATURE-----

--qxXWr68G1YeFpESf--


--===============1468772764460087531==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1468772764460087531==--

