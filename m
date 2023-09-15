Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9910BEE3F2E
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 06:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M0aKe4Cm0flwsj+r47Ae3OsS8E1l+lCsLP47rmgLvSI=; b=OurYM84CT11/mv
	hdw7kREjKey1hiCtbm4tQi42OiiLlhELQ1owtSwGasZoTvY4qYOb1r29TwQWn9+nADvkMARiI/3LA
	j9rfKJjUFtQ1/32D6wGiybDiN2BPfYU1rR2sBo8sPzW5PCT9hKXVy5AFOYHgONr3J5zDzqQKRUKA6
	+KLcN++Fy7TwFWBL8qmpuIUFIxoz9MPn/GI7JYv2gwN8CehErfBYsfYWIWV/9VrcQZgmVVonoBJRf
	+rS4LIsmgvHGizmZJZsQmECmItojZfgUjX9WVEgbYUPuUOUGWX13vsI/q7HIRHcbugfEjQi8lFai/
	bqHeRx+Fv7SJpltf20wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh2Gw-009uAf-0K;
	Fri, 15 Sep 2023 06:25:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh2Gs-009u9W-2k
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 06:25:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694759141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9+jnNNi5vRzRYE59Q36xUOPPsHIe6r3BvoxI49Al2Kk=;
	b=dW94XWGlxTwd3QtNWFmnPLPJOUmCC3G20IAGF+Catp0YXhdN4WHbQdG9cU+xE7Y+ymfaEQ
	DsTcX01jI5+sb2IGnJGRybTrjWNYhPtHuc327HieEpMZo/y2ixmIVlA00y7P7j+qIWT++W
	Br71wyzYRMCX4KFWaAcHIM/HnRhOObc=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-ZxGlXVs9OMCs2ok8cPtURg-1; Fri, 15 Sep 2023 02:25:40 -0400
X-MC-Unique: ZxGlXVs9OMCs2ok8cPtURg-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3aa0fabef2cso2306103b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 23:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694759139; x=1695363939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+jnNNi5vRzRYE59Q36xUOPPsHIe6r3BvoxI49Al2Kk=;
        b=Q6FjWJqctgzFy8HzYHDDWUaETSPu6LKmALsNxIWJRyNb1dL176qUSox750lfK3mFaS
         Eg3aavMisovIYGu+eYmPPH/SEk0dKtcwbDmBEnjluYnfkzOl4txy9bFLRzlQ9xbvW+xX
         /IDPFI6UeuqegNKUmNV1LGWNJiI7/BvlWhmMf+46ejSxhDpqOWrQTQu9Iw5awP7MmlvA
         AfztFCbGIcyhWiT/yGXmzuvnC9/NHsRS6lu4wprM2GUe9JbaKyMr/rGw5SGaewT5wyB8
         9/31/T8ogBRvFAhZExaBphr/X0em1o3CjlhGTLWA98Jfbyo1eTr30GLqn3WvHqxS/6yN
         A3eA==
X-Gm-Message-State: AOJu0YzmNMZb+lvpHdFGtvhFpmB3cuBcKN9qKOOSMFlZmA9GCrWJlzrX
	Z4UQ0gJzSP82VFRe+pBIO/reSufthCYla1r4RUXYTtcEyS+gVn8Rvm5F0uu1PBPJfaQLWDp4W+8
	cvOR+rX5Sp5LhYvT7AXFIPLzRlQrL
X-Received: by 2002:a05:6808:b34:b0:3ac:ab36:2741 with SMTP id t20-20020a0568080b3400b003acab362741mr797318oij.53.1694759139624;
        Thu, 14 Sep 2023 23:25:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMHaFc+UC1EHaQRMbCwUpAmphXEf20cxE2AiOsjMs+KiUT0/fC2jPyxpfPcipU6ikyGrIg1Q==
X-Received: by 2002:a05:6808:b34:b0:3ac:ab36:2741 with SMTP id t20-20020a0568080b3400b003acab362741mr797288oij.53.1694759139377;
        Thu, 14 Sep 2023 23:25:39 -0700 (PDT)
Received: from redhat.com ([2804:1b3:a803:4ff9:7c29:fe41:6aa7:43df])
        by smtp.gmail.com with ESMTPSA id e27-20020a05680809bb00b003a37372e6b2sm1294124oig.21.2023.09.14.23.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 23:25:38 -0700 (PDT)
Date: Fri, 15 Sep 2023 03:25:29 -0300
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
Subject: Re: [PATCH V11 14/17] RISC-V: paravirt: pvqspinlock: Add kconfig
 entry
Message-ID: <ZQP42f5SC2ecaAKE@redhat.com>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-15-guoren@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230910082911.3378782-15-guoren@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_232542_960708_90418F08 
X-CRM114-Status: GOOD (  15.63  )
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

On Sun, Sep 10, 2023 at 04:29:08AM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Add kconfig entry for paravirt_spinlock, an unfair qspinlock
> virtualization-friendly backend, by halting the virtual CPU rather
> than spinning.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/Kconfig         | 12 ++++++++++++
>  arch/riscv/kernel/Makefile |  1 +
>  2 files changed, 13 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 4bcff2860f48..ec0da24ed6fb 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -813,6 +813,18 @@ config RELOCATABLE
>  
>            If unsure, say N.
>  
> +config PARAVIRT_SPINLOCKS
> +	bool "Paravirtualization layer for spinlocks"
> +	depends on QUEUED_SPINLOCKS
> +	default y
> +	help
> +	  Paravirtualized spinlocks allow a unfair qspinlock to replace the
> +	  test-set kvm-guest virt spinlock implementation with something
> +	  virtualization-friendly, for example, halt the virtual CPU rather
> +	  than spinning.
> +
> +	  If you are unsure how to answer this question, answer Y.
> +
>  endmenu # "Kernel features"
>  
>  menu "Boot options"
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index 671ad85f28f2..114b29234c46 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -103,3 +103,4 @@ obj-$(CONFIG_ARCH_RV64ILP32)	+= compat_signal.o
>  
>  obj-$(CONFIG_64BIT)		+= pi/
>  obj-$(CONFIG_ACPI)		+= acpi.o
> +obj-$(CONFIG_PARAVIRT_SPINLOCKS) += qspinlock_paravirt.o
> -- 
> 2.36.1
> 

LGTM:
Reviewed-by: Leonardo Bras <leobras@redhat.com>

Thanks!
Leo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
