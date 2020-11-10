Return-Path: <SRS0=iBsL=EQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D835CC388F7
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2020 03:56:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D8BE2063A
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2020 03:56:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mJRTBOYg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="bulcRriK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D8BE2063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PUXDs6P+1lBFKbrIclCTc3Oll8sw67O9R8ShfXy1/Ks=; b=mJRTBOYgKfH0lauQPd9geQiAd
	kYRkHWwmERF3seikL6E2BSaJM+vNKzeElWzCdCvvp4biuUXylLVJg8c49J7b8H1CGXhGRWRxR5gzZ
	9z/V/Kdv2a6gUqXf89MFcU2viUx1jH8jWi2z61r3LEuoEbUyuG6nXJTYf+tqpm+4ipnySQK6goxqi
	FGK8Y4QiyaPlIqfb+HDVsAK+2gEmNJy1/cYlWHFBzaki8l9EpVQEFdm56xj5cQv2K5zVAkUTLjZ1U
	UNrUSR0eehN94V2xmdpjvFEBX9OWN+z6SdtrhmI1JG+8q+y40aBiuS591qj0hp1blyvk+SONMnmQp
	87XLfotVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcKlX-0002zS-9t; Tue, 10 Nov 2020 03:56:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcKko-0002bX-HQ
 for linux-riscv@lists.infradead.org; Tue, 10 Nov 2020 03:55:36 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CB0E6208FE;
 Tue, 10 Nov 2020 03:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604980533;
 bh=6Zp+YV6Z2BWDD9deiTge0AlKV+A0u0z1bSS6kiV9ATg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bulcRriKLPTx4JXDrNiwQkvc2olFTsok4NHbYvM+wrdOn7mCRgJc5rDzBTfE0quHN
 dQKZ5NgMYNE+qcyOHRAjlrGJkge92oLyiFA8VdPv4tcnnNgBr2uXx+yrB1xT1V77NC
 JNJvW2wIxpYG+WpWzaeGDdp/wTS5tniVUGP+Gg0g=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 38/42] riscv: Set text_offset correctly for M-Mode
Date: Mon,  9 Nov 2020 22:54:36 -0500
Message-Id: <20201110035440.424258-38-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201110035440.424258-1-sashal@kernel.org>
References: <20201110035440.424258-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_225534_910167_2C0AEE7F 
X-CRM114-Status: GOOD (  11.71  )
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
Cc: Sasha Levin <sashal@kernel.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmerdabbelt@google.com>, Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Sean Anderson <seanga2@gmail.com>

[ Upstream commit 79605f1394261995c2b955c906a5a20fb27cdc84 ]

M-Mode Linux is loaded at the start of RAM, not 2MB later. Perhaps this
should be calculated based on PAGE_OFFSET somehow? Even better would be to
deprecate text_offset and instead introduce something absolute.

Signed-off-by: Sean Anderson <seanga2@gmail.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/kernel/head.S | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 72f89b7590dd6..344793159b97d 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -26,12 +26,17 @@ ENTRY(_start)
 	/* reserved */
 	.word 0
 	.balign 8
+#ifdef CONFIG_RISCV_M_MODE
+	/* Image load offset (0MB) from start of RAM for M-mode */
+	.dword 0
+#else
 #if __riscv_xlen == 64
 	/* Image load offset(2MB) from start of RAM */
 	.dword 0x200000
 #else
 	/* Image load offset(4MB) from start of RAM */
 	.dword 0x400000
+#endif
 #endif
 	/* Effective size of kernel image */
 	.dword _end - _start
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
