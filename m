Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69A4C5DF94
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 07:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nc7V1Tu7werJ+5sXs8qnk3zOefbZgmXBcCLo0KlVjzA=; b=lR4i8lI/Mua59O
	3zh+CkA86bXR5PzMSPrPfl6OUuVm5Q3g6kLW6Ysxl0ZWKEidAOCVOnkHHeaDZRYgVV+FBnjY/D3m6
	OyBcJFc3884GB+01yMcs8ebJIleNTCt7t1W2gOyOVBsh+K6pIw0BFQ68fQHt3DI8HesLLoN/nGc2z
	GaGWVjoQKN8Tct6vj64LPV4de/SDKupiJizCrdDm2bfy9lP6q68LeXRC5Oa/tmkciqrhZo2nFetE8
	XgqxcwaaER2SIFSGcxWtpDyKYpqT0tisRlBH462ldOltvx6JTDTJefGsY1jqtKRBMBnCHtPXZAEFh
	a1C6rUBMtarCSnHSpf6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wylAl-00000000G00-3Nl9;
	Tue, 25 Aug 2026 07:02:15 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wylAj-00000000Fzf-2P0c
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 07:02:14 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787641327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NAdN3vZtcV6SqCRRVXxqYMH2Z4Z+rkNa4uz3nIVYnrM=;
	b=Aephe/xIfIawONEyQV5BHkhbsq/lDDPidR4BeT7yzTkQIR+NcOVgSGZPg0/ws0TfYoXJBz
	agxWLrgTcSRvm6jCucCV79VorvF+OU2j5auLSlXWYnMIThOZfnIBsuXX8v2xUqk5d70bJ2
	CeOmjUWJoGML1k8d5vqLXPTBVyGPB1+H+bq9f7O66Lr+OBEYnIL3iSOzmOeva3abfvq3B2
	AnF4eYwXaYrVyDmVEAZ8vWd6mK+98rRWEXDaAPW3/A7LtIBwy7AhR9iUUxdTcPNZ2YUf+h
	GMmCw1lQxigQLUG54XTKkxQovg2t6nRao8WprGO5uNihQzakoNPbeyxXNqM4+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787641327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NAdN3vZtcV6SqCRRVXxqYMH2Z4Z+rkNa4uz3nIVYnrM=;
	b=5KQT7nZn4YpggPzljaCucS+YBIGfbtxZG6KuNsHGq4NUIhd19V0HpQfIzVnsFNAH8x97LK
	Oi8BlWoI0K8u1kCw==
To: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, yuanxiaofeng@eswincomputing.com
Subject: Re: [PATCH v2] riscv: probes: reject kprobes inside LR/SC sequences
In-Reply-To: <20260822105303.2043-1-yuanxiaofeng@eswincomputing.com>
References: <20260822105303.2043-1-yuanxiaofeng@eswincomputing.com>
Date: Tue, 25 Aug 2026 09:02:07 +0200
Message-ID: <87v78y7keo.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_000213_770608_878E8C6F 
X-CRM114-Status: UNSURE (   6.48  )
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
> +/*
> + * A trap taken in the middle of an LR/SC sequence clears the load
> + * reservation, so an SC following the probed instruction would always
> + * fail and the enclosing retry loop would re-enter the breakpoint.
> + * Reject probes inside such a sequence.
> + *
> + * A constrained LR/SC loop (Zalrsc) must be contained within a 64-byte
> + * contiguous region of memory and comprise at most 16 instructions.
> + * Both bounds hold regardless of the C extension, so scanning back
> + * 64 bytes from the probed instruction always covers the enclosing
> + * sequence.
> + */
> +#define MAX_ATOMIC_CONTEXT_SIZE	64

Instead of 64 bytes, can we just do 16 instructions?

And instead of finding the start address to scan and then do a forward
scan, doing a backward scan of 16 instructions is probably cleaner and
more efficient?

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
