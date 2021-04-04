Return-Path: <SRS0=P6N1=JB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D87B7C433ED
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Apr 2021 17:24:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 432746134F
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Apr 2021 17:24:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 432746134F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Cc:To:Subject:From:Message-Id:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0sPR8iqiwntQ0LDLTR+U+vuHMruZGb2hSlbT2mQzRCM=; b=Hjtl3WTl4LdM9hmKG0j7WwudTv
	FhaEpu0vUJ+G42hzAThmedWUdFsTncjsMAMCFSw3toXPcOpQpTvCjGU/gp+7tR29Bw2qLTf7IlIuC
	xWFItpzr9wsq73EtzBgGyIJNQ1oQq9sh+wjzbrEKfEWdj1QAkdWUuWbMi8MtplXx34uchwgiEzU3I
	as04bz/bUGza0tTQmjG9HRqwalsFX/j54XfUH/Q2wUs9ExK+YyYCE0/5b/NcJhGLk3iYctRIUTyq7
	Edh8huag8T6wsp6yRFelMruMcnbTricrU4dR/+Qpv7au0t9ESN+HChxuFGuVWhym79LCpMw2LOZZN
	8LrXN0Cw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lT6U7-00G2UV-2p; Sun, 04 Apr 2021 17:24:27 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lT6Ql-00G2Iw-Ml; Sun, 04 Apr 2021 17:21:07 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FD0tP1t4vz9tymG;
 Sun,  4 Apr 2021 19:20:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ffq992l6CBkv; Sun,  4 Apr 2021 19:20:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FD0tP0d2fz9tymF;
 Sun,  4 Apr 2021 19:20:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9F2F08B78E;
 Sun,  4 Apr 2021 19:20:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id b-KtXSnASDF0; Sun,  4 Apr 2021 19:20:48 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4454D8B76A;
 Sun,  4 Apr 2021 19:20:48 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 06D3A67685; Sun,  4 Apr 2021 17:20:48 +0000 (UTC)
Message-Id: <34d20d1dbb88f26d418b33985557b0475374a1a5.1617556785.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v6 1/1] cmdline: Add capability to both append and prepend
 at the same time
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
Date: Sun,  4 Apr 2021 17:20:48 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210404_182103_167769_9C9F2BDB 
X-CRM114-Status: GOOD (  16.23  )
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

One user has expressed the need to both append and prepend some
built-in parameters to the command line provided by the bootloader.

Allthough it is a corner case, it is easy to implement so let's do it.

When the user chooses to prepend the bootloader provided command line
with the built-in command line, he is offered the possibility to enter
an additionnal built-in command line to be appended after the
bootloader provided command line.

It is a complementary feature which has no impact on the already
existing ones and/or the existing defconfig.

Suggested-by: Daniel Walker <danielwa@cisco.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
Sending this out as an RFC, applies on top of the series
("Implement GENERIC_CMDLINE"). I will add it to the series next spin
unless someone is against it.
---
 include/linux/cmdline.h |  3 +++
 init/Kconfig            | 12 +++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/linux/cmdline.h b/include/linux/cmdline.h
index 020028e2bdf0..fb274a4d5519 100644
--- a/include/linux/cmdline.h
+++ b/include/linux/cmdline.h
@@ -36,6 +36,9 @@ static __always_inline bool __cmdline_build(char *dst, const char *src)
 
 	len = cmdline_strlcat(dst, src, COMMAND_LINE_SIZE);
 
+	if (IS_ENABLED(CONFIG_CMDLINE_PREPEND))
+		len = cmdline_strlcat(dst, " " CONFIG_CMDLINE_MORE, COMMAND_LINE_SIZE);
+
 	if (IS_ENABLED(CONFIG_CMDLINE_APPEND))
 		len = cmdline_strlcat(dst, " " CONFIG_CMDLINE, COMMAND_LINE_SIZE);
 
diff --git a/init/Kconfig b/init/Kconfig
index fa002e3765ab..cd3087ff4f28 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -128,6 +128,14 @@ config CMDLINE
 	  If this string is not empty, additional choices are proposed
 	  below to determine how it will be used by the kernel.
 
+config CMDLINE_MORE
+	string "Additional default kernel command string" if GENERIC_CMDLINE && CMDLINE_PREPEND
+	default ""
+	help
+	  Defines an additional default kernel command string.
+	  If this string is not empty, it is appended to the
+	  command-line arguments provided by the bootloader
+
 choice
 	prompt "Kernel command line type" if CMDLINE != ""
 	default CMDLINE_PREPEND if ARCH_WANT_CMDLINE_PREPEND_BY_DEFAULT
@@ -154,7 +162,9 @@ config CMDLINE_PREPEND
 	bool "Prepend to the bootloader kernel arguments"
 	help
 	  The default kernel command string will be prepended to the
-	  command-line arguments provided by the bootloader.
+	  command-line arguments provided by the bootloader. When this
+	  option is selected, another string can be added which will
+	  be appended.
 
 config CMDLINE_FORCE
 	bool "Always use the default kernel command string"
-- 
2.25.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
