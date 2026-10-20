Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B487D606A319
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 05:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UDVv7Tr3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VcsIUYrI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dT6yMhUVdsv2pJd6y5SJ6b9H+PijVA3ghUNjZf30KHY=; b=UDVv7Tr3Nk3ytZ
	jRLp4QHickPhMrtKHXWGk8aoimPdBFHLEN3Sop4gfK1rxghCunmahdE65yMvekGnzDQiJSN+lTa81
	EDXzXIei24ElGfbCZxH4E0c4p9dzjGQM4C9bzP+cqYRAP8/JfYb42wkxxLFptGMR+hBjOWjkYT6zI
	NKdw6m9/n/DeZJUq7zb9s7ru+41TV0oANWy4IatQ5hKvxpWSmjqlBJQEwdCA4PHWcs4DGjZ4r4LYv
	r+RC2F08cY1brSEpDNbwFubquguKfgPmuT/kArWmKpMQQRbn/TMJJEAmFsOiUfbcTpU4L0Sz7S8y7
	oD1cwxt7FLbR+GPjcAGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ2VC-00000008sVC-0Ji7;
	Tue, 20 Oct 2026 05:35:10 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ2V9-00000008sUf-1klF
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 05:35:08 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-91b89c6caffso22721816d6.2
        for <linux-riscv@lists.infradead.org>; Mon, 19 Oct 2026 22:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792474506; x=1793079306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47QGolyVJG7rJ7+E1J8PPA+rcCQGmFElB+S6NGZ8+EY=;
        b=VcsIUYrIf+lAV9rzIw/erFBaWXjpipc8DuRrwE1DuPwq1PW1uuJp0qwkMqBPde8GlC
         SER7f+qlrMFrg+saA0XHwzJTfub5kA4SAN7uJCvYWA9ytSAqwRWw9v6Qh2vS/EdTLCb3
         SfuCpwJedg1J4B0FBGBgy7yLha0GLSkaPMkIPtykpmI7BRbEwttmhMGhdQjwWYprS8WG
         ysbD0VF4lsdReAvMJeiYV4ancfweJRpk4O1SFXzqZovuPx3hB0akHBJF3IWSugOB4Cw/
         5ztAzbWqz3+KvLd9/N6H/pqn9JCL4PJjfm/wVSxPye9lYNDq/7EpiqPgH6dtzWvXg3jy
         czqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792474506; x=1793079306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=47QGolyVJG7rJ7+E1J8PPA+rcCQGmFElB+S6NGZ8+EY=;
        b=zcM0FLBBCQEYDAgHt4uN5r0nFhD+N0YVFVHc8ERBiJyr4CdLM7QA8WMiqgEV8Ndzdb
         Dn9P3MjFyIVvjtFjYYKOe8EARkVkGoNdARIQdEQ725Tqli9xPftOT5fVVpMMlazXcuj2
         c98pyyTW5quucvBfZzVJTji/GJtub7MJKdynCx5sqFKSg/tXiSsvWmJwHyB8D2C1rhQC
         Csn0PMTkSqNIR5TAyLxwkZrOytTcfPqLUCd0lbkfuG924tBFkyLgStG0UyOAd4Melbi5
         7rwt+f0Vl4Cf7dd5GK7LUshaLWg9vUU4lsAgtfjR1Y9PyQQCjli3aRqtmTQUXqrjlxD7
         8QoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpvq/zQWStsX12W5/vz4gUpl7UiLm8KfXnw3WM+D2ERTZqNXSr/r4E/ab7qWojovVxHqczvsruWHFZ4w==@lists.infradead.org
X-Gm-Message-State: AFq9FYKvT4d6cIcsU5LWE8IbilU79y+Euvd9AkFEc30xOoDUEwh8BVJI
	0B4pggGOoBw3JZpfeceqFb5ODJwnE4cCW/lHWufXMgRh/P2O86AWnOKI
X-Gm-Gg: AYBFou1o3XMANsWW3BnYpffsJCFxUgmNUyiHzuYPLGUPAMghgv3RVKeza2tFn6vTGbN
	OEE62W4VZT5yVDXvjcPzR6tHcgaQ7ZwEUj5m0YvbeX2hSmLhiGls9UqX3IiKlEiABp9uNwyB9hy
	3COHdc4GezR/srpM/P2GkzsHaRfvnL3FA9vMdE6fwhV60I7T8JypSKHFBLOO7zUaT0L06RtdnIm
	kdDIBlxh0Wwjdf11QTt1X/v0Bulpi1hLKrMIKdo8DsXq4GO4Wj9WctczFeN5tLJcpi/Z15jB375
	KopdjBQZgjIBHPtUBSrEA2+kY2YRNsClG5zy9FY//Rgpf2yDJ6fThN87t9nLD6ZJs78PwRgNuvI
	RcR0cj7nNRoeVDT0jRspLZCPju/2YPmswdrtSfOB5ijz0jQRVES8rt0CaEnPwlvEWP0NamfviJL
	kU/07gqyxJtpYAlh8yp+k/IbR2Zvq2YzQcv3TQgwUak2FjFC7K4Y7RlH07PvYR0Oxy+riFWXnsE
	xrKjvJDM9Mi53Mc1vyjjA==
X-Received: by 2002:a05:620a:2990:b0:93c:c08f:ecf with SMTP id af79cd13be357-93f29d69e08mr1677471085a.53.1792474506083;
        Mon, 19 Oct 2026 22:35:06 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4b082168sm139455685a.22.2026.10.19.22.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 22:35:04 -0700 (PDT)
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
Subject: [PATCH v1 1/2] iommu/riscv: Keep page table pages when IOTLB invalidation fails
Date: Tue, 20 Oct 2026 01:34:23 -0400
Message-ID: <20261020053435.1179054-5-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020053435.1179054-4-oss.patchbox@gmail.com>
References: <20261020053435.1179054-4-oss.patchbox@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_223507_477438_091D5E89 
X-CRM114-Status: GOOD (  20.07  )
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

riscv_iommu_iotlb_sync() frees the page table pages on gather->freelist
right after riscv_iommu_iotlb_inval(), which does not report whether the
invalidation commands could be queued or whether IOFENCE.C completed.
If either fails, the pages go back to the page allocator while the IOMMU
may still hold cached entries pointing to them, and whatever their next
owner writes there can then be walked as page table entries.

The kernel-doc of struct iommu_iotlb_gather requires these pages to be
freed only after the cached references are gone. Return an error from
the command helpers and riscv_iommu_iotlb_inval(), and leak the freelist
with a one-time warning when the invalidation was not confirmed. The
other callers of these helpers keep ignoring the result.

This does not cover the pages freed by the dma-iommu flush queue after
flush_iotlb_all(), nor the data pages released by iommu_unmap() callers,
as the IOMMU core does not let those callbacks report a failure.

Fixes: 488ffbf18171 ("iommu/riscv: Paging domain support")
Assisted-by: LLM
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
This was found with a static analysis tool from ongoing, not yet
published research, and confirmed by code inspection. It has not been
reproduced on hardware or in an emulator.

 drivers/iommu/riscv/iommu.c | 63 +++++++++++++++++++++++++------------
 1 file changed, 43 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index fe8e6d0f8a23..816d50c0f508 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -508,15 +508,15 @@ static irqreturn_t riscv_iommu_cmdq_process(int irq, void *data)
 }
 
 /* Send command to the IOMMU command queue */
-static void riscv_iommu_cmd_send(struct riscv_iommu_device *iommu,
-				 struct riscv_iommu_command *cmd)
+static int riscv_iommu_cmd_send(struct riscv_iommu_device *iommu,
+				struct riscv_iommu_command *cmd)
 {
-	riscv_iommu_queue_send(&iommu->cmdq, cmd, sizeof(*cmd), NULL);
+	return riscv_iommu_queue_send(&iommu->cmdq, cmd, sizeof(*cmd), NULL);
 }
 
 /* Send IOFENCE.C command and wait for all scheduled commands to complete. */
-static void riscv_iommu_cmd_sync(struct riscv_iommu_device *iommu,
-				 unsigned int timeout_us)
+static int riscv_iommu_cmd_sync(struct riscv_iommu_device *iommu,
+				unsigned int timeout_us)
 {
 	struct riscv_iommu_command cmd;
 	unsigned int prod;
@@ -525,14 +525,17 @@ static void riscv_iommu_cmd_sync(struct riscv_iommu_device *iommu,
 	riscv_iommu_cmd_iofence(&cmd);
 	ret = riscv_iommu_queue_send(&iommu->cmdq, &cmd, sizeof(cmd), &prod);
 	if (ret)
-		return;
+		return ret;
 
 	if (!timeout_us)
-		return;
+		return 0;
 
-	if (riscv_iommu_queue_wait(&iommu->cmdq, prod, timeout_us))
+	ret = riscv_iommu_queue_wait(&iommu->cmdq, prod, timeout_us);
+	if (ret)
 		dev_err_once(iommu->dev,
 			     "Hardware error: command execution timeout\n");
+
+	return ret;
 }
 
 /*
@@ -1002,14 +1005,15 @@ static void riscv_iommu_tlbi_calc(struct riscv_iommu_tlbi *tlbi,
 	}
 }
 
-static void riscv_iommu_iotlb_inval_iommu(struct riscv_iommu_device *iommu,
-					  int pscid,
-					  struct riscv_iommu_tlbi *tlbi)
+static int riscv_iommu_iotlb_inval_iommu(struct riscv_iommu_device *iommu,
+					 int pscid,
+					 struct riscv_iommu_tlbi *tlbi)
 {
 	bool use_nl = tlbi->non_leaf &&
 		      (iommu->caps & RISCV_IOMMU_CAPABILITIES_NL);
 	struct riscv_iommu_command cmd;
 	unsigned int i;
+	int err, ret = 0;
 
 	riscv_iommu_cmd_inval_vma(&cmd);
 	riscv_iommu_cmd_inval_set_pscid(&cmd, pscid);
@@ -1027,7 +1031,7 @@ static void riscv_iommu_iotlb_inval_iommu(struct riscv_iommu_device *iommu,
 						tlbi->range.sz_lg2);
 		if (use_nl)
 			riscv_iommu_cmd_inval_set_nl(&cmd);
-		riscv_iommu_cmd_send(iommu, &cmd);
+		ret = riscv_iommu_cmd_send(iommu, &cmd);
 	} else {
 		unsigned long iova;
 
@@ -1039,21 +1043,24 @@ static void riscv_iommu_iotlb_inval_iommu(struct riscv_iommu_device *iommu,
 			riscv_iommu_cmd_inval_set_addr(&cmd, iova);
 			if (use_nl)
 				riscv_iommu_cmd_inval_set_nl(&cmd);
-			riscv_iommu_cmd_send(iommu, &cmd);
+			err = riscv_iommu_cmd_send(iommu, &cmd);
+			if (err)
+				ret = err;
 			iova += 1ULL << tlbi->single.stride_lg2;
 		}
 	}
-	return;
+	return ret;
 global:
-	riscv_iommu_cmd_send(iommu, &cmd);
+	return riscv_iommu_cmd_send(iommu, &cmd);
 }
 
-static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
-				    struct iommu_iotlb_gather *gather)
+static int riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
+				   struct iommu_iotlb_gather *gather)
 {
 	struct riscv_iommu_device *iommu, *prev;
 	struct riscv_iommu_bond *bond;
 	struct riscv_iommu_tlbi tlbi;
+	int err, ret = 0;
 
 	riscv_iommu_tlbi_calc(&tlbi, gather);
 
@@ -1096,7 +1103,9 @@ static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
 		if (iommu == prev)
 			continue;
 
-		riscv_iommu_iotlb_inval_iommu(iommu, domain->pscid, &tlbi);
+		err = riscv_iommu_iotlb_inval_iommu(iommu, domain->pscid, &tlbi);
+		if (err)
+			ret = err;
 		prev = iommu;
 	}
 
@@ -1106,10 +1115,14 @@ static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
 		if (iommu == prev)
 			continue;
 
-		riscv_iommu_cmd_sync(iommu, RISCV_IOMMU_IOTINVAL_TIMEOUT);
+		err = riscv_iommu_cmd_sync(iommu, RISCV_IOMMU_IOTINVAL_TIMEOUT);
+		if (err)
+			ret = err;
 		prev = iommu;
 	}
 	rcu_read_unlock();
+
+	return ret;
 }
 
 #define RISCV_IOMMU_FSC_BARE 0
@@ -1270,7 +1283,17 @@ static void riscv_iommu_iotlb_sync(struct iommu_domain *iommu_domain,
 {
 	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
 
-	riscv_iommu_iotlb_inval(domain, gather);
+	/*
+	 * The IOMMU may keep walking the page table pages on the freelist
+	 * until the invalidation has completed. If that is not confirmed,
+	 * leak them instead of handing them back to the page allocator.
+	 */
+	if (riscv_iommu_iotlb_inval(domain, gather)) {
+		if (!iommu_pages_list_empty(&gather->freelist))
+			pr_warn_once("IOTLB invalidation failed, leaking page table pages\n");
+		return;
+	}
+
 	iommu_put_pages_list(&gather->freelist);
 }
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
