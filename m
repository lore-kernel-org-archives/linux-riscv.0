Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D80EEE25E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 20:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3LMnsyr6eXh/EfEfg9bJIJnWhoNWJ0SUDfxZDgMhIEs=; b=QP1ZRva8VgzlA8
	iegG5AAVgyeZDGFjQ9hhBkcWyNOz5V4RKyUDbpZP9vz1XowK0CTDOGCKRaE+FbjIAw4ON6Ed+vNX9
	zGjo/MT382ty3XGtjtFvtR67zOdmyDxui0Ihl7O8lfEgy3/huLEGY45H8m6Uh1V+e4cY10tWVXxR6
	tLE6OfJH0uSQrDU7RuUX+t3Az0O8cf5DNb2SjsnYMmNJm+3tvh4A0EjTubfRTmTHMU1tTiET9egBJ
	wYp0SUlzZ+XkSnSRgS+Ij5zA1D7yLcaOPB4ijsZAdH89QIF510dZnSIDmEd95x6B9KoqQ69vWZhgF
	Nt7wOhWQnIAhX1sSIkCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soqZm-0000000EBpy-0elb;
	Thu, 12 Sep 2024 20:38:02 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soqZi-0000000EBpO-0vd0
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 20:38:00 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-71798661a52so1107517b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 13:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726173477; x=1726778277; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=suhtOeu9PBoMcCzuCwQpjOOtsg7slCT/xflY4+7rlvM=;
        b=O5V5k3nBte4tSOCHfbYN5QYl+n7YcTgbSqjU/RN0HErcrRThQYTd0HwmKvwmRyAp9n
         5FslewdNQkWpL9kvjB8AiaAj965wjzG0hIWx4AbaiV7yQlXB1PJRwm/nBbRvRt/obKbw
         wSFZ3aDFDXijlqL1/EnLry0fHFpjZHnLgcK/3RsMj0pvI5LzeusbTS86PZXJ2KNz2NUw
         n5D1Phh+5TdomCmD9vml6g+17+PIBBELVo9w3CuA6MiKZs5MwZ+twUiD+T5N3I+TrB+c
         KHFChfakZPpOAgjV1G8luJnugWUtZigeAcR0CLkGYDfEZg0MtswVvcXXJ7m6zfA5NnW3
         iBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726173477; x=1726778277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suhtOeu9PBoMcCzuCwQpjOOtsg7slCT/xflY4+7rlvM=;
        b=T3KP6KrXQrbdoVR/dMaHFlmJ2riINFm/EulNd9OJKQ9ytdC576yYVsfozIQ/95V0as
         ldiznJ+Zn34xc0aZcyCS4U/xGlKDFJGtidwrBjlVtJ3w6dWCSHjuwxX1KaehlVrGIW8P
         iLONkgYGNoBhniuPVIQGbECCftkkWwbCfEnruD4Eezp/yOZAEJtkKJRj7JYrB1gdwgRQ
         xCO9pXYbwVJzMA+jbqUwQ4oN8CQGwpJPCPtw8Y4IuB9sWodCy4OYtdvkNhty4slttVVF
         pgr1Dr3+6gr3NA+PKGuaRfXGDskZ6hyqPIN8N+MtFVZeiJex4cd4IZFY7+epibBU5mvq
         2PYA==
X-Forwarded-Encrypted: i=1; AJvYcCVI8RXn7ghl4u79xBgJnU9bxifNPiku/fvZ2dnvxGkPNOWwbpua/DB3OASwhnR+Js4IbH2urERhQ3EKgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxshdchZDAI9IBBgFfliyjjV5R4GR3FzLgO3O8XrF/OIPu9SM1o
	2lWK4nFHR300XsUUnYqWFQ1VY1TEz1JOQTPbyvqUmrspLAcMJOPqINzKCP26uh4=
X-Google-Smtp-Source: AGHT+IEPZkfWCHuNRnb9w66UzgZ4/IOwRt4Qb1WwmAi9n2EGyfgaTtP8WV199QorTDpuzxXGy3pxbw==
X-Received: by 2002:a05:6a00:6f4d:b0:718:eeab:97ca with SMTP id d2e1a72fcca58-71907d98483mr19442770b3a.2.1726173477187;
        Thu, 12 Sep 2024 13:37:57 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe27bfsm4972931b3a.56.2024.09.12.13.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 13:37:56 -0700 (PDT)
Date: Thu, 12 Sep 2024 13:37:54 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: WangYuli <wangyuli@uniontech.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	samuel.holland@sifive.com, conor.dooley@microchip.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	atish.patra@wdc.com, anup@brainfault.org, guanwentao@uniontech.com,
	zhanjun@uniontech.com
Subject: Re: [RESEND. PATCH] riscv: Use '%u' to format the output of 'cpu'
Message-ID: <ZuNRIrfLgkWUsZri@ghost>
References: <E4CA32D7942C8637+20240912134946.163833-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E4CA32D7942C8637+20240912134946.163833-1-wangyuli@uniontech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_133758_481391_9A3EEAD3 
X-CRM114-Status: GOOD (  16.59  )
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

On Thu, Sep 12, 2024 at 09:49:46PM +0800, WangYuli wrote:
> 'cpu' is an unsigned integer, so its placeholder should be %u, not %d.
> 
> Suggested-by: Wentao Guan <guanwentao@uniontech.com>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  arch/riscv/kernel/cpu-hotplug.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/cpu-hotplug.c b/arch/riscv/kernel/cpu-hotplug.c
> index 28b58fc5ad19..a1e38ecfc8be 100644
> --- a/arch/riscv/kernel/cpu-hotplug.c
> +++ b/arch/riscv/kernel/cpu-hotplug.c
> @@ -58,7 +58,7 @@ void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
>  	if (cpu_ops->cpu_is_stopped)
>  		ret = cpu_ops->cpu_is_stopped(cpu);
>  	if (ret)
> -		pr_warn("CPU%d may not have stopped: %d\n", cpu, ret);
> +		pr_warn("CPU%u may not have stopped: %d\n", cpu, ret);
>  }
>  
>  /*
> -- 
> 2.43.4

Thanks!

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
