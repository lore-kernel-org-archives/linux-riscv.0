Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E90DC001DF
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 12:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ruj4GCagtNyag5xbST2FK6sfayJymPvARgHJWxcWCYA=; b=B6l7boNHb96LZzXEk0N7w278FD
	mdTvSfQcHf5F0svFmSyyYJ69/iwqn9VB2hz4jQsl+PsKnfa85gNqlVqXcN4dF/cxpDrw2YPxE4C3F
	V1SdYZ3qQ9RShQaa330FFzmym4dOHcc8H5rBBgTtUu/vHVcusF7SQIZu2MSlb7u9/IqyMQRxO2F3g
	//kOcjxQIUdJjaT7MSUV2+R1604yh9StqrpAvWMXjOoFVvb+TAAjYqYvpkd6faNpjic0sr0k/Lwo5
	fGo00QC3SXsWzdhr+KU8QCj8r576962dSCROuN6T5Y6sBgcx5K9p5u5IYf9dlvO/034MBR0gJ4zyM
	egmg+cQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRX2Y-008AJE-2H;
	Thu, 03 Aug 2023 12:02:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRX2S-008ADb-1z;
	Thu, 03 Aug 2023 12:02:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1691064164; x=1722600164;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aMtDvkkThoSLeILYJB44dM6LSzvz/cqPa1KYyjStjvY=;
  b=qKEZVheuiCNlN1m+ETy8AW9aadQWrvo+QnOCDvWxGZK/pNzvhbykJMD7
   SzbbKYg/aULaSanel+d7XlizAfPmVC9+YvC57tEbCXHOwFGGoRGaz/FtA
   pG0AY5P8KuwFzW7780e6FllqbU7tzbXdarSXSqHlv7Q8v5iKc2kxRMn9H
   JuAGf3If20hIqm7AYKGOU7zXeWAANJFtFFZfz1sTLYjYX04+1YPy7p5Ey
   K/oQHUjStgBPYZtFvkg+KhMeurOg6Y0DP/2mbxii9ng9LtJOD4wI25IY9
   8TEPRXwi4wKZzBSVqPmxegLFSWj40jf+MmiHZWoBaWwRyqoZdHLxCUtm/
   A==;
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="asc'?scan'208";a="227996472"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Aug 2023 05:02:37 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 3 Aug 2023 05:02:36 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 3 Aug 2023 05:02:33 -0700
Date: Thu, 3 Aug 2023 13:01:57 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <kvm-riscv@lists.infradead.org>, Conor
 Dooley <conor@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 1/7] RISC-V: Detect Smstateen extension
Message-ID: <20230803-till-rented-b4546a9b868c@wendy>
References: <20230726084352.2136377-1-mchitale@ventanamicro.com>
 <20230726084352.2136377-2-mchitale@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230726084352.2136377-2-mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_050244_742105_D30682AF 
X-CRM114-Status: GOOD (  18.39  )
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
Content-Type: multipart/mixed; boundary="===============5923889003751676995=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5923889003751676995==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rG9uLjivbYWQzDHh"
Content-Disposition: inline

--rG9uLjivbYWQzDHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Palmer, Anup,

On Wed, Jul 26, 2023 at 02:13:46PM +0530, Mayuresh Chitale wrote:
> Extend the ISA string parsing to detect the Smstateen extension. If the
> extension is enabled then access to certain 'state' such as AIA CSRs in
> VS mode is controlled by *stateen0 registers.
>=20
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

While I think of it, this patch may have to be shared with the riscv
tree to avoid generating a conflict with the reworking going in this
area.
I ran into a similar one during one of my rebases that was not too
difficult to solve, but generated a horrible looking confict.

Cheers,
Conor.

> ---
>  arch/riscv/include/asm/hwcap.h | 1 +
>  arch/riscv/kernel/cpu.c        | 1 +
>  arch/riscv/kernel/cpufeature.c | 1 +
>  3 files changed, 3 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index f041bfa7f6a0..fad1fd1fcd05 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -53,6 +53,7 @@
>  #define RISCV_ISA_EXT_ZICSR		40
>  #define RISCV_ISA_EXT_ZIFENCEI		41
>  #define RISCV_ISA_EXT_ZIHPM		42
> +#define RISCV_ISA_EXT_SMSTATEEN		43
> =20
>  #define RISCV_ISA_EXT_MAX		64
>  #define RISCV_ISA_EXT_NAME_LEN_MAX	32
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index a2fc952318e9..fb0df651bc48 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -217,6 +217,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] =3D {
>  	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>  	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
>  	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
> +	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
>  	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index a8f66c015229..c3742a765f8b 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -301,6 +301,7 @@ void __init riscv_fill_hwcap(void)
>  			} else {
>  				/* sorted alphabetically */
>  				SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
> +				SET_ISA_EXT_MAP("smstateen", RISCV_ISA_EXT_SMSTATEEN);
>  				SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
>  				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
>  				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
> --=20
> 2.34.1
>=20

--rG9uLjivbYWQzDHh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMuXNQAKCRB4tDGHoIJi
0mZJAP94GLPaEObBTZka8JnAh+Y2+i36/nr6M7zDycWn8FK3hgEAxtJPPErBwR6N
KxtNugvKX0suZ9P4K7i7HRukiYZ/fQ0=
=NJwv
-----END PGP SIGNATURE-----

--rG9uLjivbYWQzDHh--


--===============5923889003751676995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5923889003751676995==--

