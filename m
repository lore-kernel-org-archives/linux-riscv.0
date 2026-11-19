Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D26460A260C
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 16:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OQRA6hfn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P+N2fTiZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Qn3XWvV4+VTL+UNN+d8Zo5zXmtvN/Ag2Uc91AeMjfZY=; b=OQRA6hfnrZGBYtDupoQNPTPiOW
	ZNQ4KbPsFLpsKz90tr/qJub1QY5dyaVlg4+9dLg6VsPPv4gwlm4M/V/GivUfZ+boazOTY/2szeVrW
	XniBu8tfIebpF+lgPlzKDRHI9M5OKzxVXyDsOtOncXPT2gA9eJBvJQicC8WNdHv858Nn5kDPdpIkF
	LIltTkDGlf77H6jlTe+wQMuyAnwKPIEOve9gDJBQnoxDOhm45e7+bV3lVxmioWGprrFeQbUeVIAwc
	ShXui0iB2V9wV5RSZtnI55E2iv871yEnLI4oabB+CPUdLRQCFXyOtQKlCfuKLU9EzPQHoUoiVrj3Y
	D3+/DEKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4vY-0000000CcTj-4817;
	Thu, 19 Nov 2026 16:24:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4vX-0000000CcSz-0LY6;
	Thu, 19 Nov 2026 16:23:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7EB6F472D2;
	Thu, 19 Nov 2026 16:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D5F1F000C7;
	Thu, 19 Nov 2026 16:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795105438;
	bh=ASPP9Zc3Zh0uvcMkx39f3kA3ni4lHB7NDdB+FYKmk0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P+N2fTiZ/FzUCuPmCtvP9jnkiQdxnim7Uz3ZrINJJ+GtqB+zX9H7t5zFO47wX5GNQ
	 7dS3qOTrfAzdUIjwYFrxsZYpxZVIz7ZMOtsEdfe0rObN9V8gcGedLZphZBpee/vXkA
	 ihTAhB51VhfKuK7fses/UO2DV2AjASYAbXzI5J0zvOFiWF6J4WsgjeSwFiJgSSu4qK
	 6tZT/t+EYzNsHHs5393nRvzDtGgo4BXrTpfJrc28N+1QumoV9EvMuT98WG6QlULwFU
	 GHHOe2+kO79vvlClOvinEY3Co0GnTt6FY1t39hKp/NWlTMgBuIFwVlI3KXi3JV8dMZ
	 kajZSeXAuNmjw==
Date: Thu, 19 Nov 2026 16:23:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Vikram Singh <vikram.singh3@oss.qualcomm.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
	namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, atishp@rivosinc.com, anup.patel@oss.qualcomm.com,
	will@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, beeman@rivosinc.com,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>,
	Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v5 7/7] dt-bindings: riscv: add Sxctr ISA extension
 description
Message-ID: <20261119-drainable-muscular-697e071393a6@spud>
References: <20261118095053.3871267-1-vikram.singh3@oss.qualcomm.com>
 <20261118095053.3871267-8-vikram.singh3@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261118095053.3871267-8-vikram.singh3@oss.qualcomm.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8404479311036220043=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8404479311036220043==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J8Dk75YY+52XvXQ7"
Content-Disposition: inline

--J8Dk75YY+52XvXQ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 03:20:53PM +0530, Vikram Singh wrote:
> Add the S[m|s]ctr ISA extension description.
>=20
> Co-developed-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Vikram Singh <vikram.singh3@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/20261106173942.3175069-8-vikram.singh3@os=
s.qualcomm.com
> Signed-off-by: Anup Patel <anup@brainfault.org>

With this stuff sorted out as Anup mentioned
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: changes-requested

Thanks,
Conor.

> ---
>  .../devicetree/bindings/riscv/extensions.yaml | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 79491ef8f86a..dde2f28cfda5 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -202,6 +202,13 @@ properties:
>              mechanism in M-mode as ratified in the 20240326 version of t=
he
>              privileged ISA specification.
> =20
> +        - const: smctr
> +          description: |
> +            The standard Smctr supervisor-level extension for the machin=
e mode
> +            to enable recording limited branch history in a register-acc=
essible
> +            internal core storage as ratified at commit 9c87013 ("Merge =
pull
> +            request #44 from riscv/issue-42-fix") of riscv-control-trans=
fer-records.
> +
>          - const: smmpm
>            description: |
>              The standard Smmpm extension for M-mode pointer masking as
> @@ -263,6 +270,13 @@ properties:
>              mechanism in S-mode as ratified in the 20240326 version of t=
he
>              privileged ISA specification.
> =20
> +        - const: ssctr
> +          description: |
> +            The standard Ssctr supervisor-level extension for recording =
limited
> +            branch history in a register-accessible internal core storag=
e as
> +            ratified at commit 9c87013 ("Merge pull request #44 from
> +            riscv/issue-42-fix") of riscv-control-transfer-records.
> +
>          - const: ssnpm
>            description: |
>              The standard Ssnpm extension for next-mode pointer masking as
> @@ -1189,6 +1203,21 @@ properties:
>              - contains:
>                  const: zicntr
> =20
> +      # Smctr depends on Sscsrind
> +      - if:
> +          contains:
> +            const: smctr
> +        then:
> +          contains:
> +            const: sscsrind
> +      # Ssctr depends on Sscsrind
> +      - if:
> +          contains:
> +            const: ssctr
> +        then:
> +          contains:
> +            const: sscsrind
> +
>  allOf:
>    # Zcf extension does not exist on rv64
>    - if:
> --=20
> 2.43.0
>=20

--J8Dk75YY+52XvXQ7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCav8ilwAKCRB4tDGHoIJi
0kVlAPsG4DXR9ueGc0XhRpoMYfNdTGaoRfforrmj7DuWFcQZuwEA0fKo7E+f/t+0
hf4bzQ8P5iwPUbFDhzYjmtwJKU/pVg8=
=/fE9
-----END PGP SIGNATURE-----

--J8Dk75YY+52XvXQ7--


--===============8404479311036220043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8404479311036220043==--

