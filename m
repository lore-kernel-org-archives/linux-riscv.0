Return-Path: <SRS0=RYOb=WR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F25DC3A59E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2019 14:58:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15E6D22DA7
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2019 14:58:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X/Q1NwJo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15E6D22DA7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wpTez8OKOR5TWlP/PUWdXXZAyEeuHfUNaQ/MOmkjK38=; b=X/Q1NwJoJheQKm
	4/6Z9BK4s2A0EDhvbSNgEyqNQeu0YeYUnS/RmBc04oaMLz+RqvLtihVovugFyyfAEFfKNryZeGHrM
	VMOqjqKn4RYESurToG8/gHfIl9Yt6+7WK3oF2fbLTo9lmYdojjav/WcRjlM/hJV/YrfjxlmYBGAnu
	YenLRKfTTC0w+IeanYY2ndelNCBLo7S0U7uMWtH0NjOhXFcq3TODNpNHFnEg7k5WOXpbY62EVMnCy
	dD8K09jAXVz9XqOhjx6OPVE5WXlSXs0OX65WRaIq634P4oXeCQV6Iri/1z4syz1i1UJ5xX9WNo8kK
	Wr7QmOxdbfwuqXhhCnHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0S4T-00067T-2R; Wed, 21 Aug 2019 14:58:45 +0000
Received: from [182.171.81.139] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i0S4Q-00063D-Iu; Wed, 21 Aug 2019 14:58:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 2/6] riscv: cleanup send_ipi_mask
Date: Wed, 21 Aug 2019 23:58:33 +0900
Message-Id: <20190821145837.3686-3-hch@lst.de>
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

Use the special barriers for atomic bitops to make the intention
a little more clear, and use riscv_cpuid_to_hartid_mask instead of
open coding it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/smp.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 8cd730239613..2e21669aa068 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -80,17 +80,15 @@ static void ipi_stop(void)
 
 static void send_ipi_mask(const struct cpumask *mask, enum ipi_message_type op)
 {
-	int cpuid, hartid;
 	struct cpumask hartid_mask;
+	int cpu;
 
-	cpumask_clear(&hartid_mask);
-	mb();
-	for_each_cpu(cpuid, mask) {
-		set_bit(op, &ipi_data[cpuid].bits);
-		hartid = cpuid_to_hartid_map(cpuid);
-		cpumask_set_cpu(hartid, &hartid_mask);
-	}
-	mb();
+	smp_mb__before_atomic();
+	for_each_cpu(cpu, mask)
+		set_bit(op, &ipi_data[cpu].bits);
+	smp_mb__after_atomic();
+
+	riscv_cpuid_to_hartid_mask(mask, &hartid_mask);
 	sbi_send_ipi(cpumask_bits(&hartid_mask));
 }
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
