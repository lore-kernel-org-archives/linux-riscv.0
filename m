Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C939C7114A
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 18:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9KZYWJQ945bH6WQ4uUzpdFS7VYNiG/H5nYM0vUL/ayg=; b=zeAjVNTkVyVA7H
	kMYQZHstv8A19SEwXnkApMP2SMnJ/LkQhePhHZtS4usachiQqz5MMoVSqGbXqc5jUOPrcHWWl+bCD
	fWRGSVAgxqZNeTaKCHNNxV2pqX9Y3VKIFEVRImgLSwvIHKAMHvQXNi4EY+Uwzy5ZBvMu9j+EUV3EX
	G+U2i3mQxn4do1/A8+CcIOTmt4WUiFOFYJixbt8JLuQrtRwc1ucia+GdbO2bTy5gi5/XntHZ5b/oE
	I9G7BOlan4q7LYD8p1tqkBdQPI9AVifiLlpi9TaJRDDnYHZHpJo5Z1WubhddvJ2OPkPHy3/LrcRdi
	NlHUc9/VPKf4Xv6tg4QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8ya-0000000HHuo-39Sv;
	Fri, 13 Jun 2025 18:18:04 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ7o1-0000000H8Bv-0rgZ
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 17:03:06 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749834183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7NfgeF2dC2QINSkCwFY7dOB7Pf1iyEUqChtxCjfUjFw=;
	b=wVAhFgzSVm6kS9Ztjloehah17EJj+npVOpu28Rq3gsN1hS4V1h2mSEIlJRWU4AJnlIKbNr
	z38NJ4+88VYuLXah9EzRxhATJpgB7BfnVQMwRHnq3LMRjnn22QT471Fut4bYze/PZTh53K
	QkBBHHbXkwDjPtVFNpidWFJEh8nI0Ou4cLwB4utWMAFkFxE2AayA43MMus4D8+3hKGLjNi
	P15woFv/kylxgiqQ1+7dzJ3xxqrGUXRVzi13pluT9BCFaP26jwgWtgJYZnUmMnBd8SZpxu
	HghbHz9XBwav8SlKFMjlEPeuZQD67QyKELdrAFb3tomsEjRn28zUicyAFOBwyA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749834183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7NfgeF2dC2QINSkCwFY7dOB7Pf1iyEUqChtxCjfUjFw=;
	b=PuY4vm91yJw+AZX3wKbnV/GEGRYKRqnpCNpkt4TvNPtP58geJXOrMmrJCjwm5Dj+AgqFE+
	lFRWNWHAW5SxrFBQ==
To: patchwork-bot+linux-riscv@kernel.org, Andrew Bresticker
 <abrestic@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org,
 palmer@dabbelt.com, alex@ghiti.fr, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip/riscv-imsic: Start local sync timer on correct CPU
In-Reply-To: <174957291849.2454024.7268696984666677694.git-patchwork-notify@kernel.org>
References: <20250514171320.3494917-1-abrestic@rivosinc.com>
 <174957291849.2454024.7268696984666677694.git-patchwork-notify@kernel.org>
Date: Fri, 13 Jun 2025 19:03:02 +0200
Message-ID: <87sek3poah.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_100305_381051_C99893F1 
X-CRM114-Status: GOOD (  13.28  )
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

On Tue, Jun 10 2025 at 16:28, patchwork-bot wrote:
> Hello:
>
> This patch was applied to riscv/linux.git (fixes)
> by Thomas Gleixner <tglx@linutronix.de>:

No. I never apply patches to the riscv tree :)

> On Wed, 14 May 2025 10:13:20 -0700 you wrote:
>> When starting the local sync timer to synchronize the state of a remote
>> CPU it should be added on the CPU to be synchronized, not the initiating
>> CPU. This results in interrupt delivery being delayed until the timer
>> eventually runs (due to another mask/unmask/migrate operation) on the
>> target CPU.
>> 
>> Fixes: 0f67911e821c ("irqchip/riscv-imsic: Separate next and previous pointers in IMSIC vector")
>> Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
>> 
>> [...]
>
> Here is the summary with links:
>   - irqchip/riscv-imsic: Start local sync timer on correct CPU
>     https://git.kernel.org/riscv/c/08fb624802d8
>
> You are awesome, thank you!

That patch has been committed to the tip tree and is already upstream.

Can you fix your bot scripts please?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
