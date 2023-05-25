Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8FBC7EE29
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 16:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aQaVFJ8EtvFvOz02OCM3KK6KimA/kgAteMqmDyH9Z+I=; b=wO9mi5L0K3v5Lf
	f/Yldd8FTmF8pdCrDsbRINVTGHBcGDtbQN9e/c3dDOrRnxUsoF9fZ5J+Y6RUdq8yEOD5AUonH2qH0
	nRrlXFTO/CnMp/1a5wGxG2V7PZmrnh4JYzfkfeGknlx98+7fscvp26lx9l0ey2G/TtfDO0PGn/Z8x
	KaAKQvtVo50EwLRVkmlnrqOONWIpY8kLwN6qeRgDJPyatk6n+KYlE6cAKD1zc3rAFBgvCO9gdKjul
	VtD8ctBQG+fMPZwbWPWeM9rpWnogPUchvmnB3OIZtfp9A4iCZtj9gEnEYlrPOtZ04PfdITDFGp6bO
	U/5Iw0Q+z2XYA489KGIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Dxz-00H6in-2g;
	Thu, 25 May 2023 16:37:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Dxv-00H6hJ-2w;
	Thu, 25 May 2023 16:37:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2329660B01;
	Thu, 25 May 2023 16:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8E9C433EF;
	Thu, 25 May 2023 16:37:19 +0000 (UTC)
Date: Thu, 25 May 2023 17:37:16 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Hugh Dickins <hughd@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
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
Subject: Re: [PATCH 02/23] arm64: allow pte_offset_map() to fail
Message-ID: <ZG+OvPjlKPPvtm8r@arm.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
 <e72f6f3e-a8d4-3ed-2b4-5d3ced41484@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e72f6f3e-a8d4-3ed-2b4-5d3ced41484@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_093727_995400_BB1A384E 
X-CRM114-Status: GOOD (  10.21  )
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

On Tue, May 09, 2023 at 09:43:47PM -0700, Hugh Dickins wrote:
> In rare transient cases, not yet made possible, pte_offset_map() and
> pte_offset_map_lock() may not find a page table: handle appropriately.
> 
> Signed-off-by: Hugh Dickins <hughd@google.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
