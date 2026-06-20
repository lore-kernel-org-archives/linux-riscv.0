Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EEFCDB46B
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jun 2026 14:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YKnYgfybnDSLCbkHKRxnXaU+rWcWZn11L5AeDrUXHpM=; b=WBv9dZ3fWXDLfk
	J2Vx08vqoTFYaGpnWAGz8Fr/qoK+NAmX/u/xWRNTTwl2Q1Wvzn3O2VzKm4i13uFWdio/uvtOMBvBQ
	ZpDsYkqyPr5osP/14pnD6hz7Bth2ScsNAx+DwMW5bxielDtHOHQr21mYtL9ws+ByD6iH/gRE2vxt5
	PNk3LJAjMYfJSxSKSe+JYOEeP5kMGQmxxZVMN9YEK63MFzYo8TTBXZJeH9d92xvmDfkl20ILTDz8p
	fzONoYvWE8mIXr7JBsWqm8f3dx8MJwV8BzvqzIVWbgGei3T5iyznICKwwWExqGEuaiSfldA5gOXbm
	poaeR6bxTITH7FuvmDWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wawc2-00000003PIY-1GMG;
	Sat, 20 Jun 2026 14:23:58 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wawbz-00000003PI5-0C19
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jun 2026 14:23:57 +0000
Received: by mail-pg1-x544.google.com with SMTP id 41be03b00d2f7-c8857a27041so1294962a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 20 Jun 2026 07:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781965434; x=1782570234; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2ppqhiXhC3WFA2wZf37Gep+L6TyBObHMBsyL7sziZw=;
        b=hWiCiugrzG+p42vFKAPMGskypc2f0Fc8heVOtmDfDOd0yaxf1Zpu9yUDaMyJwBdARZ
         2HPTUBkRxKdKJvM2SlbR4mSNp9VWpeuhuMD8uB70Ni1+OOF/0kixlD+5/XzEt8mNplky
         Gwx/QPD9lz65tenJr6gfA+8umeE5sVuty4hoDANOC9QyqOK7VACsUVPaRnttHaY+r6mZ
         z6HThG2Fjpi0K5vxKRiI3sV3YqcoyxYSbZ28iyVgAIcgCOOEbp+7HdC/CQqR+Mff8Dq1
         iBgj1VaODlaIzuthMxKfimOyJpbirzbGPf1Cu5Z13gPMUTvqJ77yxJoyV+kpKiVZbPLU
         +iLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781965434; x=1782570234;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X2ppqhiXhC3WFA2wZf37Gep+L6TyBObHMBsyL7sziZw=;
        b=PlLQNRPwAGMjy8r84DV31GCY4HvplKIPlxnfb+hEVXJuw/bhT5DY6jHGPScSLq7dS9
         A952JQFJnwJCANl80M4BsbqmkZIZRihGmxZ9fB8l2xcFo/8kWsGZLuFaNOML8EAw2FQh
         qCpLjsles74ujW9giQUIUT7l688olfB5ia6r60h4jotZMHHTcYB7xPPaUgJs6jxFgidf
         PkHVsuUIYhZo8gtSmE0FDV6B6GjUJKiObWBpTZdE/RDMu3Qaulz2vgpziaTa9pBZslRX
         x9AYmnP4wTxyQDgkqMigkjQ7de0HnrfRVB1kiNpDr8tP2aAVnPfaxdFJr+1u6V3qalx/
         eSDw==
X-Forwarded-Encrypted: i=1; AFNElJ+Tq3zHlTmZKYuyxM1nJuEa2UuxOUfACe4QN5r5BRIBt6pDiFQshoNzoUbmKzsIRyhWQC1wMYLcP2uMRA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPjdwR3xs4C30B2EXObrdpLaLJtBCsFept8t4Y7XBRILKFIqa7
	fbCwnVdAF14JSC59ra+yP8HTRs19mgqDsC9ddEEoVjK0P/gyenI5TGwm
X-Gm-Gg: AfdE7clbs/TSzrIr8PdaafTBJNsuuKo+40VjKUrOIrUtveX1lVgYSHDk9V43z2UXGT4
	net1QjQTeoyoOOYrYb2fKxTSI9qv1zqT8lenOiHtxVNY4ppRXRiovNtX1QZ1Bn4EUnwPxQ2tZjd
	Umwv06YfW+jy0vRw9CL7Cz14bEnGZa10zFv6f+5lfAHIy4+BlrHa2zIaBSj7iX/L8n/P3kEpvUL
	uYpipAQNfVibJHUp5KiN6NlX4bujyXuQiMURcf+0Ec5+17bFseC81k6o/41K+ZNDnVxyavAkj+P
	QoiWPWXg7tuzxXCNwbLtbdMdU29qXqummQwt7+d3kY+qZZFEhBPLNOMALRAeiERFW30oXEaYdj4
	QDqz6XVUm0d4sEtbUmFfS2UuLs2SORI7TetxcTmS1nmgdGG4TkKYsQvBJfW/zIBS9D3pqJgMM58
	h9A9hrKqoyvriajhjDQhYHAwNBh2yCATwFNUTlN+nz2fQohZNQ4A60zh1p/7dTUzX9
X-Received: by 2002:a05:6a20:6a0f:b0:3b4:7c33:296b with SMTP id adf61e73a8af0-3bb3564431fmr7384251637.32.1781965433512;
        Sat, 20 Jun 2026 07:23:53 -0700 (PDT)
Received: from ?IPV6:240e:304:27f3:cf00:402d:ef5b:4082:aa65? ([240e:304:27f3:cf00:402d:ef5b:4082:aa65])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc563c406sm2556778a12.19.2026.06.20.07.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Jun 2026 07:23:52 -0700 (PDT)
Message-ID: <bae98712-2d0c-4831-8142-bb1318d147b1@gmail.com>
Date: Sat, 20 Jun 2026 22:23:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] cpufreq: spacemit: Add cpufreq support for K1 SoC
To: Shuwei Wu <shuwei.wu@mailbox.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>,
 Vincent Legoll <legoll@online.fr>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_072355_129745_D0786473 
X-CRM114-Status: GOOD (  21.09  )
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

On 6/12/2026 5:51 PM, Shuwei Wu wrote:
> This series enables CPU frequency scaling for the SpacemiT K1 SoC.
> 
> K1 has two CPU cluster clocks but one shared CPU voltage rail. Add a
> small K1-specific cpufreq driver so the two clocks and the shared OPP
> transition can be handled together.
> 
> Tested on Banana Pi BPI-F3. The system boots with all eight CPUs online,
> the K1 cpufreq driver registers one policy for CPUs 0-7, and both CPU
> cluster clocks follow the selected cpufreq rate.
> 
> ~ # cat /sys/devices/system/cpu/online
> 0-7
> 
> ~ # ls /sys/devices/system/cpu/cpufreq
> policy0
> 
> ~ # cat /sys/devices/system/cpu/cpufreq/policy0/affected_cpus
> 0 1 2 3 4 5 6 7
> 
> ~ # cat /sys/devices/system/cpu/cpufreq/policy0/scaling_available_frequencies
> 614400 819000 1000000 1228800 1600000
> 
> With the userspace governor:
> ----------------------------------------------------------------------------
> Frequency    | scaling_cur | cpu_c0_core | cpu_c1_core | Real    | User
> (kHz)        | (kHz)       | (Hz)        | (Hz)        | (s)     | (s)
> -------------+-------------+-------------+-------------+---------+----------
> 1,600,000    | 1,600,000   | 1600000000  | 1600000000  | 1.80s   | 1.80s
> 1,228,800    | 1,228,800   | 1228800000  | 1228800000  | 2.33s   | 2.33s
> 1,000,000    | 1,000,000   | 1000000000  | 1000000000  | 2.88s   | 2.87s
>    819,000    |   819,000   |  819200000  |  819200000  | 3.53s   | 3.52s
>    614,400    |   614,400   |  614400000  |  614400000  | 4.72s   | 4.72s
> ----------------------------------------------------------------------------
> 
> Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
> ---
> Changes in v3:
> - Add a K1-specific cpufreq driver for the shared-rail, dual-clock topology
> - Use one shared CPU OPP table and one cpufreq policy for all CPUs
> - Link to v2: https://lore.kernel.org/r/20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org
> 
> Changes in v2:
> - Move OPP tables to dedicated k1-opp.dtsi
> - Enable OPP only on BPI-F3 with cpu-supply present
> - Link to v1: https://lore.kernel.org/r/20260308-shadow-deps-v1-0-0ceb5c7c07eb@mailbox.org
> 
> ---
> Shuwei Wu (2):
>        cpufreq: spacemit: Add K1 cpufreq driver
>        riscv: dts: spacemit: Add cpu scaling for K1 SoC
> 
>   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  35 +++-
>   arch/riscv/boot/dts/spacemit/k1-opp.dtsi        |  70 +++++++
>   arch/riscv/boot/dts/spacemit/k1.dtsi            |   8 +
>   drivers/cpufreq/Kconfig                         |   4 +
>   drivers/cpufreq/Kconfig.riscv                   |  15 ++
>   drivers/cpufreq/Makefile                        |   3 +
>   drivers/cpufreq/cpufreq-dt-platdev.c            |   2 +
>   drivers/cpufreq/spacemit-k1-cpufreq.c           | 251 ++++++++++++++++++++++++
>   8 files changed, 387 insertions(+), 1 deletion(-)
> ---
> base-commit: 5164e95565d3fd508ca8a95351323f5716dfb695
> change-id: 20260307-shadow-deps-3582a78aa756
> prerequisite-patch-id: 154bd4f720ce5065d58b988de8f273207b44572e
> prerequisite-message-id: <20260206-spacemit-p1-v4-0-8f695d93811e@riscstar.com>
> prerequisite-patch-id: 5da3e75b18291a5540d4f66d7a0600fb8975ef62
> prerequisite-patch-id: bcf41917414ecef8cf743095d130f6004c32f6a5
> prerequisite-patch-id: cfe3800f8c791ec4c63e070af9628e88e0fc31b9
> prerequisite-message-id: <20260305-k1-clk-fix-v1-1-abca85d6e266@mailbox.org>
> prerequisite-patch-id: 7c7fb9f87dba019ece4c97c45750349a7cd28f3a
> 
> Best regards,


Hi Shuwei and Vincent,

I have tested this series on the OrangePi RV2 board (4GB) on top of
linux-next (next-20260619), with the v3 cpufreq series and Vincent's
patch "k1-orangepi-rv2: Add cpu scaling" applied.

The driver works as expected: all 8 CPUs are online and share a single
policy (policy0). Writing to
/sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
correctly changes the frequency for all cores simultaneously, and all
scaling_setspeed files show the same value. The frequency transitions
are smooth, and performance (tested with a simple awk loop, following
Vincent's approach) scales linearly with the set frequency.

Both of you can add my tag:

Tested-by: Gong Shuai <gsh517025@gmail.com> # OrangePi-RV2

If you send a new version, I'm also willing to test it again.

Thanks for the work.

Regards,
Shuai



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
