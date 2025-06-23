Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDBCC77B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 01:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=FM8zClWxKKZc3/qgoQbgptzRiwVQgmyHfnyvTqT4JQU=; b=SNdlKefatstmgKLhLDrbZkY2tY
	sWsT5YZjV5IkSCT1uLtGN21Klb1QKp6ioHe0v89z70Owtimv/H187c1skmLIcso+1CqOpjF22aV6R
	rKibrqSHwFjrbepkqnqJ8zzFrdn++n3vvz2Xl4RfFyxsJb3X0u2JosBh4rLj+dZ1SwVi3s1ShMcWq
	5zFpGc2bhIOq3YeDNLg1YRxZKy07rzaBw7ApmepcpYwbRIMJ+5zWhnsaeVQlxmPUSEgNPDpT/f9CP
	keKrzpb+PX91YsHDvhqjxYx7KPQAatCSq8wKKqRzHIqrmMvX2u4yOk22qYA17ztt31iDzifnmfeKo
	/RnQt0lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTscc-00000004O9h-30Da;
	Tue, 24 Jun 2025 01:38:50 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTqC5-000000048gb-0O0f
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 23:03:18 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-747e41d5469so5036496b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 16:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1750719796; x=1751324596; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xq/zZtHXdIEWDg6PksJqtvJ5HWuiH6F2m2ZdOErRcaY=;
        b=ukW4CP7SZ07JAUPO8A4Gjjs3jUYf0BrxtSZLreWQzKYgZYQdPQC1Ar8YPbYQrpczyT
         XpTSgS4ZsdiXtc2BThjS3NWHQDCXybsBaUho1i/Ms2Fd7L4U0HcqvLD8C/ulKRtjWdTY
         4ukaLnCAn8lS2EcJj+aOCqbjQQjTfu8T2U34mKkqz6kps8SI235LPzRgs1/IduRwGVbO
         WCsTUiW5nzihqPtN16T4pFqZW5Tlh27M+3ivdGiw+kzIL7iBk0zvENF2mklyjeVP0uEj
         NApjkfKcC029G0oQ007pa9kLM7nyXwYY6VqCQYBJbPJn6AEU/rCsGqgTD9JPfyTGKrxj
         KWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750719796; x=1751324596;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xq/zZtHXdIEWDg6PksJqtvJ5HWuiH6F2m2ZdOErRcaY=;
        b=YOHPpMis4mUmv4BEAYbwjvDjWe6xxVGTu5ZRpCsXLgXc85H0JOz47APcGyvSJSWUMp
         6pDx4i8D5PnKreiDym3L93uTbIX72IH+gIxyTRTNQ1vec9DEWAfwASikXiBmDb8EiyNQ
         5tlxzV+jCgSJ/4v9eeMDYjnRn0B/E7aa7vsQk6rpZ8ajWUKMjt3VKOAvr7fG74TvvYPn
         4+f1srrJOVRSnAfDpxoU45tEOVNcVNg9IG6D2n/WTfOP9P1eQZm12CrGcNd00+DzQvbj
         7R3h1tIhXU52iR9U+ki0zZeppdk+wnDAY6Je71rVQCXTkbVRMDuvfSl3KF/aaZPsfOdm
         ykag==
X-Forwarded-Encrypted: i=1; AJvYcCVx0UQ4Vv64F067vi2F75cqkm+cVvkk5jQKBAUzpm0U9txnRtgqMYd4A1axGXlCKahdkibyyq/H6RiLng==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCUItYkICKY5Oex81tpnKg+AdmfEDDjfWAXIIwvp8OfkP+NLRm
	aVtVHxJyXpXfTiPZbeBwMvkPCh1YHRIQuRhdo04j7J7az6F0bamDS84DCmY4koQepG0=
X-Gm-Gg: ASbGncvBFZfzr4kY51iGfMTXE/ylsrPRRH6xcY90yanOO3tfSsXdXjlPsfkwAGj14JV
	a4E54MgL3f/zHOBw+djc8T40XqDwyhCdXldqutg8BVqWOYWkhKLYP5MQ1/8AopNkh/kB6+h9vCo
	UC2pZIvbsUIV8uuAdECA3Ii4GRVSlOvvJNmF2jxsfVTRHwSFK40ZzuOYvxUEDR2sB5xJIGWrsrk
	EbLj+rInO11OJaiRXT5CjgWCf6QUA3c3sACzrOckUXUw1cGOu3sjNxeQRn3cE3wVse7MTD042cs
	QY5uGcZqUTqW+EM2u9JikrqkZdLfkTorHTKEPF11ohgDEYZcNQX7luPIiydU
X-Google-Smtp-Source: AGHT+IHo3IKRbWpWvprVqP+VM5IIGMy1WyvPfkLHogYWNfeYYT5jakVZXXuA0t9dLqqBcHxzu44RvA==
X-Received: by 2002:a05:6a00:2789:b0:730:95a6:3761 with SMTP id d2e1a72fcca58-7490d4f533amr26121349b3a.3.1750719796228;
        Mon, 23 Jun 2025 16:03:16 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:8d10])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-749c8851b0asm212812b3a.124.2025.06.23.16.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 16:03:15 -0700 (PDT)
Date: Mon, 23 Jun 2025 16:03:15 -0700 (PDT)
X-Google-Original-Date: Mon, 23 Jun 2025 16:00:17 PDT (-0700)
Subject: Re: [PATCH] Revert "riscv: Define TASK_SIZE_MAX for __access_ok()"
In-Reply-To: <027ef1a9-6a5c-4dba-8816-159411739b71@ghiti.fr>
CC: namcao@linutronix.de, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  rtm@csail.mit.edu, stable@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Message-ID: <mhng-6AF58D5A-1FD3-4D1F-B006-18562AD0F9A2@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_160317_132352_588CE563 
X-CRM114-Status: GOOD (  19.31  )
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

On Mon, 23 Jun 2025 02:15:48 PDT (-0700), Alexandre Ghiti wrote:
> Hi Nam,
>
> On 6/19/25 17:58, Nam Cao wrote:
>> This reverts commit ad5643cf2f69 ("riscv: Define TASK_SIZE_MAX for
>> __access_ok()").
>>
>> This commit changes TASK_SIZE_MAX to be LONG_MAX to optimize access_ok(),
>> because the previous TASK_SIZE_MAX (default to TASK_SIZE) requires some
>> computation.
>>
>> The reasoning was that all user addresses are less than LONG_MAX, and all
>> kernel addresses are greater than LONG_MAX. Therefore access_ok() can
>> filter kernel addresses.
>>
>> Addresses between TASK_SIZE and LONG_MAX are not valid user addresses, but
>> access_ok() let them pass. That was thought to be okay, because they are
>> not valid addresses at hardware level.
>>
>> Unfortunately, one case is missed: get_user_pages_fast() happily accepts
>> addresses between TASK_SIZE and LONG_MAX. futex(), for instance, uses
>> get_user_pages_fast(). This causes the problem reported by Robert [1].
>>
>> Therefore, revert this commit. TASK_SIZE_MAX is changed to the default:
>> TASK_SIZE.
>>
>> This unfortunately reduces performance, because TASK_SIZE is more expensive
>> to compute compared to LONG_MAX. But correctness first, we can think about
>> optimization later, if required.
>>
>> Reported-by: <rtm@csail.mit.edu>
>> Closes: https://lore.kernel.org/linux-riscv/77605.1750245028@localhost/
>> Signed-off-by: Nam Cao <namcao@linutronix.de>
>> Cc: stable@vger.kernel.org
>> ---
>>   arch/riscv/include/asm/pgtable.h | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>> index 438ce7df24c39..5bd5aae60d536 100644
>> --- a/arch/riscv/include/asm/pgtable.h
>> +++ b/arch/riscv/include/asm/pgtable.h
>> @@ -1075,7 +1075,6 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>>    */
>>   #ifdef CONFIG_64BIT
>>   #define TASK_SIZE_64	(PGDIR_SIZE * PTRS_PER_PGD / 2)
>> -#define TASK_SIZE_MAX	LONG_MAX
>>
>>   #ifdef CONFIG_COMPAT
>>   #define TASK_SIZE_32	(_AC(0x80000000, UL) - PAGE_SIZE)
>
>
> I agree with this revert, the next step is to implement the same
> optimization using alternatives (like x86 does).
>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>
> It should land into -fixes.

It's not clear if you're picking it up?  I will, it's hitting the 
tester now...

>
> Thanks,
>
> Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
