Return-Path: <SRS0=igOf=LS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A89D5C49EA6
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jun 2021 12:01:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ED05613DA
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jun 2021 12:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ED05613DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zOjKN6BQw2F/xBDfDsBR4kpmVY+GJVkYZplGrtybPYU=; b=mr9A7YPR50ohsi
	a3tMXQGSh6ga9KgC6KVUM29aEEBrtIKqiohVn49jBxjFMwDioyZ+gNt1B1/6/lPuJIFaJ3vylqAa6
	HnFl3c+FP6P6QdVNfRB2BdsDdtJrBuzJ1hg3X4sfvHsZKWHBYkDu7yBqZgdFr2cERSdmGeOe59nye
	d1wpOouv3GY3IB80Jq2HcB8DPogHlKlupGOwAFCG82FjGow4hAbnGmrnHUUM152nLFHOgyOFvFN8+
	Wx96AR4WxLTi/GoclD8v6N0c/ohdU2BGnmqsT4zRZ5rIBgIHu9mc2MmUAqNsyhnoI5bnUO5qZXssi
	L3JIWuw98u3LsIYfdLPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwO2Q-00EUQB-5o; Thu, 24 Jun 2021 12:00:54 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwO2M-00EUNU-BC
 for linux-riscv@lists.infradead.org; Thu, 24 Jun 2021 12:00:52 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id A8F47240014;
 Thu, 24 Jun 2021 12:00:42 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH v8 0/2] Map the kernel with correct permissions the first time
Date: Thu, 24 Jun 2021 14:00:39 +0200
Message-Id: <20210624120041.2786419-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_050050_694071_2EC1B3FF 
X-CRM114-Status: GOOD (  10.84  )
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

The kernel permissions are fixed after the kernel page table is created:         
avoid that by mapping the kernel 'correctly' the first time.                       
     
Patch 1 introduces a new helper to set kernel mapping permissions while          
avoiding all the casts when using set_memory_* API.                              
                                                                                 
Patch 2  is the bulk of this work and deals with mapping the kernel with          
the right permissions.                                                           

Changes in v8:
* Move set_kernel_memory inline function into set_memory.h header as suggested
  by Jisheng
* Make set_kernel_memory arguments name consistent

Changes in v7:
* Split long lines and reintroduce parameters names of set_kernel_memory
  callback, as suggested by Christoph
* Make set_kernel_memory __always_inline as suggested by Christoph
* Change 64b spelling into 64-bit, as suggested by Christoph

Changes in v6:
* load_sz was placed in init section but is now used in kernel address
  conversions macros, so remove this attribute.

Changes in v5:
* Remove non-relevant commits to this patchset that raised issues
* Make load_sz non-static as it is used in kernel address conversions
  macros
* Rebased on top for-next

Changes in v4:
* Add patch 1 as noted by Jisheng
* Changes patch 2 title as suggested by Anup
* Add Reviewed-by from Anup
                                                                                 
Changes in v3:                                                                   
* Add a patch that factorizes kernel address conversions                         
* Add a helper called set_kernel_memory in its own patch, as suggested by        
  Christoph                                                                      
* Prefer IS_ENABLED over #ifdef, as suggested by Christoph                       
* Split overly long lines, as suggested by Christoph                             
* Simplify kernel mapping by mapping ALL text as readonly and taking advantage   
  of already present code that enables write for init text before                
  free_initmem_default.                                                          
                                                                                 
Changes in v2:                                                                   
* Rebased on top of for-next (and "riscv: mm: fix build errors caused by         
  mk_pmd()")                                                                     
* Get rid of protect_kernel_linear_mapping_text_rodata as suggested by           
  Jisheng                                                                        
* Improve code in general compared to previous RFC 

Alexandre Ghiti (2):
  riscv: Introduce set_kernel_memory helper
  riscv: Map the kernel with correct permissions the first time

 arch/riscv/include/asm/page.h       |  13 +++-
 arch/riscv/include/asm/sections.h   |  17 +++++
 arch/riscv/include/asm/set_memory.h |  24 ++++--
 arch/riscv/kernel/setup.c           |  12 +--
 arch/riscv/mm/init.c                | 112 ++++++++++++----------------
 5 files changed, 97 insertions(+), 81 deletions(-)

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
