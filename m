Return-Path: <SRS0=kxho=ND=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A94C67863
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 23 Oct 2018 23:41:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 138722075D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 23 Oct 2018 23:41:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ea3tOO6K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kr72YR3Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 138722075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+hZPusL2cP7okbrehDXRJ12oiL/fYoTZCQBgkGPY9hQ=; b=ea3tOO6KFktqYC0jWwBzWuFgIZ
	uDds9F6BvBalHSWbyBgQYFJp6HkO6BMAFX2Vs91/5aZ0Q+SmcGKbZi3oNwBepO6TYZH6z3C/HNvRH
	J+kWtFgheZ8x4tQRJtHfPZE6yaiST0TonCk3eG+V92S4sUKdCknl/uNChl38tjJRVX0MQJLxk3TpV
	IZ65UzhAgBXt6ERl5RRllw0NWe1FpaqydpcTWjd8laob+R1Piquyv2mt8HkIbvm3WYI6zRdzp9GPU
	6Vpr0atfJSxYoF/zp99gImk6rmwshmGD/G9I87OOE87Ss0acjtbTAVpyIGiif0STPn9tLliSmxQh9
	ULltfhRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gF6Iu-0006qi-3Q; Tue, 23 Oct 2018 23:41:40 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gF6Ig-0006jW-83; Tue, 23 Oct 2018 23:41:32 +0000
Received: by mail-pl1-x644.google.com with SMTP id t6-v6so1319532plo.9;
 Tue, 23 Oct 2018 16:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=R7GnanBC/dUP1yUUX1JKpyThiE0iCRjX5YFPvjRZfCc=;
 b=kr72YR3Z6fsjpNCQWKAq8biRV5Ky6WEsLzLAKNjvGEXzVo0OLzZj/axxUcLvMsJljv
 GAUecWqvxnSaid8cy+tamZPG6VAbzIplkizh2XlS5+LjIS+KIZ1qIL24fEwrjS9qrQUb
 EIrpmsjuQqewtt8fFJdBuF7YeJ4v/DEjRBMn+gRA3PAzMbtYHLpSYsorIdL2fqgRdb8C
 jErR59hy7OjxBnoL5lFmGHiO/fgShVOHMM1Opsl0Z0i099qHGHgcQjLIKmx57lbmB3GZ
 krgLeNTNlj6Hdsvo4Fwc2fmHtk++Ag4dtLCP4cPAzhB5giHxiZf/r9Wv8RZmhadPX5Ok
 Ab7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=R7GnanBC/dUP1yUUX1JKpyThiE0iCRjX5YFPvjRZfCc=;
 b=UxHFjrCF1CTz6Adt5w6wotGcP3WyJYRk2gDBgE9nWFWIeKs2nlxgsbepYnedZytfnr
 lHUeTKpmGBijl03Piw0jcwT6kAtxe1kqC83hJ0r94ssWLlBQNN+SLH7jFz0v9y9Jo6Bx
 zTMfbGsI4tMQYiZpQgG+WjTuedc86hRXhp6/mb+3xGMPDZX1Z38NkINuhqB3ENUQa1ur
 /OrDI38m90/Xz2SJkvMJ3J6q0yCd4rpEGLhzuX5u9rxoECG0bvSYB2b9gv1i96FUsvlf
 XhQ8SH5NmYtQnflvJ2rYr+vCL4fcKQPtqdtFfXUBc0uaUcaQm3rGY2IY7Bx3EZ5Sjsmm
 CKlg==
X-Gm-Message-State: AGRZ1gJGMDJIE0HPM+n6on3fE1tSvhGNW+X3zoTFXCKS0IRSkCpl68Qf
 ExbXYox3yK5L/NExXUDKwsM=
X-Google-Smtp-Source: AJdET5e9VIZyzA2DLtMJxPKaSvJZGY+8cFNaWYDcR0p+L+8OVN2SKkA/Vmncd/1gNmmLya56CR05hA==
X-Received: by 2002:a17:902:e81:: with SMTP id
 1-v6mr295267plx.314.1540338075086; 
 Tue, 23 Oct 2018 16:41:15 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.250])
 by smtp.gmail.com with ESMTPSA id a5-v6sm3041223pfo.53.2018.10.23.16.41.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Oct 2018 16:41:13 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: Create asm/initrd.h
Date: Tue, 23 Oct 2018 16:40:43 -0700
Message-Id: <20181023234044.1138-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181023234044.1138-1-f.fainelli@gmail.com>
References: <20181023234044.1138-1-f.fainelli@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181023_164126_329859_B9EA7B35 
X-CRM114-Status: GOOD (  17.55  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "open list:MIPS" <linux-mips@linux-mips.org>,
 Alan Kao <alankao@andestech.com>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Will Deacon <will.deacon@arm.com>, Paul Mackerras <paulus@samba.org>,
 "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "James E.J. Bottomley" <jejb@parisc-linux.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Matt Turner <mattst88@gmail.com>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 Marc Zyngier <marc.zyngier@arm.com>,
 "open list:USER-MODE LINUX UML" <linux-um@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Richard Henderson <rth@twiddle.net>,
 Matt Redfearn <matt.redfearn@mips.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ralf Baechle <ralf@linux-mips.org>, Richard Kuo <rkuo@codeaurora.org>,
 Paul Burton <paul.burton@mips.com>, Andrew Morton <akpm@linux-foundation.org>,
 "open list:IA64 Itanium PLATFORM" <linux-ia64@vger.kernel.org>,
 James Hogan <jhogan@kernel.org>, Palmer Dabbelt <palmer@sifive.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Deepa Dinamani <deepa.kernel@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 "open list:S390" <linux-s390@vger.kernel.org>,
 "open list:C6X ARCHITECTURE" <linux-c6x-dev@linux-c6x.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "open list:QUALCOMM HEXAGON ARCHITECTURE" <linux-hexagon@vger.kernel.org>,
 Helge Deller <deller@gmx.de>,
 Jan Henrik Weinstock <jan.weinstock@ice.rwth-aachen.de>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 "open list:TENSILICA XTENSA PORT xtensa" <linux-xtensa@linux-xtensa.org>,
 Jessica Yu <jeyu@kernel.org>, Philippe Ombredanne <pombredanne@nexb.com>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
 Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>, Tony Luck <tony.luck@intel.com>,
 "open list:OPENRISC ARCHITECTURE" <openrisc@lists.librecores.org>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Alexei Starovoitov <ast@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Fenghua Yu <fenghua.yu@intel.com>, arnd@arndb.de,
 Andrey Konovalov <andreyknvl@google.com>, Jeff Dike <jdike@addtoit.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Christoffer Dall <christoffer.dall@arm.com>,
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
 Olof Johansson <olof@lixom.net>, Ley Foon Tan <lftan@altera.com>,
 "David S. Miller" <davem@davemloft.net>, Rich Felker <dalias@libc.org>,
 Hendrik Brueckner <brueckner@linux.vnet.ibm.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "open list:SPARC + UltraSPARC sparc/sparc64" <sparclinux@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Jonas Bonn <jonas@southpole.se>,
 Richard Weinberger <richard@nod.at>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Mark Salter <msalter@redhat.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:NIOS2 ARCHITECTURE" <nios2-dev@lists.rocketboards.org>,
 Michal Simek <monstr@monstr.eu>, Vineet Gupta <vgupta@synopsys.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 "open list:LINUX FOR POWERPC 32-BIT AND 64-BIT"
 <linuxppc-dev@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181023234043.Z6Pf4AlkzQydsQW_prnCEFizh0PKdHdp7su7sDwLqeM@z>

ARM64 is the only architecture that requires a re-definition of
__early_init_dt_declare_initrd(). Now that we added the infrastructure
in asm-generic to provide an asm/initrd.h file, properly break up that
definition from asm/memory.h and make use of that header in
drivers/of/fdt.c where this is used.

This significantly cuts the number of objects that need to be rebuilt on
ARM64 due to the repercusions of including asm/memory.h in several
places.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/arm64/include/asm/initrd.h | 13 +++++++++++++
 arch/arm64/include/asm/memory.h |  8 --------
 drivers/of/fdt.c                |  1 +
 3 files changed, 14 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm64/include/asm/initrd.h

diff --git a/arch/arm64/include/asm/initrd.h b/arch/arm64/include/asm/initrd.h
new file mode 100644
index 000000000000..0c9572485810
--- /dev/null
+++ b/arch/arm64/include/asm/initrd.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_INITRD_H
+#define __ASM_INITRD_H
+
+#ifdef CONFIG_BLK_DEV_INITRD
+#define __early_init_dt_declare_initrd(__start, __end)			\
+	do {								\
+		initrd_start = (__start);				\
+		initrd_end = (__end);					\
+	} while (0)
+#endif
+
+#endif /* __ASM_INITRD_H */
diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index b96442960aea..dc3ca21ba240 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -168,14 +168,6 @@
 #define IOREMAP_MAX_ORDER	(PMD_SHIFT)
 #endif
 
-#ifdef CONFIG_BLK_DEV_INITRD
-#define __early_init_dt_declare_initrd(__start, __end)			\
-	do {								\
-		initrd_start = (__start);				\
-		initrd_end = (__end);					\
-	} while (0)
-#endif
-
 #ifndef __ASSEMBLY__
 
 #include <linux/bitops.h>
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 800ad252cf9c..4e4711af907b 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -28,6 +28,7 @@
 
 #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
 #include <asm/page.h>
+#include <asm/initrd.h>
 
 #include "of_private.h"
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
