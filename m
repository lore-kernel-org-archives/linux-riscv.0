Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C0FC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 10:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KgZ7kbviTB8+7ykXAi/c2SvXHgfNpcgdqv3/wQScFWc=; b=OFCrjUDhYpOAv7
	Jhf7zHELaBQe7URzkx222iSHxK8Iz0k5zrYo1mOL+7Lp+aaDyI3M8GN1aTBQIGLD9uL0O0qA6Ty8d
	hnIfEnqDe7YnGBDyG6Hjfpfxh9sjNAPwBPyBJjLWoJmQ+aFcOLqs9wXWoFvxL98SnjzClg7QMNZt+
	Pz35x3T0+eTek5WpCK34s9X1n4SeeiCAtRMBAkxYtaDKXVpUI/r1jkyFOrHfXW5hzBp5L1aP6UD39
	S+ZaIuZqRj6gpz3iH+n3LpIlp81pqoZcUB6vegSIKTwL61fixx1txa/b/0383xsDd0FrieR7/Z7c4
	KEy/JHDr2xsif10y63eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox4Qq-00CiOJ-Mh; Mon, 21 Nov 2022 10:53:44 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox4Qm-00CiJK-Ls
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 10:53:42 +0000
Received: by mail-ej1-x630.google.com with SMTP id ud5so27579118ejc.4
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 02:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dIXltM9CwIEJBW31n6qcOnoQuAF0SYx/10yh0pflqpw=;
        b=A54emkiJ8d6mOzX4CHxA7liwacxc6I+kXhc8muuDfztTsk5k1uMLeT9qmRHKHj7sAS
         68Z9FCGJJnhe4rKCXyw4A3k9UegtNH0fo6wV4/aZDoKa+PnwIzU9gXuwmryHp5I9+OPm
         0v6yDSf82LOR5TncBiHERECtXv5zjVEMnqoNRkM9TXaHpE3MVOqo1O2cSHqjkXyCWXQw
         JtpH+AcHcP0rv1HdeWHHaaXzzHIIr9oVjxoAENs086nIwSA8823hsjlPG1OHCVO5cPXV
         cJ/6KQezs19JNBcUSBL7fn9xb3IdEetBQm1zZwA+Sdyxu+2grADwX/Px4Kc6AlNgo58N
         Gqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIXltM9CwIEJBW31n6qcOnoQuAF0SYx/10yh0pflqpw=;
        b=eKbKwWSGUdvb2HDeRHXB7vbS0y58eoAKsvY7y9Lpjfyo1Fn9tCd8KXJDUKZZwB0jt+
         Q1uBaeVU5HfmK2Y73BEIoeNuPFaaCfbpUx2xbRHKnq/TF025PH7wexQRylZvEW+UySi3
         AAdNXncYlsVWFyGFgU01rjc4shBXLovyzb2NILZgshbsH2EXT9BL8ItxT5jnvagcLxP1
         04RkP5VGQPgz1DjRq3Z5Tqn4aWdIqt6ULgF7GTI1EiN0gO5v3Lseo1viHsVCyfMh4OOp
         WCBUoY5aREIpq2Dehedsme7N8O2Qrl++eLfv+nmGfDED8IEkhxQQOu2AE4NoIgVu/zLg
         txoQ==
X-Gm-Message-State: ANoB5pnmIUuBOOAnEplSQLRbfl0yZJNy0fxQxI2zma0j5QrsW+pbzph+
	Ew5BO4535dY3N7Ib7ZUw8pgbgw==
X-Google-Smtp-Source: AA0mqf6dWp3Wpc0Ov+iHZfb7e76FT+vzBR/MkIgZsC+2m3i5woHAUQ20TzzBrzWK50sy5/WbjwaUjw==
X-Received: by 2002:a17:906:1495:b0:7ad:d250:b904 with SMTP id x21-20020a170906149500b007add250b904mr14898663ejc.633.1669028014848;
        Mon, 21 Nov 2022 02:53:34 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id u9-20020a1709061da900b0074136cac2e7sm1716343ejh.81.2022.11.21.02.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 02:53:34 -0800 (PST)
Date: Mon, 21 Nov 2022 11:53:33 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Chen Lifu <chenlifu@huawei.com>
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] RISC-V: KVM: optimize kvm_arch_hardware_enable()
Message-ID: <20221121105333.rap67cpmst3odiid@kamzik>
References: <20221121003915.2817102-1-chenlifu@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221121003915.2817102-1-chenlifu@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_025340_723574_9D5D2337 
X-CRM114-Status: GOOD (  18.60  )
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

On Mon, Nov 21, 2022 at 08:39:15AM +0800, Chen Lifu wrote:
> The values of CSR_HEDELEG and CSR_HIDELEG registers are constants,
> so change them from variables to macros.
> 
> Signed-off-by: Chen Lifu <chenlifu@huawei.com>
> ---
>  arch/riscv/kvm/main.c | 31 +++++++++++++------------------
>  1 file changed, 13 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index df2d8716851f..70196b03b6f9 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -12,10 +12,21 @@
>  #include <linux/kvm_host.h>
>  #include <asm/csr.h>
>  #include <asm/hwcap.h>
>  #include <asm/sbi.h>
>  
> +#define EXC_HEDELEG ((1UL << EXC_INST_MISALIGNED) | \
> +		     (1UL << EXC_BREAKPOINT)      | \
> +		     (1UL << EXC_SYSCALL)         | \
> +		     (1UL << EXC_INST_PAGE_FAULT) | \
> +		     (1UL << EXC_LOAD_PAGE_FAULT) | \
> +		     (1UL << EXC_STORE_PAGE_FAULT))
> +
> +#define IRQ_HIDELEG ((1UL << IRQ_VS_SOFT)  | \
> +		     (1UL << IRQ_VS_TIMER) | \
> +		     (1UL << IRQ_VS_EXT))
> +
>  long kvm_arch_dev_ioctl(struct file *filp,
>  			unsigned int ioctl, unsigned long arg)
>  {
>  	return -EINVAL;
>  }
> @@ -30,29 +41,13 @@ int kvm_arch_hardware_setup(void *opaque)
>  	return 0;
>  }
>  
>  int kvm_arch_hardware_enable(void)
>  {
> -	unsigned long hideleg, hedeleg;
> -
> -	hedeleg = 0;
> -	hedeleg |= (1UL << EXC_INST_MISALIGNED);
> -	hedeleg |= (1UL << EXC_BREAKPOINT);
> -	hedeleg |= (1UL << EXC_SYSCALL);
> -	hedeleg |= (1UL << EXC_INST_PAGE_FAULT);
> -	hedeleg |= (1UL << EXC_LOAD_PAGE_FAULT);
> -	hedeleg |= (1UL << EXC_STORE_PAGE_FAULT);
> -	csr_write(CSR_HEDELEG, hedeleg);
> -
> -	hideleg = 0;
> -	hideleg |= (1UL << IRQ_VS_SOFT);
> -	hideleg |= (1UL << IRQ_VS_TIMER);
> -	hideleg |= (1UL << IRQ_VS_EXT);
> -	csr_write(CSR_HIDELEG, hideleg);
> -
> +	csr_write(CSR_HEDELEG, EXC_HEDELEG);
> +	csr_write(CSR_HIDELEG, IRQ_HIDELEG);
>  	csr_write(CSR_HCOUNTEREN, -1UL);
> -
>  	csr_write(CSR_HVIP, 0);
>  
>  	return 0;
>  }
>  
> -- 
> 2.37.1
>

I don't think this optimizes anything. I'm pretty sure the compiler will
load the input to csr_write() in the most efficient way it can, regardless
of using a constant or building the input out of constants. This could
maybe be considered a code cleanup, but, in this case, it's really in the
eye of the beholder.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
