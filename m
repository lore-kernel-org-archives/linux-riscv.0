Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786A1CDB483
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 17:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=38Vl9OpIhuNASsrP+qGHYsW+V4M92Zj6exWUjtnc5Gc=; b=D4tOMzw3A6mJfFtcm9XW13FO54
	Gq5S1uH2Pcbl3rXHdDn3TM4vetMldemSYa89NKOjMtPjs+xuNwV9BHlOP6efIPaEt87RAym/QUltV
	cQMQEDm/Vc4cGFXG/Xy5ztHFKR0QC3HXoyDU0IOQv0VSltHTvr9FqAHg8hG4on/knXtDWXF9CCgeq
	f6w6OKcdPY/hmYVVWgr/iY5Zb8CN1iBlzME/Mso7Iq57/lp2DCxXnnSgi/yTalBcojCDMu7vY1LtV
	dQSOB8yFz0Q0+VeVT8kqIMvYXVXaPc4neKpbP76HAYiPjSRN5NaKlWC5yVq9yUlfTJZOF4BHCQEoq
	a8zMMGFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrLyp-003y6e-12;
	Fri, 13 Oct 2023 17:29:43 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrLyl-003y4L-1c
	for linux-riscv@lists.infradead.org;
	Fri, 13 Oct 2023 17:29:41 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3af5fd13004so1536561b6e.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Oct 2023 10:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1697218176; x=1697822976; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97hlZ1f0vdmu3r3CsDL/WAPyzOiVT34Yjs8V5akcfEo=;
        b=cjfTCHqm64XgVVrvnIwH3Hb7sW6wsVCXHtbqsv0YxTOhr2V+YX164B7Ck8xNi5e2v7
         sksay0VEqi4JRoJs+gGl2LghIOBOWTVL1bXyEqLgpo/q1uAaDEwaCLAv73pHVZNvs4BH
         X7RIsZdWgxEgk+pdZ+5wT8/kuyYmQg1FRBMpTFeymCNcboEURwAhVtYDuVFMeYD0KDyu
         L8qivJfrtauiBFX7UDlbCt1GgbvhSzpLTe9ecZ9Qm8qHRNTvuHRDyfvQJ3MhxjDfJK8U
         zkwWIqjK9QM9RK1gytUmozsUVFFIhMaT28/Is0S87AdYViTEqIqmOQlPXYajsNT+Qu4t
         fGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697218176; x=1697822976;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97hlZ1f0vdmu3r3CsDL/WAPyzOiVT34Yjs8V5akcfEo=;
        b=l/qHzZPCfGVylOuLoHiwYST9pfTTAaN86sd/Sz/OBxfAs3efXDSzcQ+LhFdcmUF3B2
         x+Thi8J92PgqM8VCUmV4rDdjEsXZh9B2lO3/94EhJszLZ1h8QPVDAnuHidmvnw3AAPZJ
         Rk8cmWabDlZFMOQqwW5XSiUB0rtuEh8RIdzWBr8vUwkHEbbJ/i9ki3Z55/QzLI+n5ngl
         R6p7MC6F0OGUVP5mNV6LXg/DaZ49vQcakBtncx3ZMLC0V/BZpXzS3FumvtOcw9FIUigK
         4t0vvJMXOvDA3w6SmPVGE5DZ3xTvXLUcrOLMfNhRTaAef2OREuhWJ4PGNQRCI1O0x2vG
         tYvA==
X-Gm-Message-State: AOJu0Yy0p/lHPt6IAgF4NPzTogxJgf5DUSqRbXnwsH5dwFWmDtMXRXgm
	dSeOyNF4qf4YAQvuMbuLCUop+w==
X-Google-Smtp-Source: AGHT+IGFw8UO7lnc4otlF25dX3JXoiZ11aavqQev8GGdYf0HnCuIRJ1jZkX13PqJqavbCoyvGI5BuQ==
X-Received: by 2002:a05:6808:1201:b0:3a8:5ff0:6b52 with SMTP id a1-20020a056808120100b003a85ff06b52mr30316146oil.15.1697218176149;
        Fri, 13 Oct 2023 10:29:36 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id f11-20020a05680814cb00b003af4f822358sm813264oiw.24.2023.10.13.10.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 10:29:34 -0700 (PDT)
Date: Fri, 13 Oct 2023 10:29:34 -0700 (PDT)
X-Google-Original-Date: Fri, 13 Oct 2023 10:29:14 PDT (-0700)
Subject: Re: [RFC PATCH] membarrier: riscv: Provide core serializing command
In-Reply-To: <ZNDvVlbubtOoto0p@andrea>
CC: mathieu.desnoyers@efficios.com, paulmck@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, mmaas@google.com, hboehm@google.com, striker@us.ibm.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: parri.andrea@gmail.com, charlie@rivosinc.com, rehn@rivosinc.com
Message-ID: <mhng-b720eb90-633f-498b-a487-0cfdc9f00ddd@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_102939_764266_67850434 
X-CRM114-Status: GOOD (  22.74  )
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

On Mon, 07 Aug 2023 06:19:18 PDT (-0700), parri.andrea@gmail.com wrote:
>> One more noteworthy detail: if a system call similar to ARM cacheflush(2) is implemented for
>> RISC-V, perhaps an iovec ABI (similar to readv(2)/writev(2)) would be relevant to handle
>> batching of cache flushing when address ranges are not contiguous. Maybe with a new name
>> like "cacheflushv(2)", so eventually other architectures could implement it as well ?
>
> I believe that's a sensible idea.  But the RISC-V maintainers can provide
> a more reliable feedback.

Sorry I missed this, I'm still a bit backlogged from COVID.  A few of us 
were having a meeting, just to try and summarize (many of these points 
came up in the thread, so sorry for rehashing things):

We don't have a fence.i in the scheduling path, as fence.i is very slow 
on systems that implement it by flushing the icache.  Instead we have a 
mechanism for deferring the fences (see flush_icache_deferred, though 
I'm no longer sure that's correct which I'll mention below).  As a 
result userspace can't do a fence.i directly, but instead needs to make 
a syscall/vdsocall so the kernel can do this bookkeeping.  There's some 
proposals for ISA extensions that replace fence.i, but they're still WIP 
and there's a lot of fence.i-only hardware so we'll have to deal with 
it.

When we did this we had a feeling this may be sub-optimal for systems 
that have faster fence.i implementations (ie, coherent instruction 
caches), but nobody's gotten around to doing that yet -- and maybe 
there's no hardware that behaves this way.  The rough plan was along the 
lines of adding a prctl() where userspace can request the ability to 
directly emit fence.i, which would then result in the kernel eagerly 
emitting fence.i when scheduling.  Some of the Java people have been 
asking for this sort of feature.

From looking at the membarrier arch/scheduler hooks, I think we might 
have a bug in our deferred icache flushing mechanism: specifically we 
hook into switch_mm(), which this comment has me worried about

         * When switching through a kernel thread, the loop in
         * membarrier_{private,global}_expedited() may have observed that
         * kernel thread and not issued an IPI. It is therefore possible to
         * schedule between user->kernel->user threads without passing though
         * switch_mm(). Membarrier requires a barrier after storing to
         * rq->curr, before returning to userspace, so provide them here:

Even if there's not a bug in the RISC-V stuff, it seems that we've ended 
up with pretty similar schemes here and we could remove some 
arch-specific code by de-duplicating things -- IIRC there was no 
membarrier when we did the original port, so I think we've just missed a 
cleanup opportunity.

So I'd propose doing the following:

* Pick up a patch like this.  Mmaybe exactly this, I'm going to give it 
  a proper review to make sure.
* Remove the RISC-V implemenation of deferred icache flushes and instead 
  just call into membarrier.  We might need to add some more bookkeeping 
  here, but from a quick look it seems membarrier is doing pretty much 
  the same thing.
* Implement that prctl that allows userspace to ask for permission to do 
  direct fence.i instructions -- sort of a different project, but if 
  we're going to be tearing into all this code we might as well do it 
  now.

Charlie is volunteering to do the work here, so hopefully we'll have 
something moving forward.

>
>   Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
