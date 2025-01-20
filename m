Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49A3C02181
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 18:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mnhw9pMz5+VIV9hKmMdZdDPxpJVDMIrbaD35NM7XC8U=; b=ir1tbxJ6Uucw8bMQQU36Zf0dkc
	NDrVB+VBhoibD0oCvEY5wuTttvH5KUJoKPEdx0g/eX0ynwf4kMAGuCZep6OCbmJwlClM5/OVUhN4y
	IF57i7EmqPKRKqAHE3xY3TkfdJRzMEVwoRkIddaU9V9IK/DdLzD/Q8Jrplh/Rn4h4RtYZZC01sex2
	SZoTLAC0tFsd73oV5tufgw8Bt6TjiATYHEBL5srjUqbmKSTpHG2rdv/SNWQW5vJ2T8lKCND6nu4tT
	ED1Kj4BDDLqccFLA1ruxq1uOndnQxxSzsJoxR6cV8ORmFcvIjr2mHzJcBTVk13cDyrWxpFaQzIwAE
	06xgJEHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZwrQ-00000006GzD-1QY3;
	Mon, 20 Jan 2025 18:50:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZwqa-00000006Gpr-23ip
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 18:50:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CC0A6A41349;
	Mon, 20 Jan 2025 18:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD7AC4CEE0;
	Mon, 20 Jan 2025 18:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737399003;
	bh=keQ4qpXup8ODEZvZQDL7I6+dJQgVZs+X5f48QgI9A9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DWaoDoSCrm7ialgf0hjFKpRmwL51vstfVgmob4KF/lVjA1N28AQHIIpq8ncoPdzUt
	 MwQxqcr6Sl7ap0g8CpA//mGugUgsRLQlYwpsuulewNwuUWR1clN3sGI5+lZdDZNjBY
	 nsqjjB6pKlwiS1J25TR/cMyNmxBMAIU3KwMQO6VZydTM8ubMkp7plz2LDKxzx8/Qs9
	 FXkXaofXFdWuOBq4vb4lnxoz3Qx8ozBo3N/PmILjQ3E4slzGIFRvjQw0MJ7zsPTEI2
	 WjWva/Gd/RaCm9eeGgoGE7szv1ddC5aYM/qfHU7eYEkBM7TFSxnxMcXKPrVMBLLVD4
	 g7lvpuM8UpvrA==
Date: Mon, 20 Jan 2025 18:49:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org, adrian.hunter@intel.com,
	alexander.shishkin@linux.intel.com, ajones@ventanamicro.com,
	anup@brainfault.org, acme@kernel.org, atishp@rivosinc.com,
	beeman@rivosinc.com, brauner@kernel.org, heiko@sntech.de,
	irogers@google.com, mingo@redhat.com, james.clark@arm.com,
	renyu.zj@linux.alibaba.com, jolsa@kernel.org,
	jisheng.teoh@starfivetech.com, palmer@dabbelt.com, will@kernel.org,
	kaiwenxue1@gmail.com, vincent.chen@sifive.com
Subject: Re: [PATCH v2 4/7] dt-bindings: riscv: add Sxctr ISA extension
 description
Message-ID: <20250120-twisted-reward-b3b620c80368@spud>
References: <20250116230955.867152-1-rkanwal@rivosinc.com>
 <20250116230955.867152-5-rkanwal@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20250116230955.867152-5-rkanwal@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_105004_655958_320B5E00 
X-CRM114-Status: GOOD (  15.33  )
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
Content-Type: multipart/mixed; boundary="===============0562590066483878402=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0562590066483878402==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sM0OwTrQXpmguZwj"
Content-Disposition: inline


--sM0OwTrQXpmguZwj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 11:09:52PM +0000, Rajnesh Kanwal wrote:
> Add the S[m|s]ctr ISA extension description.
>=20
> Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml      | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 848354e3048f..8322503f0773 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -167,6 +167,13 @@ properties:
>  	    extension allows other ISA extension to use indirect CSR access
>  	    mechanism in M-mode.
> =20
> +        - const: smctr
> +          description: |
> +            The standard Smctr supervisor-level extension for the machin=
e mode
> +            to enable recording limited branch history in a register-acc=
essible
> +            internal core storage. Smctr depend on both the implementati=
on of
> +            S-mode and the Sscsrind extension.

Please, like the other extensions, cite the commit (and repo) where the
extension was frozen or ratified.

> +
>  	- const: sscsrind
>            description: |
>              The standard Sscsrind supervisor-level extension extends the
> @@ -193,6 +200,13 @@ properties:
>              and mode-based filtering as ratified at commit 01d1df0 ("Add=
 ability
>              to manually trigger workflow. (#2)") of riscv-count-overflow.
> =20
> +        - const: ssctr
> +          description: |
> +            The standard Ssctr supervisor-level extension enables record=
ing of
> +            limited branch history in a register-accessible internal core
> +            storage. Ssctr depend on both the implementation of S-mode a=
nd the
> +            Sscsrind extension.
> +
>          - const: ssnpm
>            description: |
>              The standard Ssnpm extension for next-mode pointer masking as
> --=20
> 2.34.1
>=20

--sM0OwTrQXpmguZwj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ46a1AAKCRB4tDGHoIJi
0uceAQCeRb1R/n532c4D/yxFavhS7J4RaH2P2lS4hTeORUDMxwD/bwxHJoeYil2Q
1ihodOZfON2tgzlq45m6l5hCvoAuhQA=
=AF6L
-----END PGP SIGNATURE-----

--sM0OwTrQXpmguZwj--


--===============0562590066483878402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0562590066483878402==--

