Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E166FC6FA82
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 10:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=MqLEj1V8RRrp1uf4wgpMt5l7UwgzV7qXo/eeF1aHUog=; b=mspsBLvZyEXkws
	Qq6MFxNwDyK0892tKJnBurMIuZZoFQ0ReBcL9No+Qfo3thZOMf8XrLIHnvx0BKu0fNEpHwES4oPbV
	Ii/w83C8lz4P8OIWiUEthOXvWdGoQuQnd1CXoo2ApFpn9DdGargpgour29UJt0QeFtdM8h/sPIdjw
	OMACRANlY5Z0hBC5YEnrjnk7SHJ3Wa1FmQMYRSVhuOpDTuo4Ko1xYIK7sIXmojGxpHv4OO22SEKfY
	s/B7/HiOpdSRIZpCZV0bo2LPjuVK9GoJoZ+ruaLE3ndorjGBGCgh8yQsA6wGTzaxU+t0YDotYtOLw
	Oo3QqTEhPTCNkk+0oe9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obgLW-003mzN-Pl; Fri, 23 Sep 2022 10:55:50 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obgLU-003mxb-01
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 10:55:49 +0000
Received: by mail-pf1-x42d.google.com with SMTP id c198so12019846pfc.13
        for <linux-riscv@lists.infradead.org>; Fri, 23 Sep 2022 03:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc:subject
         :date;
        bh=/40D11sTGBqxQ3T0htyIxT/7MS1k2znQcbc1Zb17/k8=;
        b=4eax6Pge2DmiLZRQm4qb2nBq2xkb5JBoeP+DlilNmuEHsvidQGWYX31O54gDnnv7ox
         hr3tk6dgHG3YHW3gl8hr4K9BarDzq7NfS+0ZngZu+MXPIi25ZKUffWJZoIJA3PcILe95
         LCnV8uuzOVRUUZxj2ixnurBOS+zbqBv1DP8v+WkAUfU9pFYHSvna9NHgWBeCx1ot3piY
         kmszE132EtS3yKkYx+LNqVynN95uLZInSn5bVNL4jxyrripICl5x6Gfp4pG51aUzUQjs
         oLISfVuoffDl/otgefCQtLSz8ecrLNhWu1aE57sYSY1IDqsj1uiGJwgTdvfi98IXMZik
         kAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=/40D11sTGBqxQ3T0htyIxT/7MS1k2znQcbc1Zb17/k8=;
        b=wza1dddWwhJ10vVNlCwLoNWPPVhRYdqYwt9uiRXVIZG4wuQtFGc/xoIX1b7MtExnIp
         /YyHojU/gSELzNOVXMZh/D8ve/eas+3zXiZj8aihUiatrIFskoxBRIB/Y8vbF89CxHi1
         bihQFROTiCWaZRUiKV/xiNsobEheGNjt8tKXt+d94r28/vn/JwufJA2go/B3C4rvywpx
         efpeJr1UG2SpsOhqC+Aiwondwixc3xoqc2dkIFDoSqV8w9nb6erARSVoXv/1MxvrVqEq
         hkSXs25VRAVjTsijdR+rb7YDagFd61yxAJVs74FBXv6MfX1MZOYr2ficbPnPUzjNDhor
         zwqQ==
X-Gm-Message-State: ACrzQf1Gndq22lr+E0i9XApc4ABP1OCT7wekTmR4oHdV+PQDcBMiCx9Z
	t2dYOUH8yus+cyY+L8v9bKp0bA==
X-Google-Smtp-Source: AMsMyM7PM5wJVtceDG9+BjpWnprgj6MOFDNhea+dtARa3SREXRJzN8TjqThK1p7LVSp0DpcKYR/oXg==
X-Received: by 2002:a05:6a00:27a1:b0:548:ea2e:885c with SMTP id bd33-20020a056a0027a100b00548ea2e885cmr8786790pfb.55.1663930546039;
        Fri, 23 Sep 2022 03:55:46 -0700 (PDT)
Received: from localhost ([88.128.88.52])
        by smtp.gmail.com with ESMTPSA id o5-20020a170902d4c500b00176b66954a6sm5747934plg.121.2022.09.23.03.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 03:55:45 -0700 (PDT)
Date: Fri, 23 Sep 2022 03:55:45 -0700 (PDT)
X-Google-Original-Date: Fri, 23 Sep 2022 03:55:41 PDT (-0700)
Subject: Re: [PATCH] cpuidle: riscv-sbi: Fix CPU_PM_CPU_IDLE_ENTER_xyz() macro usage
In-Reply-To: <mhng-0486175c-f1e8-4879-9545-2ccbbc427de9@palmer-ri-x1c9>
CC: rafael@kernel.org, daniel.lezcano@linaro.org,
  Paul Walmsley <paul.walmsley@sifive.com>, ulf.hansson@linaro.org, atishp@atishpatra.org,
  Alistair Francis <Alistair.Francis@wdc.com>, linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, apatel@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: anup@brainfault.org
Message-ID: <mhng-3a58df40-d19a-41ee-8b51-bbde9ba8d00c@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_035548_057933_87D21166 
X-CRM114-Status: GOOD (  16.95  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 22 Sep 2022 10:07:46 PDT (-0700), Palmer Dabbelt wrote:
> On Sun, 28 Aug 2022 19:59:45 PDT (-0700), anup@brainfault.org wrote:
>> Hi Palmer,
>>
>> On Mon, Jul 18, 2022 at 2:16 PM Anup Patel <apatel@ventanamicro.com> wrote:
>>>
>>> Currently, we are using CPU_PM_CPU_IDLE_ENTER_PARAM() for all SBI HSM
>>> suspend types so retentive suspend types are also treated non-retentive
>>> and kernel will do redundant additional work for these states.
>>>
>>> The BIT[31] of SBI HSM suspend types allows us to differentiate between
>>> retentive and non-retentive suspend types so we should use this BIT
>>> to call appropriate CPU_PM_CPU_IDLE_ENTER_xyz() macro.
>>>
>>> Fixes: 6abf32f1d9c5 ("cpuidle: Add RISC-V SBI CPU idle driver")
>>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>>
>> Can you please take this patch through the RISC-V tree ?
>
> Sorry I missed this, I didn't realize you wanted me to merge it.  It's
> on fixes.

Actually from reading this again, it's not really a fix: the kernel is 
correct without this change, it's just going to save/restore when it 
doesn't need to.  So I'm queuing this into for-next instead.

>
>>
>> Regards,
>> Anup
>>
>>> ---
>>>  drivers/cpuidle/cpuidle-riscv-sbi.c | 7 ++++++-
>>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
>>> index 1151e5e2ba82..33c92fec4365 100644
>>> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
>>> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
>>> @@ -97,8 +97,13 @@ static int sbi_cpuidle_enter_state(struct cpuidle_device *dev,
>>>                                    struct cpuidle_driver *drv, int idx)
>>>  {
>>>         u32 *states = __this_cpu_read(sbi_cpuidle_data.states);
>>> +       u32 state = states[idx];
>>>
>>> -       return CPU_PM_CPU_IDLE_ENTER_PARAM(sbi_suspend, idx, states[idx]);
>>> +       if (state & SBI_HSM_SUSP_NON_RET_BIT)
>>> +               return CPU_PM_CPU_IDLE_ENTER_PARAM(sbi_suspend, idx, state);
>>> +       else
>>> +               return CPU_PM_CPU_IDLE_ENTER_RETENTION_PARAM(sbi_suspend,
>>> +                                                            idx, state);
>>>  }
>>>
>>>  static int __sbi_enter_domain_idle_state(struct cpuidle_device *dev,
>>> --
>>> 2.34.1
>>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
