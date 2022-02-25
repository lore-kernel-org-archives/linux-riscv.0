Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C471DC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Feb 2022 12:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x5LobbI8Y86Io1L31MZ7LAnwTTe1SkuHeTzjPO1QQiM=; b=3EVvfwPXMU2RH7
	tFMP/PPNK9t9uGzJfHgINmuXfrey07BBClym22VGLJX2fimErxXyWKwgRm8msq37eifxzhx+QPtpE
	DQLlZdmx/z61Bxuxr2UWH7q9VTYz/oE8HSExC3jRWT6f3pX4cIY8sFKuiiC5BVSvwWF1v2zVSHR+I
	JCPHGsUi/0btvWYqiJsl8FC9ldHRH14qmkNRFYSqDeTNctu/oIdAtH4tJxIhT/pb320BtUIF1fH0L
	cyaSLf1bPZ8cByJo5arUXhccbMl/WoDm+xPb2ebZhhgyWFo58Amv3B29EYuLkaIRDISn3bBjYrtgl
	kN/DQK6EpEG0ocUVj3cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNZu9-004scR-ST; Fri, 25 Feb 2022 12:41:01 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNZu7-004sbo-4D
 for linux-riscv@lists.infradead.org; Fri, 25 Feb 2022 12:41:00 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D38243F1B6
 for <linux-riscv@lists.infradead.org>; Fri, 25 Feb 2022 12:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645792857;
 bh=PQyFtNV3tW1qRmwZ8HqaxvUDcyO7BHPqZZLC0geQ1k0=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=BMrC50W2SGWjb2OEkCsBv31eAbccM4CKDnxGu5PeMdcvtT8jRgwjM0T0rjhLM7X/z
 P/w4xFyonwNZxJxPYbbkAGwl9XF3Fq9pv7XJoKRVuQl4JHMk+CP4LGbEKIuMHwdANJ
 loCFWY2Ynbld/B2Xs/0SDFxX2ZhOugwe4Ak/KT7MICClkrop9winal2Lz3dDGebDYT
 jN9qphsDKXzurubHsOj5ksvVtgjAlihMCOt6qlZ+0c3//jq/LRkZw6w3E5HT36b7wh
 W2rCdS9Y9Sz4+PJq3qbzQNizIr9kKoK8aeoCdzB/dhYABwfkPLI8ndA5XIJ/foQ4/2
 QnEei6NIdj8mw==
Received: by mail-wm1-f69.google.com with SMTP id
 q17-20020a1ca711000000b0037be98d03a1so1537766wme.0
 for <linux-riscv@lists.infradead.org>; Fri, 25 Feb 2022 04:40:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PQyFtNV3tW1qRmwZ8HqaxvUDcyO7BHPqZZLC0geQ1k0=;
 b=tqSiU2iPVTaIe2ccpz+JYjQHf4akpfD2tFVUWMNGocsUikg2O1Ler8mrSwUMJd/pwz
 cK5PqBshK52/YtAbnv6jaiR7NKpAKaMOR/0iG1C6oNLPaekPwdnmuih8i2ym4fQD3KEv
 veZzQ3TATnJItGST14KQHYec0nzsxC4Y/dx6ev/ZC+IaP8aTcxfooICSnfamp+u8xqYY
 lzO5M3DKJve3LU+nJCoQ4D6QoncxKBA5FaDRdOASEudzGvICWhW95YoPQ/tnrwMSh8oc
 1JGRq0wIQCLzkN2a3R2h8UzYgWTk8f9B7l7D0VuYChJVvWVo7iDdOTlFwalp0Gu1N1AA
 0Q3A==
X-Gm-Message-State: AOAM533ROH2yqW5Fapcte+KvKJk9Gp1C7KQR95et6xjPBC4be1nBtTBp
 wlESSEkrpny+xND2gKXEP2ddN7S9UMNUGXflH7sdZE+uNrE0Hs4yHFgaToX/S6M40JEokTXyCR1
 V/Re7MLcE3nBWWZ9VRq4W/aHocW6YAT16vLBvY36udmL6XA==
X-Received: by 2002:adf:a54c:0:b0:1ed:ab82:d5c with SMTP id
 j12-20020adfa54c000000b001edab820d5cmr5903431wrb.636.1645792857567; 
 Fri, 25 Feb 2022 04:40:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwT+su/PUtxfMPaEWHXQEsOYe5HRBKTe0eLxFb9GXFhSjzcIXlRc3bYFdCjzbmxa8WeOAipFA==
X-Received: by 2002:adf:a54c:0:b0:1ed:ab82:d5c with SMTP id
 j12-20020adfa54c000000b001edab820d5cmr5903415wrb.636.1645792857391; 
 Fri, 25 Feb 2022 04:40:57 -0800 (PST)
Received: from localhost.localdomain (lfbn-gre-1-195-1.w90-112.abo.wanadoo.fr.
 [90.112.158.1]) by smtp.gmail.com with ESMTPSA id
 b10-20020a5d550a000000b001e551ce8a64sm3228332wrv.9.2022.02.25.04.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 04:40:57 -0800 (PST)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Aleksandr Nogikh <nogikh@google.com>, Nick Hu <nickhu@andestech.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com
Subject: [PATCH -fixes v3 1/6] riscv: Fix is_linear_mapping with recent move
 of KASAN region
Date: Fri, 25 Feb 2022 13:39:48 +0100
Message-Id: <20220225123953.3251327-2-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220225123953.3251327-1-alexandre.ghiti@canonical.com>
References: <20220225123953.3251327-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_044059_317390_9888EE2C 
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

KASAN region was recently moved between the linear mapping and the
kernel mapping, is_linear_mapping used to check the validity of an
address by using the start of the kernel mapping, which is now wrong.

Fix this by using the maximum size of the physical memory.

Fixes: f7ae02333d13 ("riscv: Move KASAN mapping next to the kernel mapping")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/include/asm/page.h    | 2 +-
 arch/riscv/include/asm/pgtable.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 160e3a1e8f8b..004372f8da54 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -119,7 +119,7 @@ extern phys_addr_t phys_ram_base;
 	((x) >= kernel_map.virt_addr && (x) < (kernel_map.virt_addr + kernel_map.size))
 
 #define is_linear_mapping(x)	\
-	((x) >= PAGE_OFFSET && (!IS_ENABLED(CONFIG_64BIT) || (x) < kernel_map.virt_addr))
+	((x) >= PAGE_OFFSET && (!IS_ENABLED(CONFIG_64BIT) || (x) < PAGE_OFFSET + KERN_VIRT_SIZE))
 
 #define linear_mapping_pa_to_va(x)	((void *)((unsigned long)(x) + kernel_map.va_pa_offset))
 #define kernel_mapping_pa_to_va(y)	({						\
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 7e949f25c933..e3549e50de95 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -13,6 +13,7 @@
 
 #ifndef CONFIG_MMU
 #define KERNEL_LINK_ADDR	PAGE_OFFSET
+#define KERN_VIRT_SIZE		(UL(-1))
 #else
 
 #define ADDRESS_SPACE_END	(UL(-1))
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
