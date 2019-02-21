Return-Path: <SRS0=eaTI=Q4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C8FAC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Feb 2019 19:40:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 568C92080F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Feb 2019 19:40:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K/leaWDw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="P1Hnfx/S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 568C92080F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Mime-Version:Message-ID:To:From:In-Reply-To:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=BX3v8HQSqEcozKgpEvggKbf0T8FS1rBKH4ltq7yM26I=; b=K/leaWDw7lcYny
	T1TtKoalODETjcFauk0NtZtRFqukCI02WYV+mjUnJa6LIYl/yqEZA6PTfUdidEqjVNGXmaljEKGgy
	+e1PjsJGP2eugYkT2xPDo3I6gYRuUzkKDP9hW6JD6QRPbgdsNwtjMCzC+xIoEXTqvcxvipOKMkRVE
	slOs8FBs8y0y0teb3He3Lwyb+kVhcoWkJ1TO13GFtiNmxnU5oONCxI8EH6iM+8and6C6xWmjGl1rh
	DCZawlAkmFvaBlSh5ZixsAKjNA2dA3vUMLjqgoWxfOZ5/TVMxugcVLVWy89Z7zgPirJWvtUraqsmM
	7tOgfFkNU33E8QT1qqnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwuCi-0004gP-95; Thu, 21 Feb 2019 19:40:20 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwuCe-0004g0-SS
 for linux-riscv@lists.infradead.org; Thu, 21 Feb 2019 19:40:18 +0000
Received: by mail-pf1-x42c.google.com with SMTP id n22so14229118pfa.3
 for <linux-riscv@lists.infradead.org>; Thu, 21 Feb 2019 11:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=RWAEIYhx+/N+CCkknxBJRHgwAloH2sksCH2m7KJ+psE=;
 b=P1Hnfx/SUP9gfAiAttOSTAuvbyRK5VssFNr2tF5Q4EdKBdoECufEdHsmIsUp+zpj3w
 db7/4QHNdouzZfyqEE7LTifYvx++po4S3U2i32WG3Q0IExAquInzwtuxJajlj7n4StHK
 xuzMMEe2cbU9sfQIhch1oUHw++g1QEaGXM4XM3VvxXwKVTpwEgmEOG7LEgeCwq/vKA6G
 QPXBEG7S7QCZ5k+PYwILSZlDDIGlzA0yOZcz0PoZI22Rt3eUJcM2O2at/6JKwxh3r1y9
 9lyD+cAUdACXmke1fa6f0AwW1IERQ3O9ZqD2fWXyFdVUQzyZrqngOpNcjkfsBQaYQqrA
 2u3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=RWAEIYhx+/N+CCkknxBJRHgwAloH2sksCH2m7KJ+psE=;
 b=DfqizqTaWEuHSIQ9TIu+j8pdM4XnuGOM5R1kPUSAlTzVkTkqtjZz59XRETE+/1Zk4K
 zCLRAUJmX/I0HMCh3mupdwzn95pM39LxQ7Gxuj/4AOqtVR0qOFv76yxfFdtsh6eMjEp3
 jwuNruZXjo4uk/Dw+vZ6Xxq63IryCzyfrXuRI6XIebWvBDB/zIIY1VkdpdH4yFolvlub
 j0LkUnXyKUMdRpof7leEqVgoyX9W5FXuTSrzjqMONOvjPPhbd8pxiPptm7YTSEnFrbIH
 WabsfpVxqEL7bsyYp3UJ38sogc4SzY1EQRaVeq/gX6UIC8AjHq6h65ZaG9eStlxtFkcX
 gv2Q==
X-Gm-Message-State: AHQUAuaCNCxIKchlvCzViGbr0s0oheWu2WpERY0Uev9nLQB9USVq6qwH
 XkTeyhjJb34MauOXcKZvW9KmAA==
X-Google-Smtp-Source: AHgI3IZ4upbGzZRnAmzvEgnfQioBSj8F3hWWcDpXtnqfuQwjVsITc/rO13R19c9tBgjsjyN6MO4AOA==
X-Received: by 2002:aa7:83c6:: with SMTP id j6mr174343pfn.91.1550778015296;
 Thu, 21 Feb 2019 11:40:15 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id q21sm55734579pfq.138.2019.02.21.11.40.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Feb 2019 11:40:14 -0800 (PST)
Date: Thu, 21 Feb 2019 11:40:14 -0800 (PST)
X-Google-Original-Date: Thu, 21 Feb 2019 11:40:11 PST (-0800)
Subject: Re: per-cpu thoughts
In-Reply-To: <alpine.DEB.2.21.999.1902211740020.8433@utopia.booyaka.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: paul@pwsan.com
Message-ID: <mhng-840b0a81-50e1-4783-a784-638195b9305b@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_114017_045042_07D87BF4 
X-CRM114-Status: GOOD (  19.51  )
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
Cc: bjorn.topel@gmail.com, linux-riscv@lists.infradead.org, cl@linux.com
Content-Type: multipart/mixed; boundary="===============2134467659150629449=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2134467659150629449==
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 21 Feb 2019 09:49:13 PST (-0800), paul@pwsan.com wrote:
>
> On Thu, 21 Feb 2019, Björn Töpel wrote:
>
>> On Thu, 21 Feb 2019 at 17:28, Paul Walmsley <paul@pwsan.com> wrote:
>> >
>> > On Wed, 20 Feb 2019, Björn Töpel wrote:
>> >
>> > > Christopher mentioned "per-cpu atomicity" in his Plumbers RISC-V HPC
>> > > talk [1]. Typically, this would be for the per-cpu implementation in
>> > > Linux, so I had a look at the current implementation.
>> > >
>> > > I noticed that RISC-V currently uses the generic one. Has there been
>> > > any work on moving to a RISC-V specific impl, based on the
>> > > A-extensions, similar to what aarch64 does? Would that make sense?
>> >
>> > Yes doing a RISC-V implementation with the AMO instructions would make
>> > sense.  Care to take that on?
>> >
>>
>> Yeah, I'll take a stab at it! I guess AMO is in general favored over
>> the LL/SC path, correct?
>
> Yes.  I think our current plan is to only support cores with the
> A-extension in upstream Linux.  Between LR/SC and atomics, the atomics
> would be preferred.  As Christoph wrote, using an atomic add avoids the
> fail/retry risk inherent in an LR/SC sequence, and is easier to optimize
> in microarchitecture.

We already mandate the A extension in Linux, and there's already a handful of 
places where the kernel won't build without A.  We used to have support for 
SMP=n systems that didn't have the A extension, but as part of the glibc 
upstream port submission we removed that support because it wasn't done the 
right way.  We've always sort of left the door open for this, but nobody has 
expressed interest in doing the legwork yet.

That said, it's all a moot point here: our LR/SC instructions are part of the A 
extension, so if you have those you have AMOs.  The general policy here is that 
if there is an AMO that efficiently implements what you're looking for then it 
should be preferred to an LR/SC sequence.  This specific case is actually one 
of the places where AMOs have a big benefit as opposed to LR/SC sequences, with 
the AMO implementation looking roughly like

    li t0, 1
    la t1, counter
    amoadd.w zero, t0, 0(t1)

The amoadd will increment that counter without writing the old value back, and 
since there the AQ and RL bits aren't set it enforces the minimum possible 
memory ordering constraints (ie, it's still correct for subsequent loads/stores 
but that's about it).  Like Paul said, this is way easier for a 
microarchitecture to deal with than the equivalent LR/SC sequence, which would 
look something like:

     la t0, counter
     1: lr.w t1, 0(t0)
     addi t1, t1, 1
     sc.w t1, t1, 0(t0)
     bnez t1, 1b

Specifically, that requires materializing the old value of the counter in t1 at 
some point during execution, even if it's later overwritten.  Converting this 
sequence to a fire-and-forget cache operation seems like it'd be way harder to 
do.

Splitting out the counters to cache lines should be standard stuff, I don't 
think there's anything RISC-V specific there.  The ISA doesn't mandate a cache 
line size, but IIRC we have some macro floating around that matches the current 
implementations which is good enough for now.

Thanks for looking in to this!


--===============2134467659150629449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2134467659150629449==--
