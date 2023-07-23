Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0FEC001DC
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Jul 2023 19:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qrU4r0IpBoRyde90h1RtiEFmTWQbv3lyVV3tg7af6hg=; b=gwG3bmOd+h4MoA
	TjUTr8RRGT803Amlysi5zRk2P5b1vPLhr18MKc0F15vxcLlYOfy6t/2LMiTFraq4Evg36Qj9hBvY4
	szF/DlPFfvC4u9AzBlPSXJ/j8+iIv3L7/WVsdivnsZ+KjvQ30oCNe4y0Z4tYQGuEyDoy/nfdaqg+g
	8FDbBs9ZD1OBAzPeWlVgu3uGLpkACc2zQ6wEB0/9l0kK6Hec7kJm7y2A8uMvbBQFPyVlCq73TBFeO
	iXTgHtdFiuM2fnz6m4GPbrYp90Jj+LgqltYqimEIG+z2KWUBuLjYyN+bhjBH7U56KNE3b1fvIpGKE
	8I9sJrmsj+JcbpPqiKcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNeaz-001gHx-06;
	Sun, 23 Jul 2023 19:18:21 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNeav-001gGq-09
	for linux-riscv@lists.infradead.org;
	Sun, 23 Jul 2023 19:18:18 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1b89cfb4571so29612835ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 23 Jul 2023 12:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690139895; x=1690744695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pW/D68CVUATDRvkkjfDHL+y9HJPS05BTKqrSEexxpog=;
        b=S4mbzqkyBOsbsoQQ28NtKbuZQoLczx3V7rt47BuYtA6nNDw1b8k0dDBQq1WvMmftYu
         ZtHDIrrjgIKDFhVbESxIkTD5yG4KPUWjw1A5SINWXZlrkC5YJ+by0mXd8PPux7hkjMwZ
         P/KjGym1/AaFTLnf1m3f2NwOftCPWfENn0oeyrxzpr0xD4FjYhhKx6qunB6S6NnGe2Cy
         rlW13aUC+J0c27hbQO+3xXcvKXx4mSh4Az3Gg9BNNHw4BCgzkgW5Cg7ba93kfn/VM7NC
         Qv8/Kdr9XkXhrIXz76SCkuF3veGgb7SIo1UJm+A7Khx6+RIRWq8lCN0rdis/9XQ/TYKZ
         hm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690139895; x=1690744695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pW/D68CVUATDRvkkjfDHL+y9HJPS05BTKqrSEexxpog=;
        b=bCNxkXcQ6aXx9pezO9J3nKOm1nwi3NwrMeioSfAjfOXm4WAt3ke6dvWrKjlYjXjEmC
         czErzTujLPhPyIYb+ABmYGTb/PdXNI6f9kdzrhR/iqXuOlPxCjAOxwPQuUHb0IHrbeue
         I6ESIIjH/1wPv4rgafyEbuFq/9699iN0c+9qib/2angoTpgT3cPP9fwH9uAcIjyZB2bJ
         pKD6ZSpWAWXA5QrrRHPdAMmJS4ARRTT1WBX/wKpFkb3b2Wk06Jah7dpMlsE/jqMQa2KU
         1BGYcksid6t7Q6TkVatUCNZrw92EmvUfk6UBepVqIH+nIuaUabyHvtGaLWP9dwTeFZGT
         njsw==
X-Gm-Message-State: ABy/qLaTWDSpTN/TClQsRD4XQuMIBFInA/zWSpDCdP85yKoiGIQQLb3D
	BXmZVjvH/hFwbwjvvj/NxVIRd7fEyQq5XY1C7Os=
X-Google-Smtp-Source: APBJJlH/dUeOgWFZp3VoB+w/4CrifL2iv7H2FX3MX6Ad+5talhr/ouM9nYEFlrcpqswE8mkPN38a6g==
X-Received: by 2002:a17:902:ec83:b0:1b8:b41e:66b4 with SMTP id x3-20020a170902ec8300b001b8b41e66b4mr10434855plg.67.1690139895538;
        Sun, 23 Jul 2023 12:18:15 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.25])
        by smtp.gmail.com with ESMTPSA id s7-20020a170902988700b001b9e86e05b7sm7235508plp.0.2023.07.23.12.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 12:18:15 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 -fixes] RISC-V: ACPI: Fix acpi_os_ioremap to return iomem address
Date: Mon, 24 Jul 2023 00:47:58 +0530
Message-Id: <20230723191758.1262960-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_121817_117160_44BB3225 
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
index 5ee03ebab80e..e6fdb9edcdd9 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -215,9 +215,9 @@ void __init __acpi_unmap_table(void __iomem *map, unsigned long size)
 	early_iounmap(map, size);
 }
 
-void *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
+void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
 {
-	return memremap(phys, size, MEMREMAP_WB);
+	return (__force void __iomem *) memremap(phys, size, MEMREMAP_WB);
 }
 
 #ifdef CONFIG_PCI
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
