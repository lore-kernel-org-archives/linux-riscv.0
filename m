Return-Path: <SRS0=TYB+=PG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA24DC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 02:00:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 735D861250
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 02:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 735D861250
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+oyBe4UMkJkJyQSARreDf1Sm9TdOyzSTmx7exI4sxU=; b=uaO2j6ussSCs6O
	bsGvB79P7GdTDI5KQMXBbiam4QXlE07bevAf7o7QjvwUDI7AGuLwf33u+csRIKvTiVb0QJ0Tz6D3e
	L5SLn5EvjTyoZdlx+O2ByBzy2MgOURSYXayZoZL8g0pUvGqZWLWdIlQd++jLyhiv1Y2P/J6b0Dx29
	4G8+2JyuA1UFqpOjaFKPvgQbhaufQWhj4KEmMrE9g+knrqmzbyi46CkZOHCi3rQ9tKZfIqzk5X1eE
	Rj9VfAZZ6Y0ogW9Ocv++f3Ho1rdg7JZVk12bM5ka7934OESEBVKG/SNuRBZ2XThnXYRURXfi6/32V
	aE76adAvSEnzZCKNCX/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcHwo-00DmsS-OE; Mon, 18 Oct 2021 02:00:18 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcHwm-00Dmrz-BP
 for linux-riscv@lists.infradead.org; Mon, 18 Oct 2021 02:00:17 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 ls18-20020a17090b351200b001a00250584aso13364663pjb.4
 for <linux-riscv@lists.infradead.org>; Sun, 17 Oct 2021 19:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ofOP3xFW1JaHcNuB4PTXlIrU5gFqMS9igYxQdAW6Mtc=;
 b=H9EFj43mTpqloXAc6cvc77NT2mkmL4naRBHAfV6vUd6xmXFO+Xs7cX7XdamCoA36tL
 YleMH7+vo/ieHJtvc+7O6e5oJPz3iBgu0WYVzNlfFl5WwD2yLm2Tv9fOxb+1y263J5S+
 lYAzrimehOhDlH90fcnBhV/cNp1GU1dcELTrS/CY8cxikUTB0IpmEfzuo8y1rO7gFgHX
 G/i/NADj/d6dL3I2v6ty9f6ulQaMpf6PFqr0ovoCvnv1vcGtO6MinNwX5VYr1LRU+TEK
 FK/e85SxJy/BmX0jMtF8uMc3B5iJgGD4xScHc7Y6icpzA9vTch0bpOuszq8XXDhS9u/j
 9ABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ofOP3xFW1JaHcNuB4PTXlIrU5gFqMS9igYxQdAW6Mtc=;
 b=1CIG9dharUIPi/Y1TLLKfTSzAaocDra77zGdw1j8rrVSdQqa9DoFe9hnraOcc7KpNj
 B0zsonBzWWusoEQznneEdX0q7QvcbhEJmh/h0o6NSYmHibmV1Zr6IJOyf9nlLEHyNE9L
 ZZEJP5aOwXtnIUqlb6Gp4ojYODxptRlQS02AHjPEVmxPAVYoGP8PVtJWC/u8sUEfSLya
 q/4d0JOH46BOOegggQtMRpE8z8FEd9rmoDamd1sm2klPeHfdJfGQyJNfsReQ5I19jLuv
 NhUG3FTe5DksVfzNRalDLwfk0/TpTscU1WRGFJTvf6tGWDnKofJU4rscSdiVcMHNODqW
 K0Qw==
X-Gm-Message-State: AOAM531BkZf5EqojXdszjj75Ckn6/xOtjjCnG5Fr06lnuKT2aokk46V+
 TftI2WmhsRSj2POstpQLnOCUXGrfeIZodgdC1P1clg==
X-Google-Smtp-Source: ABdhPJz9PwFUV0pD/KeGWqUWUhi7m+oUNhNU5x31yp1jZvKBSDQoPWdarydWL++NTwVa9x3m7zBOLQ==
X-Received: by 2002:a17:90b:4d0b:: with SMTP id
 mw11mr30322284pjb.135.1634522415470; 
 Sun, 17 Oct 2021 19:00:15 -0700 (PDT)
Received: from localhost.localdomain ([103.135.248.171])
 by smtp.gmail.com with ESMTPSA id v22sm11381975pff.93.2021.10.17.19.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 19:00:15 -0700 (PDT)
From: Qinglin Pan <panqinglin00@gmail.com>
X-Google-Original-From: Qinglin Pan <panqinglin00@163.com>
To: linux-riscv@lists.infradead.org
Cc: xuyinan@ict.ac.cn,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [RFC PATCH 2/4] mm: support Svnapot in physical page linear-mapping
Date: Mon, 18 Oct 2021 09:59:42 +0800
Message-Id: <20211018015944.1313008-2-panqinglin00@163.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018015944.1313008-1-panqinglin00@163.com>
References: <20211018015944.1313008-1-panqinglin00@163.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211017_190016_419343_F223D042 
X-CRM114-Status: GOOD (  15.63  )
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

From: Qinglin Pan <panqinglin2020@iscas.ac.cn>

Svnapot is powerful when a physical region is going to mapped to a
virtual region. Kernel will do like this when mapping all allocable
physical pages to kernel vm space. This patch modify the
create_pte_mapping function used in linear-mapping procedure, so the
kernel can be able to use Svnapot when both address and length of
physical region are 64KB align. Code here will be executed only when
other size huge page is not suitable, so it can be an addition of
PMD_SIZE and PUD_SIZE mapping.

It is tested by setting qemu's memory to a 262272k region, and the
kernel can boot successfully.

Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
---
 arch/riscv/mm/init.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index c0cddf0fc22d..60a8e1dca79a 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -314,8 +314,18 @@ static void __init create_pte_mapping(pte_t *ptep,
 				      phys_addr_t sz, pgprot_t prot)
 {
 	uintptr_t pte_idx = pte_index(va);
-
-	BUG_ON(sz != PAGE_SIZE);
+	pte_t pte;
+
+	WARN_ON(sz != NAPOT_CONT64KB_SIZE && sz != PAGE_SIZE);
+	if (sz == NAPOT_CONT64KB_SIZE) {
+		do {
+			pte = pfn_pte(PFN_DOWN(pa), prot);
+			ptep[pte_idx] = pte_mknapot(pte, NAPOT_CONT64KB_ORDER);
+			pte_idx++;
+			sz -= PAGE_SIZE;
+		} while (sz > 0);
+		return;
+	}
 
 	if (pte_none(ptep[pte_idx]))
 		ptep[pte_idx] = pfn_pte(PFN_DOWN(pa), prot);
@@ -444,10 +454,13 @@ void __init create_pgd_mapping(pgd_t *pgdp,
 static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
 {
 	/* Upgrade to PMD_SIZE mappings whenever possible */
-	if ((base & (PMD_SIZE - 1)) || (size & (PMD_SIZE - 1)))
-		return PAGE_SIZE;
+	if (!((base | size) & (PMD_SIZE - 1)))
+		return PMD_SIZE;
+
+	if (!((base | size) & (NAPOT_CONT64KB_SIZE - 1)))
+		return NAPOT_CONT64KB_SIZE;
 
-	return PMD_SIZE;
+	return PAGE_SIZE;
 }
 
 #ifdef CONFIG_XIP_KERNEL
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
