Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C345EECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 17:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c6E/cPnIfpXmCsIAqDHSRyYLV9CXZB9pPDF1T4Pr0AI=; b=gyydMlxcwrNfxb
	RVdV0hQLriWdY3qe5gOQOYXD7BxixEJLRpcdNDd8bLdJAsJ6RJXuHzBKir/cImFAR4hVy+pQ2tl4W
	MEyh6jJKEglh+U84/48iHkOuGIia1b2/25xrYaZGZ4FR5eSB4WKD3UxLKLTbOqt0dI2pKzGhGGgqT
	ZPMRg+trDfsi5izs5Kxg66kYtVKI1aXxYv+XNt3Zwp6PnyAQosAAOvPM6A5OP6FMzZWAysmDEw4Ib
	DIXwwgMlVaiBM9PANf4zz7HNnK04v9G3IsVb8FaIJyr0UtpV8sv+Bppte6nmu4D2uIXujdXS86S27
	sBoKSV7LOq6iagDdHZNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo6cj-00ELwK-3b; Thu, 27 Oct 2022 17:24:57 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo6cb-00ELt7-J3
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 17:24:51 +0000
Received: by mail-wm1-x32f.google.com with SMTP id v130-20020a1cac88000000b003bcde03bd44so4659881wme.5
        for <linux-riscv@lists.infradead.org>; Thu, 27 Oct 2022 10:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jamieiles.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6hTEnG14Q+yslkOObYKaMk19lUJEiXbkpZtOCvvr/0=;
        b=nQMpPtjqSxMEBsYcTu/VueuoWzPmWcjl8qinBsFoFlyhaNG52aUG/Q3LmKrdK8n5Vd
         YI9lAO5KloPpFTTWn0WOEmHhx8wDaCCmflpVp3VBn5Qo7v+yxPWtdcxDqCl8Y+oNIZcw
         +cB3L7PwyR/uXnPoeqYBVWbQi9JA7Z9X5z59tCFTGnfeYcNW+A9GaH+J7XkMpDBNVDI0
         Dh3UUQbOOfksOXWYDwpHtQniBXoAG7RHQSlwn8Q5UxugZBBNX5IXpSvOB8H99p2RGuzf
         /+Lsnl52K0EMp47BJxpF82/ni/QYkk2P9lJQdmgDSoQUQaGuJDvU4sUmB7RVUq7AHHJP
         kkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6hTEnG14Q+yslkOObYKaMk19lUJEiXbkpZtOCvvr/0=;
        b=DJRUa5JFUDS7Jono3G+zcxyprdbnxrBTtUKVjsnap1A6kYdrdxDE43EbEkkeVHe4xX
         SXp0ZRQbJmqp5Xg1O/SD7INN21Jg9QuxZp7UqJi9QxdRcXyobMHkdW9ysNnUjFFnB8Wt
         AuBH+MXl5xSb4f0z5fzcm1vFhP+uawFajxOeInBEH5whUr0U51DJdqhLov8o+yjh232e
         f6uAwIFbrMOfuwMhgLEAlHV/gElU/vSan0jIn38vX5wV+Xv0nt7ngFY2ITgDBv3FCNsG
         PTmIWJogSputv/TYVSCAGzpLr2hy6IGsXfwRbbfdmC6cJ+k3nPWMDTRZMbQJXaXMynYI
         8P8g==
X-Gm-Message-State: ACrzQf2r38oG8zDB0szD0AE3vkP95i1XAajfQwB9uW4YuXfoDOUn1gAY
	X1wpLOYdlqKT0TAlwiNTaaKQlSHnEFK61Q==
X-Google-Smtp-Source: AMsMyM4xA9bRU5u+RnOG/rW+hmYw6kB4dOIYoEKMmvJAof6O+kIyxX0d0FAQk/2cP2ELmf9GKxb1+w==
X-Received: by 2002:a05:600c:35c8:b0:3c8:33dc:c262 with SMTP id r8-20020a05600c35c800b003c833dcc262mr6617679wmq.206.1666891486420;
        Thu, 27 Oct 2022 10:24:46 -0700 (PDT)
Received: from localhost ([5.181.106.148])
        by smtp.gmail.com with ESMTPSA id n38-20020a05600c182600b003a5537bb2besm2006081wmp.25.2022.10.27.10.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 10:24:46 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-riscv@lists.infradead.org
Cc: Jamie Iles <jamie@jamieiles.com>
Subject: [PATCH 2/4] RISC-V: reduce mcount save space on RV32
Date: Thu, 27 Oct 2022 18:24:33 +0100
Message-Id: <20221027172435.2687118-3-jamie@jamieiles.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027172435.2687118-1-jamie@jamieiles.com>
References: <20221027172435.2687118-1-jamie@jamieiles.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_102449_931919_7B524CBD 
X-CRM114-Status: UNSURE (   8.54  )
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

For RV32 we can reduce the size of the ABI save+restore state by using
SZREG so that register stores are packed rather than on an 8 byte
boundary.

Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 arch/riscv/kernel/mcount.S | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
index 9cf0904afd6d..4166909ce7b3 100644
--- a/arch/riscv/kernel/mcount.S
+++ b/arch/riscv/kernel/mcount.S
@@ -15,8 +15,8 @@
 
 	.macro SAVE_ABI_STATE
 	addi	sp, sp, -16
-	REG_S	s0, 0(sp)
-	REG_S	ra, 8(sp)
+	REG_S	s0, 0*SZREG(sp)
+	REG_S	ra, 1*SZREG(sp)
 	addi	s0, sp, 16
 	.endm
 
@@ -25,24 +25,24 @@
 	 * register if a0 was not saved.
 	 */
 	.macro SAVE_RET_ABI_STATE
-	addi	sp, sp, -32
-	REG_S	s0, 16(sp)
-	REG_S	ra, 24(sp)
-	REG_S	a0, 8(sp)
+	addi	sp, sp, -4*SZREG
+	REG_S	s0, 2*SZREG(sp)
+	REG_S	ra, 3*SZREG(sp)
+	REG_S	a0, 1*SZREG(sp)
 	addi	s0, sp, 32
 	.endm
 
 	.macro RESTORE_ABI_STATE
-	REG_L	ra, 8(sp)
-	REG_L	s0, 0(sp)
-	addi	sp, sp, 16
+	REG_L	ra, 1*SZREG(sp)
+	REG_L	s0, 0*SZREG(sp)
+	addi	sp, sp, 2*SZREG
 	.endm
 
 	.macro RESTORE_RET_ABI_STATE
-	REG_L	ra, 24(sp)
-	REG_L	s0, 16(sp)
-	REG_L	a0, 8(sp)
-	addi	sp, sp, 32
+	REG_L	ra, 3*SZREG(sp)
+	REG_L	s0, 2*SZREG(sp)
+	REG_L	a0, 1*SZREG(sp)
+	addi	sp, sp, 4*SZREG
 	.endm
 
 ENTRY(ftrace_stub)
@@ -101,10 +101,10 @@ ENTRY(MCOUNT_NAME)
  * prepare_to_return(&ra_to_caller_of_caller, ra_to_caller)
  */
 do_ftrace_graph_caller:
-	addi	a0, s0, -8
+	addi	a0, s0, -SZREG
 	mv	a1, ra
 #ifdef HAVE_FUNCTION_GRAPH_FP_TEST
-	REG_L	a2, -16(s0)
+	REG_L	a2, -2*SZREG(s0)
 #endif
 	SAVE_ABI_STATE
 	call	prepare_ftrace_return
@@ -117,7 +117,7 @@ do_ftrace_graph_caller:
  * (*ftrace_trace_function)(ra_to_caller, ra_to_caller_of_caller)
  */
 do_trace:
-	REG_L	a1, -8(s0)
+	REG_L	a1, -SZREG(s0)
 	mv	a0, ra
 
 	SAVE_ABI_STATE
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
