Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B2AC36005
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 13:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pt2dEpsi8Cbk8CnXBUviwxM4Pegiv4oiWxhiyF7z7x0=; b=f+ysFYgDEjtLkW
	RL9kSQ2Gzl/x9c2ABqlplpdXOfu5vxjGeTKvSRFXoEdM8wZeiGrBlwuv4IWojNFOswVpcVWAGWKiA
	01e3+QJNWZkIROvBVEjUfCBdOl3sQJojU1zRllM77QaKsewtlEMXBy0t9dMar5Ut9RyJpKr7hPm33
	x2ATZqfJ70mSrXKS8km6vrBaKcgOsCbm995tkZmdDbdOy0cG0m7G15sDSbAsqCSlU29n8DL38WtOg
	pkYhGescNcrFSO8BqKJwu6BSJovc5NWLIuQ/S8vJWjVsdtBoiQVYY/hCzlcd1mac1cChs24zZDIpW
	IgnSYZuihol/8PjAetFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4jM-0000000674n-1JoW;
	Tue, 25 Mar 2025 13:54:12 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4Zz-000000064lR-1UxJ
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 13:44:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0FD6C43152;
	Tue, 25 Mar 2025 13:44:25 +0000 (UTC)
Message-ID: <bff3d8a4-2873-4613-b7fd-de0e8320f191@ghiti.fr>
Date: Tue, 25 Mar 2025 14:44:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] RISC-V: add vector crypto extension validation
 checks
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Eric Biggers <ebiggers@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>, Andy Chiu <andybnac@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250312-abide-pancreas-3576b8c44d2c@spud>
 <20250312-entertain-shaking-b664142c2f99@spud>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250312-entertain-shaking-b664142c2f99@spud>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeehiefhuddtuddukeetkeehhedtffduhfevfeeftdefveffgfeuffejjeejfeekueenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeefuddrfedvrdekuddrudekjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeefuddrfedvrdekuddrudekjedphhgvlhhopegludelvddrudeikedrvddurddvhegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtoheptghonhhorheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegtohhnohhrrdguohholhgvhiesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopegvsghighhgvghrsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdpr
 hgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_064431_548272_0541238E 
X-CRM114-Status: GOOD (  28.67  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Conor,

On 12/03/2025 14:11, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Using Clement's new validation callbacks, support checking that
> dependencies have been satisfied for the vector crpyto extensions.
> Currently riscv_isa_extension_available(<vector crypto>) will return
> true on systems that support the extensions but vector itself has been
> disabled by the kernel, adding validation callbacks will prevent such a
> scenario from occuring and make the behaviour of the extension detection
> functions more consistent with user expectations - it's not expected to
> have to check for vector AND the specific crypto extension.
>
> The Unpriv spec states:
> | The Zvknhb and Zvbc Vector Crypto Extensions --and accordingly the
> | composite extensions Zvkn, Zvknc, Zvkng, and Zvksc-- require a Zve64x
> | base, or application ("V") base Vector Extension. All of the other
> | Vector Crypto Extensions can be built on any embedded (Zve*) or
> | application ("V") base Vector Extension.
>
> While this could be used as the basis for checking that the correct base
> for individual crypto extensions, but that's not really the kernel's job
> in my opinion and it is sufficient to leave that sort of precision to
> the dt-bindings. The kernel only needs to make sure that vector, in some
> form, is available.
>
> Link: https://github.com/riscv/riscv-isa-manual/blob/main/src/vector-crypto.adoc#extensions-overview
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   arch/riscv/kernel/cpufeature.c | 49 +++++++++++++++++++++++-----------
>   1 file changed, 33 insertions(+), 16 deletions(-)
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index dbea6ed3f4da..4fa951e9f1cf 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -141,6 +141,23 @@ static int riscv_ext_vector_float_validate(const struct riscv_isa_ext_data *data
>   	return 0;
>   }
>   
> +static int riscv_ext_vector_crypto_validate(const struct riscv_isa_ext_data *data,
> +					    const unsigned long *isa_bitmap)
> +{
> +	if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
> +		return -EINVAL;
> +
> +	/*
> +	 * It isn't the kernel's job to check that the binding is correct, so
> +	 * it should be enough to check that any of the vector extensions are
> +	 * enabled, which in-turn means that vector is usable in this kernel
> +	 */


I'm not sure to understand this comment. For example, Zvknhb depends on 
Zve64x so only checking for Zve32x would make Zvknhb usable in the 
kernel even though it's actually not supported right? Or am I missing 
something?

Thanks,

Alex


> +	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZVE32X))
> +		return -EPROBE_DEFER;
> +
> +	return 0;
> +}
> +
>   static int riscv_ext_zca_depends(const struct riscv_isa_ext_data *data,
>   				 const unsigned long *isa_bitmap)
>   {
> @@ -400,8 +417,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>   	__RISCV_ISA_EXT_DATA(zksed, RISCV_ISA_EXT_ZKSED),
>   	__RISCV_ISA_EXT_DATA(zksh, RISCV_ISA_EXT_ZKSH),
>   	__RISCV_ISA_EXT_DATA(ztso, RISCV_ISA_EXT_ZTSO),
> -	__RISCV_ISA_EXT_SUPERSET(zvbb, RISCV_ISA_EXT_ZVBB, riscv_zvbb_exts),
> -	__RISCV_ISA_EXT_DATA(zvbc, RISCV_ISA_EXT_ZVBC),
> +	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zvbb, RISCV_ISA_EXT_ZVBB, riscv_zvbb_exts, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(zvbc, RISCV_ISA_EXT_ZVBC, riscv_ext_vector_crypto_validate),
>   	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zve32f, RISCV_ISA_EXT_ZVE32F, riscv_zve32f_exts, riscv_ext_vector_float_validate),
>   	__RISCV_ISA_EXT_DATA_VALIDATE(zve32x, RISCV_ISA_EXT_ZVE32X, riscv_ext_vector_x_validate),
>   	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zve64d, RISCV_ISA_EXT_ZVE64D, riscv_zve64d_exts, riscv_ext_vector_float_validate),
> @@ -409,20 +426,20 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>   	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zve64x, RISCV_ISA_EXT_ZVE64X, riscv_zve64x_exts, riscv_ext_vector_x_validate),
>   	__RISCV_ISA_EXT_DATA(zvfh, RISCV_ISA_EXT_ZVFH),
>   	__RISCV_ISA_EXT_DATA(zvfhmin, RISCV_ISA_EXT_ZVFHMIN),
> -	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),
> -	__RISCV_ISA_EXT_DATA(zvkg, RISCV_ISA_EXT_ZVKG),
> -	__RISCV_ISA_EXT_BUNDLE(zvkn, riscv_zvkn_bundled_exts),
> -	__RISCV_ISA_EXT_BUNDLE(zvknc, riscv_zvknc_bundled_exts),
> -	__RISCV_ISA_EXT_DATA(zvkned, RISCV_ISA_EXT_ZVKNED),
> -	__RISCV_ISA_EXT_BUNDLE(zvkng, riscv_zvkng_bundled_exts),
> -	__RISCV_ISA_EXT_DATA(zvknha, RISCV_ISA_EXT_ZVKNHA),
> -	__RISCV_ISA_EXT_DATA(zvknhb, RISCV_ISA_EXT_ZVKNHB),
> -	__RISCV_ISA_EXT_BUNDLE(zvks, riscv_zvks_bundled_exts),
> -	__RISCV_ISA_EXT_BUNDLE(zvksc, riscv_zvksc_bundled_exts),
> -	__RISCV_ISA_EXT_DATA(zvksed, RISCV_ISA_EXT_ZVKSED),
> -	__RISCV_ISA_EXT_DATA(zvksh, RISCV_ISA_EXT_ZVKSH),
> -	__RISCV_ISA_EXT_BUNDLE(zvksg, riscv_zvksg_bundled_exts),
> -	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(zvkb, RISCV_ISA_EXT_ZVKB, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(zvkg, RISCV_ISA_EXT_ZVKG, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvkn, riscv_zvkn_bundled_exts, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvknc, riscv_zvknc_bundled_exts, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(zvkned, RISCV_ISA_EXT_ZVKNED, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvkng, riscv_zvkng_bundled_exts, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(zvknha, RISCV_ISA_EXT_ZVKNHA, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(zvknhb, RISCV_ISA_EXT_ZVKNHB, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvks, riscv_zvks_bundled_exts, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvksc, riscv_zvksc_bundled_exts, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(zvksed, RISCV_ISA_EXT_ZVKSED, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(zvksh, RISCV_ISA_EXT_ZVKSH, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvksg, riscv_zvksg_bundled_exts, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(zvkt, RISCV_ISA_EXT_ZVKT, riscv_ext_vector_crypto_validate),
>   	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
>   	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
>   	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
