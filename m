Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930ABC43334
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 13:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MkSRwKwY6F3Gi44Xw2kUo8kqQMqzegxtOQg4/i8Jqws=; b=sWtPLKEMTEr30O
	cVTvHjQ/Wyv3iYQ0I5+umPQrRFnuRx9UTMkvHnLDmh8orEjoxny8T2WyyCtNKyGEX4Tr9nFyoxcrM
	5MpWGNoNn2CBs6kbilBMtA4e+ZhvZc6luG8M4brfGPWnEGZlbkh5ERjhKNju+RCRBUyqWvho4uvvK
	TtJ9emBQ45UNyTrsYVH3hG/hUTjnAkfNazuaDtUjDjY130BaNN/Ai4qH/xRUmdQmmcFYGnlewLse3
	TSFPhW+uYKtHQea0La+JHThG1W1IMNZur3N/VxUG0YszvsqczIhN0hbLOtEekMoFqKgKJEvPVg1U2
	b5wSVBwJTln1RknMs6nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8MOt-009GUb-1h; Mon, 04 Jul 2022 13:46:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8MOr-009GTy-9P
	for linux-riscv@bombadil.infradead.org; Mon, 04 Jul 2022 13:46:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9KSp83B2HRrIjEIK0/a7lJrmsuqlIZtZe0Q7lj9gHs0=; b=BczO17nwDoPRhpsSqmE5BjhON5
	j1HdkyxD9RPWKjGJVu9nYzRaWyNXM7qbeNkCN+/rnKhIh9PdgnCuQy0gr5nxnWzptHVlAZIw7TmqD
	7SKZ8bMcE6pF6hUT4+YfcUCViaEcC6COLv/Ntix+CAKrRyCnpinxt1oE5rHoyuwfSO2AKZzqTQ1nz
	Krq1OjAcT9PuPtP8IHydQPkuz3xJPsGT7mbXLpS7onmLH/+Fwy1EmCc4HwpfwbrEzh26WDdrZBMvU
	BzeH9k1ThpeVQ/81iT9jvyGZlkraWcdW7eOKkB2KDF9IRFJ7uYpCSmDpVi+rbvLMIJQdpVtK58F6Y
	CNK6cIuw==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8MOc-00H97I-4c; Mon, 04 Jul 2022 13:45:59 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 2F4FD30033D;
	Mon,  4 Jul 2022 15:45:48 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1947D20294871; Mon,  4 Jul 2022 15:45:48 +0200 (CEST)
Date: Mon, 4 Jul 2022 15:45:48 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-arch <linux-arch@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V7 4/5] asm-generic: spinlock: Add combo spinlock (ticket
 & queued)
Message-ID: <YsLvDHYlLgmfzP4n@hirez.programming.kicks-ass.net>
References: <20220628081707.1997728-1-guoren@kernel.org>
 <20220628081707.1997728-5-guoren@kernel.org>
 <YsK5o8eiVHeS+7Iw@hirez.programming.kicks-ass.net>
 <CAJF2gTQ0cmGJHPR=TzeDJDigiEgBL5-KabbR2WkS=dGJV7jSJA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTQ0cmGJHPR=TzeDJDigiEgBL5-KabbR2WkS=dGJV7jSJA@mail.gmail.com>
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

On Mon, Jul 04, 2022 at 09:13:40PM +0800, Guo Ren wrote:

> > Urggghhhh....
> >
> > I really don't think you want this in generic code. Also, I'm thinking
> > any arch that does this wants to make sure it doesn't inline any of this
> Your advice is the same with Arnd, I would move static_branch out of generic.
> 
> > stuff. That is, said arch must not have ARCH_INLINE_SPIN_*
> What do you mean? I've tested with ARCH_INLINE_SPIN_* and it's okay
> with EXPORT_SYMBOL(use_qspinlock_key).

Well, with the static_branch and the two paths I just don't see the code
being sane/small enough to inline. I mean, sure, you can force it to
inline the thing, but I'm not sure that's wise.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
