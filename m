Return-Path: <SRS0=TYB+=PG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E47C7C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 02:23:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D0A260FDA
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 02:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D0A260FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+oyBe4UMkJkJyQSARreDf1Sm9TdOyzSTmx7exI4sxU=; b=O1zMZyRxkCqdEI
	2IFK1stiEHNJuxkhHz6VcaHgF1XPZJZ1x1BlMHJz+rUgwcfPQ3YYHGl2TBfr1iJ0Dke5GDDyVTaT4
	ek/wwxkIQCgTXS+EvFumUYRr0t8b1QO/L/T08Xh9bz1vkwDWDPFTck0oJNyDIXy56F2ldPjV0Cy2W
	IEbz+NI6UaVxXkCvPJZc64/kd/b5p4qRQx25xHF/pRmMHNOudsKqhNIQiQkO3B2y0JREuoqnLoG3N
	pBPUTSF0GbtuKtVZ6GSLxf2YNs1d6Uax/aIQtLEnmu69SAWaR/RAYUlzyxmUf6ciADGWh5tMOtho+
	ufhBw/qnls7RBhk9pKMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcIJ3-00DpOp-AT; Mon, 18 Oct 2021 02:23:17 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcIJ0-00DpNt-HT
 for linux-riscv@lists.infradead.org; Mon, 18 Oct 2021 02:23:15 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso11445794pjb.1
 for <linux-riscv@lists.infradead.org>; Sun, 17 Oct 2021 19:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ofOP3xFW1JaHcNuB4PTXlIrU5gFqMS9igYxQdAW6Mtc=;
 b=ZROrugVR/Zjm+/NlK2AILJC/W6kRiIL5y3Ih9wQFyJsV/dmpBfZPqDA/gpRBnN//WR
 KSxWed3bzcwOHH+3FvaIbqJApxyGN4kisqM5Cp4vJqb7VKO3ksayFXcCYgnWtAwY5BXm
 SyL4lSajGHjt1bDyyjnFByx1r6iyloov0/FRwGfH17YTQtNmpjhQgfXGlo6O8w7PD4dg
 eYfc1/HvrSVgxmo+zDwoHUBgSDYAsLqhSf8h31mTX6qzBYqlm6muonAfPHdVjtpcBkJa
 j9N42eT+E6HUXlyRJ0tUPWE5jGAE7mRFGfYATPViIyqgzA8rHxwYSX5hWdqV5gB74Tlv
 AhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ofOP3xFW1JaHcNuB4PTXlIrU5gFqMS9igYxQdAW6Mtc=;
 b=m6u8IlkfId7WgXTDyp1o/aSSY6e6xjOgDeYX1pChFUy5Q8cTxQF7zcD9gpkEhzilGI
 NZUAdYFHD3iuBb4hL8EUJ7CwSf1dhyP0r2xBRkm3r21FNGFtFS2Id0nQckGbz15g7eOW
 EeWNH6Am+1aRner2PtKIqeTIRpPlKdUy18vqM/2rMLPZm/XPfCRWNbF9sX9xMksFC2XU
 VLNNeL03PAbDmUOveVQ9SsKVKybFD84QnHwl71nApCklV1G2LqkhWJD1HDRMrOa0UNXp
 GjAjiWDAe+VkPEDJn/O9iD73ICTNjPsJjIKg+5qlOhUaLMPc9OdtHvlfS4qi+hwNtzDb
 /AQg==
X-Gm-Message-State: AOAM5334ieC1ykz3d67wlqz0bS/xo+4FLM5D4Z7kT01pwhx4YyRjn/cX
 Do1raZtTBlVSXuVEA42UrBKYsmaW5AOXYpUnXEdGRw==
X-Google-Smtp-Source: ABdhPJwtDhQGplsvxEU2TDcUNtMeWeI9MHpiy1mtMzV/MqPY1nbI+X0FORMNDPCtn0OtO6EKDHYxhg==
X-Received: by 2002:a17:90a:e54d:: with SMTP id
 ei13mr44443279pjb.65.1634523793848; 
 Sun, 17 Oct 2021 19:23:13 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac0:23::815:bc7])
 by smtp.gmail.com with ESMTPSA id t32sm4965971pfg.29.2021.10.17.19.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 19:23:13 -0700 (PDT)
From: Qinglin Pan <panqinglin00@gmail.com>
X-Google-Original-From: Qinglin Pan <panqinglin00@163.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [RFC PATCH 2/4] mm: support Svnapot in physical page linear-mapping
Date: Mon, 18 Oct 2021 10:22:36 +0800
Message-Id: <20211018022238.1314220-2-panqinglin00@163.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018022238.1314220-1-panqinglin00@163.com>
References: <20211018022238.1314220-1-panqinglin00@163.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211017_192314_587661_AF96EE10 
X-CRM114-Status: GOOD (  15.67  )
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
