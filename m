Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74651C9830E
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 13:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xL0yfG+wZcXpL2hPzFHYnYTm+sOqeGSu3so9+WV23jI=; b=di3dZiBLjIJbIq
	CWn5vgUHQI4WTH1S4Wj0P8eDDP7p0DUbD9t45ah2RoYetnwbQeT3d/ToRxZiBJ+pHgbXPDKTJWUTM
	6AFdQFHfVlXk3DshCt133svRTK7UIkk98QdkXjhC31YFd+Hj4ed1yxZjLoa7TsyMt1M6Jsb+cd6CI
	vAfyUf4pS7johIuKn/iI3opc/X7CZhYvCcBEtHCmGwFhnoy5hWRNMDrhWOotAW3fFgoSKZIXKpRjd
	KJxglwU4/STTR0YQxAdm1+PKGpf61ghoveIYGHoDGyDlCWoaFrBmENPkJ9Fqi5nEnU34r1c9EvokL
	4yrevwSgB5cLdFghEdTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9j9R-0000000B31e-2z3i;
	Thu, 24 Sep 2026 13:06:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9j9P-0000000B319-0Yno;
	Thu, 24 Sep 2026 13:06:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72CC61756;
	Thu, 24 Sep 2026 06:06:06 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 540843F86F;
	Thu, 24 Sep 2026 06:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790255169; bh=EGw34BO6GoODDHqtAWjnN4dQ0qfGJO7mhTtfUZBl07g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L5T5MVGA1XE7fvh0OgeMuV6WxEvg/uuyaiKVs7/Rb0XZiQu6QLiQiyVzic9dwbkKj
	 AsHQO82O3eGMXwH0QQs/G8Eagu43wXo1aY65K+KpEyokxL7WJ+W4gxNEeTmwo5/88x
	 2Z1VqPAa89aa8XVYSCxLOJX2ek0aIfWGYkdJLQV0=
Date: Thu, 24 Sep 2026 14:05:57 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, catalin.marinas@arm.com,
	will@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, chleroy@kernel.org, ritesh.list@gmail.com,
	sshegde@linux.ibm.com, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, ojeda@kernel.org, boqun@kernel.org,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org,
	acourbot@nvidia.com, work@onurozkan.dev, nathan@kernel.org,
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
	jszhang@kernel.org, japo@linux.ibm.com, jpoimboe@kernel.org,
	seanjc@google.com, pmladek@suse.com, thuth@redhat.com,
	ynorov@nvidia.com, joelagnelf@nvidia.com, david@davidgow.net,
	fujita.tomonori@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [RFC] rust: kernel: Add KUnit tests for ARCH_WARN_ASM bug table
 emission
Message-ID: <arUgNdqpA5U8EjjP@J2N7QTR9R3>
References: <20260922054959.955093-2-mkchauras@gmail.com>
 <20260922064735.GS4121339@noisy.programming.kicks-ass.net>
 <arNxAn7I7NCVWmD1@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <20260924111557.GP1837346@noisy.programming.kicks-ass.net>
 <arUbw_TIA0Uj7oXT@J2N7QTR9R3>
 <20260924125253.GY776954@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260924125253.GY776954@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_060611_268779_E93A66AB 
X-CRM114-Status: GOOD (  22.77  )
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

On Thu, Sep 24, 2026 at 02:52:53PM +0200, Peter Zijlstra wrote:
> On Thu, Sep 24, 2026 at 01:46:59PM +0100, Mark Rutland wrote:
> > What problem is this trying to solve?
> > 
> > Mukesh's original patch seems to be trying to check whether we compiled
> > things correctly (such that the bug_table entry points at the expected
> > insturction), and I don't think that warrants a runtime check, but (as
> > per my reply to him) I don't understand why that's a thing to check in
> > the first place.
> > 
> > On arm64 we only call is_valid_bugaddr() under do_el1_brk64() ->
> > call_el1_break_hook() -> bug_brk_handler(). We only call
> > bug_brk_handler() when HW has taken a BRK exception with the BUG_BRK_IMM
> > immediate, and that can only be triggered by executing the right
> > instruction (BRK #BUG_BRK_IMM), which we ONLY use for BUG(). and WARN().
> > 
> > So I don't see why any change is necessary here.
> > 
> > If the HW has somehow taken a BRK exception from any other instruction
> > (which would presumably be a HW bug), there won't be a bug_table entry,
> > and so __report_bug() will fail to find an entry, and will return
> > BUG_TRAP_TYPE_NONE, same as for the !is_valid_bugaddr() case.
> 
> Right, so I wasn't at all sure what he was doing, Rust is still mostly
> unreadable garbage to me.
> 
> But I figured I'd much rather see him use is_valid_bugaddr() to do
> runtime checks than whatever dodgy games he was playing with that label.
> 
> So *if* doing runtime checks is what is wanted, then is_valid_bugaddr()
> needs to actually work, because then it grows a user outside of the BRK
> handler.

Thanks; I think we're aligned. :)

Before we delve into implementation details, I'd like to understand the
problem Mukesh is trying to solve.

Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
