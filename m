Return-Path: <SRS0=Qta6=KR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB781C2B9F2
	for <linux-riscv@archiver.kernel.org>; Sat, 22 May 2021 19:32:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E92F61164
	for <linux-riscv@archiver.kernel.org>; Sat, 22 May 2021 19:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E92F61164
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=0Oqeqh6YzAYAQOczllmul8c8yevhmAegXid2uFoufGg=; b=nVW/mIvr/bloGVVAEy+MBdIH70
	M6rd2bU6m+UEbECxH2WpPSQOOpu2KfN6ROKffYqwxY9biXp0qoIg5xocI6oxeaR1ZMRTdbZfOpd3t
	Tp8v4c5mLA4ZupLORybmMB5MoIWAB29PFZhyABoza6Ca/Nmi0nDCAXYomT+pztvEggsZioMHdCh0/
	FLYWPCreNapyV6ufc2hNq48k+/i701yqB0F+a8awQdlFmzf7MfB4xPx1KFgnHDUcxrtJgym0nnl7l
	iPClppm/Hc270u6RUeg6kqdAf2aAGnzANSUWOFSjfbhdhiFkRRAkJYmFN73qIhKh6P9A5Oe6Xa6Uz
	Q5/ubfNA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkXM9-002zKt-GW; Sat, 22 May 2021 19:32:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkXM6-002zKg-9I
 for linux-riscv@desiato.infradead.org; Sat, 22 May 2021 19:32:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:To:From:CC:In-Reply-To:
 Subject:Date:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:References;
 bh=etKYDS5uAQ5qqnzu2k3mx2BQc5MVAc3RoI6hB7aUSKk=; b=wt265+Ba+/nC0tcAepjuxvJXc2
 Ksgr0HScCQ2U4rWc0JIljI7JOBIzURzwP9ABCNjtTp+aTY/WxOX/q0GaMMDNZPsFZJauFa5XpQyr6
 yQpsDCFaCyWAo8Cvs3t0Y1ju36gcZdK0su22NyfE4Qi57iMEvouxNBWp23hn6EMSOdtVw6QArnGHa
 4fOFMgkWCXiwEfXGcCUQp2f8pJszmvKQmfCi6SlZaHQzQbux3mIjaf/8imi4fBbURsPHZNPn6ROUz
 bCVCAXj5+aXKRFHPxcORddVb8iCsOYFiOoXiPTXY9UAXrm1iuQs3mJQ7G93ejBFlwrSTGxaeg8I7s
 HlmCr7Nw==;
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkXM2-000BZj-PW
 for linux-riscv@lists.infradead.org; Sat, 22 May 2021 19:32:12 +0000
Received: by mail-pf1-x42e.google.com with SMTP id p39so1157088pfw.8
 for <linux-riscv@lists.infradead.org>; Sat, 22 May 2021 12:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id;
 bh=etKYDS5uAQ5qqnzu2k3mx2BQc5MVAc3RoI6hB7aUSKk=;
 b=ENtMtbXJvHpIe6sUlXwwIF/UuDDqjmxl4xHwoBSIxvz8H+WtuQqYeSUnAVHoRRLR51
 aZo+SZMeFygvoEeqeAVBI15qFcicW4qVx7rDbe9bV+EQaHukCvMNnuGnN6ZwfTh6RuOI
 7BJyL0MzbMOlTYPpIhbC7LEvntX6HXL1VOcEIfgB/QSh9NKYi5ETMftlt0hO2rqo1AMm
 w/K8ZtqtrhhQU3q6vHch/Aigk8QOnHBOHm4Bd/Rt2syl3J0voTMnNuDsAUsxKo4zcvB3
 XmSQaHIqOoJw6tAvOsHgxsrmUDcFj4ThsB4aLKZSFJgsAXAlLtNRhJwLN01HRIOD37s/
 GWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id;
 bh=etKYDS5uAQ5qqnzu2k3mx2BQc5MVAc3RoI6hB7aUSKk=;
 b=s8ZMwm0Sk/QRrYgjUWex8UFcVN/AQwsN+WKkM4JLW6Qugl4SGH0jnIFdm+yEhXPWun
 XKfrr4+YduM+wG5MK2RweUC4GmMSg/XJph0gPPb4kD3nviQ7lxZMocFRD2EOhBAFhEbV
 nRjD0ZxQwEiEsPajWAX+mL0iTifgJ+93kE+NGlIVDdN3VraolNYIxLhlU6op4qn2qYHy
 JNrvVLYTW/2RUHWb1TJLCXCk+eJBRXf58SKuoQm5M71QO3pMAD+lgEO8oOxAEN/b2Okq
 JOkG3Ls+VN3KpNdAhu+e110YrbS6a4lne8gM1vwKwef36cvpQM5xJT4P2Gyk0Oo34A39
 1wQg==
X-Gm-Message-State: AOAM533UO7z9ffGWWqRH7WFj1jKIGeYZZd5lOQ3GeC9yty6uonHnrL6u
 C/NTLghE/KyChKcbfrSm4yNi8IOsN7MYWg==
X-Google-Smtp-Source: ABdhPJxT2VRDTaqQDATEmQAvfGBKRdVYoqTMZXQ0n27UEKf7Co7J0c9f9cgqRHBs0EGTLm/r++s3xQ==
X-Received: by 2002:a63:d40d:: with SMTP id a13mr5503703pgh.382.1621711925684; 
 Sat, 22 May 2021 12:32:05 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id f2sm7517956pgl.67.2021.05.22.12.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 May 2021 12:32:05 -0700 (PDT)
Date: Sat, 22 May 2021 12:32:05 -0700 (PDT)
X-Google-Original-Date: Sat, 22 May 2021 12:31:58 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Don't check text_mutex during stop_machine
In-Reply-To: <20210506092550.6c2206b3@gandalf.local.home>
CC: linux-riscv@lists.infradead.org, mingo@redhat.com,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 mhiramat@kernel.org, zong.li@sifive.com, 
 guoren@linux.alibaba.com, Atish Patra <Atish.Patra@wdc.com>,
 linux-kernel@vger.kernel.org, 
 kernel-team@android.com, changbin.du@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rostedt@goodmis.org
Message-ID: <mhng-edd9e8bd-e585-4b6b-8e40-797215bfdf75@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210522_123210_858576_789748E9 
X-CRM114-Status: GOOD (  35.16  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 06 May 2021 06:25:50 PDT (-0700), rostedt@goodmis.org wrote:
> On Thu,  6 May 2021 00:10:41 -0700
> Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
>> ---
>> In theory we should be able to avoid using stop_machine() with some
>> clever code sequences, but that's too big of a change to be considered a
>> fix.  I also can't find the text I thought was in the ISA manual about
>> the allowed behaviors for concurrent modification of the instruction
>> stream, so I might have just mis-remembered that.
>> ---
>
> I wonder if you could at least use break points, as some other archs do,
> and what x86 does.
>
> If you have this make believe machine code:
>
> 	00 00 00 00		nop
>
> And you want to turn it into a call.
>
> 	aa 12 34 56		bl ftrace_caller
>
> And if your architecture has a way to inject a break point on live code.
> Let's call this FF for the break point code.
>
> You can inject that first:
>
> 	FF 00 00 00

That would rely on this "concurrent writes to the instruction stream 
don't tear" property that I thought we'd put in the ISA but I can't 
actually find in the text of the document.  That said, I hadn't actually 
thought about replacing single bytes in the instruction stream.  In 
theory we don't have anything that guartees those won't tear, but I'm 
not sure how any reasonable implementation would go about manifesting 
those so it might be an easy retrofit to the ISA.

I ran through our breakpoint encodings and don't think those help, but 
we do have 0x00000013 as a NOP (addi x0, x0, 0) which is one byte away 
from 0x00000000 (which is defined to be an invalid instruction on all 
RISC-V systems).  There's really no difference between how a breakpoint 
traps and how an illegal instruction traps on RISC-V, so we should be 
able to use that to construct some sort of sequence.

So we can start with

    nop
    nop
    nop
    nop
    nop

then do a single-byte write to turn it into

    unimp
    nop
    nop
    nop
    nop

we can then IPI to all the harts in order to get them on the same page 
about that trap, which we can then skip over.  We'll need some way to 
differentiate this from accidental executions of unimp, but we can just 
build up a table somewhere (it wasn't immediately clear how x86 does 
this).  Then we have no ordering restrictions on converting the rest of 
the stub into what's necessary to trace a function, which should look 
the same as what we have now

    unimp
    save ra, ...(sp)
    auipc ra, ...
    jalr ra, ...
    load ra, ...(sp)

At which point we can IPI everywhere to sync the instructions stream 
again, before we turn off the trap

    nop
    save ra, ...(sp)
    auipc ra, ...
    jalr ra, ...
    load ra, ...(sp)

> sync all CPUs where now all callers will hit this and jump to the break
> point handler, which simply does:
>
> 	ip = ip + 4;
> 	return;
>
> and returns back to the instruction after this nop/call.

There'll be some slight headaches there because the length of the all-0 
unimplemented instruction depends on which extensions are supported, but 
we can detect ILEN at runtime so that shouldn't be a showstopper.

> Change the rest of the instruction.
>
> 	FF 12 34 56
>
> sync all CPUs so that they all see this new instruction, but are still
> triggering the break point.
>
> Then finally remove the break point.
>
> 	aa 12 34 56
>
> And you just switched from the nop to the call without using stop machine.

OK, ya I think that all should work.  We're still depending on this 
"single byte writes to the instruction stream don't tear" guarantee, but 
I think that's a bit pedantic.  I'll open a question on the ISA spec 
just to be sure one I can link here.

I'm probably not going to have the time to do this for a bit because I'm 
buried in this non-coherent stuff, but if someone wants to take a shot 
at it I'd be happy to take a look.

Thanks for pointing this out, this should get is away from 
stop_machine() way sooner than waiting for a multi-byte modification 
sequence would!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
