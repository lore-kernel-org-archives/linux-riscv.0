Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E84CD98F3
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 10:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NcVOO+dPnLxE40yeSN01xymz5X6tl39caYUj6lIkUrg=; b=f/TWdrY4FvlVzS
	kLHlKUsoMJ/LZ6wTe7TQ1V8P5cXIMkyqakkrLY/FikRHyUHFBCjGFuupTYSGvZficSWm+wgXdhyII
	khjjqvM4nU3c/Lg8Y8C/QCS/3wAlHgDqnS6D5jxVCDvjWBy8WWl4owFEAd4NH37KFGasaJ3ax4hkG
	9tyPjiSFy+uxGoCx27bsfm05/7iIu0alHgDRdwOCU3AYw3Ea8T12AMHKntemHenUnuhfiS9ouee3x
	FNmBz3qsZD26HJLVwPYiEC5FBVnGrtBJ3/hlVi2tTtgpqihuShinQLmhhi0WAwedJz55Bz6CFrhT6
	7V5T5An2dMOmEHcXbPsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9hM-000000013zN-42X5;
	Thu, 18 Jun 2026 10:10:12 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9hL-000000013wI-17Ac
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 10:10:12 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781777406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EpOWZFxQ6DR2wo0/80suRvf7rRXPrra1FlZB4nPAmzE=;
	b=1NMPembtpDTYGl6thPo+enIfhwbmgN9zfWBCCzUBiJ8vEgnczsHmZCUCnyhgXpsz5AHASG
	hOWzWxwLxAw4Dr+yXal7LnNj0aaZ9fyoj0WAIK8gcE8g+OAhu6zjNq2heZwXNNbdoibcKe
	7SEOuavo74Y8Hlo2skOhA0tuyb5jgf8TiJkvSTM4OmL8ZyIQ8MUCFpcUpUj0OmoOPzd5GN
	A0LXfpjLiJBGOI+5cDQAp1zX9YU6cZ3EjxxFiE88DejWyrcmlrj+hs5PHXkbDxhLjUpC+s
	bEvtBDinr2VzdWPZrAzYSHRqaT866ApBI0TjQZjpUNEyXjYLlNIrPHqWhfoMkA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781777406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EpOWZFxQ6DR2wo0/80suRvf7rRXPrra1FlZB4nPAmzE=;
	b=1t8yWBLOSem8KoFjo66ND+1WVCMTFUT1x9tpZSwC32Jv0XYgRpPWJinyWTbDCYAj9JpOBV
	hXP6aVDA96uk5iCw==
To: Kees Cook <kees@kernel.org>, Paul Walmsley <pjw@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones
 <ajones@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>,
 =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, Evan Green
 <evan@rivosinc.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH] riscv: Add kCFI type prefix to unaligned copy routines
In-Reply-To: <20260618081252.work.711-kees@kernel.org>
References: <20260618081252.work.711-kees@kernel.org>
Date: Thu, 18 Jun 2026 12:10:00 +0200
Message-ID: <877bnwtb0n.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_031011_477793_6AFA6909 
X-CRM114-Status: UNSURE (   6.46  )
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

Kees Cook <kees@kernel.org> writes:
> __riscv_copy_words_unaligned() and __riscv_copy_bytes_unaligned() are
> called indirectly through function pointers from measure_cycles() (via
> compare_unaligned_access()) during the boot-time unaligned-access
> probe. Under kCFI, an indirect call checks the type id stored in the
> word immediately preceding the callee against the type id of the
> function-pointer type at the call site. These two routines are defined
> with SYM_FUNC_START(), which emits no __cfi_ prefix, so the check reads
> the alignment padding ahead of the function (zero) instead of a type id
> and traps:

This has already been fixed by commit f2abc305aa93f ("riscv: Define
__riscv_copy_{,vec_}{words,bytes}_unaligned() using SYM_TYPED_FUNC_START")

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
