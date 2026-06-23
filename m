Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501A1CD4F26
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 08:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XXYga1hg3uK/HD5pe9H6fUR3cNmE+9h0bKF3yyq2Q0c=; b=grCKnbkLgEZvl8
	G8FTxAgaiZGdCamasM3uW3868jfrGTfYIMuGHT45P7gr+yUUW/0CNqKz2ZLTi49VLjYDpiVxzJqq5
	zuFZL9ctJqqq7ugOfT+LUcoJxLByrUXN5cc/bygRjZJL0Azw4LzRZiRX/jms4OphIV3e+vH27yANJ
	733tES5V62TCdKkkxqONPwHU6exV9NiRNESYkeWkhd9Gnr7k9mp2/bsxBKN8n31SirxRoc25TZSkp
	c57CnXVYV2rRZdPvK8DwBTq7XHhxvNHZP0kDXXwJMYU/gVKd0niOcH0bY8EmMJ5c46NudRMAsqDGl
	LAAjLom8P26vl2JEGR2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwLe-00000005uI3-07fR;
	Tue, 23 Jun 2026 08:19:10 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwLa-00000005uHQ-3nHt
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jun 2026 08:19:09 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-139b914bab6so2344209c88.1
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jun 2026 01:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782202746; x=1782807546; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xTbtFL6V7xdQq2v5wFOMr8PK+R/BJm2uQjBRjFSF9J8=;
        b=a5e1yB8bPgdCk6BqYRQ8cItBktxJYwfnl/MiysyquihBX6xJCIkEsNKcl+nAUbVOtY
         HncNdZYo3ecBHJFneU/lAuWVAHV9I40ouf6EHu76oyzjXcQ8ljXReiCJ4afWIO8EyNgH
         rpVEvmP9Pj4HWe97kkktXTlVjyDSbqHFZlqCXu1grieYjNAxtC2F2jLuYMdS+9AIcjjv
         xW3WZ3omyFpYEV3/obQbPUXx9N61fLPWSYjNmC9SjDeBttVvLfsPTtWsFke3uNQuvNr8
         iELlRGw3+YS+ENlIZwGTeYggg2gdYwbInnsuFzYUT7wrO9WtYfjSN2UvNWvnqOfvRgxa
         ZxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782202746; x=1782807546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTbtFL6V7xdQq2v5wFOMr8PK+R/BJm2uQjBRjFSF9J8=;
        b=nc9qk/sERxjonFFXy6WV20taROUEs2UHe1PAuuwwoKL65x5OoqxJkTNN6xNrPRs8Bx
         /xmMM7wh4MT08MFtmG1pCRcbuoFEh60hLmFJdJDCymvSkh3DgdqAnD8MAH9A9+Y6kTKh
         2QofQmM1TA68tjg31YLqrhyLx32jl1azO9PQlDImKHQUS4qGQq7ghiBUqfjdxN6Pbbww
         WypGxuSfe7TlbsHF4V8EhJYEitTLe9exi10i6yeRbYWO6yATx5Mevv1ziJ3AaiaJkZ8d
         fdPJWjCjjmfx5c14xUrrIUmnE8ktJThmGqCb8ON6Gyww5cAbSxE+rqgGw9mpTwL8w79H
         /6AA==
X-Forwarded-Encrypted: i=1; AFNElJ/JtXgNHtkOxMPoIIzZMk33aWCQ15Ihg5blpcJKtPe/FyNhkXwIfkMufulFe1fYMxYGJduKJ+0DZ7ASIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyezm/eTE+ccIZySm0fKiscoflQ0NZj7OxV8WJR3W5XHW5yGu6u
	xNlAD4g79dicABA/gJplu14XjRSc5Y7Q+LAutIv4/UbIc0B72nsvyeFtFCudcGpBP08=
X-Gm-Gg: AfdE7clnmfzv03yqP/J4q76gd4DRF97jI0The77195txUIoJ7QtHBi3R00HhgfG5bxH
	zM96iLhIuoZrnGTjFbv9Y6FmZnLD6Q9YKjRWV2LHBAhrzzy3SvQlSauIrhJhEHicJxuGUz6EwV6
	RqyNWAvm6NOr93v+7cBtf9gqMhiwXDyg79X3t7SQrXfZwhf5UiBLNyi8okw8Kr8EV0hTsFojc3Q
	WdmbAHPulh4wjnai6+FB4xqjh17859Q1c1izJn7LIZJ5jV+gx70URkfRRA6rVQP0VPhdIDnUVg/
	MWSQPq+QjcoUvlMAw7x9iw9nTP11a00Zmf2r3FOzHts3hO4OjqjEw47gahh5MmRSUtsvss9W5HF
	cImH4gHVZYLppsFpWx3v0x/A/j6sSbInQ1712k1Mv6Uhdni0blGGGXLzmA1jmfuxBi7sLinagi1
	4FTKDlY51ihpf+EShUGOje6DbyRgaDLnud98g=
X-Received: by 2002:a05:7022:45a6:b0:138:3613:db8 with SMTP id a92af1059eb24-139c6ebfc80mr1045661c88.3.1782202745949;
        Tue, 23 Jun 2026 01:19:05 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139adca1b00sm11246236c88.2.2026.06.23.01.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 01:19:05 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH] iommu/riscv: Replace illegal command with dummy IOFENCE to prevent hardware lockup
Date: Tue, 23 Jun 2026 01:19:02 -0700
Message-ID: <20260623081902.589810-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_011907_840187_70A19E80 
X-CRM114-Status: GOOD (  15.77  )
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

When the RISC-V IOMMU encounters an illegal command, the hardware
stops processing and the HEAD register remains pointing at the
illegal command. If software does not handle this properly, the
hardware will be stuck at this index indefinitely, preventing any
further command queue operations.

This patch implements a recovery mechanism by replacing the illegal
command with a dummy IOFENCE instruction (all operands are zero):

1. Prevents hardware lockup: By overwriting the illegal command with
   a valid instruction, the hardware can continue processing from the
   current position instead of being stuck.

2. Enables user recovery: After replacing the illegal command, the
   user/driver has an opportunity to retry the original failed
   operation rather than losing all queued work.

3. Minimal hardware impact: A dummy IOFENCE behaves as a NOP, it
   it performs no cache invalidation operations and has no side
   effects on the system state. This is the safest replacement
   instruction.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 drivers/iommu/riscv/iommu.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index cec3ddd7ab10..6305ec5f467b 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -464,13 +464,35 @@ static unsigned int riscv_iommu_queue_send(struct riscv_iommu_queue *queue,
 static irqreturn_t riscv_iommu_cmdq_process(int irq, void *data)
 {
 	const struct riscv_iommu_queue *queue = (struct riscv_iommu_queue *)data;
-	unsigned int ctrl;
+	struct riscv_iommu_command cmd;
+	unsigned int ctrl, head;
 
 	/* Clear MF/CQ errors, complete error recovery to be implemented. */
 	ctrl = riscv_iommu_readl(queue->iommu, queue->qcr);
 	if (ctrl & (RISCV_IOMMU_CQCSR_CQMF | RISCV_IOMMU_CQCSR_CMD_TO |
 		    RISCV_IOMMU_CQCSR_CMD_ILL | RISCV_IOMMU_CQCSR_FENCE_W_IP)) {
+		/*
+		 * The head pointer is not updated by the hardware, it
+		 * still points to the index of illegal command
+		 */
+		riscv_iommu_readl_timeout(queue->iommu, Q_HEAD(queue), head,
+					  !(head & ~queue->mask), 0,
+					  RISCV_IOMMU_QUEUE_TIMEOUT);
+
+		if (ctrl & RISCV_IOMMU_CQCSR_CMD_ILL) {
+			/*
+			 * Use a dummy IOFENCE instead of the illegal command
+			 * to prevent hardware lockup
+			 */
+			memset(&cmd, 0, sizeof(cmd));
+			cmd.dword0 = FIELD_PREP(RISCV_IOMMU_CMD0_OPCODE,
+						RISCV_IOMMU_CMD_IOFENCE_OPCODE);
+			memcpy(queue->base + head * sizeof(cmd), &cmd, sizeof(cmd));
+			dma_wmb();
+		}
+
 		riscv_iommu_writel(queue->iommu, queue->qcr, ctrl);
+
 		dev_warn(queue->iommu->dev,
 			 "Queue #%u error; fault:%d timeout:%d illegal:%d fence_w_ip:%d\n",
 			 queue->qid,
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
