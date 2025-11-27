Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60010CFD2F6
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 04:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1THPyJ8di3fqNoDFifvF0Plk5kLNDa3UqMaQrQNhJDY=; b=akxt/PEpdFNC7S
	tWaTrXiS+nBGnrMWiv7qM3UAiLuJIbVKVylcJGXpP5ZtFJuPLFlKXWZQwniIUkegTX3kOblZbeNUf
	SZoOFrfULaAcBtw17zg6o8tWbf/eg9DR+T8t6mXBeAHKP0eL9vpV0/hYh3eyRiGYWxsK8tU2AkTLF
	g8U5hvPEvZLJx7my7KcKr5RCkXE3mxUBOy1RiwxzGj2JvaTUzNdyFTrvMZc/rxkYdF6U+RGGXWP3B
	toePwS7wOce8iTaOPaphmdr/iGmPUFWosc40Yb9UrhtH36fy/eiH3yn/ng4emGPLcUqJOVBPIM0/p
	rTA1VJ+C/oEI2qA5+0NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOTKD-0000000FxHc-2hUE;
	Thu, 27 Nov 2025 04:09:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOTKB-0000000FxHR-3IX1;
	Thu, 27 Nov 2025 04:09:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9UH5HZWU7w1Qz5ka8h7XjqhmojO13fL0L+YMlTFhSDA=; b=AP3I5dIw8MUlt7xSzk3qgcc3sN
	AHu26Cs0wtwdgwSRwY+BmvEPRpHfoPjKAv6EqeaGAtEZ8MvH02yG8ScNHL7P49Rb/gM+u6ij5a6XG
	jy4hg3/q6KDo+jTVMSPbxO9fXKm9iGjW+uF8fMcq7GPSByWP3cICDpktaeP3bee4XCg1AvMMv/Moj
	YSEuEpY6zqKoGrYyt7uU+flpdycrYQcResJLx8oQU2IoaQaPpPfiBo/O1co/fExGrf5J1lFda0oK/
	nNuM2+NAvUP42wEG8HkfVsWnCKASM8uniovBmROKgYy8568Nvncst6z24djS+35maVgZIA3CoAYDO
	v2Mud80A==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOTJl-0000000BB6Z-3S6J;
	Thu, 27 Nov 2025 04:09:17 +0000
Date: Thu, 27 Nov 2025 04:09:17 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	Barry Song <v-songbaohua@oppo.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Pedro Falcato <pfalcato@suse.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Oven Liyang <liyangouwen1@oppo.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Kristina =?utf-8?Q?Mart=C5=A1enko?= <kristina.martsenko@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Wentao Guan <guanwentao@uniontech.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Steven Rostedt <rostedt@goodmis.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Nam Cao <namcao@linutronix.de>, Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying
 page faults after I/O
Message-ID: <aSfO7fA-04SBtTug@casper.infradead.org>
References: <20251127011438.6918-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251127011438.6918-1-21cnbao@gmail.com>
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

On Thu, Nov 27, 2025 at 09:14:36AM +0800, Barry Song wrote:
> There is no need to always fall back to mmap_lock if the per-VMA
> lock was released only to wait for pagecache or swapcache to
> become ready.

Something I've been wondering about is removing all the "drop the MM
locks while we wait for I/O" gunk.  It's a nice amount of code removed:

 include/linux/pagemap.h |  8 +---
 mm/filemap.c            | 98 ++++++++++++-------------------------------------
 mm/internal.h           | 21 -----------
 mm/memory.c             | 13 +------
 mm/shmem.c              |  6 ---
 5 files changed, 27 insertions(+), 119 deletions(-)

and I'm not sure we still need to do it with per-VMA locks.  What I
have here doesn't boot and I ran out of time to debug it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
