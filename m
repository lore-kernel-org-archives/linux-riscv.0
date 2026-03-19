Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CE51075274
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 08:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x2YV/FLyqKix0Moc1PM6W7u6FY9Kj//MmVmikIKmdsA=; b=dd4woLFqw8/nUC
	8F5EPNIIofjiiNqq+uGW2K8b6sRYU4fp+9SCMBcH/Lfm7C/gqw/quGMVCyUc9MsTMrwH6u+RM2JQK
	2D0rg1vni5VXSv+O+X9KpR00cJmfAs4jzll8xMqLnwFkqH0sZyJV+PLcoHKQgf0mLke7uRyWCIBkS
	au+veKutt8WCMglPHRAvkAkfDif48y4iEDFncUmlvSVfzMQC6xfqG95ZFPFSTb1Pvk2SCmHfG8Z20
	skqUeDWcBATGZqL/ey0ZQNZEXPZlgB6lX444gW2ocHDwbmPGh0SofkaUQRD0TIOrQOSyphJEsmbNy
	kIdql3A86dskYmxFRjcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w38c3-0000000ADxU-2ALj;
	Thu, 19 Mar 2026 08:20:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w38c2-0000000ADxF-1nOH;
	Thu, 19 Mar 2026 08:20:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=9vONOIrqW/UJkG8W01y5FtYV4fnBAGfruHFEOeSnnYw=; b=Rv0vHUlKRaEznufj1gJ+wPb24J
	pRYaHTeYkpqLBqZ85f9vW1VcBQ7QeX+5lhW1g8A8F+FuyaO3yfQ4oPoQvZWYNRSb12r0LKZ6AIYDu
	2h2FtVRnr55AUzVvVjMgSCV//vsxaiK4714TZULQ+lzV5MytQNy5Q3xYJAZORrtvKYAdhKOdKbrLF
	8yuttbO9KCGtoFdXd34/v85pbkiK8dUw4LHh9IBY5XBi+6bymGETIA7T3y5vosZpugls5XiqdVB6B
	Yf8ArkTH3rGTp3TIYWmGYAOAOLRz9XewjiAeXznJDsmdMaw/20iqCZvOvp6O5QjYEWjo1jO1pOZB3
	0MQvwYDg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w38bz-0000000D0dI-0fyF;
	Thu, 19 Mar 2026 08:20:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E02D43D39;
	Thu, 19 Mar 2026 08:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E3B1C19424;
	Thu, 19 Mar 2026 08:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773908409;
	bh=GAQ9b9edKTgGxU+mpQzf5vrvp0GbZiNpB68nUzbzDyY=;
	h=From:Subject:Date:To:Cc:From;
	b=nW9ab7OnkN7S00RxQQ6fV539CUU/HXaHfFwpCsfjk1vZa9nrCehAKXmvHkrdByEwi
	 UTuF8w219c0gp/9PlGkyTjPCXYgHMu+wuB+VcuJDOAEMR4YYArxHQyQe1bdwRE69iq
	 6KnzMuHTxJ83BywVs82C5DCGxHXYPZw/XiMZC3jCTCs7Ed7M20epXUlpSA58uZXblU
	 VhVWCftNRHTP6Wysxkep+z8UHXRrW+AIwQJO/Iq01wPPGebHyKnPiUVOyGVPTWywxV
	 gA0MkkSVRuNWrkUsu2BUt2gfc0ropCqtacyuIkXHK1ZCQaGyBOonZgNXG1/Y1ey4xt
	 IYgm8NZf2LthQ==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Subject: [PATCH 0/2] mm: remove CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE and
 cleanup CONFIG_MIGRATION
Date: Thu, 19 Mar 2026 09:19:39 +0100
Message-Id: <20260319-config_migration-v1-0-42270124966f@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJuxu2kC/x2MQQqAIBAAvxJ7TlhNjPpKRISttocsNCIQ/550H
 JiZDIkiU4KxyRDp4cRnqCDbBuy+Bk+Ct8qgUBnsZC/sGRz75WAf17vKQpuOFGpEPQxQsyuS4/d
 fTnMpH8Y9x3JiAAAA
To: linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-mm@kvack.org, 
 linux-rt-devel@lists.linux.dev, 
 "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_082011_763644_A180178D 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
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

While working on memory hotplug code cleanups, I realized that
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE is not really required anymore.

Changing that revealed some rather nasty looking CONFIG_MIGRATION
handling.

Let's clean that up by introducing a dedicated CONFIG_NUMA_MIGRATION
option and reducing the dependencies that CONFIG_MIGRATION has.

Heavily cross compiled. I assume these changes are fine, but messing
with kconfig sometimes feels like playing with fire :)

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
David Hildenbrand (Arm) (2):
      mm: remove CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE
      mm: introduce CONFIG_NUMA_MIGRATION and simplify CONFIG_MIGRATION

 arch/arm64/Kconfig           |  1 -
 arch/loongarch/Kconfig       |  1 -
 arch/powerpc/Kconfig         |  1 -
 arch/riscv/Kconfig           |  1 -
 arch/s390/Kconfig            |  1 -
 arch/x86/Kconfig             |  1 -
 include/linux/memory-tiers.h |  2 +-
 init/Kconfig                 |  2 +-
 mm/Kconfig                   | 33 +++++++++++++++------------------
 mm/memory-tiers.c            | 12 ++++++------
 mm/mempolicy.c               |  2 +-
 mm/migrate.c                 |  5 ++---
 12 files changed, 26 insertions(+), 36 deletions(-)
---
base-commit: fbf55982f31ae6aa11f890c36bccc130ce70a312
change-id: 20260317-config_migration-463e20400499

Best regards,
-- 
David Hildenbrand (Arm) <david@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
