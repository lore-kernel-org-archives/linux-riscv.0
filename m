Return-Path: <SRS0=zqna=AV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B501BC433E4
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 13:57:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7884F207D0
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 13:57:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kPi1RYGI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TLw7FcKO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7884F207D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fzYODvmuGm2vU4nGDH2Jpdv0dVHNGyWDE/dB5A1gZLo=; b=kPi1RYGILuOvozutDGWMqBSgG
	/nMg/bGYQx+UMZAw3l0pDvHZqqyu/Fm11HKPRLGpZv5/p5xJVHV+OHxWp6QxMEsXBQ6wZEHw0vpjm
	+vVurlIHoIfwWagAkqUVOoziacR4Btu4wuCttioKvDow47/9NF8Ad8SOtREPleOEewX9RuKYU3sFe
	Wc5c0RA07ljjV3/qN93TqGHnQGX/LPNzCgOhz01mTeleIy/vqAvOOCYlTaa0kPxGtUE5gD4ivT2dI
	77XcPDZ4s71bD3LVAMqaHvPekpNQ2WHWcmRtjTWGELxcfAybHq9yWQB0XuDJApDj+Rtt1qr+Z9wWa
	5Yfd5ZNQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jttWZ-00040T-Rf; Fri, 10 Jul 2020 13:57:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jttWX-0003zy-Oj
 for linux-riscv@merlin.infradead.org; Fri, 10 Jul 2020 13:57:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=8kIpdB7MOVPeE6Mtm6qS57nGC+Nbr8eHQGmiVAURoO0=; b=TLw7FcKOx/J3rJJLHO1uwPsxbU
 qCr32vMX3YIHMLwj8rYB/m1Gr5BAGjsVbdVF0guFsdtHfoOOzRIN66UZEKN2aLGdXm+xW/Abx/qt/
 02CU7VJ4COqrSPT7WbNAhbEEshaYNNMsX0ooRRVoQLhamuZzb3t1Z3/MqFq7mBEqcs176+aRo8Xc+
 UyyKU0TEmW1qfFRWR9msKPCHgVrFapZar9l/au56KaAT4I8YZEw94sZ2KmJfUOwlbmy8JUUJjOCqk
 q/yd9g6uGQljMMl9jMKackS9xAAS8OsfRAQ/8YTsES3sjxnZTjjyryLAn25I/DELDwHNP3SoieCH4
 xiIckrAw==;
Received: from [2001:4bb8:188:5f50:c70:4a89:bc61:2] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jttWW-0004gU-FH; Fri, 10 Jul 2020 13:57:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 1/6] syscalls: use uaccess_kernel in addr_limit_user_check
Date: Fri, 10 Jul 2020 15:57:01 +0200
Message-Id: <20200710135706.537715-2-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200710135706.537715-1-hch@lst.de>
References: <20200710135706.537715-1-hch@lst.de>
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

Use the uaccess_kernel helper instead of duplicating it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/syscalls.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index b951a87da9877c..e933a43d4a69ac 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -263,7 +263,7 @@ static inline void addr_limit_user_check(void)
 		return;
 #endif
 
-	if (CHECK_DATA_CORRUPTION(!segment_eq(get_fs(), USER_DS),
+	if (CHECK_DATA_CORRUPTION(uaccess_kernel(),
 				  "Invalid address limit on user-mode return"))
 		force_sig(SIGKILL);
 
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
