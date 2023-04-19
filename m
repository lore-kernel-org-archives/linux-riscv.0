Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AE7C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jn/tzlhevHPlKDQf1k9u2FtqwzmEahcNwa2FDWJ3tuE=; b=I65Fx95DeutWJ3
	HjQoUyRkCIsJGvIQJyayMxUQKUrWt+dKFexnMzeZrlcrNXmuyINbH3phAeXM7OsSYZm5Q8FBlrz1U
	jhkaDYSZHgeDTAlGdeZoI5kLZMEMWU9oDSysyDXAx/NttAVIY6SmFbiagwzt1PFGX5f382iLsbKiE
	tzy9BV3g+Cn2rQhZ3wgpoHxJgM34sa3F9uptK6T4K5VaaEUzVYNykguB5YiS9cwLkJyAw6IMvvcY5
	FNd9304layyZzZFDKmEvlfJO4r+P2rVRSyb2lK/5eAUK0HTxqwCygVqsoLhVe3Dlgm9A8iGFFHwPG
	4D590GnIixd/pCGM+i6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGEW-006V0O-1U;
	Wed, 19 Apr 2023 22:25:00 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGET-006UzR-2z
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:24:59 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6a60460a23dso307202a34.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681943096; x=1684535096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8vKC+DATLxW+QWgEBtVVKhLwPezg/zgsscm2TPJ1sU=;
        b=VQdfMegg0sotRUdUBMTnRu/PoUpfepJVSIVszY0v5nY2tBbv0V9zTwYG1M9RQVUUHf
         wSAAM2OycooUxPKB+ectrhrNclJs+GFx1PaBr2OFw8YbkY5UsJBLwzZMzoteEfTEqd5Y
         KZzAHqRGBnCCVCNcaR6eLlUbBlIv6w1OatwOXO9/nD8Z5G877MgPmpoV7ieCBMtugPs9
         g739nNPT520xRNBH+mCMsniAFe2Okvc+gk+b4mtnfXJnKP2MiTKlSctEliGWXjTPI2pi
         WNInFt91QRPPcJ5BHrx4MzAcZDYKN/79L75Lgh6r7qkyHqlyTMMOzaBz6tzaY2Ix4ReO
         QpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943096; x=1684535096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8vKC+DATLxW+QWgEBtVVKhLwPezg/zgsscm2TPJ1sU=;
        b=X8v0MwrWpyRgaHwTqjt0nUed3gYs4Senh03wlNg3TdRZkaxh78+ry1Ahprl8Uu+Ump
         WL8EkgG7RCcukj6eACQhARNGsSm/NnFKECAcquttZSyaIMFcNkIfc5wru6bx0D/QXydJ
         f3E0WjvDQbgFTeqoVYngXoa25Z357GFpCwOkT9uD/ct0Hjd5WzybdJkXVQ+A1Yxf21qW
         kZkantp8uplUn6EtzF11GvqnDPI9Na9DO0l14FHJLE/BqPZj9gxQKkwdqJm/vyt2Cf5V
         GqGT94+vToBk5UuZFelGEfk8Tm9re036xPzRlweotsEC5QRRq5+/dae0zH+dw/lCvJNT
         doxw==
X-Gm-Message-State: AAQBX9dLXfvSp7gnbIONvKZuH3qaxLurqcjsaSPXQZfkoJT0JDTlttuM
	vugdXnMwM/OR/jVJWYOq27xyUcgp4ze5GgvEPtQ=
X-Google-Smtp-Source: AKy350YMt1GXaXJLEtI/tcFCT7P2BRkKgLnzDade8rOaHZzTbglX9T86uEwEdM3HEdy8DD35oL3itg==
X-Received: by 2002:a17:903:3013:b0:1a2:8940:6da4 with SMTP id o19-20020a170903301300b001a289406da4mr5416617pla.29.1681942749582;
        Wed, 19 Apr 2023 15:19:09 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:19:09 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 45/48] RISC-V: ioremap: Implement for arch specific ioremap hooks
Date: Wed, 19 Apr 2023 15:17:13 -0700
Message-Id: <20230419221716.3603068-46-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_152457_963403_1A2CDE31 
X-CRM114-Status: GOOD (  14.50  )
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

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

The guests running in CoVE must notify the host about its mmio regions
so that host can enable mmio emulation.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/mm/Makefile  |  1 +
 arch/riscv/mm/ioremap.c | 45 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 arch/riscv/mm/ioremap.c

diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 1fd9b60..721b557 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -15,6 +15,7 @@ obj-y += cacheflush.o
 obj-y += context.o
 obj-y += pgtable.o
 obj-y += pmem.o
+obj-y += ioremap.o
 
 ifeq ($(CONFIG_MMU),y)
 obj-$(CONFIG_SMP) += tlbflush.o
diff --git a/arch/riscv/mm/ioremap.c b/arch/riscv/mm/ioremap.c
new file mode 100644
index 0000000..0d4e026
--- /dev/null
+++ b/arch/riscv/mm/ioremap.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 Rivos Inc.
+ *
+ * Authors:
+ *     Rajnesh Kanwal <rkanwal@rivosinc.com>
+ */
+
+#include <linux/export.h>
+#include <linux/mm.h>
+#include <linux/vmalloc.h>
+#include <linux/io.h>
+#include <asm/covg_sbi.h>
+#include <asm/cove.h>
+#include <asm-generic/io.h>
+
+void ioremap_phys_range_hook(phys_addr_t addr, size_t size, pgprot_t prot)
+{
+	unsigned long offset;
+
+	if (!is_cove_guest())
+		return;
+
+	/* Page-align address and size. */
+	offset = addr & (~PAGE_MASK);
+	addr -= offset;
+	size = PAGE_ALIGN(size + offset);
+
+	sbi_covg_add_mmio_region(addr, size);
+}
+
+void iounmap_phys_range_hook(phys_addr_t addr, size_t size)
+{
+	unsigned long offset;
+
+	if (!is_cove_guest())
+		return;
+
+	/* Page-align address and size. */
+	offset = addr & (~PAGE_MASK);
+	addr -= offset;
+	size = PAGE_ALIGN(size + offset);
+
+	sbi_covg_remove_mmio_region(addr, size);
+}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
