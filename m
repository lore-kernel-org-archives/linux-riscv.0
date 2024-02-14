Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB3FC48BEB
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 09:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TSkhA0Gbewfork0aCPo3zrkf29MNgGeq5nqcWhnM1SM=; b=vFwYc4KYKL7UtQ
	VQ5wChUQzmroEMpHVV6Abn2WVaHVuDximrGcRWuicE7ZlS+KT2q/fcI6T8wkYo/p16e1Syc8ixM4P
	VdQ89KffhMypYVCNAgSONTiTB9pAYFmNpjnSCtTUcBDaNr+lgUEVf/SxUpd35t5wAnLJPNz73bbPS
	CpEVcyhC2Ahw6gDJ7jOQy5h5brCDH6kBl/xoELE8J6jy5QRzSJ4Lwf+JGsNFBnRrTuQ810OJRfHlr
	iMH1RYWDI46KiJBa/nDBo+xKZSdDr1pWAkZUMWJDRvSw5NUz/y2S7CEw0S0xuPF2RwQh15mYcvfBO
	dl9D1D+bH4AOQbK/qixA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBZR-0000000CI8i-0KMk;
	Wed, 14 Feb 2024 09:28:49 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBZP-0000000CI7k-0nOd
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 09:28:48 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-33b18099411so3044831f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Feb 2024 01:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1707902925; x=1708507725; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7RPD3F6e/n6JwP4T7PPxVZL5Vj2U+mnXgv62nlhdBHI=;
        b=lD6JTfco7fnUAxAZFv0QWJijm41HDWMMtktDnLE1M+mQE7mahcvy54zHvgRtkOSW27
         uKVs0EdSDZ2xZjQ1K57HjwQFyDSf4FbxzyINkMljbeeY2icEXIzLGebF+otBipPkbf3A
         NddRDIOMg7wSd9wqZIsn+PBUKOC08/5RcGnCQ41mpYWBIzK3GDNs9pc01H8BSaZDVD7w
         4Ac9fg3mKKek3BC9WW5VXcPQDdkZNpzo+tXNMfhXtwbrrGa48UMZGg/eDg8BxzQUBXfG
         1nTE+pMVC2Oe2x26kSSy7BYFqNstb6z1FmdzyBxp1wo/OpwxeteEkgtPcRvOQIoT0Q69
         es8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707902925; x=1708507725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RPD3F6e/n6JwP4T7PPxVZL5Vj2U+mnXgv62nlhdBHI=;
        b=eOLGM1s1fhhZrJdQ4OKkuAqzWqYk3CpijlcILBICNeqAlzXKIj+ZDOEl6odOCt/mTg
         ig//STMZBUXmN8e2w5rA4pewr1k7QsXUmgtI1X2E5jKwb8P7LdCwmGIbU/icjKgIRr7p
         1Urh6tPv8E0mAJBkbVO1XwvvyS5TBTeiQ3di+RAA227RNqiJmgCgCyd/T0Ec6O+iqdzk
         cxEKW5iaXqtavWdXLx262UrmO1y0B4mHEZPz5b6/GzHQsVpk2QZLvqdQLQt1VMT3Q8hd
         zQZ7FPWEvqzTghoGRixun6surE6ZX2/HSU17X44ok8YzhMx8oDE0ieujR64YdsHyY7Ka
         /wfg==
X-Forwarded-Encrypted: i=1; AJvYcCWcybqCC2/9E6tbApxU0npgTdxA0jkFnAjKgCTZtJJ/4WnB+IJKcczJgiH1FgpR5Bquw3A5WyXCFtD0TIen5AgMNu+/cQEx+1mp1qv1oSVq
X-Gm-Message-State: AOJu0YyvzvP2mHT6f5d+6K9Z1/Ik7R1h1BwUP1WWJb4e6io/RaQG/ikB
	5Z8N+fqEw4M5ve5sJj75w9HyOGAUd2p6YcLzyDjHahIFogrSgAm/ORzTVRWr1Nk=
X-Google-Smtp-Source: AGHT+IH/jZlTd5dXwhLTv3vk6Fm0dC5RasOYCQzao7gRpjTcKUsjGiy+bgOehvxuk2rYphfCL5nqtw==
X-Received: by 2002:adf:f7c6:0:b0:33b:1bf4:5c1d with SMTP id a6-20020adff7c6000000b0033b1bf45c1dmr1179404wrq.26.1707902925220;
        Wed, 14 Feb 2024 01:28:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUnrYzeBGnb+//sTFc6PlgGFuTgi8l3H8Jtte+dwqftxG5uCc9kGdXRlafzoB26IjcuXjoYtskir6rdxYVuHyMltRCLWexjRH/2I6HGhsy9rshixT8srkPUHNUebVXYKAXDvaVB3ORfBQK78Ja9NvQ3L8rRpONreDnz9ySxoPX7yI9g5Uvp3soLkeJ462kmSvKCFRdRnUVJ2J0ItvsJXtcowR1y5ellUc2ILrSE
Received: from localhost (cst-prg-65-8.cust.vodafone.cz. [46.135.65.8])
        by smtp.gmail.com with ESMTPSA id c1-20020a056000104100b0033905a60689sm11772751wrx.45.2024.02.14.01.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 01:28:44 -0800 (PST)
Date: Wed, 14 Feb 2024 10:28:43 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	Stefan O'Rear <sorear@fastmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH -fixes v3 1/2] riscv: Fix enabling cbo.zero when running
 in M-mode
Message-ID: <20240214-661604d82db4ef137540b762@orel>
References: <20240214090206.195754-1-samuel.holland@sifive.com>
 <20240214090206.195754-2-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240214090206.195754-2-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_012847_252030_28632363 
X-CRM114-Status: GOOD (  18.04  )
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

On Wed, Feb 14, 2024 at 01:01:56AM -0800, Samuel Holland wrote:
> When the kernel is running in M-mode, the CBZE bit must be set in the
> menvcfg CSR, not in senvcfg.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 43c16d51a19b ("RISC-V: Enable cbo.zero in usermode")
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
> (no changes since v1)
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

After our back and forth on how we determine the existence of the *envcfg
CSRs, I wonder if we shouldn't put a comment above this
riscv_user_isa_enable() function capturing the [current] decision.

Something like

 /*
  * While the [ms]envcfg CSRs weren't defined until priv spec 1.12,
  * they're assumed to be present when an extension is present which
  * specifies [ms]envcfg bit(s). Hence, we don't do any additional
  * priv spec version checks or CSR probes here.
  */

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
