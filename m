Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C92C53219
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 10:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rAAlZQL2mUykzjEXWTc3qO7EN6osKy4Rd6iIM+R9HmQ=; b=mWYyF27MdmM16a
	hEogk3D2BsfzjmtKvI73Te4Ejtj/Wl5ZfVQxEK249lPE9JPPscdPMJYfnWQWCteUnQm+St6o5RaD2
	Pe4gC/Z1vuJnRGQSZkpTsTYtv/3oS4lDfonLKzqvdqY/3Riopsknp2ho9am6DplOT4lp/+QGXmrF9
	78dPEEAZR+lPp/+/8B6KjXLWrFVZYIT1sKYGlZ9lr7YC26OW5tWR4TVTkzOLM/7ksPAWaCpV0NOWV
	FgS28wVksBLEbBEzZDzGr8xjk4evArkvfJ0cA3qgRwxK+XDKnB7Yrd9aEFzzsvwvOO2kIQFrnk9+4
	aa2mwhwagDED3L22ecag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wofKw-000000050es-2AWr;
	Tue, 28 Jul 2026 10:47:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wofKt-000000050eC-2za1;
	Tue, 28 Jul 2026 10:46:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LrI5jV+9lXNAqZIXhKCOO60TpJjIaMeX3ChNxpBQxyE=; b=K8CCxGGrapIcqHInx/7kof6kca
	HCFPPO5QU1klh4tiNTlKP3uNgbwrsSQDJ9nafWEGexokijPJ5vN+3+nL/JDn8Dk91aMNa7wPqJtyb
	u1pWFl/Oax8LyTDsqOjYPlRtnq/H2aft7UIkh4zAET2xULeB5OEYbu9utOEVe9cJhicjY7cWNZc9Q
	J3iJBOYIthtEVS0z6AAqdUEE+8rYWTv4TYZ1/5Auty0QflNhaxHrYJaPtHles362rX9/tB2ZrBebH
	AcurUXuksS3zfrqTfO8Y/aDWsNPmn8kh8Ddi9dDI0UNfRMyNV15/dP+jZT081aEyUpe3rlYr/3kJp
	t2nNPAnQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wofKo-0000000CzEg-1C8e;
	Tue, 28 Jul 2026 10:46:54 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BA9DB30093A; Tue, 28 Jul 2026 12:46:53 +0200 (CEST)
Date: Tue, 28 Jul 2026 12:46:53 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,
	Thomas Huth <thuth@redhat.com>, Jisheng Zhang <jszhang@kernel.org>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	Guo Ren <guoren@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>
Subject: Re: [PATCH v6 8/8] futex: Use runtime constants for __futex_hash()
 hot path
Message-ID: <20260728104653.GH49951@noisy.programming.kicks-ass.net>
References: <20260728052540.4728-1-kprateek.nayak@amd.com>
 <20260728052540.4728-9-kprateek.nayak@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260728052540.4728-9-kprateek.nayak@amd.com>
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

On Tue, Jul 28, 2026 at 05:25:40AM +0000, K Prateek Nayak wrote:
> From: Peter Zijlstra <peterz@infradead.org>
> 
> Runtime constify the read-only after init data  __futex_shift(shift_32),
> __futex_mask(mask_32), and __futex_queues(ptr) used in __futex_hash()
> hot path to avoid referencing global variable.
> 
> This also allows __futex_queues to be allocated dynamically to
> "nr_node_ids" slots instead of reserving config dependent MAX_NUMNODES
> (1 << CONFIG_NODES_SHIFT) worth of slots upfront.
> 
> Runtime constants are initialized before their first access and
> runtime_const_init() provides necessary barrier to ensure subsequent
> accesses are not reordered against their initialization.
> 
> No functional changes intended.
> 
>   [ prateek: Dynamically allocate __futex_queues, mark the global data
>     __ro_after_init since they are constified after futex_init(). ]
> 
> Link: https://patch.msgid.link/20260227161841.GH606826@noisy.programming.kicks-ass.net
> Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de> # MAX_NUMNODES bloat
> Signed-off-by: Peter Zijlstra <peterz@infradead.org>
> Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
> changelog v5..v6:
> 
> o Picked up tags from Charlie. (Thanks a ton!)
> 
> o Picked up Peter's S-o-b from his tree.

Right, so I also munged the Changelog in my tree to include those
benchmark results. I failed to actually push out those patches before
disappearing on holidays, but I recon I should refresh them patches and
re-munge the changelog?

> o Added a barrier after runtime_const_init() after to prevent compilers
>   from re-ordering a later runtime const usage in the init function with
>   their initialization. (Sashiko; Reported by Intel test robot with a
>   GCC14 build).
>   (https://lore.kernel.org/lkml/alNgNvhIkBfkGo1Y@xsang-OptiPlex-9020/)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
