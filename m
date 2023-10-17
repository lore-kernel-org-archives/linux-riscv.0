Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A9ECDB474
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 07:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jctJoocKibNE1AvPSV9SIQpTuMv9Ni7edvyLWkxvjMw=; b=giitNVElZ+dGkSLxu7UgqP124o
	zkDEDJ6IjDocai72NO/XoCJhokD6PZQw5FtHQsLNzHsf1Rzfl4Yd8agAxtaQ3V8Wm2Q2GhuBYOHK5
	wZMwB6HH9HVaN5nj4NbPepVUU9u+CnTCSr7C+zvqPmEa1y5Xr6rSVYD6WeYPP67kvn9tX2INM+8fm
	noy6FqC9Unq1M6uk+XT2llC6ncQIREEMgLeeMW31yFYl5r7rthozPLV7UXdOLeUrzhNPIT8+LzpsW
	ZKJzCiHTqT+w+CFC9uAqMy5h5U5t7ONtqoB2c+3AhrFreqMIJLBMksyIEQXb50V9v05yeVKf3vT99
	BC6GfwDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qseBw-00BWwi-0A;
	Tue, 17 Oct 2023 07:08:36 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qseBt-00BWvd-1N
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 07:08:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 6AFA2B816EC;
	Tue, 17 Oct 2023 07:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E45D9C433C7;
	Tue, 17 Oct 2023 07:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697526510;
	bh=KyBU6dt3CYdf3enQHahqiAZWcsaI56HgRKHkTWUgbgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nFkzCvI+aRqCWBg3782OqkE7/IaOGSk+bwDUQMjHApV9+XqtBI+W1GuuOAaHkAVS9
	 rHyN3swWPE0c1nObG2eOnK4aao0b58IYHChYgkrAAVLKzW9OXoWxb12K3f9CxIqJbY
	 ejJKxQjITsFEuAlfmzKg32UwA1QHKUZHBWZJMuGYGck9oHiSvLZBlsFoTkAiLisxFf
	 gyS3I5bWfW8he/eLTKNtVknma2uYsX80Tbcl7AvTkjmxrvC4SFRPcDmEeeCabL3sNz
	 TG7mMP3skXidcJisMhmmzqcs1lRpnPRuD6PNRH4NnLIaEF05fiXee+EXl09bObY60/
	 MZ6pVIOwI8CtA==
Date: Tue, 17 Oct 2023 08:08:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v3 1/2] riscv: Add remaining module relocations
Message-ID: <20231017-heaviness-husked-f3b81d5ecdfb@spud>
References: <20231016-module_relocations-v3-0-a667fd6071e9@rivosinc.com>
 <20231016-module_relocations-v3-1-a667fd6071e9@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20231016-module_relocations-v3-1-a667fd6071e9@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_000833_770210_9B44B37E 
X-CRM114-Status: GOOD (  26.33  )
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
Content-Type: multipart/mixed; boundary="===============5681687119260784077=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5681687119260784077==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wrP/R5I4xDPUBiaw"
Content-Disposition: inline


--wrP/R5I4xDPUBiaw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2023 at 10:36:09AM -0700, Charlie Jenkins wrote:
> Add all final module relocations and add error logs explaining the ones
> that are not supported.

In the patchwork automation's clang/llvm allmodconfig:
 ../arch/riscv/kernel/tests/module_test/test_uleb128.S:18:17: error: unknow=
n relocation name
 ../arch/riscv/kernel/tests/module_test/test_uleb128.S:19:17: error: unknow=
n relocation name

(llvm-17 iirc)

Cheers,
Conor.

>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/include/uapi/asm/elf.h |   6 +-
>  arch/riscv/kernel/module.c        | 207 ++++++++++++++++++++++++++++++++=
+-----
>  2 files changed, 187 insertions(+), 26 deletions(-)
>=20
> diff --git a/arch/riscv/include/uapi/asm/elf.h b/arch/riscv/include/uapi/=
asm/elf.h
> index d696d6610231..a9307a1c9ceb 100644
> --- a/arch/riscv/include/uapi/asm/elf.h
> +++ b/arch/riscv/include/uapi/asm/elf.h
> @@ -49,6 +49,7 @@ typedef union __riscv_fp_state elf_fpregset_t;
>  #define R_RISCV_TLS_DTPREL64	9
>  #define R_RISCV_TLS_TPREL32	10
>  #define R_RISCV_TLS_TPREL64	11
> +#define R_RISCV_IRELATIVE	58
> =20
>  /* Relocation types not used by the dynamic linker */
>  #define R_RISCV_BRANCH		16
> @@ -81,7 +82,7 @@ typedef union __riscv_fp_state elf_fpregset_t;
>  #define R_RISCV_ALIGN		43
>  #define R_RISCV_RVC_BRANCH	44
>  #define R_RISCV_RVC_JUMP	45
> -#define R_RISCV_LUI		46
> +#define R_RISCV_RVC_LUI		46
>  #define R_RISCV_GPREL_I		47
>  #define R_RISCV_GPREL_S		48
>  #define R_RISCV_TPREL_I		49
> @@ -93,6 +94,9 @@ typedef union __riscv_fp_state elf_fpregset_t;
>  #define R_RISCV_SET16		55
>  #define R_RISCV_SET32		56
>  #define R_RISCV_32_PCREL	57
> +#define R_RISCV_PLT32		59
> +#define R_RISCV_SET_ULEB128	60
> +#define R_RISCV_SUB_ULEB128	61
> =20
> =20
>  #endif /* _UAPI_ASM_RISCV_ELF_H */
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 7c651d55fcbd..73f47de538d2 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -7,6 +7,7 @@
>  #include <linux/elf.h>
>  #include <linux/err.h>
>  #include <linux/errno.h>
> +#include <linux/kernel.h>
>  #include <linux/moduleloader.h>
>  #include <linux/vmalloc.h>
>  #include <linux/sizes.h>
> @@ -268,6 +269,12 @@ static int apply_r_riscv_align_rela(struct module *m=
e, u32 *location,
>  	return -EINVAL;
>  }
> =20
> +static int apply_r_riscv_add8_rela(struct module *me, u32 *location, Elf=
_Addr v)
> +{
> +	*(u8 *)location +=3D (u8)v;
> +	return 0;
> +}
> +
>  static int apply_r_riscv_add16_rela(struct module *me, u32 *location,
>  				    Elf_Addr v)
>  {
> @@ -289,6 +296,12 @@ static int apply_r_riscv_add64_rela(struct module *m=
e, u32 *location,
>  	return 0;
>  }
> =20
> +static int apply_r_riscv_sub8_rela(struct module *me, u32 *location, Elf=
_Addr v)
> +{
> +	*(u8 *)location -=3D (u8)v;
> +	return 0;
> +}
> +
>  static int apply_r_riscv_sub16_rela(struct module *me, u32 *location,
>  				    Elf_Addr v)
>  {
> @@ -310,31 +323,149 @@ static int apply_r_riscv_sub64_rela(struct module =
*me, u32 *location,
>  	return 0;
>  }
> =20
> -static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
> -				Elf_Addr v) =3D {
> -	[R_RISCV_32]			=3D apply_r_riscv_32_rela,
> -	[R_RISCV_64]			=3D apply_r_riscv_64_rela,
> -	[R_RISCV_BRANCH]		=3D apply_r_riscv_branch_rela,
> -	[R_RISCV_JAL]			=3D apply_r_riscv_jal_rela,
> -	[R_RISCV_RVC_BRANCH]		=3D apply_r_riscv_rvc_branch_rela,
> -	[R_RISCV_RVC_JUMP]		=3D apply_r_riscv_rvc_jump_rela,
> -	[R_RISCV_PCREL_HI20]		=3D apply_r_riscv_pcrel_hi20_rela,
> -	[R_RISCV_PCREL_LO12_I]		=3D apply_r_riscv_pcrel_lo12_i_rela,
> -	[R_RISCV_PCREL_LO12_S]		=3D apply_r_riscv_pcrel_lo12_s_rela,
> -	[R_RISCV_HI20]			=3D apply_r_riscv_hi20_rela,
> -	[R_RISCV_LO12_I]		=3D apply_r_riscv_lo12_i_rela,
> -	[R_RISCV_LO12_S]		=3D apply_r_riscv_lo12_s_rela,
> -	[R_RISCV_GOT_HI20]		=3D apply_r_riscv_got_hi20_rela,
> -	[R_RISCV_CALL_PLT]		=3D apply_r_riscv_call_plt_rela,
> -	[R_RISCV_CALL]			=3D apply_r_riscv_call_rela,
> -	[R_RISCV_RELAX]			=3D apply_r_riscv_relax_rela,
> -	[R_RISCV_ALIGN]			=3D apply_r_riscv_align_rela,
> -	[R_RISCV_ADD16]			=3D apply_r_riscv_add16_rela,
> -	[R_RISCV_ADD32]			=3D apply_r_riscv_add32_rela,
> -	[R_RISCV_ADD64]			=3D apply_r_riscv_add64_rela,
> -	[R_RISCV_SUB16]			=3D apply_r_riscv_sub16_rela,
> -	[R_RISCV_SUB32]			=3D apply_r_riscv_sub32_rela,
> -	[R_RISCV_SUB64]			=3D apply_r_riscv_sub64_rela,
> +static int dynamic_linking_not_supported(struct module *me, u32 *locatio=
n,
> +					 Elf_Addr v)
> +{
> +	pr_err("%s: Dynamic linking not supported in kernel modules PC =3D %p\n=
",
> +	       me->name, location);
> +	return -EINVAL;
> +}
> +
> +static int tls_not_supported(struct module *me, u32 *location, Elf_Addr =
v)
> +{
> +	pr_err("%s: Thread local storage not supported in kernel modules PC =3D=
 %p\n",
> +	       me->name, location);
> +	return -EINVAL;
> +}
> +
> +static int apply_r_riscv_sub6_rela(struct module *me, u32 *location, Elf=
_Addr v)
> +{
> +	*(u8 *)location -=3D (u8)v & 0x3F;
> +	return 0;
> +}
> +
> +static int apply_r_riscv_set6_rela(struct module *me, u32 *location, Elf=
_Addr v)
> +{
> +	*(u8 *)location =3D (*(u8 *)location & 0xc0) | ((u8)v & 0x3F);
> +	return 0;
> +}
> +
> +static int apply_r_riscv_set8_rela(struct module *me, u32 *location, Elf=
_Addr v)
> +{
> +	*(u8 *)location =3D (u8)v;
> +	return 0;
> +}
> +
> +static int apply_r_riscv_set16_rela(struct module *me, u32 *location,
> +				    Elf_Addr v)
> +{
> +	*(u16 *)location =3D (u16)v;
> +	return 0;
> +}
> +
> +static int apply_r_riscv_set32_rela(struct module *me, u32 *location,
> +				    Elf_Addr v)
> +{
> +	*(u32 *)location =3D (u32)v;
> +	return 0;
> +}
> +
> +static int apply_r_riscv_32_pcrel_rela(struct module *me, u32 *location,
> +				       Elf_Addr v)
> +{
> +	*(u32 *)location =3D (u32)v;
> +	return 0;
> +}
> +
> +static int apply_r_riscv_plt32_rela(struct module *me, u32 *location,
> +				    Elf_Addr v)
> +{
> +	*(u32 *)location =3D (u32)v;
> +	return 0;
> +}
> +
> +static int apply_r_riscv_set_uleb128(struct module *me, u32 *location, E=
lf_Addr v)
> +{
> +	/*
> +	 * Relocation is only performed if R_RISCV_SET_ULEB128 is followed by
> +	 * R_RISCV_SUB_ULEB128 so do computation there
> +	 */
> +	return 0;
> +}
> +
> +static int apply_r_riscv_sub_uleb128(struct module *me, u32 *location, E=
lf_Addr v)
> +{
> +	if (v >=3D 128) {
> +		pr_err("%s: uleb128 must be in [0, 127] (not %ld) at PC =3D %p\n",
> +		       me->name, (unsigned long)v, location);
> +		return -EINVAL;
> +	}
> +
> +	*location =3D v;
> +	return 0;
> +}
> +
> +/*
> + * Relocations defined in the riscv-elf-psabi-doc.
> + * This handles static linking only.
> + */
> +static int (*reloc_handlers_rela[])(struct module *me, u32 *location,
> +				    Elf_Addr v) =3D {
> +	[R_RISCV_32] =3D			apply_r_riscv_32_rela,
> +	[R_RISCV_64] =3D			apply_r_riscv_64_rela,
> +	[R_RISCV_RELATIVE] =3D		dynamic_linking_not_supported,
> +	[R_RISCV_COPY] =3D		dynamic_linking_not_supported,
> +	[R_RISCV_JUMP_SLOT] =3D		dynamic_linking_not_supported,
> +	[R_RISCV_TLS_DTPMOD32] =3D	dynamic_linking_not_supported,
> +	[R_RISCV_TLS_DTPMOD64] =3D	dynamic_linking_not_supported,
> +	[R_RISCV_TLS_DTPREL32] =3D	dynamic_linking_not_supported,
> +	[R_RISCV_TLS_DTPREL64] =3D	dynamic_linking_not_supported,
> +	[R_RISCV_TLS_TPREL32] =3D		dynamic_linking_not_supported,
> +	[R_RISCV_TLS_TPREL64] =3D		dynamic_linking_not_supported,
> +	/* 12-15 undefined */
> +	[R_RISCV_BRANCH] =3D		apply_r_riscv_branch_rela,
> +	[R_RISCV_JAL] =3D			apply_r_riscv_jal_rela,
> +	[R_RISCV_CALL] =3D		apply_r_riscv_call_rela,
> +	[R_RISCV_CALL_PLT] =3D		apply_r_riscv_call_plt_rela,
> +	[R_RISCV_GOT_HI20] =3D		apply_r_riscv_got_hi20_rela,
> +	[R_RISCV_TLS_GOT_HI20] =3D	tls_not_supported,
> +	[R_RISCV_TLS_GD_HI20] =3D		tls_not_supported,
> +	[R_RISCV_PCREL_HI20] =3D		apply_r_riscv_pcrel_hi20_rela,
> +	[R_RISCV_PCREL_LO12_I] =3D	apply_r_riscv_pcrel_lo12_i_rela,
> +	[R_RISCV_PCREL_LO12_S] =3D	apply_r_riscv_pcrel_lo12_s_rela,
> +	[R_RISCV_HI20] =3D		apply_r_riscv_hi20_rela,
> +	[R_RISCV_LO12_I] =3D		apply_r_riscv_lo12_i_rela,
> +	[R_RISCV_LO12_S] =3D		apply_r_riscv_lo12_s_rela,
> +	[R_RISCV_TPREL_HI20] =3D		tls_not_supported,
> +	[R_RISCV_TPREL_LO12_I] =3D	tls_not_supported,
> +	[R_RISCV_TPREL_LO12_S] =3D	tls_not_supported,
> +	[R_RISCV_TPREL_ADD] =3D		tls_not_supported,
> +	[R_RISCV_ADD8] =3D		apply_r_riscv_add8_rela,
> +	[R_RISCV_ADD16] =3D		apply_r_riscv_add16_rela,
> +	[R_RISCV_ADD32] =3D		apply_r_riscv_add32_rela,
> +	[R_RISCV_ADD64] =3D		apply_r_riscv_add64_rela,
> +	[R_RISCV_SUB8] =3D		apply_r_riscv_sub8_rela,
> +	[R_RISCV_SUB16] =3D		apply_r_riscv_sub16_rela,
> +	[R_RISCV_SUB32] =3D		apply_r_riscv_sub32_rela,
> +	[R_RISCV_SUB64] =3D		apply_r_riscv_sub64_rela,
> +	/* 41-42 reserved for future standard use */
> +	[R_RISCV_ALIGN] =3D		apply_r_riscv_align_rela,
> +	[R_RISCV_RVC_BRANCH] =3D		apply_r_riscv_rvc_branch_rela,
> +	[R_RISCV_RVC_JUMP] =3D		apply_r_riscv_rvc_jump_rela,
> +	/* 46-50 reserved for future standard use */
> +	[R_RISCV_RELAX] =3D		apply_r_riscv_relax_rela,
> +	[R_RISCV_SUB6] =3D		apply_r_riscv_sub6_rela,
> +	[R_RISCV_SET6] =3D		apply_r_riscv_set6_rela,
> +	[R_RISCV_SET8] =3D		apply_r_riscv_set8_rela,
> +	[R_RISCV_SET16] =3D		apply_r_riscv_set16_rela,
> +	[R_RISCV_SET32] =3D		apply_r_riscv_set32_rela,
> +	[R_RISCV_32_PCREL] =3D		apply_r_riscv_32_pcrel_rela,
> +	[R_RISCV_IRELATIVE] =3D		dynamic_linking_not_supported,
> +	[R_RISCV_PLT32] =3D		apply_r_riscv_plt32_rela,
> +	[R_RISCV_SET_ULEB128] =3D		apply_r_riscv_set_uleb128,
> +	[R_RISCV_SUB_ULEB128] =3D		apply_r_riscv_sub_uleb128,
> +	/* 62-191 reserved for future standard use */
> +	/* 192-255 nonstandard ABI extensions  */
>  };
> =20
>  int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
> @@ -348,6 +479,10 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char=
 *strtab,
>  	unsigned int i, type;
>  	Elf_Addr v;
>  	int res;
> +	bool uleb128_set_exists =3D false;
> +	u32 *uleb128_set_loc;
> +	unsigned long uleb128_set_sym_val;
> +
> =20
>  	pr_debug("Applying relocate section %u to %u\n", relsec,
>  	       sechdrs[relsec].sh_info);
> @@ -425,6 +560,28 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char=
 *strtab,
>  				  me->name);
>  				return -EINVAL;
>  			}
> +		} else if (type =3D=3D R_RISCV_SET_ULEB128) {
> +			if (uleb128_set_exists) {
> +				pr_err("%s: riscv psABI requires the next ULEB128 relocation to come=
 after a R_RISCV_SET_ULEB128 is an R_RISCV_SUB_ULEB128, not another R_RISCV=
_SET_ULEB128.\n",
> +				       me->name);
> +				return -EINVAL;
> +			}
> +			uleb128_set_exists =3D true;
> +			uleb128_set_loc =3D location;
> +			uleb128_set_sym_val =3D
> +				((Elf_Sym *)sechdrs[symindex].sh_addr +
> +					ELF_RISCV_R_SYM(rel[i].r_info))
> +					->st_value +
> +				rel[i].r_addend;
> +		} else if (type =3D=3D R_RISCV_SUB_ULEB128) {
> +			if (uleb128_set_exists && uleb128_set_loc =3D=3D location) {
> +				/* Calculate set and subtraction */
> +				v =3D uleb128_set_sym_val - v;
> +			} else {
> +				pr_err("%s: R_RISCV_SUB_ULEB128 must always be paired with the first=
 R_RISCV_SET_ULEB128 that comes before it. PC =3D %p\n",
> +				       me->name, location);
> +				return -EINVAL;
> +			}
>  		}
> =20
>  		res =3D handler(me, location, v);
>=20
> --=20
> 2.42.0
>=20

--wrP/R5I4xDPUBiaw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS4y6gAKCRB4tDGHoIJi
0g/RAP4prTIEikwmfjarUNEQ6nHJtim9Tu3JCem9U9E9/JJXbQEArn/9WuTDuBoE
eprdkrTp9Z5k07NPzsU3VKQnnsLyCg0=
=wjaz
-----END PGP SIGNATURE-----

--wrP/R5I4xDPUBiaw--


--===============5681687119260784077==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5681687119260784077==--

