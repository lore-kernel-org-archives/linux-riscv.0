Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F897CD13CF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 03:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/MGOkWR1x5JKhzG0D5wRRU6kRnWAEVJAFQMXsU6IzD4=; b=uOsQBWGtY41XK0
	FyQwmObCeISGoDHnRyqNCWLT+KJ7tDribcRIj1gNtyLqXm6STVqWk+MXSoBLHqo+jLiF6MLUwXFIB
	j5klQh+be0DHGOg8G+Flz0/6DdYvU/I8/2d7b7y13oL1UHH1fni5i/VM0AH/uRKWetnBlWbKN4y5F
	MCQiza96Y4pPTwO0N4dkJBI00Yz6nTETfsDt9lUD7Yya+LdqayJfNmm1FIewLLfTN53JFzMGIUxfK
	NwI4hA1Zhpdbpo7PMHXgiPHLfgwaheqhCWm7h5vIgTNjiyKH3kkwA7cMPoAtWA2XvbjUEQlM0ZPT9
	q2h7WA7zLgmVeti5R1rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi51P-00EIe6-0y;
	Mon, 18 Sep 2023 03:34:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi51M-00EIcP-0p
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 03:34:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695008032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gHzH+a1yYhJkfNUv/Dy9j8VaViRqaOEkd87Y+pYRKHg=;
	b=de7SCyqEm0AjEBTEDKJDehgm0YwkxrQDfblTnYgFz82/p5ryAjMxTZ+1KPEHqQmlo/fl4r
	mri8PlOY10mmj6/ZSckyVg9M34dSIUc/Z61n5zu4cTO5MdF6ylYwz6xtHNsG7W1xq3c9Yx
	ljALUwG7mXM7I9Jk0cNREv1TirHUJJI=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-RLs6nSXcN-CNTgLopODQ5Q-1; Sun, 17 Sep 2023 23:33:48 -0400
X-MC-Unique: RLs6nSXcN-CNTgLopODQ5Q-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-274c8d0771aso1289523a91.3
        for <linux-riscv@lists.infradead.org>; Sun, 17 Sep 2023 20:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695008027; x=1695612827;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gHzH+a1yYhJkfNUv/Dy9j8VaViRqaOEkd87Y+pYRKHg=;
        b=Wp+3QLFBDbiXI0gmawsb/xK3jK6tFray1O1smom7WMJcjreyUe485pabI03+f3jhgb
         AILB34SNnPUywzLDDZVv037qp87l4TnElPBTuD1weHE9SqKET/vN0LlW24VN6JtQgpUC
         kG7tNa8p5CkCOHVB5/7/0lq8mvKedAq2xOQdwDRFx8KonqetaTJWcj4HPq2WAbRvbGSD
         PMlSAMddf93NbCZ5MiVQEGdBNamFtJpXam/Fm/beUfCi+Iu4d+FBYIA5gDYNMbOXzdnJ
         8iKP96CpdVreX2eRwUUFCLblZu6CQULQ9m8Nt0XYOLpsA4rQxdiHG2hQb7KxWVG5qq4F
         +9zg==
X-Gm-Message-State: AOJu0YwHA72Mk+DIM+vkobGEkSlZ/Pt0EdmdxOxTOFOdeoVUsNk+VyHA
	DmDsQzkZrQC/fVBojdxPpyAfeDMnG2ZfU6kdhXvhc7vR9GMikf7Y3XUJgQW0DBR6JIw5V1l2cFz
	kf9NYbyXir/rCBjasXkV0bN636xAX
X-Received: by 2002:a17:90b:890:b0:274:7de7:d6fa with SMTP id bj16-20020a17090b089000b002747de7d6famr7131230pjb.9.1695008027065;
        Sun, 17 Sep 2023 20:33:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdFVHnxmGek3zqSMDKaRzCcHQAQEv2cIpV7L2yNs7LNSqm4GiEBUNxLVrj5jEdjCAv9J4IOA==
X-Received: by 2002:a17:90b:890:b0:274:7de7:d6fa with SMTP id bj16-20020a17090b089000b002747de7d6famr7131213pjb.9.1695008026727;
        Sun, 17 Sep 2023 20:33:46 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a004800b0026b420ae167sm8825822pjb.17.2023.09.17.20.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 20:33:45 -0700 (PDT)
Message-ID: <2c23ab17-7516-e310-8b79-b8c5fc02984a@redhat.com>
Date: Mon, 18 Sep 2023 13:33:37 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v2 05/35] drivers: base: Print a warning instead of
 panic() when register_cpu() fails
To: James Morse <james.morse@arm.com>, linux-pm@vger.kernel.org,
 loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 kvmarm@lists.linux.dev
Cc: x86@kernel.org, Salil Mehta <salil.mehta@huawei.com>,
 Russell King <linux@armlinux.org.uk>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-6-james.morse@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230913163823.7880-6-james.morse@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_203400_380525_8C7EF9B6 
X-CRM114-Status: GOOD (  21.57  )
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



On 9/14/23 02:37, James Morse wrote:
> loongarch, mips, parisc, riscv and sh all print a warning if
> register_cpu() returns an error. Architectures that use
> GENERIC_CPU_DEVICES call panic() instead.
> 
> Errors in this path indicate something is wrong with the firmware
> description of the platform, but the kernel is able to keep running.
> 
> Downgrade this to a warning to make it easier to debug this issue.
> 
> This will allow architectures that switching over to GENERIC_CPU_DEVICES
> to drop their warning, but keep the existing behaviour.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>   drivers/base/cpu.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
> index 579064fda97b..d31c936f0955 100644
> --- a/drivers/base/cpu.c
> +++ b/drivers/base/cpu.c
> @@ -535,14 +535,15 @@ int __weak arch_register_cpu(int cpu)
>   
>   static void __init cpu_dev_register_generic(void)
>   {
> -	int i;
> +	int i, ret;
>   
>   	if (!IS_ENABLED(CONFIG_GENERIC_CPU_DEVICES))
>   		return;
>   
>   	for_each_present_cpu(i) {
> -		if (arch_register_cpu(i))
> -			panic("Failed to register CPU device");
> +		ret = arch_register_cpu(i);
> +		if (ret)
> +			pr_warn("register_cpu %d failed (%d)\n", i, ret);
>   	}
>   }
>   

The same warning message has been printed by arch/loongarch/kernel/topology.c::arch_register_cpu().
In order to avoid the duplication, I think the warning message in arch/loongarch needs to be dropped?

Thanks,
Gavin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
