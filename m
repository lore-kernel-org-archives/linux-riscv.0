Return-Path: <SRS0=kFy7=CD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D19FC433E3
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 00:30:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5672207D8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 00:30:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bmNFGVWf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="c4ZZgQ2Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5672207D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=KzJLCExnsvJkUKQM6aqC9UyTYcDws+0FJjYqL/BImc0=; b=bmNFGVWfXE2TQvMGDW6UWyfyd
	fiJYHrkvoCK/p32TN9KEp8LQ9DYnISv/eSYKQRM10MWbhuHiOmDjGCzcBFA5cSRKTnfSDLke5QGTW
	c5g3euKt7vxPhD12xsZPdXY0Dv0wAhHDjluuR2V+2Rsqb7cg3DLTxFdCY3QxveNrV8wWGyjKD3Ro6
	X7OHRrL47kQiW2JtG2uauvS27uJCy+dInjlnB26NiAirroppNEdZsHvf2HU8UdYAJIEOf+iQTen9g
	dcs3ZCFQv7WjJvvAdv4cvCYxi4msGBh3JFR5uzI6ZDBdNzzpQSOW61zEvTAyl8CmoX/f3Jo9zOHnL
	U/ySLi3+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAMqU-0004NO-TU; Tue, 25 Aug 2020 00:29:50 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAMqH-0004C3-RP
 for linux-riscv@lists.infradead.org; Tue, 25 Aug 2020 00:29:48 +0000
Received: by mail-pf1-x442.google.com with SMTP id u128so5931355pfb.6
 for <linux-riscv@lists.infradead.org>; Mon, 24 Aug 2020 17:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=rK9hGhgXVC8NPfqVY3Kpb9dQwJZSivpy8q2Mup6dtSM=;
 b=c4ZZgQ2YaOyAq7e5T+tyFU0xqMufACY+Y4SnbIlMwiY/5sKjRW9L+obI/uA+5stwVq
 JHkc5gnYKmKcZpu+NiFL8tXyLRyHW51aSKG5zmYRQHrPXaVIuq5NgouoW4qDOmWehjqd
 zj16E4/59kSSYwyPHHVeVxpg9v3KtL3+FOfjWUB1RdcCArxJqS3i1lVzSKgQ3yw2YL9M
 Z6pcqkvhHkvgQgG7oLp3n1p0Syg9AhEy+QWNtmtUU3R1boenHXU67c55myRV+Wm8XHos
 McZfUvW3KGoL+k2BVCKHx3Y3+49MLogFiC5xStqzaBZh/NGJ2gpPhZWsGXD2nq0l5LFg
 wLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=rK9hGhgXVC8NPfqVY3Kpb9dQwJZSivpy8q2Mup6dtSM=;
 b=CC65IfNUJq/6mSTKw+OQBzdIR69B5Fi++Jj60L8UZHcoLCmmBKBZxuNq92LHTorz6O
 4QIXNGR/HzjbRHTg0PEEFaExJIKpTpk9XwKwPJLo0pu0Ejo1+SiU1vGswyA2U+2jAngy
 oKs7bWqiWR45s9Eop2bfsGbLK3Zh7bqY6+kPCBc3HsC68BJ7tnpsybdq1IlQg0Rf6Q0R
 KzQUwPf8zaCPdHsae611euYQOb1g3HiN0kuEZrjzFdt2StGF3qsR8BGUXOZAqrV4Jzt+
 7AxtT56o9Qv2BGZUd7kZRokAYvZoGRKkta/EGXhPYxfmPfsegrLIwdQfrXhZQziHFxvV
 IZBQ==
X-Gm-Message-State: AOAM5302RBnXm00Rtu6KiiaZVFnatp2jSHbGRTwo3guQq+7amt5us0ZH
 jA/lbD7InoxZn1FKS6yjm/pgWQ==
X-Google-Smtp-Source: ABdhPJw/jqpwfLOw3R6pkLUIZZ4Ecso+LA6G75jVVfmfWTR2dmWId+wwLT6HnFSbtT7bjTfvJeyROw==
X-Received: by 2002:aa7:9aa2:: with SMTP id x2mr6097798pfi.318.1598315373559; 
 Mon, 24 Aug 2020 17:29:33 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w130sm12707231pfd.104.2020.08.24.17.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 17:29:32 -0700 (PDT)
Date: Mon, 24 Aug 2020 17:29:32 -0700 (PDT)
X-Google-Original-Date: Mon, 24 Aug 2020 17:29:28 PDT (-0700)
Subject: Re: [PATCH] ftrace: Fixup lockdep assert held of text_mutex
In-Reply-To: <20200813113743.001b6c31@oasis.local.home>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rostedt@goodmis.org
Message-ID: <mhng-5de4c6ca-7e77-4b55-9097-59296872e6de@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_202938_122630_2FD7BA56 
X-CRM114-Status: GOOD (  32.51  )
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
Cc: guoren@linux.alibaba.com, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, mingo@redhat.com, guoren@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 13 Aug 2020 08:37:43 PDT (-0700), rostedt@goodmis.org wrote:
> On Wed, 12 Aug 2020 22:13:19 -0700 (PDT)
> Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
>> Sorry, I'm not really sure what's going on here.  I'm not really seeing code
>> that matches this in our port right now, so maybe this is aginst some other
>> tree?  If it's the RISC-V kprobes patch set then I was hoping to take a look at
>> that tomorrow (or I guess a bit earlier this week, but I had some surprise work
>> stuff to do).  IIRC there were a handful of races in the last patch set I saw,
>> but it's been a while so I don't remember for sure.
>>
>> That said, I certainly wouldn't be surprised if there's a locking bug in our
>> ftrace stuff.  It'd be way easier for me to figure out what's going on if you
>> have a concrete suggestion as to how to fix the issues -- even if it's just a
>> workaround.
>
> The issue is actually quite basic.
>
> ftrace_init_nop() is called quite early in boot up and never called
> again. It's called before SMP is set up, so it's on a single CPU, and
> no worries about synchronization with other CPUs is needed.
>
> On x86, it is called before text_poke() is initialized (which is used
> to synchronize code updates across CPUs), and thus can't be called.
> There's a "text_poke_early()" that is used instead, which is basically
> just a memcpy().
>
> Now, if ftrace_init_nop() is not defined by the architecture, it is a
> simple call to ftrace_make_nop(), which is also used to disable ftrace
> callbacks.
>
> The issue is that we have the following path on riscv:
>
>  ftrace_init_nop()
>    ftrace_make_nop()
>      __ftrace_modify_call()
>        patch_text_nosync()
>          patch_insn_write()
>            lockdep_assert_held(&text_mutex);
>
> Boom! text_mutex is not held, and lockdep complains.
>
>
> The difference between ftrace_make_nop() being called by
> ftrace_init_nop() and being called later to disable function tracing is
> that the latter will have:
>
>
> 	ftrace_arch_code_modify_prepare();
> 	[..]
> 	ftrace_make_nop();
> 	[..]
> 	ftrace_arch_code_modify_post_process();
>
> and the former will not have those called.
>
> On x86, we handle the two different cases with:
>
>
> static int ftrace_poke_late = 0;
>
> int ftrace_arch_code_modify_prepare(void)
> {
> 	mutex_lock(&text_mutex);
> 	ftrace_poke_late = 1;
> 	return 0;
> }
>
> int ftrace_arch_code_modify_post_process(void)
> {
> 	text_poke_finish();
> 	ftrace_poke_late = 0;
> 	mutex_unlock(&text_mutex);
> }
>
> Although, the post_process() probably doesn't even need to set
> ftrace_poke_late back to zero.
>
> Then in ftrace_make_nop(), we have:
>
>   ftrace_make_nop()
>     ftrace_modify_code_direct()
>       if (ftrace_poke_late)
>         text_poke_queue(...); // this checks if text_mutex is held
>       else
>         text_poke_early(...); // is basically just memcpy, no test on text_mutex.
>
> The two solutions for riscv, is either to implement the same thing as
> above, or you can create your own ftrace_init_nop() to take the
> text_mutex before calling ftrace_make_nop(), and that should work too.

Ya, thanks, that's a pretty straight-forward issue.  I've To'd you on a patch,
but it's essentially just exactly what you suggested so I doubt it's that
interesting.

I pointed out in the patch notes that it seems reasonable to have the generic
code handle this case, would you be opposed to doing it that way?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
