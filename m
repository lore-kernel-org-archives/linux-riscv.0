Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6699FC00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 22:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=QoJvHl4wBw+xzToXoutjWJLcQ/hV2sIJTow61IjuTlk=; b=h3NtJvAp36yqOR1cG+4wJlPp9b
	0QQ6rv1M3SRE7jp1A3idbzqFv/kyKLqb5tlByOu70h0C9XGdAF05zHEQVU53b3X72I4xrMrOtLMok
	Z7Fdv6+HLhcSrMlHHsl0ITaEZ4W/CH4NVS7YPcRQMsUU/GYLKZg7E7NQk9haqhMFV9Qv0+GeIJpqM
	n9CkxalR8NMKoPgv44BNy6nXW6QDkVkbDp8pstgeBy6sQoIvzKFzGn83p+5RKUX/EGkK8Pzj75qK3
	sd/l8HysvVWdfzOWgZtFXitW/Id4C7VTZaVRlmdjLip1+eNmOyOtVQqXEq8RQcJAAixA9Za9D0xlP
	KLDroV9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMdES-00GqRu-VF; Fri, 12 Aug 2022 22:34:21 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMdDi-00GkZw-Or
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 22:33:36 +0000
Received: by mail-pg1-x532.google.com with SMTP id 202so1882886pgc.8
        for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 15:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=J9waYuqiXiBo6CoKOY7xSmYY7/t2Q162Stvs30VRjP0=;
        b=o6Q7RXb92DprDTEK+xuWZspARQoP6RYVzSVAfk0YB28mr9jc7AQl4X79nUF/2oo3bb
         n5ESpjMYSYV0pMInItoE9jj6D0rCgz0yH4oUTYnwsWsKHOB4T9DNBymmbbSO8N35oXqV
         iweQz4HA3ceRqgscHKCc4abaIonTH62RhMC/tsv8a9WRHdMlCI0hDygMLJSN2XKqsRPp
         i90nqzmFhAxcigkrmOiVRUwfVYs4znxLzmenwmd0GucYeWPdPtS8u7KIQtWzGzAtyEbS
         N009eCfbkBSP+76LfCWw+BGRxCUOXFsd0VExQ9K1zvuOLYJHT31hkgbeEaZpjDBz/N5o
         5iUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=J9waYuqiXiBo6CoKOY7xSmYY7/t2Q162Stvs30VRjP0=;
        b=5yc2ISNbL5rDtjmsoi4W0W01brunQnBfn+Oesv/yLWZCYKFF93wEzxAXJ1zTvuBdSn
         kSyMq74KmWWsepudO2J3iAOjxKYeZZJpjT7oRCU5nBPOCQjI5MemwdCduPuTcNhZwja7
         wEtOa5iHUPY+5pN1c5it6Yq7EJT/d1Rps+UBfvh8LcVsWGPD34nk69YRjeO8qpk+xJA6
         iY88f+KOSej7axq4FZCWpqln+y2X7rayvoSs2sweUzhsaW05L2/z2PEZHPfj844JIvpt
         3ZOJEyTdpcrkCZ8bitBlLM4B8ZQWqW/NMlhBP1+V0GLYZvhKtv+tUbkqTMWNeKfTHoEY
         zw+A==
X-Gm-Message-State: ACgBeo2PqCleMn0l7G7hTAKnecqnu6eC2WNue68IOG7E/+U68itEtgYY
	Tz2Qi4F/grXey4kunem0Dyd1/Q==
X-Google-Smtp-Source: AA6agR7dGB9/EdbtT/JngiW+GGXOkOM5zXiMIlvHsOMRb7xCxt7iRELMkk+G/LhhZRhJaf8KIVotQg==
X-Received: by 2002:a05:6a00:230d:b0:52b:1819:3a0 with SMTP id h13-20020a056a00230d00b0052b181903a0mr5842336pfh.53.1660343610994;
        Fri, 12 Aug 2022 15:33:30 -0700 (PDT)
Received: from localhost ([50.221.140.186])
        by smtp.gmail.com with ESMTPSA id i16-20020a056a00005000b0052d82ce65a9sm2185008pfk.143.2022.08.12.15.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 15:33:30 -0700 (PDT)
Date: Fri, 12 Aug 2022 15:33:30 -0700 (PDT)
X-Google-Original-Date: Fri, 12 Aug 2022 15:33:29 PDT (-0700)
Subject: Re: [PATCH] perf: riscv: fix broken build due to struct redefinition
In-Reply-To: <84e4739c-0197-f9d9-5529-24f6037c85fa@microchip.com>
CC: jrtc27@jrtc27.com, atishp@atishpatra.org, anup@brainfault.org,
  Will Deacon <will@kernel.org>, mark.rutland@arm.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor.Dooley@microchip.com
Message-ID: <mhng-32b44fa5-288d-4186-bc79-6c5f2608aa36@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_153334_853192_17FD29C3 
X-CRM114-Status: GOOD (  13.60  )
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

On Fri, 12 Aug 2022 07:19:54 PDT (-0700), Conor.Dooley@microchip.com wrote:
> On 12/08/2022 15:13, Jessica Clarke wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>> 
>> On 12 Aug 2022, at 14:51, Conor Dooley <conor.dooley@microchip.com> wrote:
>>>
>>> Building riscv/for-next produces following error:
>>> drivers/perf/riscv_pmu_sbi.c:44:7: error: redefinition of 'sbi_pmu_ctr_info'
>>> union sbi_pmu_ctr_info {
>>>       ^
>>> arch/riscv/include/asm/sbi.h:125:7: note: previous definition is here
>>> union sbi_pmu_ctr_info {
>>>
>>> This appears to have been caused by a merge conflict resolution between
>>> riscv/for-next & riscv/fixes, causing the struct define not being
>> 
>> union, not struct
> 
> autopilot, thanks :)
> 
>> 
>> Jess
>> 
>>> properly moved to its header.
>>>
>>> Fixes: 9a7ccac63f9c ("perf: riscv_pmu{,_sbi}: Miscallenous improvement & fixes")
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>> drivers/perf/riscv_pmu_sbi.c | 14 --------------
>>> 1 file changed, 14 deletions(-)
>>>
>>> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
>>> index e7c6fecbf061..6f6681bbfd36 100644
>>> --- a/drivers/perf/riscv_pmu_sbi.c
>>> +++ b/drivers/perf/riscv_pmu_sbi.c
>>> @@ -41,20 +41,6 @@ static const struct attribute_group *riscv_pmu_attr_groups[] = {
>>>        NULL,
>>> };
>>>
>>> -union sbi_pmu_ctr_info {
>>> -     unsigned long value;
>>> -     struct {
>>> -             unsigned long csr:12;
>>> -             unsigned long width:6;
>>> -#if __riscv_xlen == 32
>>> -             unsigned long reserved:13;
>>> -#else
>>> -             unsigned long reserved:45;
>>> -#endif
>>> -             unsigned long type:1;
>>> -     };
>>> -};
>>> -
>>> /*
>>>   * RISC-V doesn't have hetergenous harts yet. This need to be part of
>>>   * per_cpu in case of harts with different pmu counters

Atish just poked me about this as I was tagging my PR, I squashed it in.  
I don't see a message on lore, not sure if something went off the rails 
or if it's just in the outbox on my box at home.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
