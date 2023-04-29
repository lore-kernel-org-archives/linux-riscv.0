Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8F0C77B60
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 10:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0X4aHAOPnTlvOVWs3E61W3Q13FB0kRq7s66RaNQ+r4o=; b=PKnxP6FiyKiOJFXQvtcGz38fBF
	9j9YzslrVX4ThvtpG//Kt3/Vx7zNo7wxTLWuLJFdoJRVRvXIpElpi0hsuvl0tQhh8TLwX/W61ldle
	JssreDuHEH2726r9bWXozTUQ5TdqgoZcmok40JjSl3eySAtWb+j3D+YY+xoTlHT/UH0SmvGTBZu+z
	ysKoej5RuVaThQlc/iIj6n9ufkrd1gMUp1pyDMCeogo4+hD6ytvb0737mV4K4O3Uh/1yfXeAqA7CT
	crwoQsYacNj57ZFf50ZPQqG3mP2hHHp+iIe8b+VwRQiAzOMRNWiJUXXATkd0hfcWpzKPshW2RIurs
	pHjcpcnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pshrf-00CeH0-0K;
	Sat, 29 Apr 2023 10:31:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pshrb-00CeBG-1D
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 10:31:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 168DC6101E;
	Sat, 29 Apr 2023 10:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28794C433EF;
	Sat, 29 Apr 2023 10:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682764288;
	bh=0GbmBMGiNiQlIdnACBgahvtc+QtoJehbHv6nICycqIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tFhPkZUDutv1XqNNNayYgpxTWhqBsGyicP5ZE+0P5aZPM1SFgNwGsYutMDbjAeX7r
	 JoIbcHIL0grDinAv1Xen+AI6GLJDOeK7oulXXWtq6Af2EkCNZQ+Mv+TGKx4KpPj8HN
	 o37YI2ZiY580d9dsHNxhOy0NYV9xON8ceNNwkVCsu8Ru8dxYj+hqpK5NDa69iCq5bv
	 r9g9qfYstDE8+Mz8clTHSExMwWUjXwj04kTfT766VTMf5JEJoTxTu2UDU6msp9DTxf
	 zniinNBnHQ9amnPS6KwooRNkDA8OaKb5fE7QYpuHGv+Jrcx6drNQ/sHkF9tOE8VPCP
	 qPbfmrd2AbdWQ==
Date: Sat, 29 Apr 2023 11:31:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Weili Qian <qianweili@huawei.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH V4 13/23] RISC-V: cpufeature: Add ACPI support in
 riscv_fill_hwcap()
Message-ID: <20230429-voucher-tutor-715fd4f6c24e@spud>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-14-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230404182037.863533-14-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_033135_496885_11F410DA 
X-CRM114-Status: GOOD (  16.16  )
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
Content-Type: multipart/mixed; boundary="===============7655757329017660362=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7655757329017660362==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mD53ytQ30VQ4ln/R"
Content-Disposition: inline


--mD53ytQ30VQ4ln/R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Sunil,

On Tue, Apr 04, 2023 at 11:50:27PM +0530, Sunil V L wrote:

> @@ -103,14 +109,36 @@ void __init riscv_fill_hwcap(void)
> =20
>  	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
> =20
> -	for_each_of_cpu_node(node) {
> +	if (!acpi_disabled) {
> +		status =3D acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
> +		if (ACPI_FAILURE(status))
> +			return;
> +	}
> +
> +	for_each_possible_cpu(cpu) {
>  		unsigned long this_hwcap =3D 0;
>  		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
>  		const char *temp;
> =20
> -		if (of_property_read_string(node, "riscv,isa", &isa)) {
> -			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
> -			continue;
> +		if (acpi_disabled) {
> +			node =3D of_cpu_device_node_get(cpu);
> +			if (node) {
> +				rc =3D of_property_read_string(node, "riscv,isa", &isa);
> +				of_node_put(node);
> +				if (rc) {
> +					pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
> +					continue;
> +				}
> +			} else {
> +				pr_warn("Unable to find cpu node\n");
> +				continue;

I was poking at this the last few days and went back to look at the ACPI
code again. Is there a reason we don't do early-return here? IOW:

	node =3D of_cpu_device_node_get(cpu);
	if (!node) {
		pr_warn()
		continue;
	}

	rc =3D of_property_read_string(node, "riscv,isa", &isa);
	of_node_put(node);
	if (rc) {
		pr_warn();
		continue;
	}

Cheers,
Conor.

> +			}
> +		} else {
> +			rc =3D acpi_get_riscv_isa(rhct, cpu, &isa);
> +			if (rc < 0) {
> +				pr_warn("Unable to get ISA for the hart - %d\n", cpu);
> +				continue;
> +			}
>  		}
> =20
>  		temp =3D isa;
> @@ -243,6 +271,9 @@ void __init riscv_fill_hwcap(void)

--mD53ytQ30VQ4ln/R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEzx+AAKCRB4tDGHoIJi
0uDXAP0UihCqegQRGuBLnWtSMvMhsuIza2XwUNXv6Jsjw1EdNwD5AT1aXZpghWod
R72zPlGiSaij2J867SuTR51j5SWNmQE=
=7cU+
-----END PGP SIGNATURE-----

--mD53ytQ30VQ4ln/R--


--===============7655757329017660362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7655757329017660362==--

