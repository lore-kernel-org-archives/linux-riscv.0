Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DE0C6FA99
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Mar 2023 07:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aQyN08sTkeizZyZocd70UFysKgASoZ9s7rscn65xEnY=; b=UbDw+C3KeuKSgU
	ViTxsUeFCKD6UHXRk73UAl2Ew3WRTYZ35YQobvo8nqj1ybxaoRuKaKJDDbKwxDu9Icq26YrXkjxZS
	1e0+Z+95G9kvXsOP9ztV2A+aXXE+m0YAQypPtj2Ajz+1IlcmKmyrh7FTOhEWOv6K+0OL2Khr6voyF
	rToexlROxispAULwv22TCvqm8e3TYH3nQatpnxQG9uATrr6qAc48X/+KjDzGc0tuhx5kjZoClyh22
	Owic30kTub991+3Wk0JDUYB+WWJlLEyZeDqK7PbStDePGXVnlk2AnL56Vt/EOTRRlAVagNaa6QM1g
	gIn8Gg176M9Y2z4zkTCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paXQr-00DS6f-4r; Fri, 10 Mar 2023 07:44:53 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paXQm-00DS5N-Nk
	for linux-riscv@lists.infradead.org; Fri, 10 Mar 2023 07:44:51 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 32A7gvni045789;
	Fri, 10 Mar 2023 15:42:57 +0800 (+08)
	(envelope-from dylan@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Fri, 10 Mar 2023
 15:42:54 +0800
From: Dylan Jhong <dylan@andestech.com>
To: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <liushixin2@huawei.com>, <x5710999x@gmail.com>, <bjorn@rivosinc.com>,
        <abrestic@rivosinc.com>, <peterx@redhat.com>, <hanchuanhua@oppo.com>,
        <apopple@nvidia.com>, <hca@linux.ibm.com>, <aou@eecs.berkeley.edu>,
        <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
        <tim609@andestech.com>, <peterlin@andestech.com>,
        <ycliang@andestech.com>, Dylan Jhong
	<dylan@andestech.com>,
        Dylan Jhong <dylain@andestech.com>,
        Alexandre Ghiti
	<alexghiti@rivosinc.com>
Subject: [PATCH v2] RISC-V: mm: Support huge page in vmalloc_fault()
Date: Fri, 10 Mar 2023 15:42:52 +0800
Message-ID: <20230310074252.3853262-1-dylan@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.173]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 32A7gvni045789
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_234449_246550_19B4D99A 
X-CRM114-Status: UNSURE (   8.14  )
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

Since RISC-V supports ioremap() with huge page (pud/pmd) mapping,
However, vmalloc_fault() assumes that the vmalloc range is limited
to pte mappings. To complete the vmalloc_fault() function by adding
huge page support.

Fixes: 310f541a027b ("riscv: Enable HAVE_ARCH_HUGE_VMAP for 64BIT")
Signed-off-by: Dylan Jhong <dylain@andestech.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

---
Changes in v2:
  - Fix format of commit message
---
 arch/riscv/mm/fault.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index eb0774d9c03b..4b9953b47d81 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -143,6 +143,8 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
 		no_context(regs, addr);
 		return;
 	}
+	if (pud_leaf(*pud_k))
+		goto flush_tlb;
 
 	/*
 	 * Since the vmalloc area is global, it is unnecessary
@@ -153,6 +155,8 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
 		no_context(regs, addr);
 		return;
 	}
+	if (pmd_leaf(*pmd_k))
+		goto flush_tlb;
 
 	/*
 	 * Make sure the actual PTE exists as well to
@@ -172,6 +176,7 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
 	 * ordering constraint, not a cache flush; it is
 	 * necessary even after writing invalid entries.
 	 */
+flush_tlb:
 	local_flush_tlb_page(addr);
 }
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
