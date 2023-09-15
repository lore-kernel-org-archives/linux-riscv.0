Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A352EE6447
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 08:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZKCENzufySiw1G0XVP8Uz+rlCcLB6CS1IwuDqQxgpE=; b=SShjtC+LVpgxf1EWdKVx0jGTJ8
	mCYIXcBoQtOXYp/Haq2oiUCyxXQSk8zmSb4RY7+MdV++Tc6kJvwNrxCeDkhMtg5BT256tHRmlm9tH
	ocWID1z4qsVDR7tngxuRnYBFqQWpN9Gt7VvGg4ZKdkVekW9qPNme+8nuEh/nvg6aLZth6avXjgL2E
	OeyGTsRKx2ycE0cPttlDyoh+Js2y8TC41hDGMTDI16+mJZT51PXFOo9GUGILcNKAhbNc6DnlzNXIM
	CFnGkCcc8ea0QrH/pBZJEjdob9oUOOI0ToQejVljvm9aNzcq/+T0cD9leP7qXNg6ZadZuCcm2DJKX
	xlcCAMBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh4Sc-00ABBr-2e;
	Fri, 15 Sep 2023 08:45:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh4SZ-00AB8a-2F;
	Fri, 15 Sep 2023 08:45:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1694767555; x=1726303555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H7GanXGftaQ5SpvJrDxJhpXAN84SneN8kwBnokLJ00c=;
  b=wRO5bch5mWuuOBpcnLnNKLeDYlwaI97EbQ/eT39ogM46vwuFc5+ICuyL
   9YOb1qLd2him3mtpR2VH2PVil444ePs/92U8CYtj0OfgL45Pj70R/CEpl
   F6GeGzmlgOi8Q1i4FZ8aEedvhk7AKSKzTHznxOcVot8Fc6Vhy/hmWflS5
   r7ZoBAqIYYDkxBmFIjoYrpWaYOn1xWtU+3HqZef3VyV4/RKnbQoGux7e0
   5NLeJs6SI9oFoQtwTY/ye0P03Dw42Ul3LvUCAc+5I99FXDdUYHU0XfXmD
   jYxB3D3eh7LchcdD36aZc5USfXhuUfyyr+9HbhRLf/NmunCLwNQOs0jnB
   Q==;
X-CSE-ConnectionGUID: RV8QYsOtQfaqLyG7dFyPmg==
X-CSE-MsgGUID: AnUMj2eBQSSJO8MC9D3Jpw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="asc'?scan'208";a="5007679"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Sep 2023 01:45:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 15 Sep 2023 01:45:38 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 15 Sep 2023 01:45:33 -0700
Date: Fri, 15 Sep 2023 09:45:16 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: Re: [PATCH 1/2] RISC-V: Detect and Enable Svadu Extension Support
Message-ID: <20230915-triangle-fool-e7032469d3e1@wendy>
References: <20230915082701.3643-1-yongxuan.wang@sifive.com>
 <20230915082701.3643-2-yongxuan.wang@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230915082701.3643-2-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_014555_829869_B92472F9 
X-CRM114-Status: GOOD (  17.65  )
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
Cc: Heiko Stuebner <heiko@sntech.de>, Kemeng Shi <shikemeng@huaweicloud.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, linux-riscv@lists.infradead.org, alex@ghiti.fr, David Hildenbrand <david@redhat.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, tjytimi@163.com, greentime.hu@sifive.com, wchen <waylingii@gmail.com>, Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linux-kernel@vger.kernel.org, vincent.chen@sifive.com, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============8808791708054470109=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8808791708054470109==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EjQ9rfLhfbgZuC1z"
Content-Disposition: inline

--EjQ9rfLhfbgZuC1z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 15, 2023 at 08:26:57AM +0000, Yong-Xuan Wang wrote:
> We detect Svadu extension support from DTB and add arch_has_hw_pte_young()
> to enable optimization in MGLRU and __wp_page_copy_user() if Svadu
> extension is available.
>=20
> Signed-off-by: Jinyu Tang <tjytimi@163.com>

You're either missing a From: or a Co-developed-by: tag here.

> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>  arch/riscv/include/asm/csr.h     | 1 +
>  arch/riscv/include/asm/hwcap.h   | 1 +
>  arch/riscv/include/asm/pgtable.h | 6 ++++++
>  arch/riscv/kernel/cpufeature.c   | 1 +
>  4 files changed, 9 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 777cb8299551..10648b372a2a 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -194,6 +194,7 @@
>  /* xENVCFG flags */
>  #define ENVCFG_STCE			(_AC(1, ULL) << 63)
>  #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
> +#define ENVCFG_HADE			(_AC(1, ULL) << 61)
>  #define ENVCFG_CBZE			(_AC(1, UL) << 7)
>  #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
>  #define ENVCFG_CBIE_SHIFT		4
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index b7b58258f6c7..1013661d6516 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -58,6 +58,7 @@
>  #define RISCV_ISA_EXT_ZICSR		40
>  #define RISCV_ISA_EXT_ZIFENCEI		41
>  #define RISCV_ISA_EXT_ZIHPM		42
> +#define RISCV_ISA_EXT_SVADU		43
> =20
>  #define RISCV_ISA_EXT_MAX		64
> =20
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pg=
table.h
> index b2ba3f79cfe9..f3d077dff8ac 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -629,6 +629,12 @@ static inline pgprot_t pgprot_writecombine(pgprot_t =
_prot)
>  	return __pgprot(prot);
>  }
> =20
> +#define arch_has_hw_pte_young arch_has_hw_pte_young
> +static inline bool arch_has_hw_pte_young(void)
> +{
> +	return riscv_has_extension_likely(RISCV_ISA_EXT_SVADU);

No hardware currently has this, why is it likely?

> +}
> +
>  /*
>   * THP functions
>   */
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 1cfbba65d11a..ead378c04991 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -178,6 +178,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> +	__RISCV_ISA_EXT_DATA(svadu, RISCV_ISA_EXT_SVADU),

This needs to be documented in riscv/extensions.yaml.

Thanks,
Conor.

>  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>  	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> --=20
> 2.17.1
>=20

--EjQ9rfLhfbgZuC1z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQQZnAAKCRB4tDGHoIJi
0ve4AP9Q0ygRFHy474fh3DdhHwB/cWcWUvu2epcVNm3sD+D+vAD/ThRidAt4fJqZ
9lKQi1tz8nxCOaUKyukoH+PMnCRZrgw=
=tV2Q
-----END PGP SIGNATURE-----

--EjQ9rfLhfbgZuC1z--


--===============8808791708054470109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8808791708054470109==--

