Return-Path: <SRS0=91Bs=CN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B0AC433E2
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 16:52:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B05E206B7
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 16:52:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yf+VV1a6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tHDAxXNy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B05E206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gpscVIAmvwxs7DBKg2UPF0PZGaY3fJqUOGCUTYwOebE=; b=Yf+VV1a6sMAjejfeZbmXRl/cF
	8OAo2NN8P3+kqoHvkkldWrOh5RwOlsMEfH6uRHg3t37vlNdIZ7cSCiunFhXbv4nYuGvdideVSdalt
	9dhREKuh4fIIOusQObIlN/qEg1sk86+XQbDCKdmiitet7x4lH5cgH64ZTreujfvINp9+BfenMHi0Z
	HLknjRDPQWZtqn4ap5+uSTQrRhEfMtOQ/DofqrnFkzfPjrhLP/RYq7XPL9zb2HyhGvl8MC3zoRriq
	QCelMXoJL62UnLMK03uAawAeXEJyLCyiU35gfmzPHXVTAFghAbTAjdY8xvQXCdzQqcnHtrN82tn/q
	3a9CAF+5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEEwq-0004JU-2B; Fri, 04 Sep 2020 16:52:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEEwp-0004Iz-8S
 for linux-riscv@merlin.infradead.org; Fri, 04 Sep 2020 16:52:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=RIXQEf9L32x2nCRSAR4fbxYw+icKSSPU8Vsh6D6+7r0=; b=tHDAxXNyEdd4teq8ZPKEKOmBnA
 YYJUIq9g4EGFNIpCZzHsd1Zm/wB4Kt2HspSmDncVN55P2cJX2Es91avyXMQB5v++xIX9xcpWnive4
 2k0Gq1zM3ROSL+iVl3jHpOjKaZDVkhTnzDojQeKtTd41/RbDOd4cTI3ds1OzH/wJQ4zzMRnuOFSbT
 W0XivN61DeVjt5tiUx7FWPj3cCk8bbNIy3y+Xzn3GoHrHKh4YPghyJ2MBd7PkOzYk6oyeLpR3Db0d
 mqw91PoEU5QwiZnY0EIW1ubw5qviT7oiFDS6VffbPaKzfY1XWXqSdQBSJMR0b2njIF1endMcxHU5B
 RHdws6TQ==;
Received: from [2001:4bb8:184:af1:704:22b1:700d:1395] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEEwo-00012l-6Z; Fri, 04 Sep 2020 16:52:22 +0000
From: Christoph Hellwig <hch@lst.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 2/8] uaccess: provide a generic TASK_SIZE_MAX definition
Date: Fri,  4 Sep 2020 18:52:10 +0200
Message-Id: <20200904165216.1799796-3-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904165216.1799796-1-hch@lst.de>
References: <20200904165216.1799796-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Define TASK_SIZE_MAX as TASK_SIZE if not otherwise defined.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/uaccess.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 70073c802b48ed..d0e43761c708d8 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -31,6 +31,10 @@ typedef struct {
 	/* empty dummy */
 } mm_segment_t;
 
+#ifndef TASK_SIZE_MAX
+#define TASK_SIZE_MAX			TASK_SIZE
+#endif
+
 #define uaccess_kernel()		(false)
 #define user_addr_max()			(TASK_SIZE_MAX)
 
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
