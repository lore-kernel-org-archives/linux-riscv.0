Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE92BC5DF86
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 11:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RvlofwFPBp27Qt9jNjNWY0RtYJPv/yARJmuZh6K9M0Y=; b=TeRXKIlwSk7P2X
	xjFpUlvZwoxAljTATpgAiGgTZ5hNt8cjZBZmgf0zxFEbQoOT+vEKor+0TsOOcYnc3hcKw/Ig0Z6oH
	X5jgrsap2SZD/1SD8ROJCKd4PGwmUj6Xia1E/WCNIvtMgDFYNiq+kMtcLM/Al1+c6GeZ9m0Ak5dJj
	NdZLo9os0GG9A2dIEbOOSR7NCIPbOTtvq16xuRftZMdGlAwopxGDl4csqv+hngUn0MZqLVLEkdegJ
	oWVBJBEnq30LEffLcibqnYC3VMe8LyZftJRWlMAjPKHx4kNUlzIUCkIBt4mDn+4qWEFEYCPVpoTkJ
	RsRCMQFofyCst8So318g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwesQ-00000009i9i-3uZo;
	Wed, 19 Aug 2026 11:54:38 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwesN-00000009i9K-43jO
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 11:54:37 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787140471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RYpxw72qafocDCqc/O8Qp3as+AySxj5F7qOY2AyalNM=;
	b=w8QTIfhKC7t6Pr5OJQjAia4VH9GfBQ6VbOWWq+a4OIc/ekDiQF6j5cEZAWNZITnux5SLw9
	dCOs3yXsLivj0uFqjKj73H8esGhiRQ75QqsiZccqW00H/DPjCgrGLG23vpXpkJ5qwFsxRA
	P/AD7bDgSbVxNo0/80JoOgv2h6ckJ9+3NoraP41h//g5z2G3Z0s6r5hsLcf16FNR/OBfFI
	RRnlcCpop7FbC8KFIxRXEvdcOJi+xVsBAyEu95h+O2VgUvfX+1ScjQBgDP70t81NLbXpxS
	nsMJUW/fpgsEJQkDehnS+D/dnYObbip/BVKJw2yjOiPj+Y0RSCcshJvg8Y6EPQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787140471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RYpxw72qafocDCqc/O8Qp3as+AySxj5F7qOY2AyalNM=;
	b=OhjtHbCj2LacsBPZiIU7djsmV+x0qERKHaMYl71zygGrmNBArEOgy8X5rd7uA7gdZ2QWMp
	6SS3dSVkO6ypANDw==
To: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Nam Cao <namcaov@gmail.com>,
 linux-riscv@lists.infradead.org, yuanxiaofeng@eswincomputing.com
Subject: Re: [PATCH 1/2] riscv: kprobes: simulate nop and c.nop instructions
In-Reply-To: <20260819101419.1367-2-yuanxiaofeng@eswincomputing.com>
References: <20260819101419.1367-1-yuanxiaofeng@eswincomputing.com>
 <20260819101419.1367-2-yuanxiaofeng@eswincomputing.com>
Date: Wed, 19 Aug 2026 13:54:30 +0200
Message-ID: <87zeyil409.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_045436_152424_629C7CDA 
X-CRM114-Status: UNSURE (   9.80  )
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

> nop and c.nop have no architectural effect, so allocating an
> out-of-line instruction slot and single-stepping through them is
> pure overhead. Simulate them directly in the breakpoint handler
> by advancing the program counter, following the approach already
> used on arm64.
>
> This avoids slot allocation, text patching, IRQ flag save/restore
> and the single-step exception for these instructions.
>
> Compile tested on RISC-V, and verified with the RISC-V kprobes
> KUnit test which now covers nop and c.nop.

For RISC-V, how common is installing probes on nop instructions?

Looking at the commit adding nop simulation on Arm, I see it is useful
for probes on USDT. Is this also the case for RISC-V?

Additionally, it would be great if there is a benchmark to justify
adding this.

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
