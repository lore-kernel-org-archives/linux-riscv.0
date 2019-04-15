Return-Path: <SRS0=fYgv=SR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B61C10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 09:15:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B43E720656
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 09:15:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WlJgniLa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B43E720656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GvevUyOn+3GfEVzAI1mheJZXe84O9KiJov4bpYE3T14=; b=WlJgniLaMP/kpM
	9RW7dx2b0c/NTrxMiLP7yhw0uOxyH0timd+TFWMV90n71JVJlRDIyeeXDmf5Ng/W+T230acugHbJR
	cLilnnJW8kz8yoI9qRbs4+Jfy7ULoSBK9v9JYtXVzrPrzRq3zahi9iyyM5XsdoS1dxdYc2GCSDf89
	PGYsmIoT4XDFaZf46O2z7ojl5bnSE1RFX0oRJFBj+J4h/xV/fWkjHKSiBIBYKuHfiYRAOZwu4ZfVO
	wF9bO8h4xel982131d6dDYxnO9hNlk8ViuH+0TkGimo6+WxqF2BMrIpRvSMnwKFCbqzLIk6JvgxgK
	1B2ZmGdI4UcD8ESEEtIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFxhu-0006Rl-VJ; Mon, 15 Apr 2019 09:15:18 +0000
Received: from 213-225-15-255.nat.highway.a1.net ([213.225.15.255]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFxhs-0006OM-54; Mon, 15 Apr 2019 09:15:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 03/11] riscv: remove unreachable big endian code
Date: Mon, 15 Apr 2019 11:14:34 +0200
Message-Id: <20190415091442.19945-4-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190415091442.19945-1-hch@lst.de>
References: <20190415091442.19945-1-hch@lst.de>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

RISC-V is always little endian.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/elf.h     | 6 ------
 arch/riscv/include/asm/uaccess.h | 9 +--------
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index 697fc23b0d5a..ce0cd7d77eb0 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -27,13 +27,7 @@
 #define ELF_CLASS	ELFCLASS32
 #endif
 
-#if defined(__LITTLE_ENDIAN)
 #define ELF_DATA	ELFDATA2LSB
-#elif defined(__BIG_ENDIAN)
-#define ELF_DATA	ELFDATA2MSB
-#else
-#error "Unknown endianness"
-#endif
 
 /*
  * This is used to ensure we don't load something for the wrong architecture.
diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index c51fc8bfbdde..b26f407be5c8 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -101,15 +101,8 @@ static inline int __access_ok(unsigned long addr, unsigned long size)
  * on our cache or tlb entries.
  */
 
-#if defined(__LITTLE_ENDIAN)
-#define __MSW	1
 #define __LSW	0
-#elif defined(__BIG_ENDIAN)
-#define __MSW	0
-#define	__LSW	1
-#else
-#error "Unknown endianness"
-#endif
+#define __MSW	1
 
 /*
  * The "__xxx" versions of the user access functions do not verify the address
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
