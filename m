Return-Path: <SRS0=OQtk=I7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D40C43603
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 15:19:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BACA61056
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 15:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BACA61056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Cc:To:Subject:From:References:In-Reply-To:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d7wHaaoPyRhov7LpDsYoaMIwxGkSjRowZ7BedDj0n3c=; b=At/hA84T8GVIOMPfZsjx62bIiw
	tClIBrnBxgkd1mlm9DCm4DPYM9mQq24T0MrkLmw6e7wpLYv6oyAvF3gI3L7FfL8h+ymEaIN8KHMMS
	Z6rMW70G5QJr+8JjuQbtjQ/UQaRvsRPiQ64+O4W9lVSDSctqZkzfC4NF9fqL1mgXHQqRyRh8YdY4Q
	yrt/ecUM+AT/FjOOwLLuYC08IaJg3EH63FIM+bs8jeAyIEQTQZFgs5idDXi6EVsBkCk1RxhdrtxTP
	efAxrit6qkjeilalHOUypK4Zm7unNsDhohM0ue3BFuxyloSVBuTGYgEX3RYl9pzJdYPSXVjOrvIFl
	14YlWMXQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSLZc-00DCfF-N9; Fri, 02 Apr 2021 15:19:00 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSLYm-00DCNe-0Q; Fri, 02 Apr 2021 15:18:10 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkFl3Jq5z9v2m1;
 Fri,  2 Apr 2021 17:18:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id otY6ACZI1rY1; Fri,  2 Apr 2021 17:18:03 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkFl2Mpwz9v2ls;
 Fri,  2 Apr 2021 17:18:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 33C168BB7B;
 Fri,  2 Apr 2021 17:18:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id j0ftI9D6qL0u; Fri,  2 Apr 2021 17:18:05 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A27078BB79;
 Fri,  2 Apr 2021 17:18:04 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 7ECCA67989; Fri,  2 Apr 2021 15:18:04 +0000 (UTC)
Message-Id: <76542a49b685ddb41894fd53feb250fcec731b01.1617375802.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 03/20] x86/efi: Replace CONFIG_CMDLINE_OVERRIDE by
 CONFIG_CMDLINE_FORCE
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org
Cc: linux-arch@vger.kernel.org, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 microblaze <monstr@monstr.eu>, linux-mips@vger.kernel.org,
 nios2 <ley.foon.tan@intel.com>, openrisc@lists.librecores.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org
Date: Fri,  2 Apr 2021 15:18:04 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_161808_606665_6FBFB058 
X-CRM114-Status: GOOD (  14.33  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

During boot, x86 uses EFI driver. That driver is also used
by ARM.

In order to refactor the command line processing in that driver
in a following patch, rename CONFIG_CMDLINE_OVERRIDE by
CONFIG_CMDLINE_FORCE on the x86 in order to be similar
to ARM (and most other architectures).

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v4: New
---
 arch/x86/Kconfig                        | 4 ++--
 arch/x86/kernel/setup.c                 | 2 +-
 drivers/firmware/efi/libstub/x86-stub.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 2792879d398e..a20684d56b4b 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2384,14 +2384,14 @@ config CMDLINE
 	  command line at boot time, it is appended to this string to
 	  form the full kernel command line, when the system boots.
 
-	  However, you can use the CONFIG_CMDLINE_OVERRIDE option to
+	  However, you can use the CONFIG_CMDLINE_FORCE option to
 	  change this behavior.
 
 	  In most cases, the command line (whether built-in or provided
 	  by the boot loader) should specify the device for the root
 	  file system.
 
-config CMDLINE_OVERRIDE
+config CMDLINE_FORCE
 	bool "Built-in command line overrides boot loader arguments"
 	depends on CMDLINE_BOOL && CMDLINE != ""
 	help
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index d883176ef2ce..6f2de58eeb54 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -884,7 +884,7 @@ void __init setup_arch(char **cmdline_p)
 	bss_resource.end = __pa_symbol(__bss_stop)-1;
 
 #ifdef CONFIG_CMDLINE_BOOL
-#ifdef CONFIG_CMDLINE_OVERRIDE
+#ifdef CONFIG_CMDLINE_FORCE
 	strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
 #else
 	if (builtin_cmdline[0]) {
diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
index f14c4ff5839f..28659276b6ba 100644
--- a/drivers/firmware/efi/libstub/x86-stub.c
+++ b/drivers/firmware/efi/libstub/x86-stub.c
@@ -742,7 +742,7 @@ unsigned long efi_main(efi_handle_t handle,
 		goto fail;
 	}
 #endif
-	if (!IS_ENABLED(CONFIG_CMDLINE_OVERRIDE)) {
+	if (!IS_ENABLED(CONFIG_CMDLINE_FORCE)) {
 		unsigned long cmdline_paddr = ((u64)hdr->cmd_line_ptr |
 					       ((u64)boot_params->ext_cmd_line_ptr << 32));
 		status = efi_parse_options((char *)cmdline_paddr);
-- 
2.25.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
