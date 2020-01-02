Return-Path: <SRS0=K0nT=2X=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB69BC2D0DC
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2020 17:25:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F068206E6
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2020 17:25:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tpQq5m/w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sVh3Jshn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F068206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=42dwpj2phdMjOSELCxAZ6AzEGwc9EnCl2bkK3fX11KY=; b=tpQq5m/wSclAb4
	I5QzvfDYcXprazTLmJPJnjsA9pD25gHF+nLSTAv6Cw2AsMPU8mEhThkSaAYA8twlv4/qO1DC+EwB9
	RKXRSW6u14mjcOQeB4ferIqOHUD5LBBlACfczZ1rQGLWm2OFaAvt74dL1hrSjxuN8e++DBM9qhgnD
	avzDGfNlE6wn2efQmMNUOKBM7bYKbYPCq63HPPTiRJkhSwgBLAfyKqFAmxS4nbhEGESmA0fWXCZR9
	eYREBZhoByvgSo6rttZH5ceD1/G9lcdvmBZMj+f6a2CywP3ZwbxZEb0guzUSMciAirZR3T8daucuv
	R56N61ikODySEGkTCFAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1in4Dh-00011P-9v; Thu, 02 Jan 2020 17:25:13 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1in4Cs-0007bd-By
 for linux-riscv@lists.infradead.org; Thu, 02 Jan 2020 17:24:23 +0000
Received: by mail-wm1-x342.google.com with SMTP id a5so6209214wmb.0
 for <linux-riscv@lists.infradead.org>; Thu, 02 Jan 2020 09:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=42dwpj2phdMjOSELCxAZ6AzEGwc9EnCl2bkK3fX11KY=;
 b=sVh3Jshn/DL4f/94oNWjZJSmDuhy0L71kNBispSrJKtlZw6uVXxdlcfD3v+SqkaMt+
 68K5P/ZsuDb5yB5LrzO1lHhPS3BNDUnECf0syOVRZ9/iCSuBlDB869EaHCbVS1NiAU/g
 Fq33rOS8y/DrCiMALb9u5vYc+1g4Btdq6ABIJdagnXyiXhRh3Bj5qByi3rBfB/kBU3Y5
 u+OlHgsIaCyqdNDv4pHn7hRHSmJmplYjgxnppT053ktpej2SksAlfAJpepJauOI1Lxxu
 y7lAi26xXAtL/h9E4SAgzE+61nel7GVI9lqwdDXcI/hqeKDa/Qgpec60Q4gPqavwO1BM
 An1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=42dwpj2phdMjOSELCxAZ6AzEGwc9EnCl2bkK3fX11KY=;
 b=FKtNLuR0llegBsM5WTXPTMQGuvOVLxSYBlGbKidfUykzxfBtbQMJDesMDOvxlQL2n7
 HY+uhIeHuOeilbBgmY1vL/JekEskqlO8F+qqR7yA1OaJ8mw2FEg4z39KR9f6h6lmUgd4
 FUpkmY70oAcPhVzXDw8BxCH1BjKvgnKYYMk0Xt4Kqslk8xEst87HC5kxdJcSfCQUOO/A
 PKz6LRBBmEezFmCQZNJuSC8haCSJPgj81amzSo9DNaMj+05P7XTbkmRXM+2t/9JaaYu7
 eDz4VWTRDE1Y8R9ZYRrZbXdzTkfq3VUBhj+ns/i2I/iGnQxVB1no2dFP/q0hg+8t7cq3
 bdkQ==
X-Gm-Message-State: APjAAAUyHw/rEdMtnA86EPdxYy2IdYKna3osabgqqoeJeW49a4kkC9NI
 HzuEtWdf+ZqOAQM2YYMvFPI=
X-Google-Smtp-Source: APXvYqxAd8hiehTngHSKl/CLbnA2H62XBgtY/wopB6fuVOhJuP1jHOwqsPSfDwMQ1Nghr/CaB4zuKQ==
X-Received: by 2002:a1c:a382:: with SMTP id m124mr15439329wme.90.1577985860536; 
 Thu, 02 Jan 2020 09:24:20 -0800 (PST)
Received: from amanieu-laptop.home ([2a01:cb19:8051:6200:3fe7:84:7f3:e713])
 by smtp.gmail.com with ESMTPSA id z21sm9480328wml.5.2020.01.02.09.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 09:24:20 -0800 (PST)
From: Amanieu d'Antras <amanieu@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] riscv: Implement copy_thread_tls
Date: Thu,  2 Jan 2020 18:24:11 +0100
Message-Id: <20200102172413.654385-6-amanieu@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200102172413.654385-1-amanieu@gmail.com>
References: <20200102172413.654385-1-amanieu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200102_092422_434899_537C1E72 
X-CRM114-Status: GOOD (  10.71  )
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
Cc: linux-riscv@lists.infradead.org, Amanieu d'Antras <amanieu@gmail.com>,
 stable@vger.kernel.org, Christian Brauner <christian@brauner.io>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This is required for clone3 which passes the TLS value through a
struct rather than a register.

Signed-off-by: Amanieu d'Antras <amanieu@gmail.com>
Cc: linux-riscv@lists.infradead.org
Cc: <stable@vger.kernel.org> # 5.3.x
---
 arch/riscv/Kconfig          | 1 +
 arch/riscv/kernel/process.c | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d8efbaa78d67..d6c3d44f96b5 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -64,6 +64,7 @@ config RISCV
 	select SPARSEMEM_STATIC if 32BIT
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select HAVE_ARCH_MMAP_RND_BITS if MMU
+	select HAVE_COPY_THREAD_TLS
 
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 95a3031e5c7c..817cf7b0974c 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -99,8 +99,8 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	return 0;
 }
 
-int copy_thread(unsigned long clone_flags, unsigned long usp,
-	unsigned long arg, struct task_struct *p)
+int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
+	unsigned long arg, struct task_struct *p, unsigned long tls)
 {
 	struct pt_regs *childregs = task_pt_regs(p);
 
@@ -121,7 +121,7 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 		if (usp) /* User fork */
 			childregs->sp = usp;
 		if (clone_flags & CLONE_SETTLS)
-			childregs->tp = childregs->a5;
+			childregs->tp = tls;
 		childregs->a0 = 0; /* Return value of fork() */
 		p->thread.ra = (unsigned long)ret_from_fork;
 	}
-- 
2.24.1


