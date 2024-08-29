Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CD7C6FD35
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 07:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OaLMOXeL6wVFsQJ7kZ1EwFBXyuZ5vhMNdx5GlLngp2Q=; b=Jeuc8PiK2Rl5nx
	oxzVQREuLwTv4NEJYB4MlMW/I16gYAdODgWmbFICttOIQGUnxIhOODepwEmPS4Buhq3pRzQ4wrP/H
	fgStBhHwqx+FCJGUNs6Sb7x6y5kn82ghvSd6B5LpxVdTiqrs2Su4C7ZbCruxcFCmd/2M27n3LL5Ha
	965idyJ5sCpGIWB5dfpZFCbPLnIgU0Z/o69V9Fi9AOFkgDNsBFjWFmwOvYEUUXOcnSVVwaS8DhFsS
	aSQC+qVmUe7jmxDBD0e9v5pPmA8yadtvs2rHNqofNI/TmPJO6Q6PC8e09wxAJ5cUQtrnnDHva4iai
	+erta1myQZTJWQEJKWoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sja4I-000000013dy-2MhE;
	Thu, 29 Aug 2024 07:59:46 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sja3h-000000013Yq-0R2a
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 07:59:44 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2f50966c469so3961161fa.3
        for <linux-riscv@lists.infradead.org>; Thu, 29 Aug 2024 00:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724918347; x=1725523147; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6elqEmMP4Fqdb/aWp7gByX3m8OcBQtHxRmlqmcr7txg=;
        b=CkwUMxYq5HyapGdks12WIq1ZsfM2ROyuUZYM90c8rNCJU8v18HbHpJzCPljqrTNxd6
         yw4CAeDwvyEU5jj/CX8XE2RP3+h/vwSNSOJ+LprkU2enySISX3biiAMx6N8aCE5NNYoH
         LCTQHB1GKZd0qemKGkmaDTTPvRc4q4e8jUDCzZ46eZEGfgDCRxUiUXzWmWMWtlxxgY9R
         iiLtPkmc6wCXhFbYETb+NbGB+VK/pmglBc9x3OhgfFTDHqiOrzfVpaBBxK4Y+IoDRyvf
         TQ6JjdxPAHJl1qOFOcCeg6rt46C7O+L+5onCjpmFIx3eQtyK9iNYZaO6kMrIGDtTuTJW
         53qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724918347; x=1725523147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6elqEmMP4Fqdb/aWp7gByX3m8OcBQtHxRmlqmcr7txg=;
        b=KgeGm5NtTdMAGU5TPSQ2qpAVKdllIZCZk9N5ikRFMB+Sh/TFvgoURFEHi0wGRX5rvG
         0nIKpw19u/5jNX1AWTUitEKO0UdOy3oIGwGFQ7SDXgLA6E8PZBUUm4kvCDhlxCcirtWR
         39bxaFD359hrWeNfWlO5aW0t09kdMXDxX+78T3MYxcA/BIhtzFUMOQP5nBD6vihkw/FB
         lLNijZVgQ1LilW05DJBNdIp2ZacEOmD7jUwpFRntGhfRkEzP72SL9QoZ/HuZtzzgzH5h
         XJ2zt5Y1mKGS9X4Etjj1aVVkWnGJVpqn3rqznmHJAuhQ4D6O0flbMflylPdySWqI7tl2
         y6Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWjC0XHpwdQMcWWrqRPwgqR3in6VDPUv7e6DTyG3mpU9eAgoYYeLSUcaZ7Ev99w3k4OnSd5ZLo0DncDzg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNPhGNsQEjX2BU5vBponQrd9fwBggccNKQpztUUNtMjaMHlYsj
	hHrUFtyYFLZRCC8S2lleZlBvffqnZGzFyq1CH6pqTC0rsg6WvRx8P0csMvbsPwU=
X-Google-Smtp-Source: AGHT+IEknpoiPwNIZCUWqC5wlzEu9yh+Rxh2v4jcs1wvi/j58/8VhBs0RUuviEJZYalHd8CSAHV62w==
X-Received: by 2002:a05:651c:1990:b0:2ef:2b05:2ab3 with SMTP id 38308e7fff4ca-2f610392703mr13785621fa.10.1724918346154;
        Thu, 29 Aug 2024 00:59:06 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c7c2aesm382119a12.51.2024.08.29.00.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 00:59:05 -0700 (PDT)
Date: Thu, 29 Aug 2024 09:59:04 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Nick Hu <nick.hu@sifive.com>
Subject: Re: [PATCH 1/2] riscv: Add stimecmp save and restore
Message-ID: <20240829-fb7bda6b46302b65b2f89d20@orel>
References: <20240829033904.477200-1-nick.hu@sifive.com>
 <20240829033904.477200-2-nick.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829033904.477200-2-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_005909_173435_96446524 
X-CRM114-Status: GOOD (  21.15  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, zong.li@sifive.com, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Pavel Machek <pavel@ucw.cz>, Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Aug 29, 2024 at 11:38:59AM GMT, Nick Hu wrote:
> If the HW support the SSTC extension, we should save and restore the
> stimecmp register while cpu non retention suspend.
> 
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> ---
>  arch/riscv/include/asm/suspend.h |  4 ++++
>  arch/riscv/kernel/suspend.c      | 13 +++++++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/suspend.h b/arch/riscv/include/asm/suspend.h
> index 4ffb022b097f..ffaac2efabb5 100644
> --- a/arch/riscv/include/asm/suspend.h
> +++ b/arch/riscv/include/asm/suspend.h
> @@ -16,6 +16,10 @@ struct suspend_context {
>  	unsigned long envcfg;
>  	unsigned long tvec;
>  	unsigned long ie;
> +#if __riscv_xlen < 64
> +	unsigned long stimecmph;
> +#endif

I'm not sure the reduction in struct size is worth the #ifdeffery. If we
just always add stimecmph, then we can also change the #ifdef's below to
if's, i.e. if (__riscv_xlen < 64), which should still remove the code from
64-bit builds.

Or maybe we need something like

#if __riscv_xlen < 64
#define csrh_write(r, v) csr_write(r, v)
#else
#define csrh_write(r, v)
#endif

in asm/csr.h and then use it for all the *h csrs, but keep the #if in
the struct.

Thanks,
drew

> +	unsigned long stimecmp;
>  #ifdef CONFIG_MMU
>  	unsigned long satp;
>  #endif
> diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
> index c8cec0cc5833..3afd86e1abf7 100644
> --- a/arch/riscv/kernel/suspend.c
> +++ b/arch/riscv/kernel/suspend.c
> @@ -19,6 +19,12 @@ void suspend_save_csrs(struct suspend_context *context)
>  	context->tvec = csr_read(CSR_TVEC);
>  	context->ie = csr_read(CSR_IE);
>  
> +	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SSTC)) {
> +		context->stimecmp = csr_read(CSR_STIMECMP);
> +#if __riscv_xlen < 64
> +		context->stimecmph = csr_read(CSR_STIMECMPH);
> +#endif
> +	}
>  	/*
>  	 * No need to save/restore IP CSR (i.e. MIP or SIP) because:
>  	 *
> @@ -42,6 +48,13 @@ void suspend_restore_csrs(struct suspend_context *context)
>  	csr_write(CSR_TVEC, context->tvec);
>  	csr_write(CSR_IE, context->ie);
>  
> +	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SSTC)) {
> +		csr_write(CSR_STIMECMP, context->stimecmp);
> +#if __riscv_xlen < 64
> +		csr_write(CSR_STIMECMPH, context->stimecmph);
> +#endif
> +	}
> +
>  #ifdef CONFIG_MMU
>  	csr_write(CSR_SATP, context->satp);
>  #endif
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
