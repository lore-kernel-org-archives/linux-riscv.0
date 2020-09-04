Return-Path: <SRS0=91Bs=CN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F8DC2BB84
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 16:52:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 231D120796
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 16:52:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X1kA12wh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oVIW9Keo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 231D120796
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HAeshaibCDUL8692FqP8+oat81BjMOwNm7usgA2mFQ4=; b=X1kA12whmX6Zwlrz4x/802jsV
	MIWvqD6Brrk44quLrkhYkA9yf0IA7AaO64fNLW0SRFXuFOKSJjirUOF4YY+ncgwfNbOQufQHNYJF1
	zyV2Uij8lSHP5F9ZWQaSO4iV2WBWSY4NkN3Jiszxrgh9XubO0c4Rq5whFKrAZkPq+xw2QRT0JZ7yp
	d9gXwJaMclurB/vRjdlrKFz7Ylq1PNtsT1WitLzu1Z2YdP8xxc4NE6SMx37vpUWo/B4ZalYh/wb9C
	nRYZT7Dii62+CnKK8Nd+Oyn3y6GaXZchRIaTjuoc0cOs/sviJQ+iadWahC26KdRVTGqUokW9sPZcb
	N9BoYku7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEEws-0004KF-O9; Fri, 04 Sep 2020 16:52:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEEwq-0004Jb-Mg
 for linux-riscv@merlin.infradead.org; Fri, 04 Sep 2020 16:52:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=ttKAZXFTdZgjTFfSwyEULSe/BTBQjBlyN7XpL7zPz6k=; b=oVIW9KeoYnK3snaQmqigyM9bk1
 VNtmyrLS05ICP3ujzNGFEK2UL7gcWGiYvYSel8+mT7ktm/BFy258Yqt/x5lfToZRnT3DF+BwUSYyv
 90F1nd6QtB6oqxn4/p8A9KLc9eB/JWY0Srn3so/OeRDYteTlnh2yRasDd2cZ/IIhCrEd6bEFhhPT0
 FzHZcxYjcdIqBdQAx+l2SJRzCMnUnGdls/Chne20VcQlK4wxSwVWimCpoVcYeHy5U3aqMzLf4AmN0
 i+uOIITCXwo7wmafRLyn/tVfo5jJmIBUgcGbBY/xzsRG4nkGHdc0tuN4/AllOvSR6b7j94EAyOjfO
 XjupkZ9A==;
Received: from [2001:4bb8:184:af1:704:22b1:700d:1395] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEEwp-00012v-BA; Fri, 04 Sep 2020 16:52:23 +0000
From: Christoph Hellwig <hch@lst.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 3/8] asm-generic: fix unaligned access hamdling in
 raw_copy_{from, to}_user
Date: Fri,  4 Sep 2020 18:52:11 +0200
Message-Id: <20200904165216.1799796-4-hch@lst.de>
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

Use get_unaligned and put_unaligned for the small constant size cases
in the generic uaccess routines.  This ensures they can be used for
architectures that do not support unaligned loads and stores, while
being a no-op for those that do.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/asm-generic/uaccess.h | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/include/asm-generic/uaccess.h b/include/asm-generic/uaccess.h
index cc3b2c8b68fab4..768502bbfb154e 100644
--- a/include/asm-generic/uaccess.h
+++ b/include/asm-generic/uaccess.h
@@ -36,19 +36,17 @@ raw_copy_from_user(void *to, const void __user * from, unsigned long n)
 	if (__builtin_constant_p(n)) {
 		switch(n) {
 		case 1:
-			*(u8 *)to = *(u8 __force *)from;
+			*(u8 *)to = get_unaligned((u8 __force *)from);
 			return 0;
 		case 2:
-			*(u16 *)to = *(u16 __force *)from;
+			*(u16 *)to = get_unaligned((u16 __force *)from);
 			return 0;
 		case 4:
-			*(u32 *)to = *(u32 __force *)from;
+			*(u32 *)to = get_unaligned((u32 __force *)from);
 			return 0;
-#ifdef CONFIG_64BIT
 		case 8:
-			*(u64 *)to = *(u64 __force *)from;
+			*(u64 *)to = get_unaligned((u64 __force *)from);
 			return 0;
-#endif
 		}
 	}
 
@@ -62,19 +60,17 @@ raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 	if (__builtin_constant_p(n)) {
 		switch(n) {
 		case 1:
-			*(u8 __force *)to = *(u8 *)from;
+			put_unaligned(*(u8 *)from, (u8 __force *)to);
 			return 0;
 		case 2:
-			*(u16 __force *)to = *(u16 *)from;
+			put_unaligned(*(u16 *)from, (u16 __force *)to);
 			return 0;
 		case 4:
-			*(u32 __force *)to = *(u32 *)from;
+			put_unaligned(*(u32 *)from, (u32 __force *)to);
 			return 0;
-#ifdef CONFIG_64BIT
 		case 8:
-			*(u64 __force *)to = *(u64 *)from;
+			put_unaligned(*(u64 *)from, (u64 __force *)to);
 			return 0;
-#endif
 		default:
 			break;
 		}
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
