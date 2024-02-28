Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFA7C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 13:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j/jaTY219R+M7HoZjn/IyKMg6OiMagJE5pj5hQkw/sg=; b=WRTs8ogJOC+5OX
	5NQujj6h2Xrc6N/3LWCdl4f99cgCvRXXxz237UMwccsG190au0lv6p2nPzsmLNI92D5ppPkTdfn5l
	rc6P2S/OMhkN3aRCcphZxNDhEdjLIpHwfFhwpKkYdtBVYNOvy+O/8LjmAY7/Fkm3MjrbyPTvYUpfp
	nLqdfHlXLkh+DzHF66ft9yBj5MkR53rUax7d7+n4kbGwbVld2vszuF8Wtz6HNsZMnMza+ZP0xB3Ps
	ymC+O8IFLoi6aaQbyevhW6Y0ernLKGLhCmMoNQufZaa9L7vMuLzp6WZ+cKTCnHUPVDmH788FYtEj2
	RVqNOf4FfmlsPKWMJtfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfJyD-00000009SpP-0wCw;
	Wed, 28 Feb 2024 13:27:37 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfJyA-00000009Snd-2MqH
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 13:27:35 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2d23a22233fso58895631fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 05:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709126852; x=1709731652; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=085e3STycEqrCsNI0U1fWcxzFfs9YgyshKRlsnEMVpE=;
        b=aHefjIwVbTrEZcslmMQt6nR7rN+ULuUdDpAsIEkYu1VnvQhJDu0ytOzhRx15wxeybQ
         qeVBPwOhNIIXPrZlsivDnveh+I/3nfy4r7nyk/FtAQBo5nj3l5Ip7g0I7QGBi+1FnJGp
         Lh00r4IGNSIox3u3tWIZMQShdaBlHj0JQ1qFEXtzerdur0khkiz29WXUrvPQRedaroHy
         u9YYMEmcTfeC/zrcVQ1KbknOz00QvAmglOBNISB2sFPVA803aiYCS7k4piUTea4EKU5V
         L1FUmrI0win4cx/5QMzC7oHCIf2ZleM6J4ASMY0rQAuf0WE04neZtyGZZWaMaSCa/BdT
         me7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709126852; x=1709731652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=085e3STycEqrCsNI0U1fWcxzFfs9YgyshKRlsnEMVpE=;
        b=e3nLWhP0Mu1zp3g611M+aQG1RDcW2v4YJ3how1LdQNkId68eK04+1hcSySzieRQA6N
         P+KU+8EJt6s4m2zKg5hhQSRyLWgOgR5iz8HoC1oBpNu3tx48IkcHFKMqYRJpfSHPCkvr
         ap2o7CqpRe5RowKd5H+zXxDP8Gq8C1QN23u3vGr4uXtrrEQQqlUReP/EwYagDr/A6aw3
         4Lbe4jJydXT6m/4/OOvKsC1hpdOnoJSACJhlv02tTbPqQ4OjgduQYgxgPWxHv9TKkpkJ
         eRlZLbA9X7NMTT18f8luO06KSh6xPjOYKoORFMV8RNI2QrxxzdJIskmgGvYicL9U75Ys
         Uc/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXikba862JRRpz/lspwKyi3B9eUGs84IvF/ohmH/Jk9egA6quoSByRDsenHZ01CBSWDsyFvBvcuNuaUTaRsrXgdN6o97Jxe82H2ppC9+MeN
X-Gm-Message-State: AOJu0Yz/Zp383X6HHpKR6BpVDnAGiQj6N69/p5dl/y6ScofNPuUlCfFr
	qjk5SJRbAm0eKCMJNtttMg+YjzdWJfS72wTAtcuU4At3PHCS2TrzOYcdVulCqoI=
X-Google-Smtp-Source: AGHT+IFC0XXC3H5qzKW/aZa5LVkLGjCH85nXFOY7PAeqSwrdiOpz48eXurJvLKthpHRi5VSbPhLa+g==
X-Received: by 2002:a2e:9614:0:b0:2d2:acef:6aca with SMTP id v20-20020a2e9614000000b002d2acef6acamr2443164ljh.41.1709126852478;
        Wed, 28 Feb 2024 05:27:32 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id n17-20020a5d4211000000b0033d97bd5ddasm14525870wrq.85.2024.02.28.05.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 05:27:32 -0800 (PST)
Date: Wed, 28 Feb 2024 14:27:31 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	Stefan O'Rear <sorear@fastmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH -fixes v4 3/3] riscv: Save/restore envcfg CSR during CPU
 suspend
Message-ID: <20240228-4bb96d297dcbe43ed85a9760@orel>
References: <20240228065559.3434837-1-samuel.holland@sifive.com>
 <20240228065559.3434837-4-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240228065559.3434837-4-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_052734_626519_77DDC18E 
X-CRM114-Status: GOOD (  18.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 27, 2024 at 10:55:35PM -0800, Samuel Holland wrote:
> The value of the [ms]envcfg CSR is lost when entering a nonretentive
> idle state, so the CSR must be rewritten when resuming the CPU.
> 
> Cc: <stable@vger.kernel.org> # v6.7+
> Fixes: 43c16d51a19b ("RISC-V: Enable cbo.zero in usermode")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
> Changes in v4:
>  - Check for Xlinuxenvcfg instead of Zicboz
> 
> Changes in v3:
>  - Check for Zicboz instead of the privileged ISA version
> 
> Changes in v2:
>  - Check for privileged ISA v1.12 instead of the specific CSR
>  - Use riscv_has_extension_likely() instead of new ALTERNATIVE()s
> 
>  arch/riscv/include/asm/suspend.h | 1 +
>  arch/riscv/kernel/suspend.c      | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/suspend.h b/arch/riscv/include/asm/suspend.h
> index 02f87867389a..491296a335d0 100644
> --- a/arch/riscv/include/asm/suspend.h
> +++ b/arch/riscv/include/asm/suspend.h
> @@ -14,6 +14,7 @@ struct suspend_context {
>  	struct pt_regs regs;
>  	/* Saved and restored by high-level functions */
>  	unsigned long scratch;
> +	unsigned long envcfg;
>  	unsigned long tvec;
>  	unsigned long ie;
>  #ifdef CONFIG_MMU
> diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
> index 239509367e42..299795341e8a 100644
> --- a/arch/riscv/kernel/suspend.c
> +++ b/arch/riscv/kernel/suspend.c
> @@ -15,6 +15,8 @@
>  void suspend_save_csrs(struct suspend_context *context)
>  {
>  	context->scratch = csr_read(CSR_SCRATCH);
> +	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_XLINUXENVCFG))
> +		context->envcfg = csr_read(CSR_ENVCFG);
>  	context->tvec = csr_read(CSR_TVEC);
>  	context->ie = csr_read(CSR_IE);
>  
> @@ -36,6 +38,8 @@ void suspend_save_csrs(struct suspend_context *context)
>  void suspend_restore_csrs(struct suspend_context *context)
>  {
>  	csr_write(CSR_SCRATCH, context->scratch);
> +	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_XLINUXENVCFG))
> +		csr_write(CSR_ENVCFG, context->envcfg);
>  	csr_write(CSR_TVEC, context->tvec);
>  	csr_write(CSR_IE, context->ie);
>  
> -- 
> 2.43.1
>

Picking _likely vs. _unlikely sometimes feels like flipping a coin, but
we'll presumably be increasing the likelihood of xlinuxenvcfg being
present as we add more and more envcfg using extensions, so maybe we
should use _likely here now, lest we forget to change it someday. But,
either way,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
