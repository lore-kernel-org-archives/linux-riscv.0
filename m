Return-Path: <SRS0=91Bs=CN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47908C43461
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 16:52:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D64A206B7
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 16:52:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HLszGPPy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hbn1/jps"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D64A206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JTkAqOgmVrM6j2Z4yOl//lPBRYh8UJjUj8B34Uuudjw=; b=HLszGPPyamtLwI9p4Hd4j5VxW
	UJ+760Th4SaqaoniQ3S4HiHOi4Cl7WXLSRqBe61bA+t9psdel//maCavnEqAd3o+M+ocvdqMI0U2e
	4GQ1oguy+0ucGJdiHcSdFoeKWjZs/oIxqYr9q+GYl+b6mc4mFmxmwl8YJyS0KnUKwkVB8mQdL6Zn3
	g6fO4TgSIp4zLnUMUjwMjYX7Dt14n7S4BIPwTBakQ8FZMGuY2nh74VVEX09rFoHGm8aGiPxiHiMfZ
	xtWP4RXNLv7SGiH8NieH0TXpXTzjoHysAhGOf4PpYzKzJQOyK60oAYX4Ag/o2eHrt8cN9eppql6Bz
	RPwlIVIVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEEwp-0004JB-CL; Fri, 04 Sep 2020 16:52:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEEwo-0004Is-3p
 for linux-riscv@merlin.infradead.org; Fri, 04 Sep 2020 16:52:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=MkSVtcwaZuMrc9OzI8eVvOG/Cdl/4QZOV215qZC/7jE=; b=hbn1/jpsA3yTfNkNCn8x40H4wn
 8GMkx35SdpSHWCWGmQKnvmoEzVV6IYm7D9vOKw5mwVdoCNsk0QO9VlNbWD7Kw8EBa05GzrYUMnkQp
 YpaoZOmuc/VK6vRbaBkRlZyFkCM1JIlGBIqkGLoKqyQaTRkqjkcirWhj4glZltC1xFPijF7QuD17+
 LQ+0cKgf4Syn/SzNwk1XRUpJyvFSTWCo4GNudNQN168jaPspKm+SMdsT59xydtvhydNNl2MQQj/oE
 mXjs46r3MnbpMkEM2wIxIT0iABaCUF3cX0wOiAMorxQq3aJFHW64CfcfEhGutpoPsWsOcmL3+jJx3
 RfXkGJ4Q==;
Received: from [2001:4bb8:184:af1:704:22b1:700d:1395] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEEwm-00012c-D9; Fri, 04 Sep 2020 16:52:21 +0000
From: Christoph Hellwig <hch@lst.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 1/8] maccess: add a generic __{get,
 put}_kernel_nofault for nommu
Date: Fri,  4 Sep 2020 18:52:09 +0200
Message-Id: <20200904165216.1799796-2-hch@lst.de>
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

Nommu architectures do not have page tables and thus no page faults.
Implement the maccess helpers using get_unaligned and put_unaligned and
enable them unconditionally for !CONFIG_MMU.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/asm-generic/uaccess.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/asm-generic/uaccess.h b/include/asm-generic/uaccess.h
index ba68ee4dabfaa7..cc3b2c8b68fab4 100644
--- a/include/asm-generic/uaccess.h
+++ b/include/asm-generic/uaccess.h
@@ -9,6 +9,26 @@
  */
 #include <linux/string.h>
 
+#ifndef CONFIG_MMU
+#include <asm/unaligned.h>
+
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
+#endif /* !CONFIG_MMU */
+
 #ifdef CONFIG_UACCESS_MEMCPY
 static inline __must_check unsigned long
 raw_copy_from_user(void *to, const void __user * from, unsigned long n)
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
