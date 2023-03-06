Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DA3C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 10:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dr5DSmGzuYhoL/wze5LCW/4Z5VspeQ1FY7sChYcfsyQ=; b=3caeudYz6Ys6Ee
	mQD3cbzVDMbuR2T669+8l7zPd5ebsc0WpTTn4Pw4vBOEusLW3IZ7W6wt6oPc1nyyZcLldIQoDHxDc
	2T3+eY0JUb2V4/utfnKI/AGLZe/Yby91X5K6F1yykeR5NSLBkIz7PP61gY4kg8tMkHbWlrecTkt2C
	h9gr9ttxj9990s3vNakRqHSIkJj0Smem7Q+RuK/POLhbEGaOCTyUE+zPuZCQlUiRkB+PXONyPkmKj
	QSKAD1Kz81A84gl1c9sXsNqUxNcB01C/aSZpQqO6ObBKz3Io7WYK52wiRfFapIWj1fXCD9EXh/y6+
	Pp1O8i9vRFRqEjKaFtMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ84v-00CJdF-FU; Mon, 06 Mar 2023 10:28:25 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ84t-00CJbq-3d
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 10:28:24 +0000
Received: by mail-wm1-x32e.google.com with SMTP id o38-20020a05600c512600b003e8320d1c11so5318562wms.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 Mar 2023 02:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678098501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFKp5UQBG3l53oFN1TX3lPoz/7qd6K9MPu25CwOaBFY=;
        b=gXmErd07mq8h9FQwNad9cHSDKVO/9kBBoPVqhRVVJUdZ7yZ6dO44uoI2RadJITDD9x
         eZJl+a1RTgZ111TBTwySUjS84WDIz+4djsf+l2W/J89fu/WTd0mjG1XPGZToDSsihfLV
         UXMJABATU/cjR2YxRJRgB7Cu/M/L0BAmfO4BmQCA5HSKPmBAHyVFMfnuOT+nwcLcO4Eq
         Wf2RR5GDge2FA5kaHsVsn9jcM0m1zq6fhigT4Sh/Z1TwUMZsVzj25cRF4QttJ+0vPfRG
         JkY7jtv6yyTgK9GTcVTml3MvHOnPArnnd5490o/SLfyRgHMQ3bG0rS81rWV3vnXg1JON
         W3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678098501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFKp5UQBG3l53oFN1TX3lPoz/7qd6K9MPu25CwOaBFY=;
        b=UZ+jlwPXgQa2yHcjv/vxxuN+aCwWHcV3ZieDaP47wjHOzzDuhTWf2AfgFVh8f6ab/P
         Q1XS7suCpjzCjlM/zR8jgmI0gF8KZFKNxJ47axncZ+Ggqhz13eNsiwRUc2cCQ7ySXZXf
         6v2p2VKlaplPpwCq/G5fglUJEo9WLELfATJ4yUpEYqpO/Ye7NFtp1evfLqclKsAOsTTK
         UCJafW936VhmLm+cgXtTyxoGXI8VR79SWKGDUD7ZTiHYlpLmkN8wIbW/YY8ITtB9lnuH
         04OD9XdGzUkcQk06kDHQ/AxsAZvsDSfkFey+IN9ZrHpiHKftV2fsXqbE61Il5KYZNEov
         qERQ==
X-Gm-Message-State: AO0yUKWGluzcUw82GizP0PXy6O2xLkWSaL24XgtNNKrwKM2Rxesi1Bv0
	hL/YOtyPxeKFvziEik+Pfp10cg==
X-Google-Smtp-Source: AK7set/1QsFX/6t8V/FLcEmEqIc3FZ+bbYGyTypDjK5daD6AXO6IUVgA7zTW4rCAHVVJZZlaMKFiMA==
X-Received: by 2002:a05:600c:35c9:b0:3e2:1e01:803a with SMTP id r9-20020a05600c35c900b003e21e01803amr8595976wmq.9.1678098501632;
        Mon, 06 Mar 2023 02:28:21 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id i47-20020a05600c4b2f00b003eb5a531232sm9835051wmp.38.2023.03.06.02.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:28:21 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	"David S . Miller" <davem@davemloft.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	linux-arch@vger.kernel.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 22/26] xtensa: Remove empty <uapi/asm/setup.h>
Date: Mon,  6 Mar 2023 11:05:04 +0100
Message-Id: <20230306100508.1171812-23-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_022823_176779_BD978329 
X-CRM114-Status: GOOD (  11.19  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/xtensa/include/uapi/asm/setup.h | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 arch/xtensa/include/uapi/asm/setup.h

diff --git a/arch/xtensa/include/uapi/asm/setup.h b/arch/xtensa/include/uapi/asm/setup.h
deleted file mode 100644
index 6f982394684a..000000000000
--- a/arch/xtensa/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
- * include/asm-xtensa/setup.h
- *
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2001 - 2005 Tensilica Inc.
- */
-
-#ifndef _XTENSA_SETUP_H
-#define _XTENSA_SETUP_H
-
-#endif
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
