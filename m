Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67DEEF99EA
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Feb 2026 00:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PmkJva0bRoD4ShCNaM6U/0DZHeBZ+R8sHh05ZdU3ARg=; b=1PCUk0LiGtNPDD
	wq9MAVFN4ZVdY2zniEJahYdEdmB0T1G+ChApG9dL42pKJWeIroizDffx7pMG6iJrXih2SVNpXgIEG
	7GEuQs7a4jDYh58EmiHWheT33CI5TUU32umxwph70WpFd65RHk7ovIQqDWUj8lvB8h9aUa/JzndM1
	3Gwr3dZ4W1h0dD2iYQJdfz3AHVw467JkV+jG58dS8SnPvpTKBMrhavHNlXgpkavE6vKgCBLIkyfdR
	OMZV5bnlwQ5vzzABfSl0p9fULDRCTMTa3uVP6blRFChTzS61XRit3XR26PfqfC2fFjRDOHTuj8lLU
	GhnXvpYjPymgOVmazMJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr3Rv-000000044RP-0SWq;
	Sat, 14 Feb 2026 00:23:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr3Rt-000000044R2-07J5
	for linux-riscv@lists.infradead.org;
	Sat, 14 Feb 2026 00:23:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8284143AC6;
	Sat, 14 Feb 2026 00:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C33B4C116C6;
	Sat, 14 Feb 2026 00:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771028625;
	bh=0Uxm6w5KJWRLnm+fT3A+MmNRIjXeTQ9g/qdsDSMeoTY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CXVL7C0KF162uiO1bN0qqeIsBTfTxkb8N8Lr/YLk5G0nm5Y8kQbpY9VLYzfOgvgQj
	 ieyz/yFO/gMZBPI7LJxinaM+QdfP0yTFcMjLPUWlQnuX7kvtH32KH9pRPbHoRL5KQ+
	 Br/tdTHBDt+9EVxSBqNXUF0zMCpvhhcG9qDxJomoi1QaW/j/k+B5bQwp+emKjJGWxK
	 QWZyfN1MJSkRr4eVIKKQj94eUoZUAq9D4kEC8HiCvA7tnPuKrJVZVVjwqkIHvKWG+Q
	 xbVouvQgu2FJAYNn7QepriX5sePOhqME6fgVCS2NolltWK/ZdLCU/pJ+dzvNRgqklO
	 soyocSRblusqA==
Date: Fri, 13 Feb 2026 17:23:41 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: Paul Walmsley <pjw@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
    Peter Zijlstra <peterz@infradead.org>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, broonie@kernel.org, debug@rivosinc.com, 
    zong.li@sifive.com
Subject: Re: [GIT PULL] RISC-V updates for v7.0
In-Reply-To: <CAHk-=whUXMRa3py11kpZiDMau8uauiwZCok2UMQAecTshfTrVA@mail.gmail.com>
Message-ID: <2248971d-d69c-65fb-93b4-10f0d7d8bbad@kernel.org>
References: <c554c02e-a791-5c4a-d329-7632de7a194d@kernel.org> <CAHk-=whUXMRa3py11kpZiDMau8uauiwZCok2UMQAecTshfTrVA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_162349_089725_10816183 
X-CRM114-Status: GOOD (  22.36  )
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

On Thu, 12 Feb 2026, Linus Torvalds wrote:

> On Thu, 12 Feb 2026 at 15:39, Paul Walmsley <pjw@kernel.org> wrote:
> >
> > Deepak Gupta (26):
> >       prctl: add arch-agnostic prctl()s for indirect branch tracking
> 
> Hmm. In the meantime, I had pulled the RSEQ time slice extensions
> stuff first, so what happened was that these prctl numbers got bumped
> up from 79-81 to 80-82.
> 
> I note that it looks like linux-next ended up merging things in a
> different order, and so instead left the indirect branch status prctls
> alone, and instead modified the RSEQ one.
> 
> Just letting everybody involved know - maybe this was obvious to
> people, and maybe this came as a surprise.

Thanks for the heads-up; shouldn't be a problem.

> And only very tangentially related: I think the indirect branch
> locking could have been just a separate bit from the enable bit. I
> don't see why it needed separate prctls for "set status" and "set
> lock".

Will think this through and respond back.

> On a similar theme: why is it called "indir_br_lp"? That's a horrible name.
> 
> This was supposed to be architecture-neutral, but I get the feeling
> that "lp" does not stand for "Long Play" and has nothing to do with
> 12-inch vinyl records.
> 
> I think it probably is shorthand for "lpad", which is RISC-V thing.
> Which is complete nonsense for something that is documented to be
> architecture-neutral.

RISC-V didn't invent that term; here are some earlier CFI-related uses:

* ARM (2019): https://developer.arm.com/-/media/Arm%20Developer%20Community/PDF/Learn%20the%20Architecture/Providing%20protection%20for%20complex%20software.pdf
* LWN (2022): https://lwn.net/Articles/900099/
* FineIBT (2023): https://cs.brown.edu/~vpk/papers/fineibt.raid23.pdf

If you're okay with keeping the term "landing pad," we could get rid of 
the "LP" and use something like "branch_landing_pad" instead.  Or 
perhaps "verified_branch_target" could be another option.  It would be 
nice to avoid using IBT or BTI, since those are definitely associated with 
specific architectures.  Any preference?

> In other words: I've pulled this, but I expect this to be fixed asap.

Will do, once we stop bikeshedding on the name :-)


thanks

- Paul



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
