Return-Path: <SRS0=54uT=Y5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99AF5CA9ED3
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Nov 2019 02:20:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D735217F5
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Nov 2019 02:20:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hLXwXSQW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="TPTDOXVl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D735217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=BOa1QHHBTodlqqkA3BQtd784eccnVeJ+rSrHGqirbXk=; b=hLX
	wXSQWdYhRyrrkZJmsOv3stg8JGt/uu8CRfyaAco+90R6xD88k96eLPM4Eu+eOJ7qYscaoDukapbnb
	zwgWBmU0VpL+n3YqrI5mQyfh3Ay7dA4JgOwIAmAU5Q8n7afERJsAU2llzs5p8pA0GbcXeCB2LWhiH
	MfWwyY7a8N9Vv4gthgV3JUASeBODY18TBwnggdVs2bkPgYrMYpYbb8StKGlRZs7PyF7f7AwzFZ98V
	ij4wETUklkxzgHcOXlj/EAQ5RAfbcUv5RCrk4nrOZccQzpwhmTpC3xSKJ6PgMhFYl7+Of4KIz8Gbk
	Cy3a3Un/meHAcfl6xnFsEJg00JVxIbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iRoSC-0001rs-J7; Tue, 05 Nov 2019 02:20:20 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRoS9-0001rZ-RV
 for linux-riscv@lists.infradead.org; Tue, 05 Nov 2019 02:20:19 +0000
Received: by mail-pg1-x541.google.com with SMTP id z24so8345925pgu.4
 for <linux-riscv@lists.infradead.org>; Mon, 04 Nov 2019 18:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=7b2y3zgo8qKKjwrv6gUDcqxB+dAh/ssjQVAiaSKyz7Q=;
 b=TPTDOXVlU4Ws9mRO9LEwkd5W6sg+gRV8f6gRKqE655V1UndxFs8t5BPpP8StgUXNoG
 46ihj7sC20mR7XvKUo4Xj6mhrUgxm9j6i7M+Z/mpBg3AL/IkW8pQ4nOwYyGeZqcYMu0j
 0rCbCzaBYgooSEH2EB+VJgT9jKBxxDJww9tcWwJImuCYZb8//6quyO8BRJYok01ITSjp
 GILCJ1yAAieQ1baq+COTX+5ihc2umosJWZgPNJT8WTf1/ll/996vgXHupAvHbUDNKiFs
 qtQklXVxCbMul9siP++iinLe2XUl0RyjXoYNE9zeR/tuJmBFbmu9ZYbYErP7hkQ1rtrA
 FUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7b2y3zgo8qKKjwrv6gUDcqxB+dAh/ssjQVAiaSKyz7Q=;
 b=BabZ/FTMJ6v6oTDbrVF9q0mvJC4oB4NC++z+rUF4ZbFKKceHdiUkRnvwW8Q2ni6WFO
 gaT8YvFQkrpoHFdv4TYCrwlWo53fWi4h9FS0exMoJJivghT7xCX2VPkV1ti4qEDizndS
 zTKUrvdmC3zYzZUaYEyQAAQlTXDY30gEkJX4vJAMD7yhkPOC+7u2yx+ijoh6IogfnDpE
 tvQYB6QAmGC5EWuxp93jsHUVi82mu50XdJEkZkVDNtBt3xbaXWirAkTjShf/CsMwGZGR
 58+hG4O5SRclCsUYDK47Xwbw3PDWCTQ7nueKWrW3qNLtrjx3DuqCc7cmN9MV/PnEWaV9
 U2ug==
X-Gm-Message-State: APjAAAXdC9eay3MW24P6gBxVUC8maN4JouR7czp12rVBBUq0ybTGQ/Im
 2ktxrQ4GnkdcfB/Wfw9qtK9/cyahKrM=
X-Google-Smtp-Source: APXvYqxhgOLlKkh3nf5acik48nMMfKxZywcjeW4trXTCKPfHOjiCvY+zpJGEw9VefSRc7EiasIIn7Q==
X-Received: by 2002:a17:90a:c082:: with SMTP id
 o2mr3132965pjs.94.1572920416635; 
 Mon, 04 Nov 2019 18:20:16 -0800 (PST)
Received: from gamma07.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id i32sm10313443pgl.73.2019.11.04.18.20.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 04 Nov 2019 18:20:16 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 paul.walmsley@sifive.com, palmer@sifive.com, Anup.Patel@wdc.com
Subject: [PATCH v2] riscv: Use PMD_SIZE to repalce PTE_PARENT_SIZE
Date: Mon,  4 Nov 2019 18:20:12 -0800
Message-Id: <1572920412-15661-1-git-send-email-zong.li@sifive.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191104_182017_904782_5D1F5553 
X-CRM114-Status: UNSURE (   9.66  )
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
Cc: Zong Li <zong.li@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The PMD_SIZE is equal to PGDIR_SIZE when __PAGETABLE_PMD_FOLDED is
defined.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/mm/init.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 573463d..642b330 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -273,7 +273,6 @@ static void __init create_pmd_mapping(pmd_t *pmdp,
 #define get_pgd_next_virt(__pa)	get_pmd_virt(__pa)
 #define create_pgd_next_mapping(__nextp, __va, __pa, __sz, __prot)	\
 	create_pmd_mapping(__nextp, __va, __pa, __sz, __prot)
-#define PTE_PARENT_SIZE		PMD_SIZE
 #define fixmap_pgd_next		fixmap_pmd
 #else
 #define pgd_next_t		pte_t
@@ -281,7 +280,6 @@ static void __init create_pmd_mapping(pmd_t *pmdp,
 #define get_pgd_next_virt(__pa)	get_pte_virt(__pa)
 #define create_pgd_next_mapping(__nextp, __va, __pa, __sz, __prot)	\
 	create_pte_mapping(__nextp, __va, __pa, __sz, __prot)
-#define PTE_PARENT_SIZE		PGDIR_SIZE
 #define fixmap_pgd_next		fixmap_pte
 #endif
 
@@ -316,10 +314,10 @@ static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
 {
 	uintptr_t map_size = PAGE_SIZE;
 
-	/* Upgrade to PMD/PGDIR mappings whenever possible */
-	if (!(base & (PTE_PARENT_SIZE - 1)) &&
-	    !(size & (PTE_PARENT_SIZE - 1)))
-		map_size = PTE_PARENT_SIZE;
+	/* Upgrade to PMD_SIZE mappings whenever possible */
+	if (!(base & (PMD_SIZE - 1)) &&
+	    !(size & (PMD_SIZE - 1)))
+		map_size = PMD_SIZE;
 
 	return map_size;
 }
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
