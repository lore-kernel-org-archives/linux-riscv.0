Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B38C001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 10:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i6Sc1/LF8kigNqW9yEEVdzhNhLv2VkqwThkdWW9RfUA=; b=j2HqHHjlF+Il/G
	6V+iWxB48BAUm0WENaKjxr5XRQJ73rIx7prH98bg8PaaZQ8w6hIK3DYLQk4/D+GIkfrj6zx862FKl
	o31nlYtnAyftN8K1SGPORgIt5DHY9X5I6sREZW3D8zk9wRFbiJZyWAlXb8f9wqsexqiEbabVmQRzH
	RJgz6oAhecGOIcKylpxQd46asmIKnWAQKdad/xGMcuOYpI89HYZBl0K1AC2Jy96ug19e2mIqx/Gxy
	wiiHA7aLae46x+q+7fyqpHexuYnpgQ0tFZybA6OnipgrNuDOkF0XDhmv+MI2IOynIEgOroHidtEy7
	bK+I/VOYCLbInPERCKXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsQ0-003ZwI-04;
	Mon, 24 Jul 2023 10:03:56 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsPx-003ZvQ-0B
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 10:03:54 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-676f16e0bc4so2317070b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 03:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690193032; x=1690797832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UUcCkSTwYLiD/t1kcQ5bDbSt1mwTfBpcBGNsDxfuBOA=;
        b=CNwx/jLmX1kzvaYEGA/thpQvQrezMQ734fYSg9UAAm6yofFqIEpkSVs/+WHZxynyl2
         Vk5PFfX0aoJHpDT1WSh2FCbYNS80FR1zvpg9Hg6ZufKE2ymwsc4/zCvYErKQsLCNn7Ug
         jAT8y4mbv+syB/ElAFiNUUiItdQdWpKw++rdUy7g6l/G5og8eJf5/OoNKyRUl126Rz3b
         Y90AEXS9SwLiC/i5KoxCrCwfEN0/+GBzo5QUtk+bYLFUDshvh4GM6Q1zeoAd/jUNnSrB
         uSzkC6GecKY8I09698ymosvxd53FxBz0BKxSNBmLzMk9pbEPCaf5Pb/ZJASRb40Lbkx6
         A0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690193032; x=1690797832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UUcCkSTwYLiD/t1kcQ5bDbSt1mwTfBpcBGNsDxfuBOA=;
        b=D6PT5JPiqu96FBtLdMGZxBubjuVVqGMCPfJRJ9DHst+UkenEvmmOESXg756K9bpiqZ
         XIu7jRLHP4pDtFO01ZwXy/6IWNVTn9DBp5j+ngPjg/bQmycDOxuDX+Zh5/mO43dPTZ1j
         I14QHefnOz1aQNzW0xZwb26i+obrRKyXzXx6slx7MWit+Mi6vrsR1oiB2CpQJzclyF2g
         Ry4E928GUlCOK4UDW1WWEHmXv60eI08VS+YEpPOagArIVP4nnIenP0xoJcHEtw4zyob6
         de4gQEMKLjJ/Zb+LwplJvoHChodZPFmmBWotatd8CQ9bG2NJfdvpyrXKGwHQEXCntGyJ
         0NTA==
X-Gm-Message-State: ABy/qLZJKdUryk7/JFdP+dMAuys49s5QHpsp0oL/SzZaDx62l8amXt2q
	dzHY6KV3hHlBfuibmolL+cVJsD/uidbiOJDjqQ0=
X-Google-Smtp-Source: APBJJlF43UAKvGrY1ke4RxpEUoaG1cuBNgNQ+LQfclku2hQlPUblZkiVF3u8/jv+OZzAmqZsogTuIg==
X-Received: by 2002:a05:6a20:a11b:b0:134:d8e6:2717 with SMTP id q27-20020a056a20a11b00b00134d8e62717mr8724991pzk.47.1690193032051;
        Mon, 24 Jul 2023 03:03:52 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.25])
        by smtp.gmail.com with ESMTPSA id l12-20020a62be0c000000b0067459e92801sm7344789pff.64.2023.07.24.03.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 03:03:51 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 -fixes] RISC-V: ACPI: Fix acpi_os_ioremap to return iomem address
Date: Mon, 24 Jul 2023 15:33:46 +0530
Message-Id: <20230724100346.1302937-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_030353_094431_B6826084 
X-CRM114-Status: GOOD (  12.04  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, kernel test robot <lkp@intel.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

acpi_os_ioremap() currently is a wrapper to memremap() on
RISC-V. But the callers of acpi_os_ioremap() expect it to
return __iomem address and hence sparse tool reports a new
warning. Fix this issue by type casting to  __iomem type.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202307230357.egcTAefj-lkp@intel.com/
Fixes: a91a9ffbd3a5 ("RISC-V: Add support to build the ACPI core")
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
Changes since v2:
	1) Removed unnecessary __force.
	2) Removed unnecessary space after cast to fix checkpatch --strict warning.

Changes since v1:
	1) Removed enhancements from the fix patch.

 arch/riscv/include/asm/acpi.h | 2 +-
 arch/riscv/kernel/acpi.c      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index f71ce21ff684..d5604d2073bc 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -19,7 +19,7 @@ typedef u64 phys_cpuid_t;
 #define PHYS_CPUID_INVALID INVALID_HARTID
 
 /* ACPI table mapping after acpi_permanent_mmap is set */
-void *acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
+void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
 #define acpi_os_ioremap acpi_os_ioremap
 
 #define acpi_strict 1	/* No out-of-spec workarounds on RISC-V */
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 5ee03ebab80e..56cb2c986c48 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -215,9 +215,9 @@ void __init __acpi_unmap_table(void __iomem *map, unsigned long size)
 	early_iounmap(map, size);
 }
 
-void *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
+void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
 {
-	return memremap(phys, size, MEMREMAP_WB);
+	return (void __iomem *)memremap(phys, size, MEMREMAP_WB);
 }
 
 #ifdef CONFIG_PCI
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
