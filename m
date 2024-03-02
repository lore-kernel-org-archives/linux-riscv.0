Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76ACC54798
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Mar 2024 07:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AqCc0mjgCA2aIpgDFUNEYViAyyF/thlVKd8pfl8oLKM=; b=gBrkOOMnt2olQs
	y5kC9LOx5yADacB8RAfnNmUH3tSjZjV3KY4TWbHJZJf347LrAM7J+5uLmOsXctr0fA4lIn0nQnEX5
	dzeffCRaJnkHQpIK2jMTNfABCtR++v62BOz9KZQYVd4P5yaUUNWxuHC8qEggnurwxsaS1Z95Lcvvc
	sIZqdSUaZlXmuPWREkBalasNzNSAPlBx6HK0vR+X9tM3vTN2HR47n8nkx/m1XdtxaYWvC/dLYV1p5
	quRmIQkJudDzLwu091vWMFvDSZpkCWMZVGsaVIbjvLAYDQQy6LjstK6RakgptI9t8KOWAdFU9e82N
	HjDbyHKOUfCWmkl4p3/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgK5w-000000034TY-4218;
	Sat, 02 Mar 2024 07:47:44 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgK5u-000000034Sj-0BXq
	for linux-riscv@lists.infradead.org;
	Sat, 02 Mar 2024 07:47:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-412cda08022so5521645e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 01 Mar 2024 23:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709365660; x=1709970460; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+Ib+i/7ul2383kueBaIr1KAZdgCE/S8URkt4mrWqYE=;
        b=MoKRiE+9z05SbqQpe0pHs2zaxF6i9v2ZukaY9/CW6lkKn9Iaj9roBhOlilQTGxF2sc
         AZs8fp+FgM0NWCVWIJfYcYJuuZjsVMnZLfFPZDDlrpEt2zWfYcdSM5r7WR4C/ItgJeV7
         eMpST1MdNBXj/pRgfmgwYZQNbcFeo4izBdeICF3sTYd/HFsPiXUYIRpJVUUUVRxvgvlN
         oMfy1wiAhx/JFGp+I6orTgtMKeAtDvlJFZwVzUnjEJudclSQ18EzrguRs/6dLHXw1U9n
         WVXnzfCZkM/O+POhj1Qb8DY7KTIBRIpOU5+UQ9MEP4TVbKA2iHCgC4tvjDoVWp/UeVcG
         ektg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709365660; x=1709970460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+Ib+i/7ul2383kueBaIr1KAZdgCE/S8URkt4mrWqYE=;
        b=BFJMJ6Fj6T/zYvjvtsubudDSxKUrIqX1GKU6UEAaiyMeTw85HKKEs4nBneR/BCNeQ9
         n8Qpb/T8R74f+41M5s2hEEsDOSqjVepS3hKoC+teLQ9h+jwp1DwQXpaUW706R3a3pPeI
         exwh9fC0A1rW0BXNGvOXuEEDoJS69M6B5KBcr7Zxdp5C7VAX1S4X1F/3FWxrt6ZRnetg
         eDZfJXjPbHBNAoMSevyQ1ZmnubY1wWXmtfQA+h2E8bpZveGPxNOuWT9ifC3GhV0+IkSK
         +ClILi42+haTvTnraBGUSADavXvEk94PG7XMmZfUFCoaOsBtZWFap0mW8rqzUSY5cKNO
         NQpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcgMQNHCJyhmXpGrCi188zLQ0p40VgPUE6mGgh1+IrhgNKLNs8p7bO9RV9pAGcXY7fExnnW++USXFx1yDAVEYgK39JnWa8oLeYXWJSZX+B
X-Gm-Message-State: AOJu0YyX0VcOxviT05dIg4RB7yE2A9bG/bjKOvbAWBFv306grTQOZAzK
	nhN8JqTCSuiL7lC3+rM4c8bQ/p7w81bRF6kkFj9J8XO8qp+je5kl9Xnbr8GawxA=
X-Google-Smtp-Source: AGHT+IEVoW7uokoz89spH9xj6f+lmKJjEsvkGZk/n4AsgiYDjM2F+XJU0nnyceOxTlFgpo153Zwm1Q==
X-Received: by 2002:a05:600c:3107:b0:412:b8cf:150b with SMTP id g7-20020a05600c310700b00412b8cf150bmr3321506wmo.10.1709365660476;
        Fri, 01 Mar 2024 23:47:40 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id l33-20020a05600c1d2100b00412ca88537dsm3348026wms.0.2024.03.01.23.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 23:47:39 -0800 (PST)
Date: Sat, 2 Mar 2024 08:47:33 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v4 06/15] RISC-V: KVM: No need to update the counter
 value during reset
Message-ID: <20240302-a82f4ba5d90bc3d85f3ed83b@orel>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-7-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240229010130.1380926-7-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_234742_107847_D8EB8A1A 
X-CRM114-Status: GOOD (  20.96  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Paolo Bonzini <pbonzini@redhat.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 28, 2024 at 05:01:21PM -0800, Atish Patra wrote:
> The virtual counter value is updated during pmu_ctr_read. There is no need
> to update it in reset case. Otherwise, it will be counted twice which is
> incorrect.
> 
> Fixes: 0cb74b65d2e5 ("RISC-V: KVM: Implement perf support without sampling")
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/kvm/vcpu_pmu.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index 86391a5061dd..b1574c043f77 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -397,7 +397,6 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
>  {
>  	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
>  	int i, pmc_index, sbiret = 0;
> -	u64 enabled, running;
>  	struct kvm_pmc *pmc;
>  	int fevent_code;
>  
> @@ -432,12 +431,9 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
>  				sbiret = SBI_ERR_ALREADY_STOPPED;
>  			}
>  
> -			if (flags & SBI_PMU_STOP_FLAG_RESET) {
> -				/* Relase the counter if this is a reset request */
> -				pmc->counter_val += perf_event_read_value(pmc->perf_event,
> -									  &enabled, &running);
> +			if (flags & SBI_PMU_STOP_FLAG_RESET)
> +				/* Release the counter if this is a reset request */
>  				kvm_pmu_release_perf_event(pmc);
> -			}
>  		} else {
>  			sbiret = SBI_ERR_INVALID_PARAM;
>  		}
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
