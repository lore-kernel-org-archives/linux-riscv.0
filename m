Return-Path: <SRS0=j3hv=GH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B20BDC433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jan 2021 20:04:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49FC52085B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jan 2021 20:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49FC52085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=st5lVm3jTR6LcXhjji0jcF2vA2hbduWo10tz+KbNQUA=; b=foSELO1iHvO+Ei/x6sXNeU8j+
	0g+PmuffEhhnZXZMbnpqTX2k0hli196/wbMe9twNvkzkcu21DE+vkeBNRwCA7R2txyudG92jffCQi
	GPw6hjC1YS8N7cWHHKKrF0/hY9hgXsPZM7Afz+f6JN3aJe1nNUv9iEAQ0EhAFFcuPojAN2h7mQ6DP
	4FxwPjxFK1NkLNGM8FvMTSVloy0KaDSgqk9sjeuJUB6epwQWfiDD3giTXIk0vH8jmAndrSruU1bcj
	iLPQ9hsWmEu/F6W/1NBkP4hJtj3L+pW7dkTo3Tmnm3O6PvQ/ytvJXA5D7TWEQIGhMo8GQILhbOlAr
	thb7SOmAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwW5O-0007ss-6z; Mon, 04 Jan 2021 20:04:14 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwW5M-0007rr-1p
 for linux-riscv@lists.infradead.org; Mon, 04 Jan 2021 20:04:12 +0000
X-Originating-IP: 90.112.190.212
Received: from debian.home (lfbn-gre-1-231-212.w90-112.abo.wanadoo.fr
 [90.112.190.212]) (Authenticated sender: alex@ghiti.fr)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id CA64720002;
 Mon,  4 Jan 2021 20:04:08 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Anup Patel <anup@brainfault.org>, Christoph Hellwig <hch@lst.de>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-efi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 05/12] riscv: Simplify MAXPHYSMEM config
Date: Mon,  4 Jan 2021 14:58:33 -0500
Message-Id: <20210104195840.1593-6-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210104195840.1593-1-alex@ghiti.fr>
References: <20210104195840.1593-1-alex@ghiti.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_150412_191201_AAF8528C 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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
Cc: Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Either the user specifies maximum physical memory size of 2GB or the
user lives with the system constraint which is 1/4th of maximum
addressable memory in Sv39 MMU mode (i.e. 128GB) for now.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/Kconfig | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 2979a44103be..852ab2f7a50d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -127,7 +127,7 @@ config PAGE_OFFSET
 	default 0xC0000000 if 32BIT && MAXPHYSMEM_2GB
 	default 0x80000000 if 64BIT && !MMU
 	default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
-	default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
+	default 0xffffffe000000000 if 64BIT && !MAXPHYSMEM_2GB
 
 config ARCH_FLATMEM_ENABLE
 	def_bool y
@@ -235,19 +235,11 @@ config MODULE_SECTIONS
 	bool
 	select HAVE_MOD_ARCH_SPECIFIC
 
-choice
-	prompt "Maximum Physical Memory"
-	default MAXPHYSMEM_2GB if 32BIT
-	default MAXPHYSMEM_2GB if 64BIT && CMODEL_MEDLOW
-	default MAXPHYSMEM_128GB if 64BIT && CMODEL_MEDANY
-
-	config MAXPHYSMEM_2GB
-		bool "2GiB"
-	config MAXPHYSMEM_128GB
-		depends on 64BIT && CMODEL_MEDANY
-		bool "128GiB"
-endchoice
-
+config MAXPHYSMEM_2GB
+	bool "Maximum Physical Memory 2GiB"
+	default y if 32BIT
+	default y if 64BIT && CMODEL_MEDLOW
+	default n
 
 config SMP
 	bool "Symmetric Multi-Processing"
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
