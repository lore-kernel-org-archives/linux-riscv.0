Return-Path: <SRS0=+z5f=CQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61229C433E2
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 05:58:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DBE120838
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 05:58:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xp9ZRksd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="R30FrVFA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DBE120838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gpscVIAmvwxs7DBKg2UPF0PZGaY3fJqUOGCUTYwOebE=; b=xp9ZRksdqw6dSehz0p4bkr72J
	3bF0pOH7ta3JM2GWzjPnYQSSx8DTTbUQmUuWyg2UO2M31OK/I+I06OA4lAeH93UfucgUxT+rZ31g6
	f6sviZrerJ81b0GoiPCnHT+X/t0EGGjYQxHzAjRXPJxk8QBHgt2uSt4paBtpKDZZfFQ/4EE6+yx2v
	oWbd5XC8OwTIE0i3u3dxfl9cHzgbm258qKclJQMTbO+FF/m200dRUQNrOn7B+KMeCxKl7f8S188Fo
	Xib4npGZoiLj03Xgs5/aRQnzvUGdotiaB83igEFtx1FbKmJIViLdQzdpy9bvU3ggUp/LaBd/K2nt1
	DMoSG0pKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFAAh-0003xp-B4; Mon, 07 Sep 2020 05:58:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFAAf-0003xM-8U
 for linux-riscv@merlin.infradead.org; Mon, 07 Sep 2020 05:58:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=RIXQEf9L32x2nCRSAR4fbxYw+icKSSPU8Vsh6D6+7r0=; b=R30FrVFADjC0p5xwxfRVo7qWUc
 A6fGogfRR1wSmWR8BWODbMpvolShmup7QRuYeheM/53AjXSfeVkelsss28CshU3tYcaueE/X21iBc
 LA+l+fzgY3ekJqqRd8lwP2rPma62noqvJWnzsjA4HNwbDM2IJmkCjuMuqAy7BYfxAAoJP7EGt4V1u
 Y7S0Tga/jW7kgxEGPrGCqkIapN1mEnNn025KP1hOR1gnErfrRfBYkXDXgse9Z5JV1A/MZtFe0TBMz
 Xw1dLV0uDQAZb9g41DpupXmJsfTQYRRNODKXN7prVkJ3TBW4BV4MmSUjjn53ReJWfK6lNAVCLtaJl
 AVZVnHqg==;
Received: from [2001:4bb8:184:af1:e178:97b2:ac6b:4e16] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFAAe-00034c-3z; Mon, 07 Sep 2020 05:58:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 1/8] uaccess: provide a generic TASK_SIZE_MAX definition
Date: Mon,  7 Sep 2020 07:58:18 +0200
Message-Id: <20200907055825.1917151-2-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907055825.1917151-1-hch@lst.de>
References: <20200907055825.1917151-1-hch@lst.de>
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
