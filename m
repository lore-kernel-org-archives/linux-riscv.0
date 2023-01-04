Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F3BC46467
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 02:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8AqKwkHinDgSsaKD7UmgKvKLtRG4vQe9tu3d7MpP4g=; b=Jue/ymsM7wCf1UARFxxhgpet3E
	0TOtE8wkL2GOlxKZYtk2dbZrhTXGEKwqG+DiNtSW+mmk5M6N4JGObGX9sFQPLph9tdyMsXO9eJMrO
	6ljLRx/hyNP//FTyb01P5W+beYKXVNGlDHaSCZFeyDcSkNbVWbjO8Ryuw+Lg6j6kjbnsbFdcyC41J
	Nx2x33SDm0UKorodluzYOItSACfMpIDnmCHYjXKz/kbdHmDcUJjuc8R0cNqvsFcpA4X3CZ1wKDF/B
	4b1/SLdrvJC0vctiPKTc8mNiph1fjffIphMlNqnBnM3tIgZ2xJKiprEMCTI9/nouL7o8DvDtZfUtU
	oSjwp2cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDFpH-00GY4u-F7; Thu, 05 Jan 2023 02:17:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDCr2-00DETZ-I9
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 23:07:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 793A0B818F2;
	Wed,  4 Jan 2023 23:07:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E56EC433F0;
	Wed,  4 Jan 2023 23:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672873645;
	bh=SuNnedOBTBfRkngA+uwJbPA6/dPQf71AItesDuB3NQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r2H5ihuSQ2Tix3j3i0Qx3h5A1G2BmO25RNvZCbR49C1JYPoGXkElPPjPqlhfo1ZcN
	 M9sTV4KprAeRmQXEY+ALI5Fz1wz3TJZmAm6HMxE8N1BTLYxxAZvtuHDp6mMOngkpad
	 8s3Ta5qEpOX0nF1+1XWTPNa+8XtOtQqFSZDNJp+0Y9gObhfTzsOcsFux4EJqz3D69o
	 VCHS2Padnjk0Bcka/gtsrwMclHgPmdte95W0JNb0cGK1P1F88kv+fvlYuuJMdczvL0
	 RQq1hEveF0mwiEDYTPFQWqH/TatDo8I6mc0nD/z9J0E4wiQpVrvLunKV02yWZhJ77q
	 V6KvQJZqSUo+Q==
Date: Wed, 4 Jan 2023 23:07:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/9] RISC-V: Add AIA related CSR defines
Message-ID: <Y7YGp/7ufyRPhkwg@spud>
References: <20230103141409.772298-1-apatel@ventanamicro.com>
 <20230103141409.772298-2-apatel@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230103141409.772298-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_150728_941176_E0C3F8D8 
X-CRM114-Status: GOOD (  18.44  )
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
Content-Type: multipart/mixed; boundary="===============5163619299791477485=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5163619299791477485==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jxzId6Yfk8IaDWIM"
Content-Disposition: inline


--jxzId6Yfk8IaDWIM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Anup!

On Tue, Jan 03, 2023 at 07:44:01PM +0530, Anup Patel wrote:
> The RISC-V AIA specification improves handling per-HART local interrupts
> in a backward compatible manner. This patch adds defines for new RISC-V
> AIA CSRs.
>=20
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/csr.h | 92 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 0e571f6483d9..4e1356bad7b2 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -73,7 +73,10 @@
>  #define IRQ_S_EXT		9
>  #define IRQ_VS_EXT		10
>  #define IRQ_M_EXT		11
> +#define IRQ_S_GEXT		12
>  #define IRQ_PMU_OVF		13
> +#define IRQ_LOCAL_MAX		(IRQ_PMU_OVF + 1)
> +#define IRQ_LOCAL_MASK		((_AC(1, UL) << IRQ_LOCAL_MAX) - 1)
> =20
>  /* Exception causes */
>  #define EXC_INST_MISALIGNED	0
> @@ -156,6 +159,26 @@
>  				 (_AC(1, UL) << IRQ_S_TIMER) | \
>  				 (_AC(1, UL) << IRQ_S_EXT))
> =20
> +/* AIA CSR bits */
> +#define TOPI_IID_SHIFT		16
> +#define TOPI_IID_MASK		0xfff
> +#define TOPI_IPRIO_MASK		0xff
> +#define TOPI_IPRIO_BITS		8
> +
> +#define TOPEI_ID_SHIFT		16
> +#define TOPEI_ID_MASK		0x7ff
> +#define TOPEI_PRIO_MASK		0x7ff
> +
> +#define ISELECT_IPRIO0		0x30
> +#define ISELECT_IPRIO15		0x3f
> +#define ISELECT_MASK		0x1ff
> +
> +#define HVICTL_VTI		0x40000000
> +#define HVICTL_IID		0x0fff0000
> +#define HVICTL_IID_SHIFT	16
> +#define HVICTL_IPRIOM		0x00000100
> +#define HVICTL_IPRIO		0x000000ff

Why not name these as masks, like you did for the other masks?
Also, the mask/shift defines appear inconsistent. TOPI_IID_MASK is
intended to be used post-shift AFAICT, but HVICTL_IID_SHIFT is intended
to be used *pre*-shift.
Some consistency in naming and function would be great.


> +/* Machine-Level High-Half CSRs (AIA) */
> +#define CSR_MIDELEGH		0x313

I feel like I could find Midelegh in an Irish dictionary lol
Anyways, I went through the CSRs and they do all seem correct.

Thanks,
Conor.



--jxzId6Yfk8IaDWIM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7YGpwAKCRB4tDGHoIJi
0lRTAP4wNZdKZZX9vvp6BuQN+P/gjGLcQs5KY25lQJK75lJ+yQEAgXVYUM3O80Dq
NEcF2/9not7ySdC5sv0F4cG1oEoruAg=
=NNSd
-----END PGP SIGNATURE-----

--jxzId6Yfk8IaDWIM--


--===============5163619299791477485==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5163619299791477485==--

