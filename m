Return-Path: <SRS0=KIN4=F6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0B3C433DB
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Dec 2020 16:33:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D1E7217A0
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Dec 2020 16:33:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D1E7217A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=auiiJxzukjLkZ3cP78w3mXHlJjk63Tx9RarQ8ggNBVw=; b=p5qKbtjaGeAD2+YuC7s7qHiOHt
	Ev5QZKAe6TILYgv0KWHZRC6ZvrjMiEaIKH7nSA5TaGsuTf/6NtMUwi0TLJJiitPH+2P4w/8Z2REkN
	rENw0/jAQNWqQMWiyFv1P45iPs/XbV3zJawbtILmMo+YesmfHpB7O6+jZDz4JLSoKjBAicrbqoiUy
	oe4/yGsubqJDd2uPjwfnZipsM1ljXncNiipUBbL8wr7MQSVSWQ0xSKTLOZ3F8yvs5cUS0U8UZgZme
	ar0ax9xnOVYr153XE4YB7OSI5q+fuEKT9w/uomS9AU5IL5WFH89hmiGWvBimussFMmKXoMQ+rRfgW
	4Dc5+jdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktCVF-0005Cl-Up; Sat, 26 Dec 2020 16:33:13 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktCVC-0005CE-SF
 for linux-riscv@lists.infradead.org; Sat, 26 Dec 2020 16:33:11 +0000
Received: by mail-wm1-x335.google.com with SMTP id c124so5652869wma.5
 for <linux-riscv@lists.infradead.org>; Sat, 26 Dec 2020 08:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gtpkeBVz5MREbJ4Hh4ldSey/zkGfhttgVGvyAUtLQ9o=;
 b=nsK5M8nz/VjeGsXTO6OlT+E3dnqJjuzsIRdYtR6PlPUDqdCDN3yCv6jqWygj6PLHjE
 ZSALb7CkX5KZG8SOH52v2VLIZguJ50ITS96gTh77X0LJ7l+SWt/QbV8E63X2YnRgQSZE
 6G5jvxVyoCUfMVlps4Y2zq3IDzS+1csIxUclM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gtpkeBVz5MREbJ4Hh4ldSey/zkGfhttgVGvyAUtLQ9o=;
 b=Jc2wamEjp0FBPQMj4/CeenpWpR5tX5Q77pbWLHSb+UJUNNpa6xSWo3Cy5CcjL5ELoW
 U36rdT6fDeu4kcv6s4gfth6y4AzU2bg+O6nrMBzi0twsnzbHCavhCThwPIxOyHnGnK5m
 oaEAv7tSjbVOXtZpQ9iGXvH8EMRlWGM2MGv/3OlVnhPLwt/P3n0laKp24ERdOkvq1+7a
 8SvVGEJovICRkSzoohLHgVLwUkShzCshsnOslEI6n/tgf714B0esY/mECeujgOYAa0Wh
 PtF2hdJmaqcPbXNvNALcZHj99FFqeS2pFCfRg8fccsfpUkLTciNVN1uealvHdrbTZ+yS
 jlEw==
X-Gm-Message-State: AOAM531UcECejg7ajLmjvPEwuqr7aTjK+t0rWLTL0wZsleLY3wj8GVAd
 8EzWWyJqsXQSlNSGk+8bz7mz4VGvJCgrn60w
X-Google-Smtp-Source: ABdhPJwj20fCyOf4J8xCHJKDZdEjK/pMUpvZ5ueQPVxSkNMqC94ou5zgiSv6fCXwp7uWbqaG0FsL1A==
X-Received: by 2002:a1c:4b10:: with SMTP id y16mr13184416wma.73.1609000387485; 
 Sat, 26 Dec 2020 08:33:07 -0800 (PST)
Received: from lootbox.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
 by smtp.gmail.com with ESMTPSA id r20sm52270387wrg.66.2020.12.26.08.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Dec 2020 08:33:06 -0800 (PST)
From: Vitaly Wool <vitaly.wool@konsulko.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: add BUILTIN_DTB support for MMU-enabled targets
Date: Sat, 26 Dec 2020 18:30:38 +0200
Message-Id: <20201226163037.43691-1-vitaly.wool@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201226_113311_025690_3EA8AD43 
X-CRM114-Status: GOOD (  15.07  )
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
Cc: devicetree@vger.kernel.org, damien.lemoal@wdc.com,
 Bin Meng <bin.meng@windriver.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-kernel@vger.kernel.org,
 Vitaly Wool <vitaly.wool@konsulko.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Sometimes, especially in a production system we may not want to
use a "smart bootloader" like u-boot to load kernel, ramdisk and
device tree from a filesystem on eMMC, but rather load the kernel
from a NAND partition and just run it as soon as we can, and in
this case it is convenient to have device tree compiled into the
kernel binary. Since this case is not limited to MMU-less systems,
let's support it for these which have MMU enabled too.

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
---
 arch/riscv/Kconfig   |  1 -
 arch/riscv/mm/init.c | 12 ++++++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 2b41f6d8e458..9464b4e3a71a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -419,7 +419,6 @@ endmenu
 
 config BUILTIN_DTB
 	def_bool n
-	depends on RISCV_M_MODE
 	depends on OF
 
 menu "Power management options"
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 87c305c566ac..5d1c7a3ec01c 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -194,12 +194,20 @@ void __init setup_bootmem(void)
 	setup_initrd();
 #endif /* CONFIG_BLK_DEV_INITRD */
 
+	/*
+	 * If DTB is built in, no need to reserve its memblock.
+	 * OTOH, initial_boot_params has to be set to properly copy DTB
+	 * before unflattening later on.
+	 */
+	if (IS_ENABLED(CONFIG_BUILTIN_DTB))
+		initial_boot_params = __va(dtb_early_pa);
+	else
+		memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
+
 	/*
 	 * Avoid using early_init_fdt_reserve_self() since __pa() does
 	 * not work for DTB pointers that are fixmap addresses
 	 */
-	memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
-
 	early_init_fdt_scan_reserved_mem();
 	dma_contiguous_reserve(dma32_phys_limit);
 	memblock_allow_resize();
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
