Return-Path: <SRS0=1/OQ=MG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61AE4C07E9A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jul 2021 14:01:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CF6E613C3
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jul 2021 14:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CF6E613C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2YAiv8uzszSYXV4ECyvrdSI3B/ZfPwfrug38N6iXrs=; b=lvhAMYQO7Lkcsj
	CBfP8sVm7mP4ZayrXqHpAF43eb3fz+QJZXi0z5dG/NcA8A+jIcgkqb85MmZSokieKTcVtcBpmMn1u
	GOboO5lTBm7TXeyFyACYdLwvQPPMrhsefcEdacOMJBHgc5fL4RbfmqAasCbAU+ML2fdAFdGpa9i2h
	+qbG3JJ9Q8rMa/72bMt/qr9HLegZjnILf5llONbMbGSFzJdJ5oHFtvq78fgMAZUZ12YOISmIJVAUq
	tru2jWXlmlUXLdXVrynQdkU1+ePAmhZUAxfkrWeF5p2vsdSkqyIjxB/CqwIYAi15FmCtbsBDr1hlB
	3fZWCeb0zCq0Jnx3VPSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3fRN-00DllP-Qi; Wed, 14 Jul 2021 14:00:45 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3eLi-00DbFh-Ss
 for linux-riscv@lists.infradead.org; Wed, 14 Jul 2021 12:50:53 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
 by xavier.telenet-ops.be with bizsmtp
 id V0qW2500U1ccfby010qW5T; Wed, 14 Jul 2021 14:50:46 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m3eLO-0018dV-Ab; Wed, 14 Jul 2021 14:50:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m3eLN-00AaEl-Sn; Wed, 14 Jul 2021 14:50:29 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Nicolas Pitre <nico@fluxnic.net>, Ard Biesheuvel <ardb@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Nick Kossifidis <mick@ics.forth.gr>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Frank Rowand <frowand.list@gmail.com>, Dave Young <dyoung@redhat.com>,
 Mike Rapoport <rppt@kernel.org>
Cc: Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 kexec@lists.infradead.org, linux-mm@kvack.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 09/10] arm64: kdump: Use IS_ENABLED(CONFIG_CRASH_DUMP)
 instead of #ifdef
Date: Wed, 14 Jul 2021 14:50:19 +0200
Message-Id: <767e34a7ec29c417fdd5ff6e0fc76bc93d4f3c6f.1626266516.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626266516.git.geert+renesas@glider.be>
References: <cover.1626266516.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_055051_255214_05143260 
X-CRM114-Status: GOOD (  12.37  )
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

Replace the conditional compilation using "#ifdef CONFIG_CRASH_DUMP" by
a check for "IS_ENABLED(CONFIG_CRASH_DUMP)", to increase compile
coverage and to simplify the code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - New.
---
 arch/arm64/mm/init.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index f90ba99437c0f3c9..dc2a5b73232843e4 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -124,7 +124,6 @@ static void __init reserve_crashkernel(void)
 }
 #endif /* CONFIG_KEXEC_CORE */
 
-#ifdef CONFIG_CRASH_DUMP
 /*
  * reserve_elfcorehdr() - reserves memory for elf core header
  *
@@ -135,7 +134,7 @@ static void __init reserve_crashkernel(void)
  */
 static void __init reserve_elfcorehdr(void)
 {
-	if (!elfcorehdr_size)
+	if (!IS_ENABLED(CONFIG_CRASH_DUMP) || !elfcorehdr_size)
 		return;
 
 	if (memblock_is_region_reserved(elfcorehdr_addr, elfcorehdr_size)) {
@@ -148,11 +147,6 @@ static void __init reserve_elfcorehdr(void)
 	pr_info("Reserving %lldKB of memory at 0x%llx for elfcorehdr\n",
 		elfcorehdr_size >> 10, elfcorehdr_addr);
 }
-#else
-static void __init reserve_elfcorehdr(void)
-{
-}
-#endif /* CONFIG_CRASH_DUMP */
 
 /*
  * Return the maximum physical address for a zone accessible by the given bits
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
