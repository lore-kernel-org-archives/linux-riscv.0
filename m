Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE14C636CC
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 20:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HZviUEhvsW2KXxGYslbatykY3ekwDMBfyYvYpW0MCn8=; b=Sx7lV9WFCLYFDL
	Ra6QgAnfQELiO8/uPuiDl02KSwNEi4TdqJV19liqPA9noJEQ/BFkie8xWHx60dy7BbK1IviaIjmuA
	/O+voqVFKA2loRFFm+MFlljW9dDl+L14UsYSImBYdD+WfkMzfyfx6qkJcMfmgvgOoIntC/iu1fg94
	l5Vd3Q7BmxH6tUi/EPR7SHOMO5ivKmOFJMQGVUPzVCHgJIF8Mxaf+4iTYk3teEyMpJutr1vhzcaun
	JdSuA2zfKMizAJaB+hH+7HsoNpEPU6wzf5pYyZJpFjgcG4fsxBfPr/XAE+OYC8BGLIIeMPJzF3knT
	oKwutdIoUtBSLnVawy5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPUZO-00DKAH-1q; Tue, 07 Feb 2023 20:28:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPUZF-00DK80-GZ; Tue, 07 Feb 2023 20:27:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XM5/DhrpywJuIcEgHHCo/8ZgkbeDJDYpTgAA6DELtws=; b=U421OkqtCK6gXcQf62Ryz9sZ/W
	LZu+W2C5RVzWjNR1EJOlHTdtbUA8ODN3LbSVdDS3DjxVjKsvyfrdU85iUtIK1EgYxrddQ0m2wTalm
	OssTp+Q+6OmZYy35VF4f8TBsgThmOB3u+RJ5a68V/pzMcXN/KM/Ez/WO3wthlQHUm0ELHHtc9xZYE
	D46tkAcEKppoPWtpXr3+JsOkVr4ibVV2RCEgi+21G7Cx3eq2LJAbAe7NpSaz6q0Nunm9jiFI6Bw1a
	MDE52Mqb5eTuWPKHiCG+W54+Ozx9KzoajI/jLRKPpRgEHssXN6Hk+ibtCKSSi8VsmJPAbnS9pIDOm
	jRVggYwA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPUZ1-000XLi-7h; Tue, 07 Feb 2023 20:27:39 +0000
Date: Tue, 7 Feb 2023 20:27:39 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-arch@vger.kernel.org
Cc: Yin Fengwei <fengwei.yin@intel.com>, linux-mm@kvack.org,
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>, linux-parisc@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, openrisc@lists.librecores.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org
Subject: Re: API for setting multiple PTEs at once
Message-ID: <Y+K0O35jNNzxiXE6@casper.infradead.org>
References: <Y9wnr8SGfGGbi/bk@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y9wnr8SGfGGbi/bk@casper.infradead.org>
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

On Thu, Feb 02, 2023 at 09:14:23PM +0000, Matthew Wilcox wrote:
> For those of you not subscribed, linux-mm is currently discussing
> how best to handle page faults on large folios.  I simply made it work
> when adding large folio support.  Now Yin Fengwei is working on
> making it fast.

OK, here's an actual implementation:

https://lore.kernel.org/linux-mm/20230207194937.122543-3-willy@infradead.org/

It survives a run of xfstests.  If your architecture doesn't store its
PFNs at PAGE_SHIFT, you're going to want to implement your own set_ptes(),
or you'll see entirely the wrong pages mapped into userspace.  You may
also wish to implement set_ptes() if it can be done more efficiently
than __pte(pteval(pte) + PAGE_SIZE).

Architectures that implement things like flush_icache_page() and
update_mmu_cache() may want to propose batched versions of those.
That's alpha, csky, m68k, mips, nios2, parisc, sh,
arm, loongarch, openrisc, powerpc, riscv, sparc and xtensa.
Maintainers BCC'd, mailing lists CC'd.

I'm happy to collect implementations and submit them as part of a v6.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
