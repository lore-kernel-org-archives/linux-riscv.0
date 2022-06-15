Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E28C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jun 2022 01:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=arOYQB3sqeN6TsigH2bDw8cwySmRf42ipVTABCSHkSk=; b=PSMb0l3pt9KZNZ
	Ev+bdkghA2jDKijNbEJAq2xIJlbqpGQhHP9qu4V+k3BsZRBNfrdDDCXvRllS725ReOW7RF61NJays
	hqVrJMY27Wy44AG0HqYVUh4OoTE6WsYWlt25iC2wFLWysKYFraglBJmny9Oid5A9AoZXCEpvOypJU
	qUSbWPfV+x+eTMN8YiRHNLR+kwscf8WA/J9fZdYQQ2tIoB5udz4f/DxH1qbbhUg9HqieYGZKx7M1H
	7ofdCoKDh7GjQTdaFuzZwk+ljJ+pBV1TxKa3ZJg5bpC1OUu2wMRwVU4Ju0itGCiKSRWf134wxm4PY
	SNkPHDKcmMawWHdi2u7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1IA0-00C7VY-9S; Wed, 15 Jun 2022 01:49:32 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1I9w-00C7TG-Hl
	for linux-riscv@lists.infradead.org; Wed, 15 Jun 2022 01:49:30 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4LN7Th546Zz1K9xF;
	Wed, 15 Jun 2022 09:47:20 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 15 Jun 2022 09:49:17 +0800
Received: from huawei.com (10.67.174.169) by dggpemm500001.china.huawei.com
 (7.185.36.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 15 Jun
 2022 09:49:16 +0800
From: Chen Lifu <chenlifu@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<akira.tsukamoto@gmail.com>, <jszhang@kernel.org>,
	<wangkefeng.wang@huawei.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <alankao@andestech.com>
CC: <chenlifu@huawei.com>
Subject: [PATCH -next] riscv: lib: uaccess: fix CSR_STATUS SR_SUM bit
Date: Wed, 15 Jun 2022 09:47:14 +0800
Message-ID: <20220615014714.1650349-1-chenlifu@huawei.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.169]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_184928_785997_FD40896A 
X-CRM114-Status: UNSURE (   8.03  )
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

Since commit 5d8544e2d007 ("RISC-V: Generic library routines and assembly")
and commit ebcbd75e3962 ("riscv: Fix the bug in memory access fixup code"),
if __clear_user and __copy_user return from an fixup branch,
CSR_STATUS SR_SUM bit will be set, it is a vulnerability, so that
S-mode memory accesses to pages that are accessible by U-mode will success.
Disable S-mode access to U-mode memory should clear SR_SUM bit.

Fixes: 5d8544e2d007 ("RISC-V: Generic library routines and assembly")
Fixes: ebcbd75e3962 ("riscv: Fix the bug in memory access fixup code")

Signed-off-by: Chen Lifu <chenlifu@huawei.com>
---
 arch/riscv/lib/uaccess.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 8c475f4da308..ec486e5369d9 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -173,11 +173,11 @@ ENTRY(__asm_copy_from_user)
 	ret
 
 	/* Exception fixup code */
 10:
 	/* Disable access to user memory */
-	csrs CSR_STATUS, t6
+	csrc CSR_STATUS, t6
 	mv a0, t5
 	ret
 ENDPROC(__asm_copy_to_user)
 ENDPROC(__asm_copy_from_user)
 EXPORT_SYMBOL(__asm_copy_to_user)
@@ -225,10 +225,10 @@ ENTRY(__clear_user)
 	j 3b
 
 	/* Exception fixup code */
 11:
 	/* Disable access to user memory */
-	csrs CSR_STATUS, t6
+	csrc CSR_STATUS, t6
 	mv a0, a1
 	ret
 ENDPROC(__clear_user)
 EXPORT_SYMBOL(__clear_user)
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
