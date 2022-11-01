Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5F3C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Nov 2022 15:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tgCYnSDBeN6ba8DuxlfJ/DbLbNSK1snVz5enhoTpXFw=; b=Vq/r8U/18Dy2XH
	HptDGHMhzzRdXwGF6IbvPW87KimM3dRvKGuGI6cBqQJnAR050KOWwZrZAMuZBgyZZF8RGlD6bD/4W
	vx9rAreTr6wZ+8PEUdSstvK8ccjOXBBl9zJxxvMT+hqJf/XT2LfCXtLlt3wGn2YUaNUD+RKDOznlB
	9SVwvKo8qG67HenKvXAGA/6wH54esR3auc65zRQfAx/cZlPy23i+1fnFxZoa5g/PnfgLnAEMXHqMa
	v1FT0sEifidctXk84CNJXOJLLQnUOGl1ZxFioTVKaxFlzTsVZPCxtqU0iy1aEaQvOfqF++aItRr7y
	csABozP6xhuqyAPcRj0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1optGE-005pqt-0z; Tue, 01 Nov 2022 15:33:06 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1optFu-005pW5-Cc
	for linux-riscv@lists.infradead.org; Tue, 01 Nov 2022 15:32:47 +0000
Received: by mail-ed1-x52b.google.com with SMTP id a13so22325202edj.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Nov 2022 08:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EkOTr9SItjKJoDycMahI5/oHi6EPM1ssOxtlPzqceFY=;
        b=HNNzcgpfiO+zdeymquvREye/XQQhuyJO32ZM+OqtMJdNWMBVTHM3M/1qdMB4gg7K/F
         WVZnvEtB/S24D8t/nt2qn/KwsTtdkBlzYY35jVsuJr5buka4uZNjj4rOz6y8K8I7b2L1
         RxxOeXbwMEZpDEiwA7P5weMWERGXjsDvSIzG3jwozI0WCAFC5317ty/YtJaZshbWmTGt
         UaopkjfHNJNLLCUha2AzfFiGcigpO4+QlTYJI73s4zN49Nbz8bPsoeo+zIYUZoRtW0tj
         UDFNZKVPdpZLYMi2SohA7ETdxoJAd1uLR8i6IEkyKNASBJAkdG3moY6Kk234I9ViCaSL
         ucbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkOTr9SItjKJoDycMahI5/oHi6EPM1ssOxtlPzqceFY=;
        b=u5ZaBz9GzPA0ZIcTfScav3QJh78R7jGToe0MVzySnH+hWMPFNKVlzBQzBvkdSWyBrz
         ypD9JwDme5E/+adjTULDHptJHL0Vnwfzg7ErIALGaCvZImCpJ/HM/9oqdlzS2wBR4YIV
         rUX9VoQheg93m84YQeJSebV/5ma7wZOX4A7uh0x5rx0PCiGOQsnXwAOLaOqlVXrCA3FI
         MrhPDaw7mgjB2haAn6kGi3Yxh8aNriuZX/E7QIQJ/AP3Y0/hglBqWMBtSfIsQg1wEvRI
         vM014aUUJAkgvJOA4nJzG7Dwo2iYRy66LtBX7eNdsjoDatS/rRV0lsDUR+UJ2FMQ6EE8
         e9cw==
X-Gm-Message-State: ACrzQf2dCdTH1nmv0utMR7f9rLgF+znERFUQcUKI0cKmTwQUmS/w/85g
	p9lUZxutri6fWsHKqJHye8yetA==
X-Google-Smtp-Source: AMsMyM7rzsOnx9cmR8tUrWyQkYnuHkdHVOzYOHLWUDVt+oT0IjgcykUJSaf1PBY/vEUjSl+YMEs2Jg==
X-Received: by 2002:a05:6402:2802:b0:43a:9098:55a0 with SMTP id h2-20020a056402280200b0043a909855a0mr19417901ede.179.1667316762391;
        Tue, 01 Nov 2022 08:32:42 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id kx1-20020a170907774100b007add62dafb7sm2277851ejc.5.2022.11.01.08.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 08:32:42 -0700 (PDT)
Date: Tue, 1 Nov 2022 16:32:41 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC  3/9] RISC-V: KVM: Define a probe function for SBI
 extension data structures
Message-ID: <20221101153241.wnox5zp7ymyg4gnx@kamzik>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
 <20220718170205.2972215-4-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220718170205.2972215-4-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_083246_502025_9D114BF6 
X-CRM114-Status: GOOD (  22.66  )
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

On Mon, Jul 18, 2022 at 10:01:59AM -0700, Atish Patra wrote:
> c,urrently the probe function just check if an SBI extension is
Currently                            checks

> registered or not. However, the extension may not want to advertise
> itself depending on some other condition.
> An additional extension specific probe function will allow
> extensions to decide if they want to be advertised to the caller or
> not. Any extension that do not require additional dependency check
                          does                                 checks

> does not required to implement this function.

s/does/is/

> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  3 +++
>  arch/riscv/kvm/vcpu_sbi_base.c        | 13 +++++++++++--
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index 83d6d4d2b1df..5853a1ef71ea 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -25,6 +25,9 @@ struct kvm_vcpu_sbi_extension {
>  	int (*handler)(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  		       unsigned long *out_val, struct kvm_cpu_trap *utrap,
>  		       bool *exit);
> +
> +	/* Extension specific probe function */
> +	unsigned long (*probe)(unsigned long extid);
>  };
>  
>  void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
> diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
> index 48f431091cdb..14be1a819588 100644
> --- a/arch/riscv/kvm/vcpu_sbi_base.c
> +++ b/arch/riscv/kvm/vcpu_sbi_base.c
> @@ -22,6 +22,7 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  	int ret = 0;
>  	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
>  	struct sbiret ecall_ret;
> +	const struct kvm_vcpu_sbi_extension *sbi_ext;
>  
>  	switch (cp->a6) {
>  	case SBI_EXT_BASE_GET_SPEC_VERSION:
> @@ -46,8 +47,16 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  			 */
>  			kvm_riscv_vcpu_sbi_forward(vcpu, run);
>  			*exit = true;
> -		} else
> -			*out_val = kvm_vcpu_sbi_find_ext(cp->a0) ? 1 : 0;
> +		} else {
> +			sbi_ext = kvm_vcpu_sbi_find_ext(cp->a0);
> +			if (sbi_ext) {
> +				if (sbi_ext->probe)
> +					*out_val = sbi_ext->probe(cp->a0);
> +				else
> +					*out_val = 1;
> +			} else
> +				*out_val = 0;
> +		}
>  		break;
>  	case SBI_EXT_BASE_GET_MVENDORID:
>  	case SBI_EXT_BASE_GET_MARCHID:
> -- 
> 2.25.1
>

Other than the commit message fixes

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
