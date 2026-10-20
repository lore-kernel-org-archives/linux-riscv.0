Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73271606A319
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 05:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rUM5PsNW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=o2KCEHLd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=az5gxPaeuMLTwXQgowIIuaAL4Z7epJRlNxM9+Bd9/cg=; b=rUM5PsNWtAjmwR
	URgf/yWkyglPZUAuEPwaszIU6ByWwd0eVYjT9EOKGJZx01SGXftv/EM+BmJAXbEKr8QPv9WwEwIhP
	saYR6e7LbLNkoHwUtBriFayMdz+yCKlC1x+loEHj4OTqS5n4r8Rn3Hmn3f2dynCFYsHJtEDMbYrE6
	8jO8P/6ZvuOJEjnzv/UjYg+XOeg/tnwB778UgG+Qq88pBEcG6vU8/1P/bB/OqC33p3+1GBJJAKNqu
	bZia+thkt+n8sAW+IVximUSRkT9drSt27VbazORN2wO3kUrZCoKXqvxuupf8aL/icO9dxDy17/sKP
	msCw7ygvpFKDycMCOcGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ2VZ-00000008sZT-1wYi;
	Tue, 20 Oct 2026 05:35:33 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ2VV-00000008sYa-3K9l
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 05:35:32 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-93f2f2edb19so234470985a.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Oct 2026 22:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792474529; x=1793079329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UjLNCgx3WekQetaZqMO5VDYLOeTCT6zYxxBPC2GY2rk=;
        b=o2KCEHLdQPBm2Rdc8g7fY8/SIINkbphI69BtSeDVAeqf1ogtFN5HpFLGtGERHZo+Xr
         XCPmwD5WOcmsxjJ3o2pCpDny2c/8CCSDa8Hx7sieMNfCV32WRitXpQWhkrf79xyFjx2r
         m0crNEeU8OcFCguFp6YpSesE2n7bNqjIXQjE3cWuT5ToxJjhZoHgyFqjJtw3hBQdIAVO
         AzlrLCbmM71InHtsflywkGlQ493alpnWKn6oizzXAUe2IymGQfxPXqH2jdOsNhYYvgHw
         lWhoWW1foDu2FaGwAXhIODic//MVJbvKa0BeWuLcTLvEPc7IectB7JzAevNzKUy9E32S
         RB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792474529; x=1793079329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UjLNCgx3WekQetaZqMO5VDYLOeTCT6zYxxBPC2GY2rk=;
        b=TrJtyQGl51G7Xz6db4RMvXVPOb1cysEzl2i6BTPm7/GyJRVVev1Fv/bcP9iRtd3dIQ
         +nFMHkdAuXz7bBerNabm66vuZ3xRcizGS1+QF+H6fzNYmg2bQLBNO2YVScv3YtkHzixc
         9jFzT60ermYDXpgHvWnzXi74/e/VU9ksF1kXo29LzjR8okA23X42mksokFsGLGpEy0Qh
         Xm4HqJw6xj3tJ3Z2Y/AoqGmHGJPyby2eK9xDNqPJeGoDvXVH9RCzlLYnPqJDE/4bt+qm
         hwcxPxmyRNakYS4k8wWdw5FczX43i3HokVpLNCJNXtluJ7lr/lJo8auXMBI9q2MV9ILe
         5gwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIVM9xPx33JXT/LDMbRDSj0ZnrV9yTa+aEhZC65YTHx59HhzJR7Rt9JBketqx5rQ5ZqFYqfCFoU53rqw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJiWmLpDB642siE4yvA8Py4xgD5PaRDy81Dnvh0VM0+cHy0cJvb
	+58WywNCUmiL3OlVTmpT7y5L79wzCHnhmcRTJc5STou5qZsCsrqESxxQ
X-Gm-Gg: AYBFou2EUSKO6PzM7zWwOLW5auEM15VQyFffNrzgHfEpOcyMX38hSSi0e8vL7L/ptCZ
	z0C6G50t4eHTJc95z2rmBIGC253fW6RTR7Pwz6boOjNnmUnBRfpQdBLuhGqPAIJYnh4vWvwJSgl
	ZptkGvXDfRXLsRzZ3GXaHwKkV4h8KLIBQXvO1fxguq23eQ0hvUXxPHI1RtPrv7s5XJhdx++hvra
	1Y2trbg3P3LFUeWq6mtGPhMzR//7d75jKbuQi+uUUrJ4R+ufPbuuqPZQbdGfc78FPbOZReiWAp1
	9X0h6aNOk0uXuDSMjUUDWKovAvW8XGdGEq2gd6IC7yxQccjFSns/WmGArMZOc0I7BpvCsEA8Hyp
	0yGZMriIMnkHHejTnh+De5i0zV2TdatMel9pRUZsHFFc5ONQENz0WMnYWYl1jQq+7Hx8yTOtygI
	duceyz52uasBANr/ZCL6lcA0ILjapJoD0YDirSnw00yKOk35NwtJDOWi3H4rn5peG8+3pgkm3Za
	3LpsOTCqszEVYVrDVHxmHkic7dhS5Ni
X-Received: by 2002:a05:620a:2602:b0:93f:5ac:14a3 with SMTP id af79cd13be357-93f29df1d42mr1601610185a.73.1792474528522;
        Mon, 19 Oct 2026 22:35:28 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4b082168sm139455685a.22.2026.10.19.22.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 22:35:27 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Tomasz Jeznach <tomasz.jeznach@linux.dev>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>,
	Zong Li <zong.li@sifive.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1 2/2] iommu/riscv: Do not report a stalled command queue as completed
Date: Tue, 20 Oct 2026 01:34:24 -0400
Message-ID: <20261020053435.1179054-6-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020053435.1179054-4-oss.patchbox@gmail.com>
References: <20261020053435.1179054-4-oss.patchbox@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_223529_835785_DE9724ED 
X-CRM114-Status: GOOD (  16.84  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit b2e5684558ed ("iommu/riscv: Stop polling when CQCSR reports
an error"), riscv_iommu_queue_wait() stops polling when CQCSR has cqmf,
cmd_to or cmd_ill set, but then returns 0 as if the waited-for command
had been executed. The hardware stops processing the queue at the
faulting command, so an IOFENCE.C queued behind it has not completed,
yet riscv_iommu_iotlb_sync() goes on to free the page table pages.

Return -EIO when the queue stopped before reaching the waited-for entry,
and keep the "command execution timeout" message for real timeouts; the
interrupt handler already reports the CQCSR error bits.

Fixes: b2e5684558ed ("iommu/riscv: Stop polling when CQCSR reports an error")
Assisted-by: LLM
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
This was found with a static analysis tool from ongoing, not yet
published research, and confirmed by code inspection. It has not been
reproduced on hardware or in an emulator.

 drivers/iommu/riscv/iommu.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 816d50c0f508..2a95cb8c9e4c 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -371,15 +371,24 @@ static int riscv_iommu_queue_wait(struct riscv_iommu_queue *queue,
 	unsigned int cons = atomic_read(&queue->head);
 	unsigned int flags = RISCV_IOMMU_CQCSR_CQMF | RISCV_IOMMU_CQCSR_CMD_TO |
 			     RISCV_IOMMU_CQCSR_CMD_ILL;
+	int ret;
 
 	/* Already processed by the consumer */
 	if ((int)(cons - index) > 0)
 		return 0;
 
 	/* Monitor consumer index */
-	return readx_poll_timeout(riscv_iommu_queue_cons, queue, cons,
+	ret = readx_poll_timeout(riscv_iommu_queue_cons, queue, cons,
 				 (riscv_iommu_readl(queue->iommu, queue->qcr) & flags) ||
 				 (int)(cons - index) > 0, 0, timeout_us);
+	if (ret)
+		return ret;
+
+	/* The queue stopped on an error before it reached the item. */
+	if ((int)(cons - index) <= 0)
+		return -EIO;
+
+	return 0;
 }
 
 static int riscv_iommu_queue_wait_for_space(struct riscv_iommu_queue *queue,
@@ -531,7 +540,7 @@ static int riscv_iommu_cmd_sync(struct riscv_iommu_device *iommu,
 		return 0;
 
 	ret = riscv_iommu_queue_wait(&iommu->cmdq, prod, timeout_us);
-	if (ret)
+	if (ret == -ETIMEDOUT)
 		dev_err_once(iommu->dev,
 			     "Hardware error: command execution timeout\n");
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
