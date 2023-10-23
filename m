Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5F5CDB474
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 12:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uj7icCjvTGdwwq7BDjxmMt17k+WlqxzAeqj7cEMZXgI=; b=FST7GGfMrYLC2dAFlRavnZuMuz
	9JBO4d+JBIFomqxK5ege4F+BxmX5bubdSf8Q2ZdKzCBITdmxYik5hsOVRLIdN5HEP+DJrL9j/l9KG
	lTIDgyS3Ql8sQqQqiac2zCUbE/ZJVwKMiiTsgvHdWoWfzqicYiLbCfjWWeq+FgTAUHPHjeiQhaBJe
	e1ExNOdm/kx+X2ze5qrwzSUxR+3f679f1Pa4MWyYSr10PMOHOcVhRlh2NwNcOQKAcxg8B7Nrmg3V5
	6+oE8kV8B+UhXfVejS0JBTEMSShzGeOHxa1u9oRTHSEUa8FZQeIJKPNQLvYwST/RkQ4yAb7gY8J1w
	vW9CGyfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qutfH-007JrD-2J;
	Mon, 23 Oct 2023 12:04:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qutfD-007Jpj-2W;
	Mon, 23 Oct 2023 12:04:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ACBDFCE23B5;
	Mon, 23 Oct 2023 12:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42501C433C8;
	Mon, 23 Oct 2023 12:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698062644;
	bh=n/SYhgOy7PYoOMa/qRT/xqvF+V6QNHFqWYg+hu0aDj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MY2dbfASZER6tuIdGGsFhjcDL09IA9tXH1K2hRODqDJmoBwN1y9Pn+s7KPAjTz4yb
	 9JPo8v456haLAbc55KVPK4k05l3EDrlzlGgCg7itvHppqavF+wM3J5IreBTFzbhIfB
	 kLQ24DWYhW6tANl7QVCqPNxPNSeWuykvVc7skyKlqMhb6XeBov4DJsAUrTf0Zkyszr
	 MzoffD2wL1QGU5T/xqwnIIQzr0YFM0MC/Nh0v2A2Bu5EYeYXfKE6DHwygsEIlmRIyw
	 AequAVKeZ4TbiC3hjQRz+JPCvpgJpmIy7hm8buNLxBNK59ViC3AYScv2oHmO7kX0eE
	 YXqYt+lr/L2RQ==
Date: Mon, 23 Oct 2023 13:03:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Yu Chien Peter Lin <peterlin@andestech.com>
Subject: Re: [PATCH v3 RESEND 10/13] dt-bindings: riscv: Add Andes PMU
 extension description
Message-ID: <20231023-spectacle-module-0516fb35995a@spud>
References: <20231023004100.2663486-1-peterlin@andestech.com>
 <20231023004100.2663486-11-peterlin@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20231023004100.2663486-11-peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_050408_161089_BFD43049 
X-CRM114-Status: GOOD (  15.21  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: multipart/mixed; boundary="===============9181270956847019363=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9181270956847019363==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="P1S9GHX9rhzdHs0r"
Content-Disposition: inline


--P1S9GHX9rhzdHs0r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 08:40:57AM +0800, Yu Chien Peter Lin wrote:
> Document the ISA string for Andes Technology performance monitor
> extension which provides counter overflow interrupt and mode
> filtering mechanisms.
>=20
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
> Changes v2 -> v3:
>   - New patch
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 5e9291d258d5..e0694e2adbc2 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -246,6 +246,13 @@ properties:
>              in commit 2e5236 ("Ztso is now ratified.") of the
>              riscv-isa-manual.
> =20
> +        - const: xandespmu
> +          description:
> +            The Andes Technology performance monitor extension for count=
er overflow
> +            and privilege mode filtering. For more details, see Counter =
Related
> +            Registers in the AX45MP datasheet.
> +            https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-=
5.0.0-Datasheet.pdf

Does/will this PMU function identically on the other CPUs that support it?
I assume the answer is yes.

Cheers,
Conor.

> +
>          - const: xtheadpmu
>            description:
>              The T-Head performance monitor extension for counter overflo=
w. For more
> --=20
> 2.34.1
>=20

--P1S9GHX9rhzdHs0r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTZhKQAKCRB4tDGHoIJi
0q2MAP0VirheuKpWgXrPAEWaqZ66m6sp12MVuSOdCvU0US0f/AEA2BobNxX5Jk4Y
UqRJn9N7kWZtJAvcqBjJPvvs15wdpgc=
=/DQg
-----END PGP SIGNATURE-----

--P1S9GHX9rhzdHs0r--


--===============9181270956847019363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9181270956847019363==--

