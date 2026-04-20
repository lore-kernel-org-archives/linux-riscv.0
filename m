Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B82F588EE
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 16:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/pdEeOXA7k33VI1IkPPyjFW/lJb/TWPGzpCrntFoUM=; b=VwkfFeThpI7rZnj47ES3tI9y98
	8SzHM4vIKffLHTIf4pxZvYwnbr8TpZh/0DLouM4YEBRXYbStT4RjwTIkcKfddK9hnnGKXJ5HVt7pc
	8s5bGQnXkGyDQHn+RqU9gYZkNYeUdJ1IVWPM2AHkQ4wGv15ToWHUuqTJ/9iEt+aPHY+Uif/PsBYfl
	/GKMa8b5MRrQk9aaY4y6dNLNUvuO1U1EkbPfprfdnwZYXrm/wLoyX8oSqpPeIBoCPEJ9sPU/hcIcX
	Y2wBMh+ZjuZh1b2AcOozJJI6MPT2YYgWlqEbDxIgaeh3I0+e2vw5dh95D2GiAfU4hZP/NKQzV7Kx7
	v+ZQ20Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wErBg-00000007Om5-1JRM;
	Mon, 20 Apr 2026 16:09:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wErBd-00000007OlX-2qpw
	for linux-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 16:09:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC450444C7;
	Mon, 20 Apr 2026 16:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C31D5C19425;
	Mon, 20 Apr 2026 16:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776701364;
	bh=N7X3thVr7Aj6OO/j5V7YIiSdv1Ezp1OC5G5e8lLAhrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rZsw0v2y+SswDOsApU24v+OL8rK90IOlGv77AU807DfHRlkKBJZmtgDSsCfutYIqU
	 tx1NXi7RTF24AuBeEitm8Bx9FuWEmtKQ1RyLZ3LNwPpSkOfw1HvpfXabjwJFg/8B2c
	 XI2QzhPsDr0+tQyNUBXtvYEolrye7v6uLcCtR2ERlwbLofcjGKQuTOQEGW2+MokRuI
	 yy+CbWvjSsR3m/NT0za4tX7zARTFUz33a5lr0oUhLXEcTzBRXrFT1usIhBTyaaks6Z
	 wsfDmFfJwXGLQ940ZTRudRpaQs42l+9HBfNgz3Cs2jwP/2H1gZ37vf7CRX6j0/+oRb
	 +zIk7GiSzRAwA==
Date: Mon, 20 Apr 2026 17:09:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Nick Hu <nick.hu@sifive.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: timer: Remove sifive,fine-ctr-bits property
Message-ID: <20260420-flyover-smoked-8aa5c34279c4@spud>
References: <20260419-clintv2-remove-fine-ctr-v1-1-7527f4d45850@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20260419-clintv2-remove-fine-ctr-v1-1-7527f4d45850@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_090925_837895_9E2E347E 
X-CRM114-Status: GOOD (  14.67  )
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
Content-Type: multipart/mixed; boundary="===============4663191048832246559=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4663191048832246559==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vR2BNAp44kW2n+kv"
Content-Disposition: inline


--vR2BNAp44kW2n+kv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2026 at 11:18:55PM -0700, Nick Hu wrote:
> The counter width can be inferred from the compatible string, making the
> explicit "sifive,fine-ctr-bits" property redundant. Remove the property
> to simplify the bindings.

And there are no users of this, because the only permitted compatible
string combination contains {}.
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

>=20
> Fixes: 0f920690a82c ("dt-bindings: timer: Add SiFive CLINT2")
> Suggested-by: Conor Dooley <conor+dt@kernel.org>
> Link: https://lore.kernel.org/linux-riscv/20260330-relative-hardened-5ce3=
5fe1ef57@spud/
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> ---
>  .../devicetree/bindings/timer/sifive,clint.yaml          | 16 ----------=
------
>  1 file changed, 16 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/=
Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index 3c16b260db04..051edb1da0d7 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -72,22 +72,6 @@ properties:
>      minItems: 1
>      maxItems: 4095
> =20
> -  sifive,fine-ctr-bits:
> -    maximum: 15
> -    description: The width in bits of the fine counter.
> -
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        const: sifive,clint2
> -then:
> -  required:
> -    - sifive,fine-ctr-bits
> -else:
> -  properties:
> -    sifive,fine-ctr-bits: false
> -
>  additionalProperties: false
> =20
>  required:
>=20
> ---
> base-commit: c1f49dea2b8f335813d3b348fd39117fb8efb428
> change-id: 20260409-clintv2-remove-fine-ctr-d5caeda27863
>=20
> Best regards,
> --=20
> Nick Hu <nick.hu@sifive.com>
>=20

--vR2BNAp44kW2n+kv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeZPrwAKCRB4tDGHoIJi
0jyYAQCSy47nKECre6NxjHKLdkqjOYzUHJxy6oPNAnyL32w/VwD+IiuoWIry8JLL
agr6bn+8fw4Uc4Mzc5BGzDqZRWmJaQ8=
=rp8K
-----END PGP SIGNATURE-----

--vR2BNAp44kW2n+kv--


--===============4663191048832246559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4663191048832246559==--

