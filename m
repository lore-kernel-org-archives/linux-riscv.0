Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BBCC7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 06:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZD8JobJdaQjzP5jcIvTLico+1PjI4fTj4ps0Xvq8nhg=; b=o0vVbqugfOEnI6
	YmpBw7E4eFogjeYNUTzE8x523az63p71/D7hCCa9t5pUhqGraKxJ9eHoUYk676NcNvE3H3Syt4UTP
	wKxrNQJM4uO/AolArU7vqoplX3KanzdTwKqCLTAq6lc+iXHLKq7StsQua2oJ22QeUuyi+UpdF+DcH
	UPPCA0OcJC3EqPRrfjXzOY+SDdJk3WEBwc51Yf2aYUpBhw7I7aXXNzwgpnFVk1mmiAhvqv6ykv7Yi
	EZTQjIPsxLF0+BIcySqtHoqTSbw/wYQLK8e+nBmkojHOCCXfUV9vloeNRuGUuB2H9hPHfGv1fULjn
	Pplrk/r8EycuGRbrFUNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwcz9-005CrP-0q;
	Wed, 10 May 2023 06:07:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwcz6-005Cr5-36;
	Wed, 10 May 2023 06:07:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/B3tOo2DcdV+TWomt1rdQnWS8nj/GpV0fFl476JBaqo=; b=GqtBVAriUhmAJ9gyQunowN/4FI
	IKPnDz7LbDDzd0Fgb9Z22xH9B0GothgTazfupCK9odsy8jdQ7d5rjIU0buEMmJgHPsqbRmD3rjRlS
	pe9WkgZOQJjVVUr2Nn9sQ+jGwW9hZdqgIKJXJ8Sf5r1YY8KiJJck+y51d1I4lWN/uji1Mhux3PR9z
	4FQGYDQlCPyDgWt1HB2pIN4QBP8zK1HHd8c8SPjYOnj4IT/rnTHO2Gch9hA825q32K7voVZkZwShj
	4YKfoYDVbZy6WQjNBqGFIRoL8UF3dgWpYlgtRh3uLSK2Af3sbYZbz1g5vy/PAMZKbCX9yrTkl5Mjy
	NzylU7Eg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pwcyp-00FzBu-D0; Wed, 10 May 2023 06:07:15 +0000
Date: Wed, 10 May 2023 07:07:15 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hugh Dickins <hughd@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Helge Deller <deller@gmx.de>,
	John David Anglin <dave.anglin@bell.net>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 00/23] arch: allow pte_offset_map[_lock]() to fail
Message-ID: <ZFs0k2rrLPH9A/UU@casper.infradead.org>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
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

On Tue, May 09, 2023 at 09:39:13PM -0700, Hugh Dickins wrote:
> Two: pte_offset_map() will need to do an rcu_read_lock(), with the
> corresponding rcu_read_unlock() in pte_unmap().  But most architectures
> never supported CONFIG_HIGHPTE, so some don't always call pte_unmap()
> after pte_offset_map(), or have used userspace pte_offset_map() where
> pte_offset_kernel() is more correct.  No problem in the current tree,
> but a problem once an rcu_read_unlock() will be needed to keep balance.

Hi Hugh,

I shall have to spend some time looking at these patches, but at LSFMM
just a few hours ago, I proposed and nobody objected to removing
CONFIG_HIGHPTE.  I don't intend to take action on that consensus
immediately, so I can certainly wait until your patches are applied, but
if this information simplifies what you're doing, feel free to act on it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
