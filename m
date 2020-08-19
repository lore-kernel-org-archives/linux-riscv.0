Return-Path: <SRS0=trTC=B5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5F6C433DF
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2020 14:10:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 789D5204FD
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2020 14:10:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ukC2o+g3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JbzV546g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 789D5204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qKImEZ3lPq+La3YC/V9IUtduvDQq2boDipGaEjhYLn0=; b=ukC2o+g3ug1uRXzSwCUeTSUZe9
	HWycixD/A7Y+bou8JvnnNUpvz5BqCSkRcvFl1xAXihYins2QpYcC8FK8Tg2maeF9d17QF0yhgCGo2
	Fl8lVVlrVY2lGKZMtToLivfzKLmFd1XzFPLeOnMw66QFN7KaVeSCYIxZxwBR2TdhCvZoVxW1W6Onx
	KczFR8afFfIMy9x1C9modCYC7LgDVg9wtYBcwWBI8OdNY0DjJqBsM1BpAB7JWQyiF0JlmiAHRDj1P
	/lTAleDzwMkMlWrX1LzMat74oxBLajUeccxw86pNUPA++QP+XMv28ftpeL8Eryd39wzIPQFRPO3Ux
	m79U7eOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8OnL-0002Kw-QE; Wed, 19 Aug 2020 14:10:27 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8OnJ-0002Il-OS
 for linux-riscv@lists.infradead.org; Wed, 19 Aug 2020 14:10:26 +0000
Received: by mail-lj1-x242.google.com with SMTP id v12so25522594ljc.10
 for <linux-riscv@lists.infradead.org>; Wed, 19 Aug 2020 07:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Tkp6zAz/dd4xX5WOqpWPt+tSXndrQwNs+TXkixYSnA=;
 b=JbzV546gBV4lQFe6KLURUqYOKG+dBcyuqCtnVsI4qqUGdx3M2j1U1rjdExI+RwseN3
 mV9Ib9g7Sxsmk1k+f3g6ZF+1fDcJj9u1/uhiL6qwbhGQzQhxj2cU+qr5CHUlLZNHTc3n
 XP6L0NNNw00UNC9vn9dqrMkNDsYJrL84tSIZjJJnLPppf6RsDFiUW8XoIfLl1xFmAVP2
 7CFZ+FfU5A5m0A5br99Pmrn+gXIdS+TSwuTgzYt7OY+HePv7rbX/Img3Q6yMr66HiAlR
 Tdx7+X6J86tflxotoUPYoMv5V53jA9uF6qBgNUZnWe3E58wTNmx6+TRH1AMTaWTd+v9k
 4p4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Tkp6zAz/dd4xX5WOqpWPt+tSXndrQwNs+TXkixYSnA=;
 b=SK0iew80D85HluKo5D5QTaioIawwQrd5BSvyMOuevU1q4n7IKgUUVmvPwsAk3ocGuU
 PV0VnzKu1o3Fs7UEAyzrLLmIWS/GFHaprv9u/ERAqCBtdAj1OzRPH06kZg3mr2iWayKq
 ISYOhrUzKGxq/aY/u/N51UHs/EmV4zhGIhItkSHOt2tvegRXaE3jkd56sp3R6gKDZe65
 8HfofUfG9W+EodHhqd35CG1/nW7IJkM5eez3NJ6WPcxxb340eCWW76r9v2+9eumuGNZM
 lDv40+D2/erCZaL5YQpB924iWl3WT5f+l9AE9Qd6nvxzt9psXLDCN7SHlvatDFzowsVk
 Huhg==
X-Gm-Message-State: AOAM5325pnfw6OcUuIxqd7cihKzWsvLQX5dgSwiFa0MIs8FAlHsy43XD
 yuntmnT5t6NCPvU6wZp0l9VckpLNT+32IA==
X-Google-Smtp-Source: ABdhPJz+7sxvJM+TmzP4VudFwnnTClBRNXoWjL+tcDOnBTeCvYDY5efPA90g1z+UdaKTXyt5LEBapw==
X-Received: by 2002:a2e:9908:: with SMTP id v8mr12227211lji.410.1597846222359; 
 Wed, 19 Aug 2020 07:10:22 -0700 (PDT)
Received: from nero.bb.dnainternet.fi
 (dyn9cmyyyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:2fa:2500::1])
 by smtp.gmail.com with ESMTPSA id a9sm6655415ljb.57.2020.08.19.07.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 07:10:21 -0700 (PDT)
From: Pekka Enberg <penberg@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv/mm: Simplify retry logic in do_page_fault()
Date: Wed, 19 Aug 2020 17:10:11 +0300
Message-Id: <20200819141011.1904770-1-penberg@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_101025_810448_BDBA7F68 
X-CRM114-Status: GOOD (  10.54  )
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
Cc: Pekka Enberg <penberg@kernel.org>, palmer@dabbelt.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Pekka Enberg <penberg@kernel.org>

Let's combine the two retry logic if statements in do_page_fault() to
simplify the code.
---
 arch/riscv/mm/fault.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 716d64e36f83..f5c2e4a249eb 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -127,17 +127,15 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 		BUG();
 	}
 
-	if (flags & FAULT_FLAG_ALLOW_RETRY) {
-		if (fault & VM_FAULT_RETRY) {
-			flags |= FAULT_FLAG_TRIED;
-
-			/*
-			 * No need to mmap_read_unlock(mm) as we would
-			 * have already released it in __lock_page_or_retry
-			 * in mm/filemap.c.
-			 */
-			goto retry;
-		}
+	if (unlikely((fault & VM_FAULT_RETRY) && (flags & FAULT_FLAG_ALLOW_RETRY))) {
+		flags |= FAULT_FLAG_TRIED;
+
+		/*
+		 * No need to mmap_read_unlock(mm) as we would
+		 * have already released it in __lock_page_or_retry
+		 * in mm/filemap.c.
+		 */
+		goto retry;
 	}
 
 	mmap_read_unlock(mm);
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
