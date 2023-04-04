Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F50C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 21:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUODRUJUg4DXr0slNtk+GhiVpPlgaptITAFClbLOytM=; b=EtBkiWJzb/CJchMms317rQfq1y
	tihd28jvd6neF7cRo/GUYoBbWxQaAyQ/Bil2vTq9HMAfydt1VYIlnlVOElp4SXgO6romxtmF1WKHj
	vjos29fUhP1a+OOEGD/GOAhXcMDwGqEjPbwjcKsW2/nWG7c1gxV3LcV76zwjyVS9YF8T9pE+q66Cl
	H/7XFb1Dy5uBHFNgeS1kNCrXSrFVkHhLzMQLN82XCIo98/edbeSlTbWtnKv/wEQTo6dEIYTQZyvfc
	YCEfpF2fp/IDKbeKB6fD34RWTA0xujqas2sPI44u4Iqc6NdvRzbW/rDsWRd5urGd/MOSVpnU/ljjq
	TLE9Y49A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjoQs-002upD-08;
	Tue, 04 Apr 2023 21:43:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjoQp-002uo1-0j
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 21:43:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C6392634AF;
	Tue,  4 Apr 2023 21:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C79E2C433EF;
	Tue,  4 Apr 2023 21:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680644590;
	bh=PjJPojfcUjqJJox/x1lbJeILeHhYrsUho9i6rxGtkMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hvtcrlyDyrJgbyP/hU+1naLzCdpe+w1xMfRtWKIN0ZDFDyd0ejQiqOsFkXOu9YyRe
	 K6PtKVGQoDF15fbosO3sdi+OhH4Tt7WsxsGIIkoEB7mpzZwpeCjn7HnPbInjoBO/R9
	 H64WH5iJJWA0ER+4zFBrnNPzh9370zzAKJUWncbprk9frzeakUAEj3n2y4T4cW3On2
	 w0kDLgKYqonRvtSWt0WqiRV90dSrOLEd7ukF9AuhtwcM5/sXb27HwygJ08xZ57A9rA
	 6sbcT3wxM//hefzbHCRKL/IjR5clWX+bJ0K4er2zhrUJXY1Xy3L5PDTPd4PQeEqTgd
	 coU9lvXtoVNBA==
Date: Tue, 4 Apr 2023 22:43:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>, Tom Rix <trix@redhat.com>,
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
Subject: Re: [PATCH V4 20/23] RISC-V: Enable ACPI in defconfig
Message-ID: <20230404-dimmed-verbally-3597dcaaf106@spud>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-21-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230404182037.863533-21-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_144311_343992_08D62983 
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
Content-Type: multipart/mixed; boundary="===============3023812838004767067=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3023812838004767067==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ytcuK2YeaS0BDwL+"
Content-Disposition: inline


--ytcuK2YeaS0BDwL+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 04, 2023 at 11:50:34PM +0530, Sunil V L wrote:
> Add support to build ACPI subsystem in defconfig.
>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Dropped another R-b?
https://lore.kernel.org/linux-riscv/91cf4ebd-f22c-4cf9-9fb4-fa6349ea00ab@sp=
ud/

That said...

> ---
>  arch/riscv/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index d98d6e90b2b8..8822b49ddb59 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -238,3 +238,4 @@ CONFIG_RCU_EQS_DEBUG=3Dy
>  # CONFIG_FTRACE is not set
>  # CONFIG_RUNTIME_TESTING_MENU is not set
>  CONFIG_MEMTEST=3Dy
> +CONFIG_ACPI=3Dy

=2E..this is not where savedefconfig puts this for me.
Please move it there & then:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> --=20
> 2.34.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--ytcuK2YeaS0BDwL+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCyZ5gAKCRB4tDGHoIJi
0m1qAQDX9mpCl/eYsoI1vETpvGNq/isf52jwbJv77xDmWnc+BAD+N6jSxPyUDZnh
yfzLVxZyMNfyuaCMv86iHjbrd/BpSwo=
=xVWT
-----END PGP SIGNATURE-----

--ytcuK2YeaS0BDwL+--


--===============3023812838004767067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3023812838004767067==--

