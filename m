Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06151C36000
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 16:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bu3kVqGc3SIWBmCqtgNNvonYOuCZ/yWfJ+asADi8DHo=; b=mUa8ML+YzR16W4UpAyKqxZuUxT
	INl8k+bBhdYnh+1uFsVRl5OUwHuZQM7dXgEUe7Q3Boul6bGb6+shfmO6a0+P626H5GZRqr+F16Qy7
	LHEZnA687d8XzNoKnm41WMG8haZ0yeAZsj9j6QH9KBrnRpUdnKwob5w70YH6t2PboJ8yTVa2IhXLg
	e0CedMO1xQug4yNpyEtQaiwk1WmpCSateyfkUNicAmgx0vfSbAwxaqn001imaFoX6Kna6zLnnyGcQ
	R/GO6kHHxKHSYE8ojfxqi4Pt5GrsE8ecMy6uyBPqFrhd7FHKrX6I3yc8dc1P4rXaVpP5OUyUR5kRJ
	c0dbMo5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvf3m-0000000FStO-0LO2;
	Fri, 21 Mar 2025 16:17:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvf3U-0000000FSnd-3eHG
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 16:17:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E2A2B5C679E;
	Fri, 21 Mar 2025 16:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5272AC4CEE3;
	Fri, 21 Mar 2025 16:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742573827;
	bh=umYqcnZz+agf38qEhHYrPYvQsxuxpuc1Mi3ge1ApdAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=itDBty/KNEjPSwYMNa8z9uFKfsH0bVgmDLPIEi8PauRGi2IsNeIKCWCHA+7pug8TT
	 HQGf94iD4NvsRp/7HPBYE0eBFgeIVSrDYjvkCaHWzwfWaauADPnUSFUHGyerp/SbAZ
	 +LV1En1EFRXbtrXjhZXDbkGW/WllYWVrD+e7Fh+5rVh/qNWtfy1+8ZXyyMGvPkHL2c
	 77sS5sVOpcqkOyU5IxGJNnBXBprsQ0Nn+f9+zIDJtt38hg4h0iZiEvDPGkRbyJHv+O
	 OoLu72AYlRCo291i+Nvavko7MTXmPvzRrhF5k1RqmO/nxl4ApxB8OmBk5yPIV9Upmr
	 pZr243kG80S9Q==
Date: Fri, 21 Mar 2025 16:17:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Nick Hu <nick.hu@sifive.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3] dt-bindings: timer: Add SiFive CLINT2
Message-ID: <20250321-crazily-attention-1aeb67606cf3@spud>
References: <20250321083507.25298-1-nick.hu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20250321083507.25298-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_091709_020581_B10380AB 
X-CRM114-Status: GOOD (  16.66  )
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
Content-Type: multipart/mixed; boundary="===============5348263165860965415=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5348263165860965415==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dT2myeOCt2U0MUNc"
Content-Disposition: inline


--dT2myeOCt2U0MUNc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 04:35:06PM +0800, Nick Hu wrote:
> Add compatible string and property for the SiFive CLINT v2. The SiFive
> CLINT v2 is incompatible with the SiFive CLINT v0 due to differences
> in their control methods.
>=20
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
> - v3 changes:
>   - Add the reason for the incompatibility between sifive,clint2 and
>     sifive,clint0.
> - v2 changes:
>   - Don't allow sifive,clint2 by itself. Add '-{}' to the first entry
>   - Mark the sifive,fine-ctr-bits as the required property when
>     the compatible includes the sifive,clint2
>=20
>  .../bindings/timer/sifive,clint.yaml          | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/=
Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index 76d83aea4e2b..34684cda8b15 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -36,6 +36,12 @@ properties:
>                - starfive,jh7110-clint   # StarFive JH7110
>                - starfive,jh8100-clint   # StarFive JH8100
>            - const: sifive,clint0        # SiFive CLINT v0 IP block
> +      - items:
> +          - {}
> +          - const: sifive,clint2        # SiFive CLINT v2 IP block
> +        description:
> +          SiFive CLINT v2 is the HRT that supports the Zicntr. The contr=
ol of sifive,clint2
> +          differs from that of sifive,clint0, making them incompatible.
>        - items:
>            - enum:
>                - allwinner,sun20i-d1-clint
> @@ -62,6 +68,22 @@ properties:
>      minItems: 1
>      maxItems: 4095
> =20
> +  sifive,fine-ctr-bits:
> +    maximum: 15
> +    description: The width in bits of the fine counter.
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: sifive,clint2
> +then:
> +  required:
> +    - sifive,fine-ctr-bits
> +else:
> +  properties:
> +    sifive,fine-ctr-bits: false
> +
>  additionalProperties: false
> =20
>  required:
> --=20
> 2.17.1
>=20

--dT2myeOCt2U0MUNc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ92Q/wAKCRB4tDGHoIJi
0rQ6AQCiSS55Yt7GDJR+NVBVe/vA621bKXpmgoK5F4s/BCg0YQD/cAZ/JN+9lRZi
SzUkk9S/gW9bBvtexlGOY8rgWEaEmQ8=
=pGkd
-----END PGP SIGNATURE-----

--dT2myeOCt2U0MUNc--


--===============5348263165860965415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5348263165860965415==--

