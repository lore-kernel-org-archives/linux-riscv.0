Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A80C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 02:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sOR0kdgwmvYXl89xq5UZoh1SfEUBMnTw+jWEKq4O7dw=; b=Ui9g3fSRfZMaX2
	I4+Hpm9FiWkON8trgPR9+k3pJsVlGuw36uu5CYthjK6cMQIPjiNSYElRNosSBJp5hSEOsKtVF8J3h
	iSk3gQsAZcP+zH6/WPjfdmEZat6xY/1SdMld7s2mG5JG2TdjXiM4J0oju9fezxtETNh3FT1zATyTa
	IjPgSCgdyWupJl6hlSzMIy9tcog4rcZRSe8OBFwAf0eYMCKUvMrYN3ji+3+xvCHVyKjuVO+/DSZy9
	A8+uqJun4NY8zedyh89H/Gf1S8UkzW1paXzBaiYdHW55hBcjpvQrYKsRY1gvwpreIOmyFoLDp5xA1
	zOIvbFlELOHzGwsj56Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCuqT-00E7zt-Jh; Thu, 27 Jan 2022 02:49:09 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCuqM-00E7xj-FL
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 02:49:05 +0000
Received: from localhost.localdomain (unknown [124.16.141.242])
 by APP-01 (Coremail) with SMTP id qwCowADHz8cOCPJhFmwLAA--.8245S2;
 Thu, 27 Jan 2022 10:48:47 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Cc: jeff@riscv.org, xuyinan@ict.ac.cn, Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v2 0/4] Add Sv57 page table support
Date: Thu, 27 Jan 2022 10:48:40 +0800
Message-Id: <20220127024844.2413385-1-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowADHz8cOCPJhFmwLAA--.8245S2
X-Coremail-Antispam: 1UD129KBjvJXoW7GrW7Gw47Wr1ktF1UKF4fAFb_yoW8Jry8pF
 4DCr95uryrCryfAr13Ar1Dur15Gan3Ka43tr17JryDJw4xWFW7Xrn0kryUJa4UXa15XFy0
 kFyfGr15Cw1kAwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
 W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI2
 0VAGYxC7M4kE6xkIj40Ew7xC0wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
 W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
 1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
 IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAI
 cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa
 73UjIFyTuYvjfUYuc_UUUUU
X-Originating-IP: [124.16.141.242]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_184902_938052_AADE65F6 
X-CRM114-Status: UNSURE (   5.93  )
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

From: Qinglin Pan <panqinglin2020@iscas.ac.cn>

This implements Sv57 support at runtime. The kernel will try to boot with
5-level page table firstly , and will fallback to 4-level if the HW does
not support it. And it will finally fallback to 3-level if the HW alse does
not support sv48.

Tested on:
 - qemu rv64
 - qemu rv64 with CONFIG_KASAN and CONFIG_KASAN_VMALLOC on.
 - qemu rv32
 - sifive unmatched with CONFIG_KASAN and CONFIG_KASAN_VMALLOC on.

Changes in v2:
  - Fix KASAN for sv57, thanks to Alex

Qinglin Pan (4):
  riscv: mm: Control p4d's folding by pgtable_l5_enabled
  riscv: mm: Prepare pt_ops helper functions for sv57
  riscv: mm: Set sv57 on defaultly
  riscv: mm: Support kasan for sv57

 arch/riscv/Kconfig                  |   4 +-
 arch/riscv/include/asm/csr.h        |   1 +
 arch/riscv/include/asm/fixmap.h     |   1 +
 arch/riscv/include/asm/page.h       |   1 +
 arch/riscv/include/asm/pgalloc.h    |  49 ++++++++
 arch/riscv/include/asm/pgtable-64.h | 106 +++++++++++++++++-
 arch/riscv/include/asm/pgtable.h    |   6 +-
 arch/riscv/kernel/cpu.c             |   4 +-
 arch/riscv/mm/init.c                | 166 ++++++++++++++++++++++++----
 arch/riscv/mm/kasan_init.c          | 155 +++++++++++++++++++++++---
 10 files changed, 451 insertions(+), 42 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
