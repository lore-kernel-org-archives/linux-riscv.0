Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6083C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 19:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FL/63MrDQVafI99Y+H/4thuWACDw6wfYIQuQ8oVtMys=; b=ZpB/6PlqgedYPe
	u/HUtUPdGVyUp34h5IGnnsnRutTczGBnI9tuUwcJbpQpeokdhYeUjpA21mvBgylWDoS7yh4bhYf/C
	mRHJiUk48y3cLEsbKd9/MQPQh0rUjy/bMKq+Oheg7nEBZpB/x/JDJE5wkptj/z8reCGzIocqMMnCv
	34IXP1GFqRBWEzWBsPEeUUeMcl+7WO/LUBNkIkTlanKLBoMs1gtirvo/qQZyBOmJcwANgjMOM5/GB
	r0YKB8XGLdgfbRHRRa3ZD5uGgSnAI95KKPG6XJFIw7l3PSh5E9aMq/L0n5m9VBjrEBtP79rBewYz+
	wVm3awyovkEzOltskRng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3jWL-00AyYn-WB; Fri, 09 Dec 2022 19:58:58 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3jWI-00AyUE-KH
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 19:58:56 +0000
Received: by mail-qt1-x829.google.com with SMTP id h24so4432958qta.9
        for <linux-riscv@lists.infradead.org>; Fri, 09 Dec 2022 11:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZAsqCIFgPt6BSntE2zK/1grKaxatSUFCPk0z0wIkAOI=;
        b=UE0ilwfG5ft6c+WNo48Hu5oJEUZt2YPjH/PVnZ40KzSKlmJi3jIAD3drUF6Tw1bJQN
         Q52cdO2w12c+G3TuI4zkOo20GjaJT9NksWJ8C1f8TW4yWn0TEvxnPC2Z0lQI7U1Gp6Rh
         bbRoIfjihl5wOovQ+clxwm7M/fvK8guNtDptvNEq29G+yWnjNeGmOtKD4b40VtEEQpcn
         t+UkhotjE+UELGPLOceW0Aln8BhFPJNwPpuw0lKZPrfEGORAGihSKvJGdYhftF2GJdEG
         M3LIUnLhFOvnwQJCUNnMkLuWhybgwLZq1W+dIoFcWJFWzSlM451nT8CyPgTNQT5Bwa1u
         8A9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZAsqCIFgPt6BSntE2zK/1grKaxatSUFCPk0z0wIkAOI=;
        b=1uqBAAxjBuH4/JkAehtF2IMksSwr4NBXk/g0OHEKwwlN0cJXO0pH+fahCp1w8sEZUp
         3p97I1Na4Dl9QNslpXwOl13RZt4u7/jm8+pE7vhmDTmV7pnKKYIxev6wnfcV0WazAFPQ
         eZDw7wjYbNLx+cI9TJ3rCLBKhoqhuAR3WuhfeTAaqFiaEpoNevO7TMFP4K5NzWj7l2/5
         byOFtje+B2xD6IDqDJPvzNzOafGIpRdsZvoWqAvAkQFxDNsWQkFRhGQoJRM7mdPsSq3G
         mVf2+55CE0iDBFDa9qLgQ4oY8YXo+qh1kreA/hPKB/fplZKw2OUVaZY9eBmcsymMoZ5X
         Bt1A==
X-Gm-Message-State: ANoB5pmKyqu/JVMvK/Fbmm8jfaFAWoKSrmC1y5uSspstc3JTDrNkkms/
	rz5ByV/ozIHaRo5IvnLAY2D92/9++E6/PQAyvvQ4rAqw+rIoZmaSj7OXx3wtNjrl2BXZWxLv7u8
	616UW/KeP2AZVoNYQAJLAkRd0m860YWDJwyN5sOzmsfSC8vZJZ9TnzG04b8LiNKzbHDXBPBJEZu
	hfgKcqcA==
X-Google-Smtp-Source: AA0mqf55DUOYiI/Ydi7TiJ/V7Mwn1359Q+AM7VLaMLNS6M/zmq6c/JphsdSSvsBceTjy0ud03GszlA==
X-Received: by 2002:ac8:7949:0:b0:3a8:991:bfa5 with SMTP id r9-20020ac87949000000b003a80991bfa5mr894346qtt.44.1670615929277;
        Fri, 09 Dec 2022 11:58:49 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id do39-20020a05620a2b2700b006fcc3858044sm526057qkb.86.2022.12.09.11.58.48
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 11:58:48 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id 7so6754694ybp.13
        for <linux-riscv@lists.infradead.org>; Fri, 09 Dec 2022 11:58:48 -0800 (PST)
X-Received: by 2002:a5b:b45:0:b0:6f8:ce8a:57a5 with SMTP id
 b5-20020a5b0b45000000b006f8ce8a57a5mr40756849ybr.26.1670615928410; Fri, 09
 Dec 2022 11:58:48 -0800 (PST)
MIME-Version: 1.0
References: <mhng-975b1d7b-7b3f-4e88-804c-8b22787f9588@palmer-ri-x1c9> <e9cf13a9-561a-3438-00f0-41fe2631888d@rivosinc.com>
In-Reply-To: <e9cf13a9-561a-3438-00f0-41fe2631888d@rivosinc.com>
From: Andrew Waterman <andrew@sifive.com>
Date: Fri, 9 Dec 2022 11:58:37 -0800
X-Gmail-Original-Message-ID: <CA++6G0Bg8-uD+F+5JMcsu6jnMwnSSFAtH=ZEZjRqK1KHSW7C8w@mail.gmail.com>
Message-ID: <CA++6G0Bg8-uD+F+5JMcsu6jnMwnSSFAtH=ZEZjRqK1KHSW7C8w@mail.gmail.com>
Subject: Re: RISCV Vector unit disabled by default for new task (was Re:
 [PATCH v12 17/17] riscv: prctl to enable vector commands)
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, fweimer@redhat.com, stillson@rivosinc.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, anup@brainfault.org, atishp@atishpatra.org, 
	guoren@kernel.org, Conor Dooley <conor.dooley@microchip.com>, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, andy.chiu@sifive.com, arnd@kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	bjorn@kernel.org, libc-alpha@sourceware.org, christoph.muellner@vrull.eu, 
	Aaron Durbin <adurbin@rivosinc.com>, linux@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_115854_765103_1B4CC29A 
X-CRM114-Status: GOOD (  54.00  )
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

On Fri, Dec 9, 2022 at 11:42 AM Vineet Gupta <vineetg@rivosinc.com> wrote:
>
>
> On 12/9/22 09:21, Palmer Dabbelt wrote:
> > On Fri, 09 Dec 2022 05:04:23 PST (-0800), fweimer@redhat.com wrote:
> >> * Darius Rad:
> >>
> >>> On Fri, Dec 09, 2022 at 01:32:33PM +0100, Florian Weimer via
> >>> Libc-alpha wrote:
> >>>> * Darius Rad:
> >>>>
> >>>> > On Fri, Dec 09, 2022 at 11:02:57AM +0100, Florian Weimer wrote:
> >>>> >> * Andrew Waterman:
> >>>> >>
> >>>> >> > This suggests that ld.so, early-stage libc, or possibly both
> >>>> will need
> >>>> >> > to make this prctl() call, perhaps by parsing the ELF headers
> >>>> of the
> >>>> >> > binary and each library to determine if the V extension is used.
> >>>> >>
> >>>> >> If the string functions use the V extension, it will be enabled
> >>>> >> unconditionally.  So I don't see why it's okay for libc to
> >>>> trigger this
> >>>> >> alleged UAPI change, when the kernel can't do it by default.
> >>>> >>
> >>>> >
> >>>> > Because the call to enable can fail and userspace needs to deal
> >>>> with that.
> >>>>
> >>>> Failure is usually indicated by an AT_HWCAP or AT_HWCAP2 bit remaining
> >>>> zero, or perhaps a special CPU register (although that is more
> >>>> unusual).
> >>>
> >>> That would indicate that the extension is not present, which is one
> >>> of, but
> >>> not the only way it can fail.
> >>
> >> I think you should bring down the number of failure modes. HWCAP has
> >> the advantage that it communicates kernel/hypervisor/firmware/CPU
> >> support in a single bit, which simplifies the programming model and
> >> avoids hard-to-detect bugs.  It's not clear why it would be beneficial
> >> to continue on ENOMEM failures here because the system must clearly be
> >> in bad shape at this point, and launching a new process is very unlikely
> >> to improve matters.  So I think the simpler programming model is the way
> >> to go here.
> >>
> >>> The vector extension relies on dynamically allocated memory in the
> >>> kernel,
> >>> which can fail.
> >
> > The issue I'm worried about is that V needs more space in the
> > ucontext-type structures.  We have an extensibility scheme there so we
> > think it can be made to work, but IIUC we'll need glibc to be updated
> > to handle the extended contexts in order to avoid losing state when
> > doing ucontext-related operations like signal handling.
>
> Sorry this is not relevant to this thread. I started a different thread
> on ABI/sigcontext aspects, lets discuss it there.
>
> >
> > I don't see a way to handle that with just HWCAP, as we essentially
> > need some bi-directional communicaton between userspace and the kernel
> > so they can both decide to turn on V.  I don't think we strictly need
> > a system call to do that, we kicked around the idea of encoding this
> > in the ELF, but there's a lot of flavors of vector in RISC-V and we've
> > had trouble trying to encode these in binaries before so it seems
> > easier to just use the syscall.
> >
> >> But this failure can be reported as part of execve and clone.
> >>
> >>> It also provides the opportunity for the kernel to deny access to the
> >>> vector extension, perhaps due to administrative policy or other future
> >>> mechanism.
> >>
> >> HWCAP can do this, too.
>
> Having the prctl as general purpose knob to disable the V unit for
> various reasons makes sense.
>
> But keeping the V unit disabled by default and using prctl as a
> gatekeeper to enable it feels unnecessary and tedious.
> Here's my reasoning below (I'm collating comments from prior msgs as well).
>
> 1. Doesn't it add another userspace ABI which is already a headache for
> this feature. And that needs to be built into not just libc but
> potentially other runtimes too. Even after implemention there will be an
> interim pain as the new prctl takes time to trickle down into tooling
> and headers. Besides the new stuff will never be compatible with older
> kernel but that is a minor point since older kernel not supporting V is
> a deal breaker anyways.
>
> 2. People want the prctl gatekeeping for ability to gracefully handle
> memory allocation failure for the extra V-state within kernel. But that
> is only additional 4K (for typical 128 wide V regs) per task. If that is
> failing, the system is not doing well anyways. Besides it is not an
> issue at all since ENOMEM in clone/execve for the additional space
> should handle the failure anyways. Only very sophisticated apps would
> downgrade from executing V to Scalar code if the prctl failed. Instead
> memory allocation is more likely to be an issue when copying V state on
> a deep user stack across signal handling but there's nothing we can do
> about it.
>
> 3. Another argument to prctl gatekeeping is ensuring user-space conforms
> to vector length. But isn't the holy grail of RV V-extension VLA (Vector
> Length Agnostic) programming.

Yes, a suitable ABI for the V extension should cater cleanly to the
VLA model, since that's a major selling point of this ISA.  The
baseline assumption should be that programs will execute correctly
regardless of VLEN (subject to the constraint that the V extension
requires VLEN >= 128, of course).

It's of course valid to construct programs with VLEN-dependent
behavior (e.g. dynamic dispatch to routines optimized differently for
different VLEN), but it should be considered the program's
responsibility to get that right.  I don't think the ABI needs to
furnish guard rails.

> I expect most implements to follow that.
> If there are super sophisticated (or dumb) apps that don't follow, they
> will fail randomly. I think of Vector Length as any other ISA extensions
> - its not that currently apps are required to prctl() for bitmanip
> extension if they want to use it. Sure they could use AT_HWCAP (or
> /proc/cpuinfo or any other portable way) to query the capability, same
> can be done for V as well. Besides vlen is readable from user space so
> the app can read it to make sure. My worry is we are providing
> additional safety net to a small category of apps at the expense of
> making it tiresome for everyone else.
>
> HWCAP solves the kernel to user-space communication of capabilities. The
> prctl is for user-space to kernel communication but I'm not convinced it
> is really solving problems for the common case.
>
> Thx,
> -Vineet

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
