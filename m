Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123F1C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 02:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=uXrJmF+vUC9g+ybxdyqwTfEXyAVcdDD8xng7x1oCXEw=; b=cw0sx/83BRIggN9WsNBu0DIoxL
	z7jRzurhvpuFkqHUFZFZEkWjIAdx6IzUsNo4rdeN+9hgNAu8Wqd7uBjqqTC4t8MEH88I7P9iobgsR
	P1brNlUj8NAhEhuYhzuwCoVlzUSo7cxEF9xoLAuRWJ8991IUlLvuZn0vBM5lBnI+nyZD425fIK5Ba
	JkDPe3HlPT2iSoHhYkx9n9myDAv7X1MacHg1UAhNCoC2iDrnWtlGVf6XWLEpYD1vB1pgSq/9iUoAa
	FrgvlZ9hB76Y2ZQRjJxOTOEk9MlLrXckAMNR/6iiswVUui7tr0Qnz6LoIpXrmbabApjIAg2r+67Me
	OWA/b8iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0DBd-00CJNn-4R; Wed, 30 Nov 2022 02:51:01 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0DBa-00CJMP-Ck
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 02:50:59 +0000
Received: by mail-pl1-x62c.google.com with SMTP id b21so15320076plc.9
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 18:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJzc1gkg7CYBIcnaOjHcKkT6tHJF7mw6uyG74ehPpXE=;
        b=WXu89bM8VSuMbjfLwDvOPgmdicHl23wdBR2XnPmgu0fbPUfWaoNkRHT47b9zlRU+3E
         Y0AVtZq9wJPW3p+6Qil1AakvSXNAGQr12qshsTOiUPugziY6IHk6w3tu3mpHIplFtLAh
         ux9pt8nUCrG+Dh6B5lCVsl76kjGpebfkKsTi5w/3moHCIIrqmOQUnF3fgi5FlbFWAvta
         cfJGpoMPWGQqPJIAA5lt6ajmHLyjSTq9r+AnUXSJzqty/DIVaurOjxq44+X4FEM7PZKd
         fj3NeyitI/6b8Qqn27Uh+LxtSyH5l86wMYLZLXn99H2VqDaAVhBlyf4JdhqncRqFo+8A
         Qrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJzc1gkg7CYBIcnaOjHcKkT6tHJF7mw6uyG74ehPpXE=;
        b=Ui1nH+f2M/yuLfEYpgOVqrij0P9yaRMbi5oRllNUy1g4U7YXlXBHyvGO/otS1qu4Vc
         PL2nnI8JBqfhwxUXeqZU3OW3DQkqE+vP5wK7rQGJBA5yBVCfcgbp7Ojp6phQNLE4L9t/
         3tQWv1FoeRlDrhNnj6oB9yhTVAtrd6Eho15qPZHJnmbxxSSKRnSh1tc1LB8icQBGUrEn
         9Zu8WgLy2q6xosNZSNzN271EdM1NMc9EYXe0N/F0SPiBJiXX7yCVmo0o/WImTDcASlGf
         u0ItsxoyjC890nohp5AurDsduonvcq5oR9nX83Oa1MJ1JHGTdbRQu5mj8HUPnsfnG4oy
         Au3Q==
X-Gm-Message-State: ANoB5pl/ukJRVmSWO8oXBltxnwTW957yPKvEhPC/0hDHQ/QREL78ZnJb
	/SfDGUSKEAee3w4hGbVvPp6IXU7pCdr9pg==
X-Google-Smtp-Source: AA0mqf4FSdPpqYs7fYp7rBaRklVNCUU5c5tQxLKaAX48o3YF24D+ccCJJwQKzUKhJuWUQmh48zRSdA==
X-Received: by 2002:a17:903:100c:b0:189:a682:c5a6 with SMTP id a12-20020a170903100c00b00189a682c5a6mr2166271plb.78.1669776656888;
        Tue, 29 Nov 2022 18:50:56 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id q13-20020a170902dacd00b0018986ba1db9sm5542309plx.284.2022.11.29.18.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 18:50:56 -0800 (PST)
Date: Tue, 29 Nov 2022 18:50:56 -0800 (PST)
X-Google-Original-Date: Tue, 29 Nov 2022 18:50:47 PST (-0800)
Subject: Re: [PATCH 1/2] RISC-V: Align the shadow stack
In-Reply-To: <CAMKF1srMj5aH4_+iwbFuu+AEgyyz85y+UPEszUGeQ7U=u19R3Q@mail.gmail.com>
CC: jszhang@kernel.org, guoren@kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <mhng-0a99c7e2-7e15-4a5f-a5fa-1e4c844a5ecd@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_185058_456504_C144EA01 
X-CRM114-Status: GOOD (  16.43  )
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

On Tue, 29 Nov 2022 18:47:55 PST (-0800), Khem Raj wrote:
> Hi Palmer
>
> On Tue, Nov 29, 2022 at 6:36 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>
>> The standard RISC-V ABIs all require 16-byte stack alignment.  We're
>> only calling that one function on the shadow stack so I doubt it'd
>> result in a real issue, but might as well keep this lined up.
>
> Is 16-byte alignment required on rv32 as well ?

For the standard ABIs that's the case, it's so the Q extension can spill 
without aligning the stack.  There's also at least a proposed embedded 
ABI that has just XLEN (32-bit on rv32) alignment, as the bigger stack 
alignment has an impact on some use cases.

>> Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>>  arch/riscv/kernel/traps.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
>> index be54ccea8c47..acdfcacd7e57 100644
>> --- a/arch/riscv/kernel/traps.c
>> +++ b/arch/riscv/kernel/traps.c
>> @@ -206,7 +206,7 @@ static DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)],
>>   * shadow stack, handled_ kernel_ stack_ overflow(in kernel/entry.S) is used
>>   * to get per-cpu overflow stack(get_overflow_stack).
>>   */
>> -long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE/sizeof(long)];
>> +long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE/sizeof(long)] __aligned(16);
>>  asmlinkage unsigned long get_overflow_stack(void)
>>  {
>>         return (unsigned long)this_cpu_ptr(overflow_stack) +
>> --
>> 2.38.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
