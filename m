Return-Path: <SRS0=VC1f=KB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7580C433B4
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 07:12:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26DE460232
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 07:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26DE460232
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=+vV0usO2oH7AF5GjcDT5ZSbl8SeY4HHs81g9sZZZx7M=; b=U/V4wjqiBGGG31RUDyrOavr0g
	KgQToR737h7Fnpar23L0lCZH9WzuemQPDWUh1dkOaEhgIl2XTdZp0aHsADixW7qxGEnZNYo6msmn7
	80jQ4KLrTCf+MCkPFZ5Ea6FD9MFjaMJ/miLhS5YZMnYDXrTu/3ajQJracVHiq+u4dOA9TL4DUUvPi
	sMpWZLH1hkisTwGSAwtuYi0/t1ocqqos1CIkOds+qWHp7gslj8gRjKtc/jLV9jLxb7h9Pce5KYqHq
	kpk1pHLM3bQsv5+kko63u2XdEP87TUov5DiUkzti7e78yHrO0k9fa/pjfFGEGojpbhaOAdWgFIXxG
	oJ7ioGsQA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leYAe-003RoW-3X; Thu, 06 May 2021 07:11:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leYAZ-003RnY-QX
 for linux-riscv@desiato.infradead.org; Thu, 06 May 2021 07:11:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=9ypg5c6MOAqzsS7CxmmS3kas8+OOs5J41FOXrsXLyMA=; b=fu6om+xAfdHpKtCr9AUMWDKDOV
 7EfVk80az33ThPBO/ef96ms4VHTDI/B7ebHOsf+feWMQdY1CYKseZcon7roLClQ8gdOLMGqP4AB46
 JiAsrgzKUVTE7CidFWGvC8p2bQicXys9Az9tYEJ/uzZ+NBQM6gBQLtc6uAmkXQqHCApahcL5y/Mfx
 MZ9aU5WItD4SrZALMjXwDcahqsiYhUdE+nycp+JDfwPXwlXYwCwg3ubY9ClVwxoFpx0qVEWNkn3Q8
 Jt4fQY4DXE0RwA4dYMfy/mjKjntSdBHn1A05rySdwX0oAdgzSvC3/lAHXkb3kITYGSxm8TzZOnvAo
 KmPHlMWg==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leYAX-005emX-5P
 for linux-riscv@lists.infradead.org; Thu, 06 May 2021 07:11:34 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 cl24-20020a17090af698b0290157efd14899so2959893pjb.2
 for <linux-riscv@lists.infradead.org>; Thu, 06 May 2021 00:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=9ypg5c6MOAqzsS7CxmmS3kas8+OOs5J41FOXrsXLyMA=;
 b=pimC6SNQfwwV1A/7teF0rBbZCIvJBHIk3nI/FTZW1rIMK42e57LWtDVFrOfDkpOak3
 fEEMsW/FcsRwrQv/fixflPyhTT11olpZ4NT2ajJjbjFGAxE6s/IfcPz9aDjdac1NmZwp
 zGTRkKDJpPClTcCijZ0/rIX00y9sqlPljv6+v9BMMOp4HJpk4C6fAIT2JxzF+HC60J/u
 tAGQFRPj6Q46OpuFhQeO7DGhN+4eNwJmePKtJXUEMsm3D78LA968Y5LnqBzgnbVOd1WC
 7YxPcbAgO434kLHeYHt9qpBqnNPtqfA//iK8NO7pYRFHZ05w6aAQX9J/7cJVv+9DXx5M
 g+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=9ypg5c6MOAqzsS7CxmmS3kas8+OOs5J41FOXrsXLyMA=;
 b=tuegU6gq7thK0QITpHGqeRlbmwWfqtEraqUoOKUmlX4pL1plp3Fg++bUgUpyXuKNI/
 aevrzauV6iBI341SoLzyFXIMHUE56gbBU7r9nWT7RkPUMvsfh2MjCkeHPJNIfYPbEXWt
 tNltzncBobnExqLKCw9esOAn5D9aJQifEbPMXFRE6G+LZMuBKC+l/9UfwO2lmRCCCEf4
 QrOiEeC4f0IBnhiZnOfc6XA5u/1r1Mvm10FfL/8pLxl37G3ZcgZFlmgWJC2y99sFN+pr
 Y9FgBTZDQZtqtamW2USn3y3qB6keK9q98i8J2kbsUKNG+XKA1fKQ3BMwYYeBaP9lvZ4K
 g6cQ==
X-Gm-Message-State: AOAM5313u4SVElN+Gaq3O5oaLYWg/wiZ37PdiDqSf9Oi2GxF0l8RwbyW
 99uJTK+EYTpje3vauZ87gLtHHg==
X-Google-Smtp-Source: ABdhPJxf2ZuzWR6KCVivm+jms8uWGnTwz+EWrQxN7mdrJPcJcT/JJmRO4O91kbQ4LJDaH+BA+OuwSw==
X-Received: by 2002:a17:90a:6345:: with SMTP id
 v5mr9278882pjs.139.1620285090692; 
 Thu, 06 May 2021 00:11:30 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id g18sm1275741pfb.178.2021.05.06.00.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 00:11:30 -0700 (PDT)
Date: Thu, 06 May 2021 00:11:30 -0700 (PDT)
X-Google-Original-Date: Thu, 06 May 2021 00:02:03 PDT (-0700)
Subject: Re: [PATCH] RISC-V: insn: Use a raw spinlock to protect TEXT_POKE*
In-Reply-To: <mhng-dbd1fd8c-37f7-4b60-a61e-3f8d22e5baf0@palmerdabbelt-glaptop>
CC: Anup Patel <Anup.Patel@wdc.com>, changbin.du@gmail.com,
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 peterz@infradead.org, jpoimboe@redhat.com, jbaron@akamai.com, ardb@kernel.org, 
 Atish Patra <Atish.Patra@wdc.com>, akpm@linux-foundation.org, rppt@kernel.org,
 mhiramat@kernel.org, 
 zong.li@sifive.com, guoren@linux.alibaba.com, wangkefeng.wang@huawei.com,
 0x7f454c46@gmail.com, 
 chenhuang5@huawei.com, linux-kernel@vger.kernel.org, kernel-team@android.com
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: rostedt@goodmis.org
Message-ID: <mhng-08581a54-f9c8-4119-97bb-a9be86f19e41@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_001133_248800_A9DD1899 
X-CRM114-Status: GOOD (  19.91  )
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

On Fri, 30 Apr 2021 12:44:37 PDT (-0700), Palmer Dabbelt wrote:
> On Fri, 30 Apr 2021 04:34:31 PDT (-0700), rostedt@goodmis.org wrote:
>> On Fri, 30 Apr 2021 04:06:35 +0000
>> Anup Patel <Anup.Patel@wdc.com> wrote:
>>
>>> This patch only takes care of ftrace path.
>>>
>>> The RISC-V instruction patching is used by RISC-V jump label implementation
>>> as well and will called from various critical parts of core kernel.
>>>
>>> The RAW spinlock approach allows same instruction patching to be used
>>> for kprobes, ftrace, and jump label.
>>
>> So what path hits this outside of stop machine?
>
> I didn't actually dig through all the usages of jump_label, I just saw a
> handful in places where it's generally not sane to assume that sleeping
> is safe -- for example, thoughout kernel/sched.  If you think it's OK to
> rely on users of the static branch stuff (IIUC the only jump_label user
> in the kernel?) to know that it can sleep then I'm fine keeping the
> text_mutex call in jump_label and adding one to ftrace (I'm fine with
> something generic, but it's simple to do in arch/riscv).
>
> IMO if the static branch stuff can be expected to sleep it'd be good to
> call that out in the documentation, and I'd like to audit the uses
> before committing to that.  I'm happy to do that, we can just take the
> lock in arch/riscv's frace code for now to get around the lockdep
> assertion failure -- IIUC that's indicating a real bug, as nothing in
> ftrace avoids concurrency with jump_label and kprobes.

Turns out I'd actually opened the wrong thread and was looking at a 
stack trace from a bur reported a year ago, which is why nothing I was 
saying here makes any sense.  That bug has already been fixed, I have a 
proper fix for this one.  It turns out to be almost exactly the same as 
something Steven suggested in this thread.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
