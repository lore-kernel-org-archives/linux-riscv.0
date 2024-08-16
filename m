Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A10C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 10:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uaQ8cOVen4lYfG7TxOFIn6WGlSOxjkMtaIacTnM7F7w=; b=hGgi02lApzlduZ
	Ot5/7a/8yWfcJq+6XUr1Y20eYMPBC6OyvWsNeAgkG9jV30ZHziS9XnmQd/bAw7nscO3jNKKCB21cb
	Au6nWmeon8/O3PWyCBZJwHu83hLu/iYEDPWhb0CVQb7boUsSxI2PGjnu9JjQAWCq5oFeyndL4yvEu
	Z6saVp5ZH+9bO9twImL911F/+NR3/BilUNQpVpW7aWRWXnviGgXelOxQLadr8rSztfFBe/741a68e
	qutjceCNCtNpPsTivL6I01977CDy94+B1DqnxGSBnr+xaJJaBJP5mhCEkhznVUdRa+CKShWrSwp31
	MmgLV9K6MmEMoD0wTdvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seu3P-0000000CZHq-40Zd;
	Fri, 16 Aug 2024 10:19:31 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seu3L-0000000CZFj-24Kn
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 10:19:30 +0000
Received: from ubt.. (unknown [210.73.53.31])
	by APP-03 (Coremail) with SMTP id rQCowABXNRijJ79mmyAcBw--.30190S2;
	Fri, 16 Aug 2024 18:19:16 +0800 (CST)
From: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH] riscv: Remove unused GENERATING_ASM_OFFSETS
Date: Fri, 16 Aug 2024 18:19:12 +0800
Message-Id: <20240816101912.1049329-1-zhangchunyan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowABXNRijJ79mmyAcBw--.30190S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XFW5Cr1xXF47KFy7Zr4DXFb_yoWfuFc_Cw
	4xWas8GryrJFW09347Zw1fGrZ0yw1rtFyFqF4fAF98uFyqvryFvw43tw1rJr1kur43Jrs3
	A39rJFZxZr1q9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbI8YjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l
	c2xSY4AK67AK6r4DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
	AVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj
	xU4l1vUUUUU
X-Originating-IP: [210.73.53.31]
X-CM-SenderInfo: x2kd0wxfkx051dq6x2xfdvhtffof0/1tbiDAULB2a-BNdw2QAAsm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_031927_917129_AEB474EB 
X-CRM114-Status: UNSURE (   7.22  )
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

The macro is not used in the current version of kernel, it looks like
can be removed to avoid a build warning:

../arch/riscv/kernel/asm-offsets.c: At top level:
../arch/riscv/kernel/asm-offsets.c:7: warning: macro "GENERATING_ASM_OFFSETS" is not used [-Wunused-macros]
    7 | #define GENERATING_ASM_OFFSETS

Fixes: 9639a44394b9 ("RISC-V: Provide a cleaner raw_smp_processor_id()")
Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
---
 arch/riscv/kernel/asm-offsets.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index b09ca5f944f7..cb09f0c4f62c 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -4,8 +4,6 @@
  * Copyright (C) 2017 SiFive
  */
 
-#define GENERATING_ASM_OFFSETS
-
 #include <linux/kbuild.h>
 #include <linux/mm.h>
 #include <linux/sched.h>
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
