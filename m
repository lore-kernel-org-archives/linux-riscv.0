Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14303606A330
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 14:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S7M8B46k;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=KQM/cjnZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KosAbBEMOUnQyuTxgzKQwJPzRCOG8jYVCuRBE+N9HWk=; b=S7M8B46kQE02saNWwXkYaxdf5B
	sBPBs7wqqedlafFoTHfHykCYIP2xSc/N7sPd2kp+PfpvJAeAlVFaKUI4/c62FClAOyNR3fH1K5CRT
	zzkSnWmC7YNQCcSyQStEVuV4Lo06DLtTYF/rWYH5ZNARuxYTdDFjJWjEM5JpFR825Nu+rJe8H7/9e
	P09+mRnrQOamz38ZlBWk/au8eh5JhF6Ja1gdRVfqRSHr7kGC46SUR3GOKUbgL719Kk7o3dAkaBS4V
	z684C+t5zCk56fUhuEI6GRrONmeAArG0aqxY9qL4Cc7mkh6scLefl31Wxo1aeFdA+YiJxgAGoFWkp
	oFOqFaOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcDA-00000005fqy-13yf;
	Wed, 04 Nov 2026 14:43:36 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcD7-00000005fqT-1AlW
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 14:43:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hKqJ2uEOYtzQRvkSXtbhCR2QllFPzuY2q8Y7E0Q6qWQ=; b=KQM/cjnZBeXbhClEjzLNifwdvv
	1gwqKaOIRYpt/7Zp2XKHAGBHin8pIN0KOwxdBBigiJFWAafnEGpiv0j51/I1BC5w0FOsuGQ0dkWQV
	UQAIq9uCc5RxA1rHorLv367s39pjOe54LQ3uPosGpFkWX0SJQSMPvGTndfvNKWgO6oVz6tEIPRzQc
	auFZUwTBBNslh4KF8MVJUhdkoytWqLZLrnKvIFSi8sytczmoToUnnLzQL5TxDMjtMG7agAC428D38
	WptdPp+zMLc1uvDFYzBg93zI/0GbsbeE5vMLkfH6qapySueK8lNICrM9XtOyjTr8+WHVslaJ4Untr
	IVnIX+yg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xOcCo-007nSH-1w;
	Wed, 04 Nov 2026 14:43:14 +0000
Date: Wed, 4 Nov 2026 06:43:09 -0800
From: Breno Leitao <leitao@debian.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, SJ Park <sj@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v3] tools/mm: add hwpoison-panic tool
Message-ID: <autEaeyHvhi8vvSK@gmail.com>
References: <20260813-memory_failure_rewrite_test-v3-1-f9fb6542cbff@debian.org>
 <12f80449-9d6c-4fb7-bcc4-e7d38e868da2@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <12f80449-9d6c-4fb7-bcc4-e7d38e868da2@kernel.org>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_064333_329541_CEA810BA 
X-CRM114-Status: GOOD (  14.75  )
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

On Wed, Nov 04, 2026 at 03:35:16PM +0100, David Hildenbrand (Arm) wrote:
> On 8/13/26 13:45, Breno Leitao wrote:
> > Add a tool that enables the vm.panic_on_unrecoverable_memory_failure
> > sysctl, picks a kernel-owned PFN and writes its physical address to
> > hard_offline_page.  Three page kinds are selectable with -k: rodata
> > (default), slab or pgtable. In all cases the host should panic.
> > 
> > Example:
> > 
> >         # ./hwpoison-panic -k slab --yes-panic-my-kernel
> >         injecting hwpoison at phys 0x100032000 (pfn 0x100032, kind=slab)
> >         expecting kernel panic: 'Memory failure: <pfn>: unrecoverable page'
> > 
> > In dmesg, you will see:
> > 
> >         Memory failure: 0x100032: unhandlable page.
> >         Memory failure: 0x100032: recovery action for reserved kernel page: Ignored
> >         Kernel panic - not syncing: Memory failure: 0x100032: unrecoverable page
> > 
> > This lives in tools/mm rather than selftests/mm because every successful
> > run crashes the machine, which is not something to run from CI.
> > 
> > The --yes-panic-my-kernel argument is required so an accidental
> > invocation does not take the box down.
> 
> This is not upstream yet, right?

Right. :-(

> Anything missing or is this good to go in?

I would say this is good to go, David.

--breno

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
