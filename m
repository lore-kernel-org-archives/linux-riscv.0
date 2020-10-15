Return-Path: <SRS0=HcYa=DW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCC6C433E7
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2020 12:46:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EF9722258
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2020 12:46:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="glI30ezG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTwNHgpk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EF9722258
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Ci0ubN4fxUbVqHGVJwo3OUlCn9GogMP8w7ThCvzybU=; b=glI30ezGihf3190YNXyw9P+ZDB
	RsgZvD8NHYW2E0l3yXL1K+XD8CM8I0Hq0ziwRfWuTLyTZbmr1grAYKMkhQgExlM6fhU9WleNJF3Zp
	T5D/sx7saXtirf5OHw49GSSnyQwSzrFQXu9nYbL/iUTlg7GuBI0/E8k7v0lIkDBVvAsqny85bqlJ4
	T+9biT0X8zSX1bVuqvFEEk3cET3wmrMRa8u46RdNyzEJSkX1EQeCQjLciNbamzuNrvGCrW2HtduDU
	8lqHMYu8mUERN21FlFTZJgTNXxfUzfCxudgQCJ8k+t1F5nWd/gd2sjTTvIhW/eJyhi3UjDzn5x5Sc
	dLk2u1UA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kT2dm-0000hT-NZ; Thu, 15 Oct 2020 12:45:54 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kT2dj-0000gA-TU
 for linux-riscv@lists.infradead.org; Thu, 15 Oct 2020 12:45:53 +0000
Received: by mail-pg1-x543.google.com with SMTP id o3so1838963pgr.11
 for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2020 05:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6mvSgSzdrG2Kf5lb3MWun4iW1eHn9iEbQn483O97LIM=;
 b=aTwNHgpk37miOmIvDzfMfIoPnp7G+nTSMSavBtn1FisyMgQJTaOIi/cZ9GfgowCVlt
 inMSrOwdbW9GdDBKySPQMBPpszluc2DRvK52PBy5+np/QPNQrkDjE1aKtpmhc1Er+NEf
 s5kXnqHAz6bGaz3kOJT9/GNRh/K1bUngfCobJudp2ZZZgK4Qs3NHWeXSUXgDn7gUtK1p
 FUFkWLPb+kIl6YhJpnPNJj94kqZpsdNQ9XfRbsPxr5hDNg5jXYzWQin+Q+dojPiKrOwE
 mqW0ovZ9ERnj6Us8uwk7tTc/L1MgkspiRcCdpMsRNVhjYDLn/dx+9MpraDVQwGsunuQd
 SW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6mvSgSzdrG2Kf5lb3MWun4iW1eHn9iEbQn483O97LIM=;
 b=m/dZC7cHzaqaMmhpMY4jUCz9Nh3HGxuY8lYQHk+0W2EjoOR91xFUyM60X9Ok37uw0R
 phFUIe6hciA9KjaZojIqc+fBfxI+0t3GFvXVyNCveUF9fPNvumAkTyQ9dpq+GJNEe39d
 Fyp2Bw06Y6DFpAEwS4knDLPPsPLZmzCKaOMFwDcCwbraUuhZIrnqyHqb7QPmOZzOkrmO
 H2LL5uXa93WnU0uUK54oNp9sV612pjE1CfYxNvct2RPmoDAoo0l46MD2VB0Ob+PxU3eG
 zi1DXg6NERdwIEYRBFIPwcf34Ds/FjeTT4SZZzv4hIIrS8ScjkN2VbY+wT6Gm9hGVFwU
 EgOQ==
X-Gm-Message-State: AOAM532ePDWuFzW8qBB0Y89AQ3Akx4VIvnqQ4ATk7KfhZRBrw6CM+NIV
 2qjiyjEantueOL16K0PnYoM=
X-Google-Smtp-Source: ABdhPJzlCrMGZ+8lx296M4DWxczLFUlW9iOq0TKuxofIvWd7tJiddoGn7si2M9GiShabfsg7/e3Sug==
X-Received: by 2002:a63:1604:: with SMTP id w4mr3167693pgl.148.1602765947882; 
 Thu, 15 Oct 2020 05:45:47 -0700 (PDT)
Received: from localhost.localdomain (sau-465d4-or.servercontrol.com.au.
 [43.250.207.1])
 by smtp.gmail.com with ESMTPSA id f15sm3482850pfk.21.2020.10.15.05.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 05:45:46 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: w@1wt.eu, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu
Subject: [PATCH] tools: nolibc: Absolute nit, fix a spelling in the comment,
 huh
Date: Thu, 15 Oct 2020 18:15:17 +0530
Message-Id: <20201015124517.3524567-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201015_084551_955509_F2198A35 
X-CRM114-Status: GOOD (  11.72  )
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
Cc: linux-riscv@lists.infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


Fix a spelling in the comment line.

s/memry/memory/p

This is on linux-next.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 tools/include/nolibc/nolibc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/nolibc/nolibc.h b/tools/include/nolibc/nolibc.h
index 2551e9b71167..0e39f89e8fe1 100644
--- a/tools/include/nolibc/nolibc.h
+++ b/tools/include/nolibc/nolibc.h
@@ -107,7 +107,7 @@ static int errno;
 #endif

 /* errno codes all ensure that they will not conflict with a valid pointer
- * because they all correspond to the highest addressable memry page.
+ * because they all correspond to the highest addressable memory page.
  */
 #define MAX_ERRNO 4095

--
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
