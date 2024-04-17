Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3983C04FFF
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 14:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xo27WbPselHEWDsCQWjy/SD8FbQkMInoycpPwBe93Yg=; b=li+CqiNnCyj6TYDKAOXSXFXuvK
	AR4/F14sByZCubK6WSj8w7waJNtl8xOHuM24qsvBbWo540alqPjDlRylZAR6fzZIeCJKO0JCpT9iy
	ookheO0OoSFGQO8/xC+kJdpmuPr7Ox/BbMe3kAs4X+jJBfiMLmy1DhYSOMB8L1GIIQCDZ56IIP1mD
	nLd53dL2QwkYuEsr16vUB7Q8pwLo4V25IhsJUOkrt8YM/xQEm9RbnqU2NKBsWuROn817+TdDUVNVy
	BH9sgEzDxMYRxYAe31G9Q4xlnIcx2YFTFffSzPSelR2NUprlMJECvrGbmlIYXSmDY6R1ijhks8N9i
	RWwuVl2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx6cS-0000000GRDR-04p2;
	Wed, 17 Apr 2024 14:50:40 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx6cN-0000000GRAj-3NvL;
	Wed, 17 Apr 2024 14:50:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5BC44CE139D;
	Wed, 17 Apr 2024 14:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0ADC072AA;
	Wed, 17 Apr 2024 14:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713365431;
	bh=FykH/T46P+7wCQWaQbgZ5I3yQADVR9jYDVfl8lpXZM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S0TE9tNy0I6n0GmJCfpRHv5LLvD0sH8KvnXmmKZyKXPN+5gEXa1Q4AzpPYORPb1xh
	 6FZSy9x854VCtsJj3uGAdR0tZAl4NgVGuKIpFvzOv7wQ/K1slgqe+H/pZwCHuXNc+I
	 OdqHsqKaB1sZzrNKlgxgQSHT6SVN4ew8Xt1FvR89JkG94e9Y5WUwwr6m3CcTva7TVU
	 axGqATm2OFiDzneSdmBmoG6CAyUFtgtaE6OtFXe+jyNkvltWV5OGGXBYFS1/HqHN+1
	 VATui1UTMFtHkyEBpfjqFA3OoMm0FuBmS5Qtw6Vov597ADDOjsY7mHjcUEne6ZAG6x
	 lLhgT/5aLIfzg==
Date: Wed, 17 Apr 2024 15:50:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 13/17] riscv: vector: Support xtheadvector save/restore
Message-ID: <20240417-semisweet-willed-1ce1098d8c41@spud>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
 <20240415-dev-charlie-support_thead_vector_6_9-v2-13-c7d68c603268@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240415-dev-charlie-support_thead_vector_6_9-v2-13-c7d68c603268@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_075036_230155_4855BB9D 
X-CRM114-Status: GOOD (  23.91  )
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
Content-Type: multipart/mixed; boundary="===============6117563121103748742=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6117563121103748742==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TWtuz8+j2Sj8ixHN"
Content-Disposition: inline


--TWtuz8+j2Sj8ixHN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024 at 09:12:10PM -0700, Charlie Jenkins wrote:

> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index 6727d1d3b8f2..f42eaa8178e9 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -33,10 +33,24 @@ int riscv_v_setup_vsize(void)
>  {
>  	unsigned long this_vsize;
> =20
> -	/* There are 32 vector registers with vlenb length. */
> -	riscv_v_enable();
> -	this_vsize =3D csr_read(CSR_VLENB) * 32;
> -	riscv_v_disable();
> +	/*
> +	 * This is called before alternatives have been patched so can't use
> +	 * riscv_has_vendor_extension_unlikely

() after that function name please.

> +	 */
> +	if (has_xtheadvector_no_alternatives()) {
> +		/*
> +		 * Although xtheadvector states that th.vlenb exists and
> +		 * overlaps with the vector 1.0 vlenb, an illegal instruction is
> +		 * raised if read. These systems all currently have a fixed
> +		 * vector length of 128, so hardcode that value.

I had this written before the meeting, so pasting it anyway:
-- >8 --
=46rom 5ed25d0f841e755b8dd4f1f6a3ea824601758d8e Mon Sep 17 00:00:00 2001
=46rom: Conor Dooley <conor.dooley@microchip.com>
Date: Wed, 17 Apr 2024 14:39:36 +0100
Subject: [PATCH] dt-bindings: riscv: cpus: add a vlen register length prope=
rty

Add a property analogous to the vlenb CSR so that software can detect
the vector length of each CPU prior to it being brought online.
Currently software has to assume that the vector length read from the
boot CPU applies to all possible CPUs. On T-Head CPUs implementing
pre-ratification vector, reading the th.vlenb CSR may produce an illegal
instruction trap, so this property is required on such systems.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
We could actually enforce the latter since we know the compatibles of
the relevant CPUs and can tell if xtheadvector is present.
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentat=
ion/devicetree/bindings/riscv/cpus.yaml
index d067f2a468ee..2a6449a0f1d7 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -95,6 +95,12 @@ properties:
     description:
       The blocksize in bytes for the Zicboz cache operations.
=20
+  riscv,vlenb:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      VLEN/8, the vector register length in bytes. This property is requir=
ed in
+      systems where the vector register length is not identical on all har=
ts.
+
   # RISC-V has multiple properties for cache op block sizes as the sizes
   # differ between individual CBO extensions
   cache-op-block-size: false
--=20
2.43.0



> +		 */
> +		this_vsize =3D 128;
> +	} else {
> +		/* There are 32 vector registers with vlenb length. */
> +		riscv_v_enable();
> +		this_vsize =3D csr_read(CSR_VLENB) * 32;
> +		riscv_v_disable();
> +	}

--TWtuz8+j2Sj8ixHN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh/hsAAKCRB4tDGHoIJi
0uymAQC52tKEjWhnlrK5EZxs57FTgtZequO5iT1oxcXhr1buWwD/eH4/QhI+A7+a
rSSXaCKwy6W28YxEUDpHe9r7Re8SMgs=
=l2tD
-----END PGP SIGNATURE-----

--TWtuz8+j2Sj8ixHN--


--===============6117563121103748742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6117563121103748742==--

