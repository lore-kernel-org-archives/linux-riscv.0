Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156BBC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 10:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ilovkn46gVVxq9uAPVia8FWyCXRTZiPlYf1VVizffio=; b=NcteCxH3H4c7s/
	8nb+HYxfZ46nJwKLIwBeBCJLIHzLeZgMRIyafBVK6bYh/XbKxJ2ecmNDiIJFD1TG15v/A9nOXWOj4
	3otPYqu7ADbdXwQCJZL9zd4HJpX2F6XTi4EA/OoUTPRxbqkU9XjA+fu9Xcr8wZWDsn7uJzVYyk7Be
	asfVWiITVPBojJN81NP4kYSwWn116nQRpSmqGjszlsax/uN8UZFZUIHMlncr6wVDASxnLG1AA0CGJ
	K+/g604JP/qI2iBMXbhdr8I1ULuAfVl9QCfJF63lhyz5b/YK6+pR+LhdJDOd8W4Sergogsk44en0y
	L5CmFO63fe1zbYMbX/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r122i-005tRw-06;
	Thu, 09 Nov 2023 10:13:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r122e-005tPC-01
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 10:13:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699524819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3rYhpoB4lYmS4MLIzZUo4ZMf6R8bUZVPeYV6RdLZieo=;
	b=Fc9VgENEm2PmhajBqiD0Bt6akMJUrQf1W7VLT/FaQ2jffXs7/DpjVkYMiXfSeTSlZsUIpD
	XOa9icpjTB9LBy9OznyZG270mCoQnl3xVDwvdPu91coidzV/RW+RXB6vn1cSlu2DBIsRz2
	cC5DVn5IKgsfsh8erOnphvYnwKZlQ3Y=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-WMWPX-uhMG-aIetnYFUSMA-1; Thu, 09 Nov 2023 05:13:37 -0500
X-MC-Unique: WMWPX-uhMG-aIetnYFUSMA-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2800fffc08eso192790a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 02:13:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699524814; x=1700129614;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3rYhpoB4lYmS4MLIzZUo4ZMf6R8bUZVPeYV6RdLZieo=;
        b=tsDRrXjegjWI31ZAFCU3Dj+96auNLgGUs25J6mvKN6Kp4zNM9DkA23lAh/yaDUAAcI
         QSwv/YHTf+EAEIJr4vCwqkHJZVwnJIIdF/JJ98kTBAt9xCK7HtIRYdku1+wvYQamzyYT
         sTSQw2DWRcT6Tqu8rNEBxCmDdd4g5ANn77P90mJRohmeRjbWPjFGtpc8gRuax4r4+P+T
         qYT021VLtQcRTh0buiKrXUdSHZL4i7L8zXmzo2HWUMX7tOTHqpzbPwip1PhSIGb1zLDl
         JLNiVOdN8JnS+fWPtdw698lJwy7lewv+NFu/O+bChZUAFpmSfEBry1jtS2xoWW3givem
         mVfw==
X-Gm-Message-State: AOJu0YwP3Vmg+K8ZI+1xbFNuMsKr3gK4DbRBVjlFx5UQN8bx0i5o/TRD
	ww1yFGmmMvE/jffGWur9lHEzR0Smg1pRCO0PGHuBqiJaiRoIKCgv9wn5xRlCC7bHorDTDVa4K1a
	4RaziZ8Bt2O0jjXd68XvE87uTXnNe
X-Received: by 2002:a17:903:120e:b0:1cc:ebe:5547 with SMTP id l14-20020a170903120e00b001cc0ebe5547mr5043345plh.0.1699524813754;
        Thu, 09 Nov 2023 02:13:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMYccyPUYXdRLbiWAt/Rrr2lff8DkVfjHrlmnPr9rVOEThxcSXfzeRdAMTZ0+vEY8CCgW5xw==
X-Received: by 2002:a17:903:120e:b0:1cc:ebe:5547 with SMTP id l14-20020a170903120e00b001cc0ebe5547mr5043330plh.0.1699524813447;
        Thu, 09 Nov 2023 02:13:33 -0800 (PST)
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id p2-20020a170902e74200b001c60a2b5c61sm3165370plf.134.2023.11.09.02.13.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 02:13:33 -0800 (PST)
Message-ID: <6341a77d-ba42-3f3a-4a2a-b598fb5c0e20@redhat.com>
Date: Thu, 9 Nov 2023 18:13:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH RFC 07/22] drivers: base: Allow parts of
 GENERIC_CPU_DEVICES to be overridden
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org,
 linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com, James Morse <james.morse@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JLG-00CTx8-CG@rmk-PC.armlinux.org.uk>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <E1r0JLG-00CTx8-CG@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_021340_116838_22D7654A 
X-CRM114-Status: GOOD (  21.43  )
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



On 11/7/23 18:29, Russell King (Oracle) wrote:
> From: James Morse <james.morse@arm.com>
> 
> Architectures often have extra per-cpu work that needs doing
> before a CPU is registered, often to determine if a CPU is
> hotpluggable.
> 
> To allow the ACPI architectures to use GENERIC_CPU_DEVICES, move
> the cpu_register() call into arch_register_cpu(), which is made __weak
> so architectures with extra work can override it.
> This aligns with the way x86, ia64 and loongarch register hotplug CPUs
> when they become present.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
> Changes since RFC:
>   * Dropped __init from x86/ia64 arch_register_cpu()
> Changes since RFC v2:
>   * Dropped unnecessary Loongarch asm/cpu.h changes
> ---
>   drivers/base/cpu.c  | 14 ++++++++++----
>   include/linux/cpu.h |  4 ++++
>   2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
> index 34b48f660b6b..579064fda97b 100644
> --- a/drivers/base/cpu.c
> +++ b/drivers/base/cpu.c
> @@ -525,19 +525,25 @@ bool cpu_is_hotpluggable(unsigned int cpu)
>   EXPORT_SYMBOL_GPL(cpu_is_hotpluggable);
>   
>   #ifdef CONFIG_GENERIC_CPU_DEVICES
> -static DEFINE_PER_CPU(struct cpu, cpu_devices);
> +DEFINE_PER_CPU(struct cpu, cpu_devices);
> +
> +int __weak arch_register_cpu(int cpu)
> +{
> +	return register_cpu(&per_cpu(cpu_devices, cpu), cpu);
> +}
>   #endif
>   
>   static void __init cpu_dev_register_generic(void)
>   {
> -#ifdef CONFIG_GENERIC_CPU_DEVICES
>   	int i;
>   
> +	if (!IS_ENABLED(CONFIG_GENERIC_CPU_DEVICES))
> +		return;
> +
>   	for_each_present_cpu(i) {
> -		if (register_cpu(&per_cpu(cpu_devices, i), i))
> +		if (arch_register_cpu(i))
>   			panic("Failed to register CPU device");
>   	}
> -#endif
>   }
>   
>   #ifdef CONFIG_GENERIC_CPU_VULNERABILITIES
> diff --git a/include/linux/cpu.h b/include/linux/cpu.h
> index fc8094419084..1e982d63eae8 100644
> --- a/include/linux/cpu.h
> +++ b/include/linux/cpu.h
> @@ -88,6 +88,10 @@ extern ssize_t arch_cpu_probe(const char *, size_t);
>   extern ssize_t arch_cpu_release(const char *, size_t);
>   #endif
>   
> +#ifdef CONFIG_GENERIC_CPU_DEVICES
> +DECLARE_PER_CPU(struct cpu, cpu_devices);
> +#endif
> +
>   /*
>    * These states are not related to the core CPU hotplug mechanism. They are
>    * used by various (sub)architectures to track internal state

-- 
Shaoqin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
