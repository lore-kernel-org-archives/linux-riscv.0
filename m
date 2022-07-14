Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A03CCA480
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 02:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qc0Sg2ajw0XSr5LsQaLwEbqL+55pt3XjONvYnk4X1s0=; b=IOWXNQxpD90GLE
	hcw+K/KohzdQoaTuhCtbPU+64wLAjCzG4ClXz+fsphlYqHMbmonHJHhVl4c5/Bj7Ry9fz/y7nkBco
	13M9iKcFzKke6mY9snyYOMWEJ7wA20ma7voC61erJB+laPmdDz7Ut8XQCwtcNo8iITobNZq7Poce3
	XUIUiT/SWqQdauZGBL8oFezvK0dnruULxMYCTsqmQjLnToYuukC1Yf8A7KU6/jkkhGOZZdFisTQFY
	ij2CB2ROO+rIKl3sqe6Tpt7y3+cbeIKg/SBu0SEoiqHtbvgOfr6ShoyNw/0frZkEp161dmSkJwKFm
	9+iV/Ew6vmeUzctEUgVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBp4T-00AAa9-Q7; Thu, 14 Jul 2022 02:59:21 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBp4N-00AAT7-Ss
	for linux-riscv@lists.infradead.org; Thu, 14 Jul 2022 02:59:18 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R371e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0VJH72kJ_1657767545;
Received: from localhost(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VJH72kJ_1657767545)
          by smtp.aliyun-inc.com;
          Thu, 14 Jul 2022 10:59:06 +0800
From: Xianting Tian <xianting.tian@linux.alibaba.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alexandre.ghiti@canonical.com,
	guoren@kernel.org,
	anup@brainfault.org,
	mick@ics.forth.gr,
	rppt@kernel.org,
	heiko@sntech.de
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	huanyi.xj@alibaba-inc.com,
	Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: [PATCH V2 2/2] riscv: Add modules to virtual kernel memory layout dump
Date: Thu, 14 Jul 2022 10:59:01 +0800
Message-Id: <20220714025901.359695-3-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220714025901.359695-1-xianting.tian@linux.alibaba.com>
References: <20220714025901.359695-1-xianting.tian@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_195916_154093_5B4594F1 
X-CRM114-Status: UNSURE (   7.23  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Modules always live before the kernel, MODULES_END is fixed but
MODULES_VADDR isn't fixed, it depends on the kernel size.
Let's add it to virtual kernel memory layout dump.

As MODULES is only defined for CONFIG_64BIT, so we dump it when
CONFIG_64BIT.

eg,
MODULES_VADDR - MODULES_END
0xffffffff01133000 - 0xffffffff80000000

Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
---
 arch/riscv/mm/init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index d466ec670e1f..bbc9431e9042 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -135,6 +135,9 @@ static void __init print_vm_layout(void)
 		(unsigned long)VMEMMAP_END);
 	print_ml("vmalloc", (unsigned long)VMALLOC_START,
 		(unsigned long)VMALLOC_END);
+	if (IS_ENABLED(CONFIG_64BIT))
+		print_ml("modules", (unsigned long)MODULES_VADDR,
+			(unsigned long)MODULES_END);
 	print_ml("lowmem", (unsigned long)PAGE_OFFSET,
 		(unsigned long)high_memory);
 	if (IS_ENABLED(CONFIG_64BIT)) {
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
