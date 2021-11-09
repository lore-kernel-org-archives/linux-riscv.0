Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3784C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:51:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7882761251
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7882761251
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u3nJmjyFcT6xbDxBGIasmmdEJS1990Hzlc9ucYsgzy4=; b=iO9NFMLnHt6t1F
	GJyfxUezPJxQTrbmhOeq9Elo3pfJ0d8o0//wvEhrolbAOyyoB1m6dslb/hNEF4OjxUg5grUWMBTQ/
	2qPfwxKQhi895O20DwTX9m9TDMtOB2kmUVxzZmmiDLbyBZX+5YVBSZrZr0gmOyCJZeDeTe54+FL5Q
	u21c/XilHOVGRKJ1inpGVtKRiQkW2Ud9kRPvp+RsLsNatboyVH1qIZMw6U/gL9kDyBtkaPZGXeW3Q
	pmlQ/FkICMA9VrU3qreBlsLB1EZ1DPo7889OP73ep0oiSN/fPYebibmhZi1b/5sSA2WLKuCXv/3x5
	eq/PFK1ycrQO89sr6Shg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkNmz-001Kev-Oz; Tue, 09 Nov 2021 09:51:37 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkNkA-001JUW-R7
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 09:48:44 +0000
Received: by mail-pl1-x635.google.com with SMTP id n8so19935783plf.4
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 01:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SHTUtS2AqMwL7pythy2uWZaJGxfuuKizfBg8h7XFuhk=;
 b=GTvbZO/Gy+t/HbdqxXnGSSUAYcX19EgyiDh4hSzeDsksdaBW6HwN7DfqsqaO4pey2/
 jTJ9RHZW4nslizMrt1R/QL8IZf5LPZtAeLV9sANL6ww2ozo8lj8EL4aZio924rPaP/IM
 6B5RjEwqDaSqfZadOtwe0nCFHmMRsvQopFZ1T0JhRi3Wo6t5SeUUDkWiNTD2X0Mb6lUh
 xinKcpR9Yyxnk6b53anjGiZTbPyu1gigcVFn4dfoK+OWU+/pe1tDQG2gLHEJvDcHL+CA
 jOt+xmi9YhvrZd2t2q1D/jGaHtsZ6uHek+ITnPfOzOmEx8rSMKBJSo+6ZJwe2VlAqoz6
 d0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SHTUtS2AqMwL7pythy2uWZaJGxfuuKizfBg8h7XFuhk=;
 b=oPYi0A2EJ9qXKcKL53IovRTbZ6ST064NhACXCVP//1ECad67GY/YCXhB7TKHm9a7Wn
 kFYqEWrisxikMDXsOG+Mx6jktsLaITbnjFqQlBySZNQMNV9Vre4oyDGBz+THdTbn828S
 4rR4/z+RBSD5RQeNIZItjCBUWNAewo3sfnZwaHBUOnFhRG0u4nDGCZqKwh0BcXbysf1b
 AuddHH3F52DYOMOhostNy3iOMVjYAUXWwyb1RTgNItLtCLPx5FuIzPAHbFyLY2eW763y
 LRwqDI53NWEXeWHQI+6fsiONsguC81CUO4pRBr4AzzaeO2VzU7agpxya4OalR/o21CWa
 KDag==
X-Gm-Message-State: AOAM530B1KQuMQ3oJh8Z7fNN35Udac/0fvNTvtF+NmEcAqnBliSXbnLN
 OzkznCaw/TmS1m2y50SKJWNcEw==
X-Google-Smtp-Source: ABdhPJz4uumb1qUyFkc+MgaWMH/uDR5/ELb0ybuZChURb8fO/VbIhSArnl8zYY0FjHOCybWkDdacyw==
X-Received: by 2002:a17:90a:9907:: with SMTP id
 b7mr2476181pjp.137.1636451321564; 
 Tue, 09 Nov 2021 01:48:41 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id cv1sm1940511pjb.48.2021.11.09.01.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 01:48:41 -0800 (PST)
From: Greentime Hu <greentime.hu@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu
Subject: [PATCH v9 06/17] riscv: Add has_vector/riscv_vsize to save vector
 features.
Date: Tue,  9 Nov 2021 17:48:18 +0800
Message-Id: <8652c476f08626d52f0412ca1a8427cfe7b4104f.1636362169.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636362169.git.greentime.hu@sifive.com>
References: <cover.1636362169.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_014842_929183_94C30DA9 
X-CRM114-Status: GOOD (  10.08  )
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

This patch is used to detect vector support status of CPU and use
riscv_vsize to save the size of all the vector registers. It assumes
all harts has the same capabilities in SMP system.

[guoren@linux.alibaba.com: add has_vector checking]
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/kernel/cpufeature.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 7069e55335d0..8e7557980faf 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -21,6 +21,11 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 #ifdef CONFIG_FPU
 __ro_after_init DEFINE_STATIC_KEY_FALSE(cpu_hwcap_fpu);
 #endif
+#ifdef CONFIG_VECTOR
+#include <asm/vector.h>
+__ro_after_init DEFINE_STATIC_KEY_FALSE(cpu_hwcap_vector);
+unsigned long riscv_vsize __read_mostly;
+#endif
 
 /**
  * riscv_isa_extension_base() - Get base extension word
@@ -149,4 +154,12 @@ void __init riscv_fill_hwcap(void)
 	if (elf_hwcap & (COMPAT_HWCAP_ISA_F | COMPAT_HWCAP_ISA_D))
 		static_branch_enable(&cpu_hwcap_fpu);
 #endif
+
+#ifdef CONFIG_VECTOR
+	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
+		static_branch_enable(&cpu_hwcap_vector);
+		/* There are 32 vector registers with vlenb length. */
+		riscv_vsize = csr_read(CSR_VLENB) * 32;
+	}
+#endif
 }
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
