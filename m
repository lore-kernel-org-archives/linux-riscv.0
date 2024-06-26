Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E315DC27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 13:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uis6O1YUmsNDbiJWdtQKLs3pE9ahCfslXI1nzHJkCn0=; b=HP363Cc6uO8prj
	yqLvEcTqpKALrcJystAnhSIEqP32cZfpQ7htn+DfjoBH/93xYQTSpkj1KAa0P0xGB0vgzgnuXmrtk
	y2oRDi+1cyDRdRnbLFVAu61l0RQyQL+Q9/qihLrl52cn1gX0rUnEUTw7lWc/Aa1dHTJDipQi8nz/M
	8bz5NrSJixlaZpSXQmL+F2z918o0tD0OaxUNIbl2NW02KPY00JeteU+HCUBMK6Hzdh3Wcpnx7v5YR
	nWXM+kPyXWOv3oumrysF5ppkyWSnrrcoOKgtdXrCs//xibqAkokqdeQ9XDioBEI+goGomrqS/21wN
	9CIV8u54GPcHsq7OxLqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSjt-00000006yEo-2vv0;
	Wed, 26 Jun 2024 13:31:09 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSjp-00000006yDd-35Zd
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 13:31:07 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7955c585af0so360075385a.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 06:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719408664; x=1720013464; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=31CtUhxAl/Gr01Cj/jne/zVewsAXqFP8hO2/EQIAniM=;
        b=MNEe+COhS2ocbIJbrQytYHRhajCvfAOc4u5izAF+UoA5l3+lpAwlCgdCISPs6tiWw5
         vABtsEeM1VqTD9c7G299St2JbR0knObyNKYihVDSdfRBUVwxowvJhyfQHB3GikYKgpHM
         bgCvwanNHMD3uBHD2hgl6Yglrcq4xpVeY/6+wbALHtsUvosuUwzxBc9OMiIT6zAGRCif
         fuUi/StFofUtfXAABdZloDyQ/aZUpdqGgWS/XF7ocX2aBPKSLgQ5ymK70iExAgRXw/Hj
         B2USyghozaaZ1m4WcP7xyu96VtEAC3/JUTPfwNMXKSBpLqNDthH30qd5H0g05KBgI+6B
         bz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719408664; x=1720013464;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=31CtUhxAl/Gr01Cj/jne/zVewsAXqFP8hO2/EQIAniM=;
        b=ewjIwUGRyXVr8K7X+Daz4zygEVn4vb7VSuENt0zlRTGSBYA+dL/+V1P1abN+n0LJra
         X1DXJxqPA1IvFOFNl1pnfIKLE4lPX8FXO5ylS0QZTsFo0lY1FS/l8NpMcUBty6pW/SlE
         0VWLXQ9DBJ+OsSKe/O/n69mJpC21X+h+ReqzkFPOwhXdBtqJFc4AwxTnv8QCgZDX+fzM
         Lt584bS2VZGqkECe24QbkpTPBfIhm4yDYJrferzOYG/E01W72A4ra/8JkP8nnFxpNSPd
         f3Y4G9b1YDAw89ZliCHfmggXSwV+tImyAF8lpj9m8XvhzcaaF/RgbHv9gHN/bl6XjVVg
         +vyg==
X-Forwarded-Encrypted: i=1; AJvYcCUV6mPLvwa+Ti4ABV6fTCJcS2QK+1UTV7qWcmy4K+Lw5+2FDfE01Pz1L66pNA+khWnPza4LQlrza+l0IRFOvJEbOtX9S/D6OObTFUVf0vn6
X-Gm-Message-State: AOJu0YxRufCi5VgNQ6toMNed2K6V12tj2tzh/LzXQEQIShlyp7tZZpza
	a0Ac/+WmdAk5tYDsJaRS7H/Bn8DesUY74/QIpPn/pn/zh0oByk67cc9DFCUgCg4=
X-Google-Smtp-Source: AGHT+IFgp9Jeg188P/jxp6SHl3VB59LvoFKORF1/KDDSv5eD1wGOmlU336p5Rxs4YfGjVL1AtWV2gg==
X-Received: by 2002:a05:620a:44c2:b0:795:5440:f872 with SMTP id af79cd13be357-79be6d4fea3mr1104570685a.28.1719408664408;
        Wed, 26 Jun 2024 06:31:04 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79bce89a369sm502329085a.20.2024.06.26.06.31.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 06:31:04 -0700 (PDT)
Message-ID: <50c85e1a-c2ea-4c9f-b91b-97040665c40e@sifive.com>
Date: Wed, 26 Jun 2024 08:31:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Assorted fixes in RISC-V PMU driver
To: Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org,
 kvm-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, garthlei@pku.edu.cn
References: <20240626-misc_perf_fixes-v3-0-de3f8ed88dab@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20240626-misc_perf_fixes-v3-0-de3f8ed88dab@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_063105_829534_9BA14CD8 
X-CRM114-Status: GOOD (  22.67  )
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

Hi Atish,

On 2024-06-26 2:23 AM, Atish Patra wrote:
> This series contains 3 fixes out of which the first one is a new fix
> for invalid event data reported in lkml[2]. The last two are v3 of Samuel's
> patch[1]. I added the RB/TB/Fixes tag and moved 1 unrelated change
> to its own patch. I also changed a error message in kvm vcpu_pmu from
> pr_err to pr_debug to avoid redundant failure error messages generated
> due to the boot time quering of events implemented in the patch[1]

Thanks for picking this up! The change in patch 2 isn't quite unrelated.
pmu_sbi_check_std_events() depends on pmu_sbi_stop_all() to ensure all counters
are free at the beginning of the function. Compare v1 of the patch where the
function contains an additional call to SBI_EXT_PMU_COUNTER_STOP. With the
current patch ordering, everything works out, so it all looks good to me.

Regards,
Samuel

> Here is the original cover letter for the patch[1]
> 
> Before this patch:
> $ perf list hw
> 
> List of pre-defined events (to be used in -e or -M):
> 
>   branch-instructions OR branches                    [Hardware event]
>   branch-misses                                      [Hardware event]
>   bus-cycles                                         [Hardware event]
>   cache-misses                                       [Hardware event]
>   cache-references                                   [Hardware event]
>   cpu-cycles OR cycles                               [Hardware event]
>   instructions                                       [Hardware event]
>   ref-cycles                                         [Hardware event]
>   stalled-cycles-backend OR idle-cycles-backend      [Hardware event]
>   stalled-cycles-frontend OR idle-cycles-frontend    [Hardware event]
> 
> $ perf stat -ddd true
> 
>  Performance counter stats for 'true':
> 
>               4.36 msec task-clock                       #    0.744 CPUs utilized
>                  1      context-switches                 #  229.325 /sec
>                  0      cpu-migrations                   #    0.000 /sec
>                 38      page-faults                      #    8.714 K/sec
>          4,375,694      cycles                           #    1.003 GHz                         (60.64%)
>            728,945      instructions                     #    0.17  insn per cycle
>             79,199      branches                         #   18.162 M/sec
>             17,709      branch-misses                    #   22.36% of all branches
>            181,734      L1-dcache-loads                  #   41.676 M/sec
>              5,547      L1-dcache-load-misses            #    3.05% of all L1-dcache accesses
>      <not counted>      LLC-loads                                                               (0.00%)
>      <not counted>      LLC-load-misses                                                         (0.00%)
>      <not counted>      L1-icache-loads                                                         (0.00%)
>      <not counted>      L1-icache-load-misses                                                   (0.00%)
>      <not counted>      dTLB-loads                                                              (0.00%)
>      <not counted>      dTLB-load-misses                                                        (0.00%)
>      <not counted>      iTLB-loads                                                              (0.00%)
>      <not counted>      iTLB-load-misses                                                        (0.00%)
>      <not counted>      L1-dcache-prefetches                                                    (0.00%)
>      <not counted>      L1-dcache-prefetch-misses                                               (0.00%)
> 
>        0.005860375 seconds time elapsed
> 
>        0.000000000 seconds user
>        0.010383000 seconds sys
> 
> After this patch:
> $ perf list hw
> 
> List of pre-defined events (to be used in -e or -M):
> 
>   branch-instructions OR branches                    [Hardware event]
>   branch-misses                                      [Hardware event]
>   cache-misses                                       [Hardware event]
>   cache-references                                   [Hardware event]
>   cpu-cycles OR cycles                               [Hardware event]
>   instructions                                       [Hardware event]
> 
> $ perf stat -ddd true
> 
>  Performance counter stats for 'true':
> 
>               5.16 msec task-clock                       #    0.848 CPUs utilized
>                  1      context-switches                 #  193.817 /sec
>                  0      cpu-migrations                   #    0.000 /sec
>                 37      page-faults                      #    7.171 K/sec
>          5,183,625      cycles                           #    1.005 GHz
>            961,696      instructions                     #    0.19  insn per cycle
>             85,853      branches                         #   16.640 M/sec
>             20,462      branch-misses                    #   23.83% of all branches
>            243,545      L1-dcache-loads                  #   47.203 M/sec
>              5,974      L1-dcache-load-misses            #    2.45% of all L1-dcache accesses
>    <not supported>      LLC-loads
>    <not supported>      LLC-load-misses
>    <not supported>      L1-icache-loads
>    <not supported>      L1-icache-load-misses
>    <not supported>      dTLB-loads
>             19,619      dTLB-load-misses
>    <not supported>      iTLB-loads
>              6,831      iTLB-load-misses
>    <not supported>      L1-dcache-prefetches
>    <not supported>      L1-dcache-prefetch-misses
> 
>        0.006085625 seconds time elapsed
> 
>        0.000000000 seconds user
>        0.013022000 seconds sys
> 
> Changes in v3:
>  - Added one more fix
>  - Separated an unrelated change to its own patch.
>  - Rebase and Added RB/TB/Fixes tag.
>  - Changed a error message in kvm code to avoid unnecessary failures
>    at guest booting.
> Changes in v2:
>  - Move the event checking to a workqueue to make it asynchronous
>  - Add more details to the commit message based on the v1 discussion
> 
> [1] https://lore.kernel.org/linux-riscv/20240418014652.1143466-1-samuel.holland@sifive.com/
> [2] https://lore.kernel.org/all/CC51D53B-846C-4D81-86FC-FBF969D0A0D6@pku.edu.cn/
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
> Atish Patra (1):
>       drivers/perf: riscv: Do not update the event data if uptodate
> 
> Samuel Holland (2):
>       drivers/perf: riscv: Reset the counter to hpmevent mapping while starting cpus
>       perf: RISC-V: Check standard event availability
> 
>  arch/riscv/kvm/vcpu_pmu.c    |  2 +-
>  drivers/perf/riscv_pmu.c     |  2 +-
>  drivers/perf/riscv_pmu_sbi.c | 44 +++++++++++++++++++++++++++++++++++++++++---
>  3 files changed, 43 insertions(+), 5 deletions(-)
> ---
> base-commit: 55027e689933ba2e64f3d245fb1ff185b3e7fc81
> change-id: 20240625-misc_perf_fixes-5c57f555d828
> --
> Regards,
> Atish patra
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
