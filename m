Return-Path: <SRS0=zqna=AV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78541C433E2
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 13:57:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49E82207BB
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 13:57:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zmjdNLHq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FwiKwS4K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49E82207BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JpuKHmuGLUder3+VdKvppN3DL3rDZmfb54ttpM1myE0=; b=zmjdNLHqYqTY84yBRxslfg37R
	2AqvBl/FU8Wc+WIRDefmyAWBrygkyMSVGPEhUrV0QHImNVFmDx7EwDJZdehFQyae1tRDGQM+CJQ9E
	pFd7zf16LXIaaHO+iI5oVW+lRTqDGmuFlHY73juhfc+v8sv5AfN+moLX0reZarEFcUYO8t6B/kDCi
	nQDuJ3Bgj98TcgDiziXc6Pc5+HgLs1jsKU3Lqoy5lO/0zPiBdZZjBQmhbTPLFZnKz4/XdV6CF+3hQ
	WDuP+NHxZSegvWH+NPDr/VHQu4CTVNX0Fl0DRqbYAsawyZ5LVT95w75fj7fuHAQlULXTR1n+CuTEM
	PtOe+uu2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jttWa-00040j-75; Fri, 10 Jul 2020 13:57:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jttWY-00040B-UI
 for linux-riscv@merlin.infradead.org; Fri, 10 Jul 2020 13:57:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=wVXOB0bwTse/Sz4zv+YiEUb+RJzy2LQixEil7fBzx3k=; b=FwiKwS4KtMrB3DtxFidvXGvg0I
 r21BX3mpVgWXJKfxFomXL6ipq2kN7zleUIZLHIAbMnMpLdQtb/DSzVlrlmPGjkDSwQYb/Ilbvhs/2
 WziOZM487LBn6WlXuxadZhfCkIqsQNlqGNj7vbNwzJUph3scHCDLYUbjGg4Uv08dLpkQWrzop/Pwk
 wbZahGTPC78QyBsCk0xmnF74kxhkVEMKVN6MX34XcylMWuz0HlrCWPJjzzX12YFH9pgOnzty9K42A
 1yG3wZji4FLx4YXEHKmUfdEJY5VvA6Lvoyj5W+B3LlgBQiop3s3LgBEMAibpXcCDxk66G2yZLOfm5
 /DeL8dzQ==;
Received: from [2001:4bb8:188:5f50:c70:4a89:bc61:2] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jttWX-0004gf-LT; Fri, 10 Jul 2020 13:57:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 2/6] nds32: use uaccess_kernel in show_regs
Date: Fri, 10 Jul 2020 15:57:02 +0200
Message-Id: <20200710135706.537715-3-hch@lst.de>
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
 arch/nds32/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/nds32/kernel/process.c b/arch/nds32/kernel/process.c
index 9712fd474f2ca3..f06265949ec28b 100644
--- a/arch/nds32/kernel/process.c
+++ b/arch/nds32/kernel/process.c
@@ -121,7 +121,7 @@ void show_regs(struct pt_regs *regs)
 		regs->uregs[3], regs->uregs[2], regs->uregs[1], regs->uregs[0]);
 	pr_info("  IRQs o%s  Segment %s\n",
 		interrupts_enabled(regs) ? "n" : "ff",
-		segment_eq(get_fs(), KERNEL_DS)? "kernel" : "user");
+		uaccess_kernel() ? "kernel" : "user");
 }
 
 EXPORT_SYMBOL(show_regs);
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
