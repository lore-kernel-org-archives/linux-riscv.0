Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4473606A330
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 07:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dow1NjOx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=vuOGSBeH;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Shvk1tnS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ucNf9Ow6S0K7voG5gkvc/bunEHQkHRDxaC03w9gSFaI=; b=dow1NjOxAsn61lLyJ6L0wsxu5o
	eszCl815s7SZeB2FSx+Q5fXxNnyBtOtZHVZdeUj8EKU3vtvnDMRIYdZ5ZxjU+KtAgCdAJi8g0X4RU
	zHBnJbQRhgStBzwOP09UHCNuvVZeD/ka6WuPNgnaC0/pnsAXAtXjMBo8DyTePwQV9Unr4ogW99s0f
	ILKYZ8l3itfZUCb6SLN0n0TZk27SmIFmZDhSvfBz/yA+a6cuRXx5oo2/4pOJxVcnOjHAYM7uh62oi
	doGyMR3KUiTolrDITNvkuxowJ1IT5EIDMzKfJsgRFcskO1VXakXmf1LDHCIHodz4WikjPtollfSni
	Fs3liuUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPeI-00000008zJ3-41E4;
	Thu, 12 Nov 2026 07:55:10 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPe4-00000008zBB-1KtX
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 07:55:09 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794470090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KwJrcQfVDfyTH1nd3+0sXLk+BgnSBwKnfL6FKVxivf0=;
	b=vuOGSBeHFSXLeTnQ1rAmzpGcwlluLM5hh7tNPIOJQWRQ4ZFfFHOMKBedzNPU3Ny4marm0U
	4Nq1bbOWWQ2f/P9fY7Rz1zTLdNUrRzYoJMkbevZhFGKeJ8/31SN506Nuy7ooUxPtdkxYqf
	OHrvaCOHqplXvSYu/cUkeJr9SUKt4K0hov2z9YVYpDvmSwZDEr3VmhG2dZdwMsvWvp/15H
	Axonar3cZC1LFU+SEzK9ppesxtpem3J2DaAv8F55F51fdsnUXmeCuxs/Wn+tlllHo2dvVh
	Sj0kcI1eQke0orVsN/UBFe0n21MwkE/ts/ljIKuAvphhY8VZ62dbXelLsDC0tQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794470090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KwJrcQfVDfyTH1nd3+0sXLk+BgnSBwKnfL6FKVxivf0=;
	b=Shvk1tnSPIAhWNY0KOp1zgdj9cJM0uGvvjmxj+Jvwz/CDs+mOlvWZ5EsBlJZQ5r4Hu6byN
	vKdGoaJfbnoEEmCg==
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Masami Hiramatsu
 <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH v2 2/2] riscv: probes: reject probes inside an LR/SC
 sequence
In-Reply-To: <20261111-probes-in-lrsc-v2-2-b2525b7e1e8e@mobileye.com>
References: <20261111-probes-in-lrsc-v2-0-b2525b7e1e8e@mobileye.com>
 <20261111-probes-in-lrsc-v2-2-b2525b7e1e8e@mobileye.com>
Date: Thu, 12 Nov 2026 08:54:49 +0100
Message-ID: <87jymicwmu.fsf@yellow.woof>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_235456_693174_71BCCB18 
X-CRM114-Status: UNSURE (   6.27  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Vladimir Kondratiev <vladimir.kondratiev@mobileye.com> writes:
> A kprobe or uprobe replaces an instruction with a breakpoint. The trap
> clears the hart's reservation, so if the breakpoint sits on the lr, on
> the sc, or on any instruction between them, the sc fails, the loop
> branches back to the lr and the probe fires again. The sequence never
> completes.

Xiaofeng sent a series addressing the same issue:
https://lore.kernel.org/linux-riscv/20261019134121.1763-1-yuanxiaofeng@eswincomputing.com/#t

I have only skimmed this patch, but this patch has an important
difference: riscv_probe_in_lrsc_body(), while the other series
implements a kunit.

Perhaps you two should join forces?

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
