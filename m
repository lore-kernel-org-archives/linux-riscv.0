Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D13C636D7
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 06:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aC31f7R8N4BVlW5KWXOCm0WEpyrX5WxWu0o7LUhwR1o=; b=C8UnoQuiK8OWkX
	AqKHhDTonAiGGpj78MU6ddZ6KGlJv+rUspIqdvraYgbtK8HPlp+03m0YDO1RGW+WdvqRMi2TaXeKI
	OW1vBqVCOZO9oNdl+1SjLQ8Q/U6SVDsFrrjegzMmohwoHz9N7yE0FrtQjTid543Fy56FXD2yn201R
	4FyNZseoe5EkAllW0iydSi3pHT5GFCQFSGA2SmF/ADayOmg9aIXktGviWpmj3YHSur8291iibOT+c
	2T755Gt8gBBeabW69/3ME2iZ49qMCl7CRK1L4+KYX3LX2vyS8YNtQAnaopShar6cOVONT+CxaslZJ
	MoAfibTBjdgxy+djKs7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV5Gc-00FJEj-L1; Thu, 23 Feb 2023 06:39:46 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV5GZ-00FJDQ-Oj
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 06:39:45 +0000
Received: by mail-wm1-x332.google.com with SMTP id iv11-20020a05600c548b00b003dc52fed235so7126042wmb.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Feb 2023 22:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5qJ08paylLYIpqZj393DmlSgJI28b+LXoVSY+XPXR6Y=;
        b=aNaEmU0DREawGVFKaoJfBwUg8Cffu4p849yPLvioJyUCaf/whgBgTx3l5yN8bXrpwi
         HFIkM8WCQfOyulxB9851almxVn6JB6DSgq15oSXj6R6NxmrOdS1sFI65tnzIs1VjSVmY
         r7FIoplPw8BIiD6WRZHGeMqYmypUeODn4bZEj8RmTUVVoTXQ3l+qm+uKTZ2wK7FydrQc
         dSRSEPcwE/8m+ACaDTUNe87nlZgJON7DBnDvnRMCnQ8hijxqPEJgz5PoYFHCkCeySo7S
         FKjoydiF4SUE8PGwEuhQAqVjhsFA39NEsjv2vp5T++gSKz7xOhQBQOhsRCnTWVDuSQ/d
         914Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qJ08paylLYIpqZj393DmlSgJI28b+LXoVSY+XPXR6Y=;
        b=jbwF60DuZtmhhHiGy5zz2xd80ZBFlv5KXYl3RGDRiVIxbsl9SzMDBi/Hp8JKfWJGuF
         h64hNt9TllDqaOfH56LFeFmZzbrTJgp/uBjx/9ssTX2WmGPyJHbmHqUD0rHHjCm/hJAv
         uJmrwmaG4nnpCjkG4jelfq1OP9IJ1i8xo5ufxlW3ufWNO7qAro0eGmTJG6VQYo4iAbR1
         iwAINg13i4s5QewD1G15JT+G74/ctVbqch/NhUC7lfq9Q7hnyFZK/gSK8lLWbexJs58K
         LKQtWkuD5mGE2ZMoo8D4vZe3/mfz0kSa+8GHRvbX8SrTor5HNUTVBlU9//dFbtTn5xLs
         Uq7w==
X-Gm-Message-State: AO0yUKX+GJxFKzD9SN7upD4JrNuXRBL+d0BgxVKJt7zktBlGwrsbg+HR
	R0PvOFfAQ6oonZBOMmeUFtehMg==
X-Google-Smtp-Source: AK7set+OyPmjzGSDtb2O9PRYc5Lj9qVUcLm41Pwwe3M9MYNOoFahuQG4yXNkLZOpG67Uz2iNkaFmKQ==
X-Received: by 2002:a05:600c:13c3:b0:3e0:39:ec9d with SMTP id e3-20020a05600c13c300b003e00039ec9dmr8906162wmg.23.1677134378051;
        Wed, 22 Feb 2023 22:39:38 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c3b9e00b003e206cc7237sm11428892wms.24.2023.02.22.22.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 22:39:37 -0800 (PST)
Date: Thu, 23 Feb 2023 07:39:36 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/4] RISC-V: Change suspend_save_csrs and
 suspend_restore_csrs to public function
Message-ID: <20230223063936.6tsqh57lom3tvjxo@orel>
References: <20230221023523.1498500-1-jeeheng.sia@starfivetech.com>
 <20230221023523.1498500-2-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230221023523.1498500-2-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_223943_831131_9298667C 
X-CRM114-Status: GOOD (  15.99  )
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

On Tue, Feb 21, 2023 at 10:35:20AM +0800, Sia Jee Heng wrote:
> Currently suspend_save_csrs() and suspend_restore_csrs() functions are
> statically defined in the suspend.c. Change the function's attribute
> to public so that the functions can be used by hibernation as well.
> 
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Reviewed-by: Mason Huo <mason.huo@starfivetech.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/asm/suspend.h | 3 +++
>  arch/riscv/kernel/suspend.c      | 4 ++--
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/suspend.h b/arch/riscv/include/asm/suspend.h
> index 8be391c2aecb..75419c5ca272 100644
> --- a/arch/riscv/include/asm/suspend.h
> +++ b/arch/riscv/include/asm/suspend.h
> @@ -33,4 +33,7 @@ int cpu_suspend(unsigned long arg,
>  /* Low-level CPU resume entry function */
>  int __cpu_resume_enter(unsigned long hartid, unsigned long context);
>  
> +/* Used to save and restore the csr */

s/the csr/CSRs/

> +void suspend_save_csrs(struct suspend_context *context);
> +void suspend_restore_csrs(struct suspend_context *context);
>  #endif
> diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
> index 9ba24fb8cc93..3c89b8ec69c4 100644
> --- a/arch/riscv/kernel/suspend.c
> +++ b/arch/riscv/kernel/suspend.c
> @@ -8,7 +8,7 @@
>  #include <asm/csr.h>
>  #include <asm/suspend.h>
>  
> -static void suspend_save_csrs(struct suspend_context *context)
> +void suspend_save_csrs(struct suspend_context *context)
>  {
>  	context->scratch = csr_read(CSR_SCRATCH);
>  	context->tvec = csr_read(CSR_TVEC);
> @@ -29,7 +29,7 @@ static void suspend_save_csrs(struct suspend_context *context)
>  #endif
>  }
>  
> -static void suspend_restore_csrs(struct suspend_context *context)
> +void suspend_restore_csrs(struct suspend_context *context)
>  {
>  	csr_write(CSR_SCRATCH, context->scratch);
>  	csr_write(CSR_TVEC, context->tvec);
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
