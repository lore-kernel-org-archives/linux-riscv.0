Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB9AC4829B
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 09:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wqws/eRo/0uSG1YwKV03dt/HjTLpoLFEV7AY+yJNmqA=; b=wdgde2iOkuXTQr
	Sm3RWCWIPkTJtT8H6RbucZptVLbdC4N4kArib27J+mLPArSos3UObXdJiAnjmEsMzlrBygBDNQ7mB
	rzmvT7Ubd9ppbtUo+Y6aIODJGwS3athgJxD/HF8IX1Nz/04ktzK/sUFjsQADw8MCgKpV0vnsTxqiP
	ydmeXF9C291tOd0XTx81nvV+lv8lCbOv9v74fX/OpXbm3mVzfT35xpA4LqR6OS/X0/yZsNeGPSBM8
	0Uxeg2hq3+G1t/orfpSyzYnIG/VCtgDir6MhA9WLsmc0dHJpfUxkvcgADFy4ybIeLpgIwPZvprK4C
	jmwdS948Sqo74Dmf7Nsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZSxn-00000004mHk-0KQv;
	Mon, 12 Feb 2024 09:50:59 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZSxk-00000004mHF-0qkG
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 09:50:57 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a28a6cef709so394456866b.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Feb 2024 01:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1707731453; x=1708336253; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pMNSfL2Ym6c7Zezy/ui/ZcWVA+HK7KYShyTz/+IryeE=;
        b=VjkSJxW6/ncfXlKm56rTpuQgMyYbGDdNKyVkMGJq2JTCVyrNM1o0dzXJISaz1woRbz
         lcyL8Tl0hvjfcLx4AuJexME3+NKV/yU+lJUllWD+AcfJEBDXFQ1hZSHJuoWaTDe2MNS/
         skfUOGnk6wrynXl2O/0hqJ1HFCBJB43jfhmbpNhKN7byY/w7iiogSknz1uZrHKtm5Nv9
         VhL+P4G4A+BnYhL0kEQjN+44bVRV/SDIkes+FHQWGqKGxFBFfbHAJxGYdgj931+VPh3S
         0oaTTwPSDbDjV/zAykkJKsKcQd9DRtG6tgCscAByQK3FBj6tP47evhdFjfbtmhGTzWde
         tsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707731453; x=1708336253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMNSfL2Ym6c7Zezy/ui/ZcWVA+HK7KYShyTz/+IryeE=;
        b=hAaaaI7eyOU/XTTPM/SnPEEbm840Xiifoo7U2pw2seHJa0VLxM5IAyX3UocrV96F1K
         tOIaUKSlBsClA//rR2FkT+Ecq+aXNZTQlFPHEszGWURudb7ik8QQ4qkmcaziRdqTHw9z
         839FHDjSTWhUW+OUAmEJfNpv3K3abl393zysgdgVL6VVj12LlnofjYq3gzeSDYHdYMJO
         MNw2m7HGO8iazNgywGfKNslel4YsUuMfHEuh9L8ocOyVc59r26/ceM+4M8G2rQQ9pP3y
         bgqApdF+ejsLNLR2XIuf84jjL+dJBpWCCjo3thlk05LU60G2tu/3f+srFZjvrDKMhyTj
         fA1g==
X-Gm-Message-State: AOJu0YxxivdyN64i1ShPQDuu0XeWaRNnINoc/LXvpNMsYxE43njxYmmR
	llfHgF9+mp//jGMzlXXhzlwF5PLBMb8ifAkDY0/9E19bYeE4Yey9cFONBIW/EuQ=
X-Google-Smtp-Source: AGHT+IEHefmFK6RXs1piHINjPr7eU8fn6FRyby0+Gy/AFZ59WWztdnDQmxT+9zsovkLT+qfD48oHDw==
X-Received: by 2002:a17:906:d96a:b0:a3c:89b0:e668 with SMTP id rp10-20020a170906d96a00b00a3c89b0e668mr2065479ejb.36.1707731453006;
        Mon, 12 Feb 2024 01:50:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV/aUg8qs/APJHqvwjc9NwN6a0aFyGrqC2ylHNgM5CI/v8vXV8t8UX2WQWPrM0ITfPUHr+nLSn4RXeSNScuhY50CcgdM6xIzesOPG12JxVjNtQs14tOLowHkSS2pg/wL6NWvZto8iuT3MOSt7h4I52HNqKRBZw0/1eR9fHg6dtENg==
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id kj7-20020a170907764700b00a3c2003ac07sm26707ejc.146.2024.02.12.01.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 01:50:52 -0800 (PST)
Date: Mon, 12 Feb 2024 10:50:51 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH -fixes 1/2] riscv: Fix enabling cbo.zero when running in
 M-mode
Message-ID: <20240212-7e10c9a05a0035d3542df1bf@orel>
References: <20240212022642.1968739-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240212022642.1968739-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_015056_265687_2FD0A500 
X-CRM114-Status: GOOD (  17.19  )
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

On Sun, Feb 11, 2024 at 06:26:14PM -0800, Samuel Holland wrote:
> When the kernel is running in M-mode, the CBZE bit must be set in the
> menvcfg CSR, not in senvcfg.
> 
> Cc: stable@kernel.org
> Fixes: 43c16d51a19b ("RISC-V: Enable cbo.zero in usermode")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
>  arch/riscv/include/asm/csr.h   | 2 ++
>  arch/riscv/kernel/cpufeature.c | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 510014051f5d..2468c55933cd 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -424,6 +424,7 @@
>  # define CSR_STATUS	CSR_MSTATUS
>  # define CSR_IE		CSR_MIE
>  # define CSR_TVEC	CSR_MTVEC
> +# define CSR_ENVCFG	CSR_MENVCFG
>  # define CSR_SCRATCH	CSR_MSCRATCH
>  # define CSR_EPC	CSR_MEPC
>  # define CSR_CAUSE	CSR_MCAUSE
> @@ -448,6 +449,7 @@
>  # define CSR_STATUS	CSR_SSTATUS
>  # define CSR_IE		CSR_SIE
>  # define CSR_TVEC	CSR_STVEC
> +# define CSR_ENVCFG	CSR_SENVCFG
>  # define CSR_SCRATCH	CSR_SSCRATCH
>  # define CSR_EPC	CSR_SEPC
>  # define CSR_CAUSE	CSR_SCAUSE
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 89920f84d0a3..c5b13f7dd482 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -950,7 +950,7 @@ arch_initcall(check_unaligned_access_all_cpus);
>  void riscv_user_isa_enable(void)
>  {
>  	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))
> -		csr_set(CSR_SENVCFG, ENVCFG_CBZE);
> +		csr_set(CSR_ENVCFG, ENVCFG_CBZE);
>  }
>  
>  #ifdef CONFIG_RISCV_ALTERNATIVE
> -- 
> 2.43.0
>

Deepak has also posted this change[1], but his is missing the Fixes tag.

[1] https://lore.kernel.org/all/20240125024611.1321941-1-debug@rivosinc.com/

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
