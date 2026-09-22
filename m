Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B40FC982FE
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 15:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/XFgBUL9KepoVAWtx32x1ya4/1nOyxAMqpepBvpsps0=; b=vwP/O9TlqegkW5
	hrC70EUhHhcU/2PdIzbd/bIyTakS1ajLccHpdGhBHdaoSeXVqy76dk+VIoWCcRWYcvv7mk4mTwmPf
	+85CUOarTa/4sxAVy/kwUuup4P4ZTartps2dTKphm0P+nQeyZrTHbqn0/tsDgCLyjBWdalcGlvW5D
	42FVLWyQo10o+0HGsL2loNr9RuFT+bfOvvA83GgFVAkhXbdZOq2roReZ5PZahXrq1yhRXuqOdWbMF
	yvAgMGpbXGK+md1/k3xL6kr1Q67f6s7/uVhI6UOfzWq8URcQprNKcfMaTaRBBoW3R4L8yWcim0/Bl
	zMczSvmf4qqqsQxIJj8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92bR-00000005u1o-029C;
	Tue, 22 Sep 2026 15:40:17 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92bO-00000005tzo-45eq
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 15:40:16 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790091612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RoaEb/YXzDoIHH3AiLUmW9ounZQpxCVhS/0oNgDOzXo=;
	b=xsPbYhyFI3dubyUQwVkpMIrTKkMwQMrwIazpvAVQZaEjPSa/yeqHqsWdgo6qAfaqsNRzoF
	4Msz+urRx4xDu55KwxuqOQJtT7tKFXd3rZeBhvpvOEbELhRNGvNRMqB4c9je9rn4M4uZbV
	Dhz1YE+lSKSl8osbfU49nn53GVrUhHa+fOUd3Go6885LLmmpZ9Z7lyJ3C9/4GHvUJ6oxbS
	CtbujQFEd45ONBVZzV5nt8TLPUFzRCef3j6tRbNtjbIT7q0rlkyOVoPdcazAUNnYjnvSnx
	KumXUK6FoRkTlttStkUyIcph/AveIAF30KBCcyniH5NNPm4j9qrX593t3U1PdQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790091612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RoaEb/YXzDoIHH3AiLUmW9ounZQpxCVhS/0oNgDOzXo=;
	b=0e5K4U5Ny6HmXEqacnXfJEfvhBlnwt3iG3VXBRhtuMynIkiiORc8mU12NhhN1C4Y8D/dfW
	WTTLcUv9npKK7/CA==
To: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>, Naveen N Rao
 <naveen@kernel.org>, "David S. Miller" <davem@davemloft.net>, Masami
 Hiramatsu <mhiramat@kernel.org>, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] riscv: kprobes: reject probes inside LR/SC
 sequences
In-Reply-To: <20260828091202.1124-1-yuanxiaofeng@eswincomputing.com>
References: <20260828091202.1124-1-yuanxiaofeng@eswincomputing.com>
Date: Tue, 22 Sep 2026 17:40:11 +0200
Message-ID: <87mrt9e1lw.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_084015_154754_3FFA2057 
X-CRM114-Status: UNSURE (   5.57  )
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

Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com> writes:
> A breakpoint trap taken in the middle of an LR/SC sequence clears the
> load reservation, so an SC following the probed instruction always fails
> and the enclosing retry loop re-enters the breakpoint, livelocking the
> CPU.
>
> This series makes the RISC-V kprobes implementation reject probes placed
> inside an LR/SC sequence:

CC: kprobes maintainers, I would appreciate your opinion on this. Should
kprobes reject it, or leave it to users to take care not to do that?

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
