Return-Path: <SRS0=m7Kf=UR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C62C31E51
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2019 06:13:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B26C214AF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2019 06:13:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dQRt1ym0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B26C214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Message-Id:Date:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4bJEO2MeUmBZkjU6jFmbU6NkSvDlCdOIJByh/1OD7wQ=; b=dQRt1ym0Xc73jm
	bs2NfKbuQkw/H3mryuAXEpKAcEAtQzKTM4PZ5vkFPgCAYpN8z3Lm7xoO87rwDhnhzXw48HToNqDY1
	PnA/gDrkV9NaOeSNE6ga9TxXCU38zRKJSjkq34Nax6AqmollM93UJP0OqyNiibHxZxYQLPmdM78EU
	FUb0yuTg0nRQh66AUNBBrBPsLuM6inS0jIJ97wGrV1EZoIp+WgsNCl9tN4n7pFC/69ttM2mwBKk4e
	bw/pNZLpUKubrixCQU/UxP2J/EQEI88r/jmafB1cRsT0wjjYagnwa8ZIIBUz+I1yWz2OUNGGh1lgk
	FHRnHbv5cpe9nFF9Sn6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hd7NQ-0008DO-Ol; Tue, 18 Jun 2019 06:13:52 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hd7NN-0008Cf-IX
 for linux-riscv@lists.infradead.org; Tue, 18 Jun 2019 06:13:50 +0000
Received: by mail-io1-f66.google.com with SMTP id s7so26995211iob.11
 for <linux-riscv@lists.infradead.org>; Mon, 17 Jun 2019 23:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=tkmzKPJ8v/O/itnNgoUTzaNNri0XyAwxiGBCEfYBcG0=;
 b=YmdR3VoWtPNL6yU9bJj/8vYa36eDW/GmHIWiHRsr/b1Sx7WrfMByleqYt6UWM7i6mc
 V9j39IerbTTj4IhD0r0WL/W5I32FBVKLK3QbQ0O9j0Ppm9AbULbqYAnJpdHYiV5fZ9HW
 2vim7SnPdHnfLFByuD/CdAPJw53H+Ly5NoVnhVeORtNtvuvGWEPXQnT7FYn9+QfFuVyI
 kDlh17EKnKITcxBa7+g8biCxdFyL5syeot71aErGMoaEjLOaYy6VAqF7Ycawf1SNaI9Z
 jywjYrxLTz54g22hiW8Ez8y/wVOjMKa0WufK+V47uCdiR2uZ8ltHdLn30qtFndlu2G1U
 LLYg==
X-Gm-Message-State: APjAAAVJfPknHVRqh/rZM4+2FMNkGVVnCue6ByOSup3o4jakS5I/wpR4
 /J9kKnz/fSidP4E6BPSxVVDOp03+kJ5Vrg==
X-Google-Smtp-Source: APXvYqyJrTKvL5aqOL4vqLndifQoIftcE6YdC3+xO0ObU+yua7RYLXa3ZnO59zlwbA8zft9/CWY6ZA==
X-Received: by 2002:a02:b10b:: with SMTP id r11mr892354jah.140.1560838427896; 
 Mon, 17 Jun 2019 23:13:47 -0700 (PDT)
Received: from localhost (210-61-29-234.HINET-IP.hinet.net. [210.61.29.234])
 by smtp.gmail.com with ESMTPSA id t133sm28866985iof.21.2019.06.17.23.13.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 23:13:47 -0700 (PDT)
Subject: [PATCH] RISC-V: Avoid using invalid intermediate translations
Date: Mon, 17 Jun 2019 23:12:03 -0700
Message-Id: <20190618061203.7256-1-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190617_231349_609222_19091B0A 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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
Cc: Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This is almost entirely a comment.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/kernel/head.S | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index fe884cd69abd..fc5534e9cf4b 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -99,7 +99,9 @@ relocate:
 
 	/*
 	 * Load trampoline page directory, which will cause us to trap to
-	 * stvec if VA != PA, or simply fall through if VA == PA
+	 * stvec if VA != PA, or simply fall through if VA == PA.  We need a
+	 * full fence here because setup_vm() just wrote these PTEs and we need
+	 * to ensure the new translations are in use.
 	 */
 	la a0, trampoline_pg_dir
 	srl a0, a0, PAGE_SHIFT
@@ -118,8 +120,14 @@ relocate:
 	la gp, __global_pointer$
 .option pop
 
-	/* Switch to kernel page tables */
+	/*
+	 * Switch to kernel page tables.  A full fence is necessary in order to
+	 * avoid using the trampoline translations, which are only correct for
+	 * the first superpage.  Fetching the fence is guarnteed to work
+	 * because that first superpage is translated the same way.
+	 */
 	csrw sptbr, a2
+	sfence.vma
 
 	ret
 
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
