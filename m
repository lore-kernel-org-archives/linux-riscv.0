Return-Path: <SRS0=IGe1=QB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAEF7C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 25 Jan 2019 19:02:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B62B218B0
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 25 Jan 2019 19:02:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CCISVp9x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="JxS/2ZSx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B62B218B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=UUz322pfouzWwCiF50DvxdE1iQDEHUtXoc8PSqGj5Q4=; b=CCISVp9xyiJFfeBwES4giIERG
	J8QIRatdlTD4TKKtCwTevDwrnS1Dw4UaJJNzFn/8VjxzjHlTnsUFFjjiJf9BzEf7fr4jghLOGCo6r
	K2ujQLuwymxJUHmqpeGqYM3dYH87v6gIBOonkmF8gSC3+2n8DCji0joRJTUdxvU7aiXfNWhWvCEfQ
	DY9oxudKdUJlJcSAyWCtpgnlpFPy0zPfT2PXf+4nlY2S9VtxJEo9orRLQNR1oKxcYv1ZCvptRvVK+
	t5Z+8HSm9PVL3ReoZlsTSD5HPLQeRMpLdJeEsRiczKqYKYENT0xmqenCmn4r7ioRAWqW7u5QuNdD5
	BTG34APxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gn6jv-0004NO-Dp; Fri, 25 Jan 2019 19:02:07 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn6js-0004Mj-Ox
 for linux-riscv@lists.infradead.org; Fri, 25 Jan 2019 19:02:06 +0000
Received: by mail-pf1-x441.google.com with SMTP id c123so5182923pfb.0
 for <linux-riscv@lists.infradead.org>; Fri, 25 Jan 2019 11:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ZMn8J7lR1tG5Gh+dluFwRxc2s5CTkwnjg1inQO0eMR4=;
 b=JxS/2ZSxAyQ8n+w7jGDXI1HeEqDhT2F9c9jmw6+G6KE1KQupMXN6i8EqLe7kxsx56q
 AJHRn0FdB4AEAS37Aiuq8cPmz9wpIlyYgRmXZ3zWUpHDlI5YdyHmbBkMsv00xhwYQR07
 hB8+f/QFX+YREX8yCEhhsCqfN2a0kAYOgQhwFWVc6llICTf9jpzst/esU1Uf5kkk16IP
 tNU69tiLrVV91hC9t2SIPY3zcxRZCS/2jCh3Fpk2VLBbhrOOke4cC+Htt85BJ76bbj9V
 sr9qn3dRx/tOg/ATaKD7KFjD1Z3sDLvJvzTYxGuOeuAq7yiAt9c7wsrfcPwWdnwBFFdG
 Tavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:in-reply-to:cc:from:to
 :message-id:mime-version:content-transfer-encoding;
 bh=ZMn8J7lR1tG5Gh+dluFwRxc2s5CTkwnjg1inQO0eMR4=;
 b=Cp01jwRF4zOBvlhxHb8dH6YqoeoUIYUHb1IiFLcHWL93FAERxSiUMfaJQO2xBPfJQf
 YSkQG9hWd3U3luhJbrUDpEMpbmesp7Ptt8HFHqxu21Ousr5X/lENLyh5t7QWI+N/Klgf
 O5wcY1BQwrnrG2oMqMaoItuNVz5QW551JgJDflCs5Nq/T9YJtJXKJWj5iaJXTbY1ljhy
 nhn81YLlUji60rHP9qZXACzUE8Q4LHFT4bZK/g0BJwZzmEaVFj8WGYVQ/6PMHi7AKi6O
 OrSm64WBxkwAyxq5F8xzT+aaQR9JPjhpF/quENw4waKNwNLf5s7WRfEFcDcTxdWZ0Hqu
 bo6A==
X-Gm-Message-State: AJcUukcl0YDz+wpzYAxXY4kMyXya9YYjr7nPxpe0h/gFuF2YPxSqxXwP
 gr3TkT+Ll930CvfOys7/zXtIjg==
X-Google-Smtp-Source: ALg8bN6bPlTIkuWWd0/CA2r527A0Cqk/0zMASwmwcZJ5dsM1/UmdCuYUg1o998GDqA5Km0BpDgtwag==
X-Received: by 2002:a62:da5a:: with SMTP id w26mr12107028pfl.106.1548442922871; 
 Fri, 25 Jan 2019 11:02:02 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id m11sm38270926pgh.51.2019.01.25.11.02.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Jan 2019 11:02:01 -0800 (PST)
Date: Fri, 25 Jan 2019 11:02:01 -0800 (PST)
X-Google-Original-Date: Fri, 25 Jan 2019 10:58:03 PST (-0800)
Subject: Re: [PATCH 3/3] riscv: Adjust mmap base address at a third of task
 size
In-Reply-To: <20190115160206.GF13095@infradead.org>
In-Reply-To: <c45285f7-9b05-9f04-a5a0-5d5dc075bb1b@ghiti.fr>
From: Palmer Dabbelt <palmer@sifive.com>
To: Christoph Hellwig <hch@infradead.org>, alex@ghiti.fr,
 catalin.marinas@arm.com
Message-ID: <mhng-390e0f09-77a1-4943-99a6-6faba4632383@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_110204_841910_2231973B 
X-CRM114-Status: GOOD (  17.69  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mingo@kernel.org, aou@eecs.berkeley.edu, catalin.marinas@arm.com,
 ndesaulniers@google.com, aghiti@upmem.com, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 mike.kravetz@oracle.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 15 Jan 2019 08:02:06 PST (-0800), Christoph Hellwig wrote:
> On Mon, Dec 10, 2018 at 06:21:46AM +0000, Alexandre Ghiti wrote:
>> This ratio is the most used among all other architectures and make
>> icache_hygiene libhugetlbfs test pass: this test mmap lots of
>> hugepages whose addresses, without this patch, reach the end of
>> the process user address space.
>
> This does indeed look common, so this looks sensible to me and might
> be worth picking up ASAP even without the hugetlb support:
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Makes sense to me.  I'll take it in to the next PR.

> I wonder if we should provide this value as a defualt
> TASK_UNMAPPED_BASE if the architecture doesn't provide one.

Looks like arm64 divides by 4 instead of 3.  It appears to have been that way 
since the start:

    commit 4f04d8f00545110a0e525ae2fb62ab38cb417236
    Author: Catalin Marinas <catalin.marinas@arm.com>
    Date:   Mon Mar 5 11:49:27 2012 +0000
    
        arm64: MMU definitions
        ...

so maybe that's the right answer?

On Tue, 15 Jan 2019 10:54:27 PST (-0800), alex@ghiti.fr wrote:
> On 1/15/19 4:02 PM, Christoph Hellwig wrote:
>> On Mon, Dec 10, 2018 at 06:21:46AM +0000, Alexandre Ghiti wrote:
>>> This ratio is the most used among all other architectures and make
>>> icache_hygiene libhugetlbfs test pass: this test mmap lots of
>>> hugepages whose addresses, without this patch, reach the end of
>>> the process user address space.
>> This does indeed look common, so this looks sensible to me and might
>> be worth picking up ASAP even without the hugetlb support:
>>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>>
>> I wonder if we should provide this value as a defualt
>> TASK_UNMAPPED_BASE if the architecture doesn't provide one.
>
> Thanks for your review.
> I think you're right regarding having a default version of
> TASK_UNMAPPED_BASE,
> I will propose something.

Sounds good to me.  I don't see anything, so I'm still going to take the patch 
-- we can always drop the redundant definition later.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
