Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48565C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 12:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qca1ZwcdOSnCZKY8AafHaCmreMxRuoHqlqCvREJKoc4=; b=IuAj/hcm/dkZwxPBEbhb7puAuc
	MRcccYnC1ZA8A4ipGbvK2Ff3B2F5vym214cgGeaMJHx/OFt7IWgBlrJlRPZwBUuOTfJyoeGrdjDcO
	m6vK94m3pctyFa4g1Z1owkM0BeRqkuIU7epJK0/C7uCbQ5D5L9ZJYwSFb7aVdMSMEalFS755NATWx
	pxbeMiMXQHe7/QQcJipKBO/lhPSvQ/UHsNt9XydetQwKYlOK8sxeXKZ9KApM5BWZnOcXUfASebeuP
	r5ZCxhE5OgWsMtMvr+BfcTZQX8B66puSNlRZavzlpqBDepzRgc7+sG8Lb35dW1VfeDN2/7obSUh8Y
	niriVdTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAqw0-00AFDU-1e;
	Wed, 06 Dec 2023 12:23:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAqvx-00AFDB-1s
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 12:23:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D9A9F61B7C;
	Wed,  6 Dec 2023 12:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566F4C433C8;
	Wed,  6 Dec 2023 12:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701865400;
	bh=/6EQzZgp0Ww/mBKnZKAYlIcPDpye5NyKMqnjTYY9iQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IXrwikfIPVhH137dlbYuL4gvnSqfXtdBRh5+Ben8DXlk7plcFKtdsm/dUchAWtKsW
	 /tSJwWCK4i+RfehYC8kaaUm4sxsXaSkZoS8l99hSFFTPmX2OLizImGq0yFWSmUx3hc
	 4SOOv3Dx+ZNelfpYWjF5expzuFl+4y0ikWq+uswoySV+54pQ8+GUhESdyiF5jwakym
	 3fAvjyUi5pMbI4KYnQ5UDlkmTh8csjH5imqg8hDE4vgZ5fGVxc4u/GHIZ0NdqhWYPO
	 4mHGGxIPD2nbm1AbYyK4VNy5v/KEoIyqO4vuK34wzjn3vng+XREloDjMN1y8WV6+4r
	 1vnTZ7zr9McOw==
Date: Wed, 6 Dec 2023 12:23:16 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	leyfoon.tan@starfivetech.com, jeeheng.sia@starfivetech.com,
	conor.dooley@microchip.com, apatel@ventanamicro.com,
	samuel.holland@sifive.com, songshuaishuai@tinylab.org
Subject: Re: [PATCH v3 1/1] riscv: sbi: Introduce system suspend support
Message-ID: <20231206-prone-detention-8d06fe96f34c@spud>
References: <20231206110807.35882-3-ajones@ventanamicro.com>
 <20231206110807.35882-4-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20231206110807.35882-4-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_042321_728765_4A7F6347 
X-CRM114-Status: GOOD (  20.76  )
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
Content-Type: multipart/mixed; boundary="===============9065658370989463412=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9065658370989463412==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bmL+UDQcgZqtF0gB"
Content-Disposition: inline


--bmL+UDQcgZqtF0gB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 06, 2023 at 12:08:09PM +0100, Andrew Jones wrote:
> When the SUSP SBI extension is present it implies that the standard
> "suspend to RAM" type is available. Wire it up to the generic
> platform suspend support, also applying the already present support
> for non-retentive CPU suspend. When the kernel is built with
> CONFIG_SUSPEND, one can do 'echo mem > /sys/power/state' to suspend.
> Resumption will occur when a platform-specific wake-up event arrives.
>=20
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Tested-by: Samuel Holland <samuel.holland@sifive.com>

> +#ifdef CONFIG_RISCV_SBI
> +static int sbi_system_suspend(unsigned long sleep_type,
> +			      unsigned long resume_addr,
> +			      unsigned long opaque)
> +{
> +	struct sbiret ret;
> +
> +	ret =3D sbi_ecall(SBI_EXT_SUSP, SBI_EXT_SUSP_SYSTEM_SUSPEND,
> +			sleep_type, resume_addr, opaque, 0, 0, 0);
> +	if (ret.error)
> +		return sbi_err_map_linux_errno(ret.error);
> +
> +	return ret.value;
> +}
> +
> +static int sbi_system_suspend_enter(suspend_state_t state)
> +{
> +	return cpu_suspend(SBI_SUSP_SLEEP_TYPE_SUSPEND_TO_RAM, sbi_system_suspe=
nd);
> +}
> +
> +static const struct platform_suspend_ops sbi_system_suspend_ops =3D {
> +	.valid =3D suspend_valid_only_mem,
> +	.enter =3D sbi_system_suspend_enter,
> +};
> +
> +static int __init sbi_system_suspend_init(void)
> +{
> +	if (sbi_spec_version >=3D sbi_mk_version(2, 0) &&
> +	    sbi_probe_extension(SBI_EXT_SUSP) > 0) {
> +		pr_info("SBI SUSP extension detected\n");

Is there any value in probing and printing this stuff out if
the kernel is not actually built with support for suspend?
I can see either that or moving the IS_ENABLED() check so that
it controls whether we even probe for SUSP being valid so
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> +		if (IS_ENABLED(CONFIG_SUSPEND))
> +			suspend_set_ops(&sbi_system_suspend_ops);
> +	}
> +
> +	return 0;
> +}
> +
> +arch_initcall(sbi_system_suspend_init);
> +#endif /* CONFIG_RISCV_SBI */
> --=20
> 2.43.0
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--bmL+UDQcgZqtF0gB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXBnswAKCRB4tDGHoIJi
0uPLAPwK91FNft+UTszCm4i6rAOt6npOuB4J1lqqNkOwqOmhFQD/X4DN67C1FVA0
c2y3pfLGP8yNfsoF/u3o1uYIPRIkLg4=
=iKkD
-----END PGP SIGNATURE-----

--bmL+UDQcgZqtF0gB--


--===============9065658370989463412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9065658370989463412==--

