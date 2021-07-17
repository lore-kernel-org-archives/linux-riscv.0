Return-Path: <SRS0=adiZ=MJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0BB3C636CA
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jul 2021 16:16:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F1F961159
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jul 2021 16:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F1F961159
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.com.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lfUky03VQpuJLLuFJBxeK92LdsGO0qjZ7Oo0qQapqHY=; b=1xAVo4SvEAGBgE
	cGNXzMYHcP4EA72+BIlgUFZFNRfrosePz+NaJxtS91lNkYJVIqhmN4bOmRDHGPD80eFRQorb4vU2u
	heKZo3wHQWtIwBa/bnthwuTu0iDHgdW0alSQxvPG2TkjJm00ml0yyjuhf1RuvvwgRt6RlqLqoy/rr
	SBrcqE12pg7P8Ne+d8eOKgKYEwOVxssrlPucuD3kjUIYqZFiDhcEmiOqmoKtgCy2UNXWVc0bx0oCG
	9lgQueZBok/jMSzOC5yzoNdZWJndmo1kWXg284rwqZRRJJe2E6Ecx2sgwLRVm54gE3ePiZyy0/I5E
	YOos95EhN8wOZzsSqQ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4myf-006oLL-GW; Sat, 17 Jul 2021 16:15:45 +0000
Received: from smtpbg565.qq.com ([183.3.255.186] helo=qq.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4mya-006oKu-Vn
 for linux-riscv@lists.infradead.org; Sat, 17 Jul 2021 16:15:43 +0000
X-QQ-mid: bizesmtp51t1626538526tmz7xo6c
Received: from localhost.localdomain (unknown [111.18.245.156])
 by esmtp6.qq.com (ESMTP) with 
 id ; Sun, 18 Jul 2021 00:15:25 +0800 (CST)
X-QQ-SSF: 01400000002000B0H000B00A0000000
X-QQ-FEAT: gXZG3PbKWBuDtiHkJA8TTKHOzLIxYtVLRmI0m8wr3Iu7Azs5ZKqFB8nYxBN9v
 8+rMM+zz9inp1Zrikrrz9pHi3lt6uaNySWwk/+VUSiYavCTM8dffhMLWTvULuWfOxqSnyX6
 TBpxXuYEP1HM+oiTrE9zgswpYesr7V7BR07mvYIw3jfn9QIPg6sF697QHqdijghfTFlZSyo
 RsaLJp9RuVTqyg+0EamVzrEkKtiFmKPOsj4X+OhEygUA747+N2tLVP3Jpv1RkZv+DIYkjZS
 V3JkFUznH0Lr/zzsa4OgwDOmpvg86oXnxn3U7+u9WjFMG7
X-QQ-GoodBg: 2
From: Qiu Wenbo <qiuwenbo@kylinos.com.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: __asm_copy_to-from_user: fix out of boundary memory
 copy
Date: Sun, 18 Jul 2021 00:12:13 +0800
Message-Id: <20210717161213.91892-1-qiuwenbo@kylinos.com.cn>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:kylinos.com.cn:qybgweb:qybgweb13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_091541_430921_90CEFCA1 
X-CRM114-Status: UNSURE (   7.58  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The __asm_copy_to-from_user function will copy extra bytes beyond the
boundary when two conditions hold:

1. (src - dst) & (SZREG-1) == 0
2. 8*SZREG <= size < -src & (SZREG-1) + 8*SZREG

The first condition makes the function enter the unrolled word copy code
path. And the second condition makes the function believe that there is
enough bytes to do one iteration of 8*SZREG byte copy. That is not true
since the available bytes is reduced by -src & (SZREG-1) byte to make
both src and dst aligned to SZREG.

This behavior causes serious issue with exec system call both on RV64
and RV32. The passed-in command line parameters might be changed
silently since they are copied to the new process's stack continuously.

Fixes: ca6eaaa210de ("riscv: __asm_copy_to-from_user: Optimize unaligned memory access and pipeline stall")
Signed-off-by: Qiu Wenbo <qiuwenbo@kylinos.com.cn>
---
 arch/riscv/lib/uaccess.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index bceb0629e440..7ab7cb96dcd9 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -36,6 +36,9 @@ ENTRY(__asm_copy_from_user)
 	 * Use byte copy only if too small.
 	 */
 	li	a3, 8*SZREG /* size must be larger than size in word_copy */
+	neg	t1, a0
+	andi	t1, t1, SZREG-1
+	add	a3, a3, t1
 	bltu	a2, a3, .Lbyte_copy_tail
 
 	/*
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
