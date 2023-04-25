Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42355C77B61
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Apr 2023 06:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwCtK1QUognbjLMbpmWSwOsGfeGCvY/AQB0TsVYm428=; b=yvVFVIT7T4b6f7tdawhpgjsOo7
	G7xkjYEZEXvUmLBnuihXZeBqoPqg/NRzBRkhJ7qIEva8zrf0ArSFBuV3xDuYERdWb+MwjanxcalxH
	WCxQO365PppCjnMP5pWbgXXxd5gLcUId+eesi4bKuPTKfmtMLJyRtbiv6Af7iEQYgOpwMgyiN8P0q
	KcvJjdUjzGKwqjMzzoLk7WNOSOqN79ORS0RX4M636DWpk32RNeD/M2ayWC2chG/0mM7ikzCMLlfif
	saPFqzwbTg25hA5Wu5HWJgLazWdLeRQRE+tMvZV3Wu2bUpxgwwyR0inZij9IEYikU45LbwSCLF8Xh
	3OzbWhtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prCZy-000KVb-2F;
	Tue, 25 Apr 2023 06:55:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prCZu-000KTo-27
	for linux-riscv@lists.infradead.org;
	Tue, 25 Apr 2023 06:55:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1682405706; x=1713941706;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UwpOtiZr3BpxnGpoL7AdUWAXdGQcvEIYVmWvgcNioEM=;
  b=eiD/jQqfkegZT6+fm3uEaXLVuM3VWSrAV7kXuO/Ov4K8+k9xvcYF/dbp
   LAxpwE4Wv1hizetj5fFfSwznORBTiY9wn0tVFitTrSLQMbWqmfMQKrrDn
   rEV+AALvRFJbbmBlcUluOR4yvBAtT7w4+EOEKeUA07JOn5FI1Rhzsoa4z
   0oXShz5IWaGAvhHOEu1liVdviX1NnKIeLVIbsL3sA/rz0VySnd6GzjFqP
   Xm/PLIHUXITBmVXnaw+AAlH6WCFMOZJEHzzb5rtfSL2TnaeEVN8qoBmy2
   fUtNtO8tlmoNGPBc8Sa2DtoBtyoAwkxrwd6JhEWb378cetzr2vlSIKpAK
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,224,1677567600"; 
   d="asc'?scan'208";a="212113698"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Apr 2023 23:54:54 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 24 Apr 2023 23:54:52 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 24 Apr 2023 23:54:51 -0700
Date: Tue, 25 Apr 2023 07:54:33 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Woodrow Shen <woodrow.shen@sifive.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>, <aou@eecs.berkeley.edu>,
	<alexghiti@rivosinc.com>, <greentime.hu@sifive.com>
Subject: Re: [RFC PATCH v1] riscv: mm: Ensure prot of VM_WRITE and VM_EXEC
 must be readable
Message-ID: <20230425-frolic-cough-b775f8d6ca29@wendy>
References: <20230425034407.1601585-1-woodrow.shen@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230425034407.1601585-1-woodrow.shen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_235506_928260_164A2234 
X-CRM114-Status: GOOD (  21.25  )
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
Content-Type: multipart/mixed; boundary="===============1879275258793810193=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1879275258793810193==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hTe38abR0Jep91oq"
Content-Disposition: inline

--hTe38abR0Jep91oq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Hsieh-Tseng,

On Tue, Apr 25, 2023 at 11:44:07AM +0800, Woodrow Shen wrote:
> From: Hsieh-Tseng Shen <woodrow.shen@sifive.com>
>=20
> The commit 8aeb7b1 allows riscv to use mmap with PROT_WRITE only,
> and meanwhile mmap with w+x is also permitted. However, when userspace
> tries to access this page with PROT_WRITE|PROT_EXEC, which causes
> infinite loop at load page fault as well as it triggers soft lockup.
> According to riscv privileged spec, "Writable pages must also be marked
> readable". The fix to drop the `PAGE_COPY_READ_EXEC` and `PAGE_READ_EXEC`
> should be just used instead. This aligns the other arches (i.e arm64)
> for protection_map.
>=20
> Fixes: 8aeb7b1 ("RISC-V: Make mmap() with PROT_WRITE imply PROT_READ")

This fixes tag should be:
Fixes: 8aeb7b17f04e ("RISC-V: Make mmap() with PROT_WRITE imply PROT_READ")
as checkpatch would have told you :/ Perhaps Palmer can fix that up on
application?

> Signed-off-by: Hsieh-Tseng Shen <woodrow.shen@sifive.com>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---

This is not v1, it's v2 right?
Please include a changelog between versions.

Also, what makes it an RFC, it's an actual fix that you would like
merged, right?

Thanks,
Conor.

>  arch/riscv/include/asm/pgtable.h | 3 +--
>  arch/riscv/mm/init.c             | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pg=
table.h
> index f641837ccf31..05eda3281ba9 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -165,8 +165,7 @@ extern struct pt_alloc_ops pt_ops __initdata;
>  					 _PAGE_EXEC | _PAGE_WRITE)
> =20
>  #define PAGE_COPY		PAGE_READ
> -#define PAGE_COPY_EXEC		PAGE_EXEC
> -#define PAGE_COPY_READ_EXEC	PAGE_READ_EXEC
> +#define PAGE_COPY_EXEC		PAGE_READ_EXEC
>  #define PAGE_SHARED		PAGE_WRITE
>  #define PAGE_SHARED_EXEC	PAGE_WRITE_EXEC
> =20
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 0f14f4a8d179..cc48b0d93a98 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -286,7 +286,7 @@ static const pgprot_t protection_map[16] =3D {
>  	[VM_EXEC]					=3D PAGE_EXEC,
>  	[VM_EXEC | VM_READ]				=3D PAGE_READ_EXEC,
>  	[VM_EXEC | VM_WRITE]				=3D PAGE_COPY_EXEC,
> -	[VM_EXEC | VM_WRITE | VM_READ]			=3D PAGE_COPY_READ_EXEC,
> +	[VM_EXEC | VM_WRITE | VM_READ]			=3D PAGE_COPY_EXEC,
>  	[VM_SHARED]					=3D PAGE_NONE,
>  	[VM_SHARED | VM_READ]				=3D PAGE_READ,
>  	[VM_SHARED | VM_WRITE]				=3D PAGE_SHARED,
> --=20
> 2.34.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--hTe38abR0Jep91oq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEd5GQAKCRB4tDGHoIJi
0oCXAQD5HtAAGyY1C59kIUshL3F67FeGAsO/zV/b3qbcNipRoAEAggRgPR4Cqb12
Z238vDQSxbqyFGRqAUhWD2RHLdigPQE=
=Wz3b
-----END PGP SIGNATURE-----

--hTe38abR0Jep91oq--


--===============1879275258793810193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1879275258793810193==--

