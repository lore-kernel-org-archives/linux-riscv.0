Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D411099B43
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 22:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LEdLNTdUGH+eMdb2So0ZNukpjwKpAwUVHwQQIGt27lI=; b=yVuDJ/DPJw/pH2
	iG+eIfu4Dwsnube2Z0H3MAHdHsdBABQ3pt8/EfzOt4+l3Df+TB8e1ZHhgm5nuMCqsNjEOYttUbPzK
	0gtRFLRyTxOSWyVH/kX9wCVBwVACzogkVVNyaYc1YaXNxRtnQXZ27WoMOtgdMsat42ED8nMczs+xD
	//mPrt9i61rfiArWhRwvvo7EBoiXRHULDPfX+InaJZ8VO8BuXs8j9/iy12YtTzFxbbNaCeVHRhMa9
	0XhRIM3I+BF3peHMeHZMwx8voXZVw6Ofc7GmYXWwt3y4wKVlL8voxfmoT1Td/yPS2lrkQsn0jOOPk
	HPU0kL5v1xjCpjQ2rF8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3i6E-0000000DfJs-0jYa;
	Fri, 20 Mar 2026 22:13:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3i6D-0000000DfJm-1fe3
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 22:13:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7EF9160128;
	Fri, 20 Mar 2026 22:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71B76C4CEF7;
	Fri, 20 Mar 2026 22:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774044824;
	bh=37kqOOQ/gFodAPx12yyeumULM8pbIZCoL7z8zOpqXf0=;
	h=From:Subject:Date:To:Cc:From;
	b=edSADuQC1oEMW8dWWkRDylnwWgm554uxai5oA30QCHdfBcxx4gOYFfiqWlcULOlqU
	 ncAaN3x4odTUE7sqhieG30e+G5T5QVoPrf7LOtIJ7zwdc+jYAjo3uQVMqrNJJeh1LB
	 DefP7y/8KZQ3EQqwTivr2WJB8+ThJMSrvnvqxjBK48P30+vR6WyYgGnKflj4PDoN20
	 fc+1htlMz3x4PfxkDaXOgkjLuHxDzWNJrNrvLmOg4S39caX01QjKalCc28jgt4VjTQ
	 9M5CShjf0Cxm8//D6d5EnadKWZp4/rpCDYo+myXErcH2J+u377GWSp5NAWjvaKVldb
	 +dnQ/VfibsdLA==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Subject: [PATCH v2 00/15] mm: memory hot(un)plug and SPARSEMEM cleanups
Date: Fri, 20 Mar 2026 23:13:32 +0100
Message-Id: <20260320-sparsemem_cleanups-v2-0-096addc8800d@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIzGvWkC/x3MQQqEMBAF0atIrycQekTBq8ggMflqg2ZCGkUQ7
 25w+RZVFymyQKmrLso4ROUfC/hTkV9cnGEkFBNbbuyXrdHksmLDNvgVLu5JjUcdwsi+bgOohCl
 jkvOd9r/7fgDwqvASZAAAAA==
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Oscar Salvador <osalvador@suse.de>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Sidhartha Kumar <sidhartha.kumar@oracle.com>, linux-mm@kvack.org, 
 linux-cxl@vger.kernel.org, linux-riscv@lists.infradead.org, 
 "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.13.0
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

Some cleanups around memory hot(un)plug and SPARSEMEM. In essence,
we can limit CONFIG_MEMORY_HOTPLUG to CONFIG_SPARSEMEM_VMEMMAP,
remove some dead code, and move all the hotplug bits over to
mm/sparse-vmemmap.c.

Some further/related cleanups around other unnecessary code
(memory hole handling and complicated usemap allocation).

I have some further sparse.c cleanups lying around, and I'm planning
on getting rid of bootmem_info.c entirely.

Cross-compiled on a bunch of machines. Hot(un)plug tested with virtio-mem.

v1 -> v2:
* Added "mm/memory_hotplug: fix possible race in scan_movable_pages()"
* Update the comment above section_deactivate()
* Reordered the flags in sparse_init_one_section()
* Patch description improvements

---
David Hildenbrand (Arm) (15):
      mm/memory_hotplug: fix possible race in scan_movable_pages()
      mm/memory_hotplug: remove for_each_valid_pfn() usage
      mm/sparse: remove WARN_ONs from (online|offline)_mem_sections()
      mm/Kconfig: make CONFIG_MEMORY_HOTPLUG depend on CONFIG_SPARSEMEM_VMEMMAP
      mm/memory_hotplug: simplify check_pfn_span()
      mm/sparse: remove !CONFIG_SPARSEMEM_VMEMMAP leftovers for CONFIG_MEMORY_HOTPLUG
      mm/bootmem_info: remove handling for !CONFIG_SPARSEMEM_VMEMMAP
      mm/bootmem_info: avoid using sparse_decode_mem_map()
      mm/sparse: remove sparse_decode_mem_map()
      mm/sparse: remove CONFIG_MEMORY_HOTPLUG-specific usemap allocation handling
      mm: prepare to move subsection_map_init() to mm/sparse-vmemmap.c
      mm/sparse: drop set_section_nid() from sparse_add_section()
      mm/sparse: move sparse_init_one_section() to internal.h
      mm/sparse: move __section_mark_present() to internal.h
      mm/sparse: move memory hotplug bits to sparse-vmemmap.c

 include/linux/memory_hotplug.h |   2 -
 include/linux/mmzone.h         |   6 +-
 mm/Kconfig                     |   2 +-
 mm/bootmem_info.c              |  46 +---
 mm/internal.h                  |  47 ++++
 mm/memory_hotplug.c            |  35 ++-
 mm/mm_init.c                   |   2 +-
 mm/sparse-vmemmap.c            | 304 +++++++++++++++++++++++
 mm/sparse.c                    | 539 +----------------------------------------
 9 files changed, 377 insertions(+), 606 deletions(-)
---
base-commit: 3f4f1faa33544d0bd724e32980b6f211c3a9bc7b
change-id: 20260320-sparsemem_cleanups-ce4ddb2c47de

Best regards,
-- 
David Hildenbrand (Arm) <david@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
