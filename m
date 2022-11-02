Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBF8C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 09:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dEdjsOOKXbED6g8ZaThsJ8NKZUy8EKu6IOQnRyQoW+o=; b=MB6tYYwb1fSTJp
	PDc7S0mEsAxOzmS4PK0X82P03XDNPzDgbAyELzY9gIdrLgixLPq7aaFzXEo4m5wejHUm1UljubW7O
	hnf1tIvwagZAIkYhrBusXVIBwi9h4gvOiYJUtLtMqOTqy3paZ33W2/wt2c38LYW2mXXlW8HwYAY1y
	l44dMR6q3nutSQRdiLUGUfwKuGMeJX9xhjisosoMvLgjbyFSkYEubUkKilx9t0kIDw7TsFGPz7G0c
	DIyXum1hVaeqdVrVu2FoSMMTIbeAkd4oikFuZdQWAXXP39JGaT9gw/H5ZxfLY9RDWDCcpa/OE1BrG
	+lao4WlJhOkG8A7rjVxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq9dK-009Lbj-4k; Wed, 02 Nov 2022 09:02:02 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq9dG-009LVI-OS
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 09:02:00 +0000
Received: by mail-pf1-x42c.google.com with SMTP id b29so15791141pfp.13
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 02:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w7Zdgirtqci69Swtp5BTZmwtPa1KkHmxW1ALdvVO1eA=;
        b=axpjrmZwJoHqm006PdecGiKFxCVrDtI7fmM+51qQj5/T8wCSt9eLlIOuHkYqtu8uHX
         FEIppYhPZ/F7JWjwBYb22b844jLJgqYJ9fR2AhR9yDVrRXpfyvi+o8nx9PS+wbpGb94z
         5g9U6rL4KdRNHXwtLqWGSv7c+nSF5RltTj6cE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w7Zdgirtqci69Swtp5BTZmwtPa1KkHmxW1ALdvVO1eA=;
        b=umapep/zuelXnXpTLKnII64hXl1xHIk5TN/CZDmF/bV4evHUt69B6SIAF/P0YdAE5n
         SUEYCwwW5FMV3vipRviQen2PtyVQfcFhM3xIq9qlKO8sgCHV2LsonVySCMBP2pvTHmuP
         dRZZkP9m1srhvbijCiskeSohIAeHPgTHA8g17S3xPbAdwoMki8zQQLKlrtCYcM1wDVMy
         uDZfPedJFQ8NLsuC12FQypNHMk4GQb8wJJ9esRDB+YoZnzBxUQ8tiMcY8ztBi6fmWZgj
         eEi6xO1Mw698NAG7+HBfTcrYvbRL4Q8Bjut684nKHQq/SM7at4tRSdN4JI12jD74XYlL
         7Sfg==
X-Gm-Message-State: ACrzQf0o1MtQLgpGOgOSrk3diASLjXJM+0+ODymCx52RScGyR6f5M8cV
	Ub5SHSzOfPMvDlX27X6/tQOltA==
X-Google-Smtp-Source: AMsMyM6vJRkcQJOubMUTLQ3rPRqmAmsqzmIotexq3LlKl74q6mKvTOwCSRfnQPDG7o68l2G984cvVg==
X-Received: by 2002:a63:450c:0:b0:443:94a1:3703 with SMTP id s12-20020a63450c000000b0044394a13703mr20116187pga.565.1667379714982;
        Wed, 02 Nov 2022 02:01:54 -0700 (PDT)
Received: from [192.168.0.168] ([103.99.10.63])
        by smtp.gmail.com with ESMTPSA id d62-20020a623641000000b005627ddbc7a4sm7944965pfa.191.2022.11.02.02.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 02:01:54 -0700 (PDT)
Message-ID: <d2567709-9ce8-a49c-b073-a7d35fd2ec8f@linuxfoundation.org>
Date: Wed, 2 Nov 2022 03:01:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] selftests/vDSO: Add riscv getcpu & gettimeofday test
To: guoren@kernel.org, arnd@arndb.de, shuah@kernel.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
 "haocheng . zy" <haocheng.zy@linux.alibaba.com>,
 Mao Han <han_mao@linux.alibaba.com>, Guo Ren <guoren@linux.alibaba.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Elliott Hughes <enh@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20221102081531.882149-1-guoren@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20221102081531.882149-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_020158_838707_17147943 
X-CRM114-Status: GOOD (  15.33  )
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

On 11/2/22 02:15, guoren@kernel.org wrote:
> From: Guo Ren <guoren@kernel.org>
> 
> Enable vDSO getcpu & gettimeofday test for riscv. But only riscv64
> supports __vdso_gettimeofday and riscv32 is under development.
> 
> VERSION
> {
>          LINUX_4.15 {
>          global:
>                  __vdso_rt_sigreturn;
>                  __vdso_gettimeofday;
>                  __vdso_clock_gettime;
>                  __vdso_clock_getres;
>                  __vdso_getcpu;
>                  __vdso_flush_icache;
>          local: *;
>          };
> }
> 
> Co-developed-by: haocheng.zy <haocheng.zy@linux.alibaba.com>
> Signed-off-by: haocheng.zy <haocheng.zy@linux.alibaba.com>
> Suggested-by: Mao Han <han_mao@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Elliott Hughes <enh@google.com>
> ---
>   tools/testing/selftests/vDSO/vdso_test_getcpu.c       | 5 +++++
>   tools/testing/selftests/vDSO/vdso_test_gettimeofday.c | 3 +++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/tools/testing/selftests/vDSO/vdso_test_getcpu.c b/tools/testing/selftests/vDSO/vdso_test_getcpu.c
> index fc25ede131b8..1e474f406a87 100644
> --- a/tools/testing/selftests/vDSO/vdso_test_getcpu.c
> +++ b/tools/testing/selftests/vDSO/vdso_test_getcpu.c
> @@ -14,8 +14,13 @@
>   #include "../kselftest.h"
>   #include "parse_vdso.h"
>   
> +#if defined(__riscv)
> +const char *version = "LINUX_4.15";
> +const char *name = "__vdso_getcpu";> +#else
>   const char *version = "LINUX_2.6";
>   const char *name = "__vdso_getcpu";
> +#endif

name is same in both cases. Move it out of ifdef.

>   
>   struct getcpu_cache;
>   typedef long (*getcpu_t)(unsigned int *, unsigned int *,
> diff --git a/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c b/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c
> index 8ccc73ed8240..e411f287a426 100644
> --- a/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c
> +++ b/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c
> @@ -27,6 +27,9 @@
>   #if defined(__aarch64__)
>   const char *version = "LINUX_2.6.39";
>   const char *name = "__kernel_gettimeofday";
> +#elif defined(__riscv)
> +const char *version = "LINUX_4.15";
> +const char *name = "__vdso_gettimeofday";
>   #else
>   const char *version = "LINUX_2.6";
>   const char *name = "__vdso_gettimeofday";

Rest looks fine.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
