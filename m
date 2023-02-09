Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE0BC05027
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 03:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oY9zKQ9WuBMRNVqQxVMzWE+8nexYwTy91R53KBYRBFI=; b=MjhLCWHCvvQQ8+
	YFWzPYxvVxZjOquPRGAyQJ8GpMa2LoiRKPuUmKyDATjU5qasf/gFA25ozHKkLkICJPcoPOUEtZM2F
	GFIf7NNL1gxM8nQcqbgbHa0Dc2LpOC7zZFSLwxr6/AP19PLXc2Gp0t/f7XqgS+uaW80LlWEKbZAsb
	NhgH+tdHqtcJYZ/dm+zdUbbtfAqmg6NYDge/hHlVi8PeHRuW/zzykYI6W0/H361ZPhKpiABVqIxor
	dnA1wJ+w6OAUECl2fa1wrlnl1mO2BzRuU+cZQoDChrohHTckwBPsb7NLGiRESsoWFVHAvSiq0w2Pq
	IiK6Hpng5eT93k7PvgWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPy0t-0004Lo-3z; Thu, 09 Feb 2023 03:54:23 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPy0q-0004Jb-0J
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 03:54:21 +0000
Received: by mail-pj1-x102b.google.com with SMTP id s89-20020a17090a2f6200b0023125ebb4b1so1062788pjd.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 Feb 2023 19:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZnqjoJrXJVJvIjHPJ8ek1t3j3J0PKnJZrTASYBNePo=;
        b=M8/M/gfvbZ7mQkzUfJTiMTUImIFIotjvgiLzYzLXvst/bxa8dJhMBXHWRJvAagO23v
         sqsxa5sc7xmjVRugb+JqxiC3Q6kTEALHF7yy3HG6YVKPP48cZvdj/C0eqTwNqRKoFj8m
         Aunfk/PIBNWLp+XqMrm+vKxAo9YBGwMU86UQT/QChYWg3NQHiwm2F4SgWJWclh08Adte
         2E03kME3/a7j6PzCOeXKYzwNJJOteN3JYlH2UvLUvIHmpjsouQ81UlvgoXLmuyPo3lKm
         CZ5c+NxZvCiMzidYP9e5X/+GVBuVeNcf+1M89vkXoNdL3DXCp/ha00/x3zfDEm/D1Eey
         udXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZnqjoJrXJVJvIjHPJ8ek1t3j3J0PKnJZrTASYBNePo=;
        b=LhC/0fxiT9oeJwH/SXaa/w3VAEhpGvWsfEDASebvnwBEWKKdvp63qRRCf50gmpvATT
         urA0pS9c1F+ccxiObR36YWjUGAzbLszC+LoaFHyToDKIaXUloFp5ArTzADQlSCePLB+u
         0w2USw0EiAqDAFGlNClPma+lZSatg2ZJR9GhVF4rTcJUHnyyG7yFfkQ5Tv+RaxYurmIb
         91lU5jCmLR24L+hQx6Qhhbst4f3HNdOMAHltq1yorFVnAIp2H+mSmAuHjM9BVWpUdkZ3
         u+z9SNqYtdTDHkbjVOnA4K1ZKNUCdVnT4qIG/9A4LdpHqkLJACZghQpyRLy/THdMK8sY
         Cfyg==
X-Gm-Message-State: AO0yUKXRx9wqI0IbG81yM+FkuFRGZJr6kS0p29aQAu6JLF1KWot+9fwj
	QgUpsMDSlsfEmYXF0Luo4Rc=
X-Google-Smtp-Source: AK7set+73GWTXdeoBAXF+tbJYVorHM2/zq5JkPuZjOBtP5YNpfotxjIRULrS9R2lpKl9s0jM2SIvVQ==
X-Received: by 2002:a17:902:b718:b0:198:f8e2:2e33 with SMTP id d24-20020a170902b71800b00198f8e22e33mr2729030pls.30.1675914857084;
        Wed, 08 Feb 2023 19:54:17 -0800 (PST)
Received: from localhost.localdomain ([47.75.78.161])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902eac500b00192820d00d0sm252602pld.120.2023.02.08.19.54.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Feb 2023 19:54:16 -0800 (PST)
From: Qinglin Pan <panqinglin00@gmail.com>
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	conor@kernel.org,
	ajones@ventanamicro.com,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Qinglin Pan <panqinglin00@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v12 3/3] riscv: mm: support Svnapot in huge vmap
Date: Thu,  9 Feb 2023 11:53:43 +0800
Message-Id: <20230209035343.15282-4-panqinglin00@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209035343.15282-1-panqinglin00@gmail.com>
References: <20230209035343.15282-1-panqinglin00@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_195420_075744_769B2D08 
X-CRM114-Status: UNSURE (   9.88  )
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

From: Qinglin Pan <panqinglin2020@iscas.ac.cn>

As HAVE_ARCH_HUGE_VMAP and HAVE_ARCH_HUGE_VMALLOC is supported, we can
implement arch_vmap_pte_range_map_size and arch_vmap_pte_supported_shift
for Svnapot to support huge vmap about napot size.

It can be tested by huge vmap used in pci driver. Huge vmalloc with svnapot
can be tested by test_vmalloc with [1] applied, and probe this
module to run fix_size_alloc_test with use_huge true.

[1]https://lore.kernel.org/all/20221212055657.698420-1-panqinglin2020@iscas.ac.cn/

Signed-off-by: Qinglin Pan <panqinglin00@gmail.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

diff --git a/arch/riscv/include/asm/vmalloc.h b/arch/riscv/include/asm/vmalloc.h
index 48da5371f1e9..58d3e447f191 100644
--- a/arch/riscv/include/asm/vmalloc.h
+++ b/arch/riscv/include/asm/vmalloc.h
@@ -17,6 +17,65 @@ static inline bool arch_vmap_pmd_supported(pgprot_t prot)
 	return true;
 }
 
-#endif
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
+#include <linux/pgtable.h>
 
+#define arch_vmap_pte_range_map_size arch_vmap_pte_range_map_size
+static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr, unsigned long end,
+							 u64 pfn, unsigned int max_page_shift)
+{
+	unsigned long map_size = PAGE_SIZE;
+	unsigned long size, order;
+
+	if (!has_svnapot())
+		return map_size;
+
+	for_each_napot_order_rev(order) {
+		if (napot_cont_shift(order) > max_page_shift)
+			continue;
+
+		size = napot_cont_size(order);
+		if (end - addr < size)
+			continue;
+
+		if (!IS_ALIGNED(addr, size))
+			continue;
+
+		if (!IS_ALIGNED(PFN_PHYS(pfn), size))
+			continue;
+
+		map_size = size;
+		break;
+	}
+
+	return map_size;
+}
+
+#define arch_vmap_pte_supported_shift arch_vmap_pte_supported_shift
+static inline int arch_vmap_pte_supported_shift(unsigned long size)
+{
+	int shift = PAGE_SHIFT;
+	unsigned long order;
+
+	if (!has_svnapot())
+		return shift;
+
+	WARN_ON_ONCE(size >= PMD_SIZE);
+
+	for_each_napot_order_rev(order) {
+		if (napot_cont_size(order) > size)
+			continue;
+
+		if (!IS_ALIGNED(size, napot_cont_size(order)))
+			continue;
+
+		shift = napot_cont_shift(order);
+		break;
+	}
+
+	return shift;
+}
+
+#endif /* CONFIG_RISCV_ISA_SVNAPOT */
+#endif /* CONFIG_HAVE_ARCH_HUGE_VMAP */
 #endif /* _ASM_RISCV_VMALLOC_H */
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
