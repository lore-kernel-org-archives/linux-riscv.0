Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAD2EEE270
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 22:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6nu0Zf6Pyb3UMt/aI5d/ve2nA9QswxYJSW2HbCG3UFI=; b=nQpyN/faywWTPe
	ne4Zgf2RU70SHAA+oO+SAFSqHVaecmRvqRVeyqp1EtzrV8Iom7PflTfa2VyGhE5vE7E7ISUksGgSQ
	cS0/m2VEkihrlGiBnko4tCePumvm0B6JrAAF1TrhM+uOiz1EH9ieYnk+epukThIWeyUNDPUvh11OM
	0wQcPluZbEfTzRyMpqoixG6KOyZS9Bvj5FVGHe8jx7VS+8ZlmnWi3EvVtM9krN2qca70KhSMeHSLl
	YJouhT3xNhWJ/WJ2rcZCTJjozybKba2YnjxdDemjjdR12HLR2L6+YqrF60Z50f1FObn82Rq7XT2In
	rZM4rNDaO0wXzmg5vFcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sosc6-0000000EOH9-3e6h;
	Thu, 12 Sep 2024 22:48:34 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sosc2-0000000EOGn-3xrx
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 22:48:32 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-71923d87be4so297393b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 15:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726181310; x=1726786110; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/h00ZjLk2imx8cWKKpvEPhErDm4Vfw4gifc+W6TK3Es=;
        b=It4jx0qU3Z/xBJ+VewFqbfLE31UAU0SUNL1R90qGQ2NumA7KIfzB+LQxp2bebQ5ane
         sGe8PODIMymFGoIObLMeNvjKrfH3qXMg5fbqHTe3UMYK3Dw6YhJ8pgvMqgzVjs15ntlx
         OnDWIan/qlv/CCi816oWks0kGBlMaIW1zTZaqMFTlDgfU21vMO+Iu1gXzTugslCTZQN9
         kpikAdJuAIATBOxfVQD6La/4TsZsOl/MgTPUP55xWBjRPEmq+nTDQ1rCfZdy9f9g78Nn
         00UlXF3mSmKUAVbGMgSPP7WXlDbp/rV7f5iJT4m3PdlxDEQNx+my9/NpF16pHEqJREWb
         a84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726181310; x=1726786110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/h00ZjLk2imx8cWKKpvEPhErDm4Vfw4gifc+W6TK3Es=;
        b=g66qIdnHFgmg0RZ8T6gkesSLZf+dXXEgK+haPc+P+KqE9ymbH90CenPkgz63RDqMln
         VJ31WiRdukj0BF01wcJlYaO1zywpW8Yv2U3tk9W7W0ZtwY/kV/aTGnInvSg4jnkpclV1
         Sfi05ihNEbFBjdL+IDiJjcfqClITI8iyo1cZ2C08/3mX/1dvqDvPCpsfkDpIUk48su7P
         aqRgzAQFtzhKYwN64HrU+T9/rNZlM1iifZRJJ8QTKS2JF7aBlTHj0jnenm2m0ADWIx/S
         2eLPB1UliY+I0iPQxwcf9F2R0nsCi7JWBm3lkwMu5klci74GTbWkr9LQfF7BP0m7LkUB
         NtgA==
X-Gm-Message-State: AOJu0Yw4cgzWW52D3N26y+tPVUxyY9SMLoJw/MFTASQJvgx6raUAHZWq
	skiUqwGlVthVN7ZBqyckI/9SjoKrwNHCMU6o9bVNvtDJ+Vg7zbAHih1I1btzCHc=
X-Google-Smtp-Source: AGHT+IFHKYA2lFjm6mZXPMtdBmTm4ranRMQPIItlOqGD1foZiKQNThK7a9zBsWSaCcACNEYgUZSExg==
X-Received: by 2002:a05:6a00:39aa:b0:714:160e:8f5f with SMTP id d2e1a72fcca58-71936a4f533mr1500265b3a.11.1726181309514;
        Thu, 12 Sep 2024 15:48:29 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-719090d11e6sm5008302b3a.205.2024.09.12.15.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 15:48:28 -0700 (PDT)
Date: Thu, 12 Sep 2024 15:48:26 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 1/3] riscv: Enable cbo.zero only when all harts
 support Zicboz
Message-ID: <ZuNvukQnx9ghn6+6@ghost>
References: <20240718004808.2246354-1-samuel.holland@sifive.com>
 <20240718004808.2246354-2-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240718004808.2246354-2-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_154831_280039_7B7E1148 
X-CRM114-Status: GOOD (  36.93  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, Deepak Gupta <debug@rivosinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 17, 2024 at 05:47:54PM -0700, Samuel Holland wrote:
> Currently, we enable cbo.zero for usermode on each hart that supports
> the Zicboz extension. This means that the [ms]envcfg CSR value may
> differ between harts. Other features, such as pointer masking and CFI,
> require setting [ms]envcfg bits on a per-thread basis. The combination
> of these two adds quite some complexity and overhead to context
> switching, as we would need to maintain two separate masks for the
> per-hart and per-thread bits. Andrew Jones, who originally added Zicboz
> support, writes[1][2]:
> 
>   I've approached Zicboz the same way I would approach all
>   extensions, which is to be per-hart. I'm not currently aware of
>   a platform that is / will be composed of harts where some have
>   Zicboz and others don't, but there's nothing stopping a platform
>   like that from being built.
> 
>   So, how about we add code that confirms Zicboz is on all harts.
>   If any hart does not have it, then we complain loudly and disable
>   it on all the other harts. If it was just a hardware description
>   bug, then it'll get fixed. If there's actually a platform which
>   doesn't have Zicboz on all harts, then, when the issue is reported,
>   we can decide to not support it, support it with defconfig, or
>   support it under a Kconfig guard which must be enabled by the user.
> 
> Let's follow his suggested solution and require the extension to be
> available on all harts, so the envcfg CSR value does not need to change
> when a thread migrates between harts. Since we are doing this for all
> extensions with fields in envcfg, the CSR itself only needs to be saved/
> restored when it is present on all harts.
> 
> This should not be a regression as no known hardware has asymmetric
> Zicboz support, but if anyone reports seeing the warning, we will
> re-evaluate our solution.
> 
> Link: https://lore.kernel.org/linux-riscv/20240322-168f191eeb8479b2ea169a5e@orel/ [1]
> Link: https://lore.kernel.org/linux-riscv/20240323-28943722feb57a41fb0ff488@orel/ [2]
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Deepak Gupta <debug@rivosinc.com>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
> 
> Changes in v3:
>  - Rebase on riscv/for-next
> 
>  arch/riscv/kernel/cpufeature.c | 7 ++++++-
>  arch/riscv/kernel/suspend.c    | 4 ++--
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 0366dc3baf33..4efaf12b470e 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -27,6 +27,8 @@
>  
>  #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
>  
> +static bool any_cpu_has_zicboz;
> +
>  unsigned long elf_hwcap __read_mostly;
>  
>  /* Host ISA bitmap */
> @@ -97,6 +99,7 @@ static int riscv_ext_zicboz_validate(const struct riscv_isa_ext_data *data,
>  		pr_err("Zicboz disabled as cboz-block-size present, but is not a power-of-2\n");
>  		return -EINVAL;
>  	}
> +	any_cpu_has_zicboz = true;
>  	return 0;
>  }
>  
> @@ -874,8 +877,10 @@ unsigned long riscv_get_elf_hwcap(void)
>  
>  void riscv_user_isa_enable(void)
>  {
> -	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))
> +	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
>  		csr_set(CSR_ENVCFG, ENVCFG_CBZE);
> +	else if (any_cpu_has_zicboz)
> +		pr_warn_once("Zicboz disabled as it is unavailable on some harts\n");
>  }
>  
>  #ifdef CONFIG_RISCV_ALTERNATIVE
> diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
> index c8cec0cc5833..9a8a0dc035b2 100644
> --- a/arch/riscv/kernel/suspend.c
> +++ b/arch/riscv/kernel/suspend.c
> @@ -14,7 +14,7 @@
>  
>  void suspend_save_csrs(struct suspend_context *context)
>  {
> -	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_XLINUXENVCFG))
> +	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_XLINUXENVCFG))
>  		context->envcfg = csr_read(CSR_ENVCFG);
>  	context->tvec = csr_read(CSR_TVEC);
>  	context->ie = csr_read(CSR_IE);
> @@ -37,7 +37,7 @@ void suspend_save_csrs(struct suspend_context *context)
>  void suspend_restore_csrs(struct suspend_context *context)
>  {
>  	csr_write(CSR_SCRATCH, 0);
> -	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_XLINUXENVCFG))
> +	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_XLINUXENVCFG))
>  		csr_write(CSR_ENVCFG, context->envcfg);
>  	csr_write(CSR_TVEC, context->tvec);
>  	csr_write(CSR_IE, context->ie);
> -- 
> 2.45.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
