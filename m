Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B802BC4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 12:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Qrrc2GQPE13dzxd90yZQL8cj7r88n7SeKO0Fmq3VoI=; b=yjSTiVLQvam2mjBpJEfE978edi
	Tg956wzVYXL8aHToxXXo3OC5W8GQfxWlz+HeDSFuBqQW5iXKyc/fS+VsuHRCT/Ef36gYJE4FbuVq2
	Az7ycvqdjVoK1EYMTg7jgD7fkK8tWnz9w8KPLo+5+M4BJ87t4A9GGk+qXzdO9xp3EG9yA0qJiXpkV
	g0tzSohV2QDwgOX4ymP8DWwzAuorVekh1RoMJyGDs3orbaTGnnM9KSO5JJj0G/mmA8KB7NZKcSL35
	S3Xfs4th26ZzWTzuUGlmx2TMRJ2yQuGA9NJDpX0qbQLewo+tSlH9Ro+tH6+S/eoCDHZ8M93EzDn5u
	6vdLLtsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBDFC-00Cl5D-3B;
	Thu, 07 Dec 2023 12:12:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBDF9-00Cl4T-2I;
	Thu, 07 Dec 2023 12:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1701951159; x=1733487159;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HUdSIX8FoylL7nOf/wJzJkkU/Ybmn3rRb/4PMgZXUHU=;
  b=2HeqfLQuCuj+dPZ7D06LeLTmAD0mdJZTWTgfosJC8DWKdpTucKbN21VC
   6ubpKEpO3XuFSehTiLxvWdmbgymlrsR8ntduqWugtQv7Y9tlyN/+JlAQB
   XZPXTr+ejGcDzyixm5nEqEPNMSC9fmDKWKCQKbAJSGjNcT8lrfBrA1r77
   SMeWNw3I46qk6+SnH+oRnwRHlhrj/jQKsQmKxlYIK4PcQS195gSsPw20I
   C+K8lTyTnB+ckrgGi2ZvmLH1ZgkJ1uCIw827v+peDgk2VGAh1IzSb/zmk
   AbEvXWF9gLw4sKHa1hCrJrHeo6QL17AEQlUJhRLo1Q+pNdBb7TysTa6BL
   w==;
X-CSE-ConnectionGUID: qtDtQC/MR0SMM/C1i87NvA==
X-CSE-MsgGUID: s22SpVhHSQ68I8AV5gRHvg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="asc'?scan'208";a="13245727"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Dec 2023 05:12:37 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 05:12:21 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Dec 2023 05:12:18 -0700
Date: Thu, 7 Dec 2023 12:11:48 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Atish Patra <atishp@rivosinc.com>
Subject: Re: [RFC 3/9] RISC-V: Add FIRMWARE_READ_HI definition
Message-ID: <20231207-jailbreak-kinsman-7353788a9a40@wendy>
References: <20231205024310.1593100-1-atishp@rivosinc.com>
 <20231205024310.1593100-4-atishp@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20231205024310.1593100-4-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_041239_880471_ED6957DD 
X-CRM114-Status: GOOD (  14.81  )
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
Content-Type: multipart/mixed; boundary="===============7811915238277682825=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7811915238277682825==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bcU5bmCaFN29LsCy"
Content-Disposition: inline

--bcU5bmCaFN29LsCy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2023 at 06:43:04PM -0800, Atish Patra wrote:
> SBI v2.0 added another function to SBI PMU extension to read
> the upper bits of a counter with width larger than XLEN.

This definition here is quite a lot less specific than that in 11/1 of
the spec. I don't think that really matters much in reality since we
only support exactly one XLEN where that is the case.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> Add the definition for that function.
>=20
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 0892f4421bc4..f3eeca79a02d 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -121,6 +121,7 @@ enum sbi_ext_pmu_fid {
>  	SBI_EXT_PMU_COUNTER_START,
>  	SBI_EXT_PMU_COUNTER_STOP,
>  	SBI_EXT_PMU_COUNTER_FW_READ,
> +	SBI_EXT_PMU_COUNTER_FW_READ_HI,
>  };
> =20
>  union sbi_pmu_ctr_info {
> --=20
> 2.34.1
>=20

--bcU5bmCaFN29LsCy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXG2hAAKCRB4tDGHoIJi
0u82AQDwi9UWn/9J92nmBoN8G2OQGiug9IR7IXTBPPHlWTNSfAD/QYb6iHZA/FQG
jX9pKcuUfaQ3vFjOevTwuCQy563jmAo=
=tIJW
-----END PGP SIGNATURE-----

--bcU5bmCaFN29LsCy--


--===============7811915238277682825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7811915238277682825==--

