Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2657CC25B67
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 13:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AkuABvCirWlSX4hLYvHGUDhwP/AjM3QOfRmEOUF23qA=; b=dbRJaVekzVoQNaB4gLUH07SEMU
	oeT/jaM8+ETjwZaBnzdJ5T96toeg4Uq8YGi3lhXb74q+VDnQcKjCesqFT/AjuGkY0GwqWwu/CYhwH
	oH8eMLeagk6I6zaiqChk7PC8pHmkRrxfSI5/mDA2tRVfOL8rteyMmpB6dJmdz66daQ/sOZ8Xsgasc
	dgtrDMoWpREHsuJe6BR06zuiOx5N2vV8iozUGA+LQYlwOfBcQm76hTg4muu8wEZUrT17BOqFQduCr
	Ct/Hhvdbsb2ynXgpfFLIgcXoba4z2Vx6YWGo/GSoI65FQ5rGvmWh1VqMDY8gfMjHiFIJHCANzXlvD
	bUGQszTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw08S-00EWba-0b;
	Thu, 26 Oct 2023 13:10:52 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw08O-00EWaD-29
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 13:10:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1DDDAB835E3;
	Thu, 26 Oct 2023 13:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F91C433C7;
	Thu, 26 Oct 2023 13:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698325841;
	bh=EfXXgft1MEBK+Cu8UhIL0I9B4dpq2qUgaI53cQZ71SM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TCbkkVkBmnV/JtBgJxk7QNRutR0z0QbFxnPJIMFqDXKdey/uM6vnZnIOAc8Jg7Pck
	 Unc2ItPgRJDVmnyGihoszNI/jJiCi8C3g+RhC9l9Q8ELaMEV3SKV8onKvkH9WN8WgF
	 fOVRIXBG5H75RMP3tz3pNXA7Qid6zxRDCto7XCWl/akHzziZxUltezEadjjwrtY3Tr
	 DlbD1xw/W2T3PgpNBYG7fAXXjYrZKIHfRZdUABe+TBljpVNfa1/xyhRl+N20AUk7PF
	 jf0eCwzQ3gwMBmZNBgIWVBvRRbW5I2rfh3n3GuRR7iwRMReyXVmioBpYb5SHu3l+zH
	 YWBIKb2vOKFsg==
Date: Thu, 26 Oct 2023 14:10:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 1/4] dt-bindings: cache: sifive,ccache0: Add StarFive
 JH7100 compatible
Message-ID: <20231026-paycheck-equation-b0f1a1191bf2@spud>
References: <CAJM55Z-vw1sbks0KcHOXMzP-6c9NMg+GOndi2pQ7iyWh0=oQiQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z-vw1sbks0KcHOXMzP-6c9NMg+GOndi2pQ7iyWh0=oQiQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_061048_846034_5BFC0406 
X-CRM114-Status: GOOD (  16.15  )
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
Content-Type: multipart/mixed; boundary="===============7765795036937902225=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7765795036937902225==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N3bHDx1Rs6y3UHHy"
Content-Disposition: inline


--N3bHDx1Rs6y3UHHy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 25, 2023 at 11:56:37AM -0700, Emil Renner Berthing wrote:
> This cache controller is also used on the StarFive JH7100 SoC.
> Unfortunately it needs a quirk to work properly, so add dedicated
> compatible string to be able to match it.
>=20
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/cache/sifive,ccache0.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> index 8a6a78e1a7ab..7e8cebe21584 100644
> --- a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> +++ b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> @@ -38,7 +38,9 @@ properties:
>                - sifive,fu740-c000-ccache
>            - const: cache
>        - items:
> -          - const: starfive,jh7110-ccache
> +          - enum:
> +              - starfive,jh7100-ccache
> +              - starfive,jh7110-ccache
>            - const: sifive,ccache0
>            - const: cache
>        - items:
> @@ -88,6 +90,7 @@ allOf:
>            contains:
>              enum:
>                - sifive,fu740-c000-ccache
> +              - starfive,jh7100-ccache
>                - starfive,jh7110-ccache
>                - microchip,mpfs-ccache
>=20
> @@ -111,6 +114,7 @@ allOf:
>            contains:
>              enum:
>                - sifive,fu740-c000-ccache
> +              - starfive,jh7100-ccache
>                - starfive,jh7110-ccache
>=20
>      then:
> --=20
> 2.40.1

--N3bHDx1Rs6y3UHHy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTplTQAKCRB4tDGHoIJi
0l+AAP4vVuMXUegOCudC7vu4oDma0ogJA3LYsJGQx+aFcJo2pAD+Jv0QZsCbaVCC
ZM+iTmoolMuerwlZgbvaO0N+e3S0uQE=
=w4QN
-----END PGP SIGNATURE-----

--N3bHDx1Rs6y3UHHy--


--===============7765795036937902225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7765795036937902225==--

