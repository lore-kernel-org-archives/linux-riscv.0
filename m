Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D435BC43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 13:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JRB4jNwUMuQuKRW8Q8I2wWdtdYGZOGm1sfJ2q0CDMak=; b=K19D/dvw1Z84YD
	2jbs4/4Dzfb5HHUyYEeXd62CJnCfqx+Kn+dgbyRf4IXpt5dpf+Mlwm7QUh5ZXdETt+qBOq5ofwhbU
	kgr6+Q3reJ+fFuuKWFH6HTMrOMCsRYoyJ4SfUtuMHl8mvnHELUmisBJKDRN3ekiZyeo/2y4J92Ma0
	0bHxw7U66TTlWiZzyF5nGGibZSkhO+OxTN2zdu5l9h5ZSHU8vvvHL9bHRVa+FkK8YJIfkLfbg0bvo
	RZVD8ctjLFTH2GDTjT4ItD0SmmZhDkkUMVjqi1CdmAFsrQ6R5yPuNdBIEPlZG/M5Kg6B6coksnEhM
	AJ1HJ5hNJxSXFimlEgNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHcE-00000004Xaj-2tns;
	Thu, 02 Jul 2026 13:38:06 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHcC-00000004XaL-0fdy
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 13:38:05 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782999482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Po20990TIfpBiRw/XyIOEpeN9s35s69IX4LYQElT0yg=;
	b=OnEGBgXGvD4XWnz2NuxGZSUBewpLit203b2sAehswDGg6I4w20GT2SebyMFaWMdjy6pGRb
	hhbteTep0FfjaQep7Rox/nBFGTVJZLh7aMc9KYTEyBRzvErok2DANgYVLBmRPB1YtM4MKQ
	cRNr3lmg4GZT3uQ4Y9wUZEW0wc60VK9s25tY+mkvpNLI6jvoQDyANK8oOe5moZrgE6ac5q
	lkEHMgZMNH9frQX6qmxg2KKRzfYhIqgt77OII5uHxTpaTHfzoPvX6iQlLk0u45meULKPUP
	cCXq3PhaswvpKAmIAHGMhA8PiDSRHRCrUj7qCNUmUUmJqnwUC6VNTfpmLSZGGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782999482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Po20990TIfpBiRw/XyIOEpeN9s35s69IX4LYQElT0yg=;
	b=WeErE4UT8SBCWS82PDLZwb3plw2xkWNa0NAl00XRhQYC+Tyfo6lMUSfCyprwLY6EKX2xiC
	7Gt4gMiVglN0pADg==
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Thomas
 =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, =?utf-8?Q?A?=
 =?utf-8?Q?ndr=C3=A9?= Almeida
 <andrealmeid@igalia.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Thomas Gleixner <tglx@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Subject: Re: [PATCH v2 0/5] riscv: vdso: Implement
 __vdso_futex_robust_try_unlock()
In-Reply-To: <cover.1782998849.git.namcao@linutronix.de>
References: <cover.1782998849.git.namcao@linutronix.de>
Date: Thu, 02 Jul 2026 15:38:00 +0200
Message-ID: <875x2xjyvb.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_063804_368347_786C0601 
X-CRM114-Status: UNSURE (   6.90  )
X-CRM114-Notice: Please train this message.
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

Nam Cao <namcao@linutronix.de> writes:
> This series adds new vdso futex entries, allowing user to address the robust
> futex race condition regarding clearing the robust_list_head::list_op_pending
> pointer.
>
> Thomas wrote a summary of the problem:
> https://lore.kernel.org/lkml/20260602084648.462672743@kernel.org/
>
> The core infrastructure has been implemented along with x86 support. This
> series adds RISC-V support.
>
> The first 4 patches prepare compat vdso Makefile. The final patch is the main
> show.

Sorry, I hit send before saving. This v2 addresses some of Sashiko's
comments, while the rest of the comments are addressed by Thomas in:

https://lore.kernel.org/linux-riscv/20260701-riscv-vdso-lto-v1-0-89db0cd82077@linutronix.de/
https://lore.kernel.org/linux-riscv/20260630-riscv-vdso32-alternative-v1-0-a32fd89b7b1c@linutronix.de/

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
