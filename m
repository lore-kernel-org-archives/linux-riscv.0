Return-Path: <SRS0=OQtk=I7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6A2C433B4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 04:37:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FDD1610E7
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 04:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FDD1610E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=bg3PA8V/7WLfuZo0ssDn4UNN98IsL7dqhNtpNsKE5+Y=; b=V5bnRyxgJI8k+VyJHvN7wnQ7P
	HgNthKoXVAjkMjnkVSOv/nOWrTn9M7L+vrC6wWNxFT9+vqyGpKW84CqSNJr3EVlBz+4QstAqP6M9N
	bzIRih/8bSDPRFWcVw7Sd9NV5A0V4u6zzc2tz40lqlrrPtiFWwIrVprh/sS5UPwiFq3cqMBHObqxP
	TrcimKkcxHXEb2PlhhuGq/G6rCSRSUeVn/r+mwRKomuXwopBtsF5nNqGWm+ULgYvF68KIwnFI+C4D
	fXgbpYjruR/kOr318Madi1sEpFd3LPTWrUJj555eJBF7iia8AF7KUt/vv6H9UIBr0gGRhbvguBizm
	H0NuGd4YA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSBYg-00BvMm-9h; Fri, 02 Apr 2021 04:37:22 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSBYb-00BvLt-9o
 for linux-riscv@lists.infradead.org; Fri, 02 Apr 2021 04:37:19 +0000
Received: by mail-pl1-x630.google.com with SMTP id o2so2032797plg.1
 for <linux-riscv@lists.infradead.org>; Thu, 01 Apr 2021 21:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=vM45/P2fkskhNC9Pi4JhTYL40XcOm7rleD9sfr3mD98=;
 b=umn0kYFQss3RUcN+MI88Z4iWl2uuiLGyUdqhMxwoNWlHDuYbbgCkT0FQDFeXOnfirK
 k89l1KDyA+VPXoR7p9/EOEjauKHHw+WG4vph7n0k6lcqdXz2H7WvrM9xtun2WzhOz8lt
 xfXZV23UPtftCh7KwJyIE+tvV6jAh+QZx7FccS3yaJLM6mgr1uUBVbk6cRrkMQbZeipj
 jmYMKiPj8ZGtJRzXmrf16BCfkwTDnxP9hTJQ3T89WSMTwoRiWcjOT3/zgLUpcOlFadTg
 hjZp2BxFP+OlBMgT4ZpdFrW3O57a2RLE61n6XsLmjTMtgaFbRB+j8cc36YpuwK2t4crw
 /F5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=vM45/P2fkskhNC9Pi4JhTYL40XcOm7rleD9sfr3mD98=;
 b=ghbt7J+98darIhK9+O+EEhv6OfHpDzoskD0xVUAVfQ/eGzzt7OJMJOjvnkwf9bPBdo
 rygLN3fyFXpbTnLtSwRS6PGIYkt/LFHkIajsBftTQwN16VR6XAHZkG+LqZo66LbhPY00
 8Z1EdI80/9U/g3RJzc6LTt1xIWQS0v8BO3zu17e97OCyoVwn0iL9FBrM/b0fvxh2Zs12
 VzcU66HS+8CHX3GHWJO4seeVzwOZTWTRHNjzmn/IeJhF/SOxbL4sfVgJNSM3Z04COjsI
 tcyld6TfPcOOw1jJBhJsWkmgTDX1FVn6++d/q350gxu3TRP2QLepU9W/MNqZnSiWyumJ
 TmsA==
X-Gm-Message-State: AOAM531iqu/nKEzdpmzXdKkFNy5rt2EXZAiC99/tVT+LUX7oHuRBa1p6
 oymWZTtTxTzpVDbB0h26on2z7w==
X-Google-Smtp-Source: ABdhPJwJpz+wXqtGbLkWvIyoQhjW1a/r+eVcAWwWeT4eygWs+CgHs2CwdQnJik04EKWP9chLze/CJg==
X-Received: by 2002:a17:90a:df91:: with SMTP id
 p17mr12153985pjv.23.1617338235768; 
 Thu, 01 Apr 2021 21:37:15 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id y5sm6696592pfl.191.2021.04.01.21.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 21:37:15 -0700 (PDT)
Date: Thu, 01 Apr 2021 21:37:15 -0700 (PDT)
X-Google-Original-Date: Thu, 01 Apr 2021 21:37:09 PDT (-0700)
Subject: Re: [PATCH] riscv: Bump COMMAND_LINE_SIZE value to 1024
In-Reply-To: <alpine.DEB.2.21.2103302221590.18977@angie.orcam.me.uk>
CC: alex@ghiti.fr, Paul Walmsley <paul.walmsley@sifive.com>, dvyukov@google.com,
 linux-api@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: macro@orcam.me.uk
Message-ID: <mhng-08e5e4fb-8a42-4f7b-8ceb-ff549784100e@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_053717_463922_9F1F82AF 
X-CRM114-Status: GOOD (  21.26  )
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

On Tue, 30 Mar 2021 13:31:45 PDT (-0700), macro@orcam.me.uk wrote:
> On Mon, 29 Mar 2021, Palmer Dabbelt wrote:
>
>> > --- /dev/null
>> > +++ b/arch/riscv/include/uapi/asm/setup.h
>> > @@ -0,0 +1,8 @@
>> > +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
>> > +
>> > +#ifndef _UAPI_ASM_RISCV_SETUP_H
>> > +#define _UAPI_ASM_RISCV_SETUP_H
>> > +
>> > +#define COMMAND_LINE_SIZE	1024
>> > +
>> > +#endif /* _UAPI_ASM_RISCV_SETUP_H */
>>
>> I put this on fixes, but it seemes like this should really be a Kconfig
>> enttry.  Either way, ours was quite a bit smaller than most architectures and
>> it's great that syzbot has started to find bugs, so I'd rather get this in
>> sooner.
>
>  This macro is exported as a part of the user API so it must not depend on
> Kconfig.  Also changing it (rather than say adding COMMAND_LINE_SIZE_V2 or
> switching to an entirely new data object that has its dimension set in a
> different way) requires careful evaluation as external binaries have and
> will have the value it expands to compiled in, so it's a part of the ABI
> too.

Thanks, I didn't realize this was part of the user BI.  In that case we 
really can't chage it, so we'll have to sort out some other way do fix 
whatever is going on.

I've dropped this from fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
