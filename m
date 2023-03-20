Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F00CC6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 06:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g0KXCj4bJcgcxbaLK8XXtPLKAWpZbat8ud6Pjm4WGH8=; b=4XEM28DjtX21Ix
	GcZHEj/9e+nkAzQ8HtLWK0l4SCjEM49uAYiqX5EpfKaoyxB2Hqcxc48lUbXIZhekOtBCZoz7RI7Ro
	Kd10z2wW7uTEN6BpNudKNM8wofQUIrXHRFb6LmC2sjiDrzkJIXR8trPx6Chdy4IT/zUsdRAaRmbvM
	qjhi+OqxvdoAbOBMhPp60xv+7aMwcGIb0/1624w+b1RVS51bmaoH+KvZekUKfPjlgeJlaTBOmwn4y
	fyHF8qzkwU8/5gFS3OWC7ROU+3J3eZ34YdrB68ZxS8Z/oP4Z7W6gE6bagswmuaEnqtqOUjgeOtQOR
	bRu2jO/VjnJahr4mpVEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe9Oi-008FsO-39;
	Mon, 20 Mar 2023 06:53:36 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pe9Og-008FrB-0f
	for linux-riscv@lists.infradead.org;
	Mon, 20 Mar 2023 06:53:35 +0000
Received: by mail-pg1-x532.google.com with SMTP id q189so5993719pga.9
        for <linux-riscv@lists.infradead.org>; Sun, 19 Mar 2023 23:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679295212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Q3g41CkezKxnf5VWV/J1VVDSQcOZEqV2zQvUvC8Kkw=;
        b=QxeUP2oK3Q1RQdbogQaT1WIpkFDZ46+ntu3Wd3pniW+c8lO3ixJmVNNWGOqv3lZMvG
         Acn1AkM0BnfkXcjhIlmhNd81d+1sMV4wBsa+4cjxlv8KiEmdmVS6lyYUXcwYbHh+ZUiO
         V4D0r47wyZkus0jvVgJmRSZ3jHReuYcH78uaMLLa7hkqqligmOroBq9SWJFjjRKSfA+S
         ECqS9Ux2DonlgDW+Mz+UVPdWSZ+4GVxajfFtou0tfXRpjEhTGE++xK00KYQoAsIdXGnO
         v6KanqTmkOxt4jE05v7bkLatMMTp6KI3oD1UR40srOzXVkBNYYGdfoOc8m3W0YLAmmDo
         mveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679295212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Q3g41CkezKxnf5VWV/J1VVDSQcOZEqV2zQvUvC8Kkw=;
        b=skB2MpiVwFDUxlUrnqYlv3oox6d6a3kF62tzE+6bdcnF/v0b9l/1MGJDPJZRx9+HtD
         /ne7mjlojSNdDMxZ7ALa2m2PgN2EH78RtyuIQTp7oUgACSaU1ekG3CPAT5vmmQYuM/Gf
         VSekPGRb0pcQ586y5OXeseFpnGfY5r+3QO2YhD4XJi3mLK2h1EOgNnbeFF5HTZ1rN6s8
         N7unMYP6e8h1MsjLNVJRHNU7Wj3bamcvg67pokZhNLG3PH8Yo+XgLlWi7TZqZV7wrtTh
         S9KjTDwvzP81hAhrAuFuydwFmldY2Snc9OeARnhZ4P7ZHHSKrR044jWinjD1EEX3a1s2
         GFPA==
X-Gm-Message-State: AO0yUKUpE7330nkluA3U7MPL6hXKxtys4ForYqTCd2vlxLPYmQiVKjA6
	Z38YL67eZZOQWsw+ULBBBhVYiw==
X-Google-Smtp-Source: AK7set9uwaTpOM77izYFiwEvzM82LB06sz/M5zJslenvXLLDZU9VxBYgDVDFkgTrNNKCDfxMVbHMxQ==
X-Received: by 2002:a62:7bc7:0:b0:5ce:ef1b:a86 with SMTP id w190-20020a627bc7000000b005ceef1b0a86mr13309840pfc.2.1679295211904;
        Sun, 19 Mar 2023 23:53:31 -0700 (PDT)
Received: from localhost.localdomain (111-251-215-182.dynamic-ip.hinet.net. [111.251.215.182])
        by smtp.gmail.com with ESMTPSA id b1-20020a6567c1000000b005023496e339sm5501494pgs.63.2023.03.19.23.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 23:53:31 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	vincent.chen@sifive.com
Subject: [PATCH] riscv: mm: execute local TLB flush after populating vmemmap
Date: Mon, 20 Mar 2023 14:53:24 +0800
Message-Id: <20230320065324.1045276-1-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_235334_316412_463CF7D1 
X-CRM114-Status: GOOD (  10.07  )
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

The vmemmap_populate() creates VA to PA mapping for the VMEMMAP area, where
all "strcut page" are located once CONFIG_SPARSEMEM_VMEMMAP is defined.
These "struct page" are later initialized in the zone_sizes_init()
function. However, during this process, no sfence.vma instruction is
executed for this VMEMMAP area. This omission may cause the core to fail to
perform page table work because some data related to the address
translation is invisible to the core. To solve this issue, here let
zone_sizes_init() call local_flush_tlb_kernel_range() to execute a
sfence.vma instruction for the VMEMMAP area, ensuring that all data related
to the address translation is visible to the core.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/include/asm/tlbflush.h | 7 +++++++
 arch/riscv/mm/init.c              | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 801019381dea..b7696974e3c6 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -59,4 +59,11 @@ static inline void flush_tlb_kernel_range(unsigned long start,
 	flush_tlb_all();
 }
 
+/* Flush a range of kernel pages without broadcasting */
+static inline void local_flush_tlb_kernel_range(unsigned long start,
+						unsigned long end)
+{
+	local_flush_tlb_all();
+}
+
 #endif /* _ASM_RISCV_TLBFLUSH_H */
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 2c4a64e97aec..62eea656e341 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -72,6 +72,9 @@ static void __init zone_sizes_init(void)
 #endif
 	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
 
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+	local_flush_tlb_kernel_range(VMEMMAP_START, VMEMMAP_END);
+#endif
 	free_area_init(max_zone_pfns);
 }
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
