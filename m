Return-Path: <SRS0=1/OQ=MG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394BEC07E9A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jul 2021 13:55:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE20E613BF
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jul 2021 13:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE20E613BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uf0x6LinXh3lsnu8dx1uSyv0HJDERIdSbhuJmKO2378=; b=KwAMaHg4wNccUn
	+Rxkq+Gncmnem9i/ZUKNcI+rOom37J1I8nvAHF7MSjePDkTUOjlnUT+96lECngiFN6Lht76UBMdk7
	pXT5VYFjXsCKuF7KGZlxkS30wEhSuZ+x045iyoscmG/n/zyqFbt66rxWcnz7VkqY/pqFZh97p4hFm
	GjiqLZeonJiQSi18Y5oQDHFIXDVTH7y6Rg8g8jsCI6Qy4JTsuVCc5XW9X5Qe2lVnLETS/C35W1E+W
	OldnLtUtoCR5kq8XTthO98s9BnJWtqmdxnxwvmNpHnXOBDmi9q/+U/Af5M7RSixM2sEl/IGvC3/CJ
	HT3j0HlIW3pfr4QgZ26Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3fMO-00Djsw-3B; Wed, 14 Jul 2021 13:55:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3fM5-00Djks-P9
 for linux-riscv@bombadil.infradead.org; Wed, 14 Jul 2021 13:55:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=SkgOQwJHsjHckAlHFWY8NOwsNPVW4OhOBxloJ5jOkmM=; b=RvpaWwYt4y49PV4yMpd/aGwiyx
 pOqqomgHsEUV6LBAe+s6BsAtuQVUat1Byx4zAaec80xXRthXbmB/UuciLiOdM43kF5QhqUxcfqtUt
 SelMevxiETyxCpD6YALmDvBItGMoTPo9IeH9ex9lwxCwyT+NMzL5p7RkjQ/G40wYwEA1l96fy0cka
 9uG2dIqHMmhRQKHEv+wB5rUGiN/wPVh+q4pcr5BpY3rgHtXzScBUptmxZjybGPXeTrMC6UfrNv8Y7
 SCelYJgnhqLgLh8rl/2tm8+g1W75BAQspwVeWiSVS/r5owF2MrX9e8EVNsBTm9PCij24BwOiR7nMA
 lkBzPs0A==;
Received: from newton.telenet-ops.be ([195.130.132.45])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3eLn-00HUAY-2o
 for linux-riscv@lists.infradead.org; Wed, 14 Jul 2021 12:50:59 +0000
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by newton.telenet-ops.be (Postfix) with ESMTPS id 4GPy6M5SbLzMrC1n
 for <linux-riscv@lists.infradead.org>; Wed, 14 Jul 2021 14:50:51 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
 by andre.telenet-ops.be with bizsmtp
 id V0qW2500Y1ccfby010qWp4; Wed, 14 Jul 2021 14:50:47 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m3eLO-0018dS-Kf; Wed, 14 Jul 2021 14:50:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m3eLN-00AaEX-RP; Wed, 14 Jul 2021 14:50:29 +0200
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
Subject: [PATCH v4 07/10] arm64: kdump: Remove custom linux, elfcorehdr parsing
Date: Wed, 14 Jul 2021 14:50:17 +0200
Message-Id: <65b6e3294cb84d50a6aab8503a9ebcf41445166d.1626266516.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626266516.git.geert+renesas@glider.be>
References: <cover.1626266516.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_135055_240558_B177183F 
X-CRM114-Status: GOOD (  11.75  )
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

Remove the architecture-specific code for parsing the "linux,elfcorehdr"
property under the "/chosen" node in DT, as the platform-agnostic
handling in the FDT core code already takes care of this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - s/handlng/parsing/ in patch description.
---
 arch/arm64/mm/init.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 8490ed2917ff2430..946e246660f2b180 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -125,25 +125,6 @@ static void __init reserve_crashkernel(void)
 #endif /* CONFIG_KEXEC_CORE */
 
 #ifdef CONFIG_CRASH_DUMP
-static int __init early_init_dt_scan_elfcorehdr(unsigned long node,
-		const char *uname, int depth, void *data)
-{
-	const __be32 *reg;
-	int len;
-
-	if (depth != 1 || strcmp(uname, "chosen") != 0)
-		return 0;
-
-	reg = of_get_flat_dt_prop(node, "linux,elfcorehdr", &len);
-	if (!reg || (len < (dt_root_addr_cells + dt_root_size_cells)))
-		return 1;
-
-	elfcorehdr_addr = dt_mem_next_cell(dt_root_addr_cells, &reg);
-	elfcorehdr_size = dt_mem_next_cell(dt_root_size_cells, &reg);
-
-	return 1;
-}
-
 /*
  * reserve_elfcorehdr() - reserves memory for elf core header
  *
@@ -154,8 +135,6 @@ static int __init early_init_dt_scan_elfcorehdr(unsigned long node,
  */
 static void __init reserve_elfcorehdr(void)
 {
-	of_scan_flat_dt(early_init_dt_scan_elfcorehdr, NULL);
-
 	if (!elfcorehdr_size)
 		return;
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
