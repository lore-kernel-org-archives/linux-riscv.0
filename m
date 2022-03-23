Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E800C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Mar 2022 17:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v+mKwmGk0CoVBGmmxG5gjWMSmEGdvdBQom6pYu1te0g=; b=s3d210bRNvDpvX
	p/l5nmhX5FicEmP+PECpWQlid9PzY2y6/1X0GrYsilIf1uXL7n3a3rR+/jLuSGtxgs1DU1mtAP4xW
	uv1hqI2ATLTJIZ11NSI4+M762nt5hy45Ci6JL7wheCXjW0GMZC9O5wQExUaN7CItmdnYZR6/WAjX0
	V3bEcYGLXDGRNfhNTjAe164YqmZh27770mVomSug7XFSbHO2BVfEYekbHEPW3t8qoNGDVpziPZ+mz
	HZSyw7ZRdA8hSlMgOCWuXo2FCSVB/OPSwEElUGZejhWN3L9o6M19he+YTwIaIIdMWQd4k/b8Tx2Yj
	xGzyAbZ2D4yP1BSbvbCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX4MG-00ELV8-Vx; Wed, 23 Mar 2022 17:01:17 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX4ME-00ELUE-5q
 for linux-riscv@lists.infradead.org; Wed, 23 Mar 2022 17:01:15 +0000
Received: from workstation5.fritz.box
 (ip-088-152-144-107.um26.pools.vodafone-ip.de [88.152.144.107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id A898C3F1B9; 
 Wed, 23 Mar 2022 17:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1648054865;
 bh=VKgkHWla7OPzmk0IPjqkq6YWVZrY8zHcMZMSEH61OSY=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=vx4S+/NBUweSnkdARAwVcnQjLg6/v4u2ucRkREYdXbs/EMTGFgciLKXOMRc+jOp/a
 9nvlEe39JoCVxX275KJmg15iEWJ9LRCRWKE/HsBajGdxU0a0Caz0FY+qc6SDY6//J1
 bE7scMbHZ08H3TS2qnlK8EaVG1eJdG+nKWj4Xk0kjnWwjabcdW1CRtGBRJhYktUI2E
 xf5eA67I6j1twhjX9wrn0lIZpiiNRTgTWTulUvicocjGW0fZyyjOYqifYUXBiApIlO
 NwON3m57ItZ7JhEj8gZ3mk6+nYIwYu6twYU4FlzbIJuZQAQQRGt5rceRoWgIt7j4f0
 vpBYLUrSwESCw==
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, RISC-V SW Dev <sw-dev@groups.riscv.org>,
 RISC-V ISA Dev <isa-dev@groups.riscv.org>,
 tech-unixplatformspec <tech-unixplatformspec@lists.riscv.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH] Fix typos in introduction for RISCV_EFI_BOOT_PROTOCOL
Date: Wed, 23 Mar 2022 18:00:48 +0100
Message-Id: <20220323170048.371365-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220323161604.GA54531@sunil-laptop>
References: <20220323161604.GA54531@sunil-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_100114_532640_6EA0FE99 
X-CRM114-Status: GOOD (  12.54  )
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

UEFI uses to talk of configuration tables not of firmware tables.

Add missing 'the', 'and'.

Enhance readability of sentence concerning ExitBootServices().

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 boot_protocol.adoc | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/boot_protocol.adoc b/boot_protocol.adoc
index 12846b6..5c56edd 100644
--- a/boot_protocol.adoc
+++ b/boot_protocol.adoc
@@ -1,7 +1,7 @@
 [[boot_protocol]]
 == RISCV_EFI_BOOT_PROTOCOL
 Either Device Tree (DT) or Advanced Configuration and Power Interface (ACPI)
-firmware tables are used to convey the information about hardware to the
+configuration tables are used to convey the information about hardware to the
 Operating Systems. Some of the information are known only at boot time and
 needed very early before the Operating Systems/boot loaders can parse the
 firmware tables. 
@@ -9,16 +9,17 @@ firmware tables.
 One example is the boot hartid on RISC-V systems. On non-UEFI systems, this is
 typically passed as an argument to the kernel (in a0). However, UEFI systems need
 to follow UEFI application calling conventions and hence it can not be passed in
-a0. There is an existing solution which uses /chosen node in DT based systems to
-pass this information. However, this solution doesn't work for ACPI based
+a0. There is an existing solution which uses the /chosen node in DT based systems
+to pass this information. However, this solution doesn't work for ACPI based
 systems. Hence, a UEFI protocol is preferred for both DT and ACPI based systems.
 
 This UEFI protocol for RISC-V systems provides early information to the
-bootloaders or Operating Systems. Firmwares like EDK2/u-boot need to implement
-this protocol on RISC-V UEFI systems.
+bootloaders or Operating Systems. Firmwares like EDK2 and u-boot need to
+implement this protocol on RISC-V UEFI systems.
 
-This protocol is typically used by the bootloaders before *ExitBootServices()*
-call and pass the information to the Operating Systems.
+This protocol is typically called by the bootloaders before invoking
+*ExitBootServices()*. They then pass the information to the Operating
+Systems.
 
 The version of RISCV_EFI_BOOT_PROTOCOL specified by this specification is
 0x00010000. All future revisions must be backwards compatible. If a new version
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
