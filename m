Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F16C61DA4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 08:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h+4zEAdm6qmm/La6aIJQPgf/XicT+yZanljdievT/YA=; b=U6Xz2PYrPa3oHf
	BZ4pQQTiR3lXETpjEGRHAmH5xfnMgQcVdXkp/UiLZ8VP5hwntQsDIrHd3eM4Vey9FNvsR0scrmYHP
	dmRaakL86E0mDphejlKDmIHUtqcdWEuXIvD9A7/LsoQeanjoJe0vol0wo4oQzAqiXJ1AjEV+W9AOa
	Qn2S3z9lS8+HAW5X7/nGh4uLapTm2O8dEanNFc/3yRZOaDhQj4dL0B81syyRG11in3EA8k+UBwFR8
	zvA6idxizpU6v1lUbafOi3RY6b/SpAhIqk7ysikgSaCsvARsQtLkQ/a9itDemFG8DmO8eaInPxjt6
	VHPzHlnjVJWn2B5f1Vrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqMc-000SYz-2r; Tue, 14 Feb 2023 08:08:34 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqMY-000SXT-H4
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 08:08:31 +0000
Received: by mail-wm1-x331.google.com with SMTP id s13-20020a05600c45cd00b003ddca7a2bcbso5514793wmo.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 00:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyJad6DESnZ256fhxA8bHesaXxO8dG/mPAVgfV58f6Q=;
        b=KxydN/OER8BSTkZprK4GQuQ37SCzFfF8F7nYPrALwYIhNfjrm/iYvkH8VHUKuWljc+
         hJyGkg/DL90Xfd3/okg6L0KzhuITpBNfbia3+S/fAK125Ld0kZhDA7eIlQxw+Xw3dkT/
         aj7aiQvBLhS5B8flYpPrieoVs9sQYS/U/d/InNnelnlguIeFUUtfjunMESQtOkqWbUre
         0p2y8ksgJKMjHBB/D5NBl5ZQwQ2LKcpSbWYGBzuXkyZiix752T1VYYWIXRHDTinKb1tU
         GVrcW8XhUkirbV/nWwdIfLjqo49ekG/ObANDCnvi9dmdJjcnTcfFXFmPFIr6rbAyJRMV
         RbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyJad6DESnZ256fhxA8bHesaXxO8dG/mPAVgfV58f6Q=;
        b=NwLdOo7Yyc0jGit/N0LsmarCFutdPc+jh0iqlNa6pL/vJo15rrAAhJmKbsE43J0nFq
         bphgAQW0PVvPuVepJJ+bJPg8ZAG+tYFrOdM+3nFmntd6/zymXX0Q57mJc1vJmUv7WIHr
         O4mdgKy24MvsDfk8xvMGstkwX9bgRqHHJxAO9gs2hDqOyay1JxIhBdqHoOFhPq4It1ZE
         Xj/p+LIPitQuuX4Kuoh/BH8ekJGpxB0wK85nDM2jvNAoMJf8C6bRWNTACRI9sh02xFOB
         JWICIonQ3prq9DR2Ho0UhG1ETRMUrgrp1Vqg2h+WWICI/CjLGaZQGGMPP+cbd+ArLjlS
         XFDQ==
X-Gm-Message-State: AO0yUKXu3UspxDYfpozlkr5oh6zATXs7NvXOCkdDToh3PquoC6/TgISy
	Xz3NgA62+NoHxDk2yLaRSivz1Q==
X-Google-Smtp-Source: AK7set/yO4PV5gq0EJbG+vnFnrIiAFQuyxqQz9U7rGQ0C4aBtVOu7GwxW5NGHi/BdSTlV9F3RxNsHg==
X-Received: by 2002:a05:600c:538c:b0:3df:f85a:4724 with SMTP id hg12-20020a05600c538c00b003dff85a4724mr1181315wmb.39.1676362109149;
        Tue, 14 Feb 2023 00:08:29 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id n6-20020a7bcbc6000000b003dfe57f6f61sm15477391wmi.33.2023.02.14.00.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 00:08:28 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
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
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3 18/24] sparc: Remove empty <uapi/asm/setup.h>
Date: Tue, 14 Feb 2023 08:49:19 +0100
Message-Id: <20230214074925.228106-19-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_000830_573397_349F72AA 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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
---
 arch/sparc/include/uapi/asm/setup.h | 9 ---------
 1 file changed, 9 deletions(-)
 delete mode 100644 arch/sparc/include/uapi/asm/setup.h

diff --git a/arch/sparc/include/uapi/asm/setup.h b/arch/sparc/include/uapi/asm/setup.h
deleted file mode 100644
index c3cf1b0d30b3..000000000000
--- a/arch/sparc/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,9 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
- *	Just a place holder. 
- */
-
-#ifndef _UAPI_SPARC_SETUP_H
-#define _UAPI_SPARC_SETUP_H
-
-#endif /* _UAPI_SPARC_SETUP_H */
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
