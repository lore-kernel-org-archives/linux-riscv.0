Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38372C64ED8
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 10:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eg5YtJh/zK+ehrcmfn93j8GOHsHQvxF3eQwOZ2MUdhg=; b=kPWFraivWBWGbz
	rR8LvJ9N5K0lME5GRGTEttvZ+e8OOK6IlVCEf2ViZ79C1jbBF3hTZAr9oyE8cvlEB4PmOGrzeob6G
	3I4L6gVSquDuUtKAffARojYnIlcCIwb8iwmpK5Ox9yBm9zIXfz4R09LDP09z7BgShAMkjqz1zIHu+
	WG+mwE0vLHpJdJCRB4r8wTQwutPxxmF3Lj07cOuBhmYgKIWN+QnUy8pTLfaBzxoPmYL8QEa5Hkprz
	IcBJxfjB0zJmqQEXzB/1kpVsfy13i4U5imuVP8MZi31wvrIY8SKEEp9kn9xStlMXW1Xi6D4wLhhbK
	zRTAXGKknLOR6SSR6UaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVVVz-0025gM-14; Fri, 24 Feb 2023 10:41:23 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVVVo-0025cU-HX
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 10:41:15 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 31OAe6bd055911;
	Fri, 24 Feb 2023 18:40:06 +0800 (+08)
	(envelope-from dylan@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Fri, 24 Feb 2023
 18:40:05 +0800
From: Dylan Jhong <dylan@andestech.com>
To: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <liushixin2@huawei.com>, <x5710999x@gmail.com>, <bjorn@rivosinc.com>,
        <abrestic@rivosinc.com>, <peterx@redhat.com>, <hanchuanhua@oppo.com>,
        <apopple@nvidia.com>, <hca@linux.ibm.com>, <aou@eecs.berkeley.edu>,
        <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
        <tim609@andestech.com>, <peterlin@andestech.com>,
        <ycliang@andestech.com>, Dylan Jhong
	<dylan@andestech.com>
Subject: [PATCH] RISC-V: mm: Support huge page in vmalloc_fault()
Date: Fri, 24 Feb 2023 18:40:01 +0800
Message-ID: <20230224104001.2743135-1-dylan@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.173]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 31OAe6bd055911
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_024113_046111_32477A89 
X-CRM114-Status: UNSURE (   7.14  )
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

RISC-V supports ioremap() with huge page (pud/pmd) mapping, but
vmalloc_fault() assumes that the vmalloc range is limited to pte
mappings. Add huge page support to complete the vmalloc_fault()
function.

Fixes: 310f541a027b ("riscv: Enable HAVE_ARCH_HUGE_VMAP for 64BIT")

Signed-off-by: Dylan Jhong <dylan@andestech.com>
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
