Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C00CD4F41
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 09:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TbiFKT45pY4QxlfhmIeMcvsl3GUNANqto3Oj0bhwhRg=; b=W2tMVlkC6ojj2p/HS52X8ZkcgB
	Vl3cvquOWAOxk6iTq+EphPYjqWbCvLt7M0O+TyEnrZjk/TMxf9Z44jE3oQ4DH5Zk+rVVTyr8/hoE2
	rUrtM9CikrSkp0nc9I6moRv35xn2T4+mUaqUHrBjtZkO7OUopph0QS9/Ug3PbbutMbUkoPyPPb7nt
	WT37yCeNpscmAcANvB00+DfGYJPAOvD+uZbsp8wN6Ovp8CB5XINJbzMo+HGrYLuo3PWz/PPlXi3If
	+AZdR0X3JU9oiBul4fuUiXFJmhtNasFeAR6yk2P5ZncE5ccVwL/Mlez9Qbstp0te/oe9LuqniargL
	81iIB0rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcSP-008ZYW-1f;
	Fri, 22 Sep 2023 09:28:17 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcSL-008ZX4-2l;
	Fri, 22 Sep 2023 09:28:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 9621CCE22BD;
	Fri, 22 Sep 2023 09:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BAE9C433C7;
	Fri, 22 Sep 2023 09:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695374889;
	bh=4Xc/L95oSWqxAlP8k0CojZn1YClK1+4Xtrm9064KLD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JZdsJUlBIhFmLL6CT2bsTEMM9QhzQRRobvoPAJvTiSh0mqYAsQqbY+pLWNQ6aaeMG
	 nzHO1ENvS8ph7z7oGRlvpqL9MmAQyiVQhWcEodLMof3nXNE6oXvl0q29CC+kF5awEo
	 7Wsjnpj6ikhpQaClTK6MNTr3+6mDqBv/elDMEK2bkcG1WhIwf0JNHoYGOCy8wy3EeS
	 F/kWWTM3jwYbLwCr3oNoZrQJ09T71j+HJqHbDwUWgmy175mhI2vn/4CQSqwqbONEzc
	 n0qlfWYCHYVzb1xfv1FtrCqz+wDdzK8SupkpIe9b0TTkZEw9gn//HlVdeYD4XqbkTi
	 rzjhWxhoVSGtg==
Date: Fri, 22 Sep 2023 10:28:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	greentime.hu@sifive.com, vincent.chen@sifive.com, tjytimi@163.com,
	alex@ghiti.fr, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: riscv: Add Svadu Entry
Message-ID: <20230922-bagel-hyphen-aae5b1b88b21@spud>
References: <20230922085701.3164-1-yongxuan.wang@sifive.com>
 <20230922085701.3164-3-yongxuan.wang@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230922085701.3164-3-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_022814_119612_D6B30E34 
X-CRM114-Status: GOOD (  16.76  )
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
Content-Type: multipart/mixed; boundary="===============8182739105941851946=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8182739105941851946==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZaTkWSVN9S5z8516"
Content-Disposition: inline


--ZaTkWSVN9S5z8516
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 08:56:48AM +0000, Yong-Xuan Wang wrote:
> Add an entry for the Svadu extension to the riscv,isa-extensions property.
>=20
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index cc1f546fdbdc..b5a0aed0165b 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -147,6 +147,12 @@ properties:
>              ratified at commit 3f9ed34 ("Add ability to manually trigger
>              workflow. (#2)") of riscv-time-compare.
> =20
> +        - const: svadu
> +          description: |
> +            The standard Svadu supervisor-level extension for hardware u=
pdating
> +            of PTE A/D bits as frozen at commit b65e07c ("move to Frozen
> +            state") of riscv-svadu.
> +
>          - const: svinval
>            description:
>              The standard Svinval supervisor-level extension for fine-gra=
ined
> --=20
> 2.17.1
>=20

--ZaTkWSVN9S5z8516
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQ1eJAAKCRB4tDGHoIJi
0v9nAQC9vIjrDSNPVsV/sDmKkSEokU2Zz1TPhfzrs9q0VzCcOQEAiiM8m3v8Pxeb
IgSWyoBmHUYpi7kujuA7TfByYIw6Pw4=
=JRlx
-----END PGP SIGNATURE-----

--ZaTkWSVN9S5z8516--


--===============8182739105941851946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8182739105941851946==--

