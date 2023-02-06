Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3236CC61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 11:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w9Mb2i0WhT7hcvH/c26DcmkuqkAnP5MyZXrXRQO0Fz4=; b=S+nJN5+SlBuM4c
	adDvID3IljVOD8c5hfGW5+6e+vQk/mxZYjn5oAaWQXCB5aZtf88RcOkIa7FsHfBZrJ/8l7cHvUE2w
	QHVLpnbVls1EAPUouvGz5HIDKNxKqTHoeiLmu8slCuS/y5pETNsLr9q9O5LrC6+14nMab/S28oZ/o
	CJFNmNqdDPdcS7k67qJWBPtRiWSeLTr95UGb+FBzL45wWBkJ7Mhitpzmj11QOISDvxMamQOHH0g1H
	wRMhSJLXFJh5TreV4q7iuTglG0n3XqIHpdOeysDDMWf+nUZDvm+8bG4PlyyFlBfYzgvWnuv5O8/3H
	yzUSjpOGzNDzbRLlpkww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP05E-008MMA-64; Mon, 06 Feb 2023 11:54:52 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP05B-008MKu-OH
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 11:54:51 +0000
Received: by mail-wm1-x32c.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso8558849wms.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Feb 2023 03:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f32i0UtHmpYTxPyacuTVXQLMyNqvR3s0aoWUZXvnOLk=;
        b=Q5WSa6Sjy/zZV9ruut5vijr1P+Y42JVVn0xvkzpI2EGUIxm1doohtqPcWLEFd4/yy6
         r5c7TWMiRKl2jjF/H8ql65T5E1aipiVedwxtHEYPmFrCyzmK+Sq19W4W3JXpxMRGjdM4
         7cMGpmrKyk6gwQmN02oqWeWKBoKeARUpjKYoFjhL7NF+6Nq8O+/3Kex2S4x1K7rPI4Mc
         s+9IaNsGunC0z8UC3IVBANq5yi5t1qB9ohH/c1cl1YckxrOIEbn6Pq/ia1DUtHyy3uK6
         pQX98u1P6o1OzK2DNVRxzqHdTZOAN9m1g6583Gq74tP31tpt64iYlV3eZNJBeHbZs+gy
         pWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f32i0UtHmpYTxPyacuTVXQLMyNqvR3s0aoWUZXvnOLk=;
        b=gmLiWdod7pXsdujrKJ2CghrhoGXzHpjP4y/I9Z2ROscKQClNAhb9bw9U+K0fHxpwYq
         IXdZoPBqILIrslk9Lxw71mtONtQelv6kXDNuB6500JOOnAvo3HF/1ReHMehY9oM/ikun
         9AoEEe6hrACfNfLVzI2FB/mRPy6nwOvibrQFnOJvUhuoSsvDjntgqlHO12k5p10WkOhg
         jbnc7sBfEb/QQvSxnjAbA/NU28ovtG1xbnjXl/cMSCRDzK7vCL4A5Jhbs+R/sU4ZHoFs
         ncntknrD2Jo0axMFAtFW7s/UFtQ8o/cCeeieofTzxjvtcoloxLakS0zU3r1Kt6GIEBds
         q2HQ==
X-Gm-Message-State: AO0yUKXa7B1kwQ1auEpeyOSujhavByVBHva3FhDb8y6tD8sEKqpMLFFM
	DmDGcRk36lkc+BgnjOpwLEQBRg==
X-Google-Smtp-Source: AK7set8q5TEDigFlaoXKvGEyXmW7/pfWOHSWGReOGdbnXfUkXZCqKPhMWAalL3vq95IQNXfwjr3xIA==
X-Received: by 2002:a05:600c:1c96:b0:3df:9858:c032 with SMTP id k22-20020a05600c1c9600b003df9858c032mr10856043wms.7.1675684486906;
        Mon, 06 Feb 2023 03:54:46 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id bg21-20020a05600c3c9500b003db06493ee7sm17491455wmb.47.2023.02.06.03.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 03:54:46 -0800 (PST)
Date: Mon, 6 Feb 2023 12:54:45 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 11/14] RISC-V: KVM: Implement trap & emulate for
 hpmcounters
Message-ID: <20230206115445.4deembtvetojslee@orel>
References: <20230205011515.1284674-1-atishp@rivosinc.com>
 <20230205011515.1284674-12-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230205011515.1284674-12-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_035449_799304_73131AC1 
X-CRM114-Status: GOOD (  17.08  )
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

On Sat, Feb 04, 2023 at 05:15:12PM -0800, Atish Patra wrote:
> As the KVM guests only see the virtual PMU counters, all hpmcounter
> access should trap and KVM emulates the read access on behalf of guests.
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_pmu.h | 16 ++++++++
>  arch/riscv/kvm/vcpu_insn.c            |  4 +-
>  arch/riscv/kvm/vcpu_pmu.c             | 59 ++++++++++++++++++++++++++-
>  3 files changed, 77 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> index 40905db..344a3ad 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> @@ -48,6 +48,19 @@ struct kvm_pmu {
>  #define vcpu_to_pmu(vcpu) (&(vcpu)->arch.pmu_context)
>  #define pmu_to_vcpu(pmu)  (container_of((pmu), struct kvm_vcpu, arch.pmu_context))
>  
> +#if defined(CONFIG_32BIT)
> +#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
> +{.base = CSR_CYCLEH,     .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm }, \
> +{.base = CSR_CYCLE,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm },
                      ^ should be tabs?

> +#else
> +#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
> +{.base = CSR_CYCLE,      .count = 31, .func = kvm_riscv_vcpu_pmu_read_hpm },
                      ^ here too
> +#endif
> +
> +int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
> +				unsigned long *val, unsigned long new_val,
> +				unsigned long wr_mask);
> +
>  int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu, struct kvm_vcpu_sbi_return *retdata);
>  int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
>  				struct kvm_vcpu_sbi_return *retdata);
> @@ -71,6 +84,9 @@ void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
>  struct kvm_pmu {
>  };
>  
> +#define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
> +{ .base = 0,      .count = 0, .func = NULL },
               ^ and here and aligned with the ones above?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
