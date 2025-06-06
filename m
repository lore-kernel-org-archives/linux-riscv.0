Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153F5C5AD49
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 13:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VCkVDLjpbop1mBcESkNmO7MkCIdVcFccEyVkyBC4MjY=; b=AxotS+3EPQtvdX
	2RTfJfTlt/qLlOt4O+m7FELwysjfWqr46104pSWjYuPRloezg25VqwiOdgnuUpOpknpaSpJzzKqAw
	jTijwu+gIYjsMSxO+Mqm3flkCThtyLB5OVcfIcdFD70dknXtr4NuSoupaS5VtD0UMcxkKEtGsIYfg
	5zzr1yl/QwLMv/7uqD0Mc3aPj8+Y+QyBeORW93mNhjj5R0d5fHMAkfC4tQyZnilx7LQfqgTMZlgaZ
	Zod4Br2xtiN9I39qLoBLM0SvuCQr4D2/LnPVEZYDlQRm3cgGEH8HDojvArmqYTAm1ZZHgo0NS97x7
	VFbydcHLKDZbn4/wY2fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNXQe-00000000MyL-2ESZ;
	Fri, 06 Jun 2025 13:48:16 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNXQc-00000000Mx8-0fEt
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 13:48:15 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-74800b81f1bso1757013b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jun 2025 06:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749217693; x=1749822493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kU7d5eZEBEM5ZZef60sJsbo5aCH1yeHkH+fQHK1apWU=;
        b=gPCKzS8RBHAG11+y1I1jvXqHGy/kSRkDK23hjHaurkwGU46LZpQWZ/L0dZ9TT47vgp
         6pBDCpjaYj0V1XKAIQNopUZml3nytnwbEAmI9XzRGW9bEJs+1OSkLDZkefX2FV0vJAbq
         +xZ7FxOUeR3NQqROB8rnWJz9m2xmadAhm5hkOkKEneH/iLiWLmHteKtH95iAmRhnSXMY
         FuVhdFRRMewlaXkwwChVa7dgzrQuSnIHr5FOCyJMcEJAJWsMPDeeV01ZlJ+AUqX9eFD1
         NJ3IxZQE+Cw56o7stxXOI9EkCo3tC+d086F8O82bYxwsSKr6vF+Nh3XD6E4ZTudLuoGP
         /gaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749217693; x=1749822493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kU7d5eZEBEM5ZZef60sJsbo5aCH1yeHkH+fQHK1apWU=;
        b=oi5Mu/xVhq+VWqYUxbuTkZ23SeL1uSPey3oxwgSAhDhcmxp5UxHfz48D/4B2DSmKNM
         P4BQcCzaUEfGu8fx4N9MgJF8lHTW4HqnJ+iS+tXZ8QT2JmLSknRlL56r/KZrUk7hVkWP
         61E7CapfD/+x2ZbkR1RM80ypr1s0ceXOIoUTMXnv9QrldtNAJ1ESLJ2we81sQmTzGt25
         BMasJTFL9oKgLjLRnOP2R8+Z0ww7t8xExxDi0LtfHplb5gjNrjDRo2HhkTUbPQAHLxdI
         IolVV+QxHt4XSKAZoACKHNZ/cVAq5DI0K3tjjz9pdPwenvzO4zzwsqqqUuvP01CJ9vyx
         N0dQ==
X-Gm-Message-State: AOJu0Yyxgc90CnkW4iGUSF+DagDDKOetXuT5HMSlY19qP18f1PfIqB4S
	daErZzOKMMBYIoOYM1jR6Sk9wbzHqM28W9NYWqVBJyvwi1PNqKjToceK
X-Gm-Gg: ASbGncukpYBNgLQxrD1mz39eTZaa77NTL2jAVL90VPPjkSrIaSYsRJdWX1ZewjjURcN
	j/DnGjDNK3thejPdF/k/XUIR+e5CtdSHxCyFsCaGbJwn0rBODGD3NnVEUOt/FRRRhEkruseh7Aq
	BiKpahqKLRoBPRgxbFaO9rgdJG4/d8pDNTPOLDzEJtvzGJ/tlb73HsLyaVuU6y46zY/tosLYH4K
	4lzduRqToCDleNzJ2HhiTA1ZPgJAdNrlEYNtsTJfhWty5mN/Rcz8YbUlqWcKwjAMpeFuF35RMzJ
	huQKDf/Kjc9rl54/OYCW2M/96S5Oe6/yRBgBIocaLHOb7yGK17qWKpqrucU5b6Q40ssIyZMg6Rm
	3zhma3pDAS0hxS0in
X-Google-Smtp-Source: AGHT+IGDoK2JlG7KoYJ5vVkB4BKmEp/jqZJehdcJafNyJAIF9KFDbi3qeJO0gnBEIMGaNHfzjrn6Og==
X-Received: by 2002:a05:6a00:10d3:b0:736:51ab:7aed with SMTP id d2e1a72fcca58-748280aca00mr4408977b3a.16.1749217693258;
        Fri, 06 Jun 2025 06:48:13 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c1168sm1296798b3a.136.2025.06.06.06.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 06:48:12 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	akpm@linux-foundation.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v3 3/3] riscv: Optimize gcd() performance on RISC-V without Zbb extension
Date: Fri,  6 Jun 2025 21:47:58 +0800
Message-Id: <20250606134758.1308400-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606134758.1308400-1-visitorckw@gmail.com>
References: <20250606134758.1308400-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_064814_196615_60C46A76 
X-CRM114-Status: GOOD (  11.93  )
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

The binary GCD implementation uses FFS (find first set), which benefits
from hardware support for the ctz instruction, provided by the Zbb
extension on RISC-V. Without Zbb, this results in slower
software-emulated behavior.

Previously, RISC-V always used the binary GCD, regardless of actual
hardware support. This patch improves runtime efficiency by disabling
the efficient_ffs_key static branch when Zbb is either not enabled in
the kernel (config) or not supported on the executing CPU. This selects
the odd-even GCD implementation, which is faster in the absence of
efficient FFS.

This change ensures the most suitable GCD algorithm is chosen
dynamically based on actual hardware capabilities.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 arch/riscv/kernel/setup.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index f7c9a1caa83e..785c7104fde7 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -21,6 +21,8 @@
 #include <linux/efi.h>
 #include <linux/crash_dump.h>
 #include <linux/panic_notifier.h>
+#include <linux/jump_label.h>
+#include <linux/gcd.h>
 
 #include <asm/acpi.h>
 #include <asm/alternative.h>
@@ -361,6 +363,9 @@ void __init setup_arch(char **cmdline_p)
 
 	riscv_user_isa_enable();
 	riscv_spinlock_init();
+
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_ZBB) || !riscv_isa_extension_available(NULL, ZBB))
+		static_branch_disable(&efficient_ffs_key);
 }
 
 bool arch_cpu_is_hotpluggable(int cpu)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
