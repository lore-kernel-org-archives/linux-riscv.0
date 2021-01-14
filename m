Return-Path: <SRS0=X6bA=GR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAAAC433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 05:12:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58D4C238E7
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 05:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58D4C238E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=LGpfeViToHnq6Ln4pFjg1EDhvOe+6+jzGy8w76NnSyE=; b=nDSO0sA65XS6JgGKPjbNhx0GS
	XuZ6uTOieKvPH/MzuQ49gntfLqYiabSy58a4ayFGSspDQvZDpXwfbmIUqFOQU2a8mq8CEHe/KMY6u
	WVlgNrmQu+QFDb0E4yMKsQahMht0wA7mcN3TXkLpHhFos8X9i89Ytrc7kZx61c29eskhHIN7wFLkI
	CPbIrv059vCIv1iaME25yj6/kzHbdiZe7XyOAvj5oLc1qZOebxUKuW0SgKJwBVLcgWB71dRcv2XAA
	1V8tUWpKx3dMoI98SX46eFxXGoyIgumXkQegv1S9bBjAGbGVSuOpObD5EeL+ZX3kW3/z21/GXHyed
	j/Rh26PqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzuvy-0003FQ-1i; Thu, 14 Jan 2021 05:12:34 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzuvw-0003Ez-3Q
 for linux-riscv@lists.infradead.org; Thu, 14 Jan 2021 05:12:32 +0000
Received: by mail-pj1-x102d.google.com with SMTP id l23so2563049pjg.1
 for <linux-riscv@lists.infradead.org>; Wed, 13 Jan 2021 21:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=EUYdLoxi1ljV+U3fVshJA2BY4WK+sDbT1TUophDzXDM=;
 b=pxOscEIokI8Wd+csd0auxVYDugi0wl44bVu7vJ4pP+1Dch63K+VNmCk9u9vhU05liR
 ddvkaISm5gXnWiYkCKpot19cCUwoXC/pTHhumiC8qF+EZbdQnHVt+IiV+iefPI1d5smw
 K62H99+bVTyil/LXN55pYbP2zSEIxjqfeQ982rNZ+CZGD+bSvlhzM/xRmyzpc47/zBR7
 0LDaSXsKSviGonowKvIAckVz9jXi5PYYGmcKaqu+mfRbevG7K19iX+9qyZGDzriBw4Cg
 VwnwNy2LsCFjMmne4F7v0v53c7LqCyiuPoONRZoYsDMFg3RdHJhVhDxvWDaXrvKzlRNk
 exgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=EUYdLoxi1ljV+U3fVshJA2BY4WK+sDbT1TUophDzXDM=;
 b=Z/gs8Wdl/y580TQdzSabagHxgFVb3jCnnpCEd3aaWwXtdctXrGxUdc4T1xEzlplTxx
 +bNiIoS1/QWQZmEdxp5JTW2EsfuHCWSdZERLpQy29n5xK89Hcr71VHmplv8RTwpIw4h8
 ed3nByL4dPoA4j5XSPp7Ybq8lNlCR4WKDII0fAAcV9K97qBucxbwQut/i/ufURn5zAt8
 4VB41PGvQkrFvAjSuTeJ0CBsuvLiWdJaJKDDrzJEPekt/PA9aKBQJ87FUaLINmtHpP8r
 Sltg8hPByouVjvsOlNAaZTTUIyLeJxa4OQuqkntHkyISV0Utb72TDuAeMQUyE7d+X8Q0
 WGHQ==
X-Gm-Message-State: AOAM531wZNwHJUsZ3OhyJJQBXuwhmTFMqyMHzpSv/suRv1wOQDONrUHj
 f4fiPcNZj/E8HkjHKoDgx5/A6w==
X-Google-Smtp-Source: ABdhPJyTalN85CBnljYXJhBtVTJsy6/4MR/QTiNj8e6mIzl3l52SlG4+aE124IVjL0Cy4NLwmoCxAQ==
X-Received: by 2002:a17:90a:e7cd:: with SMTP id
 kb13mr3181606pjb.10.1610601149920; 
 Wed, 13 Jan 2021 21:12:29 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id v15sm3920184pfn.217.2021.01.13.21.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 21:12:29 -0800 (PST)
Date: Wed, 13 Jan 2021 21:12:29 -0800 (PST)
X-Google-Original-Date: Wed, 13 Jan 2021 21:12:27 PST (-0800)
Subject: Re: [PATCH 0/4] Assorted fixes for RV32
In-Reply-To: <mhng-a7496321-17ee-4286-a31c-1474c80d4fce@palmerdabbelt-glaptop>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-7d4452e4-0726-41df-96a9-33eae8e5230f@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_001232_163583_85F25BBF 
X-CRM114-Status: GOOD (  18.22  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 mick@ics.forth.gr, akpm@linux-foundation.org, ardb@kernel.org, rppt@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 13 Jan 2021 21:09:36 PST (-0800), Palmer Dabbelt wrote:
> On Thu, 07 Jan 2021 01:26:48 PST (-0800), Atish Patra wrote:
>> This series fixes various issues observed in latest kernel on RV32.
>> The first two patches fixes an resource tree introduced in 5.11-rc1
>> while the last two fixes the case where 2GB physical memory is used
>> on RV32.
>>
>> There are may be better way to fix the issue pointed out in PATCH 3
>> as it seems a generic kernel issue where kernel pointers can not use
>> last 4k of addressable memory. I am open to other better alternate
>> suggestions.
>>
>> Atish Patra (4):
>> RISC-V: Do not allocate memblock while iterating reserved memblocks
>> RISC-V: Set current memblock limit
>> RISC-V: Fix L1_CACHE_BYTES for RV32
>> RISC-V: Fix maximum allowed phsyical memory for RV32
>>
>> arch/riscv/Kconfig             |  6 ++++--
>> arch/riscv/include/asm/cache.h |  4 ++++
>> arch/riscv/kernel/setup.c      | 24 +++++++++++++-----------
>> arch/riscv/mm/init.c           | 16 ++++++++++++++--
>> 4 files changed, 35 insertions(+), 15 deletions(-)
>
> I took all of them but that L1_CACHE_BYTES one, which I had a comment on.
> Thanks!

Oops, I just saw the v2.  I took those instead, the comment still applies.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
