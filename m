Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F30EC19F32
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 19:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RbAuKykk8mSK8k6GOo7HoBSME8Q3Id/ThkL5Hl7jEFc=; b=Osy+pkHUxfQUxn
	VJCd3JkKuzbRX765CXdduiv07O0N+5I6/7b6uFmVZ27g57ffIn12HbpJ/oeVbdIMCXcMZuNW2ygOz
	9vsglJXUK5y+xinp7PWvgk5SFyAji+Fupqa47Rf66JSiNGojv2WZyswlUQW0bYdchJUisGZpaiSMt
	D9wanX3wG6SsD4O3xuthGj6ygGtqUzQTbmigs/yz/kFUBV+I8K3VvtioRlTv6qGGgm0UhKR0qnAn4
	mBjPP4MaZy6wtsG6ooQ1vQAOu7lbNnVab7sVQ1nT1YvW5nL2Xi2ksKFLZaD3xsXaBgcoyuz1r/FpE
	zbym8EI1vv0ByPgTqJnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjjD-00000008Xko-3C3d;
	Thu, 27 Feb 2025 19:39:27 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tngVL-0000000824V-2vjx
	for linux-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 16:12:57 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3d2a8c2467eso3897515ab.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2025 08:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1740672774; x=1741277574; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A4a+PIYpn9cYVWDOKIU06eghAJvUip+lThQ1gAkAfoE=;
        b=nGXwv2L7wrpqW2okIBHsWRZwFtW6IIL3M598JJAy+uvHH2CbJQI8Tg1s/8C2kw3lJO
         eRx67vkA89ZtUu0EfTSVHGv/UuuYGmIqPvXhm7wl95WI0sJycD9ViB8Kma/xPRK3pP0s
         zb7R20UTmPrUJiYVChjxbrMEzBxxfy9u4NUVzk8lKzyoMr/sMIurOp1DVR2aa5k8K6Zz
         wtykWrt942thY3tAIZLgCPfocRRPPPAcHPqmtF06prCpdGg0JAjW0WbdGBpfR0jbAfmY
         UDg3dzLujCcLkNDhB1v45wealveYDeUMBKZlsRnfIyXYx0zu6qp9WB7WTAjxaBtyPCPU
         gdgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740672774; x=1741277574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A4a+PIYpn9cYVWDOKIU06eghAJvUip+lThQ1gAkAfoE=;
        b=Zm2Sicb4fyZa/ztjbpLWDWNCGYnWSCFBu+QVjb/Nfa3hNn227lDpH9os7vgaeytsHK
         PuniFnxg4hKnjXaHtpb83VOKl6rXAYDxg6ADnmPcioFWvxwDEAQHtRFlRAp6kJhMiIfv
         3OCFga8xROzoL2FP8+Z6OjUubFPtQFvaCEtDGptmlmxgjRobpaSFjEmg/2xbYK2S9KUw
         1olBu3z0KIkgsNSw9Exlm1yj85skvj6PCwlLcDoXtXzRMXqBlFfbxUmvL+vGPoDKUSgj
         qz+HLawOLPqIF2sD8KSOlyTHGKrrJdXkN5BpCyskFk/GP7fwwAVmfJbdJ4bIk/TJCtUk
         TPkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU07RJ12IdXgcJQPDZFuD9AueLnuSY4BtwAAcVQT96a38RpVIQ+11OaylmL1bcL1cXbuFupx7GKJPDOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSta23Zg2dP4Nk268SfLOm94TPeWobEAIsag1YcTueyWYe7JSn
	jLBClWCebcaFxJxxpMasbQlcBgNRGcmt+9gbNcnLl2M5ymEElPps1bX3urSamWE=
X-Gm-Gg: ASbGncuZwHomH3xURydlRYiDOsBnbD28YE9k4M0fftbFJZSDRM2CeWVyi+Cez1BWfh+
	NSPkM5tSDvLlw753AiwKC00LWcEMNA9/en4kkfRG+0E5JtnHXYk90bJ3qELr8R3PmAKMDatOsR9
	HnWrf0D1YdN56uL/oTaxKbrPqK4EeXGyfVKnmiINRay3NsruwU/rGLtbu2qrpAPiaw6bClTdOgh
	A29okItWum59GzZd//hSRKFa46fUGq534KaKF3+261UxZvpMZHdhHvmIRc4cd/9vp2vTvxvrLwH
	4H/FuK+iI/Q43T9j1A/PH/DDw4aTgzbrvf20+JaNJ8QbE8m2+FMkqRPYiCcjvuhIDw==
X-Google-Smtp-Source: AGHT+IECEOEF/3IgUpjExo3hn+o7d72t1ArCxVXIIzsvV1Vpk9+T4m/ul07rs6wpKxf4ijf45waAXQ==
X-Received: by 2002:a92:c545:0:b0:3d1:79ec:bef2 with SMTP id e9e14a558f8ab-3d2fecce699mr113973395ab.6.1740672773762;
        Thu, 27 Feb 2025 08:12:53 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d3deeca7ffsm3742305ab.53.2025.02.27.08.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 08:12:53 -0800 (PST)
Message-ID: <8fce8a9c-7946-4e3c-bbf3-25f8b4f4466f@riscstar.com>
Date: Thu, 27 Feb 2025 10:12:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] irqdomain: support three-cell scheme interrupts
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>
Cc: Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org>
 <20250227-04-gpio-irq-threecell-v1-1-4ae4d91baadc@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250227-04-gpio-irq-threecell-v1-1-4ae4d91baadc@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_081255_912956_84CD7C86 
X-CRM114-Status: GOOD (  15.65  )
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

On 2/27/25 5:24 AM, Yixun Lan wrote:
> The is a prerequisite patch to support parsing three-cell
> interrupts which encoded as <instance hwirq irqflag>,
> the translate function will always retrieve irq number and
> flag from last two cells.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>   kernel/irq/irqdomain.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> index ec6d8e72d980f604ded2bfa2143420e0e0095920..cb874ab5e54a4763d601122becd63b6d759e55d2 100644
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -1208,10 +1208,17 @@ int irq_domain_translate_twocell(struct irq_domain *d,
>   				 unsigned long *out_hwirq,
>   				 unsigned int *out_type)
>   {

This function is meant for "twocell".  There is also another function
irq_domain_translate_onecell().  Why don't you just create
irq_domain_translate_threecell" instead?

					-Alex


> +	u32 irq, type;
> +
>   	if (WARN_ON(fwspec->param_count < 2))
>   		return -EINVAL;
> -	*out_hwirq = fwspec->param[0];
> -	*out_type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
> +
> +	irq = fwspec->param_count - 2;
> +	type = fwspec->param_count - 1;
> +
> +	*out_hwirq = fwspec->param[irq];
> +	*out_type = fwspec->param[type] & IRQ_TYPE_SENSE_MASK;
> +
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(irq_domain_translate_twocell);
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
