Return-Path: <SRS0=uc63=OT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B1EC04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Dec 2018 06:24:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60C5E205C9
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Dec 2018 06:24:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SrtKSeHr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60C5E205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=upmem.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kngVDYNbhhGOhHHHzJFkhtLTpJ9bf2NPOJLwokqKmkA=; b=SrtKSeHrYmcco32KNLAL8vrJiS
	db8KVnuef0k8OmENtHay3s395XUZPp2x5yQsBxxTFIlB6HmCsTy2+h9ktGgGNgzEJYkZgNM8M7nC5
	AQDNToMa2rtMRpagXF8GWP5SB2JusegZIZrwAg4P68SO5xTQPa03Zd3ZnpA1rFkaF0h5kskauBO8D
	BFC6E/x0FvOy6+alzI16vWLqGm5Sv09gsnBDF24t0Y2nh0HeZMAZ/on1bzXx9AUvxhgqTlS3Jofvf
	Ms8UiR8cDys/GiGnoSNiQkV0NNS4Uoxbl+MDbl/BfwLIo1nE/xDYE+wH///3Bamhhcejre8woD/Dd
	YlTuFVMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWEzT-0003Iu-Mb; Mon, 10 Dec 2018 06:24:27 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWEzQ-0003I5-9N
 for linux-riscv@lists.infradead.org; Mon, 10 Dec 2018 06:24:25 +0000
X-Originating-IP: 79.86.19.127
Received: from alex.numericable.fr (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alex@ghiti.fr)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E56CA20005;
 Mon, 10 Dec 2018 06:24:01 +0000 (UTC)
From: Alexandre Ghiti <aghiti@upmem.com>
To: palmer@sifive.com
Subject: [PATCH 2/3] riscv: Fix wrong comment about task size for riscv64
Date: Mon, 10 Dec 2018 06:21:45 +0000
Message-Id: <20181210062146.24951-3-aghiti@upmem.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20181210062146.24951-1-aghiti@upmem.com>
References: <20181210062146.24951-1-aghiti@upmem.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181209_222424_470890_E7049763 
X-CRM114-Status: UNSURE (   8.30  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, catalin.marinas@arm.com, ndesaulniers@google.com,
 linux-riscv@lists.infradead.org, Alexandre Ghiti <aghiti@upmem.com>,
 atish.patra@wdc.com, akpm@linux-foundation.org, mingo@kernel.org,
 mike.kravetz@oracle.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The comment indicated a wrong size which was misleading, after
the following computation, TASK_SIZE is in fact equal to
0x4000000000.

     TASK_SIZE  = (PGDIR_SIZE * PTRS_PER_PGD / 2)
with PGDIR_SIZE = 1 << 30 and PTRS_PER_PGD = 4K / 8 = 0x200
=>   TASK_SIZE = 0x40000000 * 0x100 = 0x4000000000

Signed-off-by: Alexandre Ghiti <aghiti@upmem.com>
---
 arch/riscv/include/asm/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 50ea3d6e7de7..db3bf0dccd0d 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -420,7 +420,7 @@ static inline void pgtable_cache_init(void)
 #define VMALLOC_START    (PAGE_OFFSET - VMALLOC_SIZE)
 
 /*
- * Task size is 0x40000000000 for RV64 or 0xb800000 for RV32.
+ * Task size is 0x4000000000 for RV64 or 0xb800000 for RV32.
  * Note that PGDIR_SIZE must evenly divide TASK_SIZE.
  */
 #ifdef CONFIG_64BIT
-- 
2.16.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
