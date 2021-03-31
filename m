Return-Path: <SRS0=kAis=I5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DEF9C433C1
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 05:33:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E127619D6
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 05:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E127619D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=covL0nOVlg6SUP91Eikje3kYp5TMciyYbrskg3fmICE=; b=E19zc32RjfIvE0nx75LutmTtD
	5slY75Bw9WBBKpSSa8gZaNuTzp6NRe01DJeT4FgZmzg/rftwi3oD8nIKyyW473uxw9uoPdWU1Atbe
	ql5d2vE3aXhpWuBDELqvt92HsKzcPdbBTELArISwOI8Zm1e98hRwob4UrWRQNeOwL4K84u7Vdj92m
	JsKtYysNUgkmei4CTyLJah7YMpHRA9FIVRTtKTSkDmMZhaNEZXBOOCmvBwIlDCtqcqMG1WncAJ+ks
	5flYUKYRQ1NTn7bH1Utaw3U9TYzy0B2Bri1zbn5nwBCQVOg62HkCboRdjbcc0sW4e62pJG5wEgk1X
	AWu9TkwjA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRTTq-005XgS-Q7; Wed, 31 Mar 2021 05:33:26 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRTTk-005XfM-8a
 for linux-riscv@lists.infradead.org; Wed, 31 Mar 2021 05:33:23 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso631374pjh.2
 for <linux-riscv@lists.infradead.org>; Tue, 30 Mar 2021 22:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:organization:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FXgyDK8HaAZ+Nc4iB+GC6jvOWWlR3QxAnX+r+74mycw=;
 b=WojBFC/jd/BJWPXfRIuEsMiF5Z1TVSvCgju7IUpBWGuzOlLkM6KdCcNrD1HvwbeVLU
 sHIyEO45ILd6GHJt0ZxsOfxbhz5BqEaQBMMMTrnGwHSE/QJa8kqLTqCVmYVleuYDu60g
 gJfSK57NpaFWngP+Wcg7zcbhfWA/61MXwOy1wLiAMSRsr9maNjwR0nkAMOb9WHzEg3Be
 jko8RNKLNRZUtLaVuSVNB1CQZKj3yiL0sFZNoSw9Mfpo9dbLL1R4jicLEIGycw0vwbFu
 hhiB0VxcLzn4czYME/gnOEHaVGJknQgqiYWbflUwMRl+lntt8PLoFv201e+yf/3gDxCQ
 CkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:organization
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FXgyDK8HaAZ+Nc4iB+GC6jvOWWlR3QxAnX+r+74mycw=;
 b=Ja5c1kCV6G2WwI34pWQ1yK7SFkrVHIcZWyBxYP/78ywyZpvaii8qXzCv/aYrLc7HHy
 rhNSWYETEAn/0+5Qwu4QKA33rJPVf81oTCpti2+9qkConlpb2/o4NwsVuPMT5eDgAGbj
 qlqBGiGejLDmNt0kOesP4WjXeHZ/+2GXNZAQUum8VJmWS8ALS+VmK9g+j58n3Un1hfYf
 tqQ+euU+P2LIC33CcD2u7TMV4TdV5/0ElH2NkuPsI9KThkMWufjSg53USa/jKTaeJxnF
 iSForhcLjZyPaz045Uo/QS4JygCOr46e0f/lT3xaVPmbUcGa9ZVREyohqRo5Co9oDwi4
 5GwA==
X-Gm-Message-State: AOAM532sAS/cbnygp9yJz9z4YJ/3d8nWwdKCHJhZzYa/uh4m+wg0OMRk
 2L9ElcYRd+iBJQJzAgPoObLlxh93FgMZB2YJ
X-Google-Smtp-Source: ABdhPJyCJ2tQgtsy3Hs4dSWT7ZLW7WoOXoxU9abeyHdakOvY7DeC47ipXFHFloPMfMWmgniWXjoEyA==
X-Received: by 2002:a17:90a:fe93:: with SMTP id
 co19mr1810470pjb.142.1617168795740; 
 Tue, 30 Mar 2021 22:33:15 -0700 (PDT)
Received: from rata.localnet (fred.taniwha.com. [203.86.204.69])
 by smtp.gmail.com with ESMTPSA id y66sm974623pgb.78.2021.03.30.22.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 22:33:15 -0700 (PDT)
From: Paul Campbell <taniwha@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org
Cc: Peter Zijlstra <peterz@infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-arch <linux-arch@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Anup Patel <anup@brainfault.org>,
 Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
 Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Date: Wed, 31 Mar 2021 18:33:07 +1300
Message-ID: <1706037.TLkxdtWsSY@rata>
Organization: Moonbase Otago
In-Reply-To: <CAJF2gTSGLn7katm6YAtkKWJcQRqw36_yqn+aK1pKUSRM5V1zUg@mail.gmail.com>
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <CAK8P3a0DkbM=4oBBhA2DWvzMV7DwN1sqOU8Wa1qFtpd_w7iWmQ@mail.gmail.com>
 <CAJF2gTSGLn7katm6YAtkKWJcQRqw36_yqn+aK1pKUSRM5V1zUg@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_063320_972716_C90B4563 
X-CRM114-Status: GOOD (  28.13  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wednesday, 31 March 2021 5:18:56 PM NZDT Guo Ren wrote:
> > > [1]
> > > https://github.com/c-sky/csky-linux/commit/e837aad23148542771794d8a2fcc
> > > 52afd0fcbf88> > 
> > > > It also seems that the current "amoswap" based implementation
> > > > would be reliable independent of RsrvEventual/RsrvNonEventual.
> > > 
> > > Yes, the hardware implementation of AMO could be different from LR/SC.
> > > AMO could use ACE snoop holding to lock the bus in hw coherency
> > > design, but LR/SC uses an exclusive monitor without locking the bus.
> > > 
> > > RISC-V hasn't CAS instructions, and it uses LR/SC for cmpxchg. I don't
> > > think LR/SC would be slower than CAS, and CAS is just good for code
> > > size.
> > 
> > What I meant here is that the current spinlock uses a simple amoswap,
> > which presumably does not suffer from the lack of forward process you
> > described.
> 
> Does that mean we should prevent using LR/SC (if RsrvNonEventual)?

Let me provide another data-point, I'm working on a high-end highly 
speculative implementation with many concurrent instructions in flight - from 
my point of view  both sorts of AMO (LR/SC and swap/add/etc) require me to 
grab a cache line in an exclusive modifiable state (so no difference there).

More importantly both sorts of AMO instructions  (unlike most loads and 
stores) can't be speculated (not even LR because it changes hidden state, I 
found this out the hard way bringing up the kernel).

This means that both LR AND SC individually can't be executed until all 
speculation is resolved (that means that they happen really late in the 
execute path and block the resolution of the speculation of subsequent 
instructions) - equally a single amoswap/add/etc instruction can't happen 
until late in the execute path - so both require the same cache line state, 
but one of these sorts of events is better than two of them.

Which in short means that amoswap/add/etc is better for small things - small 
buzzy lock loops, while LR/SC is better for more complex things with actual 
processing between the LR and SC.

----

Another issue here is to consider is what happens when you hit one of these 
tight spinlocks when the branch target cache is empty and they fail (ie loop 
back and try again) - the default branch prediction, and resulting 
speculation, is (very) likely to be looping back, while hopefully most locks 
are not contended when you hit them and that speculation would be wrong - a 
spinlock like this may not be so good:

	li a0, 1
loop: 
	amoswap	a1, a0, (a2)
	beqz	a1, loop
	..... subsequent code

In my world with no BTC info the pipe fills with dozens of amoswaps, rather 
than  the 'subsequent code'. While (in my world) code like this:

	li a0, 1
loop: 
	amoswap	a1, a0, (a2)
	bnez	a1, 1f
	.... subsequent code

1:	j loop

would actually be better (in my world unconditional jump instructions are 
folded early and never see execution so they're sort of free, though they mess 
with the issue/decode rate). Smart compilers could move the "j loop" out of 
the way, while the double branch on failure is not a big deal since either the 
lock is still held (and you don't care if it's slow) or it's been released in 
which case the cache line has been stolen and the refetch of that cache line 
is going to dominate the next time around the loop

I need to stress here that this is how my architecture works, other's will of 
course be different though I expect that other heavily speculative 
architectures to have similar issues :-)

	Paul Campbell
	Moonbase Otago




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
