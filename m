Return-Path: <SRS0=+z5f=CQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC3CC2BC11
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 05:58:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0FDD20838
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 05:58:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fHWbgi7Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZjbVCjEa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0FDD20838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5DxXbq4q8TzNgxoFB0PjePAwLbtwYo5M2A4TsXSwGeQ=; b=fHWbgi7ZX/Xb9lwAhS4xaLMko
	O0ggVyOVVZG0Doje977OS6+rh9SDFmGOvCLrDVIFgZ9Eq3JAUNhURrfA4vhQ4CVs4lBv4OVVfbLdv
	MyXViqUo8xPxi+0o4Ubl/gLZssoERmqy3kd13rLPhGFOZMT5XtcM/nx1eO2Dl67N+4IZV3/l6Bn8w
	87WrUoo/HVuqmW7q3zpEj+TmeQ2utOesyZUkfNJSn60kQUBt0iJUxoOkdsCju9Ax+1UjhamoOBQT8
	A+zWOiab5h3rAE0/Fz30hgU6Y/nDP69zTP4EGIMIzkmUTS43P6sVMBn+I2xuLb8m8U0dQbmcwCteU
	qDEPMqPLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFAAo-000419-29; Mon, 07 Sep 2020 05:58:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFAAm-000409-JB
 for linux-riscv@merlin.infradead.org; Mon, 07 Sep 2020 05:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=VnA1aUsu5TomLCD5ptE3Uk0kKV7NqTrbQlcFxHGi76E=; b=ZjbVCjEaaehMz9voBwAM76LeuG
 knxGbQzTYw4TQEgvxoZ3zLglBuKA5gZRxagXF4Y+wMtgZZvYyicNS5jnluNpZofHGY8aqFz4+mBeu
 8beWQhXoQzL0+rHhfvdOWElBkd9I3VboCtEexB6w+C5JiDC6HWSAhza9VO6XyaKeP1upaNVsWMMa/
 suecZHC8UpqM8qVW//H1YOIIsi9Wu46EphVtBJMQFxBZwRNKhagIrcpZTwWMcsPQpvCeQDaeoX3FB
 fdJWyGDozNbqKC8xayzUqngpBhTFwor9nI7CE9RWylrGRYnOq/iq30vrTjz9pazYQnDEzuQ28Lopw
 IyodhHQQ==;
Received: from [2001:4bb8:184:af1:e178:97b2:ac6b:4e16] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFAAl-00036e-E0; Mon, 07 Sep 2020 05:58:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 7/8] riscv: implement __get_kernel_nofault and
 __put_user_nofault
Date: Mon,  7 Sep 2020 07:58:24 +0200
Message-Id: <20200907055825.1917151-8-hch@lst.de>
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

Implement the non-faulting kernel access helpers directly instead of
abusing the uaccess routines under set_fs(KERNEL_DS).

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/uaccess.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index b67d1c616ec348..264e52fb62b143 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -486,6 +486,26 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
 	__ret;							\
 })
 
+#define HAVE_GET_KERNEL_NOFAULT
+
+#define __get_kernel_nofault(dst, src, type, err_label)			\
+do {									\
+	long __kr_err;							\
+									\
+	__get_user_nocheck(*((type *)(dst)), (type *)(src), __kr_err);	\
+	if (unlikely(__kr_err))						\
+		goto err_label;						\
+} while (0)
+
+#define __put_kernel_nofault(dst, src, type, err_label)			\
+do {									\
+	long __kr_err;							\
+									\
+	__put_user_nocheck(*((type *)(dst)), (type *)(src), __kr_err);	\
+	if (unlikely(__kr_err))						\
+		goto err_label;						\
+} while (0)
+
 #else /* CONFIG_MMU */
 #include <asm-generic/uaccess.h>
 #endif /* CONFIG_MMU */
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
