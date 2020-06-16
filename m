Return-Path: <SRS0=ePsx=75=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7504C433E1
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2020 07:45:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B2BE207C4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2020 07:45:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Re9/Dnpk";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="eoNyYh4J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B2BE207C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o+8GEwk8kcW25CIKv1LY5L5ZUakB4ZBGl9U9kcTV39M=; b=Re9/DnpkHMhqLl
	ezONHGpCdk8czYzpLojGkIT1ZW41r0ZckQZ4NnJND4+asMliSNj5rn5Z91mDqY6gxOwdgapTsYqWl
	xeK28cHMRzS0zhqbxGKIR80EGuO8QVKPR/6OU9CU7H+d7bQyFZbELEggbLhDY6tzDxLJvR84UF4KR
	mxUMk4CNHt3MjeumnvWa2M/t8IFGDUmOlXrnyQbtEfUJE9/jA4PQSkSc+SC561ZsAFDfcP91R6XnM
	MnmDYvgnyd2rxOnZBKDErVoVUCX/5NRKHsjazNlGZAKZ506MZxKd5RTFv5n1bLtCqgq6iiWzT8q6+
	hxtAIuN6O3TWf5fbkP7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jl6I9-0002XG-JJ; Tue, 16 Jun 2020 07:45:57 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl6I6-0002VR-87
 for linux-riscv@lists.infradead.org; Tue, 16 Jun 2020 07:45:55 +0000
Received: by mail-pj1-x1042.google.com with SMTP id m2so1159114pjv.2
 for <linux-riscv@lists.infradead.org>; Tue, 16 Jun 2020 00:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o+8GEwk8kcW25CIKv1LY5L5ZUakB4ZBGl9U9kcTV39M=;
 b=eoNyYh4J7k/8SYK2zXhF1YEKj9N0Afv3XXSYDDPaB9i+MQRoCZ9r3oIYXG/LPtrZj3
 wMZJUS90yAWZfZpwTvdnwjDV/e4fjPiX1UivN2O228mBCMQwJKA2PUaP650QN3WRY2rv
 mGKjNYRD+/+igGx0CeD1OcrdTxiTVHmK6lfKErkaQDGKEvqtH20AoVMmaGDk/xGsyTjs
 t6wuESKCPU8qJ6u90MJuTVgmQCU6TbGIBERMHPesvMdSti+XHf0YGd5QWqSgoHVUfpmt
 9N/jGpVSKM+DVSETlE5HT+BZeu1tOI9IPUB7P0lHj76oJJeeUrnxyRwKoVB4DojpK8k0
 TzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o+8GEwk8kcW25CIKv1LY5L5ZUakB4ZBGl9U9kcTV39M=;
 b=jAIe+lQVheg3AL4eaxulHnBc9mBAUg+zEL5gyDG53UgXhM2iQXtIqukpuPAYROSNzL
 XlwF9BadjtuYaX8bw2If5OiKTYQ2NpXLwbJjEgDETuKKafFNeRgPHCWUcDYGLg3q0agW
 MExDwSHMwFLOnBzlFy2gHJQK/ht9yRatsdEANumCjkvvt69v3FZlCsx27YfLaFuJkKpE
 8W7+q3r7t0itreY/ru6vqG2wQ/wrymkwJXchbN2gWQjPXl292gfsxTNaxYK9FHZWEQ5C
 CjrZqzzuMzrNa7+roXbU+AWN1nf7gjSN4arCefupx/3HbV1A2Rp2mTJSTk/jS9qBYPoI
 nUDg==
X-Gm-Message-State: AOAM532dAPftybPeR09uoQhFu4sqfQ41/qeXd/umzgHN4vDQG7d0Tgvs
 QnyA94pNII8uNsG9TZkFqwos01hgNAc=
X-Google-Smtp-Source: ABdhPJxI/1algBV7u/BWaXijmfBCSe+WdnszWPet5V5GZKfuhZoCnZ1aSKcnGn0vS6U6eKautx/k0g==
X-Received: by 2002:a17:90a:fb94:: with SMTP id
 cp20mr1831844pjb.142.1592293553758; 
 Tue, 16 Jun 2020 00:45:53 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id i22sm15948250pfo.92.2020.06.16.00.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 00:45:53 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] riscv: Register System RAM as iomem resources
Date: Tue, 16 Jun 2020 15:45:46 +0800
Message-Id: <063fab26f4c15bf5b833b57fa818749afa7811d4.1592292685.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1592292685.git.zong.li@sifive.com>
References: <cover.1592292685.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_004554_286386_FAC3FEA4 
X-CRM114-Status: UNSURE (   7.26  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Add System RAM to /proc/iomem, various tools expect it such as kdump.
It is also needed for page_is_ram API which checks the specified address
whether registered as System RAM in iomem_resource list.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/mm/init.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index f4adb3684f3d..bbe816e03b2f 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -517,6 +517,27 @@ void mark_rodata_ro(void)
 }
 #endif
 
+void __init resource_init(void)
+{
+	struct memblock_region *region;
+
+	for_each_memblock(memory, region) {
+		struct resource *res;
+
+		res = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);
+		if (!res)
+			panic("%s: Failed to allocate %zu bytes\n", __func__,
+			      sizeof(struct resource));
+
+		res->name = "System RAM";
+		res->start = __pfn_to_phys(memblock_region_memory_base_pfn(region));
+		res->end = __pfn_to_phys(memblock_region_memory_end_pfn(region)) - 1;
+		res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+
+		request_resource(&iomem_resource, res);
+	}
+}
+
 void __init paging_init(void)
 {
 	setup_vm_final();
@@ -524,6 +545,7 @@ void __init paging_init(void)
 	sparse_init();
 	setup_zero_page();
 	zone_sizes_init();
+	resource_init();
 }
 
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
-- 
2.27.0


