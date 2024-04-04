Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596FCCD1292
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 11:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5r50rJp2y6ZUQTyOZFl0GH48i9ziEPenU54A5YVHGX8=; b=RWjOq6SiuOGjpR
	z8T6roVlK7u4FjAn0u/H18j28RzEW9U9AE6s38cQDE04uT/Pr2fXYDx7sUWSr2WPDZl3fiEtp4DAc
	d8VA8EI7AEAQJSWOz39hADc6L5bXSVLI5dg7YLOEMIDcG6AMBspmAigp62YqA52bdIy8lnHHEWdq8
	J+vbSMvpJGVWEHrij9je5OZPPa14eN4zcueNpWWb2PLbSd02mpp0OTOM0I3VbEh7Bt48aXHOcuPM5
	KgB4NjLQXxG6EDHiZMb2bd/DzaWaiphbnBBuRmqKTIOfA42Sh9R+QN5x75m9BxQA4bQB5qbMvfXjc
	mEeMPC/rk8B3eh8RLVVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLkm-00000002U45-2JJv;
	Thu, 04 Apr 2024 11:59:36 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLkj-00000002U1l-1GUs
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 11:59:34 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-516cdb21b34so701583e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 04:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712231969; x=1712836769; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ild2SXG8B1Be23SyJ9WWYL0M6Mm74nvXGbMkUe/DfRU=;
        b=itbG1hArYFvKLg2HMskF1e15FpO2SxQjQOB/t4fS0wnsoFP+sW9lfZF8NTSKQ+og5H
         MBKcbgOc2Y5TyB6JH1lSzfDkKnNFz2/rnRNAg7N6cRDXwqvPFFIbwM2niJX/h3SVs+Rv
         extkFwrKUnJri4R4YoEEVXc5t1BSfQibzxZRhQGduOWS6+2wmc/01piaISUR5A7BmzDN
         kPVhyWljcRTxb2Pwg2SeKgjFicbky3KJc+Z0RGPmIEYiDsToiXKDGC8gXVGgdumC+HFf
         XBFuEkFqQP+We8tLJjnZcX1gI3X5+lw+gFhgCp0Llxo093+b5aLX8GDxsO4dSNK2vIjM
         IzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712231969; x=1712836769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ild2SXG8B1Be23SyJ9WWYL0M6Mm74nvXGbMkUe/DfRU=;
        b=Nw0xdIuIFNifAki3eOTqEYfqAxElEEnJqI/D4nin7FWl1RSpOxIUjnDNAg2W2pV0J4
         /nodLMdAyK8s1jyDCFisOKMo26UD2DN/tMkVU0u/vT5l+WG4Y1B+XPtpkv7y61m54+T/
         QrclwEcHADvNoh0vj3g6xLj2Chmv3/6H4AP4SDQgzW8PNTbKqaydJvjzh/v/k1KkG1Mt
         /GNal+gnsATsj7yRaa4dwGbttF5igQU3w0GgKtHy0583Zsh41Ifo22W+xlr8jDCv5ZwJ
         fh+0RgoY5vs7D8dl/D4sO2z5893YhJ4pLd+ixqWjG26nXQr2ifuOlzLgWHYr1BYIsNJ7
         TVGw==
X-Forwarded-Encrypted: i=1; AJvYcCVtd78mfiwK5zGjaWrTVZRdFooiq4JYI+PG8Z+kIoixp0KogUH7vE52MezivegwsZM6WkFws5kpDdKPqi2eNBEfMgQTn55igVj+sEdUtrG8
X-Gm-Message-State: AOJu0YyruhE8e5a0vsVb6z7uwmvz6hVCJcq2tnIje8mRptV+Bug08uIs
	RFFRiavfjMVe0pM7dv70yMkG6enl2rGdTyDnyqp/i5tKY+yMCqfAGM8J9Vd71sw=
X-Google-Smtp-Source: AGHT+IFAGisyWQneq8iAvWepxbsWTi3AIzFjCJKFoh+xvPmwn6+pBzt61Jt4NVViUJX93Fiad7cCWw==
X-Received: by 2002:a19:2d07:0:b0:515:b039:373e with SMTP id k7-20020a192d07000000b00515b039373emr1610209lfj.10.1712231968762;
        Thu, 04 Apr 2024 04:59:28 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id d23-20020a056402401700b0056c3964d078sm829519eda.68.2024.04.04.04.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 04:59:28 -0700 (PDT)
Date: Thu, 4 Apr 2024 13:59:27 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Ajay Kaher <akaher@vmware.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Alexey Makhalov <amakhalov@vmware.com>, 
	Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, 
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Will Deacon <will@kernel.org>, x86@kernel.org
Subject: Re: [PATCH v5 09/22] RISC-V: KVM: Rename the SBI_STA_SHMEM_DISABLE
 to a generic name
Message-ID: <20240404-8c20e3269c4648b6ef4c5e2f@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-10-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403080452.1007601-10-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_045933_401687_801244D0 
X-CRM114-Status: GOOD (  21.26  )
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

On Wed, Apr 03, 2024 at 01:04:38AM -0700, Atish Patra wrote:
> SBI_STA_SHMEM_DISABLE is a macro to invoke disable shared memory
> commands. As this can be invoked from other SBI extension context
> as well, rename it to more generic name as SBI_SHMEM_DISABLE.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h  | 2 +-
>  arch/riscv/kernel/paravirt.c  | 6 +++---
>  arch/riscv/kvm/vcpu_sbi_sta.c | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 9aada4b9f7b5..f31650b10899 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -277,7 +277,7 @@ struct sbi_sta_struct {
>  	u8 pad[47];
>  } __packed;
>  
> -#define SBI_STA_SHMEM_DISABLE		-1
> +#define SBI_SHMEM_DISABLE		-1
>  
>  /* SBI spec version fields */
>  #define SBI_SPEC_VERSION_DEFAULT	0x1
> diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
> index 0d6225fd3194..fa6b0339a65d 100644
> --- a/arch/riscv/kernel/paravirt.c
> +++ b/arch/riscv/kernel/paravirt.c
> @@ -62,7 +62,7 @@ static int sbi_sta_steal_time_set_shmem(unsigned long lo, unsigned long hi,
>  	ret = sbi_ecall(SBI_EXT_STA, SBI_EXT_STA_STEAL_TIME_SET_SHMEM,
>  			lo, hi, flags, 0, 0, 0);
>  	if (ret.error) {
> -		if (lo == SBI_STA_SHMEM_DISABLE && hi == SBI_STA_SHMEM_DISABLE)
> +		if (lo == SBI_SHMEM_DISABLE && hi == SBI_SHMEM_DISABLE)
>  			pr_warn("Failed to disable steal-time shmem");
>  		else
>  			pr_warn("Failed to set steal-time shmem");
> @@ -84,8 +84,8 @@ static int pv_time_cpu_online(unsigned int cpu)
>  
>  static int pv_time_cpu_down_prepare(unsigned int cpu)
>  {
> -	return sbi_sta_steal_time_set_shmem(SBI_STA_SHMEM_DISABLE,
> -					    SBI_STA_SHMEM_DISABLE, 0);
> +	return sbi_sta_steal_time_set_shmem(SBI_SHMEM_DISABLE,
> +					    SBI_SHMEM_DISABLE, 0);
>  }
>  
>  static u64 pv_time_steal_clock(int cpu)
> diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
> index d8cf9ca28c61..5f35427114c1 100644
> --- a/arch/riscv/kvm/vcpu_sbi_sta.c
> +++ b/arch/riscv/kvm/vcpu_sbi_sta.c
> @@ -93,8 +93,8 @@ static int kvm_sbi_sta_steal_time_set_shmem(struct kvm_vcpu *vcpu)
>  	if (flags != 0)
>  		return SBI_ERR_INVALID_PARAM;
>  
> -	if (shmem_phys_lo == SBI_STA_SHMEM_DISABLE &&
> -	    shmem_phys_hi == SBI_STA_SHMEM_DISABLE) {
> +	if (shmem_phys_lo == SBI_SHMEM_DISABLE &&
> +	    shmem_phys_hi == SBI_SHMEM_DISABLE) {
>  		vcpu->arch.sta.shmem = INVALID_GPA;
>  		return 0;
>  	}
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
