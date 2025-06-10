Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9078BC61DB2
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 22:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=HBcJF0h7r3BhOop+Mjgy1hUhL2NBry2L/uP8Sr2QTd0=; b=zOc37fRbQOXA4HlOis680JrvXL
	VKjR11ZtbTaI9lHvahfhl5SoOPp0pbNiuCSQXJrjs8V/l1LAZO0tyyEFLqP36AcRqRxIaFiRVaTAv
	GCGRnwvP2as7/q5glbLJGMNI5DBAnWyUc6/SGOwmxS4oE8RuTa4KzMOXOvFjDWiOdqBGcL+pSW4ep
	GngOrSMLqSHxS8nhWpT+hsi/njQFiiHQpbXDXmUPl3rD6yrVXo/uZJfFS3i1oURqvgTyB1OS/GpWO
	ci70XuhVa7dP/0pupWXm5CAyKUn3RRj2fTQ3ID+D6KsPxS/ZdfKMuNT5/z0Dbs+gvqLm7MVGHo1Ia
	stPqLu2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7o7-00000008JlM-3FwB;
	Tue, 10 Jun 2025 22:51:03 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP717-000000089zB-3Q5w
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 22:00:27 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-742c46611b6so7516790b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 15:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749592825; x=1750197625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fbom0xG9ol+fr/AajJO7nHL/1uYibOAQ7MGdWD28twQ=;
        b=afmNT2cLR1eKdFhxP0B8FGBIiuKuTpczjWDES1HtFYo3KrcUtDKWYqnb+FZBNattS7
         3OPr17OlftLYvl5SPdYdX0B3/Ud1/cfkYkWCCKUb+abVTNrupYs5IO1qmeMSc5A+PDzx
         Rm/LfvKT5FaW0CmMt8yen0zDvxW6GqOEbgINdVelM+eAztyYdsXasJ+Nxs/PKM6Ggw1w
         UJap+9zPO9UlwA92SivxPG4L1546ez7MKQr0ZOF1dKPC6EYy57pKQAmW3Jzr5eExfirO
         AtXWECjq9dNt43SFBBD9MWt2WcaGHuJ7Jky2y660KKln3uXZam3or7ox97PoN97g1v3n
         ZASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749592825; x=1750197625;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbom0xG9ol+fr/AajJO7nHL/1uYibOAQ7MGdWD28twQ=;
        b=dRbg/VXHF+SN8+3ikDB9xPx45YvgFc8M36iPKZUkJismjGpsyvVYApD1GKV27yPmrK
         2VFe9OsH+YfG2gFIsvtBc4j6TV+oRuRfoTBe24k2aQOCBwW5McjKAv9Fbj5xkoLEWcYG
         CwCatA6dpQlLiCCIe2tE6PQi6dY3if1eqGnMgugNOOyvFz7L7BtspAHhzmhAIQgQepyM
         Hv+l2o9o2Q2Ny4JxOJo5MYQkhuA7BXh7o0jQYubGn7061ln2qH9H5a+Niok3wYVFCmcX
         MsFjlYhhDrzQPE6X+2Xi1st4pEehF7OchjszYozJ5Eb5lTSGy9a8YNbUHRdwchQx2IwK
         qfTw==
X-Forwarded-Encrypted: i=1; AJvYcCXYCSRwfqfK5SCoR6rchiDS2KN21SjUzS402jt2c95r40kV9gXmrLlozHa5SDe+hlVo4B9ov9Euy8GI+w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpLboilIr95TeSz9NqrGkjqi+gQGJevqWD8lvbdW7GZZgInfOZ
	sr5UxI11gBOyh7NurAvMii9FIfYSRANxXaKBXOOOgdCoN1jogqDfB5rUibSTybHvWAI=
X-Gm-Gg: ASbGnct5TaAkUSQAgVbqOr8l3sgW2rJVG+ehgVzLoxZy34/BRtPEcVPmLsH61UTBdbp
	B5u/WZB3pRBxeCL0VWPQz9f6X7y7HAhgRcscggQBad3t4+BL/Q2Ku1bFvRvaRn6YHiXvOTOvf00
	N0l5QlKjLRP09hEmudiiAwpASan6m1IMsu0x3rsaq3YRw8qr/wc7NvC2ak3ZBEf1Fl99tsveXWT
	mr27Xr9CXKFo5mHzNxjla8Cg59vWLDLkKD9S9xHSBAuNvMLQx+A28xd2FpOjDRmEu4wympTvmlY
	QCIHfkqEEs27x2Yu3V4ooWIrY5dJpc78pewAnQCmheqni4RV/ZwitXI5/Yd1
X-Google-Smtp-Source: AGHT+IGD3U6t86T21li6GwG2NgEvYoKN8WsucswfC21Sdfl2qIBCx1kf6qW6YPkuGZVyS6OyrNQOlQ==
X-Received: by 2002:a05:6a00:848:b0:73e:598:7e5b with SMTP id d2e1a72fcca58-7486facfb03mr502222b3a.1.1749592825023;
        Tue, 10 Jun 2025 15:00:25 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7482b0ea2a7sm7897643b3a.156.2025.06.10.15.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:00:24 -0700 (PDT)
Date: Tue, 10 Jun 2025 15:00:24 -0700 (PDT)
X-Google-Original-Date: Tue, 10 Jun 2025 15:00:11 PDT (-0700)
Subject: Re: [PATCH 0/4] Fix a segmentation fault also add raid6test for RISC-V support
In-Reply-To: <d052f010-410a-4405-9ae6-f679649851ea@ghiti.fr>
CC: zhangchunyan@iscas.ac.cn, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Charlie Jenkins <charlie@rivosinc.com>, song@kernel.org, yukuai3@huawei.com,
  linux-riscv@lists.infradead.org, linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org, zhang.lyra@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Message-ID: <mhng-D97D0B5D-7948-49C6-8F55-C0836E41DA3C@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_150025_851441_9C96A355 
X-CRM114-Status: GOOD (  21.11  )
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

On Tue, 10 Jun 2025 12:23:18 PDT (-0700), Alexandre Ghiti wrote:
> Hi Chunyan,
>
> On 6/10/25 12:12, Chunyan Zhang wrote:
>> The first two patches are fixes.
>> The last two are for userspace raid6test support on RISC-V.
>>
>> The issue fixed in patch 2/4 was probably the same which was spotted by
>> Charlie [1], I couldn't reproduce it at that time.
>>
>> When running raid6test in userspace on RISC-V, I saw a segmentation fault,
>> I used gdb command to print pointer p, it was an unaccessible address.
>
>
> Can you give me your config, kernel and toolchain versions? I can't
> reproduce the segfault on my machine.

It's probably going to be super fragile to reproduce.  The code is just 
scrubbing over t0 without a clobber, so it's just going to break stuff 
somewhat arbitrarily.

>
> Thanks for the fixes and the test, I'll take a look this week.
>
> Alex
>
>
>>
>> With patch 2/4, the issue didn't appear anymore.
>>
>> [1] https://lore.kernel.org/lkml/Z5gJ35pXI2W41QDk@ghost/
>>
>> Chunyan Zhang (4):
>>    raid6: riscv: clean up unused header file inclusion
>>    raid6: riscv: Fix NULL pointer dereference issue
>>    raid6: riscv: Allow code to be compiled in userspace
>>    raid6: test: add support for RISC-V
>>
>>   lib/raid6/recov_rvv.c   |  9 +-----
>>   lib/raid6/rvv.c         | 62 +++++++++++++++++++++--------------------
>>   lib/raid6/rvv.h         | 15 ++++++++++
>>   lib/raid6/test/Makefile |  8 ++++++
>>   4 files changed, 56 insertions(+), 38 deletions(-)
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
