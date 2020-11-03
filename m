Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA13C2D0A3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 16:21:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13C4320773
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 16:21:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bMHiR2/r";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vbGPmSlP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13C4320773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4f0CnWysgxviW71+yYWBwXarqrKJSUlJl+JmXzbXxRQ=; b=bMHiR2/rOeuzcqXiSe9NW83Ryy
	2uDx+zP2PU5ACT+BB2JkD/pi/XMk+AVJYTS5+YOY9+GhAhsRXDo+XSruBeI/0ixFmM/URFA5rpj6u
	wgxPR4KYRwLoWf+TRGFSI6kFrb0YO2BPkW/z8oiQF8tMXx04H0LnMEnAocKkC3aKzwDfs/5eyx1Z5
	/i2eH9pdQsFHv7vq7RUF3YG1ux8Yni0niiSNjr6YEf0w/pl/JJRAveh8MnhqpjgqmUaqiX1cPVui6
	txZrE11Zjo8u+JfpjR7teep27keEQ7DvPcJeCri2QuFS58YVIoV3Z2l7pwo0WfSdc9gml+3HFsuNw
	LKRTWDRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZz3f-0007Dk-9m; Tue, 03 Nov 2020 16:21:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZz3Y-0007BF-Ts; Tue, 03 Nov 2020 16:21:14 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DE5B920773;
 Tue,  3 Nov 2020 16:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604420471;
 bh=yRqoDGXgXUirXmOvXn63PNWBqA6rsmPsQ6pfVXkY11c=;
 h=From:To:Cc:Subject:Date:From;
 b=vbGPmSlPlhDX/ccY9wU1E5V0ocZpCy24BgUtz5ZF2ojXD3kZVa2jbxgf+VlZ/Wpld
 Ux05jVTU8InG6GJO4PYQw+O2JCK9sL44agK439KKqz2Sx+J8GJ/l556KBAV1ZsKQTp
 GcQit0K7mVNbpRu0JL4y0ZhrmM37YOZHs29gQ7AQ=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 0/4] arch, mm: improve robustness of direct map manipulation
Date: Tue,  3 Nov 2020 18:20:53 +0200
Message-Id: <20201103162057.22916-1-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_112113_605524_76577C3D 
X-CRM114-Status: GOOD (  16.20  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Len Brown <len.brown@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Pekka Enberg <penberg@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

Hi,

During recent discussion about KVM protected memory, David raised a concern
about usage of __kernel_map_pages() outside of DEBUG_PAGEALLOC scope [1].

Indeed, for architectures that define CONFIG_ARCH_HAS_SET_DIRECT_MAP it is
possible that __kernel_map_pages() would fail, but since this function is
void, the failure will go unnoticed.

Moreover, there's lack of consistency of __kernel_map_pages() semantics
across architectures as some guard this function with
#ifdef DEBUG_PAGEALLOC, some refuse to update the direct map if page
allocation debugging is disabled at run time and some allow modifying the
direct map regardless of DEBUG_PAGEALLOC settings.

This set straightens this out by restoring dependency of
__kernel_map_pages() on DEBUG_PAGEALLOC and updating the call sites
accordingly. 

Since currently the only user of __kernel_map_pages() outside
DEBUG_PAGEALLOC is hibernation, it is updated to make direct map accesses
there more explicit.

[1] https://lore.kernel.org/lkml/2759b4bf-e1e3-d006-7d86-78a40348269d@redhat.com

v4 changes:
* s/WARN_ON/pr_warn_once/ per David and Kirill
* rebase on v5.10-rc2
* add Acked/Reviewed tags

v3 changes:
* update arm64 changes to avoid regression, per Rick's comments
* fix bisectability
https://lore.kernel.org/lkml/20201101170815.9795-1-rppt@kernel.org

v2 changes:
* Rephrase patch 2 changelog to better describe the change intentions and
implications
* Move removal of kernel_map_pages() from patch 1 to patch 2, per David
https://lore.kernel.org/lkml/20201029161902.19272-1-rppt@kernel.org

v1:
https://lore.kernel.org/lkml/20201025101555.3057-1-rppt@kernel.org

Mike Rapoport (4):
  mm: introduce debug_pagealloc_map_pages() helper
  PM: hibernate: make direct map manipulations more explicit
  arch, mm: restore dependency of __kernel_map_pages() of DEBUG_PAGEALLOC
  arch, mm: make kernel_page_present() always available

 arch/Kconfig                        |  3 +++
 arch/arm64/Kconfig                  |  4 +---
 arch/arm64/include/asm/cacheflush.h |  1 +
 arch/arm64/mm/pageattr.c            |  6 +++--
 arch/powerpc/Kconfig                |  5 +----
 arch/riscv/Kconfig                  |  4 +---
 arch/riscv/include/asm/pgtable.h    |  2 --
 arch/riscv/include/asm/set_memory.h |  1 +
 arch/riscv/mm/pageattr.c            | 31 +++++++++++++++++++++++++
 arch/s390/Kconfig                   |  4 +---
 arch/sparc/Kconfig                  |  4 +---
 arch/x86/Kconfig                    |  4 +---
 arch/x86/include/asm/set_memory.h   |  1 +
 arch/x86/mm/pat/set_memory.c        |  4 ++--
 include/linux/mm.h                  | 35 +++++++++++++----------------
 include/linux/set_memory.h          |  5 +++++
 kernel/power/snapshot.c             | 30 +++++++++++++++++++++++--
 mm/memory_hotplug.c                 |  3 +--
 mm/page_alloc.c                     |  6 ++---
 mm/slab.c                           |  8 +++----
 20 files changed, 103 insertions(+), 58 deletions(-)

-- 
2.28.0

*** BLURB HERE ***

Mike Rapoport (4):
  mm: introduce debug_pagealloc_map_pages() helper
  PM: hibernate: make direct map manipulations more explicit
  arch, mm: restore dependency of __kernel_map_pages() of
    DEBUG_PAGEALLOC
  arch, mm: make kernel_page_present() always available

 arch/Kconfig                        |  3 +++
 arch/arm64/Kconfig                  |  4 +---
 arch/arm64/include/asm/cacheflush.h |  1 +
 arch/arm64/mm/pageattr.c            |  6 +++--
 arch/powerpc/Kconfig                |  5 +----
 arch/riscv/Kconfig                  |  4 +---
 arch/riscv/include/asm/pgtable.h    |  2 --
 arch/riscv/include/asm/set_memory.h |  1 +
 arch/riscv/mm/pageattr.c            | 31 +++++++++++++++++++++++++
 arch/s390/Kconfig                   |  4 +---
 arch/sparc/Kconfig                  |  4 +---
 arch/x86/Kconfig                    |  4 +---
 arch/x86/include/asm/set_memory.h   |  1 +
 arch/x86/mm/pat/set_memory.c        |  4 ++--
 include/linux/mm.h                  | 35 +++++++++++++----------------
 include/linux/set_memory.h          |  5 +++++
 kernel/power/snapshot.c             | 32 ++++++++++++++++++++++++--
 mm/memory_hotplug.c                 |  3 +--
 mm/page_alloc.c                     |  6 ++---
 mm/slab.c                           |  8 +++----
 20 files changed, 105 insertions(+), 58 deletions(-)


base-commit: 3cea11cd5e3b00d91caf0b4730194039b45c5891
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
