Return-Path: <SRS0=RYOb=WR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8156AC3A59E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2019 14:58:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 524DB22DA7
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2019 14:58:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OV6/NLmu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 524DB22DA7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qc77Nmwm/zTTefqBKDMzklGwuosq5Dp6p3gVdJDnBLM=; b=OV6/NLmuRQ2Etb
	x8dgia/FZ++OHiU3BvYGmtbTkeY9ZM1dhLHyY2eY2yeNdAk5HIfpz5mIv/CLBWWzm2HxzoIRjZ4rR
	4WXWVhiDpNkkVWF6ZMr6jX5C2XayESeI11CIQ3/YJSkTO0imgDx4sL2cu1P3C09qw72U2TRLQxzGV
	yNMy+IacuJbZZK/yvK/i3TMoGWVhgxDtgxLnr4olu8jzguwR6o+BU+u6ISzVZBBkVCrn43WfduYd8
	K4xmsI3MFvqlX41XQsqXLBuCKNTDLis6clYWFAbsWbWQCy4METK5kcvDSJVe3V0UNJ4MUt7kAA5P5
	l4KssDSyIB/dwP3oQrLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0S4V-0006Aa-81; Wed, 21 Aug 2019 14:58:47 +0000
Received: from [182.171.81.139] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i0S4S-00064G-36; Wed, 21 Aug 2019 14:58:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 3/6] riscv: optimize send_ipi_single
Date: Wed, 21 Aug 2019 23:58:34 +0900
Message-Id: <20190821145837.3686-4-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821145837.3686-1-hch@lst.de>
References: <20190821145837.3686-1-hch@lst.de>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Atish Patra <Atish.Patra@wdc.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Don't go through send_ipi_mask, but just set the op bit an then pass a
simple generate hartid mask directly to sbi_send_ipi.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/smp.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 2e21669aa068..a3715d621f60 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -94,7 +94,13 @@ static void send_ipi_mask(const struct cpumask *mask, enum ipi_message_type op)
 
 static void send_ipi_single(int cpu, enum ipi_message_type op)
 {
-	send_ipi_mask(cpumask_of(cpu), op);
+	int hartid = cpuid_to_hartid_map(cpu);
+
+	smp_mb__before_atomic();
+	set_bit(op, &ipi_data[cpu].bits);
+	smp_mb__after_atomic();
+
+	sbi_send_ipi(cpumask_bits(cpumask_of(hartid)));
 }
 
 static inline void clear_ipi(void)
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
