Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8804CC35FF1
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 22:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4wNLUVdtmicQD/oliXP4nASJSBHn9ASo1zvFw1PhfQ8=; b=0G3ZcR5rqK1BJH
	dxnS1y4H0/laK1iaRvTCT2RyzV9ppLHSib1u4CAQmgLHFH+uR5a5KvEk6tXkj68hBKtGTxYwBHoI/
	0ndNCedTtUkQxKg+Pi7iJNc7WOnp6CmlLkgvSSc001Jk8ZMmJaigoLD9PBw8oEq7eSS9wE0LXXF7n
	QuaNXUqOMWl/JE/tvb9LGnJe7Q/4bZzr+COKTdPsWkpWJETvzO9qODvLALKVQJ0x5SYcWR0hKEkSF
	q0ekvjt+qzH+SGUIkALXej2Yh1AT9ZeiZR6G+fF5OCjVk/oSPZrmlWGF/VmsG6tvPk1Mfg+UB8R3x
	fcPPE48OOC8BQz1MmfXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsrN1-0000000CeXL-3Pgp;
	Thu, 13 Mar 2025 22:49:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsrLL-0000000CeBu-2jUX;
	Thu, 13 Mar 2025 22:48:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CAB1BA41973;
	Thu, 13 Mar 2025 22:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A29C4CEE5;
	Thu, 13 Mar 2025 22:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1741906078;
	bh=1vuD3j168L/LkXuHpAQRHWAckhTjhOgcAOnJeSUpGFw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=D07nQ1LpbLt/bMF9YjXcH2ajIgpv+FXAmqxwUrPU4z2wNpnjcwJnLB4gSGcaqzJJp
	 9N2HwfmnWhFKhSPXWoZ57u+AZFJ8GMdd4Y7qOx1PGShKUGhHbJPTjEpkA+/oHpFOV8
	 LPI7ztHnZrekAlZwU1tYLP/cFn74Pwe2Qn4FtXZc=
Date: Thu, 13 Mar 2025 15:47:57 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
 pasha.tatashin@soleen.com, maddy@linux.ibm.com, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, sweettea-kernel@dorminy.me
Subject: Re: [PATCH v13 00/11] Support page table check on PowerPC
Message-Id: <20250313154757.79dc20b347a0bee16f4fbd10@linux-foundation.org>
In-Reply-To: <006ac081cf0e130426bcf0ef777bed346f6df002.camel@linux.ibm.com>
References: <20250211161404.850215-1-ajd@linux.ibm.com>
	<006ac081cf0e130426bcf0ef777bed346f6df002.camel@linux.ibm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_154759_755382_42341169 
X-CRM114-Status: GOOD (  14.53  )
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

On Thu, 13 Mar 2025 13:54:39 +1100 Andrew Donnellan <ajd@linux.ibm.com> wrote:

> On Wed, 2025-02-12 at 03:13 +1100, Andrew Donnellan wrote:
> > Support page table check on all PowerPC platforms. This works by
> > serialising assignments, reassignments and clears of page table
> > entries at each level in order to ensure that anonymous mappings
> > have at most one writable consumer, and likewise that file-backed
> > mappings are not simultaneously also anonymous mappings.
> > 
> > In order to support this infrastructure, a number of stubs must be
> > defined for all powerpc platforms. Additionally, seperate
> > set_pte_at()
> > and set_pte_at_unchecked(), to allow for internal, uninstrumented
> > mappings.
> 
> Talking to Maddy about this off-list - given that this series touches
> on generic code and several architectures, would it be best to take it
> through the mm tree rather than powerpc?

Sure, I can do that.

Are the rest of the ppc team OK with these changes?  I'm not seeing
much acking from the usual suspects?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
