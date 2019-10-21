Return-Path: <SRS0=kQzM=YO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F65CA9EB5
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2019 05:10:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BD2020700
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2019 05:10:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fpouVEvJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BD2020700
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Azj/HHR6ZYs7ggXCWREINa31Iivy+oAyBCsb7a1O+9k=; b=fpo
	uVEvJxaLf3/CMAIXcxFbN6rrClTM/L08ilTRuD4QdiTo88hWgb8cBTJLPz8Wn12yBX20zqZsrFI48
	5xJEJvbKxF7dpBdOG62jAgjMG11ZdQxMaSEc28csmi0WbYf7WHauAetSnEKaCtNawdddtOlE3kuHg
	qScu6pUwq70bHALqc9pM1nBu76bpmjECASAL0k4UR5jBCbZq4RRkT+u61j3+NOTulUMQV2yicJp09
	sYdqJL+Z9Z34wdiKoD/zEELql9jZldBIHvQozFBie8iA8OWaA4OGQlim0TsleeopToDYlGJBCyx3I
	jiBcBE3HAd+ORxrMTZhckNQsUOkFpFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMPxX-0003TI-R9; Mon, 21 Oct 2019 05:10:23 +0000
Received: from [217.140.110.172] (helo=foss.arm.com)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMPxL-00023R-V0; Mon, 21 Oct 2019 05:10:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C779936D;
 Sun, 20 Oct 2019 22:09:59 -0700 (PDT)
Received: from p8cg001049571a15.arm.com (unknown [10.163.1.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AA6ED3F71F;
 Sun, 20 Oct 2019 22:12:38 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Subject: [RFC V2 0/2] arm64: Enable vmemmap mapping from device memory
Date: Mon, 21 Oct 2019 10:40:14 +0530
Message-Id: <1571634616-28863-1-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191020_221012_044898_208D8FED 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This series enables vmemmap backing memory allocation from device memory
ranges on arm64. But before that, it enables vmemmap_populate_basepages()
to accommodate struct vmem_altmap based requests.

This applies alongside arm64 memory hot remove (v10) on next-20191018.

https://lkml.org/lkml/2019/10/11/232

Changes in RFC V2:

- Changed the commit message on 1/2 patch per Will
- Changed the commit message on 2/2 patch as well
- Rebased on arm64 memory hot remove series (v10)

RFC V1: (https://lkml.org/lkml/2019/6/28/32)

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-ia64@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: x86@kernel.org
Cc: linux-kernel@vger.kernel.org

Anshuman Khandual (2):
  mm/sparsemem: Enable vmem_altmap support in vmemmap_populate_basepages()
  arm64/mm: Enable vmem_altmap support for vmemmap mappings

 arch/arm64/mm/mmu.c      | 58 +++++++++++++++++++++++++++-------------
 arch/ia64/mm/discontig.c |  2 +-
 arch/riscv/mm/init.c     |  2 +-
 arch/x86/mm/init_64.c    |  6 ++---
 include/linux/mm.h       |  5 ++--
 mm/sparse-vmemmap.c      | 16 +++++++----
 6 files changed, 59 insertions(+), 30 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
