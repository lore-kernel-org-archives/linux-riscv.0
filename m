Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DECC6FD19
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Mar 2023 09:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w6OATGFFLnObXMbWtwtxHxAO1y2p6+y38thBvbRnYDM=; b=OuMtC2+D6WtzAi
	t2WRhsNQQHnvrVllDgXEOjwSrjAVEjAswlJCBH//ODE5POQGtlo/Gxrxo93c568SdfxHSvbGi9v2z
	hpClYhuGXICrCSdIGHYtpfRvQcUd+Chi8r7T4sAaMtimT62aLsKOV74Foz5PsRg9MrsyDwXCY9boP
	5Yv4wpABQrQeGPJz+NHRZqViEx+NbSuvp0S/c11UFAOUVLuECB6p1DJruPVpAb+qk6upFVqn6Q3o8
	g2v80bhMsR9ShlZ05rtgLxbQd9ezmTr3Zq7FSXtwROIQxc9/7m7eFzyksPjI34gpHkqFun9JTGqNO
	HoJG751RIHvydwptbplA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paZLq-00E1Ys-Ms; Fri, 10 Mar 2023 09:47:50 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paZLn-00E1XC-RZ
	for linux-riscv@lists.infradead.org; Fri, 10 Mar 2023 09:47:49 +0000
Received: by mail-wm1-x32e.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so5559189wms.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 Mar 2023 01:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678441666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6J6lRuGpbM7E9O7f7bljUjx0eKgcV/6jZ6mdNRRq+4=;
        b=JUZ6MS0ezJc5yh4n6KTD+iS0WsCulf8ihBW2NAvKNEq0/OB5Yl3u3Id3vcVGms8+Zh
         dy0R5ZAoYZe1+5BB4Ca7JUS88v8KD9qo3j2ZtpZ3YcD6dhav6UfqVvBndyVRy4znafUr
         SnyvqHVNZEfBo+F2qRp6xuk0sVwvpBO5NzGxZbWL64VKd3PuD6o4m+7enUFb65JiLMrD
         5Jvj7gBmtNYyrjDHsAI5NaAPtnjzy0RkGbkThWLIaSy6KlT9qCaNhB2m3HYD5+ztqRIL
         fDTxQFZDR13CddYNIljUltNoKv1Caa4FNdhMJm/MCwABN/OoQJutLpcdhPMIoHPiZaL8
         5CeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678441666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y6J6lRuGpbM7E9O7f7bljUjx0eKgcV/6jZ6mdNRRq+4=;
        b=52ccfMFQs3zUJ2Iu4GI0XGXAIpIZmKh2SG165FUOWjAa0z0MqV4MHLGQ2Bo5GRYUZY
         5aBvwnSJUoEsRnb9RuPBnNCfRhOLvOVXWbElgCn+wK7foH4GkzfaR72mciVWwqQh70Od
         S1oF+L1QVl+c/epctP69ajUaRtnD3haV3lLUyv0oCIg74BNV0CN4WDldyooK4Tb4heH7
         9GNiCyNC4ZpXQVapz8oUIet12+DEw6JlqC3k7wETBuBTZTrHGaAbsnB3JeVfgwwt7Lae
         AUgI4OIZ3ezAavo4tIBA30fqlYlPgc9q/eidJz3Akd9lcnQrjQRa3I7LmAEy5Z+/4mac
         UepQ==
X-Gm-Message-State: AO0yUKX/s8UOLWtxEEgpNAfoxCpdFjdBGdzAdqKHMXTGAdJXf0slHsXd
	Oyon4AkFMD4B71sKyTDEPHGmaw==
X-Google-Smtp-Source: AK7set+hIKDyMZLEzQZwJrQZ4Ml18aDplEsgmJbGeNc4aX7RXiRyHxB8XeJIUJU9oYunTbo6EYqvmg==
X-Received: by 2002:a05:600c:198e:b0:3eb:2f3b:4477 with SMTP id t14-20020a05600c198e00b003eb2f3b4477mr1930695wmq.28.1678441666270;
        Fri, 10 Mar 2023 01:47:46 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id g9-20020a7bc4c9000000b003e20970175dsm2410949wmk.32.2023.03.10.01.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 01:47:46 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v7 2/4] mm: Introduce memblock_isolate_memory
Date: Fri, 10 Mar 2023 10:45:37 +0100
Message-Id: <20230310094539.764357-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230310094539.764357-1-alexghiti@rivosinc.com>
References: <20230310094539.764357-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_014747_920098_23806CA9 
X-CRM114-Status: GOOD (  14.10  )
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

This function allows to split a region in memblock.memory and will be
useful when setting up the linear mapping with STRICT_KERNEL_RWX: it
allows to isolate the kernel text/rodata and then avoid to map those
regions with a PUD/P4D/PGD.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 include/linux/memblock.h |  1 +
 mm/memblock.c            | 22 +++++++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 50ad19662a32..2f7ef97c0da7 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -125,6 +125,7 @@ int memblock_clear_hotplug(phys_addr_t base, phys_addr_t size);
 int memblock_mark_mirror(phys_addr_t base, phys_addr_t size);
 int memblock_mark_nomap(phys_addr_t base, phys_addr_t size);
 int memblock_clear_nomap(phys_addr_t base, phys_addr_t size);
+int memblock_isolate_memory(phys_addr_t base, phys_addr_t size);
 
 void memblock_free_all(void);
 void memblock_free(void *ptr, size_t size);
diff --git a/mm/memblock.c b/mm/memblock.c
index 25fd0626a9e7..d8cf1c9eccf0 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -753,7 +753,8 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
 	int idx;
 	struct memblock_region *rgn;
 
-	*start_rgn = *end_rgn = 0;
+	if (start_rgn && end_rgn)
+		*start_rgn = *end_rgn = 0;
 
 	if (!size)
 		return 0;
@@ -795,6 +796,9 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
 					       memblock_get_region_node(rgn),
 					       rgn->flags);
 		} else {
+			if (!end_rgn || !start_rgn)
+				continue;
+
 			/* @rgn is fully contained, record it */
 			if (!*end_rgn)
 				*start_rgn = idx;
@@ -805,6 +809,22 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
 	return 0;
 }
 
+/**
+ * memblock_isolate_memory - isolate given range from memblock.memory
+ * @base: base of range to isolate
+ * @size: size of range to isolate
+ *
+ * Call memblock_isolate_range on memblock.memory to isolate the given range.
+ *
+ * Return:
+ * 0 on success, -errno on failure.
+ */
+
+int __init_memblock memblock_isolate_memory(phys_addr_t base, phys_addr_t size)
+{
+	return memblock_isolate_range(&memblock.memory, base, size, NULL, NULL);
+}
+
 static int __init_memblock memblock_remove_range(struct memblock_type *type,
 					  phys_addr_t base, phys_addr_t size)
 {
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
