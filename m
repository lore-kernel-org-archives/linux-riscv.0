Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74589C4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 12:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=139v+77ZzpXbns5RsA3Au6+Ee96cydoDngITLu/EoDw=; b=ZkHN9jwzm0Vw3Qxs2CLFDhf/2y
	B47uhJtr3yJedNmxWHiAP6UaYpem557TR+PeokLUlpCwb95dVEvBVKNAb9srkQdRzZG3dxb3rKOoC
	cOznQ5BOSEP64GNvvxWlKhl+pap6TAbeeOXZXwBEryt2Pk4yz3LszeBbJvPzPVrOW6kPkjImxcWP/
	Zeq8RQfCvEFPWYIrYtoDEefxK8DGx2hrlvWw9wrKWefkQNtVTxgFBvtFpx03RH9WwTjcI/Up5uk8S
	DOaUX3UWkYmK2kUVcWRlPO+nAAYtymS47PRNaOD2FcKmYoC+lxsSfORM2PYXVNZ2T3CBUOSNhdMui
	/Yu5w+5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBDZD-00CnON-0T;
	Thu, 07 Dec 2023 12:33:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBDZ9-00CnNo-38;
	Thu, 07 Dec 2023 12:33:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1701952400; x=1733488400;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x+W86EcBv8nw8a8iPOChoKU5STU5d1Xy1ovac4ozBgo=;
  b=1/5qk2NegREQRg19JKQwahIhKVVS/iICITZ0cpY0k+rdlfo4Plj3ysr5
   am7oYndSray03y+AcwtxbR3NvPEX4LZ2k61BID84MQYil1dy+BrzO/h5I
   VRm4p4FgZLCe7bsEJsTuNI3uMSAfObPIl+h9OqIIeBr6A2jbcQL1Icbij
   7wiJacQOnBoEd/Lc8i6sX3nGemKvLpkEGMVum8mrf9bXY2cgvELzxUD/D
   d028v+9mJ5G977w2nmPl4zPn7fpFk/T1hi0EffB0JeWBG+L0h8T1y1mXG
   0J4KVZOp6VYRgBmkm9epwwGOLzBSac0sy5YFWsetFugapEtL9MwlNd7sL
   Q==;
X-CSE-ConnectionGUID: aqnjUHDXQVi84lfCJE9wQw==
X-CSE-MsgGUID: /RjNEEfKS2iR2vvEfe94nA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="asc'?scan'208";a="13246334"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Dec 2023 05:33:18 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 05:32:51 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Dec 2023 05:32:49 -0700
Date: Thu, 7 Dec 2023 12:32:19 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Atish Patra <atishp@rivosinc.com>
Subject: Re: [RFC 4/9] drivers/perf: riscv: Read upper bits of a firmware
 counter
Message-ID: <20231207-fidgeting-plywood-8347d9d346be@wendy>
References: <20231205024310.1593100-1-atishp@rivosinc.com>
 <20231205024310.1593100-5-atishp@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20231205024310.1593100-5-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_043320_093960_6F31944B 
X-CRM114-Status: GOOD (  26.15  )
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
Content-Type: multipart/mixed; boundary="===============0758350819996470319=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0758350819996470319==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XhRhZMNOguKWXngK"
Content-Disposition: inline

--XhRhZMNOguKWXngK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2023 at 06:43:05PM -0800, Atish Patra wrote:
> SBI v2.0 introduced a explicit function to read the upper bits
> for any firmwar counter width that is longer than XLEN. Currently,
> this is only applicable for RV32 where firmware counter can be
> 64 bit.

The v2.0 spec explicitly says that this function returns the upper
32 bits of the counter for rv32 and will always return 0 for rv64
or higher. The commit message here seems overly generic compared to
the actual definition in the spec, and makes it seem like it could
be used with a 128 bit counter on rv64 to get the upper 64 bits.

I tried to think about what "generic" situation the commit message
had been written for, but the things I came up with would all require
changes to the spec to define behaviour for FID #5 and/or FID #1, so
in the end I couldn't figure out the rationale behind the non-committal
wording used here.

>=20
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 40a335350d08..1c9049e6b574 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -490,16 +490,23 @@ static u64 pmu_sbi_ctr_read(struct perf_event *even=
t)
>  	struct hw_perf_event *hwc =3D &event->hw;
>  	int idx =3D hwc->idx;
>  	struct sbiret ret;
> -	union sbi_pmu_ctr_info info;
>  	u64 val =3D 0;
> +	union sbi_pmu_ctr_info info =3D pmu_ctr_list[idx];
> =20
>  	if (pmu_sbi_is_fw_event(event)) {
>  		ret =3D sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ,
>  				hwc->idx, 0, 0, 0, 0, 0);
>  		if (!ret.error)
>  			val =3D ret.value;
> +#if defined(CONFIG_32BIT)

Why is this not IS_ENABLED()? The code below uses one. You could then
fold it into the if statement below.

> +		if (sbi_v2_available && info.width >=3D 32) {

 >=3D 32? I know it is from the spec, but why does the spec define it as
 "One less than number of bits in CSR"? Saving bits in the structure I
 guess?

> +			ret =3D sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ_HI,
> +					hwc->idx, 0, 0, 0, 0, 0);

> +			if (!ret.error)
> +				val =3D val | ((u64)ret.value << 32);

If the first ecall fails but the second one doesn't won't we corrupt
val by only setting the upper bits? If returning val =3D=3D 0 is the thing
to do in the error case (which it is in the existing code) should the
first `if (!ret.error)` become `if (ret.error)` -> `return 0`?


> +				val =3D val | ((u64)ret.value << 32);

Also, |=3D ?

Cheers,
Conor.

> +		}
> +#endif
>  	} else {
> -		info =3D pmu_ctr_list[idx];
>  		val =3D riscv_pmu_ctr_read_csr(info.csr);
>  		if (IS_ENABLED(CONFIG_32BIT))
>  			val =3D ((u64)riscv_pmu_ctr_read_csr(info.csr + 0x80)) << 31 | val;
> --=20
> 2.34.1
>=20

--XhRhZMNOguKWXngK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXG7UwAKCRB4tDGHoIJi
0r2OAQCApjbKr5g5FWhR6Dh2IJ77Aicsmju3mhbnvHV+FF5kyQD3ZQ8zb96npad+
hNqsfLMRc6TW40sbKjhC72+9dmhHBA==
=xm03
-----END PGP SIGNATURE-----

--XhRhZMNOguKWXngK--


--===============0758350819996470319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0758350819996470319==--

