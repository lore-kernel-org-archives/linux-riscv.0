Return-Path: <SRS0=Dv9V=MQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 848F6C4338F
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jul 2021 20:45:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3069D60E92
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jul 2021 20:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3069D60E92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=UplzLlHgP+72xAFkO3ywUy6nzZANbj4MIWcnUjJLCjo=; b=G6gQqz6QmCmcIKwgwycuQgWpNg
	xRK3vwk3p6QnsR+up9QcNiSFvpEm8ic86bl51Et+wa4MRq4fbYljZ1ShPk0mksTGtozBqGSdaEF54
	si6yN2Z561Apr9HnEXYk7WmTrSapFtTbv7uuWJSRYlcqTCyxXX1a0XysaFgPLVnDX9XtZ9zMtxxGR
	mzoGZKaR5JRyA3+o+wfVS5S0PVcv7BF2cSHchK1R2Oe8InpLn87OQM9cRRS8EiB+boCPo+SjbpUdj
	+OzAR6v//5gMNlPABi3uweLkf4ajCOBAHkvz4+9K7aLUOImdQw3P67Q1YoHf12jCCRsl2e0W6YtE1
	DQ4eaX5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7OW1-007oJH-Q1; Sat, 24 Jul 2021 20:44:57 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7OVz-007oIe-EY
 for linux-riscv@lists.infradead.org; Sat, 24 Jul 2021 20:44:56 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 k4-20020a17090a5144b02901731c776526so14037184pjm.4
 for <linux-riscv@lists.infradead.org>; Sat, 24 Jul 2021 13:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=AEgVPunMfOUWF41Ji9kSiUdVwjfFjhBj8emwtXLE7Eo=;
 b=VIibu6WVgKujJFY6O2lnZj4Mv46J+Ak9vIKq7Igsbf9nyh1H/N7yNWHurYxrPoo1TP
 1JTvOR6IRC2pQVR1NW9jHnzjRHtrn1Ph3WnUdgFl08ygfafF2UZKN/6W9PkyWeaP/7ml
 Z9lCXFKeAwl9rDXG+4lKOvnfUiVNrG0CVCEeORpUWBie3onvm7tVzx8uM/4hikU6Jipv
 /q1Y1v+fGdCJ6S1Wn5CDq387L7YUL3XJrsZXi4R5wuNFaoDglzjMcj3nAQ2pTHqh4pi9
 VUs2NuJ687TdOlvFeaMU8rW7tsa9OVOyzBofsKtvtIOC+oQCCYvIl4bH/pofjJaWBZQ4
 aZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=AEgVPunMfOUWF41Ji9kSiUdVwjfFjhBj8emwtXLE7Eo=;
 b=QzcLGKwquK1frkMg5Lcf06Ua6JoF7N76/O9HnC7aFr8aq6GJO++mEW0mkfJ/WU5hy6
 gCOHqSdzBlZ5I0ZsKRxlb0fLS/ZBQ3Js1q8euC7SMA7mmQjmFeojKIwFeQx18xNQc+lL
 XpNnB0TPt2z5wQ6wPUeIEgrUqsJF33lBPlUkbe9DnKkj82lRDFildAU1IHgqqVl3XDEo
 0iAueReN9Cqoff0RBhg7GUl7rnQixbJZekZeFor9THBFuDtcAS82ZNRmdbYQ/wsgrWuD
 uBS/oW74ZeOSHMoMyVR5I0c3WscZ4q329YxNYTVxi9hEC8S0qjLn+ZXN8E6/P9WVNU2A
 T85w==
X-Gm-Message-State: AOAM530ytS50XQqdJ0pr1L7bNEgbj8vgKt4FZBojZS+V14vsiC0/eswU
 MowjXGiOA7Osb2QQHHmOI1+wUABHU0n7uA==
X-Google-Smtp-Source: ABdhPJz1SGYTzDUo4dIm5rW7aRmU0r78xpAbrQipWGrWin01hgv2RXlWbZgu4exhB/2aL+2jc6BXMg==
X-Received: by 2002:a17:902:d682:b029:12c:13e9:adaf with SMTP id
 v2-20020a170902d682b029012c13e9adafmr343853ply.74.1627159494416; 
 Sat, 24 Jul 2021 13:44:54 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id m18sm39302378pff.88.2021.07.24.13.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 13:44:53 -0700 (PDT)
Date: Sat, 24 Jul 2021 13:44:53 -0700 (PDT)
X-Google-Original-Date: Sat, 24 Jul 2021 13:44:51 PDT (-0700)
Subject: Re: [GIT PULL] RISC-V Fixes for 5.13-rc3
In-Reply-To: <mhng-5cd676be-7ed7-48de-b740-0e809ae67a56@palmerdabbelt-glaptop>
CC: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-3e77f70c-4c2d-416f-8d07-3fffd2a23aa4@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210724_134455_534633_BA8E4980 
X-CRM114-Status: GOOD (  25.08  )
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

On Sat, 24 Jul 2021 13:44:02 PDT (-0700), Palmer Dabbelt wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
>
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.14-rc3
>
> for you to fetch changes up to ea196c548c0ac407afd31d142712b6da8bd00244:
>
>   riscv: __asm_copy_to-from_user: Fix: Typos in comments (2021-07-23 17:49:12 -0700)
>
> ----------------------------------------------------------------
> RISC-V Fixes for 5.13-rc3

Oops, that should be 5.14-rc3.  The tag name is right.

>
> * A fix to properly set the memory size, which fixes 32-bit systems.
> * A fix to allow the initrd to load anywhere in memory, rather that
>   restricting it to the first 256MiB.
> * A fix for the mem= parameter on 64-bit systems, to properly account
>   for the maximum supported memory now that the kernel is outside the
>   linear map.
> * A fix to avoid installing mappings into the last 4KiB of memory, which
>   conflicts with error values.
> * A fix to avoid the stack from being freed while it is being walked.
> * A handful of fixes to the new copy to/from user routines.
> ---
> There is one particularly odd bit in the history here: the fix for the 32-bit
> boot failure is based on an older release, because a recent feature addition
> also fixed the bug.  I wanted to take that patch so it could be backported to
> stable, but it's erased by its own merge.  Not sure if there's a better way to
> do this, but I figured this was saner than reverting the feature and then
> bringing it back.
>
> ----------------------------------------------------------------
> Akira Tsukamoto (4):
>       riscv: __asm_copy_to-from_user: Fix: overrun copy
>       riscv: __asm_copy_to-from_user: Fix: fail on RV32
>       riscv: __asm_copy_to-from_user: Remove unnecessary size check
>       riscv: __asm_copy_to-from_user: Fix: Typos in comments
>
> Alexandre Ghiti (3):
>       riscv: Fix memory_limit for 64-bit kernel
>       riscv: Make sure the linear mapping does not use the kernel mapping
>       riscv: Make sure the kernel mapping does not overlap with IS_ERR_VALUE
>
> Bin Meng (1):
>       riscv: Fix 32-bit RISC-V boot failure
>
> Heinrich Schuchardt (1):
>       RISC-V: load initrd wherever it fits into memory
>
> Jisheng Zhang (1):
>       riscv: stacktrace: pin the task's stack in get_wchan
>
> Palmer Dabbelt (1):
>       Merge remote-tracking branch 'riscv/riscv-fix-32bit' into fixes
>
>  arch/riscv/include/asm/efi.h   |  4 ++--
>  arch/riscv/kernel/stacktrace.c |  6 +++++-
>  arch/riscv/lib/uaccess.S       | 27 +++++++++++++--------------
>  arch/riscv/mm/init.c           | 32 ++++++++++++++++++++++++++++----
>  4 files changed, 48 insertions(+), 21 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
