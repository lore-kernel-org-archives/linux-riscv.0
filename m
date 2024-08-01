Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7FEC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 14:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WhPFHFwFc6cCiOgU2NogN4/SxPj3w2tjkceR8hgq/2o=; b=exbj0dDzBJg6tX
	xNDJDz67lIHxQSoqJ3laamhJcy2HIV34FjyIxLNCUb6vUfN278c8pAeEv7DXNo0nAJSk2ji4JEopd
	TqDpr275HvbPqmTVeodlC08CQXICVcZapq7uUqt7wzqa94ghsA0K7f6CYip7ctO9NHefnnUVjPfSH
	CWvBgD8CyLBsEQzWloVarxa/ilgSE+PTCSRQjEypTkXUc2HNBP35mtMnQGgI5qoPH9HhyteXpHWAf
	DHLD4cGcUvuKM1jTfXJ8cCoDcxRiNtDSLXsxkthjgR+Cn9cNSIevjfpktza5D60CgIELXDhi/mGTk
	ciSR4jLba3+TPQVK4ZBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZWai-00000005cpf-2t20;
	Thu, 01 Aug 2024 14:15:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZWai-00000005cpV-08a3
	for linux-riscv@bombadil.infradead.org;
	Thu, 01 Aug 2024 14:15:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Llj0thCWyHmdMwfKQPKFIkXT0ex9mx5ak8YGqPuRtZY=; b=qONyCuTMCjAFZ000cEy8VYPRNB
	GhlhW4q9o4PfSktxhNYSJ7wcfDwKFoHORTL5sQTq7E6qu+caZHzNsq8gmCb/5bHEE+Bwxy6Gd7zsI
	DjXjBNXcSoN4YKyGMlt302CsDdb2rD6mMDwZ9RAB3ZCuFIddmGbXGRXJyFreX1WQ2XCTgm7rdnggx
	FH7PgO2ifz7lQYRE0ERA9a78qmFXbm/BwykiKm2OIflHtWUoLuBNNmgmCVmSjgScm6DDJmgf5w0Dd
	Uvn/+U4kc+nd5ioP3s+7kUS9vlk3hoBB+XctgJiAjTtveRmYL2eFgluNgNlUhR8UR939YJLdBs9S4
	X+HZxLjA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZWae-0000000HXXJ-26b8;
	Thu, 01 Aug 2024 14:15:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1266B30074E; Thu,  1 Aug 2024 16:15:36 +0200 (CEST)
Date: Thu, 1 Aug 2024 16:15:35 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v4 00/13] Zacas/Zabha support and qspinlocks
Message-ID: <20240801141535.GC39708@noisy.programming.kicks-ass.net>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240731072405.197046-1-alexghiti@rivosinc.com>
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

On Wed, Jul 31, 2024 at 09:23:52AM +0200, Alexandre Ghiti wrote:
> Guo Ren (2):
>   asm-generic: ticket-lock: Reuse arch_spinlock_t of qspinlock
>   asm-generic: ticket-lock: Add separate ticket-lock.h

>  include/asm-generic/qspinlock.h               |   2 +
>  include/asm-generic/spinlock.h                |  87 +-----
>  include/asm-generic/spinlock_types.h          |  12 +-
>  include/asm-generic/ticket_spinlock.h         | 105 +++++++

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
