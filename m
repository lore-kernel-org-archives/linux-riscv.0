Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B2AEB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 06:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+f8hIiOBPOBnW7XeJzsSDBTzzgDaHmnYy+TI1pBeF34=; b=CXXPfxDy7dJWatLtjXSsv7Q7t2
	Jxzj1DYyX4n8Dgv+m7BEr3VAe+J53vUkfd9TYyBy84/j1UN+fj1H3ALoturXTb7z38w6FMKpoo28c
	Sq1WQqZHQpL1PCVfZoleS02ZHi9F5UMXn+pf2Od2MVMi+58dBHgfCPf7LsNoDjDChEWkxv73gbp/L
	vfT8JtmHB2O1hnbHISfwy4L3hQC+33vgBBsm30086dfYGllj+igRkYzKWfn0RfnANa+HpYUQJ7eIp
	rGhCW1dMBhWl6FAXAx27BGnrYFuoVCQ1S0PPL+BjHtqaOI+Zd89ja91/izMBZFzm5UCXpeE1IBJ1e
	Ymlg3XyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNDA-009wlh-2z;
	Thu, 20 Jul 2023 06:32:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMND7-009wl2-15
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 06:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689834745; x=1721370745;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NXJkJED8MudXTMwu79GUYLDPwHFyYBvTFVqQJATwOJA=;
  b=u2lLoci4TBpi80dxny/2JdtHINHrDYeJ1J40sWZybFTzn+D8XM1M9RO5
   z6uC4XRwSDvCh8iutku3YGcYS9Nc+Jg+Gu4xJRbRQ/VUQX5GaD8dzgwx9
   u+3OxHgJB4NBNYw7FxDxynLRlVtnk3kld9ZbgCXGxPO5MB0GEE2foK3MR
   2nHLE5P4G0rTkN67ABZuxfo/w/HB5Z0KAXY2/srHqgGw1ySUs974KpHXG
   PO/21SUMMsl45LDKIVdg2uMcJ3jkQFHl6BKTA50ljJaG+8WYACvJXrFKy
   yyomBfST6ZlEMjZXCGaWJYOULajxOPMSVVXWowVCF4ztIi7fve4+d4iUu
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="asc'?scan'208";a="225561845"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jul 2023 23:32:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 19 Jul 2023 23:32:17 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 19 Jul 2023 23:32:15 -0700
Date: Thu, 20 Jul 2023 07:31:42 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Woody Zhang <woodylab@foxmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley
	<conor@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <ajones@ventanamicro.com>
Subject: Re: [PATCH] riscv: add SBI SUSP extension support
Message-ID: <20230720-speller-suffocate-29ee7cc0b1f6@wendy>
References: <tencent_B931BF1864B6AE8C674686ED9852ACFA0609@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_B931BF1864B6AE8C674686ED9852ACFA0609@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_233225_610553_4E5AEC8C 
X-CRM114-Status: GOOD (  22.80  )
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
Content-Type: multipart/mixed; boundary="===============0872956061127942918=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0872956061127942918==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bIP/mw2/ir0BscVj"
Content-Disposition: inline

--bIP/mw2/ir0BscVj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Woody,

On Thu, Jul 20, 2023 at 08:23:19AM +0800, Woody Zhang wrote:
> RISC-V SBI spec 2.0 [1] introduces System Suspend Extension which can be
> used to suspend the platform via SBI firmware.
>=20
> This patch can be tested on Qemu with recent OpenSBI with
> `system-suspend-test` enabled like [2] in DTB.
>=20
> [1] https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.=
adoc
> [2] https://github.com/woodyzhang666/qemu/commit/e4a5120133c1dc354e6ac437=
ec1f870f6c0f6d05
>=20
> Signed-off-by: Woody Zhang <woodylab@foxmail.com>
> ---
>  arch/riscv/include/asm/sbi.h | 10 ++++++++++
>  arch/riscv/kernel/sbi.c      | 26 ++++++++++++++++++++++++++

There's prior art here, that is seemingly more complete:
https://lore.kernel.org/all/20230118180338.6484-2-ajones@ventanamicro.com/
IIRC, the reason it is still in RFC status is that the 2.0 SBI spec is
not yet frozen, so this cannot be merged.

Thanks,
Conor.

>  2 files changed, 36 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 5b4a1bf5f439..3b04016da671 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -30,6 +30,7 @@ enum sbi_ext_id {
>  	SBI_EXT_HSM =3D 0x48534D,
>  	SBI_EXT_SRST =3D 0x53525354,
>  	SBI_EXT_PMU =3D 0x504D55,
> +	SBI_EXT_SUSP =3D 0x53555350,
> =20
>  	/* Experimentals extensions must lie within this range */
>  	SBI_EXT_EXPERIMENTAL_START =3D 0x08000000,
> @@ -236,6 +237,15 @@ enum sbi_pmu_ctr_type {
>  /* Flags defined for counter stop function */
>  #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
> =20
> +enum sbi_ext_susp_fid {
> +	SBI_EXT_SUSP_SYSTEM_SUSPEND =3D 0,
> +};
> +
> +/* SBI suspend sleep types */
> +enum sbi_susp_sleep_type {
> +	SBI_SUSP_SLEEP_TYPE_SUSPEND =3D 0x0,
> +};
> +
>  #define SBI_SPEC_VERSION_DEFAULT	0x1
>  #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
>  #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index c672c8ba9a2a..9a68959f9f18 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -9,8 +9,10 @@
>  #include <linux/init.h>
>  #include <linux/pm.h>
>  #include <linux/reboot.h>
> +#include <linux/suspend.h>
>  #include <asm/sbi.h>
>  #include <asm/smp.h>
> +#include <asm/suspend.h>
> =20
>  /* default SBI version is 0.1 */
>  unsigned long sbi_spec_version __ro_after_init =3D SBI_SPEC_VERSION_DEFA=
ULT;
> @@ -520,6 +522,26 @@ static void sbi_srst_power_off(void)
>  		       SBI_SRST_RESET_REASON_NONE);
>  }
> =20
> +static int sbi_system_suspend(unsigned long arg,
> +		unsigned long resume_entry, unsigned long context)
> +{
> +	struct sbiret ret =3D {0};
> +
> +	ret =3D sbi_ecall(SBI_EXT_SUSP, SBI_EXT_SUSP_SYSTEM_SUSPEND,
> +			SBI_SUSP_SLEEP_TYPE_SUSPEND, resume_entry, context, 0, 0, 0);
> +	return ret.error;
> +}
> +
> +static int sbi_system_suspend_enter(suspend_state_t state)
> +{
> +	return cpu_suspend(0, sbi_system_suspend);
> +}
> +
> +static const struct platform_suspend_ops sbi_suspend_ops =3D {
> +	.valid          =3D suspend_valid_only_mem,
> +	.enter          =3D sbi_system_suspend_enter,
> +};
> +
>  /**
>   * sbi_probe_extension() - Check if an SBI extension ID is supported or =
not.
>   * @extid: The extension ID to be probed.
> @@ -624,6 +646,10 @@ void __init sbi_init(void)
>  			sbi_srst_reboot_nb.priority =3D 192;
>  			register_restart_handler(&sbi_srst_reboot_nb);
>  		}
> +		if (sbi_probe_extension(SBI_EXT_SUSP)) {
> +			pr_info("SBI SUSP extension detected\n");
> +			suspend_set_ops(&sbi_suspend_ops);
> +		}
>  	} else {
>  		__sbi_set_timer =3D __sbi_set_timer_v01;
>  		__sbi_send_ipi	=3D __sbi_send_ipi_v01;
> --=20
> 2.39.2
>=20

--bIP/mw2/ir0BscVj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLjUvwAKCRB4tDGHoIJi
0liCAQDOneTEE/l+NQoyXArGTAg/it54GYEgQyRV+OVw8IPaxgD/a5hWPEPE3qUo
Q7u0xZvKbQpAv2f+EFfYD1Zy6FpnHQM=
=+VoD
-----END PGP SIGNATURE-----

--bIP/mw2/ir0BscVj--


--===============0872956061127942918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0872956061127942918==--

