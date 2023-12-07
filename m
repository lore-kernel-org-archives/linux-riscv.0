Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD5AC4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 12:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXpYvyiLLFdMA2in4JVc4qs58dOznnB6jvasKY/HAfE=; b=jeR1mqH+jzlLuSI+lpj25+YRNy
	5/Vxikv6sdZHo4d+UQadZp1eWyKHXUGngEuArg3ZV3PDRYyjw6zhgD7AGtBFxDmtLTHp+SarCLyXd
	n79jb6BFtIHlwjmPj9GXVj0BhFkMneQ6WyyjNTCaWYqXuvq54nUEWnYrALXICkruGOR8zllpVJkTI
	gE4RiC9+h5DvPPmchtqckkih964gxFzJD2yL9Oq6j7l62vQcq0ltOemdfh6Scsp2LJVLo/B1Ko1H4
	xP11DzNJ1GeM2661QZODu8DzG7rx/9v8dxwdoZbposv38apcyDrF/b+o13q2aF0/A0h3P5SNlSV1o
	tzKnqfQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBD8L-00CkEh-1K;
	Thu, 07 Dec 2023 12:05:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBD8I-00CkEB-0k;
	Thu, 07 Dec 2023 12:05:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1701950734; x=1733486734;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+vqAtDYB58+ilZDY2IzWBId3CBwPu+5+VxutobiukMs=;
  b=gXVqDHxAC3F0kgJ1e9l17h/8swN7yRsFnYFDsm1A0Od/+9d4GezhwSvU
   fCDvrTlmLHmmuNy92oIC983hN/8/MFfQo+IXbGGmRPbiPlpOL6qkttgb6
   ZzRaF1YjlmgWi0BQ9isbijNPTy8V2/MNHO2UmDF0TsYYTH6DMZJuQmaeI
   8CQCjGBEB6/HJLIyvi1TxXWK9fN9BRj5/BrT6mXm7Zcn1YJEYLCFisCiK
   AHdFIw6adCCOpACh9bTOG6fuSIqsUX4kI9LgMHTlaC4/AevChVzcKPOnH
   FFE0ircjxt4vHoXgwiBv/W7dsiLWIqrw7HJFFkF3B2CjK0i1NKOZvLaWE
   g==;
X-CSE-ConnectionGUID: mTzueT1QSG2gazajd18OtQ==
X-CSE-MsgGUID: N6fBXV3OSlSjijCehmi7zQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="asc'?scan'208";a="12928857"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Dec 2023 05:05:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 05:05:03 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Dec 2023 05:05:00 -0700
Date: Thu, 7 Dec 2023 12:04:30 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Atish Patra <atishp@rivosinc.com>
Subject: Re: [RFC 1/9] RISC-V: Fix the typo in Scountovf CSR name
Message-ID: <20231207-attractor-undone-a3efe2e0bb4e@wendy>
References: <20231205024310.1593100-1-atishp@rivosinc.com>
 <20231205024310.1593100-2-atishp@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20231205024310.1593100-2-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_040534_273732_671AA3E9 
X-CRM114-Status: GOOD (  13.68  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============4039739304911781427=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4039739304911781427==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="G7tPSZJn8UmPNl7v"
Content-Disposition: inline

--G7tPSZJn8UmPNl7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2023 at 06:43:02PM -0800, Atish Patra wrote:
> The counter overflow CSR name is "scountovf" not "sscountovf".
>=20
> Fix the csr name.
>=20
> Fixes: 4905ec2fb7e6 ("RISC-V: Add sscofpmf extension support")
>=20
^^ No blank line here.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/csr.h         | 2 +-
>  arch/riscv/include/asm/errata_list.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 306a19a5509c..88cdc8a3e654 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -281,7 +281,7 @@
>  #define CSR_HPMCOUNTER30H	0xc9e
>  #define CSR_HPMCOUNTER31H	0xc9f
> =20
> -#define CSR_SSCOUNTOVF		0xda0
> +#define CSR_SCOUNTOVF		0xda0
> =20
>  #define CSR_SSTATUS		0x100
>  #define CSR_SIE			0x104
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/as=
m/errata_list.h
> index 83ed25e43553..7026fba12eeb 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -152,7 +152,7 @@ asm volatile(ALTERNATIVE_2(						\
> =20
>  #define ALT_SBI_PMU_OVERFLOW(__ovl)					\
>  asm volatile(ALTERNATIVE(						\
> -	"csrr %0, " __stringify(CSR_SSCOUNTOVF),			\
> +	"csrr %0, " __stringify(CSR_SCOUNTOVF),				\
>  	"csrr %0, " __stringify(THEAD_C9XX_CSR_SCOUNTEROF),		\
>  		THEAD_VENDOR_ID, ERRATA_THEAD_PMU,			\
>  		CONFIG_ERRATA_THEAD_PMU)				\
> --=20
> 2.34.1
>=20

--G7tPSZJn8UmPNl7v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXG0zgAKCRB4tDGHoIJi
0nN2AQCvWU22TUz271qbF0f5QPpTAMxJ3xWOjAley3m+IaVk2AEAgKbSJBE5ydgt
c0kRj6UIA26wDaBYi2ihZnFJRMAJVw0=
=pO03
-----END PGP SIGNATURE-----

--G7tPSZJn8UmPNl7v--


--===============4039739304911781427==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4039739304911781427==--

