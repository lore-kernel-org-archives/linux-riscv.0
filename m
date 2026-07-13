Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4051FC44501
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 06:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NVxBbuF7+wSWUta86HIeN0fVDTvF1k3T3VFnlPtZhmM=; b=n2DP06sfFd+5Tw
	y8bP3nyx9qBUxp69nYT9CTviz5dBjDsVwNOieryaL2uhWbQBM3iPLchZDXQPMa2CYHNSuBTWGASBc
	8dCA9sOcnD2/H0THh5Af2g3pOK7ijUzUx2RIfr/4DPnMK5k4ybikyhSBrReyWfTvwPceIjVD6eM0d
	PMr0w8WOxQiRJ1ftIfyobLWLIEhALdpywiqlk5Dqo61JOzp0NRlceZ3gGJY3/Lz6MEkYB64ApV4+4
	xI23h2dGLTd8Ygg0Xn6Lx4oy1kZsX3qQvBjW60LiDeEmRh4Ep3dyjzDg9bXsaWeLo4wigfy7MUbl/
	DKxmXgtg8H6SvxrGYpfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9xO-00000008DOA-25ii;
	Mon, 13 Jul 2026 06:15:58 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9xJ-00000008DLr-1Bcu
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 06:15:56 +0000
Received: from [127.0.0.2] (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAAHF86CglRqddeRFw--.29971S2;
	Mon, 13 Jul 2026 14:15:30 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Subject: [PATCH v6 0/2] mm/sparse-vmemmap: flush_cache_vmap() after
 hotplugging vmemmap
Date: Mon, 13 Jul 2026 14:15:19 +0800
Message-Id: <20260713-mark-after-vmemmap-populate-v6-0-b945ceba29d4@iscas.ac.cn>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHeCVGoC/43Oy07DMBQE0F+pvMaVH7Edd8V/IBbX9g01kIfs1
 AJV+XecsmhRUWA50ujMnEnGFDGTw+5MEpaY4zjUoB92xB9heEEaQ81EMKGZEor2kN4odDMmWnr
 se5joNE6nd5iR6tYFY1krrbekClPCLn5c9Kfn75xP7hX9vJJr4xjzPKbPy3zha+9/S4VTTlHbN
 rTKOuD6MWYPeQ9+7weybhVx1TRrtjVBGQWnwQQmXSObe03ean98k/Ub1Brj4K3Qv2jNjSbZttZ
 UrUPnPFcBmGjvNXXVDDPbmqqaMYEHDNIDyp/asixf2vypQBICAAA=
X-Change-ID: 20260525-mark-after-vmemmap-populate-68bd790839c9
To: Alexandre Ghiti <alex@ghiti.fr>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-riscv@lists.infradead.org, Vivian Wang <wangruikang@iscas.ac.cn>, 
 Muchun Song <muchun.song@linux.dev>
X-Mailer: b4 0.15.2
X-CM-TRANSID: rQCowAAHF86CglRqddeRFw--.29971S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFWfWw1Dtr1xCrWUCF45Wrg_yoW8CrykpF
	WY9a98ArW5ArykuFsFvw1xZr1xGF1FgryfKas0kw13Zw15tF17Jr1rK3y8uF9xJFZxX34D
	CF15ua4ru347Aa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7VU11rW7UUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_231553_710882_0059A72E 
X-CRM114-Status: UNSURE (   9.49  )
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

Patch 1 is a bit of clean up that fixes the compilation error with patch
2, since VMEMMAP_{START,END} is not defined when MMU=n.

The mark_new_valid_map() thing doesn't do anything useful on MMU=n
anyway, and the new_valid_maps_cpus_check code is only used on 64BIT, so
I just made it all of it conditional on 64BIT && MMU. I hope this is
acceptable.

---
Changes in v6:
- New patch 1, make all mark_new_valid_map() stuff depend on 64BIT &&
  MMU. Both cleanup and fixes build error with MMU=n. (Muchun)
- Remove extraneous change to arch/riscv/mm/init.c
- Link to v5: https://patch.msgid.link/20260707-mark-after-vmemmap-populate-v5-1-77d1ded3cae3@iscas.ac.cn

Changes in v5:
- Remove hook, use existing flush_cache_vmap() (Muchun)
- Link to v4: https://patch.msgid.link/20260630-mark-after-vmemmap-populate-v4-1-febbc15da028@iscas.ac.cn

Changes in v4:
- Rebase on v7.2-rc1, drop dependencies
- (No code changes otherwise)
- (A concurrency fix for mark_new_valid_map was sent independently)
  https://lore.kernel.org/linux-riscv/20260629-riscv-mm-new-valid-map-ordering-v1-1-60d8c10c6292@iscas.ac.cn/
- Link to v3: https://patch.msgid.link/20260605-mark-after-vmemmap-populate-v3-1-a06001ac9264@iscas.ac.cn

(See v3 link for older changes)

---
Vivian Wang (2):
      riscv: mm: Make mark_new_valid_map() stuff depend on 64BIT && MMU
      mm/sparse-vmemmap: flush_cache_vmap() after hotplugging vmemmap

 arch/riscv/include/asm/cacheflush.h | 5 +++--
 arch/riscv/kernel/entry.S           | 2 +-
 arch/riscv/mm/init.c                | 2 ++
 mm/sparse-vmemmap.c                 | 2 ++
 4 files changed, 8 insertions(+), 3 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260525-mark-after-vmemmap-populate-68bd790839c9

Best regards,
--  
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
