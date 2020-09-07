Return-Path: <SRS0=+z5f=CQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E8EC43461
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 05:58:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07A3320838
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 05:58:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oVXw8i92";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="H1WOIIj2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07A3320838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+eMF4BPh1sjBz8FlLgBLK4DfycyIg2xdZk++FQVWSJ0=; b=oVXw8i920t6G/lCfzViY0gYSZ
	juX99rWB5F2HgxJ32OtOBotyjuX2XL17rIqW6yzLTcUOpn9t7GWidPEvLcyZ5lQjFQXvOZIhEJBJQ
	soPJXK9JQawBloOrfAryyJ3QXAe+QConGwYCO4SsIqVF+FupIp1jAa7RRvb0On2F18CjZCCkD0Okj
	kxHsESSiU76/3AotBKEz0kDd5emVzbC6vcX0FlhZ47v/X0ZiA3v++nvCMkmIRFOWIl8xWImW31Pl+
	7XESrwpKu3ZBvunFay6TpTaPa3DGfBkGCdXzltIrbiGklo7v1L7c9iZxqIIh6gQCOP4/cObei4JUT
	dtY4Gb/ow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFAAj-0003z0-UE; Mon, 07 Sep 2020 05:58:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFAAi-0003yW-S0
 for linux-riscv@merlin.infradead.org; Mon, 07 Sep 2020 05:58:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=IcaHid71cII3JdZGf+Xd0IQ2uM2gsv/9AEgKNzHRyEw=; b=H1WOIIj271ZAtDnyuua8dwkXWg
 r2WkVVPq/yxVp8BCHZsKDgRq3+7Ex0eLXSijUJaJ2foO3ocMZnFwB5yB6dEr4N5GFoiE/X1qU6HLc
 J7dpaq+AEMp0QyPTPYxMYdb9iEdc6fE9plyD1+5iIGXzqCdgl1QpvU2Uw+W1isRVx7z4VmHewvxjn
 pTLvoAuFkNBMCmmAlswtxEgNhN+MMmKWbU1MP60fKsPZklY1UWSTnK+kLOaePsix4bk3LqhfuB6Xb
 I3vUqiWKPRYc089LL8DSVYvlKBdGv4ACOiw0hxNNhnv2UjAzbtwKqXWss+QML83ATJRrHZpd8osWP
 mEoVmu7Q==;
Received: from [2001:4bb8:184:af1:e178:97b2:ac6b:4e16] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFAAh-00035O-Mf; Mon, 07 Sep 2020 05:58:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 4/8] asm-generic: make the set_fs implementation optional
Date: Mon,  7 Sep 2020 07:58:21 +0200
Message-Id: <20200907055825.1917151-5-hch@lst.de>
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

Put all the set_fs related code under CONFIG_SET_FS so that
asm-generic/uaccess.h can be used for set_fs-less builds.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/asm-generic/uaccess.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/asm-generic/uaccess.h b/include/asm-generic/uaccess.h
index b367f339be1a90..45f9872fd74759 100644
--- a/include/asm-generic/uaccess.h
+++ b/include/asm-generic/uaccess.h
@@ -94,6 +94,7 @@ raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 #define INLINE_COPY_TO_USER
 #endif /* CONFIG_UACCESS_MEMCPY */
 
+#ifdef CONFIG_SET_FS
 #define MAKE_MM_SEG(s)	((mm_segment_t) { (s) })
 
 #ifndef KERNEL_DS
@@ -116,6 +117,7 @@ static inline void set_fs(mm_segment_t fs)
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
