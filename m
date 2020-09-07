Return-Path: <SRS0=+z5f=CQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72287C433E2
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 05:58:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7A8820838
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 05:58:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OKMGr6ir";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hEYF4PSl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7A8820838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WVLcNnpr5Buf/jr2AvOuXy+f8omBjJ341qYLGAaYHts=; b=OKMGr6irQFe7MxSqYYo1BMpjR
	6t8bcXAfwQkTXvuz0L836G5GZbVQ0o3MgypJgLzYSo+x1rs04PFiDZEWRVttJsNs1LQx0257bxVp3
	hHfsPvBIOEdPAQp5rKrkdbCRChFVMcBZq7T/got+GUt0xX3Q0H/DSvsQLJszgJIZgS4bCmn3nTyTQ
	nkf/pJvoUGJLjzy3VkHF85wnpvpD1RpkpouAFLEJjEUg7XFfbs1FarhlTkZpSe0OTSoaW5QIde3qX
	LNYIX9cGqxDNl/4YBLAD7AuBdZRz2cLMK0XPNi2YZY6bQfDcTsP1xlTCSUuF4mXdpjxzP/jEyjG/T
	ZuTAxEHOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFAAj-0003yl-FS; Mon, 07 Sep 2020 05:58:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFAAh-0003xj-Ib
 for linux-riscv@merlin.infradead.org; Mon, 07 Sep 2020 05:58:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=LZG506isFI0SSgZ6Zw+vMgWmYh0hewhmkGW4YKK3Ono=; b=hEYF4PSl9zeran7ag2rqjrqpS+
 F5YHwGNHRtUS/Z2Jy9aT/DAniqZ1qGd8gaILOKip2LnfpJ6kCpY+MIDo0A15yM5WxzPKOVdDJL34G
 oE8EBQwCz4G+IKkBMhP4/mRP4MXhf2D2smtrEYKj08iYpqhmQlRGMZV9pXsr1Yl+Ng649ggawxTBp
 +HA2Nd09IHgmGMDBpn5zLsUDLH6GTwUQ9wB2LKQUI7TK7bYmgAADrm7kitmH7hb53jBlhFYnQGya7
 dsKZQzhaFoxG6l9zVTDaNFfsu68KbENJX/9W82Z5FihOVKoQ83g0PrrgdmHTgoaktJZ8LAjuUv4e6
 ffZQ6t1A==;
Received: from [2001:4bb8:184:af1:e178:97b2:ac6b:4e16] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFAAg-00035H-HT; Mon, 07 Sep 2020 05:58:30 +0000
From: Christoph Hellwig <hch@lst.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 3/8] asm-generic: add nommu implementations of __{get,
 put}_kernel_nofault
Date: Mon,  7 Sep 2020 07:58:20 +0200
Message-Id: <20200907055825.1917151-4-hch@lst.de>
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

Add native implementations of __{get,put}_kernel_nofault using
{get,put}_unaligned, just like the {get,put}_user implementations.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/asm-generic/uaccess.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/asm-generic/uaccess.h b/include/asm-generic/uaccess.h
index 6de5f524e9e631..b367f339be1a90 100644
--- a/include/asm-generic/uaccess.h
+++ b/include/asm-generic/uaccess.h
@@ -61,6 +61,22 @@ static inline int __put_user_fn(size_t size, void __user *to, void *from)
 }
 #define __put_user_fn(sz, u, k)	__put_user_fn(sz, u, k)
 
+#define __get_kernel_nofault(dst, src, type, err_label)			\
+do {									\
+	*((type *)dst) = get_unaligned((type *)(src));			\
+	if (0) /* make sure the label looks used to the compiler */	\
+		goto err_label;						\
+} while (0)
+
+#define __put_kernel_nofault(dst, src, type, err_label)			\
+do {									\
+	put_unaligned(*((type *)src), (type *)(dst));			\
+	if (0) /* make sure the label looks used to the compiler */	\
+		goto err_label;						\
+} while (0)
+
+#define HAVE_GET_KERNEL_NOFAULT 1
+
 static inline __must_check unsigned long
 raw_copy_from_user(void *to, const void __user * from, unsigned long n)
 {
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
