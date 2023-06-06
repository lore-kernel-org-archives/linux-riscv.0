Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59210C7EE29
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 15:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZCDbZVVBcD4LlJEfqPDh3gI2xAcqsUrRnAkQaprZusg=; b=10pbXYJOXfYNek817rQ6REYvTP
	9H7Iv4lwwoucNdY1778Mzu0CH235Nqar3f08d/V4/3/Tw2TuKmkIB99/tZaerrrEoMMhKXMqdQzBq
	TADkveB9laBnHoJ5PS9OHOqiortJJVV0uP9a8MBEP6sgh+lwKRzKo5Nnj4B0iEdgzQ0F2cbVysFQk
	rZDezOCy84ObjkVNwwQpj43iFhBK1NXo4phnnCX6wN+x1Y1oM2XMXtW/Dq6ub5o1a6lVHT9tB/N2K
	LaQ9vUVzlfCYWYE/5OGqoaN0wyXo7Qv5fGrdx9dsBFusJWqSeBdqQQGE/W4FtnxOwUw/A/82mODSw
	f1oEoBrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Yih-002GRP-2x;
	Tue, 06 Jun 2023 15:35:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Yid-002GQL-2Y;
	Tue, 06 Jun 2023 15:35:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AFB0662FFB;
	Tue,  6 Jun 2023 15:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6DBBC433D2;
	Tue,  6 Jun 2023 15:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686065734;
	bh=Xt4audZ365Q+PvUv6uNxy2e/yIbqQ28OmbVNfLY4CKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XhNyr11CmQawhEhlHUx6nQMF29fI9ghKpUoFa2oDTUfY710tgzYk6Jwjvl64G/tDI
	 yMnd7Cwk1FNic9l+wO1mxHnW8bioxqlAWLEXHZWFSovLzW88CrrjlWX6o0WVriC7qF
	 HcycoIyk2rDpPXP7X/ltVVilykY/KsGVD5K1CjvmJD83nHZSBFBak89AA4qBgYsIIA
	 D7py/B4/U4ETH9BhM4NdZ2y6xT6nom8LWvv4T+1cSTWte224TlUeU2QXg7R7ph9V4n
	 9ILlUgN5vHsGBoqpHcKJiOpY6D1VQ6Snm0sE1/KFdknH4rFAD0/JETsrf0zz+0Zx2o
	 qSLmbZ9YwkBjA==
Date: Tue, 6 Jun 2023 16:35:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1 -next 1/2] RISC-V: ACPI : Fix for usage of pointers in
 different address space
Message-ID: <20230606-conduit-cupped-1791a640713b@spud>
References: <20230605143512.707533-1-sunilvl@ventanamicro.com>
 <20230605143512.707533-2-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230605143512.707533-2-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_083535_933199_0A570CA2 
X-CRM114-Status: GOOD (  20.89  )
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
Content-Type: multipart/mixed; boundary="===============1601032301317967478=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1601032301317967478==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HLHcBDvaBo7VA5cu"
Content-Disposition: inline


--HLHcBDvaBo7VA5cu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Sunil,

On Mon, Jun 05, 2023 at 08:05:11PM +0530, Sunil V L wrote:
> The arch specific __acpi_map_table can be wrapper around either
> early_memremap or early_ioremap. But early_memremap
> routine works with normal pointers whereas __acpi_map_table expects
> pointers in iomem address space. This causes kernel test bot to fail
> while using the sparse tool. Fix the issue by using early_ioremap and
> similar fix done for __acpi_unmap_table.
>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202305201427.I7QhPjNW-lkp@i=
ntel.com/

Is this
Fixes: a91a9ffbd3a5 ("RISC-V: Add support to build the ACPI core")
?
Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  arch/riscv/kernel/acpi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> index df5a45a2eb93..5ee03ebab80e 100644
> --- a/arch/riscv/kernel/acpi.c
> +++ b/arch/riscv/kernel/acpi.c
> @@ -204,7 +204,7 @@ void __init __iomem *__acpi_map_table(unsigned long p=
hys, unsigned long size)
>  	if (!size)
>  		return NULL;
> =20
> -	return early_memremap(phys, size);
> +	return early_ioremap(phys, size);
>  }
> =20
>  void __init __acpi_unmap_table(void __iomem *map, unsigned long size)
> @@ -212,7 +212,7 @@ void __init __acpi_unmap_table(void __iomem *map, uns=
igned long size)
>  	if (!map || !size)
>  		return;
> =20
> -	early_memunmap(map, size);
> +	early_iounmap(map, size);
>  }
> =20
>  void *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
> --=20
> 2.34.1
>=20

--HLHcBDvaBo7VA5cu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZH9SQQAKCRB4tDGHoIJi
0hZTAQDzgYgjwG/DSfMNyBQuzsY/PvRtR+1BBA2sQdrN9IKUQQEAgKPZEeWa6ykw
OcKB1bLk8MSPeMYY+K3Qn7D0stu5UQs=
=JNG7
-----END PGP SIGNATURE-----

--HLHcBDvaBo7VA5cu--


--===============1601032301317967478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1601032301317967478==--

