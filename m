Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0BAFF5126
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 16:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XqljLPsSFR22R3WLZrUNDHzsc2aDjygbqlJNzCIXi40=; b=ujSHZcxQ55nn0IUs1epU4OEcGD
	KT5A197C2VUFpK7VsDpZIqJr6PRFOuQ3N5PRgL/ul4u9qvGgrALCCZ36OI+VDNguT57iBLKm9p9vV
	jwhMFknbkdTkQiSKsQw15YEviJ+N9xVYNGfmUlweA2pva0CZVKDhD7hUd8LAvUmc7WHSgbwnrcFaN
	L9SQjFPSIPQ+OGqpZAVXf4tZZeKaonD5Cpu339RY3+bk7yXv0F11G841cZorgqMKVe7WMY5jbbfAU
	yEYGfTiu6DzsJOOOkhw4NVnMVwNPw6qoi7v64uHolEPWUxV0uEEkA6XQQoY0oKvsWfHv4dP0oVPI2
	mXT8gH6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA9JP-00000006ng3-1C7r;
	Tue, 07 Apr 2026 16:29:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA9JN-00000006nfh-33tx
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 16:29:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 09D0640460;
	Tue,  7 Apr 2026 16:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8963AC116C6;
	Tue,  7 Apr 2026 16:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775579396;
	bh=Dm2vtAxO4d+eJhE657w6ZbaNu/kszM+d1xpoMi3ShtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OVjJ6aLB8LWYHohyrDKlzVQD9KCJ8rXEAt0/xlPLCMEFr0NSJwDW9Luabd1etR6q2
	 d6fD5EBGRqvq9rvimcSVgvBVyMpqp8z2q6Ylnj5Cygaa70FjcvSyGluD9z2qvYRwtY
	 zH1z4RbFgL4sQazZgIjqm4wV0Hr2g/EQvnnqX120lSL0X7k8yhWNVIukt86j72ME0M
	 bpN3+UpPLGhZD/C+gmSIG/KVER1r1a7bThyw3q2uTXMM1h53x5uSqKesiNtFYyoUKK
	 Lu5rzc+UT6pz75/aXHxkXGPQ+I8pPJ7ZF6jDxCqXOLNVUYBOJLUv/ag6guWSjEgyTc
	 wJwiw9UfouBjQ==
Date: Tue, 7 Apr 2026 17:29:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/4] riscv: add UltraRISC SoC family Kconfig support
Message-ID: <20260407-shown-guileless-5c8b8d94f5e5@spud>
References: <20260407-ultrarisc-pcie-v2-0-2aa2a19a7fb3@ultrarisc.com>
 <20260407-ultrarisc-pcie-v2-1-2aa2a19a7fb3@ultrarisc.com>
MIME-Version: 1.0
In-Reply-To: <20260407-ultrarisc-pcie-v2-1-2aa2a19a7fb3@ultrarisc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_092957_814208_13EEDAC1 
X-CRM114-Status: GOOD (  17.50  )
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
Content-Type: multipart/mixed; boundary="===============1955352698146048165=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1955352698146048165==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ipgBr6m3SknQlqBO"
Content-Disposition: inline


--ipgBr6m3SknQlqBO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 07, 2026 at 10:40:52AM +0800, Jia Wang wrote:
> The first SoC in the UltraRISC series is UR-DP1000, containing octa
> UltraRISC C100 cores.

Not gonna lie, I find it odd that pcie is where this platform starts
off, but sure. What's the plan for adding the rest of the platform?

>=20
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  arch/riscv/Kconfig.socs | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index d621b85dd63b..98708569ec6a 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -84,6 +84,15 @@ config ARCH_THEAD
>  	help
>  	  This enables support for the RISC-V based T-HEAD SoCs.
> =20
> +config ARCH_ULTRARISC
> +	bool "UltraRISC RISC-V SoCs"
> +	help
> +	  This enables support for UltraRISC SoC platform hardware,
> +	  including boards based on the UR-DP1000.

> +	  UR-DP1000 is an 8-core 64-bit RISC-V SoC that supports
> +	  the RV64GCBHX ISA. It supports Hardware Virtualization
> +	  and RISC-V RV64 ISA H(v1.0) Extension.

Delete this section IMO, doesn't provide any real value. Don't need nor
want the marketing brochure in the help text. The first sentence is
sufficient.

> +
>  config ARCH_VIRT
>  	bool "QEMU Virt Machine"
>  	select POWER_RESET
>=20
> --=20
> 2.34.1
>=20

--ipgBr6m3SknQlqBO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadUw/wAKCRB4tDGHoIJi
0g3sAQDKM8tn3rM8CF+DMNJlgNPn86ka5IW9BtrvktQVr1oD6AD/f8aJJQZJ85Fw
jSDClR3qKh41KzPRHZo0gA2ipUKQjgU=
=TUrq
-----END PGP SIGNATURE-----

--ipgBr6m3SknQlqBO--


--===============1955352698146048165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1955352698146048165==--

