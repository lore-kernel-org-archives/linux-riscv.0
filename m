Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977CDC4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 12:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPyt9nrFH8t0oqYCPKuNl+HRp+3NaqsKHB3Vx1a4dQI=; b=W7oVYIWIuxkXOZEdbOXyRq5hOY
	6EaV4fBcoaPpx0zzcQQoq5AaMvahipl7m+4Pv1KaxQN5aEzI4Rr2t+zWrusPsjuIQ/5Y04RlxB/Il
	Ux6NJyPhCpi1UtaV8VPiD7UygNjHHZkVAMMoNzX09EYtpKR1bb8LYJwMjzPAjqeFFHZcJmrWQjlrA
	E4DUwS4BU/051GdgV3iih1kQSlE92nIwKcZnxdgUFL8drji8LA7RMfkfwp3Jdt2XmDgC7GoqNICmd
	FowbSF+hyFaI+FnXyo8Gmg688BbhrAn5hH217QFCpgTrMI6B/Ap7J301rfkjuzj+rwBAUF0xVs3+C
	psT4jM+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBDBs-00Ckgs-2G;
	Thu, 07 Dec 2023 12:09:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBDBp-00Ckfp-0U;
	Thu, 07 Dec 2023 12:09:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1701950953; x=1733486953;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PGxT31Xg37wy+4bCiUCfwZRvaijOlfFRgBP5EBA3Gws=;
  b=ukimiQmuIR0pRK/W0FIS1KJBtldAjLzpCXQiwnKThWfWDKLX9drhZGDv
   IC4L9le3Rdepz8vgdNfDWFe9uzcNjlGHXHsnTcBHviUO80tP0qn//ruDS
   6g7oxigeMISN6WSDiSIrUVatB5K3XMzT6ll07YQqcuvCcftGsXsUOhFP/
   cWGG3kq6nR6+5d1B30w8tRoa56q+c/j/qS1aB9+sy9X4RrKpGXvIgVHRt
   ywbxuo2bHEr1uvEkPf0mtJYSjJJeDZdKZoowfOajZCWtkUe+5zeEOOEA/
   wYfZ53bAGhdR3pX8dfMR+FgVsOAyjjgx2nIJdeo2c18lTInxJqOHB21Z2
   A==;
X-CSE-ConnectionGUID: r15LG2u6TWaA+hfIIKdEMQ==
X-CSE-MsgGUID: wSGchTArRhy/DVmW0Qj2Bg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="asc'?scan'208";a="180081943"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Dec 2023 05:09:06 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 05:08:30 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Dec 2023 05:08:27 -0700
Date: Thu, 7 Dec 2023 12:07:58 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Atish Patra <atishp@rivosinc.com>
Subject: Re: [RFC 2/9] drivers/perf: riscv: Add a flag to indicate SBI v2.0
 support
Message-ID: <20231207-professed-component-84128c06befa@wendy>
References: <20231205024310.1593100-1-atishp@rivosinc.com>
 <20231205024310.1593100-3-atishp@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20231205024310.1593100-3-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_040913_258862_1516FDE5 
X-CRM114-Status: GOOD (  17.60  )
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
Content-Type: multipart/mixed; boundary="===============7915390654739462923=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7915390654739462923==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+sZQ4vQi3zI/C7dL"
Content-Disposition: inline

--+sZQ4vQi3zI/C7dL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2023 at 06:43:03PM -0800, Atish Patra wrote:
> SBI v2.0 added few functions to improve SBI PMU extension. In order
> to be backward compatible, the driver must use these functions only
> if SBI v2.0 is available.
>=20
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

IMO this does not make sense in a patch of its own and should probably
be squashed with the first user for it.

> ---
>  drivers/perf/riscv_pmu_sbi.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 16acd4dcdb96..40a335350d08 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -35,6 +35,8 @@
>  PMU_FORMAT_ATTR(event, "config:0-47");
>  PMU_FORMAT_ATTR(firmware, "config:63");
> =20
> +static bool sbi_v2_available;
> +
>  static struct attribute *riscv_arch_formats_attr[] =3D {
>  	&format_attr_event.attr,
>  	&format_attr_firmware.attr,
> @@ -1108,6 +1110,9 @@ static int __init pmu_sbi_devinit(void)
>  		return 0;
>  	}
> =20
> +	if (sbi_spec_version >=3D sbi_mk_version(2, 0))
> +		sbi_v2_available =3D true;
> +
>  	ret =3D cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
>  				      "perf/riscv/pmu:starting",
>  				      pmu_sbi_starting_cpu, pmu_sbi_dying_cpu);
> --=20
> 2.34.1
>=20

--+sZQ4vQi3zI/C7dL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXG1nQAKCRB4tDGHoIJi
0phjAP0azU1/zzjDgPsIIJnAK22vEXqExrH10eEONV0Q6Qw4TAD+LGAWT5Xv5AM3
SnKvsMXfm2zEtsmp003njCE7XqidDwI=
=Nnit
-----END PGP SIGNATURE-----

--+sZQ4vQi3zI/C7dL--


--===============7915390654739462923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7915390654739462923==--

