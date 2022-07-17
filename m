Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5B1C43334
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Jul 2022 04:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IF0bhhy+TN6koeIS3cqjCVM+ui/8HJ/nlmdBE0IvLQ8=; b=cS7mHcl57oQEPT
	9ITs41Y/TPrnji9V5uvCWPR4gsafZyWZUF0VqrMxpbYccy7x/4yJmpb4y9sjJ7zNEZtNv1LiypEF3
	oT8NZLiGXDXXEsJqEBhQZryWdsWN5uSvi4W20jZozBsLDx9rzIfxGC53WMc9v3PbCeUjSR0pkw5o5
	5nLvj3nPRNy05ItocU2n3Alh35TRg9SSvnUJRRb75JefThgDvLbHjXuFFSw1fY6QpDWfVbjOYHp7r
	PD78EqRUr7h8CkXGofgTQkeRtQu6DJkVR0arG87XpwM6wYfvYJnb7vfJEkyMqdDnTChDq9Uixi5W+
	IK3mzLTuDzf4ZHpsgZFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCvul-0040GJ-VP; Sun, 17 Jul 2022 04:29:55 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCvub-00405h-70
	for linux-riscv@lists.infradead.org; Sun, 17 Jul 2022 04:29:48 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045170;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0VJWzCAl_1658032175;
Received: from localhost(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VJWzCAl_1658032175)
          by smtp.aliyun-inc.com;
          Sun, 17 Jul 2022 12:29:36 +0800
From: Xianting Tian <xianting.tian@linux.alibaba.com>
To: crash-utility@redhat.com,
	mick@ics.forth.gr,
	heinrich.schuchardt@canonical.com,
	guoren@kernel.org,
	k-hagio-ab@nec.com
Cc: linux-riscv@lists.infradead.org,
	hschauhan@nulltrace.org,
	huanyi.xj@alibaba-inc.com,
	Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: [PATCH 4/8] RISCV64: Add 'irq' command support
Date: Sun, 17 Jul 2022 12:29:25 +0800
Message-Id: <20220717042929.370022-5-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220717042929.370022-1-xianting.tian@linux.alibaba.com>
References: <20220717042929.370022-1-xianting.tian@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_212945_468544_CB78E99D 
X-CRM114-Status: UNSURE (   4.70  )
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

With the patch, we can get the irq info,
crash> irq
 IRQ   IRQ_DESC/_DATA      IRQACTION      NAME
  0       (unused)          (unused)
  1   ff60000001329600  ff60000001d17180  "101000.rtc"
  2   ff60000001329800  ff60000001d17680  "ttyS0"
  3   ff60000001329a00  ff60000001c33c00  "virtio0"
  4   ff60000001329c00  ff60000001c33f80  "virtio1"
  5   ff6000000120f400  ff60000001216000  "riscv-timer"

Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
---
 riscv64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/riscv64.c b/riscv64.c
index a812635..465834f 100644
--- a/riscv64.c
+++ b/riscv64.c
@@ -978,6 +978,7 @@ riscv64_init(int when)
 		machdep->get_smp_cpus = riscv64_get_smp_cpus;
 		machdep->value_to_symbol = generic_machdep_value_to_symbol;
 		machdep->dis_filter = generic_dis_filter;
+		machdep->dump_irq = generic_dump_irq;
 		machdep->show_interrupts = generic_show_interrupts;
 		machdep->get_irq_affinity = generic_get_irq_affinity;
 		machdep->init_kernel_pgd = NULL; /* pgd set by symbol_value("swapper_pg_dir") */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
