Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0434CCD183
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 18:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bKXIsvRcr1O3qLehCU+k95hu5KqEaLqqx9EHL3Zc5cg=; b=HaTkWCoqAV2LMo
	3uTtj3qRmNUrVG4iD3O7ZcsFN5/CI0Fb09W8mo5uS/Kp6R7+pqrvoYi0CSOlb47IrVsSzR/B7C47X
	pxgSgxcw0ua102xJmQvfsNnt3T2Wgxlreop5F0WcRZwacBxCv29Ylch1U4Cic6g1hy5HS7yyvBPrf
	/fMIgdeeHRKn6BfOm3hCpNAXRDuxLIYBCpWH8962u3EiGnPZvkzBBWaIhvnSSSSX+hPEI+F1RqvJz
	ew0FAQwWnjRhfmb86Y6D/lbiZgYkh0tp/PoDi4JTymyd0ps9HY7qSnTfZRC/U+c9k4RAs14u2JcUt
	YbcWReSPwJnZWRuXJNIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Scd-00000005gef-2MvI;
	Thu, 16 Oct 2025 18:22:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Scb-00000005ge1-3jth;
	Thu, 16 Oct 2025 18:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0hYYv/LwA1GURrWhGh2MDAllNLGQ7zQ8O8L85h5N1Cg=; b=Rzgp548D+FBSB43kwyHxqonghH
	42O4W2Z8TY77zuQ9poKmtvJObgCWVNT3JfIjesTFpvm/ShNqIvGnHC77bY09mhQ87U2VKDQSIdHyZ
	78ZXZYduDtDxyQGi3hQOWhD/q8yqr4SnTUzqMJ07rdZLesOVAz2L6EU7tBO1cBuFHPa2qIP3MLqcu
	XJCMmNGPDaKSSYP8Rw0tfLh7qXFKQ82fuVLdJnSggVOhDZd0jGX+5/1BSjSHBI1TNe+gDY3cYhsNX
	O2G6GCXwBDfX7s/3sXay9XEas3Y4+p9GGp0hxcVEXUwmYI0sX/tHSk7nBMmD3rD+Vl/Su7AUjYLDq
	waLsZxnw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ScS-00000009YoF-2lgw;
	Thu, 16 Oct 2025 18:22:32 +0000
Date: Thu, 16 Oct 2025 19:22:32 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Yin Tirui <yintirui@huawei.com>
Cc: akpm@linux-foundation.org, david@redhat.com, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	catalin.marinas@arm.com, will@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	anshuman.khandual@arm.com, yangyicong@hisilicon.com,
	ardb@kernel.org, apopple@nvidia.com, samuel.holland@sifive.com,
	luxu.kernel@bytedance.com, abrestic@rivosinc.com,
	yongxuan.wang@sifive.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, wangkefeng.wang@huawei.com,
	chenjun102@huawei.com
Subject: Re: [PATCH RFC 1/2] pgtable: add pte_clrhuge() implementation for
 arm64 and riscv
Message-ID: <aPE36PlriswJWSKD@casper.infradead.org>
References: <20251016112704.179280-1-yintirui@huawei.com>
 <20251016112704.179280-2-yintirui@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251016112704.179280-2-yintirui@huawei.com>
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

On Thu, Oct 16, 2025 at 07:27:03PM +0800, Yin Tirui wrote:
> Add pte_clrhuge() helper function for architectures that enable
> ARCH_SUPPORTS_HUGE_PFNMAP to clear huge page attributes from PTE
> entries.

I really would prefer to see pte_clrhuge() removed first.  Otherwise
this just goes onto the long list of "somebody should clean this up some
day" and nobody ever will.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
