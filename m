Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8ADCCA479
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 05:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=40uDb5mTCaLBiLfLkXwbpYxjWUvby4idrzUFIgALmwc=; b=CtQ0kfgh0V/D+Oy1p97a0jmQGT
	nVzhbw5jpdghLzAwt25ERM/yuBe33Z36I0leE3kDB1BwkAFLIcDBolAKY/rve8ORVOY/26zTlWSr/
	Ki3cqcPr8uONbsa1sWkItoO9w+er/ksUcEkJHmz14Vpg9sNRIwqdkEEgjD1OqrfnfOA6Ns/v62n/w
	cWl356gKfjQ6Ok8AiQz93OX12R6Sv69ZLeXVCc6vQjo3d+ENYlh5QLdXYNEJt6Jyl+NLZt4JtNH2q
	6WZ4w/9YkWQ2QhQN0/c8XJR4Vh3gpRjiCPtpLsCkT+CO3K691PItYL/JjhNJWOMfSvjvtkfonW6n1
	e98TJrHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwdpp-001Zmw-VD; Thu, 02 Jun 2022 05:57:29 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwdpm-001ZkC-Fw
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 05:57:27 +0000
Received: by mail-pl1-x633.google.com with SMTP id n8so3687150plh.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jun 2022 22:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=rtSAfXv93YAiiHV0sWw5VQFhHGbge7rpQR/Jq2+le+A=;
        b=L3dN8bpTjYGHxIQGNCFp5vkGe6DEd129vWFFNvXkztPl9NA0+UQP7DC4bxloOfDaEs
         SLXTD8ZHKa1i+tq1gBO22B+gtFmwcSC5dbBo6Jnaomdl1vP2Xhsn4xaMXdkRTypkVgTW
         5DpqbNJQGJF69YXACNKNOY3Skk0wPRPb5z+reiVbRTdSsW+vAlhfOTOlZMqGLOn5/JiG
         m3ql81nKrnkbCW2HdftG8QtMoGiCRRipXulgSb7VRv5rIIv/0eOrn/772S20pjFBlv8T
         oyHYOf1gJkOOuGUb4OAEbdudYkLCm1DonOLicWQ5mVflW79+XN8uyCXqqO4CftN8vlDZ
         NckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=rtSAfXv93YAiiHV0sWw5VQFhHGbge7rpQR/Jq2+le+A=;
        b=pDg584zbc9X+i3c90/frP6Xmuao1nbawTDMiKs13pnS8dP/O/Pi1XX7qhILQF5b02y
         e2BAc2UscVx8EOrjU35ypYc1lxyWjD3/5Fm3zqCClLbmvytWmHTA27LQJ9n31fkkJy0y
         3sBsPiD1hd1aL+2JPLFvaBPl7ZFvIFzRPgvC45evmrEhapkzjNGSiUWRicniXLRqzIYQ
         x8FzlKyc1/fJ9iXl6pXlMsdZhR4S3OmsCSQd740BOIQO6lTfATZUgIweg4TrKnNbyPOL
         Y8y9cEow+t3bRJZl56Cirh+39YlA097TzHE9pJVZo8Z3xj6pXqMCXpM8ooc+ll7hMTPT
         2BNA==
X-Gm-Message-State: AOAM5306uURvZQPEULJW3GnU6NNR7EyRIfEL+/Lp+n9861132eesc251
	GsmwlWa8ocKxrr8AU53/kayTWA==
X-Google-Smtp-Source: ABdhPJwjQZkpLbffvjZwQnZtMS49tNZbp/lMIOvZYRNMfACTTu7YqLJJJxS4yqNvV1+hh8zoEqPg7A==
X-Received: by 2002:a17:90b:4b0c:b0:1e0:96b:c3fe with SMTP id lx12-20020a17090b4b0c00b001e0096bc3femr38350620pjb.212.1654149443517;
        Wed, 01 Jun 2022 22:57:23 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id h69-20020a628348000000b0050dc7628138sm2619315pfe.18.2022.06.01.22.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 22:57:22 -0700 (PDT)
Date: Wed, 01 Jun 2022 22:57:22 -0700 (PDT)
X-Google-Original-Date: Wed, 01 Jun 2022 22:09:03 PDT (-0700)
Subject: Re: [PATCH v3] RISC-V: Mark IORESOURCE_EXCLUSIVE for reserved mem instead of IORESOURCE_BUSY
In-Reply-To: <CAJF2gTRZCchLk9apNQagNmsNb3Pv+WfPTisrsWDDrQyVncUYeA@mail.gmail.com>
CC: mick@ics.forth.gr, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, anup@brainfault.org, akpm@linux-foundation.org, wangkefeng.wang@huawei.com,
  rppt@kernel.org, david@redhat.com, wangborong@cdjrlc.com, twd2.me@gmail.com, seanjc@google.com,
  alex@ghiti.fr, petr.pavlu@suse.com, Atish Patra <atishp@rivosinc.com>,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, jianghuaming.jhm@alibaba-inc.com,
  heiko@sntech.de, xianting.tian@linux.alibaba.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: guoren@kernel.org
Message-ID: <mhng-d1f0bf41-82a3-4e76-98a0-c787ebcd0799@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_225726_570470_B8592B0B 
X-CRM114-Status: GOOD (  22.87  )
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

On Sun, 29 May 2022 19:47:51 PDT (-0700), guoren@kernel.org wrote:
> Hi Palmer,
>
> Please have a look at this patch which is a critical fixup. Our
> current riscv implementation has broken the reserved memory.

Putting "fix" somewhere in the subject is generally the best way to do 
that, this one just looked like a feature and I stumbled into it when 
going through stuff for this merge window.

It's in for-next, which is still aimed at 5.19.

Thanks!

>
> On Wed, May 18, 2022 at 9:34 AM Xianting Tian
> <xianting.tian@linux.alibaba.com> wrote:
>>
>> Commit 00ab027a3b82 ("RISC-V: Add kernel image sections to the resource tree")
>> marked IORESOURCE_BUSY for reserved memory, which caused resource map
>> failed in subsequent operations of related driver, so remove the
>> IORESOURCE_BUSY flag. In order to prohibit userland mapping reserved
>> memory, mark IORESOURCE_EXCLUSIVE for it.
>>
>> The code to reproduce the issue,
>> dts:
>>         mem0: memory@a0000000 {
>>                 reg = <0x0 0xa0000000 0 0x1000000>;
>>                 no-map;
>>         };
>>
>>         &test {
>>                 status = "okay";
>>                 memory-region = <&mem0>;
>>         };
>>
>> code:
>>         np = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
>>         ret = of_address_to_resource(np, 0, &r);
>>         base = devm_ioremap_resource(&pdev->dev, &r);
>>         // base = -EBUSY
>>
>> Fixes: 00ab027a3b82 ("RISC-V: Add kernel image sections to the resource tree")
>> Reported-by: Huaming Jiang <jianghuaming.jhm@alibaba-inc.com>
>> Reviewed-by: Guo Ren <guoren@kernel.org>
>> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>> Tested-by: Heiko Stuebner <heiko@sntech.de>
>> Co-developed-by: Nick Kossifidis <mick@ics.forth.gr>
>> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
>> ---
>> Changes from v2:
>> - Fix typo in commit message: casued -> caused
>> - Remove Reviewed-by of Nick Kossifidis, who didn't give Reviewed-by actually
>> - Add Co-developed-by of Nick
>>
>> Changes from v1:
>> - Mark reserved memory as IORESOURCE_EXCLUSIVE, suggested by Nick
>> ---
>>  arch/riscv/kernel/setup.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
>> index 834eb652a7b9..e0a00739bd13 100644
>> --- a/arch/riscv/kernel/setup.c
>> +++ b/arch/riscv/kernel/setup.c
>> @@ -189,7 +189,7 @@ static void __init init_resources(void)
>>                 res = &mem_res[res_idx--];
>>
>>                 res->name = "Reserved";
>> -               res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
>> +               res->flags = IORESOURCE_MEM | IORESOURCE_EXCLUSIVE;
>>                 res->start = __pfn_to_phys(memblock_region_reserved_base_pfn(region));
>>                 res->end = __pfn_to_phys(memblock_region_reserved_end_pfn(region)) - 1;
>>
>> @@ -214,7 +214,7 @@ static void __init init_resources(void)
>>
>>                 if (unlikely(memblock_is_nomap(region))) {
>>                         res->name = "Reserved";
>> -                       res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
>> +                       res->flags = IORESOURCE_MEM | IORESOURCE_EXCLUSIVE;
>>                 } else {
>>                         res->name = "System RAM";
>>                         res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
>> --
>> 2.17.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
