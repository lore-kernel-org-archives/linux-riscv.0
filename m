Return-Path: <SRS0=j3hv=GH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE806C433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jan 2021 19:59:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EF8E2085B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jan 2021 19:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EF8E2085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oPwwobYWmPjew9om8Qy9FGMSmGdU4uXHQUxG+hUBNEY=; b=auTiosXL+Rh6rmtVzossxXPxle
	d2Cjhp43gKjSD/lSslrPFmwcGgSfkRxJ764lFz7bCH6M6PKqbCs+fWAI63m7LP0RO2cMDoX+6KyMo
	ihB2blA44jwGS3vEPCLqWoulyaXdgAMX0+yMQQksupmJkacMZlrKRWe58Q9LbUayFzADMDVWF8iDi
	zGVtAirsCx51QN4yzM+NwqunW3so4Mu4rYHwFbXDt8SPAuJP6wLjXzMnWfyaxjGR+sTccae4gb/6R
	toOabc/qp/fbzvtP+zBjvBEaJytpzuYPL4G0MSSCYHTHvKaPcfOIxSK5OAj2tUb+MMDNilxhUemd1
	71lBGQ/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwW0M-0006LF-L9; Mon, 04 Jan 2021 19:59:02 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwW0L-0006KZ-1o
 for linux-riscv@lists.infradead.org; Mon, 04 Jan 2021 19:59:02 +0000
X-Originating-IP: 90.112.190.212
Received: from debian.home (lfbn-gre-1-231-212.w90-112.abo.wanadoo.fr
 [90.112.190.212]) (Authenticated sender: alex@ghiti.fr)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 7DD92E0009;
 Mon,  4 Jan 2021 19:58:53 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Anup Patel <anup@brainfault.org>, Christoph Hellwig <hch@lst.de>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-efi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 00/12] Introduce sv48 support without relocable kernel
Date: Mon,  4 Jan 2021 14:58:28 -0500
Message-Id: <20210104195840.1593-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_145901_284104_9E279877 
X-CRM114-Status: GOOD (  15.98  )
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
Cc: Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patchset, contrary to the previous versions, allows to have a single        
kernel for sv39 and sv48 without being relocatable.                              
                                                                                 
The idea comes from Arnd Bergmann who suggested to do the same as x86,           
that is mapping the kernel to the end of the address space, which allows         
the kernel to be linked at the same address for both sv39 and sv48 and           
then does not require to be relocated at runtime.                                
                                                                                 
This is an RFC because I need to at least rebase a few commits and add           
documentation. The most interesting patches where I expect feedbacks are         
1/12, 2/12 and 8/12. Note that moving the kernel out of the linear
mapping and sv48 support can be separate patchsets, I share them together
today to show that it works (this patchset is rebased on top of v5.10). 

If we agree about the overall idea, I'll rebase my relocatable patchset
on top of that and then KASLR implementation from Zong will be greatly
simplified since moving the kernel out of the linear mapping will avoid
to copy the kernel physically. 
                                                                                 
This implements sv48 support at runtime. The kernel will try to                  
boot with 4-level page table and will fallback to 3-level if the HW does not     
support it. Folding the 4th level into a 3-level page table has almost no        
cost at runtime.                                                                 
                                                                                 
Finally, the user can now ask for sv39 explicitly by using the device-tree       
which will reduce memory footprint and reduce the number of memory accesses      
in case of TLB miss.   

Alexandre Ghiti (12):
  riscv: Move kernel mapping outside of linear mapping
  riscv: Protect the kernel linear mapping
  riscv: Get rid of compile time logic with MAX_EARLY_MAPPING_SIZE
  riscv: Allow to dynamically define VA_BITS
  riscv: Simplify MAXPHYSMEM config
  riscv: Prepare ptdump for vm layout dynamic addresses
  asm-generic: Prepare for riscv use of pud_alloc_one and pud_free
  riscv: Implement sv48 support
  riscv: Allow user to downgrade to sv39 when hw supports sv48
  riscv: Use pgtable_l4_enabled to output mmu type in cpuinfo
  riscv: Explicit comment about user virtual address space size
  riscv: Improve virtual kernel memory layout dump

 arch/riscv/Kconfig                      |  34 +--
 arch/riscv/boot/loader.lds.S            |   3 +-
 arch/riscv/include/asm/csr.h            |   3 +-
 arch/riscv/include/asm/fixmap.h         |   3 +
 arch/riscv/include/asm/page.h           |  33 ++-
 arch/riscv/include/asm/pgalloc.h        |  40 +++
 arch/riscv/include/asm/pgtable-64.h     | 104 ++++++-
 arch/riscv/include/asm/pgtable.h        |  68 +++--
 arch/riscv/include/asm/sparsemem.h      |   6 +-
 arch/riscv/kernel/cpu.c                 |  23 +-
 arch/riscv/kernel/head.S                |   6 +-
 arch/riscv/kernel/module.c              |   4 +-
 arch/riscv/kernel/vmlinux.lds.S         |   3 +-
 arch/riscv/mm/context.c                 |   2 +-
 arch/riscv/mm/init.c                    | 376 ++++++++++++++++++++----
 arch/riscv/mm/physaddr.c                |   2 +-
 arch/riscv/mm/ptdump.c                  |  56 +++-
 drivers/firmware/efi/libstub/efi-stub.c |   2 +-
 include/asm-generic/pgalloc.h           |  24 +-
 include/linux/sizes.h                   |   3 +-
 20 files changed, 648 insertions(+), 147 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
