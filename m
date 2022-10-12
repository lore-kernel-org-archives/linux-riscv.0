Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B86C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Oct 2022 12:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NuS2JGnZvloVcnv5WnsMH3Ny6BDwsowtCNAm0tZheA4=; b=GJQYot+HQmuumC
	gaIAzKDyBB1Le3SwwfKEG01/jnHFAszlpzIvmDecC2y1+I0ZFQ3kpWW9FE1We/ryo9Y3YvgnY/BeT
	eiWfKKdw9UJ5jBSPuYLYGlUTYk9L+vRlXVZy7P3tvRW41a0ZasqqQUfJRrYB6/0Mj3hf8KZ9k4Q6V
	gaef2/OiHipD1ZWKOk9wJpI6lTVVnxZrK6p3BLdCiLBEG6wJ8BzyMmcCwH+nUDBRTD1D1IihFOEzl
	yiDZeka/AeX5IyaRcgQ9edAD03maEnrWcuDIraPjw8nyuX5oP9LIn1HURQHGOf64NIp2RH9vkHJQ/
	9ce8Yc7NyEe0ySOKBg0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oibGr-0082l6-UC; Wed, 12 Oct 2022 12:55:37 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oibGo-0082hG-UK
	for linux-riscv@lists.infradead.org; Wed, 12 Oct 2022 12:55:36 +0000
Received: by mail-qk1-x734.google.com with SMTP id z30so10331826qkz.13
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 05:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NykrHH5gGzZDG/0TkAsC81A7G9ja1/v69DTLp124N0A=;
        b=kVm+MZ4kgwUUmzvVYwV9rmiJNq5uz6+zJ9wVZ+Us2BKadF2Zv2QkIIjlF5U9py+KqX
         uOJV+cYGG4EuRfH7M7qiTnWg5qyUCBSJiZEjjINym37WwAecgc2eCvqZrviS3GU9ml3M
         vkgF9Ng0bohPEuygOzRNKCEp5w53znYsl7RBEF1ZS36tS2mtjKhCG/YcCuKv3mTm11OQ
         R3vj7pifmeB5ol/BhdJOv9fOYpCxd2httfqPM8CoR0AJg9wVJ1WCCNsP2x2RLjT1qkDC
         leNbb3+kSswCJVRmtHdQhMjI17d63CmKKzo2w5uDhcX1SfjM7TuzvpVt607iPZ8acdB2
         Vm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NykrHH5gGzZDG/0TkAsC81A7G9ja1/v69DTLp124N0A=;
        b=YqjQWQ7YtfxMLQNGsVpLuJfaOoDEIl8R1BXwP2u5b04j4IR4Gnqxj72hWRGgeH1Aex
         kE7DRXr+c6fy6mxVfyeBkyIFxsvLGET4K8UkAb9YXGjbOpvze1DhqNk8P7Fd8XyvAWV8
         Sl59XeacON7ByOCRtgTPJBT6C4djoD76t3CjqI2WRcgItP29dqjYstk6+Yb+BI9HTjWG
         YdDhyEKWh5e6FdlAgFs1AIKK6Sohs87tUI2RxkF+8qxHxcANW+rGNdN2fodke8j5EXgS
         pSBLn2YLlICkilXYIo8+Yyk7VxcI1sq1MS37nrp39oZ3m/xJCa7NqDwx2/XiS8EqaW1b
         il/A==
X-Gm-Message-State: ACrzQf16fHAPoLAqt0Vl2qa6kDzrsCUZWrcNU3p+WZuZAg0wWSC0T7Ri
	5TXEZMC2FcaYSJ8Mbj83FKc=
X-Google-Smtp-Source: AMsMyM69O4fIUv1aXMHjdjQZ/fYZolbB5HWb2IerIhd/VpZTfLLC3edt7+vZwU7xsOakHxVWIrEWCg==
X-Received: by 2002:a37:5e41:0:b0:6ce:79e2:68af with SMTP id s62-20020a375e41000000b006ce79e268afmr20132324qkb.239.1665579330011;
        Wed, 12 Oct 2022 05:55:30 -0700 (PDT)
Received: from localhost ([2601:4c1:c100:2270:e933:ff1b:52b1:c383])
        by smtp.gmail.com with ESMTPSA id k19-20020a05620a0b9300b006ecb9dfdd15sm8087460qkh.92.2022.10.12.05.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 05:55:29 -0700 (PDT)
Date: Wed, 12 Oct 2022 05:55:29 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v2] RISC-V: Fix /proc/cpuinfo cpumask warning
Message-ID: <Y0a5QYWzEwRlGtxf@yury-laptop>
References: <20221012082949.1801222-1-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221012082949.1801222-1-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_055535_029764_1AEF1C86 
X-CRM114-Status: GOOD (  25.06  )
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

On Wed, Oct 12, 2022 at 10:29:49AM +0200, Andrew Jones wrote:
> Commit 78e5a3399421 ("cpumask: fix checking valid cpu range") has
> started issuing warnings[*] when cpu indices equal to nr_cpu_ids - 1
> are passed to cpumask_next* functions. seq_read_iter() and cpuinfo's
> start and next seq operations implement a pattern like
> 
>   n = cpumask_next(n - 1, mask);
>   show(n);
>   while (1) {
>       ++n;
>       n = cpumask_next(n - 1, mask);
>       if (n >= nr_cpu_ids)
>           break;
>       show(n);
>   }

Can you instead of sudo-code print show the real control flow? What
function hosts the infinite loop?

> which will issue the warning when reading /proc/cpuinfo. Ensure no
> warning is generated by validating the cpu index before calling
> cpumask_next().
> 
> [*] Warnings will only appear with DEBUG_PER_CPU_MAPS enabled.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Cc: Yury Norov <yury.norov@gmail.com>
> ---
> v2:
>   - Got comments on the x86 equivalent patch and made the same
>     changes to this one
>     - Added all the information I should have in the first place
>       to the commit message [Boris]
>     - Changed style of fix [Boris]
> 
> 
>  arch/riscv/kernel/cpu.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 4aa8cd749441..63138b880b92 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -166,6 +166,9 @@ static void print_mmu(struct seq_file *f)
>  
>  static void *c_start(struct seq_file *m, loff_t *pos)
>  {
> +	if (*pos >= nr_cpu_ids)
> +		return NULL;
> +
>  	*pos = cpumask_next(*pos - 1, cpu_online_mask);
>  	if ((*pos) < nr_cpu_ids)
>  		return (void *)(uintptr_t)(1 + *pos);

OK, as far as I understood your explanations, *pos == nr_cpu_ids
is a valid index because it's used as stop-code for traversing.

However, you're completely silencing cpumask_check(), including
those cases where *pos > nr_cpu_ids. I suspect there's no valid
cases for it. If so, the patch should look like:

 +	if (*pos == nr_cpu_ids)
 +		return NULL;
 +

The same for x86 patch. 

If it comes to v3, can you send both as a series?

Thanks,
Yury

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
