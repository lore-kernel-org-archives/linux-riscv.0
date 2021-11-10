Return-Path: <SRS0=I72s=P5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16858C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 10:38:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7C836112F
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Nov 2021 10:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7C836112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cV+MwK9G9/Y0jfQAroCN78qjr6jE+ycqOtm00W4ugcQ=; b=w7rRGB088i95ttpGWxzuNtzIs+
	8sWQ+zQWPNn8PY+nGG4+8G6lfRu7shcLuxegr/e7+yBsZLt28lv09ZsG+MxBvNsvOMrb80Q5YXo3S
	FOestaP3lzXLUgJmF0DtmhU7jm9rb2iD529UJXaSfBhdsDdOB0Ob/5W2meA8cA2LXOC1AsxM0BWFX
	hwxeBIe9IyuGKna2mGm9yghAUnR4jYB3E0r4JEUFEDLpOBiqSgB3lRgJo4MFKPGmEx4ZfNnTagb6f
	U9/0dhonH90/LeEEXAHqNcsGB6mbWNM8i+xS9+ZXxCCFhC7Hhw9sC1Sjr4HQlAkQ0WEKfmvOeSDKk
	hcjGZVgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkkzz-0059s0-Ew; Wed, 10 Nov 2021 10:38:35 +0000
Received: from imap3.hz.codethink.co.uk ([176.9.8.87])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkkzw-0059qU-3H
 for linux-riscv@lists.infradead.org; Wed, 10 Nov 2021 10:38:33 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=[192.168.0.21])
 by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1mkkzl-0007o9-D5; Wed, 10 Nov 2021 10:38:21 +0000
Subject: Re: [PATCH v9 16/17] riscv: Fix an illegal instruction exception when
 accessing vlenb without enable vector first
To: Greentime Hu <greentime.hu@sifive.com>, palmer@dabbelt.com,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu
References: <cover.1636362169.git.greentime.hu@sifive.com>
 <3c0297d8335e4cac54a4397c880092c1c983e04e.1636362169.git.greentime.hu@sifive.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <2d08f105-64fd-a43a-1dea-24870ff7c5b0@codethink.co.uk>
Date: Wed, 10 Nov 2021 10:38:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <3c0297d8335e4cac54a4397c880092c1c983e04e.1636362169.git.greentime.hu@sifive.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_023832_194725_62F206A5 
X-CRM114-Status: GOOD (  20.57  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 09/11/2021 09:48, Greentime Hu wrote:
> It triggered an illegal instruction exception when accessing vlenb CSR
> without enable vector first. To fix this issue, we should enable vector
> before using it and disable vector after using it.
> 
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>   arch/riscv/include/asm/vector.h        | 2 ++
>   arch/riscv/kernel/cpufeature.c         | 2 ++
>   arch/riscv/kernel/kernel_mode_vector.c | 6 ++++--
>   3 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index 5d7f14453f68..ca063c8f47f2 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -8,6 +8,8 @@
>   
>   #include <linux/types.h>
>   
> +void rvv_enable(void);
> +void rvv_disable(void);
>   void kernel_rvv_begin(void);
>   void kernel_rvv_end(void);
>   
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 8e7557980faf..0139ec20adce 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -159,7 +159,9 @@ void __init riscv_fill_hwcap(void)
>   	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
>   		static_branch_enable(&cpu_hwcap_vector);
>   		/* There are 32 vector registers with vlenb length. */
> +		rvv_enable();
>   		riscv_vsize = csr_read(CSR_VLENB) * 32;
> +		rvv_disable();
>   	}
>   #endif

Would it be better to enable this here, and then restore the original
state instead of calling rvv_disable? If it was enabled then maybe
something else is going to rely on that state?

Maybe something like:

		prev = rvv_enable()
		riscv_vsize = csr_read(CSR_VLENB) * 32;
		rvv_restore(prev);


>   }
> diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
> index 8d2e53ea25c1..1ecb6ec5c56d 100644
> --- a/arch/riscv/kernel/kernel_mode_vector.c
> +++ b/arch/riscv/kernel/kernel_mode_vector.c
> @@ -71,15 +71,17 @@ static void put_cpu_vector_context(void)
>   	preempt_enable();
>   }
>   
> -static void rvv_enable(void)
> +void rvv_enable(void)
>   {
>   	csr_set(CSR_STATUS, SR_VS);
>   }
> +EXPORT_SYMBOL(rvv_enable);
>   
> -static void rvv_disable(void)
> +void rvv_disable(void)
>   {
>   	csr_clear(CSR_STATUS, SR_VS);
>   }
> +EXPORT_SYMBOL(rvv_disable);
>   
>   /*
>    * kernel_rvv_begin(): obtain the CPU vector registers for use by the calling
> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
