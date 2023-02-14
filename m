Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26ED2C61DA4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 21:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8WKCrxaPqLabMCpRDHbIQgVkqEjf/PZQc5ATOHHzX4Q=; b=gMqbfT54RGaso2YlqG1y/La+OK
	X9Pb/KsYuIxy+er+OnbQdAWLs4Rte0fQlJWTiw7rtBs6c3wF+5WJxvFvJvu650riO5wPJtfjqrdg9
	I2xXUjhRxtZIK1KQOWGCKdKB4bU5lZb/SdDL1YjedkhIhNly5mvz899FTkb9Cqqy2vImY/JUyQdpo
	+AhzVaHzDt174/1FtLhT2URbo4uyP+tzKObh6M7lRCz87Kj7Zl3izymwo8qm55wgb6yYmICvHez4Z
	62rEgtHfqKb6hcqgMfl8Ob5KkLXUqRP1i+9PYt57UH+yDwmHJeh2priNem3mAg0JGzsYm4H3Dp2qw
	L/7z0G4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS2vv-003aGw-JW; Tue, 14 Feb 2023 21:33:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS2oi-003X5A-R9
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 21:26:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 229C6B81F45;
	Tue, 14 Feb 2023 21:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A0C4C433EF;
	Tue, 14 Feb 2023 21:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676409981;
	bh=clJ0I3LCRmL0vWDC9Hymc1AAmH2ySeO6uZdkjUwkz4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lbGDKwQPY4B0oKJUk6o14xlicXoNxc0n4V2coiARvV23mVAdR6FAc3SapQ2PA3ZAO
	 QqrMCD4oCk1nBYMNrwgoNxlpyvKN69BvhsliiscJW785pYCQqeqfhmNZiQzyEUfFTm
	 etZUNRJwpVhtCsRTwvqBt0T0sDMvpzhrcudbw0kkSSx3sBn6ChRaKa7O5pQ1pQ65Jg
	 FXoGMhIjgwmD5GIZFDG7/igT1vV+2jlUS6GNj6oaomk7mX+G3mfb5O5WpUjXUUxsSG
	 Y+arJSNIYVeFD/kMOgqFscRb68x/O0u9a3/jy/geQolhB7HZb/XRxAkQViuT2OtICP
	 +Jfji91IMBDdA==
Date: Tue, 14 Feb 2023 21:26:16 +0000
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, vineetg@rivosinc.com,
	heiko@sntech.de, slewis@rivosinc.com,
	Albert Ou <aou@eecs.berkeley.edu>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/6] dt-bindings: Add RISC-V misaligned access
 performance
Message-ID: <Y+v8eNlcG+jbB2oy@spud>
References: <20230206201455.1790329-1-evan@rivosinc.com>
 <20230206201455.1790329-5-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230206201455.1790329-5-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_132625_236031_EF7DF907 
X-CRM114-Status: GOOD (  18.88  )
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
Content-Type: multipart/mixed; boundary="===============8526466462637771855=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8526466462637771855==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LZipd+p+IRBav5Wm"
Content-Disposition: inline


--LZipd+p+IRBav5Wm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2023 at 12:14:53PM -0800, Evan Green wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
>=20
> This key allows device trees to specify the performance of misaligned
> accesses to main memory regions from each CPU in the system.
>=20
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Evan Green <evan@rivosinc.com>
> ---
>=20
> (no changes since v1)
>=20
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index c6720764e765..2c09bd6f2927 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -85,6 +85,21 @@ properties:
>      $ref: "/schemas/types.yaml#/definitions/string"
>      pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:_[hsxz](?:[a-z])+)*$
> =20
> +  riscv,misaligned-access-performance:
> +    description:
> +      Identifies the performance of misaligned memory accesses to main m=
emory
> +      regions.  There are three flavors of unaligned access performance:=
 "emulated"

Is the performance: emulated the source of the dt_binding_check issues?
And the fix is as simple as:
-    description:
+    description: |
?

> +      means that misaligned accesses are emulated via software and thus
> +      extremely slow, "slow" means that misaligned accesses are supporte=
d by
> +      hardware but still slower that aligned accesses sequences, and "fa=
st"
> +      means that misaligned accesses are as fast or faster than the
> +      cooresponding aligned accesses sequences.
> +    $ref: "/schemas/types.yaml#/definitions/string"
> +    enum:
> +      - emulated
> +      - slow
> +      - fast
> +
>    # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
>    timebase-frequency: false
> =20
> --=20
> 2.25.1
>=20

--LZipd+p+IRBav5Wm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+v8eAAKCRB4tDGHoIJi
0pLfAQCliZsffpMCiR56h2wbSY9QS5JYkNkV6WZVn6zmd4HGtQEA28WgtVfwkxTb
ekWi8UF52cG+B6xOsdzg1pmIBx7IlQI=
=SICO
-----END PGP SIGNATURE-----

--LZipd+p+IRBav5Wm--


--===============8526466462637771855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8526466462637771855==--

