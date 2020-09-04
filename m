Return-Path: <SRS0=91Bs=CN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87991C43461
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 16:52:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48ACE206B7
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 16:52:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2ACeiEgn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Yj2sIEDi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48ACE206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FNnyZfS8f02bvCpyW2v5MoFBIhbGKERp5vCA3x7ns1M=; b=2ACeiEgnDj7hbGEn8iAwCLFUR
	X/9WtVepubweb2yEaZQiMiNiQNjqW1W8WQNZo6R/8tyQVUYfobhhFYloxVkajWnNtDC5sBcbu1Y6M
	xMIikGD99T0OlFQJxoSpmZ7HRbk2WikeEHRK9XGOfFfmrnXExJMr6kOTfMgmmJRqaGLyZcB6Zj+jx
	C43TxvswKAzXeaOIVFArywixunXKLP5AFvSBMZ4TJyE338oJt+K3ZqsWjqfDSCoU0OvjZKwTcs4fI
	nD02L541WJhwwloRzrXnc6n3T6qccS4eTXUVqIQPNzbielFpMGjZY/ew063mxSOgZkAbV/oS6771S
	3jXjL2okQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEEwu-0004L5-1v; Fri, 04 Sep 2020 16:52:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEEwr-0004Jn-O8
 for linux-riscv@merlin.infradead.org; Fri, 04 Sep 2020 16:52:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=b/bAysrgpK7o8RV7Nv82fuLZpX69oef20JEl760QaI0=; b=Yj2sIEDi9HwV9AsgH+AxKTKHN7
 W+kv//OVQBi7WV2UrM0IFMf6mP08zizSMg1p8bPnM2RAmAr2YVY9AdDRRZgZWfph8wxCwO41zP7IR
 5/MVBD50aqAS/ojCHnYZnyEgWyY841ZSthA/o2Z8veXrwvyNI4jRRzAxQwAc7zMJmY58nmMuwYFia
 oDwyMo6Hm1iyjfP5BQv3qzj7/dKad6eTc/RlZ2X0bQsslb8P7a7DYgSKkhp3NyG6/2FIUEO87Mt3k
 jju4moRdueiqdLGeuRovOvkEiK9p/U1t9S+yisC/Um/zJaN9nLwp9E9JizLxUjC8oKeVrfBquFQuc
 O7BAGcUQ==;
Received: from [2001:4bb8:184:af1:704:22b1:700d:1395] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEEwq-000134-Na; Fri, 04 Sep 2020 16:52:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 4/8] asm-generic: prepare uaccess.h for a set_fs-less world
Date: Fri,  4 Sep 2020 18:52:12 +0200
Message-Id: <20200904165216.1799796-5-hch@lst.de>
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

Put all the set_fs related code under CONFIG_SET_FS so that
asm-generic/uaccess.h can be used for set_fs-less builds.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/asm-generic/uaccess.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/asm-generic/uaccess.h b/include/asm-generic/uaccess.h
index 768502bbfb154e..a9e6da7cce25e2 100644
--- a/include/asm-generic/uaccess.h
+++ b/include/asm-generic/uaccess.h
@@ -83,6 +83,7 @@ raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 #define INLINE_COPY_TO_USER
 #endif /* CONFIG_UACCESS_MEMCPY */
 
+#ifdef CONFIG_SET_FS
 #define MAKE_MM_SEG(s)	((mm_segment_t) { (s) })
 
 #ifndef KERNEL_DS
@@ -105,6 +106,7 @@ static inline void set_fs(mm_segment_t fs)
 #ifndef uaccess_kernel
 #define uaccess_kernel() (get_fs().seg == KERNEL_DS.seg)
 #endif
+#endif /* CONFIG_SET_FS */
 
 #define access_ok(addr, size) __access_ok((unsigned long)(addr),(size))
 
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
