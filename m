Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EB6C52D7B
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 17:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UIsTe+8txvQtjP+y2Xlo6wHv4//qkYCcf2UfNw4e2bQ=; b=ZckLuVhaKwpt3X
	G2xBYo+Y7f8T4JZZPc0B3F4ulyno9v50xhnTTcrxzwtTWJ5SwI8ImWK6oniwBGwNTPsc0APJsCz3u
	AjR2DfnlstCV7vVR9/EFXMSE9qKM3YkBznQJtPzekn3vWhnh0s3cMusSSKRgD/vf6XGdbHsZbVSCh
	/BbUHgu5mru5lLNfFNu8W/N16HeWZoIyBto45vXLCgdU1zlwAqNLXnFSS59I1r0oWSkdOuroADRXr
	DVSpyGXlyQtdnPQk1eluX5keJeHddZVlxQ0dCL3e1kr7xgOZR+VIKdxxzbfxo1cGsKzQGjmAwP+Tx
	rKc1/SI7T370zP35/o3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seHYm-00000007mfa-2wzw;
	Wed, 14 Aug 2024 17:13:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seHYj-00000007mfG-3qvC;
	Wed, 14 Aug 2024 17:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CccF10Y1UVzqVdXNkHG0Q64NFYze/yEsWDqzDzqW7vg=; b=jMSBkpkEqt8WS+F2dp4Vv9k29E
	uvhexiSRt/j6BZcXWYWhwFZRtiXP6U1lvw1czQiH+KNd72I56m4MYPtsT6fjoLpt5zpYQLn1KJR7V
	//A13nNRvQuOdUlfQX0zKb1mA9sweTFZhxmoVhdvrLHTy4dtQW1xOoMzDLcm5vc6LlWHvvPRpRVtm
	kpRvLb8GIfoprE7rCO712liHkEn9FPsoT6qeRz1f+cqBU8GROFhO5kmGFUkcteUQNB60I3VJDJjnc
	LQoQoyMzpWy5r6yPbdhByxjE2+SCeJzLB2IP5fuzMH37JuKus6pSF5G5VNezNRjd+F8nW5QOzBbuD
	qVDSrCYg==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seHYS-00000000ndL-2y8J;
	Wed, 14 Aug 2024 17:13:00 +0000
Date: Wed, 14 Aug 2024 18:13:00 +0100
From: Matthew Wilcox <willy@infradead.org>
To: alexs@kernel.org
Cc: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Brian Cain <bcain@quicinc.com>, WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>, Bibo Mao <maobibo@loongson.cn>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Vishal Moola <vishal.moola@gmail.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Lance Yang <ioworker0@gmail.com>, Peter Xu <peterx@redhat.com>,
	Barry Song <baohua@kernel.org>, linux-s390@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Hugh Dickins <hughd@google.com>,
	David Hildenbrand <david@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [RFC PATCH 00/18] use struct ptdesc to replace pgtable_t
Message-ID: <ZrzlnIWrnaUx66rY@casper.infradead.org>
References: <20240730064712.3714387-1-alexs@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240730064712.3714387-1-alexs@kernel.org>
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

On Tue, Jul 30, 2024 at 02:46:54PM +0800, alexs@kernel.org wrote:
> We have struct ptdesc for page table descriptor a year ago, but it
> has no much usages in kernel, while pgtable_t is used widely.

Hum, I thought I responded to this to point out the problem, but
I don't see the response anywhere, so I'll try again.

> The pgtable_t is typedefed as 'pte_t *' in sparc, s390, powerpc and m68k
> except SUN3, others archs are all same as 'struct page *'.

And there's a very good reason for that.  On s390 and powerpc (I cannot
speak to the sparc/m68k), each page table is (potentially) smaller
than PAGE_SIZE.  So we cannot do what your patch purports to do, as
we would not know whether we're referring to the first or subsequent
page tables contained within a page.

Maybe at some point in the distant future we'll be able to allocate
a ptdesc per page table instead of per page allocated for use by page
tables.  But we cannot do that yet.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
