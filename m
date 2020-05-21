Return-Path: <SRS0=zhGB=7D=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1603BC433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 May 2020 20:50:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C076520756
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 May 2020 20:50:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q2gstPIP";
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ntmr+Imz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C076520756
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kczfaJyChMu6EIoy646172ExIAqf1Ynz8kb/dN7rijo=; b=Q2gstPIPMDNT7B
	2vYEQOh3PFsRV5HJ3cH0pjIu1b0lIAireUDhnoBvAckrjYEoVlUYV1kU6pm+EJ5y10Ckh2+RWOm5Y
	x7dU9zLyzLPDdGznFTx3fZ9iP5F4jgR2d9Cazn5ormLR+bPekXxEHIuFdhF4U23l5kIe6SCRyd76Z
	nvbO0fe+crKEg+RZD4lAwe/3lQpiREXbjTvXW8LXAau+3sBtBF9ds4zo65wVRiBcY5ksGXFXGQRfR
	JBThTUMm2hzp3Z1R3K7mfgaceg3I6Nt8EXcxt2RhGIn2OK0mrEfC3NgXDr9HBsbw5xRlzclMUPOGh
	J/TJ6iwY9i0zGffhOB0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbs8a-0002CQ-Df; Thu, 21 May 2020 20:49:56 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbs8X-0002Bk-4m
 for linux-riscv@lists.infradead.org; Thu, 21 May 2020 20:49:55 +0000
Received: by mail-pj1-x1041.google.com with SMTP id cx22so3850326pjb.1
 for <linux-riscv@lists.infradead.org>; Thu, 21 May 2020 13:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=kczfaJyChMu6EIoy646172ExIAqf1Ynz8kb/dN7rijo=;
 b=ntmr+ImztJwuT7wQnxWYxvTyurLHL2SZycYa/AXy/pzjihFxIGlFkY9rHywPMrvrW+
 zbQ65ciYTtTZEgsuHIT0I6OQLvMhRffAzofL2fuqksMZqztPtuBpQMq1OYZORfXWKTzr
 wb6AQsJ0oT+bb06jB/lbSKH3toNMSh6lLE9i/iwUH9EhpChit8OzVfm3mLdvt8NS5uTc
 Kut3Eg17vZN1HqTYWuU/jcsqEBLab88cNv949utEH/93HBDKnIuy8YaXEaWVtJkuulk1
 oiJQRjBqOoI/ONrwNibJ14w287r4s4Q9qt5mRVswdW96lAnDgyaZQp+N9fopNPk+zm7D
 BKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=kczfaJyChMu6EIoy646172ExIAqf1Ynz8kb/dN7rijo=;
 b=U5+Z5xA7b19ZLiX0u19TIeX1AUgHBHW8J18tJHQNwAZr6QJ06DZB/pf3sf4edY3D5d
 H//XK+gSoFazji2qrYmLQ+sIlgffqSmeG3YSD8XyAy4BmomXTbZzj4jlIKMQBTfVLRTN
 peAdkS2TXodGO/qSrI8gwunvNx4JmkPvN1sg5mQ7nXbGypfEcEcoLA7bPY9Tme8rD2+z
 aKJ/Uo+DJltrL7QwzP4Bn+rZCDSbtrKN4Xhla0bpjJM3Lchb9wBt75+YqsSUvROnIwcK
 0V5PfAn2AdN8GzaSnh56oY/Zc0M0qLANiqUsPc8ruYBhlGLYFpbIiGGdnmBl1azbB2Pz
 2sKg==
X-Gm-Message-State: AOAM533YhR7PEZ2escJPXHQysX4G9tkTJSQ1SxsRNFW1ur6hyuOOQ48p
 2pxgThvvyjL4wYKU9IWdJ3weESofD4GygA==
X-Google-Smtp-Source: ABdhPJxXVGSzGGubZKPQq0lhvSkqlKTR3lTemw3x6XIheobgq+81s/lFL5nqEG3FolUCRwuuJ2LeJg==
X-Received: by 2002:a17:902:7c16:: with SMTP id
 x22mr11272561pll.244.1590094189831; 
 Thu, 21 May 2020 13:49:49 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id p8sm4792825pgm.73.2020.05.21.13.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 13:49:49 -0700 (PDT)
Subject: [PATCH] RISC-V: gp_in_global needs register keyword
Date: Thu, 21 May 2020 13:49:14 -0700
Message-Id: <20200521204914.210447-1-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.27.0.rc0.183.gde8f92d652-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_134954_618373_C7614E1F 
X-CRM114-Status: GOOD (  10.68  )
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The Intel kernel build robot recently pointed out that I missed the
register keyword on this one when I refactored the code to remove local
register variables (which aren't supported by LLVM).  GCC's manual
indicates that global register variables must have the register keyword,
As far as I can tell lacking the register keyword causes GCC to ignore
the __asm__ and treat this as a regular variable, but I'm not sure how
that didn't show up as some sort of failure.

Fixes: 52e7c52d2ded ("RISC-V: Stop relying on GCC's register allocator's hueristics")
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 610c11e91606..824d117cf202 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -22,7 +22,7 @@
 #include <asm/switch_to.h>
 #include <asm/thread_info.h>
 
-unsigned long gp_in_global __asm__("gp");
+register unsigned long gp_in_global __asm__("gp");
 
 extern asmlinkage void ret_from_fork(void);
 extern asmlinkage void ret_from_kernel_thread(void);
-- 
2.27.0.rc0.183.gde8f92d652-goog


