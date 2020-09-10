Return-Path: <SRS0=oUx1=CT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E11C2BB84
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:13:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B2F120855
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:13:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ke6pOHt6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="PvWbMzOn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B2F120855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N4KS26jk4/0P0e+uCAQf3kLtRLoSo9LFtL1w1+EX/C8=; b=ke6pOHt6Zbpq+8x+oHHe1Ww93
	nPS3zuaGKX/yvMe/i4V1euiSDxgqTbqbb9LaGwihq7t0VKabHziEJMWm6Zke7C3bVpYow3k5Sxyzp
	vxSHzwBdMrajyvR3wJN5QdadqevITXLK6M0mTZaUSyoC8L7qdVqmnYeRfW6UPrl7n8P7aa+hMC929
	ad/zxwoddhK/gFBWg+pilAFP5LuhvfT2S2uu4ijReafZHLrUXlyZ/B/jIf3KCey4WOTIXXoNPAhaa
	ZOakZQ2Yi0eaak/gKMYaGNC6HtehxExluVQVcmHyADdLzzXgO9SML8YacB/tokJD7g53HXJWA0ONG
	g0XDgEMHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGHhy-0000FT-6H; Thu, 10 Sep 2020 08:13:30 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGHhk-0008W3-Pa
 for linux-riscv@lists.infradead.org; Thu, 10 Sep 2020 08:13:18 +0000
Received: by mail-pj1-x1043.google.com with SMTP id s2so2658713pjr.4
 for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2020 01:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pAMkA/3aTQh3mdGZj/s1RlXHfKX+QtUH/LE8w7z4tNM=;
 b=PvWbMzOnFtWQG7qRDUDebIfvp3b0vep5Vm+TYLouDMuStueEpBGd9QWdcTD4jmPET0
 X4zjzDbVchMg/rUagEeQ1yc4Ixkob9NFN0BnNHZJUUQ5F2Aw48QDKfPb7PzzxLJJFZFW
 GDMV6APA7h0vtqlPfh/xgG8pdQXyE8S2HubJAfAZ3Fuw13Fu1PEZIEyUeERbred3sBxQ
 rdmqLaqm0b8ER/rmj+QxM7Y+7gcj3welCaMFl8WtDQZcMUSp1kCdIdkQ2L1W08SBjeKX
 1VMTa3vI0+Zg8KuhDU6o3asro/KMBqYZ/PJElUvbL2NoSQki1UH4EcUJusRZHMuvXKDS
 qZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pAMkA/3aTQh3mdGZj/s1RlXHfKX+QtUH/LE8w7z4tNM=;
 b=ZzZoxIc6HdfN40jGuE5D0JwuaQaxcLvpTljP+eVt5GcIcr6xmrOdlglVYQNnI2DAcM
 uxO25w5aaVkMyAa6JEazRsr9obZFVZMzk9O6NFPA9h4UlqdQwn4tYHyilwnlxhHNpyua
 xVlPNmm9eDqVgA4cOEvxSTpW62t3OAtfa6oJvrK9B4STxZw0AlEBp8vzr7aC40Mykdtl
 yn5M1EYkGtVga53LqMmtQn0OfEA1bkrzBVlKoioW6IU9ZdvKgfCKp8aVIFJv6h8opwb0
 8iJ3B7YKPvJM6GFV2hOUWObhNXDjbu8VHVbrgatwmyoAiMuF8lMPp2C7YUSHM9u19Jrl
 tSZQ==
X-Gm-Message-State: AOAM5339oaQa55d6e3C/O04I/LAX45Ggm3X0bZ2xqlfhTQbfVChYNVet
 Y+PXsG3WPH/OyEv6q1k8hC7tPQ==
X-Google-Smtp-Source: ABdhPJy8nneeaWVGjwiPRu79njgkLzOSXvUGKyeGFNacBm2bYWxvlsvTKJ8s3tl5ESmpSz7GBadkvg==
X-Received: by 2002:a17:902:7c07:: with SMTP id
 x7mr4303470pll.119.1599725594937; 
 Thu, 10 Sep 2020 01:13:14 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id e1sm2196056pfl.162.2020.09.10.01.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 01:13:14 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Subject: [RFC PATCH v7 18/21] riscv: Optimize vector registers initialization
Date: Thu, 10 Sep 2020 16:12:13 +0800
Message-Id: <7214a2bb57fc9711b38a49f398780241389e73aa.1599719352.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1599719352.git.greentime.hu@sifive.com>
References: <cover.1599719352.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_041317_535244_28EB115E 
X-CRM114-Status: GOOD (  10.61  )
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
Cc: Han-Kuan Chen <hankuan.chen@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch optimizes the initialization or invalidation of vector
registers. It can reduce the code sizes of vector_flush_cpu_state()
and reset_regs().

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Han-Kuan Chen <hankuan.chen@sifive.com>
---
 arch/riscv/kernel/head.S               | 30 +-----------------------
 arch/riscv/kernel/kernel_mode_vector.c | 32 ++------------------------
 2 files changed, 3 insertions(+), 59 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 74f2fd8430e0..2fbb4df368b1 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -375,39 +375,11 @@ ENTRY(reset_regs)
 
 	li	t1, SR_VS
 	csrs	CSR_STATUS, t1
-	vsetvli t1, x0, e8, m1
+	vsetvli t1, x0, e8, m8
 	vmv.v.i v0, 0
-	vmv.v.i v1, 0
-	vmv.v.i v2, 0
-	vmv.v.i v3, 0
-	vmv.v.i v4, 0
-	vmv.v.i v5, 0
-	vmv.v.i v6, 0
-	vmv.v.i v7, 0
 	vmv.v.i v8, 0
-	vmv.v.i v9, 0
-	vmv.v.i v10, 0
-	vmv.v.i v11, 0
-	vmv.v.i v12, 0
-	vmv.v.i v13, 0
-	vmv.v.i v14, 0
-	vmv.v.i v15, 0
 	vmv.v.i v16, 0
-	vmv.v.i v17, 0
-	vmv.v.i v18, 0
-	vmv.v.i v19, 0
-	vmv.v.i v20, 0
-	vmv.v.i v21, 0
-	vmv.v.i v22, 0
-	vmv.v.i v23, 0
 	vmv.v.i v24, 0
-	vmv.v.i v25, 0
-	vmv.v.i v26, 0
-	vmv.v.i v27, 0
-	vmv.v.i v28, 0
-	vmv.v.i v29, 0
-	vmv.v.i v30, 0
-	vmv.v.i v31, 0
 	/* note that the caller must clear SR_VS */
 #endif /* CONFIG_VECTOR */
 
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 108cfafe7496..b84618630edf 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -86,39 +86,11 @@ static void vector_flush_cpu_state(void)
 	long tmp;
 
 	__asm__ __volatile__ (
-		"vsetvli %0, x0, e8, m1\n"
+		"vsetvli %0, x0, e8, m8\n"
 		"vmv.v.i v0, 0\n"
-		"vmv.v.i v1, 0\n"
-		"vmv.v.i v2, 0\n"
-		"vmv.v.i v3, 0\n"
-		"vmv.v.i v4, 0\n"
-		"vmv.v.i v5, 0\n"
-		"vmv.v.i v6, 0\n"
-		"vmv.v.i v7, 0\n"
 		"vmv.v.i v8, 0\n"
-		"vmv.v.i v9, 0\n"
-		"vmv.v.i v10, 0\n"
-		"vmv.v.i v11, 0\n"
-		"vmv.v.i v12, 0\n"
-		"vmv.v.i v13, 0\n"
-		"vmv.v.i v14, 0\n"
-		"vmv.v.i v15, 0\n"
 		"vmv.v.i v16, 0\n"
-		"vmv.v.i v17, 0\n"
-		"vmv.v.i v18, 0\n"
-		"vmv.v.i v19, 0\n"
-		"vmv.v.i v20, 0\n"
-		"vmv.v.i v21, 0\n"
-		"vmv.v.i v22, 0\n"
-		"vmv.v.i v23, 0\n"
-		"vmv.v.i v24, 0\n"
-		"vmv.v.i v25, 0\n"
-		"vmv.v.i v26, 0\n"
-		"vmv.v.i v27, 0\n"
-		"vmv.v.i v28, 0\n"
-		"vmv.v.i v29, 0\n"
-		"vmv.v.i v30, 0\n"
-		"vmv.v.i v31, 0\n":"=r"(tmp)::);
+		"vmv.v.i v24, 0\n":"=r"(tmp)::);
 }
 
 /*
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
