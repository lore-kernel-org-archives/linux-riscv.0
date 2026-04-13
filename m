Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F888EBFD3B
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 10:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n5e75KF60BIRQUjAKCJFeR5p5qXGFNELgPNkTKHJcQ0=; b=Z0Bll9nkYToqGm
	zrIUGRXPbScTs3lk3fDvT1IxlUXk3HgnJKoIUc6My0qteQjhOA9/mXDbmnfmnKMgV1T/k4ELt64hY
	v9NZ+es5W20om/3RUR0AMGcJ9gha/lngCny8ugJWrWuZKZU/og1862acXMO5HgukMQE9Qzs55LEIV
	9HMm93d0g/zXr7iohB3SgrFTT4nFIMooMQx5qk0N3K2+/vCo2ievhdDTqTdovx5BKbwYmLRCUaioU
	tadtFY4ClFmjVcX6lj2SyIWP/Tt0T2BSOrol57wcqun45C7wDN+m/nBEFk/kfQzIiA/d6olsj8V+Y
	v4zZEh6XATk8MEa1fPOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCErU-0000000FVoL-2cI7;
	Mon, 13 Apr 2026 10:49:48 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCErS-0000000FVnx-0mZE
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 10:49:47 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-824c9da9928so2959335b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 03:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776077384; x=1776682184; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NprvUAprn5meoPNFX+W3YdkJtUZncCH1TUsT0ByUXfo=;
        b=BPInYQtGf8FE9F+DlpxgdRhFokb6kvMuA+EeiMJMvP6tXrTM0t6BD9CkD/QPmLnyzI
         9TYqeLbZLAqbn7Q+ldlMQHM+bPKOGVAdpZb99PwarEEQerUp//1WVgUd0utXsdobTA3E
         bjHirOXUgMtGqJklXNKXonuYUEIqlLLZUXOh4pu4/rt0PjI0790DxglURFDApIY9p5p8
         W9rw3BRS3evTZqkygy9CZV6B7Wyhg9GHG10miBMi9xN3/jKGmUJV6NSwzv3/yZbCgOU3
         EsVzSWjcMwS/idfR5GmGIQZ5cMQ7r7YLaDD1DBAQZXaZtMmDphknI9tdcXPcci3HQLgZ
         ugGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776077384; x=1776682184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NprvUAprn5meoPNFX+W3YdkJtUZncCH1TUsT0ByUXfo=;
        b=qaxU68vkNVNym5TRl1slrMq+jscZrz7RcTnMzcpXqmoXK8/WN3SRg0Dtmxy/Ox5+UJ
         ag/yO3L40qTpt4PoPoAMBy63cvQP9Eh0HgmPJ3+CgDNf3bLldsd/U7ibeWG6ZLMmkCQL
         20gZ795HzDHfJR66NVAFhGF4AoZV8VXmXNbjfCXtvji1BbZDd59K2oDnarHUsRRNW4/1
         ou4vPRzxAJZfShkYHoeLzcNz2nAGMPBVoIz3bb5Su7P2yOW3oaf0ZJwf47tHtzskMBjW
         GQanl2FVkjocg3VQf0Sd/mhehUUclLuD+gZSnsLUExNbttVQ3xCI+z+uCtUg6cLSRpHq
         uvLg==
X-Forwarded-Encrypted: i=1; AFNElJ9BFZ+h1EGdt8oLHrghnsqbghsoShjOGU1B3TZmFrMDVmuesVHDULHxT4f4lKuE1v9d7YVteRh6P7o/Tw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/skXRvxqid0oEoiFnxbviIu6NCkd6rCqDhASwNACYXkeFyrEs
	8s++ZbrLZQS7X96GW7r7Ol0Kd7rNcqQPD8W9Kl6GupRa9mKY0k8EYxEkJXK0cfp24EE=
X-Gm-Gg: AeBDiev7lEwdIrX+Hmm6YMB+f6q0wHSXoeTjZWSbNgbiTqqi7EVDqIgaCCAlxwAflhd
	PVKCXu+j4AFtfhVCZk2GuGUp+097tW9NHumiuzVPCxoYfcB7B/hiPfDOx4oRJ8CHlLb3kFbLvl3
	DWSBuM+SAj7/3sGMgc/Hh7pFqQPQZ+b743fesHH2Z6+3Kh1QVK+vYDd49F5ImR8+1Bz9lsq7KOg
	SWQMH76iad1+mk8iMrDtVVnomBIsaKvm/NECMRU3ZPVu7Q9WYsgNQI43aAJz8qLtFuj8OCvseEU
	5Zm22ZF0y2MtCuhL1gU6MQCRSlfjqQH1ipNiFKjITv0EwX8OIBQFCvKwiiRT5ZRnZE4g70b5Et1
	js7BJZYooBJTHJRY9YVN5PBPd+3xdWP07sas0JQDzmUntY1Z+wevDZZbyD2OAXYqhOHEx8593px
	Y/5ErwFGAmUHJtrfZM8mASqwOl
X-Received: by 2002:a05:6a00:398d:b0:82c:eb46:acb9 with SMTP id d2e1a72fcca58-82f0c187fa6mr13079040b3a.24.1776077383128;
        Mon, 13 Apr 2026 03:49:43 -0700 (PDT)
Received: from localhost ([122.172.81.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm12070430b3a.13.2026.04.13.03.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:49:42 -0700 (PDT)
Date: Mon, 13 Apr 2026 16:19:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] cpufreq: spacemit: Add cpufreq support for K1 SoC
Message-ID: <siqn3bu63fxp7ignbaleamvfqskhjjtuzqp64taynlvz2vtiwq@uhpitslu3xnb>
References: <20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_034946_351683_FAEB12C0 
X-CRM114-Status: GOOD (  13.78  )
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

On 10-04-26, 15:58, Shuwei Wu wrote:
> This series enables dynamic voltage and frequency scaling (DVFS) for
> the SpacemiT K1 SoC using the generic cpufreq-dt driver.
> 
> Tested on Banana Pi BPI-F3, the execution time scales as expected
> across different CPU frequencies:
> 
> ~ # echo userspace > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
> 
> ~ # echo 1600000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
> ~ # time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
> real    0m 1.07s
> user    0m 1.07s
> sys     0m 0.00s
> 
> ~ # echo 1228800 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
> ~ # time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
> real    0m 1.40s
> user    0m 1.40s
> sys     0m 0.00s
> 
> ~ # echo 1000000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
> ~ # time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
> real    0m 1.72s
> user    0m 1.72s
> sys     0m 0.00s
> 
> ~ # echo 819000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
> ~ # time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
> real    0m 2.10s
> user    0m 2.10s
> sys     0m 0.00s
> 
> ~ # echo 614400 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
> ~ # time awk 'BEGIN{for(i=0;i<1000000;i++){}}'
> real    0m 2.80s
> user    0m 2.80s
> sys     0m 0.00s
> 
> Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
> ---
> Changes in v2:
> - Move OPP tables to dedicated k1-opp.dtsi
> - Enable OPP only on BPI-F3 with cpu-supply present
> - Link to v1: https://lore.kernel.org/r/20260308-shadow-deps-v1-0-0ceb5c7c07eb@mailbox.org
> 
> ---
> Shuwei Wu (2):
>       cpufreq: dt-platdev: Add SpacemiT K1 SoC to the allowlist
>       riscv: dts: spacemit: Add cpu scaling for K1 SoC
> 
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  35 +++++++-
>  arch/riscv/boot/dts/spacemit/k1-opp.dtsi        | 105 ++++++++++++++++++++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi            |   8 ++
>  drivers/cpufreq/cpufreq-dt-platdev.c            |   1 +
>  4 files changed, 148 insertions(+), 1 deletion(-)

Feel free to take it via the arch code.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
