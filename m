Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28082C6FA82
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 17:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=+FEI9qxxjQhTHnkbKQh+RoM+0mVBuCb5NE62c78YlDw=; b=wEW+epj6n7YGf0M/q2SRh1uOuf
	NHtZHvIMcYpB4GnYysIGQkOQMlZMfnAbGQ6qTzlqXGnmxtrLlFhDtm+qGJnH9taKyZ6Etms7M15lu
	H+UUDWDwoBQtgIkY20fZ2Z0TSOKy1SzE+g08PTKtzUyIa6NGtbXJV8vjWyGp6GZ5vRMoNTV+0bxgz
	2ngKUAF6LRKJ/WURHM/8qo3JKDsIThS0R1tK4t/1ZCl+MSVXsoCDmzHmAE6edyIDVyY6IZERHs067
	6g1ajBMusA3xsBI1Axo4ELF9jL/Xl6Q7uysiO0sDBhc+Q8TlajQ4AmZ9NS1tWkClVpkpnzJTce0ON
	mlPtqhRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obPg1-00Gynz-Gh; Thu, 22 Sep 2022 17:07:53 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obPfy-00Gym9-Lc
	for linux-riscv@lists.infradead.org; Thu, 22 Sep 2022 17:07:52 +0000
Received: by mail-pl1-x62b.google.com with SMTP id w10so8492784pll.11
        for <linux-riscv@lists.infradead.org>; Thu, 22 Sep 2022 10:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date;
        bh=YGdLhOJeWnP3ca9LNB+W2QEKOPugBX7rmEhz4mGpjas=;
        b=wv+VgBM0Yf/zCrrpBZZ8BFKRdVmmrSTsOdXwyIoqGil5AW+Z+ijHmB/EpcHkJ2aYOF
         +KO8jsO6OL3nvjyTnNTQFnR0T0WNO3GgCf5XRM862nncqkCCfHX/BsPmH6D8BFH0OOsv
         BRYhjkNxamT6msLfsf+XasyvAGORtTe06Yb9QYNxZRI8h8jSrqZ72R9zI2dUBOIl2EVW
         pvemQLSPDqB1RUfooyJYrXckcyjkOYoPqW/bzKVroI4Clj97gecc/OSd/5X6RS+gUp5O
         eISz85U69O4HBzXhcgM47g1gbaYZm4sqtlOmVk+xCNqNAHe6fQYw7/DENLxVM3wfkN1J
         FbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
        bh=YGdLhOJeWnP3ca9LNB+W2QEKOPugBX7rmEhz4mGpjas=;
        b=S2/R4lQh/KpuaNPWsxIDQMpmlEDyhkUIzrSf7hVHQQclxN4J7YfEWH4gVcD7y6DmYU
         QeUgrLF8P5ctQkvSN2LnluhDvtIcoVtkNg60nLMlpkJmhas7siluaPGQfkLT6g/51gTh
         97DqJuy1aZ8M7oDj3N8o5cPP/b2qKbDHICvKwMW+cwvLnIxMP1o4twxnTbAyRA1XAyvW
         dTrN+xcKYa06drqu9/HXGc/xgcoXRL/D8tCTFRx/fP7ullT1hyjR1/EhQqmHy+yM+vQ8
         9qLNyzP63PlHmPl3Xk7RBXDF3MaKPCDremcW+dT9StkM50qRKYhWe1B4wtpqwRvJe9bH
         kjeA==
X-Gm-Message-State: ACrzQf1G/hBZXqGyd70/Fy9ubl3b6X8U3eVQyCYskgS05AlCTMi3nuY0
	+D9bZtB/E+rvKCugakhDFnM+wg==
X-Google-Smtp-Source: AMsMyM4vhRqEnmQ8xHzUPGKlA95Jt5MPFA9TK9QiaB9sG0UssenMQ0dpTvm3FWZ/ppTGZ50+tYcpkA==
X-Received: by 2002:a17:90a:2b0c:b0:203:b7b1:2ba2 with SMTP id x12-20020a17090a2b0c00b00203b7b12ba2mr4806032pjc.34.1663866466643;
        Thu, 22 Sep 2022 10:07:46 -0700 (PDT)
Received: from localhost (pop.92-184-98-183.mobile.abo.orange.fr. [92.184.98.183])
        by smtp.gmail.com with ESMTPSA id p63-20020a625b42000000b0053e80618a23sm4699299pfb.34.2022.09.22.10.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 10:07:46 -0700 (PDT)
Date: Thu, 22 Sep 2022 10:07:46 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Sep 2022 10:07:28 PDT (-0700)
Subject: Re: [PATCH] cpuidle: riscv-sbi: Fix CPU_PM_CPU_IDLE_ENTER_xyz() macro usage
In-Reply-To: <CAAhSdy0zGaZXoJHVAN+2n1sP4+2rsfo+G874NeBMgrhBeEW2ZA@mail.gmail.com>
CC: rafael@kernel.org, daniel.lezcano@linaro.org,
  Paul Walmsley <paul.walmsley@sifive.com>, ulf.hansson@linaro.org, atishp@atishpatra.org,
  Alistair Francis <Alistair.Francis@wdc.com>, linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, apatel@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: anup@brainfault.org
Message-ID: <mhng-0486175c-f1e8-4879-9545-2ccbbc427de9@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_100750_738545_FAD31C9B 
X-CRM114-Status: GOOD (  18.95  )
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

On Sun, 28 Aug 2022 19:59:45 PDT (-0700), anup@brainfault.org wrote:
> Hi Palmer,
>
> On Mon, Jul 18, 2022 at 2:16 PM Anup Patel <apatel@ventanamicro.com> wrote:
>>
>> Currently, we are using CPU_PM_CPU_IDLE_ENTER_PARAM() for all SBI HSM
>> suspend types so retentive suspend types are also treated non-retentive
>> and kernel will do redundant additional work for these states.
>>
>> The BIT[31] of SBI HSM suspend types allows us to differentiate between
>> retentive and non-retentive suspend types so we should use this BIT
>> to call appropriate CPU_PM_CPU_IDLE_ENTER_xyz() macro.
>>
>> Fixes: 6abf32f1d9c5 ("cpuidle: Add RISC-V SBI CPU idle driver")
>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>
> Can you please take this patch through the RISC-V tree ?

Sorry I missed this, I didn't realize you wanted me to merge it.  It's 
on fixes.

>
> Regards,
> Anup
>
>> ---
>>  drivers/cpuidle/cpuidle-riscv-sbi.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
>> index 1151e5e2ba82..33c92fec4365 100644
>> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
>> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
>> @@ -97,8 +97,13 @@ static int sbi_cpuidle_enter_state(struct cpuidle_device *dev,
>>                                    struct cpuidle_driver *drv, int idx)
>>  {
>>         u32 *states = __this_cpu_read(sbi_cpuidle_data.states);
>> +       u32 state = states[idx];
>>
>> -       return CPU_PM_CPU_IDLE_ENTER_PARAM(sbi_suspend, idx, states[idx]);
>> +       if (state & SBI_HSM_SUSP_NON_RET_BIT)
>> +               return CPU_PM_CPU_IDLE_ENTER_PARAM(sbi_suspend, idx, state);
>> +       else
>> +               return CPU_PM_CPU_IDLE_ENTER_RETENTION_PARAM(sbi_suspend,
>> +                                                            idx, state);
>>  }
>>
>>  static int __sbi_enter_domain_idle_state(struct cpuidle_device *dev,
>> --
>> 2.34.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
