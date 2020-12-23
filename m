Return-Path: <SRS0=SHZ6=F3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD1BC433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Dec 2020 04:04:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B10DA20684
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Dec 2020 04:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B10DA20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Uyn9/ZvNlm+5Er79fpP+TYX+5fY6jXz1u/y5N/ZulrI=; b=PxN+rv93rPtzokeTp8tvGdosg
	6gWutZAgqfJdcZ3Z/o5k6AyK79TnuDyVZB0ajqO3q6kpmcB+6lViOAygqHS6zCdzEDrG5NhSsMdzM
	pleXStjGZb2W8UgRIFCcyEN5Oz0eeeebNX+C0+Grz8HhwUHMrIl8GG1MJ2rtlq5MxRKxp93c6yFVd
	5jm27fXk/jtcPipelzTBX8wAlOnSrMnAEuWW6au99zdpoDsIjmN/3wMw7IsbddWt1SMj3wf5XStdZ
	KPuLrE5lFJeiskcBG+3p0Kvo8xoLBOi8jxaVWxYTGvfr1wECaMIjFRvWHegyCYsCwrLfCeN77nAiQ
	V/OndcWxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krvO2-0002zP-I5; Wed, 23 Dec 2020 04:04:30 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krvNz-0002yQ-Ts
 for linux-riscv@lists.infradead.org; Wed, 23 Dec 2020 04:04:29 +0000
Received: by mail-pl1-x632.google.com with SMTP id be12so8488519plb.4
 for <linux-riscv@lists.infradead.org>; Tue, 22 Dec 2020 20:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=cn58q9KeE/RU2XDvOxFGGOuHBC6aWJ/EzGUBfwiEmQw=;
 b=fc4pGtThcYUqUumDa0iLH8hbA9TqxgyvYZ84AY47qHijmFkEvwcdJi+1Ef4GwHbmpZ
 jR5KPScyf63x8djUX09npML4sBV+0doz5zBPObFo1TRqyVWasysWN6QkKVRey6PFGYmL
 PKyuQzIBO/3m0tOkLjY6I370W0tFHWDVCR/osshBgM03CL/tjUMSSuyRRGKNH47brVxz
 FebKVJ8mvol/bWKteFVYx1V1wu355sIw+NZFDDMiZJOB6YxYGLbfijMc+frCiK5jCyvr
 Qpf2bVXChs7LTJydAIxGGAHkzWM3WfuylDny7mZxKxrTHFBZYrBM7Uoja8QKn6he4WN4
 6KtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=cn58q9KeE/RU2XDvOxFGGOuHBC6aWJ/EzGUBfwiEmQw=;
 b=GO+0VPtk/S+Xlpf/DTrB0SG+lQBcShWWwK4bgs38rwhgoy6zPtyj4qNzl0d5Nkj9ye
 wgCX/neiwJJhKUU0Z0+lxuySVo7nV+X99V8B/uN4KR9seVFTk5Iu0E3GWtx+oOYifW1r
 /39sbN5lNc6OD+Sf0V3a0glC05JtogJLO6BfKsJJFnF41ZHvQBF1jXxtfqvbOnPRvddh
 a8C2I70C1xee8lWFFglKL24HURj5EwC38TnFw8XEkdfe479Wi7a3B1GaTBaAiVF2kngH
 qip47DtsFzmC27iIjqp+PxNX5BtWaSZ3t2/L0bQTjZjOtAhOnNTwPoMt8qOxadOCCuXh
 wzcw==
X-Gm-Message-State: AOAM531sl2BXf0c4GrpNq3MxNmij9YtYuT//SYDFrT0I6f2ALKT99pld
 +pf/qIpZEnmAHOxbgVfxzMpoCQ==
X-Google-Smtp-Source: ABdhPJyFPXkHG7iWjJmlqktQzjuKaGiXFJm2WnsQlayQ/oQsyG2xEm33F7FucnWUyHmTjCs7hDiNjA==
X-Received: by 2002:a17:902:9a90:b029:da:ba07:efdc with SMTP id
 w16-20020a1709029a90b02900daba07efdcmr23831204plp.1.1608696262931; 
 Tue, 22 Dec 2020 20:04:22 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id z5sm21767236pff.44.2020.12.22.20.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 20:04:22 -0800 (PST)
Date: Tue, 22 Dec 2020 20:04:22 -0800 (PST)
X-Google-Original-Date: Tue, 22 Dec 2020 20:04:18 PST (-0800)
Subject: Re: [PATCH] riscv: return -ENOSYS for syscall -1
In-Reply-To: <20201222162219.GA710211@cisco>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tycho@tycho.pizza
Message-ID: <mhng-866c451a-5886-441b-9914-acc31fe9dc71@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_230428_114224_31423D0F 
X-CRM114-Status: GOOD (  20.50  )
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
Cc: david.abdurachmanov@sifive.com, schwab@suse.de,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 22 Dec 2020 08:22:19 PST (-0800), tycho@tycho.pizza wrote:
> On Mon, Dec 21, 2020 at 11:52:00PM +0100, Andreas Schwab wrote:
>> Properly return -ENOSYS for syscall -1 instead of leaving the return value
>> uninitialized.  This fixes the strace teststuite.
>>
>> Fixes: 5340627e3fe0 ("riscv: add support for SECCOMP and SECCOMP_FILTER")
>> Signed-off-by: Andreas Schwab <schwab@suse.de>
>> ---
>>  arch/riscv/kernel/entry.S | 9 +--------
>>  1 file changed, 1 insertion(+), 8 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>> index 524d918f3601..d07763001eb0 100644
>> --- a/arch/riscv/kernel/entry.S
>> +++ b/arch/riscv/kernel/entry.S
>> @@ -186,14 +186,7 @@ check_syscall_nr:
>>  	 * Syscall number held in a7.
>>  	 * If syscall number is above allowed value, redirect to ni_syscall.
>>  	 */
>> -	bge a7, t0, 1f
>> -	/*
>> -	 * Check if syscall is rejected by tracer, i.e., a7 == -1.
>> -	 * If yes, we pretend it was executed.
>> -	 */
>> -	li t1, -1
>> -	beq a7, t1, ret_from_syscall_rejected
>> -	blt a7, t1, 1f
>> +	bgeu a7, t0, 1f
>
> IIUC, this is all dead code anyway for the path where seccomp actually
> rejects the syscall, since it should do the rejection directly in
> handle_syscall_trace_enter(), which is called above this hunk. So it
> seems good to me.
>
> Reviewed-by: Tycho Andersen <tycho@tycho.pizza>

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
