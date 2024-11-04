Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EF2D132B8
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 12:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7K6SqCkZV1m27aJLzPLQmlNoHX7wAqr5m1jmZpvNOk=; b=zzywZdfERMTnbE5uUqqRCvzXsM
	oDBWOXcBCeaYpGu5P/AP8sSSbx0h8weW5SZhENz4koyqGlG4amT0N/0JPaKPp7IEFdR2i0XlPIOB4
	uUeGlpsewVOrecs863sjmyFMnV1HWfQOg9lh7uRSKRRQTruahnDm3w1ozD62ofX7pUNhpQk5XEAr9
	6nLNTw0849XOhko6ca+Ek65JOLy5setzuKPLF9JoCYGGnUK3qMhthLDN2hGSPeYC5kDi/JeyQXxvD
	3dAmvL053Pd53/Nl5xEDfFaQR8W/LxQXADY/JKhS58+jjIyBJCSuvBVk3osHBKpN1GTgSz3/Ar+tE
	jNCoJWTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7w3A-0000000Dfkw-3QIy;
	Mon, 04 Nov 2024 12:19:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vtB-0000000DeEM-3zGX
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 12:09:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 642F85C558B;
	Mon,  4 Nov 2024 12:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D23DC4CECE;
	Mon,  4 Nov 2024 12:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730722136;
	bh=SXIvHTd084348Ke5hjT7V7ym8x/naf+cJdPZdoJW6Pc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DDO3E/mOiAY0758tF5tnLUHufD1GRhv9AYEu6ZOgOJMVl/Z9sT/9aAecuWawlLAw/
	 aoCdYv/rP2yWtq8edvyWN9n8P2E/WBAd3bFcz02dvkcbQrpjh9WPfseqjwJmWX4Ilx
	 /5uzJ0QMbZRy6c9zQCGMIFIJ2wVm6ew5LHNzLl2QTpXJYWBgiECnbxjtRhIip8F6fu
	 gHAg4WBkOq/FyPqSciLh2MlHTIaufVD1QRdJTBgs9WiJpAp2KuVMSVdavDKwRFThan
	 kP+wTniL7qDjWE7vVNfuYmpCTJpoVinLpsCmhe3yt/kPZa8wfbIk4a/SNRjAblFLvo
	 XEC7F/l9vsJFw==
Date: Mon, 4 Nov 2024 12:08:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andybnac@gmail.com>, Xiao Wang <xiao.w.wang@intel.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: add bfloat16 ISA extension
 description
Message-ID: <20241104-clean-osmosis-680d64616712@spud>
References: <20241103074959.1135240-1-inochiama@gmail.com>
 <20241103074959.1135240-2-inochiama@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20241103074959.1135240-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_040858_054862_FB14D5D5 
X-CRM114-Status: UNSURE (   9.07  )
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
Content-Type: multipart/mixed; boundary="===============0325190111342955183=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0325190111342955183==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="chiq5kZJ1B12zV8S"
Content-Disposition: inline


--chiq5kZJ1B12zV8S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Nov 03, 2024 at 03:49:55PM +0800, Inochi Amaoto wrote:
> @@ -605,6 +623,33 @@ properties:
>          then:
>            contains:
>              const: zca
> +      # Zfbfmin depends on F
> +      - if:
> +          contains:
> +            const: zfbfmin
> +        then:
> +          contains:
> +            const: f
> +      # Zvfbfmin depends on V or Zve32f
> +      - if:
> +          contains:
> +            const: zvfbfmin
> +        then:
> +          oneOf:
> +            - contains:
> +                const: v
> +            - contains:
> +                const: zve32f
> +      # Zvfbfwma depends on Zfbfmin and Zvfbfmin

IMO these contents are statements of the obvious and not needed, but I
wouldn't bother respinning for that alone.

Acked-by: Conor Dooley <conor.dooley@microchip.com>


> +      - if:
> +          contains:
> +            const: zvfbfwma
> +        then:
> +          allOf:
> +            - contains:
> +                const: zfbfmin
> +            - contains:
> +                const: zvfbfmin


--chiq5kZJ1B12zV8S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyi5UwAKCRB4tDGHoIJi
0lKHAQDEI0kOz+OHaroUU4xjzlawxX4O6ZtbtSJqYh5MNgmuPgD/YnypDRlmGdwJ
65/KZHetJzgdli/qMjrnTBAk5HF8pAs=
=SPCS
-----END PGP SIGNATURE-----

--chiq5kZJ1B12zV8S--


--===============0325190111342955183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0325190111342955183==--

