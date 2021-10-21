Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FDAC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 15:23:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3357761130
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 15:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3357761130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HsqiagfH+FTUKZmlMP+vtjzxwghrH/tjd6JGwykwE9I=; b=mSsPCW8olfC9Pb
	+hnN6uO7WPbrUF0KtacJnDPBRrX49Rn05pFiP10SZ1soOfj2mSzquVasEAyegMMNmfxlKrFiwdAkn
	zu0JEGjzmK9kDfkxzAqvj/GvSHEI3yp2qpR4YLjh4RZBkb8GdVYFFXJEQZ3XbQsHcCBfwKSPrJzG5
	fi76Ygmd7Syxvcw4NaMteCSWToCe7TRlRxpdn4ReeluSJNtiPVzSdIJtS2NNPxBVSWDwlm1nmeqDC
	G0uf7+d13xcOzdlIYBD3OKr+Vz3TfvxtoUZOo4WgObx7S9m7TMlso1B2Bq7rNcUFurW5GiaWD6Leo
	f28hJBDWteDVHz3E6c4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdZup-0085Xa-7q; Thu, 21 Oct 2021 15:23:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdZoe-00831v-R8
 for linux-riscv@bombadil.infradead.org; Thu, 21 Oct 2021 15:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=NLJ71Cg5LEnHqcIFkkZXwV1AtdUcW7tx8BbmnW6dm2g=; b=LlXZjS8mpvPBPAcm9fAJMVVIEX
 GW9IxpiIaNNbRWFpiiSrlTQAisFo2nBmhFeRJTVLmPD3snhgYjgXfnh5+Tppkpkldh2CtnayBpvZU
 5VHsyKd64d1lhCkh2nspl7xw3HumC1xR2FmEPtMaRFc0FuBNTaijLVDqndEt1Xt7RasRb+gxhJSve
 tOKrfkwzfTuEfudSGXk/vzEgRdjLGuVswaaowf9Dd2xcJypZr51wI2BcTsmx0BUa1WiVCmok0aP4i
 u+v+vQl85dvR1aFijH7mbSgbGRIpGymJSZJWNLdMavXimToVlBQVcebHmtAT3g/7GQQmVBnMZ6U42
 798BlBkg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdZmI-00DLc1-I2; Thu, 21 Oct 2021 15:15:48 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 30C283002BC;
 Thu, 21 Oct 2021 17:14:45 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 0920B2C103FF6; Thu, 21 Oct 2021 17:14:45 +0200 (CEST)
Date: Thu, 21 Oct 2021 17:14:44 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Waiman Long <longman@redhat.com>,
 linux-arch <linux-arch@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Christoph =?iso-8859-1?Q?M=FCllner?= <christophm30@gmail.com>,
 Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH] locking: Generic ticket lock
Message-ID: <YXGD5OFbI7TEDFTr@hirez.programming.kicks-ass.net>
References: <YXFli3mzMishRpEq@hirez.programming.kicks-ass.net>
 <CAK8P3a2+=9jjyqN5dMOb4+bYJy=q5G3CxFaCW+=4xryz-S=zYA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2+=9jjyqN5dMOb4+bYJy=q5G3CxFaCW+=4xryz-S=zYA@mail.gmail.com>
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

On Thu, Oct 21, 2021 at 03:49:51PM +0200, Arnd Bergmann wrote:
> On Thu, Oct 21, 2021 at 3:05 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > Therefore provide ticket locks, which depend on a single atomic
> > operation (fetch_add) while still providing fairness.
> 
> Nice!
> 
> Aside from the qspinlock vs ticket-lock question, can you describe the
> tradeoffs between this generic ticket lock and a custom implementation
> in architecture code? Should we convert most architectures over
> to the generic code in the long run, or is there something they
> can usually do better with an inline asm based ticket lock

I think for a load-store arch this thing should generate pretty close to
optimal code. x86 can do ticket_unlock() slightly better using a single
INCW (or ADDW 1) on the owner subword, where this implementation will to
separate load-add-store instructions.

If that is actually measurable is something else entirely.

> or a trivial test-and-set?

If your SMP arch is halfway sane (no fwd progress issues etc..) then
ticket should behave well and avoid the starvation/variablilty of TaS
lock.

The big exception there is virtualized architectures, ticket is
absolutely horrendous for 'guests' (any fair lock is for that matter).


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
