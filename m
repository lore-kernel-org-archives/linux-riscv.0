Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3E8C77B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 16:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFZQR2s0dBjv7SxWwzW47deT1GEZb7hVFQaVldMj/DE=; b=gfKXtdZfDedv9FTxq4/8HxlBcp
	v89d2XZDplidc/YLjVrqDJzqc0Iewp8pzdeo003yM2L+9H7QB2QiWosWD4eD8n1h+VA/IBBk880Q2
	OTFezwGAHQfppKgUlyjuqxWOPX/1zgeeLD6RcNoh63dnZqSnyjsb+qaYT74NyD6vFmCRDaiTC7woK
	Ah7eaa004v3S6V+h6Noiqc+na7D36wGN4kXY3mLLoExhseaDAThBDSCVIqAIH92n9ygAC6jUHgOba
	X9/t1BmCpK5812VpDIi3cH97SaWzKIDnSNmbxY6chIpYSks2v09ivaPFniOJMw+++t5Jq1l7W8awW
	slDlou5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwmGn-006WVh-1H;
	Wed, 10 May 2023 16:02:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwmGl-006WVI-11
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 16:02:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B85A961283;
	Wed, 10 May 2023 16:02:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8736C433EF;
	Wed, 10 May 2023 16:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683734542;
	bh=/kdN4hvAEubjX/gd5V1SzxDj97jeupfrcjnDC/LaMUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P4QNUPH06gstoxB2Xv5lXxCbFqU69+iI5ji/rgl9x0BwXHGBJsPadmxRxIKPtZHu5
	 pcsYByxK+HQMEAB7hWDFyPGM0knLjY2OYYLpq8eJYuSDwxGaFcxKsQh5rjW27piSRZ
	 gUHbvgU2KXt1e9JCjsy/Agj5vuSqMF0DjylsjdeRu43emzmee+thbzSUfoAxOWxwDC
	 8pjZMZg7Do7DxEkM3FU8MtA0067jBPXUMxR61fmiJxRAr1TO4RhqcOQ3tum1szPQhV
	 u0JcGMQ6HGhehWuLRrL0s/wcdYO+8ZEKgXXXvsx3wqU8ieEXCl2oF5nNjoQ5n7fQzF
	 StGfO1CVN39cw==
Date: Wed, 10 May 2023 17:02:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: sifive,clint: Clean up compatible
 value section
Message-ID: <20230510-headsman-deskwork-6826f9f174df@spud>
References: <40ff1fc7f5220db7d527c57ac4bad16c3945ae08.1683725179.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <40ff1fc7f5220db7d527c57ac4bad16c3945ae08.1683725179.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_090223_447875_49134DCF 
X-CRM114-Status: GOOD (  23.18  )
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
Content-Type: multipart/mixed; boundary="===============5754576778336349783=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5754576778336349783==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GwMHLWq4sSBBzPyb"
Content-Disposition: inline


--GwMHLWq4sSBBzPyb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 10, 2023 at 03:27:24PM +0200, Geert Uytterhoeven wrote:
> Replace the sentences in the description listing some supported variants
> by comments on the individual compatible values, to ease future
> maintenance.  While at it, restore alphabetical sort order.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../bindings/timer/sifive,clint.yaml          | 21 +++++++------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/=
Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index 94bef9424df1bc6a..34a81510678134eb 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -29,11 +29,11 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> -              - sifive,fu540-c000-clint
> -              - starfive,jh7100-clint
> -              - starfive,jh7110-clint
> -              - canaan,k210-clint
> -          - const: sifive,clint0
> +              - canaan,k210-clint       # Canaan Kendryte K210
> +              - sifive,fu540-c000-clint # SiFive FU540
> +              - starfive,jh7100-clint   # StarFive JH7100
> +              - starfive,jh7110-clint   # StarFive JH7110
> +          - const: sifive,clint0        # SiFive CLINT v0 IP block
>        - items:
>            - enum:
>                - allwinner,sun20i-d1-clint
> @@ -45,14 +45,9 @@ properties:
>          description: For the QEMU virt machine only
> =20
>      description:
> -      Should be "<vendor>,<chip>-clint" and "sifive,clint<version>".
> -      Supported compatible strings are -
> -      "sifive,fu540-c000-clint" for the SiFive CLINT v0 as integrated
> -      onto the SiFive FU540 chip, "canaan,k210-clint" for the SiFive
> -      CLINT v0 as integrated onto the Canaan Kendryte K210 chip, and
> -      "sifive,clint0" for the SiFive CLINT v0 IP block with no chip
> -      integration tweaks.
> -      Please refer to sifive-blocks-ip-versioning.txt for details

> +      Should be "<vendor>,<chip>-clint", followed by "sifive,clint<versi=
on>"
> +      when compatible with a SiFive CLINT.  Please refer to
> +      sifive-blocks-ip-versioning.txt for details regarding the latter.

Does this section actually add any value at all?
By nature of oneOf structure above, such an ordering is required for
existing entries. For something not here, should we instead be noting
that sifive,clint0 is to be used when compatible with the SiFive/RISC-V
clint, rather than doing a sifive-blocks-ip-versioning.txt dance?

As it stands though, patch is an improvement, so:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--GwMHLWq4sSBBzPyb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFvACQAKCRB4tDGHoIJi
0pbRAQDAbbxrMC2lIxCBnXhwZtjnEZDIi/bWp0fhBRIdYDUZQAEAyvpFaWMF0+9C
U06I53ennxbOhq6qIjq/ueckMobCfgg=
=GuVy
-----END PGP SIGNATURE-----

--GwMHLWq4sSBBzPyb--


--===============5754576778336349783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5754576778336349783==--

