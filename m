Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5A4C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 21:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37GNqglxoSUeJA3ikCK6zIdfrNp+ZxhIBdkxD3mrG5c=; b=LhKGdOMhKZtv+94fIrpS0HymWI
	9SGnnfMSX68o3iPiImrm+595Wd/Mq3XCRL/1zAZWnQGI/6t+s4hxmmlweV56hiGupAaQfO9TgxOl+
	y7hwEwajzhf8Tmg4ndhkLcTmoRECKyNu1OJFGRG5ncFUsjEu4RfqlskXp5h0/yLg+FmCtZNTDGlbd
	T+8G4j4KoAoRZkedn4nChk9wjgnbs43HmPaG2TyO4gL6Izip+jcwMVRCgj+wPcfJJTHApYCXuYVDY
	IK7WtizLvSf7SIek1KqjVWhCr0hJUZNx0ALtKU7ziHcq+uSkS6ZGnGsA8azuh15oe+PzqeUca0E05
	8k55aBjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjoMu-002uSg-15;
	Tue, 04 Apr 2023 21:39:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjoMr-002uSM-0N
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 21:39:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A9C4C639B3;
	Tue,  4 Apr 2023 21:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B6EC433D2;
	Tue,  4 Apr 2023 21:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680644344;
	bh=XOaw+ianizkDnYdonJkTw/dihp/a3DtdF6mVStpByng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hgNvRurcBL7n/ioKUCt9Nw9UtdE4zMZA4C94FXvLwsgHcT+kZpgBSUWQr+G/zO270
	 XWWgEKhJ6H3Dgo0+h5GDZDEZ9S+NIaSQFpRMpu4aXDrqmohup0CdgaAfVHdQ9BplhV
	 mfMqX8ZIhHE2Zmy8IxCFYlI5Ul6GeEUhV3ilxBg1RIeGvXN3ICXZQDx77KYAaT2kPf
	 IJ4n8Td/i9q8bKNSQPWBlHF9SHdIVnyfqhLNmPHk6yPWkW/mEE2+Fbu4dCEb9IdbFv
	 CcYO1+2/7ApcZLHCvAL05nDlVi+MLMJexbYt/UVK06s+AjO/nHQNF5TVsyM90l8b07
	 b9QgBLaaCOIOQ==
Date: Tue, 4 Apr 2023 22:38:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>, Tom Rix <trix@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Weili Qian <qianweili@huawei.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Mark Gross <markgross@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Len Brown <lenb@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	"David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH V4 19/23] RISC-V: Add ACPI initialization in setup_arch()
Message-ID: <20230404-escalator-fridge-daf9aaffad12@spud>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-20-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230404182037.863533-20-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_143905_252594_29A1D443 
X-CRM114-Status: GOOD (  19.92  )
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
Content-Type: multipart/mixed; boundary="===============2247202158663628864=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2247202158663628864==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DDYTghOmxEGb/QCp"
Content-Disposition: inline


--DDYTghOmxEGb/QCp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 04, 2023 at 11:50:33PM +0530, Sunil V L wrote:
> Initialize the ACPI core for RISC-V during boot.
>=20
> ACPI tables and interpreter are initialized based on
> the information passed from the firmware and the value of
> the kernel parameter 'acpi'.
>=20
> With ACPI support added for RISC-V, the kernel parameter 'acpi'
> is also supported on RISC-V. Hence, update the documentation.
>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

> +	/* Parse the ACPI tables for possible boot-time configuration */
> +	acpi_boot_table_init();
> +	if (acpi_disabled) {
> +		if (IS_ENABLED(CONFIG_BUILTIN_DTB)) {
> +			unflatten_and_copy_device_tree();
> +		} else {
> +			if (early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa))))
> +				unflatten_device_tree();
> +			else
> +				pr_err("No DTB found in kernel mappings\n");
> +		}
> +	} else {
> +		early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa)));

I'm probably forgetting something, but this seems very non-obvious to
me:
Why are you running early_init_dt_verify() when ACPI is enabled?
I think that one deserves a comment so that next time someone looks at
this (that doesn't live in ACPI land) they've know exactly why this is
like it is.

Doubly so since this is likely to change with some of Alex's bits moving
the dtb back into the fixmap.

Cheers,
Conor.

--DDYTghOmxEGb/QCp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCyY7wAKCRB4tDGHoIJi
0ineAP9dZt8LzP73Mz2ZBF25vpCS8jxlJLO9KoLcg8eN+crkiwD+JxJx2myjXj1D
jLO/jiH2JZVRpKsN4XE2HwxmyjOrxwQ=
=T2nq
-----END PGP SIGNATURE-----

--DDYTghOmxEGb/QCp--


--===============2247202158663628864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2247202158663628864==--

