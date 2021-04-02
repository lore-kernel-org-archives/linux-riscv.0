Return-Path: <SRS0=OQtk=I7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A0FC433B4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 15:19:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE97660FD7
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 15:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE97660FD7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Cc:To:Subject:From:References:In-Reply-To:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1upGJ9ptVF1Xm5dt6ZjSrOYXnmlVH6GxbJQaln5Fysw=; b=K5DziJ4MksoVxMCxyJAav5BSF3
	WVSeMZ8zeB4X4c7HfFBi7UG1z/hqB2dKu5ldYeXpEtC15Eh/wKCEwThABklwEXvKPJihgb9dxAu+t
	QDQ/6gin6qPwRukmEXsjft4J40AFsRp5CnYA+Fi7/J1ittax7lJIbXt3Avwp9S70sN3EONjrSlwTD
	VdsH5pbUX/5r+zGoJmJmRrR6yGuK7y2n/sxGkkB6SEMDZ2TpKdqU08aAMTb4CDg5e8qvN/5dfmk6R
	m8dI6gYn4sIPPICdHHmdvgPmCrEjbivkyMr46N65wb97rUTZp98aBuB6YV1p18+FKueiQyLfFF40h
	qvQZ3hkg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSLZs-00DCmg-Dz; Fri, 02 Apr 2021 15:19:16 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSLYn-00DCPA-0v; Fri, 02 Apr 2021 15:18:10 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkFn3JGVz9v2m6;
 Fri,  2 Apr 2021 17:18:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id VqEXDMYbbW_D; Fri,  2 Apr 2021 17:18:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkFn2H9Mz9v2ls;
 Fri,  2 Apr 2021 17:18:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 327708BB7B;
 Fri,  2 Apr 2021 17:18:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id RgJz95waFuwr; Fri,  2 Apr 2021 17:18:07 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BB1658BB79;
 Fri,  2 Apr 2021 17:18:06 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 8EFAC67989; Fri,  2 Apr 2021 15:18:06 +0000 (UTC)
Message-Id: <9cf63d0419bb51d91c5b1c83ce250dff1e7107cc.1617375802.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 05/20] cmdline: Gives architectures opportunity to use
 generically defined boot cmdline manipulation
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
Date: Fri,  2 Apr 2021 15:18:06 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_161809_161991_F2D560F4 
X-CRM114-Status: GOOD (  17.60  )
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

Most architectures have similar boot command line manipulation
options. This patchs adds the definition in init/Kconfig, gated by
CONFIG_HAVE_CMDLINE that the architectures can select to use them.

CONFIG_CMDLINE_EXTEND is understood differently by architectures.
For some of them it appends built-in CMDLINE to bootloader provided
line. For others it appends the bootloader provided CMDLINE to the
built-in one.
To avoid confusion, this commit brings to different options:
- CONFIG_CMDLINE_APPEND to append the built-in CMDLINE to the
bootloader line.
- CONFIG_CMDLINE_PREPEND to prepend the built-in CMDLINE in front of
the bootloader line.

For compatibility with existing architecture which uses CONFIG_OF, as
OF has already been converted to generic cmdline, we keep
CONFIG_CMDLINE_EXTEND as a synonym to CONFIG_CMDLINE_APPEND until
arm, powerpc, riscv and sh architectures have been converted.

A few differences are identified and will have to be taken
into account when converting the architecture to generic cmdline:
- riscv has CMDLINE_FALLBACK instead of CMDLINE_FROM_BOOTLOADER
- Some architectures are using CONFIG_CMDLINE_OVERRIDE or
CONFIG_CMDLINE_OVERWRITE instead of CONFIG_CMDLINE_FORCE.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3:
- Comments from Will.
- Remove CONFIG_CMDLINE_BOOL. Using CONFIG_CMDLINE != "" instead, like arm and powerpc.
- Changed EXTEND to APPEND. Keep EXTEND for backward compatibility.

v4:
- Added CMDLINE_PREPEND as a dependency for INITRAMFS_FORCE
- Removed the EXTEND || APPEND in cmdline.h, keep EXTEND as it
   will always exit and switch to APPEND in last patch.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 init/Kconfig | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 usr/Kconfig  |  2 +-
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index 5f5c776ef192..af0d84662cc2 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -117,6 +117,58 @@ config INIT_ENV_ARG_LIMIT
 	  Maximum of each of the number of arguments and environment
 	  variables passed to init from the kernel command line.
 
+config GENERIC_CMDLINE
+	bool
+
+config CMDLINE
+	string "Default kernel command string" if GENERIC_CMDLINE
+	default ""
+	help
+	  Defines a default kernel command string.
+	  If this string is not empty, additional choices are proposed
+	  below to determine how it will be used by the kernel.
+
+choice
+	prompt "Kernel command line type" if CMDLINE != ""
+	default CMDLINE_PREPEND if ARCH_WANT_CMDLINE_PREPEND_BY_DEFAULT
+	default CMDLINE_FROM_BOOTLOADER
+	depends on GENERIC_CMDLINE
+	help
+	  Determine how the default kernel arguments are combined with any
+	  arguments passed by the bootloader if any.
+
+config CMDLINE_FROM_BOOTLOADER
+	bool "Use bootloader kernel arguments if available"
+	help
+	  Uses the command-line options passed by the boot loader. If
+	  the boot loader doesn't provide any, the default kernel command
+	  string provided in CMDLINE will be used.
+
+config CMDLINE_APPEND
+	bool "Append to the bootloader kernel arguments"
+	help
+	  The default kernel command string will be appended to the
+	  command-line arguments provided by the bootloader.
+
+config CMDLINE_PREPEND
+	bool "Prepend to the bootloader kernel arguments"
+	help
+	  The default kernel command string will be prepended to the
+	  command-line arguments provided by the bootloader.
+
+config CMDLINE_FORCE
+	bool "Always use the default kernel command string"
+	help
+	  Always use the default kernel command string, ignoring any
+	  arguments provided by the bootloader.
+endchoice
+
+config CMDLINE_EXTEND
+	bool
+	default CMDLINE_APPEND
+	help
+	  To be removed once all architectures are converted to generic CMDLINE
+
 config COMPILE_TEST
 	bool "Compile also drivers which will not load"
 	depends on HAS_IOMEM
diff --git a/usr/Kconfig b/usr/Kconfig
index 8bbcf699fe3b..b397e6b114d1 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -24,7 +24,7 @@ config INITRAMFS_SOURCE
 
 config INITRAMFS_FORCE
 	bool "Ignore the initramfs passed by the bootloader"
-	depends on CMDLINE_EXTEND || CMDLINE_FORCE
+	depends on CMDLINE_PREPEND || CMDLINE_APPEND || CMDLINE_FORCE
 	help
 	  This option causes the kernel to ignore the initramfs image
 	  (or initrd image) passed to it by the bootloader. This is
-- 
2.25.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
