Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86941C04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 16:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypwfaUe5NGTpgoijCrUYXqrHtslx+HqhaAhxAhy/mHg=; b=dDAk8hY7K8Khev8E51zKJntKbM
	41sWPrU6Ankbpr0yvSk66uUIaU3aUpB7Dfs140G9o8e0NWElnNeqod+AdZ3oOxBUyat69xyGO5vLX
	xRLgM376shpXP5+lehk3aQsAUSXciNGbLm8Ot8QvlsB5HLia5OWThI1xRVKTu3+MTiExsYb1fvOh8
	/hJe813h8c/yRnsC859dPc7BpPEbfpWRXCHU9HMYn90SWBsCFI2OfZW1BuWsB3aG+kPkUcclsDLCH
	4m2nMF//XOSxfXKK+VgLq1AcRWYqo2ainKe0HTLizyTBH7Fof5/dgIvLhd8K9DHcMJDvkM4DTPsP9
	Tj5FjBdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzJ2L-00000000kyn-2tBs;
	Tue, 23 Apr 2024 16:30:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzJ2H-00000000kwM-30r1;
	Tue, 23 Apr 2024 16:30:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4E0E8CE0FFC;
	Tue, 23 Apr 2024 16:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7297C116B1;
	Tue, 23 Apr 2024 16:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713889822;
	bh=MDpa0KTXNqlwoWKZPytLuLDc/9nA7cch3N1o2TonBUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QJJ55Plq98sqsZ327NH89cZLGiWfOQXOGbgaeWDVy2xJvyGhWSePAc9eheVAtGBBv
	 I0ZNYJ6ma5UhVYt2RwFK/qBvcoHb9s5yeX024ajoG026WhmPfCTmEfqFA51jGq++b1
	 AUouMd+mghF88GCpyzxqm9zWvHsxIAj/Dop2oeW9RuNW2diC/p+3rEWQHWG4QAlgET
	 tQQ6cVvf5cLEulSbQlTqEjaztjIFM1iHfo37RcbWM9nNpTykUR/NbgWsnqF87+yEsp
	 uiRlCk3MnSiJplHkxJNq+gELJYeRVYXq3KVN80eYi5UO6L96qk/XbQeCKvpBMvF7V6
	 0cTRYY6vel0KA==
Date: Tue, 23 Apr 2024 17:30:17 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, Ved Shanbhogue <ved@rivosinc.com>
Subject: Re: [RFC PATCH 2/7] dt-bindings: riscv: add Ssdbltrp ISA extension
 description
Message-ID: <20240423-poser-splashed-56ab5340af48@spud>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
 <20240418142701.1493091-3-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240418142701.1493091-3-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_093026_182597_6BE727AE 
X-CRM114-Status: GOOD (  18.16  )
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
Content-Type: multipart/mixed; boundary="===============5206957789445092231=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5206957789445092231==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1mo6dkSKqd+bW1ie"
Content-Disposition: inline


--1mo6dkSKqd+bW1ie
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 04:26:41PM +0200, Cl=E9ment L=E9ger wrote:
> Add description for the Ssdbltrp ISA extension which is not yet
> ratified.
>=20
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 63d81dc895e5..ce7021dbb556 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -147,6 +147,12 @@ properties:
>              and mode-based filtering as ratified at commit 01d1df0 ("Add=
 ability
>              to manually trigger workflow. (#2)") of riscv-count-overflow.
> =20
> +        - const: ssdbltrp
> +          description: |
> +            The standard Ssdbltrp supervisor-level extension for double =
trap
> +            handling as currently defined by commit e85847b ("Merge pull=
 request
> +            #32 from ved-rivos/0415_1 ") of riscv-double-trap.

I see the proposed ratification for this is Sept 2024, and is marked as
"Freeze Approved". Do you know when it is going to be frozen? Until
this, I can't ack this patch. I had a look in the RVI JIRA
https://jira.riscv.org/browse/RVS-2291?src=3Dconfmacro
and it looks imminent, but it's unclear to me whether it actually has
been or not.

> +
>          - const: sstc
>            description: |
>              The standard Sstc supervisor-level extension for time compar=
e as
> --=20
> 2.43.0
>

--1mo6dkSKqd+bW1ie
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZifiGQAKCRB4tDGHoIJi
0hV7AQCwM5lnZX7Tg+OYIQPsp0ouge2bHBKrLAWEl9at7FgtOQEA1eAWOXlr6fah
DurXskN1BrUnp0Wi8hkBvYt8NvTCmQQ=
=Tr/y
-----END PGP SIGNATURE-----

--1mo6dkSKqd+bW1ie--


--===============5206957789445092231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5206957789445092231==--

