Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03367C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 18:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HP43XMrWhXkS7QVA0bf97+KuOCcCm0rOQFsIGNYgPeM=; b=VN80zFzgXUptsI
	4iYsVYdbW3XDBaBLFtNl84VHTxLDzM8k3Rk4LyNoCfhzrix/bEs9b8deNA9n57m6/B5lFxH7gz+hi
	S22qb+Cj7V+7PYJBQvGUy2XfOnWVTlLtX0q4V23mFoNLwsTsbNCthOmVEB8+j04RVZZLwCPxQudbn
	hyrce1C+L7MKueFVNC29Q0GNQeNM065dCj/PnIw8RK/XOyMmv6kyp0uSLR63xHjfeyoJRJPAeA2ZI
	A6jqSkbDeabIPSo8rMC3tUlKtpZrWGryyNz7qCOTbgl3W05DGpluxlMRubTZA2CslovptN7NBMvcY
	LfW9QAm/SoUOmtwxLMWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZaa4-00000006OAS-25XG;
	Thu, 01 Aug 2024 18:31:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZZaL-00000006FXb-3xoC
	for linux-riscv@bombadil.infradead.org;
	Thu, 01 Aug 2024 17:27:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eqfEz+HJ51esTeFjGcuq9d9pgxM3+keTReLtTqI2sYw=; b=amJOk8uAWgQqlRtntSNzAZ2aQJ
	mzCNyCLcBLHT/VNfHlV58O7cQqskFcygtqXErEa9LI/mqjQQn3gyufj32J/mAbssdxkxVsBDMY4WL
	sxHi6jAemBa7EmeapJIXs3Nm5glx0Cp+UfE6vF4T4044k0DY0MRIkzozPQYtwoh+AjX8m3Cjhshul
	0ZbZ6gYsDWk8K/L65e5h4Tg+G2k2jOZxJLgZ8i3iBEt5bCpjKa0vCWQw/JguICydzORlYd7LqFnjk
	BvTtz5fd6crmd6q+AQ85ustthxFl3UirCkUqdTAxNVXOtwqUITiCkyVaEn7jeVAXy9GTEJH1KfDU0
	LOOF1rYA==;
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZZaI-00000005Ws4-1YZd
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 17:27:28 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2cfd1b25aaaso2331064a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 10:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722533243; x=1723138043; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eqfEz+HJ51esTeFjGcuq9d9pgxM3+keTReLtTqI2sYw=;
        b=TtFiZJ1d9az/IgBavelyPrTAQuQOYlBmkv4df4WUYGs+hiphTkF0AbeVgNMtAGvgST
         PVAH6c3uUBjnSgSu/Nq/t+VIzKS7CL9sH5aiu4dg6EKnxWjJViNSkZgaagwQVtgCeMGR
         aHqix3s/ARbN/QJoSTKcgaXMwf9iU9mNWpq3S+jXvO0xmYZIXEurdJJvoNp5dF4pGJxi
         yT639yd1KgfI+dUAm4PRNfSvJulhdZRZzqY9CnblvnaKYzWmz8EvcuWvhr41mikhj0bo
         I1FxqJAopNERU5vu4W9fUN3oFAfWOT23sKiIdUcCsphVIP1+kmNXjIYf/unE5N4Hc2+9
         qsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722533243; x=1723138043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqfEz+HJ51esTeFjGcuq9d9pgxM3+keTReLtTqI2sYw=;
        b=wb6+a5W8bEmeR7PNLOzxAstNn4egA2mb2ub3a2388GPrNBkgYYu1qSHH7LeUNI9fZN
         JEiDWUFTnWXdjWps886/uwAQHRmTcAwZWptWdeEfyEBMMnC0dAeBMjUoOauua00CwH7P
         dxRtzF/BFDQXD6mmAs7DIMh6fL7xPzPAYz+0JfxjJCIKlQSwCCFW+AUT2uMCQopj70p5
         Ez/J1L18fcLQCD4un/x7yiiWiWivQgB9ZhFnxAtGbv00HoQImAWud+Ohzr/jip+I0Idh
         FnJipFd+xqnJLeKKm3anggoL9hrBc3ICgBhBSQb8BilIPJ86TaamPv1INarSwjPDGm+C
         Bv0A==
X-Forwarded-Encrypted: i=1; AJvYcCUoiW7hfPNo+sF3ockze+kG0Bgknds5Y7CKsynzr3vmZAkxwoterCK8PviKADPTw/ql/UruBB2rj9x0qYnQZ48oXQcUTUYhkUQh978Nd32u
X-Gm-Message-State: AOJu0YyJPCUbZ/S1RwfNp+W4MWu+ll3pPstENDA62dE4CZxC8V4LISwj
	zuihs3UWMe8ArAV/sOd9ENB4/NLH40jksQnczXkpjkfmG288XUgzAq8CY7C7kRk=
X-Google-Smtp-Source: AGHT+IEBSL6psp8uqwX7WC0XSgw8iBQcOzO0q+abKTudQIxbfRflqktoR6lOfpGvOhqrMQh2mFtLog==
X-Received: by 2002:a17:90a:c70c:b0:2c9:7803:1cf6 with SMTP id 98e67ed59e1d1-2cff94478a8mr1104445a91.20.1722533242940;
        Thu, 01 Aug 2024 10:27:22 -0700 (PDT)
Received: from ghost ([2601:647:6700:2d90:35dc:9596:26a6:873f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cffaf69a58sm206667a91.4.2024.08.01.10.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 10:27:22 -0700 (PDT)
Date: Thu, 1 Aug 2024 10:27:20 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH] cpumask: de-duplicate assign_cpu() API
Message-ID: <ZqvFeJVy4BpwcOjm@ghost>
References: <20240731195355.97488-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240731195355.97488-1-yury.norov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_182726_697305_FC6F6B2F 
X-CRM114-Status: GOOD (  20.75  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 31, 2024 at 12:53:54PM -0700, Yury Norov wrote:
> We've got cpumask_assign_cpu() function and assign_cpu() macro, both
> doing the same thing. We need to drop one to avoid unneeded duplicatioon.
> 
> Now that underlying assign_bit() implemented as a macro, it would make
> sense to keep assign_cpu() which is also implemented as a macro, in sake
> of unification.
> 
> This patch also removes __cpumask_assign_cpu() as the function is
> unused.
> 
> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> ---
>  arch/riscv/mm/cacheflush.c |  2 +-
>  include/linux/cpumask.h    | 16 ----------------
>  2 files changed, 1 insertion(+), 17 deletions(-)
> 
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index a03c994eed3b..fa136627ccaa 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -171,7 +171,7 @@ static void set_icache_stale_mask(void)
>  	stale_cpu = cpumask_test_cpu(smp_processor_id(), mask);
>  
>  	cpumask_setall(mask);
> -	cpumask_assign_cpu(smp_processor_id(), mask, stale_cpu);
> +	assign_cpu(smp_processor_id(), mask, stale_cpu);
>  }
>  #endif
>  
> diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
> index 801a7e524113..f896c6ffa78e 100644
> --- a/include/linux/cpumask.h
> +++ b/include/linux/cpumask.h
> @@ -534,22 +534,6 @@ static __always_inline void __cpumask_clear_cpu(int cpu, struct cpumask *dstp)
>  	__clear_bit(cpumask_check(cpu), cpumask_bits(dstp));
>  }
>  
> -/**
> - * cpumask_assign_cpu - assign a cpu in a cpumask
> - * @cpu: cpu number (< nr_cpu_ids)
> - * @dstp: the cpumask pointer
> - * @bool: the value to assign
> - */
> -static __always_inline void cpumask_assign_cpu(int cpu, struct cpumask *dstp, bool value)
> -{
> -	assign_bit(cpumask_check(cpu), cpumask_bits(dstp), value);
> -}
> -
> -static __always_inline void __cpumask_assign_cpu(int cpu, struct cpumask *dstp, bool value)
> -{
> -	__assign_bit(cpumask_check(cpu), cpumask_bits(dstp), value);
> -}

This deletion is the wrong way around. cpumask_assign_cpu already
existed when assign_cpu was added. cpumask_assign_cpu uses the same
naming convention as all of the other cpumask functions, so it is
inconsistent with the other defines in this file to drop the "cpumask"
prefix.

__cpumask_assign_cpu is not currently used but all of the other cpumask
functions have a "__" alternative so that's why I added it.

- Charlie

> -
>  /**
>   * cpumask_test_cpu - test for a cpu in a cpumask
>   * @cpu: cpu number (< nr_cpu_ids)
> -- 

> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
