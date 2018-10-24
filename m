Return-Path: <SRS0=/L7I=NE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9D0ECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 19:34:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 458C12064C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 19:34:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T4q6nazt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McA1lhaO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 458C12064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=abG+DEuTakt5xwjb9nbByLWd+4vf0wYTv43MWZmSMYw=; b=T4q
	6naztpArKCDr1kNEdGbIiX/fecgdyZkdSZfahe75jKwh7K2dn/I+y9BdDItEgOkzNqylbZL6/E10U
	8miS9k26U4EAbLubAD7JaTFPevNEETf8Ix5NjrUfvaeO6rKlF5kMK/5X/KhEjfCRpjoXuwEH+dNoL
	owC2+ZG2YlIQ2pXN3PCtfktDxjDJXwHC4JTCelTcxuwZwo4GKmQSuVB/nJRESomqswUQAvn+FXoC9
	SiFAU53ZciioejmAlnCJwqtJTaLCE5SuO5egIGV5X0yIH6lMX4n8K7O1UOU+UlwZce2RMk6GnbYNn
	3BnmDW6+jgZsMGA0ppMRb935kahVq3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFOuv-0000ed-Iu; Wed, 24 Oct 2018 19:34:09 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFOuG-0000Ky-Id; Wed, 24 Oct 2018 19:33:30 +0000
Received: by mail-pg1-x543.google.com with SMTP id s3-v6so2788062pga.12;
 Wed, 24 Oct 2018 12:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=2Vz407YGxG3JrIcbuMcGjknc9A1ux1lohN4oRm/Cqf4=;
 b=McA1lhaOKIJL65beGoawo5XA+sF/abwjDeA2yKaiNr8dyq/Od5ufT99E0GONMfFrB5
 mxj/QZue6Tf1t+cRflB1mZi2fxv3IYj6NJnHFMWNkG2f8lp7SnQiYeL4NyVTjHBEdZ05
 1dnyS5bAy3ME1/TpbS7kNt2F+Ark1Fufn3BBBGkrhPKZooIYoq2aAMK7wGQ/hNB2raHa
 uRrvKYdU/4TXZHxUoWQfYalvnc/5tO7e0D+DFqq7jz/D1isEZXlEIx9USTvPb91olUnq
 csiJX/2lmmct5T1tGTx9ZAQ22vlQr9LB07PUSw7pRK5YoMqLg5+eX9X1PLv+twsgdIN4
 lSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=2Vz407YGxG3JrIcbuMcGjknc9A1ux1lohN4oRm/Cqf4=;
 b=CoXFchN+F+moor9Xh/Y1khxin5DQRqyK7ezVV/yTJR9wJ33GDsSF0T7WWQdyg/aOHE
 ubblT7POfrffejxSUEPUmCWdyvhEfbw6eR4Z2MKhVjT+6+MAbihz+gywc1hJesJwdSsO
 WLDwf+05s4qAK6UPI89W7rq+6R4dDpGbWeFSaic9+7Vmu7E6DcwFynTIExF52+AIyvs8
 4F14M/lrbDQMMtLQZe2e8rObhUr7T8aKJyiT1K7Ivi6MPxKMmlwjvU3PDfIFb20fuKT+
 bm1McZ8TUWcB/FNSPVsu3GZ0brPiEdy5ALQSH9mxpouIhevMjj8cSnGu3diTtzUCwzBM
 S7fw==
X-Gm-Message-State: AGRZ1gKievyoLKHNZ5mohuTuT6Ys8N75E8kVWmRsNc6M8Y5QfeeOJzIw
 vf5YbXjFYX691fG5zhYXdZ4=
X-Google-Smtp-Source: AJdET5f4TB1KsZED30rc1ToGjGeQ0Fw4IrT5lX4Ij0zKC68JI72ZgugEVwyyG9P2X2V4HKF41Rc2IQ==
X-Received: by 2002:a63:c54a:: with SMTP id
 g10-v6mr3624573pgd.201.1540409596871; 
 Wed, 24 Oct 2018 12:33:16 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.250])
 by smtp.gmail.com with ESMTPSA id j187-v6sm9818878pfc.39.2018.10.24.12.33.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Oct 2018 12:33:15 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: Cut rebuild time when changing
 CONFIG_BLK_DEV_INITRD
Date: Wed, 24 Oct 2018 12:32:54 -0700
Message-Id: <20181024193256.23734-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181024_123328_617098_684549DB 
X-CRM114-Status: GOOD (  13.16  )
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
 "open list:IA64 Itanium PLATFORM" <linux-ia64@vger.kernel.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>,
 "open list:SPARC + UltraSPARC sparc/sparc64" <sparclinux@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 "open list:S390" <linux-s390@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "open list:C6X ARCHITECTURE" <linux-c6x-dev@linux-c6x.org>,
 "open list:QUALCOMM HEXAGON ARCHITECTURE" <linux-hexagon@vger.kernel.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 "open list:TENSILICA XTENSA PORT xtensa" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <marc.zyngier@arm.com>,
 "open list:USER-MODE LINUX UML" <linux-um@lists.infradead.org>,
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
 "open list:OPENRISC ARCHITECTURE" <openrisc@lists.librecores.org>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
 Olof Johansson <olof@lixom.net>,
 "moderated list:NIOS2 ARCHITECTURE" <nios2-dev@lists.rocketboards.org>,
 "open list:LINUX FOR POWERPC 32-BIT AND 64-BIT"
 <linuxppc-dev@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181024193254.ALx2B2mnRUj-IXo7qGs1lIf4nOuNgCjB4Bpyvhd5xXY@z>

Hi all,

While investigating why ARM64 required a ton of objects to be rebuilt
when toggling CONFIG_DEV_BLK_INITRD, it became clear that this was
because we define __early_init_dt_declare_initrd() differently and we do
that in arch/arm64/include/asm/memory.h which gets included by a fair
amount of other header files, and translation units as well.

Changing the value of CONFIG_DEV_BLK_INITRD is a common thing with build
systems that generate two kernels: one with the initramfs and one
without. buildroot is one of these build systems, OpenWrt is also
another one that does this.

This patch series proposes adding an empty initrd.h to satisfy the need
for drivers/of/fdt.c to unconditionally include that file, and moves the
custom __early_init_dt_declare_initrd() definition away from
asm/memory.h

This cuts the number of objects rebuilds from 1920 down to 26, so a
factor 73 approximately.

Apologies for the long CC list, please let me know how you would go
about merging that and if another approach would be preferable, e.g:
introducing a CONFIG_ARCH_INITRD_BELOW_START_OK Kconfig option or
something like that.

Changes in v2:

- put an /* empty */ comment in the asm-generic/initrd.h file
- trim down the CC list to maximize the chances of people receiving this

Florian Fainelli (2):
  arch: Add asm-generic/initrd.h and make use of it for most
    architectures
  arm64: Create asm/initrd.h

 arch/alpha/include/asm/Kbuild      |  1 +
 arch/arc/include/asm/Kbuild        |  1 +
 arch/arm/include/asm/Kbuild        |  1 +
 arch/arm64/include/asm/initrd.h    | 13 +++++++++++++
 arch/arm64/include/asm/memory.h    |  8 --------
 arch/c6x/include/asm/Kbuild        |  1 +
 arch/h8300/include/asm/Kbuild      |  1 +
 arch/hexagon/include/asm/Kbuild    |  1 +
 arch/ia64/include/asm/Kbuild       |  1 +
 arch/m68k/include/asm/Kbuild       |  1 +
 arch/microblaze/include/asm/Kbuild |  1 +
 arch/mips/include/asm/Kbuild       |  1 +
 arch/nds32/include/asm/Kbuild      |  1 +
 arch/nios2/include/asm/Kbuild      |  1 +
 arch/openrisc/include/asm/Kbuild   |  1 +
 arch/parisc/include/asm/Kbuild     |  1 +
 arch/powerpc/include/asm/Kbuild    |  1 +
 arch/riscv/include/asm/Kbuild      |  1 +
 arch/s390/include/asm/Kbuild       |  1 +
 arch/sh/include/asm/Kbuild         |  1 +
 arch/sparc/include/asm/Kbuild      |  1 +
 arch/um/include/asm/Kbuild         |  1 +
 arch/unicore32/include/asm/Kbuild  |  1 +
 arch/x86/include/asm/Kbuild        |  1 +
 arch/xtensa/include/asm/Kbuild     |  1 +
 drivers/of/fdt.c                   |  1 +
 include/asm-generic/initrd.h       |  1 +
 27 files changed, 38 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm64/include/asm/initrd.h
 create mode 100644 include/asm-generic/initrd.h

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
