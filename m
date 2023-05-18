Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936AEC77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 20:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yl0g7FCjm3rkEMEfrszJ2CS4MYYHITPG6+pSW6sEBOk=; b=DUKHWlEx8k7RdNRmTFT2XOeziu
	wK857foi8YEz4UzCVVIuKfZ8qXlfNgqgox0g0Hu8W57gMyPrU8YvXwW44TI9RqmxsVxcdPVz5cfuH
	OvdNVxYKP0LGqDzFHd/0ult3Nf+EjIvOC+PAU87w5Ht/KzHw+Tkxd1zrLCi4zQpCYBMW0A0lAyjf3
	JdOUwBZh2UMMQPkar4ZqqWxyBVHF1cbQDif2oz50F0Q9t7qeZeglcMrdlvp6OmE+WmVvvyiZdwzIQ
	ca9dyrpGmtGpO4CX11LsmfEX/bldKGseq2qNfyQalW0VW5EtUZ9McuHZilkXWbtcHBguyI1J/UUyR
	ooGlWenA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzkhI-00EAja-1t;
	Thu, 18 May 2023 20:58:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzkhG-00EAik-1o
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 20:58:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2B80961C3F;
	Thu, 18 May 2023 20:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82181C433EF;
	Thu, 18 May 2023 20:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684443480;
	bh=gztsp3fF7F7lE0Gq7hFjQZFysPQRZ4MJDfLKBKu76S8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Myapdnf7TO6ObDDUVUsZTadfQ3aUQr9ByHv3ssFF9IVGAJh7jqnv/RFlm1SeFvafu
	 b16toAhROaXkq4gOWRp0allqQT00zQ7NKxfPL4S8Js98phdqY7fE5gVflhjIW/tsye
	 QrcHPoM7Ol3XsLhjuWGsuFPjZvKpINh9nn5cOA/ydHYcXvr82Be4mOEvG0a3lAZ3vH
	 NNQWxB+AmlErDf+I4oO+rd7KhgnVqw9EFuPG/hqkPGdaBn8C5DylXQsWPL0K0RT6P0
	 yWKtGnLEzlbhLdpz+Txg6a/2ijktxVN20gbUwe3IEJ2IlhLN0psb+NtLF3T25QX2/e
	 O5jXFCyaGabhA==
Date: Thu, 18 May 2023 21:57:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2 8/9] MAINTAINERS: add entry for T-HEAD RISC-V SoC
Message-ID: <20230518-unharmed-stencil-2a18bbdd3651@spud>
References: <20230518184541.2627-1-jszhang@kernel.org>
 <20230518184541.2627-9-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230518184541.2627-9-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_135802_638467_23FE0EDC 
X-CRM114-Status: GOOD (  16.19  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Yangtao Li <frank.li@vivo.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org, Wei Fu <wefu@redhat.com>
Content-Type: multipart/mixed; boundary="===============5583150533603678054=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5583150533603678054==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wXJR5fk22KSm3hPO"
Content-Disposition: inline


--wXJR5fk22KSm3hPO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 02:45:40AM +0800, Jisheng Zhang wrote:
> Currently, I would like to maintain the T-HEAD RISC-V SoC support.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e0ad886d3163..6df20c65798a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18162,6 +18162,12 @@ F:	drivers/perf/riscv_pmu.c
>  F:	drivers/perf/riscv_pmu_legacy.c
>  F:	drivers/perf/riscv_pmu_sbi.c
> =20
> +RISC-V THEAD SoC SUPPORT
> +M:	Jisheng Zhang <jszhang@kernel.org>
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained
> +F:	arch/riscv/boot/dts/thead/
> +
>  RNBD BLOCK DRIVERS
>  M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
>  M:	Jack Wang <jinpu.wang@ionos.com>
> --=20
> 2.40.0
>=20

--wXJR5fk22KSm3hPO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGaRUgAKCRB4tDGHoIJi
0o7QAP9iQ1BXkMIsQtr3zaOwvROUr5+2+UTjp+d2++QKI5bStgD/Xbdu1dJDE1Z6
T1DtDEc65WjaVS7QlpnDfGrWT1HTQA8=
=2+6X
-----END PGP SIGNATURE-----

--wXJR5fk22KSm3hPO--


--===============5583150533603678054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5583150533603678054==--

