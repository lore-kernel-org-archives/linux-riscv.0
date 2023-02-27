Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AA4C64ED6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 22:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0WnRhL6OvbsqQnqWzmcOHRHgD05uy9wAWPach3Sm3g=; b=qXxORkILhRK692fZid8/p/Gxcp
	ah78G2uSROc691NexK7DzXSA0lDwE8Eq/71XdvswteEt9LYLDhwsVlo6b3gBgainjJqFXTmCnHGh7
	5In6afcDfd62B+0BoRTp8P81c75RdVDExt8Js3KLkcJlJwcY1o2osByfjpugct71Gi8Ds7CyFtpMN
	ThFSrthB2wYUbY2u9xxxCg5ThriuJTSaSUDXswlX3JmZNA71Ifro1fUz6/s2OeTPKkFitssdg3fI/
	hDhV3bZ/0hQB3+5DW3i2sl1JvP+Q2e7QdJujGiMAaqIJnlwx3VLJ3zlbAYDNrbJ3oxOw5UP1miYvR
	0CRn6CtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWmRX-00BXIX-4J; Mon, 27 Feb 2023 22:58:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWmRV-00BXI5-6N
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 22:58:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B08A460E17;
	Mon, 27 Feb 2023 22:58:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F8F9C433D2;
	Mon, 27 Feb 2023 22:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677538680;
	bh=DOn3IqzBFJ3kATuBFE3wlApyPVODRfIIpiPTqiQJYuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hEq+oLArpAqLo/uoxoF59arOtl6M6jRIvJqAuX3WHRl4PLpQZA6Z0rPAPoE+nzGjt
	 83yytWT6c9k7ck/YuF7rBbApyD7/z9f4o8W7ywZl333hGqtzFQHEp4NXExPNVNJGP6
	 Huv1fuKuBYUTL6HOIKXDY+N28CP61hkUMMaxPou+tmNLerpTVD5IW3e31hAzhbJ3py
	 Jg6Zk0O4MNbT++ZEdVAHyXc8HI8m5QdiPrLfTgEa9ut+rkZ63JP5DcjYUJQGOz8P6+
	 /iIckHedliE5RZmBfoD+/54BcryPhAPw1z4sxx86V8dm/zX1IS/lbmgcQxf3MWs4fv
	 OeLcMXmk+J/dw==
Date: Mon, 27 Feb 2023 22:57:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, heiko@sntech.de,
	slewis@rivosinc.com, vineetg@rivosinc.com,
	Albert Ou <aou@eecs.berkeley.edu>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 4/7] dt-bindings: Add RISC-V misaligned access
 performance
Message-ID: <Y/01c7sZ9ri5i8ao@spud>
References: <20230221190858.3159617-1-evan@rivosinc.com>
 <20230221190858.3159617-5-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230221190858.3159617-5-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_145801_334356_17F46461 
X-CRM114-Status: GOOD (  18.77  )
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
Content-Type: multipart/mixed; boundary="===============3922486242489486174=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3922486242489486174==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YuphDP/Rndy0HYOx"
Content-Disposition: inline


--YuphDP/Rndy0HYOx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Evan,

On Tue, Feb 21, 2023 at 11:08:55AM -0800, Evan Green wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
>=20
> This key allows device trees to specify the performance of misaligned
> accesses to main memory regions from each CPU in the system.

Could you fold some of Palmer's explanation for why this must be in the
devicetree? Think this is where he explained it:
https://lore.kernel.org/all/mhng-8736b349-e27a-4372-81ca-3a25d2ec1e94@palme=
r-ri-x1c9/

>=20
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Evan Green <evan@rivosinc.com>
> ---
>=20
> Changes in v3:
>  - Added | to description: to make dt-checker happy.
>=20
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index c6720764e765..f79e9e5c5ee9 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -85,6 +85,21 @@ properties:
>      $ref: "/schemas/types.yaml#/definitions/string"
>      pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:_[hsxz](?:[a-z])+)*$
> =20
> +  riscv,misaligned-access-performance:
> +    description: |
> +      Identifies the performance of misaligned memory accesses to main m=
emory
> +      regions.  There are three flavors of unaligned access performance:=
 "emulated"
> +      means that misaligned accesses are emulated via software and thus
> +      extremely slow, "slow" means that misaligned accesses are supporte=
d by
> +      hardware but still slower that aligned accesses sequences, and "fa=
st"

s/that/than/

> +      means that misaligned accesses are as fast or faster than the
> +      cooresponding aligned accesses sequences.

s/cooresponding/corresponding/

Thanks,
Conor.

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

--YuphDP/Rndy0HYOx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/01cwAKCRB4tDGHoIJi
0nAeAQDSm+Ztzo3Tbf7N3R9oO20Sh+ylQ2JQ5FZnSgknEmJYYwD+IOIvf5vpBkfu
PcnfnXXl8a2pwxomgK/WBgQbomX0IQg=
=KSgx
-----END PGP SIGNATURE-----

--YuphDP/Rndy0HYOx--


--===============3922486242489486174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3922486242489486174==--

