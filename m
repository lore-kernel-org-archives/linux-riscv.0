Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2829C678D5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 07:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2KS0TPoBg0uY7FEBuokmlAxjQsI+U3itaCykhAuqtbA=; b=vNzDSrf3zmIcR9
	MgosIXx822X2ffPF3DbR8XZffYZX9Xv6X855iSbYcvMwwQ6XSn5OSx5Cm6nnoxKUqDFJKOs0OkHKp
	ZK1WJ25zEqXUgt0YJgIbU3WWJBlKeWEecABABLzbakdBzLgZDxjuTSZ7ZBiXTOP/6PE7lnovCajYe
	ikUKP6Qz3y/CDHgLPN684TdvVoiN6FkqUJMHhND3cPO8nxQl9Ewz2naJjpfp7+8JRsng+MHEjLnb7
	NXixdQ5RXoH2A//809vsSkeLsz0HiSu2w7/SyBkFHH+VtCElFvrzmfOX9RvOqv+nlVgSbe/X8P+HB
	iFnSlZuPaGNymqgrykvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZoY9-003qvG-7Z; Wed, 08 Mar 2023 07:49:25 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZoY5-003qtL-NY
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 07:49:23 +0000
Received: by mail-pj1-x1033.google.com with SMTP id y2so15768660pjg.3
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 23:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678261760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xgotHDN0e49gXpXwKyZXNyXlisAljlT8L7zp5O+xgT4=;
        b=OzmD80deviwS26fE80MYDGvWRT4SUtUHmBZX0I5tv/+vtNqn46c0w9uULLhX0WFCZM
         d7OBykhek39DKxM4Aoiq8C/844S32T5ZsoTdPhz7QS+7NqLZ3IU7h70MO64ia03q50MN
         7yjwj+SxZGKoJEmLmaRuCJzm+TubWYdqPamRLW2apQzQtPZZgKNjGsRdvPqXfS+7ZmqA
         mjVjyyy/hV9/vbNh2ElNPh0z0pOGy8kByTm0fh2tZ6iPfplDDc7pJDJE4B3Ed5au8Mgu
         SlX+RNrflt5F8hc0fGeVMlHL1iG46t4IPKGCDJSCVyN85ZYoX5uQhsc5koKgVrQkSbT7
         JohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678261760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xgotHDN0e49gXpXwKyZXNyXlisAljlT8L7zp5O+xgT4=;
        b=keDx/XaOJa9eJcnav19SwkNZK/U5OJAXsrnbu12IIK9IpfqB7t3KTdPyen/BkkfHT9
         cGNs5sfHxP8kxH5CKKLfcxVjyIca7+BTcZvUNNztdVfb1LkPvRo2TJwlSjYZcpvqCiP0
         kn6Pe/m+W7exZDUYSXoOQ6AuVx4bF6/Tc2ZXgagy1Nlbo7CaoTaHxJYLYzYDMPxVURNM
         QT9ZHfx/zWP2ahUZssE2amo2PONEjZEJOkDjcf1K3qIp+hYKzBnTxIrBNWLE4HzK1Any
         Q1NQXvpLtzzZV7zToNdedeGXDp7hdRurhScsqbl10x6ewuxgeGuT5Vc8KQS8a2AqsmDu
         6Bcg==
X-Gm-Message-State: AO0yUKXFOXF34TnQKj4TY3z0MrXEiEurG5fyUCuTuH8Oqt2e0jkAu3Kz
	jKd8GIxSCcjou0pVpPfIwOM=
X-Google-Smtp-Source: AK7set/jCmTlBAKQA5Ice6VzsotaXmH5AO+8lq8/B0DqXqZcKbu0reYg6IyHiqNl09p7E3aVluBheg==
X-Received: by 2002:a05:6a20:a121:b0:cd:87ef:3f1a with SMTP id q33-20020a056a20a12100b000cd87ef3f1amr21163695pzk.3.1678261760020;
        Tue, 07 Mar 2023 23:49:20 -0800 (PST)
Received: from localhost.localdomain ([47.75.78.161])
        by smtp.gmail.com with ESMTPSA id b9-20020aa78109000000b005a8e97fc71bsm8873038pfi.84.2023.03.07.23.49.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 07 Mar 2023 23:49:19 -0800 (PST)
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
Subject: [PATCH v14 3/3] riscv: mm: support Svnapot in huge vmap
Date: Wed,  8 Mar 2023 15:48:53 +0800
Message-Id: <20230308074853.4393-4-panqinglin00@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230308074853.4393-1-panqinglin00@gmail.com>
References: <20230308074853.4393-1-panqinglin00@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_234921_799133_5FF9C5DE 
X-CRM114-Status: GOOD (  10.12  )
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
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
