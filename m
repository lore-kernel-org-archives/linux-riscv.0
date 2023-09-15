Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC7CEEB596
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 06:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/g7xGUDV43hObD/LYjACWtBL957017KoFthFKlaqNLc=; b=FaVnBrTbjtgg0c
	KJzSVcLwiVNyId7a/NmewkrtSvYtWHzKhjZlIqxILPlmjFl0EsyqRw6Smjg06Yq+FEAEe12z1vgOS
	sB8oEXj5xNRT5y+74m6wdCk7+/0veR2LO7iHNSnY+b1YlBRjHP6Xm4nVe3hWhdcUU2eJ29Cfb6Wj2
	emb53kPUDsT/nHs2tXkxPVOJrgD5Eu5eBOjhC4I/1je0E0ZfRCYSu1GjnuCRlLIO44Nii9IcmR7Mx
	7eeKCqXaVoTklgnnd2/Uw8gfTz/buWoef6keCSYtITSpJpYwmljlJU44WWrWUtHxOBPNEmyv6qo8L
	QpPAaxNVwlWH4r2b9G0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh2bR-009vvI-30;
	Fri, 15 Sep 2023 06:46:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh2bN-009vue-0M
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 06:46:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694760412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OFHb1X8GwFAV1GjpBawvQP043vGn+wTnVbsA2Tbt+oQ=;
	b=HwW0RsaoEiPJQqHsypzsHj8cB2sQeP+LBlCTjbhGUk0ARoMt+Ve/LVDSxqsmgMt6Vfc/Wk
	Q8wvCpslpwAC64nYEfZ15lqQqu52WkH+so/BPiyHYtOpOX5xjOLnbgpg8MhQ23F3nI7gnI
	xKUYXxzeXtLRIhNEaGX0XM4PT737COA=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-mcwRiAamPNe9zLp0_wwzHA-1; Fri, 15 Sep 2023 02:46:48 -0400
X-MC-Unique: mcwRiAamPNe9zLp0_wwzHA-1
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-6bb31e13a13so2177924a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 23:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694760408; x=1695365208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFHb1X8GwFAV1GjpBawvQP043vGn+wTnVbsA2Tbt+oQ=;
        b=K7fmOLTsgqpwA035aPOFV4V14ZRWYV/OpdN6IdqQ3zKldbHX4GRzBn4yoYo5Wi2Bov
         jp12IaOTCTjQt9QQOIAOV+Bu7eZOe8i37E9+AmPiuMcniE+qThbQI5ucvPzmuRFy/OZ7
         peBKAUU2CF2xJ9qDRlNgPrl8iUqPfY75AbYvA6weZi/b7TP3VvXZYxesLof6/W7aYCL0
         ojuJdsK55j9nUJ297gnwmTMnLXI2wJB0Uc2WDuL7h/lZXpSXKW97cE2MUI5sHYwiA9wu
         DcFTmFjloU0z6oohaKpWCGbTaS3jMbi4Q9qPr9fimVv10NaR9ViX/uQWlyAkICc/7LgP
         1P9Q==
X-Gm-Message-State: AOJu0Yy3xrt2TMpv2lk69gn2Xvb7JYw6NAgSkG3zceduXwbgRshu3gyF
	Q+RkFwG3oRZQapjEG1zMbgno5O8LSZWUjJ80yW0DEA9camDLr2CgzgGE9yfuBZiJbPXD/wrJrYS
	TcC9L+9n5dymjZKYccjcFrYkn5Fah
X-Received: by 2002:a9d:7381:0:b0:6bd:5bc:7bda with SMTP id j1-20020a9d7381000000b006bd05bc7bdamr729250otk.19.1694760408025;
        Thu, 14 Sep 2023 23:46:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDSdP3X8SAOYzXngeublio68T/+1l2GRslaw0MtT+GBt9TTzrGejFOiVGHPrfU6Zh2om+sYA==
X-Received: by 2002:a9d:7381:0:b0:6bd:5bc:7bda with SMTP id j1-20020a9d7381000000b006bd05bc7bdamr729233otk.19.1694760407778;
        Thu, 14 Sep 2023 23:46:47 -0700 (PDT)
Received: from redhat.com ([2804:1b3:a803:4ff9:7c29:fe41:6aa7:43df])
        by smtp.gmail.com with ESMTPSA id v5-20020a05683011c500b006b9e872c0a0sm1366615otq.68.2023.09.14.23.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 23:46:47 -0700 (PDT)
Date: Fri, 15 Sep 2023 03:46:37 -0300
From: Leonardo Bras <leobras@redhat.com>
To: guoren@kernel.org
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org,
	mingo@redhat.com, will@kernel.org, palmer@rivosinc.com,
	longman@redhat.com, boqun.feng@gmail.com, tglx@linutronix.de,
	paulmck@kernel.org, rostedt@goodmis.org, rdunlap@infradead.org,
	catalin.marinas@arm.com, conor.dooley@microchip.com,
	xiaoguang.xing@sophgo.com, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, keescook@chromium.org,
	greentime.hu@sifive.com, ajones@ventanamicro.com,
	jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn,
	linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V11 16/17] RISC-V: paravirt: pvqspinlock: KVM: Add
 paravirt qspinlock skeleton
Message-ID: <ZQP9zSl70Jd2T5wp@redhat.com>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-17-guoren@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230910082911.3378782-17-guoren@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_234653_218010_D2177492 
X-CRM114-Status: GOOD (  23.78  )
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

On Sun, Sep 10, 2023 at 04:29:10AM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Add the files functions needed to support the SBI PVLOCK (paravirt
> qspinlock kick_cpu) extension. This is a preparation for the next
> core implementation of kick_cpu.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  1 +
>  arch/riscv/include/uapi/asm/kvm.h     |  1 +
>  arch/riscv/kvm/Makefile               |  1 +
>  arch/riscv/kvm/vcpu_sbi.c             |  4 +++
>  arch/riscv/kvm/vcpu_sbi_pvlock.c      | 38 +++++++++++++++++++++++++++
>  5 files changed, 45 insertions(+)
>  create mode 100644 arch/riscv/kvm/vcpu_sbi_pvlock.c
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index cdcf0ff07be7..7b4d60b54d7e 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -71,6 +71,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pvlock;
>  
>  #ifdef CONFIG_RISCV_PMU_SBI
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu;
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 992c5e407104..d005c229f2da 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -148,6 +148,7 @@ enum KVM_RISCV_SBI_EXT_ID {
>  	KVM_RISCV_SBI_EXT_PMU,
>  	KVM_RISCV_SBI_EXT_EXPERIMENTAL,
>  	KVM_RISCV_SBI_EXT_VENDOR,
> +	KVM_RISCV_SBI_EXT_PVLOCK,
>  	KVM_RISCV_SBI_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
> index 4c2067fc59fc..6112750a3a0c 100644
> --- a/arch/riscv/kvm/Makefile
> +++ b/arch/riscv/kvm/Makefile
> @@ -26,6 +26,7 @@ kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_v01.o
>  kvm-y += vcpu_sbi_base.o
>  kvm-y += vcpu_sbi_replace.o
>  kvm-y += vcpu_sbi_hsm.o
> +kvm-y += vcpu_sbi_pvlock.o
>  kvm-y += vcpu_timer.o
>  kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o vcpu_sbi_pmu.o
>  kvm-y += aia.o
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index 9cd97091c723..c03c3d489b2b 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -74,6 +74,10 @@ static const struct kvm_riscv_sbi_extension_entry sbi_ext[] = {
>  		.ext_idx = KVM_RISCV_SBI_EXT_VENDOR,
>  		.ext_ptr = &vcpu_sbi_ext_vendor,
>  	},
> +	{
> +		.ext_idx = KVM_RISCV_SBI_EXT_PVLOCK,
> +		.ext_ptr = &vcpu_sbi_ext_pvlock,
> +	},
>  };
>  
>  void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
> diff --git a/arch/riscv/kvm/vcpu_sbi_pvlock.c b/arch/riscv/kvm/vcpu_sbi_pvlock.c
> new file mode 100644
> index 000000000000..544a456c5041
> --- /dev/null
> +++ b/arch/riscv/kvm/vcpu_sbi_pvlock.c
> @@ -0,0 +1,38 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c), 2023 Alibaba Cloud
> + *
> + * Authors:
> + *     Guo Ren <guoren@linux.alibaba.com>
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/err.h>
> +#include <linux/kvm_host.h>
> +#include <asm/sbi.h>
> +#include <asm/kvm_vcpu_sbi.h>
> +
> +static int kvm_sbi_ext_pvlock_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> +				      struct kvm_vcpu_sbi_return *retdata)
> +{
> +	int ret = 0;
> +	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> +	unsigned long funcid = cp->a6;
> +
> +	switch (funcid) {
> +	case SBI_EXT_PVLOCK_KICK_CPU:
> +		break;

IIUC, the kick implementation comes in the next patch but here it becomes a 
no-op. Is there any chance this may break a future bisect?

I don't understand a lot, but I would suggest either removing this no-op 
case SBI_EXT_PVLOCK_KICK_CPU, or merging this patch with the next one.

Other than that, LGTM.

Thanks,
Leo



> +	default:
> +		ret = SBI_ERR_NOT_SUPPORTED;
> +	}
> +
> +	retdata->err_val = ret;
> +
> +	return 0;
> +}
> +
> +const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pvlock = {
> +	.extid_start = SBI_EXT_PVLOCK,
> +	.extid_end = SBI_EXT_PVLOCK,
> +	.handler = kvm_sbi_ext_pvlock_handler,
> +};
> -- 
> 2.36.1
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
