Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E44CD11C2
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 11:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sSxzDAAWQuIiq0TTWWY2P3Kh6XTxKUNwmtJjbywLcdU=; b=XG2QuqpfIlUgYV
	cqWG/ubDjEzCNFWJJmdOvEfQfN4SEMiwt+jMkHxlXo+zBPjDJQV9T5a7NTdOWThcaI013+HhDHdls
	tVNo5MSyCI8tZkhbPdCP1GxtbvU+OQW718f+5w/W7XImI6tfpbt3G1BVfSbfroYEN01+04V0DYlz2
	HXb3ytW/T/FqGKXEBumSVaYoxH+AiULAWnvkH5PM7jnJ7fLIRtERhqy4vfKtNGbckHXsjV9bnLxAy
	ETtyv6aEizf+pmW6RQK+6n+ryC3B6jPm+M68iiKZL6nOhwy9Lj+O4h+EWGObXtNqV9ifFmLHBeAjo
	+ETTXYNiwNGAioqMXKZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rshfA-00000006fSA-0b3v;
	Fri, 05 Apr 2024 11:23:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rshf7-00000006fRh-3M18
	for linux-riscv@bombadil.infradead.org;
	Fri, 05 Apr 2024 11:23:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Q1StIt3kBG1sKfWkM0jYTmYiHX1k739mPkjj6luO5sU=; b=PatXMJdrrsgR0kBwM2nGGZSd1J
	2qgHAGN1TbSr9FA6h2ceYMgia4iomd7mrU7INALorOjgXRrZIJkhf3js8rzDMRMM573PPW/vEuHNe
	XL86xx+rTeJBs0mm0szCUFVhJtYTuHezfGJirPL6LVOxcO+a8VQkfUXdBvuuju9M6C3u3EQ5HjVS/
	7qPoBgDHXrJ7SEQUWMdp4Td9r20rvx/iSBfn1IWbBBMfKN0JRvPUdKDftG2dcLQk3dlp1wQaE7A3j
	+4KkGV4mJc1OCVJqdBs1hLjaTT0iVQEIABm7gzRGiRiAzSCMAKinIeWQg7S/r9HzFcd+3IjFI0cHd
	9P3+lnYQ==;
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rshf3-00000005Zws-3oRQ
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 11:23:12 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-516d0161e13so1868344e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 05 Apr 2024 04:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712316187; x=1712920987; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1StIt3kBG1sKfWkM0jYTmYiHX1k739mPkjj6luO5sU=;
        b=hLqDDQ38Bm0sQN4oCc49+TZwtU5FCmUmTT3h4JwyVftxk3YjEqSACwIPxzU21LxGvB
         twAj7WRoi8hfqRLwdqBVfNN9pfUG8KJLkSfhU4uDlxbp/dKuDhg0PYrfzO9usHxfMZQo
         eJjtusrc0UFWAVp4uJJMkSqdAjjiYbLuVSzqAi6bH8SLHwCBBfNzT6LNo9WkLnXHAU3x
         +6QvofKRWNwl47y/joqtvfX6i/JECmid8QpEfJK3yn4KamP0LKaDYVO7qd4h/9qjUGJq
         bW/7MHRYbozEedOwwsEJS+oFFv0ThLiy4Pgafz9mB5b7jJya7nL5tM3zXqM7jM1sxo8F
         60Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712316187; x=1712920987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1StIt3kBG1sKfWkM0jYTmYiHX1k739mPkjj6luO5sU=;
        b=MYSPz+B+bJcH1LYmRCFi13t5TZ8NX4S7ILg54zzMaa3kCgp5micCk78pyBKbcIUw4F
         2VowOFMMirO7pZG6Jw6mleNhcLqgQRJdZc0Q41F9ciyuNabKlRORRtEP2gAtgZDuzZDI
         qB4GrZMdWUqMuJNxpNM3Xaiq+Ib4aWHHzz5Ax4O1E4LmlUrnDNEag98lb7aNiwyrVbZt
         oIfQhZT51yFjCHiktSn6jnnzsVVXBD5/nhUFGhrqKASXC0kQrGunLLvL/tDlu94l2px7
         fmbmQKb8xPkoZ3h7dKEB9Sc0oWxW4sKe2BR8uvxL8V/Csz4k+ewiPdBk/iRxQyG7HKPD
         EhQg==
X-Forwarded-Encrypted: i=1; AJvYcCWbSCruIWtVf0hJN2qWJHpUtigSBVZQ8TEbDmySmCThmjCoaPN/8424crWFqvfRGv+3I5y8DNdwjWHAxbSqb80e7OmcnogjVty7vgpWbyH3
X-Gm-Message-State: AOJu0YxjCVonuEy7rZwH4m2sQlRPZvP4ZRxJZs2YHkcsI0csucKaVD5t
	tkwS4cFNcCu24F73KAq7x/FZb/yY15macycHT0IOetp97Y376z6s24NW3t/T+uw=
X-Google-Smtp-Source: AGHT+IHkj15u2Bxl0RbCYsvSnoaNnRvyO2MnsCgl4V2xQvxUMx8unnpUY36pEW96b3ybfXEcZnPVSw==
X-Received: by 2002:a19:f604:0:b0:516:d152:b892 with SMTP id x4-20020a19f604000000b00516d152b892mr952297lfe.60.1712316186941;
        Fri, 05 Apr 2024 04:23:06 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id j13-20020a50ed0d000000b0056c4372c161sm686856eds.55.2024.04.05.04.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 04:23:06 -0700 (PDT)
Date: Fri, 5 Apr 2024 13:23:04 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Ajay Kaher <akaher@vmware.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Alexey Makhalov <amakhalov@vmware.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, 
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Will Deacon <will@kernel.org>, x86@kernel.org
Subject: Re: [PATCH v5 12/22] RISC-V: KVM: Implement SBI PMU Snapshot feature
Message-ID: <20240405-1060c986299eaac3528c7d4f@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-13-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403080452.1007601-13-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_122310_197432_2BA95847 
X-CRM114-Status: GOOD (  25.73  )
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

On Wed, Apr 03, 2024 at 01:04:41AM -0700, Atish Patra wrote:
> PMU Snapshot function allows to minimize the number of traps when the
> guest access configures/access the hpmcounters. If the snapshot feature
> is enabled, the hypervisor updates the shared memory with counter
> data and state of overflown counters. The guest can just read the
> shared memory instead of trap & emulate done by the hypervisor.
> 
> This patch doesn't implement the counter overflow yet.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_pmu.h |   7 ++
>  arch/riscv/kvm/vcpu_pmu.c             | 121 +++++++++++++++++++++++++-
>  arch/riscv/kvm/vcpu_sbi_pmu.c         |   3 +
>  3 files changed, 130 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> index 395518a1664e..77a1fc4d203d 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> @@ -50,6 +50,10 @@ struct kvm_pmu {
>  	bool init_done;
>  	/* Bit map of all the virtual counter used */
>  	DECLARE_BITMAP(pmc_in_use, RISCV_KVM_MAX_COUNTERS);
> +	/* The address of the counter snapshot area (guest physical address) */
> +	gpa_t snapshot_addr;
> +	/* The actual data of the snapshot */
> +	struct riscv_pmu_snapshot_data *sdata;
>  };
>  
>  #define vcpu_to_pmu(vcpu) (&(vcpu)->arch.pmu_context)
> @@ -85,6 +89,9 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
>  int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>  				struct kvm_vcpu_sbi_return *retdata);
>  void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu);
> +int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long saddr_low,
> +				      unsigned long saddr_high, unsigned long flags,
> +				      struct kvm_vcpu_sbi_return *retdata);
>  void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu);
>  void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
>  
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index 2d9929bbc2c8..f706c688b338 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -14,6 +14,7 @@
>  #include <asm/csr.h>
>  #include <asm/kvm_vcpu_sbi.h>
>  #include <asm/kvm_vcpu_pmu.h>
> +#include <asm/sbi.h>
>  #include <linux/bitops.h>
>  
>  #define kvm_pmu_num_counters(pmu) ((pmu)->num_hw_ctrs + (pmu)->num_fw_ctrs)
> @@ -311,6 +312,80 @@ int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
>  	return ret;
>  }
>  
> +static void kvm_pmu_clear_snapshot_area(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +	int snapshot_area_size = sizeof(struct riscv_pmu_snapshot_data);
> +
> +	if (kvpmu->sdata) {
> +		if (kvpmu->snapshot_addr != INVALID_GPA) {
> +			memset(kvpmu->sdata, 0, snapshot_area_size);
> +			kvm_vcpu_write_guest(vcpu, kvpmu->snapshot_addr,
> +					     kvpmu->sdata, snapshot_area_size);
> +		} else {
> +			pr_warn("snapshot address invalid\n");
> +		}
> +		kfree(kvpmu->sdata);
> +		kvpmu->sdata = NULL;
> +	}
> +	kvpmu->snapshot_addr = INVALID_GPA;
> +}
> +
> +int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long saddr_low,
> +				      unsigned long saddr_high, unsigned long flags,
> +				      struct kvm_vcpu_sbi_return *retdata)
> +{
> +	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
> +	int snapshot_area_size = sizeof(struct riscv_pmu_snapshot_data);
> +	int sbiret = 0;
> +	gpa_t saddr;
> +	unsigned long hva;
> +	bool writable;
> +
> +	if (!kvpmu || flags) {
> +		sbiret = SBI_ERR_INVALID_PARAM;
> +		goto out;
> +	}
> +
> +	if (saddr_low == SBI_SHMEM_DISABLE && saddr_high == SBI_SHMEM_DISABLE) {
> +		kvm_pmu_clear_snapshot_area(vcpu);
> +		return 0;
> +	}
> +
> +	saddr = saddr_low;
> +
> +	if (saddr_high != 0) {
> +		if (IS_ENABLED(CONFIG_32BIT))
> +			saddr |= ((gpa_t)saddr << 32);

saddr |= ((gpa_t)saddr_high << 32)

> +		else
> +			sbiret = SBI_ERR_INVALID_ADDRESS;
> +		goto out;
> +	}
> +

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
