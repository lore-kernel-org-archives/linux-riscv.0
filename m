Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EE0C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 23:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=JtpkNxTHFIv9sGqJdDTCQN+1J3bXBwCHeU8GIUDjf5k=; b=XUa7bgmJhb0eZXqqEiM/Duv7Qw
	NrZSeJodDLs/cFbGiJxywy7dGb6B3FM2x7xtHRKnKYKUQMH11SK2ehEUr8rH0GjKsPcK0nRAIMuii
	sQWPMfrQhvKdXrmnpHg0E8LHlYGFOUSm72ErNH51QTEAIwCnTzon+cmFWBx546XrHUvsfI6Im8hQU
	RS7RsLal6IRjYEmqkaK0qvVuBPRWNZ9EO/e9koLBRXrDKWmvFCLHHrWZDSww7EZpLFRoCe0cs4PMR
	CUktlPyh9cBxA7TEYpesaK/9k21/JixIN5NLxXyXzfyZdCS+EFSBHsr9gV12Pmp9xJyBb7XyPtdd6
	ihq2JAng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJkyD-00HImT-Bx; Mon, 14 Feb 2022 23:41:25 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJkyA-00HIlS-Fd
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 23:41:23 +0000
Received: by mail-pj1-x102d.google.com with SMTP id b8so4047411pjb.4
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 15:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=moNgRt/ZLEOBsvTByTxtoOs0vPE/zSrseOi9CrHk4fo=;
 b=yoV/X27MeBo7oIZfSwmeTrP3dQ/+GNhABFP1Nj4ylCVxf+C2qf+1N2m4gY5+NP0SYS
 MTK4VhrCChxql5dGYbg2D/eflP6WJWuMp2HL0yU5jMyfg1js+SOnqY4uf7Gk6Zwx1Dha
 q4Lc2suIJTeaK30TCLCX+YU6f52bh1A2KKlRcqLvwx9shfV9qXx7trZePAdXWgFVf+Ox
 0I7NDimuv+L78rDIfRcfFwGh8LpACXzlYn3M5dQl6uoQSjAyLPkT6f6GYvmvp8XpH8Mn
 /hO7TOJBxKJlBjRLSz044qvnAiXd6Tf7e5mp5HyrSrhs83jUk6p7RGp15qN0Bso40VyC
 Gq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=moNgRt/ZLEOBsvTByTxtoOs0vPE/zSrseOi9CrHk4fo=;
 b=YKtNCVySDkZBD583KKpy+e1A1QaeSg0XxQfNzy/cIQQY7jvfGFJIKzuEs7CLaSmzRy
 97XTB447pb9QmkWNj1Ya/or+cgJZBP+1jUWW2dZtWFfQphtSXaH1jyeqa3TPDfaQwIHE
 9jlVX/PvQ2SdUQCRepRcVXAZPGtT8HyQwwtsHVqQpqz+5KKWl3H2+l++iQPUE6yOrlmP
 c4RkWWkEPMsBxEpZkc9nwviOeyIJni0AB3xSSvp7IWWGKDTBpIX61t3301dQcaggGpIa
 OWX80adFNicrz1xD6KhlHuS6EEN1xefUMHTVJVNJLHacm30DGpOKJmqd+nsyB4GG8XYp
 DSlw==
X-Gm-Message-State: AOAM530vZ5KTAFIxLNNAIiFdQezSlefjtHcZJ3tgE5QTgP64SfTKOXGd
 sJegc9oRCE/p7Ia4iT9kCzDIhQ==
X-Google-Smtp-Source: ABdhPJxrSAvPdqz8scLzAe/1uJoOiULuiRw2YIGciMi8EOsLxfF2zYjgEjkB/FnV4NMi5Ru8+XTGMA==
X-Received: by 2002:a17:90b:2496:b0:1b9:a6dd:ae7 with SMTP id
 nt22-20020a17090b249600b001b9a6dd0ae7mr1233912pjb.35.1644882080753; 
 Mon, 14 Feb 2022 15:41:20 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id 13sm36798718pfm.161.2022.02.14.15.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 15:41:19 -0800 (PST)
Date: Mon, 14 Feb 2022 15:41:19 -0800 (PST)
X-Google-Original-Date: Mon, 14 Feb 2022 15:40:54 PST (-0800)
Subject: Re: [PATCH] riscv: mm: remove the BUG_ON check of mapping the last 4K
 bytes of memory
In-Reply-To: <36519886-cedc-a3e3-70d2-712f8a6d3a10@ghiti.fr>
CC: jszhang@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-790fdd34-b20e-4c0a-b36d-eb91b16a3e44@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_154122_611515_810C5B73 
X-CRM114-Status: GOOD (  25.31  )
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

On Tue, 25 Jan 2022 08:10:41 PST (-0800), alex@ghiti.fr wrote:
>
> On 1/25/22 16:55, Jisheng Zhang wrote:
>> remove the BUG_ON check of mapping the last 4K bytes of the addressable
>> memory since "this is true for every kernel actually" as pointed out
>> by Alexandre.
>>
>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>> Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>
>> ---
>>   arch/riscv/mm/init.c | 8 --------
>>   1 file changed, 8 deletions(-)
>>
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index cf4d018b7d66..8347d0fda8cd 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -811,14 +811,6 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>>   	BUG_ON((PAGE_OFFSET % PGDIR_SIZE) != 0);
>>   	BUG_ON((kernel_map.phys_addr % PMD_SIZE) != 0);
>>
>> -#ifdef CONFIG_64BIT
>> -	/*
>> -	 * The last 4K bytes of the addressable memory can not be mapped because
>> -	 * of IS_ERR_VALUE macro.
>> -	 */
>> -	BUG_ON((kernel_map.virt_addr + kernel_map.size) > ADDRESS_SPACE_END - SZ_4K);
>> -#endif
>
>
> This BUG_ON seems pretty legit to me: I re-read the exchanges we had,
> and I see that I didn't notice that in your v2, you actually removed the
> BUG_ON. So that's my bad, what I meant in the first place was that the
> BUG_ON is true for 32-bit and 64-bit kernels actually.

There's actually an ifndef 64BIT above that sort of handles this case 
(though I didn't check to see if we're getting the limits correct, so it 
may not work properly).  That's shrinking the memory, rather than just 
firing a BUG, and it's not really any more code so we should go that way 
for both.  I could see leaving a BUG in there, maybe just explicitly 
using IS_ERR_VALUE as that's really what we're checking for (though if 
that's not 4K a bunch of stuff will break, so maybe it just doesn't 
matter).

> Sorry my RB was not right on this one :(
>
> Alex
>
>
>> -
>>   	pt_ops_set_early();
>>
>>   	/* Setup early PGD for fixmap */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
