Return-Path: <SRS0=MbfZ=KN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC0E1C433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 18 May 2021 10:19:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39A23611B0
	for <linux-riscv@archiver.kernel.org>; Tue, 18 May 2021 10:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39A23611B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q57r1PIsKipkJoYBGnauM5c94eqCtQXZ8HtgmG0jWhY=; b=WKFgxEfxxgia/rs+ITg7zRUUBM
	pssSGDeubF5tc2FO+XZm7Z+WhgQSlhnLLUf2BC4t3S+tP4u2kljZISiuki/04fIT7mFtEd1eeFXg1
	U59sumRj0NaScMEx3WWVvAEzbPIFEgLrMxWyR2DX2publRBcgg6WnzjleqI6IKB1Wkysf/qotSaxS
	7n0D+XQLP098og/IUdclty3ywWD31/RVADPur0clPdM5624bK7N3AzTyWLz59SyJSF/3u9iTPK77p
	EoqFZzGU27Mvz8VWcR/P1rBI4ANMKPEMJUcUvQKBtMHxokbCaGgPz5cvSMyc2GL8sCQnSX713GsIy
	4TuNrjEQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liwoK-000Knu-LE; Tue, 18 May 2021 10:18:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liwiq-000J4M-2C
 for linux-riscv@desiato.infradead.org; Tue, 18 May 2021 10:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=ULr33bD4SvaLmtwnbFGom7VdQaB7nHdqOiA4jXh/X1Y=; b=lY8ZMSfRWARwiMkNPZQIjFEAP3
 7qJVlFr3O80s8xTsr7QnlHW7zxV/B4QT+cy9+C/xgTdjI66qfxwmxhKLYqTNsWjJ8CNPbcQJkByiU
 299Phh/XjnomEj99atQxy5qQM6vW/11DuV+enkL5bhXt64SmfYkCoJPz2CJ9eeovfAUtjJ2L7Odkp
 pDRkeUNbSWO598p05VPmdvCdgUJ6S4rVStY59GfFHB5zCwjCwWW1p0J9IvfzWcC5RMBQvTuhBqElV
 BPsdUJMcrG3bTLoYdeZ/bS/b30mhG9Opo0f1Y8EhL2tXW7AFb8bNzZXhMX3Ln39ozAcN2tLIrExjr
 3RFP7Z2Q==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liwim-00EY68-Ub
 for linux-riscv@lists.infradead.org; Tue, 18 May 2021 10:13:06 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 4FD341C0002;
 Tue, 18 May 2021 10:12:55 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH v6 0/3] Introduce 64b relocatable kernel
Date: Tue, 18 May 2021 12:12:49 +0200
Message-Id: <20210518101252.1484465-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_031305_291236_562A1EAB 
X-CRM114-Status: GOOD (  15.27  )
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

After multiple attempts, this patchset is now based on the fact that the
64b kernel mapping was moved outside the linear mapping.

The first patch allows to build relocatable kernels but is not selected         
by default. That patch should ease KASLR implementation a lot.                                                            
The second and third patches take advantage of an already existing powerpc       
script that checks relocations at compile-time, and uses it for riscv.           

This patchset was tested on:

* kernel:                                                                        
- rv32: OK                                                                       
- rv64 with RELOCATABLE: OK and checked that "suspicious" relocations are caught.
- rv64 without RELOCATABLE: OK                                                   
- powerpc: build only and checked that "suspicious" relocations are caught.      
                                                                                 
* xipkernel:                                                                     
- rv32: build only                                                               
- rv64: OK                                                                       

* nommukernel:                                                                   
- rv64: build only

Changes in v6:
  * Remove the kernel move to vmalloc zone
  * Rebased on top of for-next
  * Remove relocatable property from 32b kernel as the kernel is mapped in
    the linear mapping and would then need to be copied physically too
  * CONFIG_RELOCATABLE depends on !XIP_KERNEL
  * Remove Reviewed-by from first patch as it changed a bit

Changes in v5:
  * Add "static __init" to create_kernel_page_table function as reported by
    Kbuild test robot
  * Add reviewed-by from Zong
  * Rebase onto v5.7

Changes in v4:                                                                   
  * Fix BPF region that overlapped with kernel's as suggested by Zong            
  * Fix end of module region that could be larger than 2GB as suggested by Zong  
  * Fix the size of the vm area reserved for the kernel as we could lose         
    PMD_SIZE if the size was already aligned on PMD_SIZE                         
  * Split compile time relocations check patch into 2 patches as suggested by Anup
  * Applied Reviewed-by from Zong and Anup                                       

Changes in v3:                                                                   
  * Move kernel mapping to vmalloc                                               

Changes in v2:                                                                   
  * Make RELOCATABLE depend on MMU as suggested by Anup                          
  * Rename kernel_load_addr into kernel_virt_addr as suggested by Anup           
  * Use __pa_symbol instead of __pa, as suggested by Zong                        
  * Rebased on top of v5.6-rc3                                                   
  * Tested with sv48 patchset                                                    
  * Add Reviewed/Tested-by from Zong and Anup

Alexandre Ghiti (3):
  riscv: Introduce CONFIG_RELOCATABLE
  powerpc: Move script to check relocations at compile time in scripts/
  riscv: Check relocations at compile time

 arch/powerpc/tools/relocs_check.sh | 18 ++--------
 arch/riscv/Kconfig                 | 12 +++++++
 arch/riscv/Makefile                |  5 ++-
 arch/riscv/Makefile.postlink       | 36 ++++++++++++++++++++
 arch/riscv/kernel/vmlinux.lds.S    |  6 ++++
 arch/riscv/mm/Makefile             |  4 +++
 arch/riscv/mm/init.c               | 53 +++++++++++++++++++++++++++++-
 arch/riscv/tools/relocs_check.sh   | 26 +++++++++++++++
 scripts/relocs_check.sh            | 20 +++++++++++
 9 files changed, 162 insertions(+), 18 deletions(-)
 create mode 100644 arch/riscv/Makefile.postlink
 create mode 100755 arch/riscv/tools/relocs_check.sh
 create mode 100755 scripts/relocs_check.sh

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
