Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8927CC27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 16:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKZ2ZpFvRTsJVbQkB+YC4MmAvIQRnXx4O2Oj6grkAuY=; b=lcEqmL3ugbaS7KFu4Pd1oS4ILp
	CsUiLMx3fcUghwSqv36EUw0jL59JTu2QSvb3pTxa3Qu8Uk8eG4S3PX18ISDkqpiRSG+y8EHEOdGjY
	L+8bg1su4I+9PaNU1Zw6FmhNfQheXpPIQ6sUz7OmCdACQpsPnHVdW+kFJ3THqeTusQoB3KfAPk6Pg
	Uqy+JiAr7p34hPDfhumy3NBA+sKmxn8NeQGDcbwnRYmYQbBFet6M8N9RxzQD5qOE8xNpJdfC8HAkb
	8ApBzfjzF4c4pdKGqTkziWWg/ItHswP5JtjEi2XtYNsuhvZ8K60kYAkvuKHCUSQ2zdJYTiLrYZ3Jo
	XgJteGQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMV5K-00000007VF6-1tfW;
	Wed, 26 Jun 2024 16:01:26 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMV5H-00000007VDr-3oDv
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 16:01:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1151FCE1F39;
	Wed, 26 Jun 2024 16:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D334C116B1;
	Wed, 26 Jun 2024 16:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719417681;
	bh=nyv3bEUAakqLC7rtOzRHOgPOsPXjI0dRN38MP/V4ocg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FJkoJt9v6CUbHgJB4OqNjVcNwf7o/wx/KhKF0GYKtBWuaw3WaaN/4d8Gwt0KSeVXa
	 Nk4og+i76ei30mfMjgYjQ1oxVoaA4ZVDGOoGl9aUMEpWCuZ9WBKXGyuSe5RSzNIHxx
	 kVRL3qVCJRECsnwkVYZoe40szEAQnHbx0kbxspTGbjWc95Ou4M7NezIj4mkZVA5lsq
	 NudAOXZ0VZgyjJpyFdosSWbISF1iSQgUnpT0/LIBegeCfucQaJUAzQ3cnzyznO/DbW
	 iXFK5zPihTlY/Ok4th03aEqd6Jn7jv8jqQzVI4dC/mfmV1LtZ4xnynyYEv986EPpZ2
	 1u6wgyXo8jTYg==
Date: Wed, 26 Jun 2024 17:01:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	kasan-dev@googlegroups.com, Atish Patra <atishp@atishpatra.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: riscv: Add pointer masking ISA
 extensions
Message-ID: <20240626-refined-cadmium-d850b9e15230@spud>
References: <20240625210933.1620802-1-samuel.holland@sifive.com>
 <20240625210933.1620802-2-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240625210933.1620802-2-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_090124_624401_8E5DBC77 
X-CRM114-Status: GOOD (  15.39  )
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
Content-Type: multipart/mixed; boundary="===============2367472558203626763=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2367472558203626763==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2g5NVOE5lfng/7+O"
Content-Disposition: inline


--2g5NVOE5lfng/7+O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 02:09:12PM -0700, Samuel Holland wrote:
> The RISC-V Pointer Masking specification defines three extensions:
> Smmpm, Smnpm, and Ssnpm. Document the behavior of these extensions as
> following the current draft of the specification, which is 1.0.0-rc2.

You say draft, but the actual extension has already completed public
review, right?

>=20
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>=20
> Changes in v2:
>  - Update pointer masking specification version reference
>=20
>  .../devicetree/bindings/riscv/extensions.yaml  | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index cfed80ad5540..b6aeedc53676 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -128,6 +128,18 @@ properties:
>              changes to interrupts as frozen at commit ccbddab ("Merge pu=
ll
>              request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
> =20
> +        - const: smmpm
> +          description: |
> +            The standard Smmpm extension for M-mode pointer masking as d=
efined
> +            at commit 654a5c4a7725 ("Update PDF and version number.") of
> +            riscv-j-extension.
> +
> +        - const: smnpm
> +          description: |
> +            The standard Smnpm extension for next-mode pointer masking a=
s defined
> +            at commit 654a5c4a7725 ("Update PDF and version number.") of
> +            riscv-j-extension.
> +
>          - const: smstateen
>            description: |
>              The standard Smstateen extension for controlling access to C=
SRs
> @@ -147,6 +159,12 @@ properties:
>              and mode-based filtering as ratified at commit 01d1df0 ("Add=
 ability
>              to manually trigger workflow. (#2)") of riscv-count-overflow.
> =20
> +        - const: ssnpm
> +          description: |
> +            The standard Ssnpm extension for next-mode pointer masking a=
s defined
> +            at commit 654a5c4a7725 ("Update PDF and version number.") of
> +            riscv-j-extension.
> +
>          - const: sstc
>            description: |
>              The standard Sstc supervisor-level extension for time compar=
e as
> --=20
> 2.44.1
>=20

--2g5NVOE5lfng/7+O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnw7TAAKCRB4tDGHoIJi
0lzdAP9FEjY6nhgecyj1qyL7BY1ORdvCG0mlA35ivg61fW7EsgEAwwWyBymmuOic
KbI1oP/Agz7PwvDvQ4h4QigAxWc+jQs=
=tYy9
-----END PGP SIGNATURE-----

--2g5NVOE5lfng/7+O--


--===============2367472558203626763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2367472558203626763==--

