Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E891EC27C6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jun 2024 08:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNc6i9xB0Xomuz26aM6F6GBna46wqxyxviNR+v9wNtI=; b=l4bMEdQogMnHyfNeG0ZcjTKF3x
	Gs3b0jaTedhZ6fuszX/oiwCZNuXnBsknNDHvctGaMny20XTzKFuPlm0N+MCgAUvK2F8GXfJ5N1E3V
	+IER7iUd9VMb0f8GAz+0rxrLC12UMD1wRMuRZsnRbuLbSMrIw60oFVrysWHvWfvC9L/dDvUo7xfgQ
	swBlD3l/E16d931/syU6KjYEw2Vb84kvwQepllvtAz/bmpbn4RvLeWzirfkTUT97b5PKkJT9LpdIY
	B4b2YxZAOmMElEwvt6LNLSQKkxWIdmKEdK2+lkMn5NNWL2yFkczDfuaoVxygVVoNsHR3xxO61pUi6
	wJFAagZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1xv-00000001uIC-1QMT;
	Fri, 14 Jun 2024 08:07:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1xr-00000001uHh-1mwv
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jun 2024 08:07:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718352435; x=1749888435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DMK+CWELdQnDrMQO/JKXFNX+z8myFs0IXh6Wo0q7b5Q=;
  b=RKHfyhiNu4SEs/VmqCYxKmQ1muv4Wb7UQ3dE9K7j7Eir/jP2ZLE9n9jE
   /Bc21zeNSu7zW/a2V4n4Ghpi4XlpEqITJX7nglk38+JRIUhr4ZZen5M1p
   D7yyz/Baawio5TRHYmBswBJPYotVLQzZWkRmEbYqor0v5y0O1BbE2qmKQ
   ywJ91u+QTwwM0slN4GuCQ0h/kMbFcdes3U3//ZNZO9UCCUIgv+MACT6JN
   R0umR+wwBXHvKc5Bbo0i5iAWFvuLi2OGv3ppGkdoCPbdsuVKRvKtH3br6
   j0yjy9RVBYob3PmY+K/ZwZBICO0f9FTDy7B76maIKD84/PuN4EcqKm5r3
   Q==;
X-CSE-ConnectionGUID: E0Y3hlcORKiEqud2JIoT4A==
X-CSE-MsgGUID: hXS/9NvCRrK8U4zhnOg3vw==
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="asc'?scan'208";a="28157199"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Jun 2024 01:07:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 14 Jun 2024 01:06:43 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 14 Jun 2024 01:06:38 -0700
Date: Fri, 14 Jun 2024 09:06:20 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jesse Taube <jesse@rivosinc.com>
CC: <linux-riscv@lists.infradead.org>, Jonathan Corbet <corbet@lwn.net>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, Evan Green
	<evan@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, Charlie Jenkins
	<charlie@rivosinc.com>, Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu
	<andy.chiu@sifive.com>, Eric Biggers <ebiggers@google.com>, Greentime Hu
	<greentime.hu@sifive.com>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?=
	<bjorn@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, Costa Shulyupin
	<costa.shul@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Baoquan
 He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>, Zong Li
	<zong.li@sifive.com>, Sami Tolvanen <samitolvanen@google.com>, Ben Dooks
	<ben.dooks@codethink.co.uk>, Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Erick Archer
	<erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: riscv: Add Zicclsm ISA extension
 description.
Message-ID: <20240614-broaden-bluish-8b2fe892db55@wendy>
References: <20240613191616.2101821-1-jesse@rivosinc.com>
 <20240613191616.2101821-3-jesse@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240613191616.2101821-3-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_010715_710311_978BDC92 
X-CRM114-Status: GOOD (  16.44  )
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
Content-Type: multipart/mixed; boundary="===============0834533794058073232=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0834533794058073232==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6rVBoByRG8F88jlI"
Content-Disposition: inline

--6rVBoByRG8F88jlI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 03:16:11PM -0400, Jesse Taube wrote:
> Add description for Zicclsm ISA extension.
>=20
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
> V1 -> V2:
>  - New patch
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index cfed80ad5540..9f6aae1f5b65 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -317,6 +317,13 @@ properties:
>              The standard Zicboz extension for cache-block zeroing as rat=
ified
>              in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
> =20
> +        - const: zicclsm
> +          description:
> +            The standard Zicclsm extension for misaligned support for al=
l regular
> +            load and store instructions (including scalar and vector) bu=
t not AMOs
> +            or other specialized forms of memory access. Defined in the
> +            RISC-V RVA Profiles Specification.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> +
>          - const: zicntr
>            description:
>              The standard Zicntr extension for base counters and timers, =
as
> --=20
> 2.43.0
>=20

--6rVBoByRG8F88jlI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmv57wAKCRB4tDGHoIJi
0v0FAP9mwX36VWSnRozk96nyVM3RIf8dHyi71Dw0gJMNUha3GgEA3nQVPysOqYVF
bZxE5DpI/lku06/oD+G/uESgN8mlDQw=
=89e4
-----END PGP SIGNATURE-----

--6rVBoByRG8F88jlI--


--===============0834533794058073232==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0834533794058073232==--

