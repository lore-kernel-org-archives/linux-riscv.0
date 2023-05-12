Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF8AC77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 03:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4S32eUFVCO458LQ4pTuoCZTFdxcDvzbvkWoHrLG2whs=; b=QfiyS9Xgyqo2J7
	N5634KcxBQ9eyqxgL1+WPwcmartXdkYeQYI7A1CyKYroYCTo6AfUDvoM+0ph6zI7oIQkBp9iLyzWr
	JjeF+yFbgfuaLcl5KGymKXYNVDmHE4mMdlwzVx4CwV8HtJg2ZZRC7z7n6B1IC0U2HoDXnAeVluvu+
	ZN3AUU+A08DGOEISPHmRZ7PtUmbIJiyq9f2mbsIIg49W9W0V2ZO0SGjJiTypMdFycrwF1VdObdzCN
	cV6scHUscm3KVlwKMCb1S//vM/LuZUFOhdC8vDcM8A+njvvw1JLhDrfhje2eYneSozqcvwBmI8sWP
	47ZSdS1qgq86arzb5EkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxJbz-00Aq4I-1l;
	Fri, 12 May 2023 03:38:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxJbw-00Aq2l-2L;
	Fri, 12 May 2023 03:38:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9A6A964D9A;
	Fri, 12 May 2023 03:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A0DC433EF;
	Fri, 12 May 2023 03:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683862707;
	bh=Q7pZ6HkRh3PVDzBCV74mB+fwpBcm2L4Wrr7Gj6KO6ZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U4rplEw0qMOGxowZ1loQ7IR10mVPR+gkIHrN9H2/CYQigVdydLPavay7G++a7nk75
	 jDhpGXpsFo8grDqyj+dAD0bRHJYnhZ3zC9JzvBPFC3B2RpUt1tYfAWrn3pIHyEvUc0
	 m+plA03PmuYT+NcYOD6DwNQyNX3nG8GNV7/Tz7bjzisl+mJN6FAg46r36holy/6HO4
	 6GEsQAkOKAoidlLLVYOcRtmzSHojiofTEI1BfDjbKkAJM3vujpQ7oWR4AovPMspdwk
	 AfdZmFHnb8dcLpWYTKW3v5BTK8ry629pZRiCq4rIBS69MISbPUUJXyByuj5gGgwTNw
	 bDNRPX9IyrHYA==
Date: Thu, 11 May 2023 20:38:24 -0700
From: Mike Rapoport <rppt@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Kravetz <mike.kravetz@oracle.com>,
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
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Michel Lespinasse <michel@lespinasse.org>
Subject: Re: [PATCH 00/23] arch: allow pte_offset_map[_lock]() to fail
Message-ID: <20230512033824.GF4135@kernel.org>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
 <ZFs0k2rrLPH9A/UU@casper.infradead.org>
 <d7f3c7b2-25b8-ef66-98a8-43d68f4499f@google.com>
 <ZFz1j1slZHCQmwMJ@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZFz1j1slZHCQmwMJ@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_203828_865320_57A91A8A 
X-CRM114-Status: GOOD (  20.93  )
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

Hi,

On Thu, May 11, 2023 at 03:02:55PM +0100, Matthew Wilcox wrote:
> On Wed, May 10, 2023 at 09:35:44PM -0700, Hugh Dickins wrote:
> > On Wed, 10 May 2023, Matthew Wilcox wrote:
> > 
> > I don't really understand why you're going down a remove-CONFIG_HIGHPTE
> > route: I thought you were motivated by the awkardness of kmap on large
> > folios; but I don't see how removing HIGHPTE helps with that at all
> > (unless you have a "large page tables" effort in mind, but I doubt it).
> 
> Quite right, my primary concern is filesystem metadata; primarily
> directories as I don't think anybody has ever supported symlinks or
> superblocks larger than 4kB.
> 
> I was thinking that removing CONFIG_HIGHPTE might simplify the page
> fault handling path a little, but now I've looked at it some more, and
> I'm not sure there's any simplification to be had.  It should probably
> use kmap_local instead of kmap_atomic(), though.
 
Removing CONFIG_HIGHPTE will drop several lines and will allow to get rid
of custom __pte_alloc_one on x86.

--
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
