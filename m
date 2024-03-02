Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FA2C5478C
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Mar 2024 11:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wFhm/Yt59+MiCpwCxUwoTeZhXp2DFoyr3n9byjO34CU=; b=IGsEAfyimZ2JQZ
	95GXDBfErVLR7dx7wJaL5KdgvsmKUqzOdJpyyBS+KogS+nL83U8JQmWD6CVrBKIFVKCISIrXLrM97
	FmV9PSAietVRz2Q0ZUdQ7ZbeHk7Q27TtsN3r9D785rqeUn5zh06R1xRw5p0qAOwlU5F0y5DqJgKJF
	ndNdThEr6A/Z5x5gTANDZ8lZeLiXWhQ112HtAs6CKHQe+cL+WV3TL44ODmcOXsPtiy30F71uJfUS8
	t0FM3HzoQ0inJ4yhoDrDCbzgOkJgVsZJIiBtIHIkoFZ7B64nIbcLB2wW0jLS+BpAg76pNA4SiAqtF
	p8WuqNiP4c2M1+RnI42g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgN78-00000003N4f-2tJW;
	Sat, 02 Mar 2024 11:01:10 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgN76-00000003N3T-14lx
	for linux-riscv@lists.infradead.org;
	Sat, 02 Mar 2024 11:01:09 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-33e27940554so327095f8f.3
        for <linux-riscv@lists.infradead.org>; Sat, 02 Mar 2024 03:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709377266; x=1709982066; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BnBh9q3h81nttMpKclVeCqqdtApMcvk+N5PgmMdmQjQ=;
        b=JYtt+uqKPWzqHFVXTEG8xX7Wk0S3Ae8sWJRLgUxuX/ViYO2AqH7bE9fZl6jhwskwXs
         Kz72PHhgJyFlTSyapj4GQg55yUqqZruUIqxa56g1l24wobhDAFa2lCSkJ2vLkvn7PmwA
         19t/U+7jkGRHN3bKB+b2hOEIrbDCN6Psw4hwSvZXyIyv6blmrIVpW6/ezS+49LGF2Nfo
         gc5KcA6pMGZlqqxp9Pw5EoP6Yg6vp5pNap5eR0464RK0HP1KhqYZWwY7/ynycFUzXFZE
         ZwBO+C9UAon7olNnv/2UQsfi3hEhIzRH0EwzXLRqsUcwmtDhIs7PPiHp/33+OpbBLPdK
         N4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709377266; x=1709982066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnBh9q3h81nttMpKclVeCqqdtApMcvk+N5PgmMdmQjQ=;
        b=nV5dDqkT0HE7IdUevSP5GZqJ+5D7I0R2tGUQBvvUFPGc43b8yW34O6Y3z+7Z9tvH9y
         EtBgf1mnkM4f2mI0zVRRA10GRbePMDup6lCm+WeoOEFQMJecy+PNCRq3QI2eL8vq1i1A
         3zGr6ht3VusmlJFuVcIGhT1sGcbOrSq7p1gwI6wV2a82zMCziC7kv8hiuIpmMXsowFsn
         svMn0k//6IsbQVgzX/sH1UN7hQpU/1uLLyVQ6UFZ+f5YMBT4bXA1ISKx/DiBlHMRR+ge
         hCA9SXayqzGExtov3Uh7IjzbTkIsdnE/og7eS07fQ+JDMI3Kp4vccizrlK0gA7fklgp4
         FYLQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5qbvkOcPzb71erJyKVqHHcmuT4VvPh66df9WNVXyAHPoXKmhx46Qak+gCZBFLAmYzF7nUwPXQZ3l+Eg+u4jDffhdkU2dLsu7YCVlL11mg
X-Gm-Message-State: AOJu0Yye4gVpR4wsnGg7YWzbcCFhsHM48UB6Ros7G8JLNYbUzZ0qtZu4
	1UfS2HztIXFBD/G3LSFUhY8aylOZpojHS7jkbU0JfxVcWQTtOuN9kFBwCvR0BWE=
X-Google-Smtp-Source: AGHT+IFBE0FYUXd6PXNSgQDWSCL6Ga0yuS3Bws39s4NBtN3Sv+6V9ZcPw12uO6ds6wR23yK7a7LHrg==
X-Received: by 2002:a5d:510b:0:b0:33d:e140:a81f with SMTP id s11-20020a5d510b000000b0033de140a81fmr3159514wrt.56.1709377265670;
        Sat, 02 Mar 2024 03:01:05 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id p3-20020a5d4583000000b0033b47ee01f1sm6994178wrq.49.2024.03.02.03.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 03:01:05 -0800 (PST)
Date: Sat, 2 Mar 2024 12:00:59 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v4 12/15] KVM: riscv: selftests: Add SBI PMU extension
 definitions
Message-ID: <20240302-698f4322ab7ba74fc3dba416@orel>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-13-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240229010130.1380926-13-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240302_030108_337367_21C225ED 
X-CRM114-Status: GOOD (  21.34  )
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

On Wed, Feb 28, 2024 at 05:01:27PM -0800, Atish Patra wrote:
> The SBI PMU extension definition is required for upcoming SBI PMU
> selftests.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  .../selftests/kvm/include/riscv/processor.h   | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> index f75c381fa35a..a49a39c8e8d4 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h

We should probably create a new header (include/riscv/sbi.h) since
otherwise processor.h is very quickly going to look like an SBI
header with a few non-sbi things in it. Can we add a patch prior to
this one that moves the SBI stuff we currently have in processor.h
out to an sbi.h? Or, we could start synchronizing a copy of
arch/riscv/include/asm/sbi.h in tools/arch/riscv/include/asm like
we've done for csr.h

> @@ -169,17 +169,84 @@ void vm_install_exception_handler(struct kvm_vm *vm, int vector, exception_handl
>  enum sbi_ext_id {
>  	SBI_EXT_BASE = 0x10,
>  	SBI_EXT_STA = 0x535441,
> +	SBI_EXT_PMU = 0x504D55,
>  };
>  
>  enum sbi_ext_base_fid {
>  	SBI_EXT_BASE_PROBE_EXT = 3,
>  };
>  
> +enum sbi_ext_pmu_fid {
> +	SBI_EXT_PMU_NUM_COUNTERS = 0,
> +	SBI_EXT_PMU_COUNTER_GET_INFO,
> +	SBI_EXT_PMU_COUNTER_CFG_MATCH,
> +	SBI_EXT_PMU_COUNTER_START,
> +	SBI_EXT_PMU_COUNTER_STOP,
> +	SBI_EXT_PMU_COUNTER_FW_READ,
> +	SBI_EXT_PMU_COUNTER_FW_READ_HI,
> +	SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
> +};
> +
> +union sbi_pmu_ctr_info {
> +	unsigned long value;
> +	struct {
> +		unsigned long csr:12;
> +		unsigned long width:6;
> +#if __riscv_xlen == 32
> +		unsigned long reserved:13;
> +#else
> +		unsigned long reserved:45;
> +#endif
> +		unsigned long type:1;
> +	};
> +};
> +
>  struct sbiret {
>  	long error;
>  	long value;
>  };
>  
> +/** General pmu event codes specified in SBI PMU extension */
> +enum sbi_pmu_hw_generic_events_t {
> +	SBI_PMU_HW_NO_EVENT			= 0,
> +	SBI_PMU_HW_CPU_CYCLES			= 1,
> +	SBI_PMU_HW_INSTRUCTIONS			= 2,
> +	SBI_PMU_HW_CACHE_REFERENCES		= 3,
> +	SBI_PMU_HW_CACHE_MISSES			= 4,
> +	SBI_PMU_HW_BRANCH_INSTRUCTIONS		= 5,
> +	SBI_PMU_HW_BRANCH_MISSES		= 6,
> +	SBI_PMU_HW_BUS_CYCLES			= 7,
> +	SBI_PMU_HW_STALLED_CYCLES_FRONTEND	= 8,
> +	SBI_PMU_HW_STALLED_CYCLES_BACKEND	= 9,
> +	SBI_PMU_HW_REF_CPU_CYCLES		= 10,
> +
> +	SBI_PMU_HW_GENERAL_MAX,
> +};
> +
> +/* SBI PMU counter types */
> +enum sbi_pmu_ctr_type {
> +	SBI_PMU_CTR_TYPE_HW = 0x0,
> +	SBI_PMU_CTR_TYPE_FW,
> +};
> +
> +/* Flags defined for config matching function */
> +#define SBI_PMU_CFG_FLAG_SKIP_MATCH	(1 << 0)
> +#define SBI_PMU_CFG_FLAG_CLEAR_VALUE	(1 << 1)
> +#define SBI_PMU_CFG_FLAG_AUTO_START	(1 << 2)
> +#define SBI_PMU_CFG_FLAG_SET_VUINH	(1 << 3)
> +#define SBI_PMU_CFG_FLAG_SET_VSINH	(1 << 4)
> +#define SBI_PMU_CFG_FLAG_SET_UINH	(1 << 5)
> +#define SBI_PMU_CFG_FLAG_SET_SINH	(1 << 6)
> +#define SBI_PMU_CFG_FLAG_SET_MINH	(1 << 7)
> +
> +/* Flags defined for counter start function */
> +#define SBI_PMU_START_FLAG_SET_INIT_VALUE (1 << 0)
> +#define SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT BIT(1)
> +
> +/* Flags defined for counter stop function */
> +#define SBI_PMU_STOP_FLAG_RESET (1 << 0)
> +#define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT BIT(1)

When changing shifts to BIT()'s, don't forget these (easy not to forget
if we go with the synch sbi.h to tools approach)

> +
>  struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>  			unsigned long arg1, unsigned long arg2,
>  			unsigned long arg3, unsigned long arg4,
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
