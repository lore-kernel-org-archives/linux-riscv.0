Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF2FC05027
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 13:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oY9zKQ9WuBMRNVqQxVMzWE+8nexYwTy91R53KBYRBFI=; b=kaNhCZEmsSpaTG
	d2rxhr/obTHS1KOPgh7zWnwmeqIo3nzNFOBH9cyNVlrWkVRa5WM3EK2/2y6EL8LPZNl8ufIQOlnDg
	EK3Y9Zyn1xZTc0nfCd0bMlzEnmBfTUNAjbJBW/GgT2M5vRHJCMluHN0zPiEHe762GqZVE6b6JgzuL
	T2rmvMI7FGsRy3u6hmRelxuuUGpeq3tijLiBiOhkMiyw2OsgLqoFSVvMSP+06Lzte/x4lfZ9kzVEA
	6a8ZF5NCJGpuiYwSIrOi7iYQEOISsIZouiUsaLqn1icpXMvX+sh9RC76kuzOOobJRibqNEmlsZVho
	CTph0+wAw/k43mDo3Wbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ6nc-001dz2-EX; Thu, 09 Feb 2023 13:17:16 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ6nZ-001dwy-Ei
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 13:17:14 +0000
Received: by mail-pg1-x533.google.com with SMTP id 24so1529576pgt.7
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 05:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZnqjoJrXJVJvIjHPJ8ek1t3j3J0PKnJZrTASYBNePo=;
        b=KEP51k/n2AU93m4ol4VzTwR/x6syNOiEKFWgb9+/rngIZOU5Klskg645c4vvLr4SqP
         taO1THks0hihHlT5djTSWKWCgfDXlHC5321q91Kd7zQis1VWy1R3CII7NiXC6q+VBW7N
         IB0cqOQ16oqh6RZnFZKNOElXm9T8VI6riaZEl82xQzpsE/RSu5Ldh12XhNHkR3ZMeLyS
         IOaeH+8XR/rrYAHcHPNPXYWK7aFacHeyuTsvnX9NN3Ep3Uk2hvjUnYfX/5OnBXApxVMM
         Y4RYECGluhFtkEf10V4yemjteA9X4sLaHRALTzKLlr0rSlok43sV5h498CwPJo9B7eTf
         9hKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZnqjoJrXJVJvIjHPJ8ek1t3j3J0PKnJZrTASYBNePo=;
        b=f028UTdl+occ5zJQPJx3eYvcMVpvlbJvvn2mlgVgZMR6bDYdzEJRw9s6N3x7Sh68+4
         KdCFrSdlAortE/U/Oh3Tg43zyclBJImLd99ZFn1Jsy+PUE3BuLYgrWOy0dB3VY6AweGa
         fDBCq6UYxjwVLys2LoJRK7N//5yCV4NNwfJ6JJiRaSLc/Nxt66IDKPjFB3uTdOfufgVk
         yBsx8C6YybBarXPlqjLHbGgAcIbt/pdO0NGp5rKXx0l9gblSo94dlce3NM9fczbfi7D8
         Sd06PaW/ELILeCQCLyAwQG3XP9H8cYddC8wegnzafNIQgah92UphBNNqo/SKDpgwuyaX
         DMDw==
X-Gm-Message-State: AO0yUKU/mBiRDWNujOwN/uAvvKWlE+ZRhV52NKUWaNt3EyYSJqzZp/Vu
	Pt3UmcfJJDNy9i1PUrFvfFs=
X-Google-Smtp-Source: AK7set8Ut3/Y9LvUJ+hO3DZvIn8Kc/+gscdZNV+J6gItynQxMLaCBBgBbP684fnSJO3cRPnf4aLR6w==
X-Received: by 2002:aa7:9533:0:b0:5a8:492d:1eae with SMTP id c19-20020aa79533000000b005a8492d1eaemr4282642pfp.18.1675948630471;
        Thu, 09 Feb 2023 05:17:10 -0800 (PST)
Received: from localhost.localdomain ([47.75.78.161])
        by smtp.gmail.com with ESMTPSA id s4-20020aa78284000000b0057709fce782sm1401414pfm.54.2023.02.09.05.17.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Feb 2023 05:17:10 -0800 (PST)
From: Qinglin Pan <panqinglin00@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	conor@kernel.org,
	ajones@ventanamicro.com,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Qinglin Pan <panqinglin00@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v13 3/3] riscv: mm: support Svnapot in huge vmap
Date: Thu,  9 Feb 2023 21:16:47 +0800
Message-Id: <20230209131647.17245-4-panqinglin00@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209131647.17245-1-panqinglin00@gmail.com>
References: <20230209131647.17245-1-panqinglin00@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_051713_513075_2C888889 
X-CRM114-Status: UNSURE (   9.81  )
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
