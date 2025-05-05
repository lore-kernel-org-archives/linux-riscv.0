Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9FFC3ABAA
	for <linux-riscv@archiver.kernel.org>; Mon,  5 May 2025 16:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ojy60eC55bSx5nKNz2D/79iBAtJsvb9clT8uBcAQjQ8=; b=FRvN2XL7P2Toh/
	hu9l7wObeEl+pbPGl7jFa/3de6mqnl9VT1my3JZS+uzOzAT+mh+qunT+cqJufco8cAd8qzlxIjxnl
	JSfBrVswOq3ylNVtqh8WGk6vrNDiq6mzB+0DVjt67HFhMI2XstM2+n+nZs9oON+WXQHDUDK7iUOor
	j3qWx3/RK7cNIDYP6+dvn9NQCr0bbsoDiS2Pkhmqn7Mz1a5aDT2D/3yZhU2X9NOaWSDbqA4jEnALd
	/MRtGS1QTFRtX4glHgPvpjV0DALmLgUkvhPjx1HbgrAcBTopqIgKhFgNvtENaf0WUHOiCFRL2Cg4d
	gEDfXXWKU6Aj0oyM9YUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uByUG-00000007wn1-0p2p;
	Mon, 05 May 2025 16:16:12 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uByLq-00000007vTh-0yGq
	for linux-riscv@lists.infradead.org;
	Mon, 05 May 2025 16:07:31 +0000
Date: Mon, 5 May 2025 18:07:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746461244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=08eIPimggJQjsCxpYwxCXgIC7iP02Dyp+Q4wrrtM0+A=;
	b=32lxmmV+XRVrWd4azsF3rJZe6ZR/Uj/1ZocrxB4jYGcujZIPOqZgdhGA4eZ3NVqGkLuzyv
	U4flqVMMIH2TBBxKeZTPmqOyB/sRHnxYFYxq6zXHx7GQSKQwSrsltoUBTXivkLjr3dDcWj
	Xrm6/fqVct34Ahp8yU9gbkTEKprC7xh5lBdkO8mo2FQgQZFvcMMcuy3Q6sbEQNe0TUdvq4
	wKuySY/NL6S7R/Bdh7ieB8MUyzuBCCU1l7y2ew4QJTlkjIj5rVH88IOIKhtxK8w8tqa50E
	3zpmp3Bgq8xWX8Cq8JilZ8f9aRQ23/uMfXayuS99NkFIqHAZOL11xSbejPtJhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746461244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=08eIPimggJQjsCxpYwxCXgIC7iP02Dyp+Q4wrrtM0+A=;
	b=oQ+KrGWoBQqoqXEOgZapUD0ZNjow+3J7oUxOWUAt91a3nahu+bRt1Z0jlADPCI6XycsS9k
	2MJCpevvQfne1cDQ==
From: Nam Cao <namcao@linutronix.de>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] riscv: Fix kernel crash due to PR_SET_TAGGED_ADDR_CTRL
Message-ID: <20250505160722.s_w3u1pd@linutronix.de>
References: <20250504101920.3393053-1-namcao@linutronix.de>
 <c59f2632-d96f-43c6-869d-5e5f743f2dbd@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c59f2632-d96f-43c6-869d-5e5f743f2dbd@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_090730_414403_7DA3CF14 
X-CRM114-Status: GOOD (  13.21  )
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

Hi Alex,

On Mon, May 05, 2025 at 06:02:26PM +0200, Alexandre Ghiti wrote:
> On 04/05/2025 12:19, Nam Cao wrote:
> > When userspace does PR_SET_TAGGED_ADDR_CTRL, but Supm extension is not
> > available, the kernel crashes:
> > 
> > Oops - illegal instruction [#1]
> >      [snip]
> > epc : set_tagged_addr_ctrl+0x112/0x15a
> >   ra : set_tagged_addr_ctrl+0x74/0x15a
> > epc : ffffffff80011ace ra : ffffffff80011a30 sp : ffffffc60039be10
> >      [snip]
> > status: 0000000200000120 badaddr: 0000000010a79073 cause: 0000000000000002
> >      set_tagged_addr_ctrl+0x112/0x15a
> >      __riscv_sys_prctl+0x352/0x73c
> >      do_trap_ecall_u+0x17c/0x20c
> >      andle_exception+0x150/0x15c
> 
> 
> It seems like the csr write is triggering this illegal instruction, can you
> confirm it is?

Yes, it is the "csr_write(CSR_ENVCFG, envcfg);" in envcfg_update_bits().

> If so, I can't find in the specification that an implementation should do
> that when writing envcfg and I can't reproduce it on qemu. Where did you
> see this oops?

I can't find it in the spec either. I think it is up to the implementation.

I got this crash on the MangoPI board:
https://mangopi.org/mqpro

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
