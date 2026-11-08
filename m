Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ABB606A320
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 10:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pk4+oRTG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oI+6Xik+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sXx5EYZnWPB4VoJhvtBVGzt4S2vY1GZh10TOiwJv4H4=; b=Pk4+oRTGKKy2/1gU4QyP5/12QJ
	XHhyT1xZDG1hl1/uxZx+6/kc6POHx9cGREmh7Vhc+kwEage4XtPQCYN3eeftY4PL48ZyB+UVYcwcG
	VgU6XO686r1CADo/foyfY7CqvFndaVoCwrByBtB5aD04GIIP/5Zi0Zk9E68GEtaaNMo74CDWbnXwq
	eKPYfUtn9iwL6ziHYKFznYPjHkBMx48TitjzoEoKSOHxojuqYwrhDOU1DVcxUG7bXucUGe82mUcKz
	BmZJv3375kAbLNc2AdLHcPX1zd7cZX+q0RNNeUBfnvfvkWW9ON2t+QMjvRUUV/Q4NG5oOBvDTnJwG
	0Qv1zMfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzrg-0000000Fwt2-3qwO;
	Sun, 08 Nov 2026 10:11:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzrf-0000000Fwso-2xz0
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 10:11:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E46F1611E7;
	Sun,  8 Nov 2026 10:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0441F1F0089F;
	Sun,  8 Nov 2026 10:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794132666;
	bh=60o/q0vImuKetKVKrTKOZ9rHINZBX/j7ahoQlV0VAdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oI+6Xik+eXY8NIXF2d//hjVuRmMCYb3PcXNNpskrqU2Hsx9nanKl4+wwFstWABMsP
	 VFre2gQ0lTUmfpH99jj49gPre8vJiDAba9e4iSWIA1aclUgtyuTb5ac0RcsbctvnmE
	 k4dVL/j8Y0tk8Z9gIGIFS7BGUt3XmGGFoEn0RVTXe5pivetVSWliXgLRFCcDqlFEaQ
	 3NcFeFmzKioN2+i2RJk0q4jgGr8hxeQUnT+OPfUtgkRmEvn5kzkMRxsp3XWa+kfT/x
	 MKXxxpmZcTTBcrporu6MMNY1VUCh5cKmocf9zbz4zJy5RK1Xa78ySUqqKVDbnY1xHB
	 0A4XLw2bvAyww==
Date: Sun, 8 Nov 2026 17:50:54 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <andrew.jones@linux.dev>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Guodong Xu <guodong.xu@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: remove RISCV_ISA_EXT_BUNDLE[_VALIDATE]
Message-ID: <avBF_mFk-qW-IJ2Q@xhacker>
References: <20261106190559.1906130-3-conor@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261106190559.1906130-3-conor@kernel.org>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 07:05:59PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> RISCV_ISA_EXT_BUNDLE actually made sense when it was originally added,
> since it presented a simple interface where users (be that in kernel or
> userspace via things they are presented by the kernel) would check the
> exact extension needed for a feature, rather than muddying the water
> with parent extensions. As a result, the kernel does not track the
> status of the parent extension in the bundle, nor expose it to
> userspace.
> 
> This is in comparison to RISCV_ISA_EXT_SUPERSET,
> where the parent extension provided some explicit value, and would have
> to be checked for itself for some potential feature, and therefore we
> actually track the status of both child and parent extensions, and let
> userspace detect them independently.
> 
> Since we added this stuff, there's been some retroactive extension
> releases by RVI that have made previous monolithic extensions into pure
> wrappers that we intended using RISCV_ISA_EXT_BUNDLE for. Since we
> previously tracked that as one extension, and exported it to users as
> one extension, we can't just use RISCV_ISA_EXT_BUNDLE, and have to use
> RISCV_ISA_EXT_SUPERSET instead and nobody seems to know what to use each
> actually for anymore.
> 
> Just delete RISCV_ISA_EXT_BUNDLE for the sake of consistency between
> things that were always a bundle from ratification and for those
> retroactively made into bundles, with the side benefit of being less
> confusing for those adding extensions to the kernel.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> ---
> Not 100% on if my comments on the initial rationale are right, they're
> just my recollection...
> 
> This is a rebase of the rfc, I didn't change anything functionally I
> just ran it on a board in the interim.
> 
> Cheers,
> Conor
> 
> CC: Paul Walmsley <pjw@kernel.org>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Alexandre Ghiti <alex@ghiti.fr>
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Jisheng Zhang <jszhang@kernel.org>
> CC: Andrew Jones <andrew.jones@linux.dev>
> CC: Charlie Jenkins <thecharlesjenkins@gmail.com>
> CC: Guodong Xu <guodong.xu@oss.qualcomm.com>
> CC: linux-riscv@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> ---
>  arch/riscv/include/asm/cpufeature.h |  8 ---
>  arch/riscv/include/asm/hwcap.h      | 13 +++-
>  arch/riscv/kernel/cpufeature.c      | 97 ++++++++++++++++-------------
>  3 files changed, 64 insertions(+), 54 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index 99799cc6c198..4be952a41bba 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -58,14 +58,6 @@ void riscv_clear_hypervisor_csr(void);
>  #define __RISCV_ISA_EXT_DATA_VALIDATE(_name, _id, _validate) \
>  			_RISCV_ISA_EXT_DATA(_name, _id, NULL, 0, _validate)
>  
> -/* Used to declare pure "lasso" extension (Zk for instance) */
> -#define __RISCV_ISA_EXT_BUNDLE(_name, _bundled_exts) \
> -	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, _bundled_exts, \
> -			    ARRAY_SIZE(_bundled_exts), NULL)
> -#define __RISCV_ISA_EXT_BUNDLE_VALIDATE(_name, _bundled_exts, _validate) \
> -	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, _bundled_exts, \
> -			    ARRAY_SIZE(_bundled_exts), _validate)
> -
>  /* Used to declare extensions that are a superset of other extensions (Zvbb for instance) */
>  #define __RISCV_ISA_EXT_SUPERSET(_name, _id, _sub_exts) \
>  	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts), NULL)
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index b5952db9259f..a1cf9a935519 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -126,10 +126,19 @@
>  #define RISCV_ISA_EXT_ZIC64B		116
>  #define RISCV_ISA_EXT_SV48		117
>  #define RISCV_ISA_EXT_SV57		118
> +#define RISCV_ISA_EXT_ZK		119
> +#define RISCV_ISA_EXT_ZKN		120
> +#define RISCV_ISA_EXT_ZKS		121
> +#define RISCV_ISA_EXT_ZVKN		122
> +#define RISCV_ISA_EXT_ZVKNC		123
> +#define RISCV_ISA_EXT_ZVKNG		124
> +#define RISCV_ISA_EXT_ZVKS		125
> +#define RISCV_ISA_EXT_ZVKSC		126
> +#define RISCV_ISA_EXT_ZVKSG		127
>  
> -#define RISCV_ISA_EXT_XLINUXENVCFG	127
> +#define RISCV_ISA_EXT_XLINUXENVCFG	255
>  
> -#define RISCV_ISA_EXT_MAX		128
> +#define RISCV_ISA_EXT_MAX		256
>  #define RISCV_ISA_EXT_INVALID		U32_MAX
>  
>  #ifdef CONFIG_RISCV_M_MODE
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 72bce616491f..b4ce5221a26c 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -340,14 +340,6 @@ static const unsigned int riscv_a_exts[] = {
>  	RISCV_ISA_EXT_ZALRSC,
>  };
>  
> -#define RISCV_ISA_EXT_ZKN	\
> -	RISCV_ISA_EXT_ZBKB,	\
> -	RISCV_ISA_EXT_ZBKC,	\
> -	RISCV_ISA_EXT_ZBKX,	\
> -	RISCV_ISA_EXT_ZKND,	\
> -	RISCV_ISA_EXT_ZKNE,	\
> -	RISCV_ISA_EXT_ZKNH
> -
>  static int riscv_ext_smcdeleg_validate(const struct riscv_isa_ext_data *data,
>  				       const unsigned long *isa_bitmap)
>  {
> @@ -369,60 +361,77 @@ static int riscv_ext_ssccfg_validate(const struct riscv_isa_ext_data *data,
>  	return -EPROBE_DEFER;
>  }
>  
> -static const unsigned int riscv_zk_bundled_exts[] = {
> -	RISCV_ISA_EXT_ZKN,
> +static const unsigned int riscv_zk_sub_exts[] = {
> +	RISCV_ISA_EXT_ZBKB,
> +	RISCV_ISA_EXT_ZBKC,
> +	RISCV_ISA_EXT_ZBKX,
> +	RISCV_ISA_EXT_ZKND,
> +	RISCV_ISA_EXT_ZKNE,
> +	RISCV_ISA_EXT_ZKNH,
>  	RISCV_ISA_EXT_ZKR,
>  	RISCV_ISA_EXT_ZKT
>  };
>  
> -static const unsigned int riscv_zkn_bundled_exts[] = {
> -	RISCV_ISA_EXT_ZKN
> +static const unsigned int riscv_zkn_sub_exts[] = {
> +	RISCV_ISA_EXT_ZBKB,
> +	RISCV_ISA_EXT_ZBKC,
> +	RISCV_ISA_EXT_ZBKX,
> +	RISCV_ISA_EXT_ZKND,
> +	RISCV_ISA_EXT_ZKNE,
> +	RISCV_ISA_EXT_ZKNH
>  };
>  
> -static const unsigned int riscv_zks_bundled_exts[] = {
> +static const unsigned int riscv_zks_sub_exts[] = {
>  	RISCV_ISA_EXT_ZBKB,
>  	RISCV_ISA_EXT_ZBKC,
>  	RISCV_ISA_EXT_ZKSED,
>  	RISCV_ISA_EXT_ZKSH
>  };
>  
> -#define RISCV_ISA_EXT_ZVKN	\
> -	RISCV_ISA_EXT_ZVKNED,	\
> -	RISCV_ISA_EXT_ZVKNHB,	\
> -	RISCV_ISA_EXT_ZVKB,	\
> -	RISCV_ISA_EXT_ZVKT
>  
> -static const unsigned int riscv_zvkn_bundled_exts[] = {
> -	RISCV_ISA_EXT_ZVKN
> +static const unsigned int riscv_zvkn_sub_exts[] = {
> +	RISCV_ISA_EXT_ZVKNED,
> +	RISCV_ISA_EXT_ZVKNHB,
> +	RISCV_ISA_EXT_ZVKB,
> +	RISCV_ISA_EXT_ZVKT
>  };
>  
> -static const unsigned int riscv_zvknc_bundled_exts[] = {
> -	RISCV_ISA_EXT_ZVKN,
> +static const unsigned int riscv_zvknc_sub_exts[] = {
> +	RISCV_ISA_EXT_ZVKNED,
> +	RISCV_ISA_EXT_ZVKNHB,
> +	RISCV_ISA_EXT_ZVKB,
> +	RISCV_ISA_EXT_ZVKT,
>  	RISCV_ISA_EXT_ZVBC
>  };
>  
> -static const unsigned int riscv_zvkng_bundled_exts[] = {
> -	RISCV_ISA_EXT_ZVKN,
> +static const unsigned int riscv_zvkng_sub_exts[] = {
> +	RISCV_ISA_EXT_ZVKNED,
> +	RISCV_ISA_EXT_ZVKNHB,
> +	RISCV_ISA_EXT_ZVKB,
> +	RISCV_ISA_EXT_ZVKT,
>  	RISCV_ISA_EXT_ZVKG
>  };
>  
> -#define RISCV_ISA_EXT_ZVKS	\
> -	RISCV_ISA_EXT_ZVKSED,	\
> -	RISCV_ISA_EXT_ZVKSH,	\
> -	RISCV_ISA_EXT_ZVKB,	\
> +static const unsigned int riscv_zvks_sub_exts[] = {
> +	RISCV_ISA_EXT_ZVKSED,
> +	RISCV_ISA_EXT_ZVKSH,
> +	RISCV_ISA_EXT_ZVKB,
>  	RISCV_ISA_EXT_ZVKT
> -
> -static const unsigned int riscv_zvks_bundled_exts[] = {
> -	RISCV_ISA_EXT_ZVKS
>  };
>  
> -static const unsigned int riscv_zvksc_bundled_exts[] = {
> -	RISCV_ISA_EXT_ZVKS,
> +static const unsigned int riscv_zvksc_sub_exts[] = {
> +	RISCV_ISA_EXT_ZVKSED,
> +	RISCV_ISA_EXT_ZVKSH,
> +	RISCV_ISA_EXT_ZVKB,
> +	RISCV_ISA_EXT_ZVKT,
>  	RISCV_ISA_EXT_ZVBC
>  };
>  
> -static const unsigned int riscv_zvksg_bundled_exts[] = {
> -	RISCV_ISA_EXT_ZVKS,
> +static const unsigned int riscv_zvksg_sub_exts[] = {
> +	RISCV_ISA_EXT_ZVKSED,
> +	RISCV_ISA_EXT_ZVKSH,
> +	RISCV_ISA_EXT_ZVKB,
> +	RISCV_ISA_EXT_ZVKT,
>  	RISCV_ISA_EXT_ZVKG
>  };
>  
> @@ -606,13 +615,13 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(zbkc, RISCV_ISA_EXT_ZBKC),
>  	__RISCV_ISA_EXT_DATA(zbkx, RISCV_ISA_EXT_ZBKX),
>  	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
> -	__RISCV_ISA_EXT_BUNDLE(zk, riscv_zk_bundled_exts),
> -	__RISCV_ISA_EXT_BUNDLE(zkn, riscv_zkn_bundled_exts),
> +	__RISCV_ISA_EXT_SUPERSET(zk, RISCV_ISA_EXT_ZK, riscv_zk_sub_exts),
> +	__RISCV_ISA_EXT_SUPERSET(zkn, RISCV_ISA_EXT_ZKN, riscv_zkn_sub_exts),
>  	__RISCV_ISA_EXT_DATA(zknd, RISCV_ISA_EXT_ZKND),
>  	__RISCV_ISA_EXT_DATA(zkne, RISCV_ISA_EXT_ZKNE),
>  	__RISCV_ISA_EXT_DATA(zknh, RISCV_ISA_EXT_ZKNH),
>  	__RISCV_ISA_EXT_DATA(zkr, RISCV_ISA_EXT_ZKR),
> -	__RISCV_ISA_EXT_BUNDLE(zks, riscv_zks_bundled_exts),
> +	__RISCV_ISA_EXT_SUPERSET(zks, RISCV_ISA_EXT_ZKS, riscv_zks_sub_exts),
>  	__RISCV_ISA_EXT_DATA(zkt, RISCV_ISA_EXT_ZKT),
>  	__RISCV_ISA_EXT_DATA(zksed, RISCV_ISA_EXT_ZKSED),
>  	__RISCV_ISA_EXT_DATA(zksh, RISCV_ISA_EXT_ZKSH),
> @@ -632,17 +641,17 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(zvfhmin, RISCV_ISA_EXT_ZVFHMIN),
>  	__RISCV_ISA_EXT_DATA_VALIDATE(zvkb, RISCV_ISA_EXT_ZVKB, riscv_ext_vector_crypto_validate),
>  	__RISCV_ISA_EXT_DATA_VALIDATE(zvkg, RISCV_ISA_EXT_ZVKG, riscv_ext_vector_crypto_validate),
> -	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvkn, riscv_zvkn_bundled_exts, riscv_ext_vector_crypto_validate),
> -	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvknc, riscv_zvknc_bundled_exts, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zvkn, RISCV_ISA_EXT_ZVKN, riscv_zvkn_sub_exts, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zvknc, RISCV_ISA_EXT_ZVKNC, riscv_zvknc_sub_exts, riscv_ext_vector_crypto_validate),
>  	__RISCV_ISA_EXT_DATA_VALIDATE(zvkned, RISCV_ISA_EXT_ZVKNED, riscv_ext_vector_crypto_validate),
> -	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvkng, riscv_zvkng_bundled_exts, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zvkng, RISCV_ISA_EXT_ZVKNG, riscv_zvkng_sub_exts, riscv_ext_vector_crypto_validate),
>  	__RISCV_ISA_EXT_DATA_VALIDATE(zvknha, RISCV_ISA_EXT_ZVKNHA, riscv_ext_vector_crypto_validate),
>  	__RISCV_ISA_EXT_DATA_VALIDATE(zvknhb, RISCV_ISA_EXT_ZVKNHB, riscv_ext_vector_crypto_validate),
> -	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvks, riscv_zvks_bundled_exts, riscv_ext_vector_crypto_validate),
> -	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvksc, riscv_zvksc_bundled_exts, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zvks, RISCV_ISA_EXT_ZVKS, riscv_zvks_sub_exts, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zvksc, RISCV_ISA_EXT_ZVKSC, riscv_zvksc_sub_exts, riscv_ext_vector_crypto_validate),
>  	__RISCV_ISA_EXT_DATA_VALIDATE(zvksed, RISCV_ISA_EXT_ZVKSED, riscv_ext_vector_crypto_validate),
>  	__RISCV_ISA_EXT_DATA_VALIDATE(zvksh, RISCV_ISA_EXT_ZVKSH, riscv_ext_vector_crypto_validate),
> -	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvksg, riscv_zvksg_bundled_exts, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zvksg, RISCV_ISA_EXT_ZVKSG, riscv_zvksg_sub_exts, riscv_ext_vector_crypto_validate),
>  	__RISCV_ISA_EXT_DATA_VALIDATE(zvkt, RISCV_ISA_EXT_ZVKT, riscv_ext_vector_crypto_validate),
>  	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
>  	__RISCV_ISA_EXT_DATA_VALIDATE(smcdeleg, RISCV_ISA_EXT_SMCDELEG,
> -- 
> 2.53.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
