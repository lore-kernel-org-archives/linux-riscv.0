Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1038CAC5A5
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 16:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KQLbXAfqnhYZUAj/HMC588OfQjDHqIThcbWYIyzOr5Y=; b=V1JBV1xRoeDhmz
	civql7d9OsLfEtJ2+k2BRWMBPqra3VAe/06k1BxCt0gNpyPBfEyOqQTIjwznL3EPDKzF7KgD0N0bw
	H3vr3QKZu0hNQSF7VGcJ8Di96WQ8ZnWFFJXKyTJ9qPdSAOMekqaeK6LzSGDQs8kBy9Ze0kMhYJS1R
	bSTF6F4HrDezLVtRDg3PsSlVT2lsb2odiN7sEKp3HSj1yYNcvJRy3Kyh/ZdKtmItPkI1v0mSDSEKm
	i77vFUU1hrqIKFBYNbvRlHSJDdWwVM72yelFc+2QrE25d7mLBip1hFkUFmrEalXppLkMpj0LWA6P/
	i8wd2JSocRXPSplTYShA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1SnO-00000001tl7-3tuN;
	Wed, 24 Sep 2025 16:56:46 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1SnL-00000001tiU-34Bh
	for linux-riscv@lists.infradead.org;
	Wed, 24 Sep 2025 16:56:45 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-8cc0cb783ffso7450639f.2
        for <linux-riscv@lists.infradead.org>; Wed, 24 Sep 2025 09:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758733002; x=1759337802; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CQQzEQlairAj51+ohta7VWgLRglW4GQMtLef+NgHrEI=;
        b=ALomGUxSekl3Xt2KIEF98cEHzAh4ZMesPj5z4goIKXXPlNEk5uY2YEZnCw8zSdngpi
         R40+Qa0u5GEidEFKef636PSWbYvTuJ+PidwSCtOUb5wdeVHcIZvTg9az2orsCepb8nsv
         zcrdk5WklOFEqHxGk6NRs9XrtcaioEg86YwwXNpSJJUIHJQzpfIpv4kQv850Z4b9R2N0
         Nn6u9AB9GFRg9sBjw054Kaw1kOnPKxcjoYUB3vHh4f649o+Yp/WqkF1+EHCM15DFFioA
         4BUTcl4p9X/Ti6IMrzg3z68feXOQvVsk6x7c4aaMLeH29vcUffpPXbBOlW41A+r9+Qyq
         qoiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758733002; x=1759337802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQQzEQlairAj51+ohta7VWgLRglW4GQMtLef+NgHrEI=;
        b=HFjRZAYLZIUTpXKrO6Ec5Xu+u7Aom9Fw1cR7HPfANaBOri3R1uUjA4u+7i2HckcdrN
         DKu6OtFe4oG0s3zIsPp5fnnl88NJfHw/gAFstF5I+ZBzUzlOWLxeZlVi1cBhALvxEqzV
         wpBzc9rVlVRGR1L8BL0Gdt4W8uMJIlBseOmlKBNcACU6LiRLIzVNfbYErdOOQdcna818
         idOtAEPGWHqWUdPRcQ6wtIeol2Y6ixcKrSFVnOfpcakMxs+NT48z3Sv8jqmndJrfUtx8
         aKvwA3KHaFq7SFvOmKwVQ96gHQ7jXibIghJBZZ99QJXtY1PR65UI7Q+fCGvaEDoTmzqO
         1zng==
X-Forwarded-Encrypted: i=1; AJvYcCVeFZRfcMIIw5s/6ho1aC5HpPwqRgM3TMzpZTi5QR0eQqgnzYo12PtUWfjwehLbmx3hR9ARUAorKqQ9UQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6xsKOjFGew8owRww6d60sb5+oEx6noeukcEeS2rvvozgdpp0m
	xhNObAJ2AOpyE/vQZ+I6jYWylETAzU1UkCC4A4IiKqDmEbJVgdB/HSqlo5lPxxGZdn4=
X-Gm-Gg: ASbGncu+olNwiMoFWD9rrkyY2e81waILezZGvFkyeGrSQ3MaypCo9zuwKrK2QP83+xT
	ydEQtM+QFwBwul+FUUAVJev+zO+OZq/+nEej1IYdf/CQJrXsDBrr+Zr6hL6bNFqndEjdMlMM7Be
	Hp0P6HZAtVbeRXrOvfCWzyCg1g3/hoOR5gv1XlShfAK5J1dOecwNgWPJuxYSVRPhQda8/VvPT5x
	OycZipgTM/PMEWCHbuhJ6MinrwbewMT+5/6XP9OGVm3dZ2SPLYJD5ehziErToWFFbI5rFSo1vl9
	Q4JgfMVd0gEv1bScgrXd3QNefRi6AerA9kk77XK0m4X4koOneuInJCOKYcbQ5hKncSbjzxUv70I
	a72kV7SyQW99G/L/qg4WoCPOf
X-Google-Smtp-Source: AGHT+IGBqrqJ6aGPvymHhMG99f/WWRWdd/TLY3Hx8xLtGHi9mUrXvTzfn7rPTbE9CvxrAKE0HVc8sw==
X-Received: by 2002:a05:6602:6081:b0:887:6854:b075 with SMTP id ca18e2360f4ac-901526045demr46544239f.2.1758733002472;
        Wed, 24 Sep 2025 09:56:42 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8db17087bfdsm205980039f.8.2025.09.24.09.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 09:56:41 -0700 (PDT)
Date: Wed, 24 Sep 2025 11:56:40 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Danil Skrebenkov <danil.skrebenkov@cloudbear.ru>
Cc: pjw@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Charlie Jenkins <charlie@rivosinc.com>, 
	WangYuli <wangyuli@uniontech.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: cpu-hotplug fix
Message-ID: <20250924-6e273138195103ca5b7912f6@orel>
References: <20250919132849.31676-1-danil.skrebenkov@cloudbear.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250919132849.31676-1-danil.skrebenkov@cloudbear.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_095643_776550_3B6B266B 
X-CRM114-Status: GOOD (  19.86  )
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

On Fri, Sep 19, 2025 at 04:28:46PM +0300, Danil Skrebenkov wrote:
> openSBI v1.7 adds harts checks for ipi operations. Especially it
> adds comparison between hmask passed as an argument from linux
> and mask of online harts (from openSBI side). If they don't
> fit each other the error occurs.
> 
> When cpu is offline, cpu_online_mask is explicitly cleared in
> __cpu_disable. However, there is no explicit clearing of
> mm_cpumask. mm_cpumask is used for rfence operations that
> call openSBI RFENCE extension which uses ipi to remote harts.
> If hart is offline there may be error if mask of linux is not
> as mask of online harts in openSBI.
> 
> this patch adds explicit clearing of mm_cpumask for offline hart.
> 
> Signed-off-by: Danil Skrebenkov <danil.skrebenkov@cloudbear.ru>
> ---
>  arch/riscv/kernel/cpu-hotplug.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/kernel/cpu-hotplug.c b/arch/riscv/kernel/cpu-hotplug.c
> index a1e38ecfc8be..3f50d3dd76c6 100644
> --- a/arch/riscv/kernel/cpu-hotplug.c
> +++ b/arch/riscv/kernel/cpu-hotplug.c
> @@ -54,6 +54,7 @@ void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
>  
>  	pr_notice("CPU%u: off\n", cpu);
>  
> +	clear_tasks_mm_cpumask(cpu);
>  	/* Verify from the firmware if the cpu is really stopped*/
>  	if (cpu_ops->cpu_is_stopped)
>  		ret = cpu_ops->cpu_is_stopped(cpu);
> -- 
> 2.43.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
