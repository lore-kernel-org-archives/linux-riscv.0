Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CBAC98306
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 06:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7vHowPeqklOo/kBb41GSKr42nicO4qhNC3OhIIalTfA=; b=X5AD43W/cL7cYe
	/7njUNqYPyp9n5iv6IVewENAkzTm8mZQM+J47AlKLsehunwkeX+713YRKynume+qVWczu2OjGPcLM
	rqSm3MrhdzmC32J3wfC8a94pUKh2bSDFNDLuTU60dWXQzrfotXTcZKBpaitZFF5FcqlKqhX0ouq1A
	k7TxPtJ3sZIQ2I+3bT5kFqHh/AA4jzBeqxs9pOF8ZWVOOMzOUt+AdlnlLrR5XVWvJ/CoQ+MDqdMlV
	LK9gjcwQ+U2EXLxg25bqcYWpT4L4EK2PXifo9lSy3oqxCvNqclotIkycjJXv2sZfBhAqZVBh3COz9
	JIgSURmSkbrB0KQRVkrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9zUH-0000000CkeU-2KZP;
	Fri, 25 Sep 2026 06:32:49 +0000
Received: from mail-dy2-x0e.google.com ([2607:f8b0:4864:36::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9zUF-0000000CkdL-1JEl
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 06:32:48 +0000
Received: by mail-dy2-x0e.google.com with SMTP id 5a478bee46e88-34213ed0b18so27076eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 23:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790317966; x=1790922766; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ff013h9UPO5JfvQ6KOoQNBZOiCtGEKIOGbWYKhP5c+0=;
        b=RaX3rJ13l0IJXHFgSZoVCafqFdKwypcgoy/xffzWBDzcs25dUSVTlpwOQBefVmREIN
         ocZf5rKP+x8CuJlphf2uABiz4k/S6/spAWBtRI3yTS/gO1P4royu1FRhLN4Va3986C2B
         KMHvG1sjcysTFho6y5uq8tEaHEh3B6K3YqkSxNLu+G/nFgUyPvLtAxL7ntgXfCgQcnKs
         gciJdyGKTyBw0VE3rk2n553KkAA4lnPtsMsGk3SOf13A3JoSzjkUud8awa6O1ud0eIZt
         ZnPCnewgy7EHbCh4/KK1RMEoS6expT1dVVJR7NXKQRc3XMq37m+nY6uMomS0GvCRLJSm
         tngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790317966; x=1790922766;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ff013h9UPO5JfvQ6KOoQNBZOiCtGEKIOGbWYKhP5c+0=;
        b=JEzncyqWXm7XQeaTrtjiozBoLG4BkYYEcAS43vYSDOZ4f3hmPAdxqLuZ3nhOdPqqUh
         7sh1yAnb7wFRxODLlh3EkNT40YDn4dQcRX7HhGpX9jnNk/MLYUZYNeePkluTCbshfrNb
         ggjU8hly8ZzGMCHAvXyVbW1ASwIGc7ILrZSaDdoISCXZUJFTnyZpklmimiMhWEEjFIz7
         E13DzhDXjpoJa4lStFGuqTX242DUnGjba/lAB9wS5Ce3Enz25S/FDqIbNlSgYTm7k4gW
         bBjyyMFp9+oOJjH8ymgOqDiCjaQVf6JaT3TY1rCYU3yuzl7bI6DAullTrb9bGs6jp6k2
         q7lA==
X-Forwarded-Encrypted: i=1; AKwUvBwQMC+RnMKdSML/BtiIkPnPtuSr+sdvLd6uHkt+z5WLPyE2VEIIT+Vmzh0dvd9RGhyr/OvmifXUQ6CVpw==@lists.infradead.org
X-Gm-Message-State: AFuF++kkuIpV2MPLBciDT31h7jzK5g2ci4gn3eifDVSDVg62tj9Tj557
	Y64ZHaHNW2XOVOHKvPPzjOaEU6WnRldLblZmav9VPlwOvPZAtmCBs5gm
X-Gm-Gg: AYBFou3eXVxL7rj+zRS3ev2z3zNJNZW+ohdUlj7z1sOWkitbaK7sqtQF/yv5cYWs38n
	it6eIZHlaEK2SfPEN28uvZOXtS+UjMbXRmngoKkfXIv0dXw6AaiiqkFBd6bOv3Z++cwh3y2ajvF
	PW3gSdpY979cQXQiTFt6HvA/mZwLrgFIQNU0wzZlXxmfWHrL18MIeRNoSbAsGG4vFSSuhoMUCdS
	UXhXvU8fC0ws3O6dqeVakYULfQSkCmPO4jlGYrYP0jBqaQ+2Hf70WLqE/MeEcSdRNcOc2gE0yV/
	omGEIPRjRK4VhgcHjnuQRRSf/ABYjDd8gjdoH8bv8Lj7EUuMda20Vp/T/PjQ4GpEiIXogsR0SsZ
	Ce5Es5quF44nmaBETHCsTKT3pQsDDR1Jpj+7egyLdU8lih9hSyCFzBwfQoPukBtZADyAu9IMiR6
	NSkU0c/ldti3I8Oa9MX4nv50K9bmp1BpXRt8kunoAnVxr0AXDFMm/pGiu6ei46DyWeSpJiU6VEi
	dCnV40tHzn7POgSEZhT9XPqtB+iS/TQKw+fc+5ygnPy
X-Received: by 2002:a05:693c:87c3:10b0:33b:c478:a545 with SMTP id 5a478bee46e88-34002be4604mr3482720eec.8.1790317965974;
        Thu, 24 Sep 2026 23:32:45 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144172de6sm5786357eec.9.2026.09.24.23.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 23:32:45 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:02:24 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, catalin.marinas@arm.com, 
	will@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, ritesh.list@gmail.com, sshegde@linux.ibm.com, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, jszhang@kernel.org, japo@linux.ibm.com, jpoimboe@kernel.org, 
	seanjc@google.com, pmladek@suse.com, thuth@redhat.com, ynorov@nvidia.com, 
	joelagnelf@nvidia.com, david@davidgow.net, fujita.tomonori@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [RFC] rust: kernel: Add KUnit tests for ARCH_WARN_ASM bug table
 emission
Message-ID: <arYUiddxIDeLYj8v@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260922054959.955093-2-mkchauras@gmail.com>
 <20260922064735.GS4121339@noisy.programming.kicks-ass.net>
 <arNxAn7I7NCVWmD1@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <20260924111557.GP1837346@noisy.programming.kicks-ass.net>
 <arUbw_TIA0Uj7oXT@J2N7QTR9R3>
 <20260924125253.GY776954@noisy.programming.kicks-ass.net>
 <arUgNdqpA5U8EjjP@J2N7QTR9R3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <arUgNdqpA5U8EjjP@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_233247_352369_247F33B3 
X-CRM114-Status: GOOD (  28.17  )
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

On Thu, Sep 24, 2026 at 02:05:57PM +0100, Mark Rutland wrote:
> On Thu, Sep 24, 2026 at 02:52:53PM +0200, Peter Zijlstra wrote:
> > On Thu, Sep 24, 2026 at 01:46:59PM +0100, Mark Rutland wrote:
> > > What problem is this trying to solve?
> > > 
> > > Mukesh's original patch seems to be trying to check whether we compiled
> > > things correctly (such that the bug_table entry points at the expected
> > > insturction), and I don't think that warrants a runtime check, but (as
> > > per my reply to him) I don't understand why that's a thing to check in
> > > the first place.
> > > 
> > > On arm64 we only call is_valid_bugaddr() under do_el1_brk64() ->
> > > call_el1_break_hook() -> bug_brk_handler(). We only call
> > > bug_brk_handler() when HW has taken a BRK exception with the BUG_BRK_IMM
> > > immediate, and that can only be triggered by executing the right
> > > instruction (BRK #BUG_BRK_IMM), which we ONLY use for BUG(). and WARN().
> > > 
> > > So I don't see why any change is necessary here.
> > > 
> > > If the HW has somehow taken a BRK exception from any other instruction
> > > (which would presumably be a HW bug), there won't be a bug_table entry,
> > > and so __report_bug() will fail to find an entry, and will return
> > > BUG_TRAP_TYPE_NONE, same as for the !is_valid_bugaddr() case.
> > 
> > Right, so I wasn't at all sure what he was doing, Rust is still mostly
> > unreadable garbage to me.
> > 
> > But I figured I'd much rather see him use is_valid_bugaddr() to do
> > runtime checks than whatever dodgy games he was playing with that label.
> > 
> > So *if* doing runtime checks is what is wanted, then is_valid_bugaddr()
> > needs to actually work, because then it grows a user outside of the BRK
> > handler.
> 
> Thanks; I think we're aligned. :)
> 
> Before we delve into implementation details, I'd like to understand the
> problem Mukesh is trying to solve.
> 
> Mark.

Hey Peter and Mark,

It's not as a problem, it's something i faced while implementing the
ARCH_WARN_ASM, the generated assembly was not correct so i wrote a test
for it, I sent it out along with the same patch[1] but then the
discussion led to it being for all archs so I sent it out as an RFC to
know others opinion.

After Peter's last comment i found is_valid_bugaddr can use a bit more
work(atleast on ppc) so i think i am going to drop this and go ahead
with improving is_valid_bugaddr.

Regards,
Mukesh

[1]https://lore.kernel.org/all/20260915090453.1227034-1-mkchauras@gmail.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
