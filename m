Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8B1C282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 18:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vq+z+aXC77XDV3Y9VxoYGCn/Ui1B5TKSLqSFPqlt+eA=; b=IJ8pV+wM0b0sg0SSkNIyjOQbBP
	rcTwgZCuWI5DXoPO/uTBYRWl/7Eo3x0+cEzX50Igr5g9E5Z4doRxwwKTMpsoGRVM8O8CkV5zxupHt
	WirxH4rR6iN5+lTnn1rKcen+ldlUi8aprMJIhWeOoX3yilGzC9ppN9TFQZU0qC+A4TgHMSsPLkGh/
	TVqFZD4HgMVTxRT8gtBUfYFUhE48BdbpEq/RcWsE5so5Tfj/gr2LuhvLm19NenqTl8miy8z6QTtRH
	YPsGiflMgany02RbTqCh1GUtXASA+QFK7FW+b9bGvNNenQyrgQjYvabHcuDjpHgX6jXpvZUS1wC8n
	wueS0+gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4Rr-00000006dtz-1nUS;
	Tue, 11 Mar 2025 18:35:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts47k-00000006aia-2k0Z
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 18:14:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 59D935C54A3;
	Tue, 11 Mar 2025 18:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C28C4CEF0;
	Tue, 11 Mar 2025 18:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741716880;
	bh=OarDzLhzfup2s63X87NTaLZokagXoDKFBQHrlDLogGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XPORfjjyIudmmX4168iKMjff37zMqmd9De93SPA0Pgbjq8ao5d4jTVWnNVUCdU9x7
	 XP6GC7R+xPM6zaiu39UiPi9xknzVjKyd3vXLBU++qgFFJJMBrEpgQvnh9P0U1w6R4N
	 aNbNHY9pfLShgd1scjJLb0sF2jenbw0NNNzbEu7l3ndDPFIMsAVrX9SqDGJ2lpTtxJ
	 Wsx6spxuEklVM4sWNeMme5+uA2fwimYcIBqeM4lTt5bIoybboytTWoP060pPMAKZIr
	 KOlwu6yIX441Qpm2B6lKCIt63SVLsmglUWV9WAHXSEsbkH1/gaMMvoogaBGPiwGHkA
	 lQXIw7dz8fLrQ==
Date: Tue, 11 Mar 2025 18:14:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl, Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: riscv: Add SiFive P550 CPU compatible
Message-ID: <20250311-sedate-dazzling-1d17139aa6aa@spud>
References: <20250311073432.4068512-1-pinkesh.vaghela@einfochips.com>
 <20250311073432.4068512-2-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
In-Reply-To: <20250311073432.4068512-2-pinkesh.vaghela@einfochips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_111440_734308_368A5531 
X-CRM114-Status: GOOD (  12.79  )
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
Content-Type: multipart/mixed; boundary="===============7064984502727482571=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7064984502727482571==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d6X9i2ow7QF9txQ0"
Content-Disposition: inline


--d6X9i2ow7QF9txQ0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 01:04:23PM +0530, Pinkesh Vaghela wrote:
> From: Darshan Prajapati <darshan.prajapati@einfochips.com>
>=20
> Update Documentation for supporting SiFive P550 based CPU
>=20
> Signed-off-by: Darshan Prajapati <darshan.prajapati@einfochips.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index 2c72f148a74b..3ee7468001f6 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -51,6 +51,7 @@ properties:
>                - sifive,e5
>                - sifive,e7
>                - sifive,e71
> +              - sifive,p550
>                - sifive,rocket0
>                - sifive,s7
>                - sifive,u5
> --=20
> 2.25.1
>=20

--d6X9i2ow7QF9txQ0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ9B9iQAKCRB4tDGHoIJi
0hKaAQCNeTF/CkJ1PsIfFWh3MLO3yqNzXeLOsBlbLEXai24e9wD/ZmjSMalBpaGW
X7Rd5P6hbu+uwF9WmLALnIVk3brMAAo=
=zGNV
-----END PGP SIGNATURE-----

--d6X9i2ow7QF9txQ0--


--===============7064984502727482571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7064984502727482571==--

