Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C23C61DBD
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 13:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iOG2qZMPu/M25CkRheiiWoEvlQFohfA/jXWO9Vc/NJY=; b=bx3TURB0ubXtLI
	HNT/3Sw142RfqX+5Mb3SYeqQHGuF5755EXdZ3FEfKePnfzStc49uJjMbpPLaTrU9DPdIJFztbMSbP
	fMvrxZKTZ5O4+IXfAuezyIrv0uBBphAUDaW6Z2kFJeOyxHWONXqnNSuzrt3gBVsYCxAaFnW2NFlSO
	lAkoawhLA869BjYxvrKao/Ajk45DSGsQUwZHi9BrqB3/HIGtw/RmvmQ6G4kOuY3/+NLb4tTOAUjoP
	cxQXch+Fr2rC7COpWln1jpQ/F/tZXTpnyB0ZznmoMpxDxIzNyGeO1Lo0a1nw0aFVZpzdFVPUp87AW
	b1VkO0Qu8M/5YNea6Lcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzDIy-00000002Tf0-1XBY;
	Wed, 26 Aug 2026 13:04:36 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzDIu-00000002Te5-28XP
	for linux-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 13:04:34 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787749467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wpSzobdW7JdDHwC0e4Ezi+h72uHE+Mul1UkI6UnwtXo=;
	b=Our6ZHzNaVxaDs6CRXZ5w6h/VMnlhRsNy+QG7a/N98JG8Qv5Xk+XGNMLLU4XEFHWrA/d/J
	O5klY/PDXr43Axr5/aewn1SGp8toQo6JeMtMODtcG2Z01hCWbe7o3Yi9NERt/AJP2wmaVb
	MK7Fe7E4Ci6kbnqPPbV2SVbxn43TSi4h3JquNpJNCpvvebwXrE7fygVQOwbb3u93bXGiqT
	Y+5GIOM9jpOh3BqtQjiqlxcUVKZmTKBCjZo59w/vdH+/11b9AdqBvy6BSEbUy0WC/45j4e
	bV2x1PSUJZfD//ypWmPYZ27s4NDk1h84cV81R4qx1jwaGKDiDtwU1kw0QE9nyQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787749467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wpSzobdW7JdDHwC0e4Ezi+h72uHE+Mul1UkI6UnwtXo=;
	b=KJZL7ijfMjYxE6Jd4ZpRY+5Kc3/LSC2tL0JmFgYV2Io73KNXqK6XSvuRbGzBY7xSagKiS0
	G/6m2U3Nt9aTNRAA==
To: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Subject: Re: [PATCH v2 1/2] riscv: kprobes: simulate nop and c.nop instructions
In-Reply-To: <20260825122020.1192-2-yuanxiaofeng@eswincomputing.com>
References: <20260825122020.1192-1-yuanxiaofeng@eswincomputing.com>
 <20260825122020.1192-2-yuanxiaofeng@eswincomputing.com>
Date: Wed, 26 Aug 2026 15:04:26 +0200
Message-ID: <87wltdt4md.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_060432_690075_E6DF1376 
X-CRM114-Status: GOOD (  10.38  )
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
> nop and c.nop have no architectural effect, so allocating an
> out-of-line instruction slot and single-stepping through them is
> pure overhead. Simulate them directly in the breakpoint handler
> by advancing the program counter, following the approach already
> used on arm64.

That is not the reason why arm64 simulate nop. And how is single
stepping slower than simulating?

> This avoids slot allocation, text patching, IRQ flag save/restore
> and the single-step exception for these instructions.
>
> riscv_probe_decode_insn() is shared by kprobes and uprobes, so the
> simulation also applies to uprobes placed on nop instructions. This
> is relevant for USDT probe sites in user-space binaries, which are
> nop/c.nop instructions, the same use case that motivated the arm64
> implementation.

I can only find https://github.com/chrisa/libusdt, which does not have
riscv support. Which USDT are you referring to?

> In kernel text, nops are also found at ftrace mcount call sites and
> disabled jump_label sites.

Not sure about mcount, but isn't installing kprobe on jump labels forbidden?

> Measured on QEMU (RISC-V virt, emulated), this reduces the per-hit
> cost of a kprobe on a nop by roughly 40% compared to single-stepping
> through the out-of-line slot.

Reading the arm64's commit, simulating nop should only improve uprobe,
not kprobe; or am I confused somewhere?

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
