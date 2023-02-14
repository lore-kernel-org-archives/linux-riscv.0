Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAC6C05027
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 08:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WqozQ8zMNImqBQ4zr5tQ+2vbBfY2qECoLY+r3qF0aZM=; b=uL5odZ+9W50eOU
	KNtDjvSvi7xwqRGQjAWV82QO6XALP3i9BkCu3uvfJkq8P+PqcXpce/rl7+EMQ9vgqy7illlCvMTgX
	7HdG3J6Cdkbzjspiv63sSIQzUTLbj0XV0yHb/hDIgQyRmn7YLIC2a9ufB727DlsMMqPxl/3hL6640
	AWh3rWe4ObfbJSwX4SXYNEsUolTVvuAPZ1B169tPEpeEHW0XPGO/pqgzx7HgDdZANqPvmXVvKiJGO
	DJPBVh2UFzybcHLfuAOiwJOdKbr5nt1YVfqx07SzurA4P0gOEQy81itRpqf703P95ZZOI5HZJGXaw
	nPKX0+nGCRX6QEoz5a6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqSl-000VC7-Ba; Tue, 14 Feb 2023 08:14:55 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqSh-000V9b-Qg
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 08:14:53 +0000
Received: by mail-wr1-x42b.google.com with SMTP id k3so7103745wrv.5
        for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 00:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjnDXT2YCrpWOoVnrYNkTuZIq4oC+7zvNAb1MUNa5/c=;
        b=doj3ihw2ryLRC8f29i99NL2fwaGqn4CpXMd97+dwyictmuXkOTVA3vSN+VHk/PL0kf
         FxQRafQ1Jt/CNIN6lVBhNNArczrIy10FqfWYvnAbdsShwiby/3DTFWhrBeUy18cY73Eu
         E3vQL2utHUsfq64MZdoEZbAML53OwZSFv1czAWyM31Shgci31oFfy6gfRTZFzd55RXjO
         XSWJuB7qGztVLm0ISy6iV/oGFJm6s+0D0JcCtuAy6rPxbA8LU7KapUgGY7jLMRciHJGu
         tSDQUfV66Cg6ku0ogdvTEqZppDCuIdWj8dYNveiHQUMsl6bUb56BPhszaqAKgBoZrOa/
         fCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjnDXT2YCrpWOoVnrYNkTuZIq4oC+7zvNAb1MUNa5/c=;
        b=kw37UvcXA4q/+Eyt5CIiVjdpU67BNdqJQytnxntZSxqLWqxZpVgr7/DwFMRsV+Ezo7
         AlcU8xz0A/kjRKVIxm7SlpR40zH0S6kdlXTmCIvN3eWsi1S90tSd/mV5zQauDvgPPktl
         44U8KUO3/zUrWysuIF4F6CeZ7eZJgqTuag9Pc4J8WgxtDWJSS29B4cXAhyiakjxeVoei
         uML4MUI5tdw/ngWKmxjvysaH5IKVMR0gPOk8fYeDscuUR3YdmX9yAiL+yyOCp/OlcTcu
         M4zOUALYRohlHkX7aThGRaWZLIAVe6Wdiy1x4fQBMYnzipnk1+ON0r2MqbdPxJ46cPQb
         smvQ==
X-Gm-Message-State: AO0yUKWZqPunZgwsZsilGQ4dvRnftZPXZ7UmxnX8qco8Sma/2hb9vKe8
	dlOHnHVZOd3y21N+Xwi8IMDlHQ==
X-Google-Smtp-Source: AK7set/msAZJj448Cov5vdV+SLyxrlNLKv4T+REkQ+fV1an22f34T0IiaHil6N7s6KZj8YpicdZPqA==
X-Received: by 2002:adf:f04e:0:b0:2bf:dcdc:afb8 with SMTP id t14-20020adff04e000000b002bfdcdcafb8mr1245734wro.64.1676362490423;
        Tue, 14 Feb 2023 00:14:50 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id n2-20020a5d67c2000000b002c53f6c7599sm11659511wrw.29.2023.02.14.00.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 00:14:50 -0800 (PST)
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
Subject: [PATCH v3 24/24] s390: Remove empty <uapi/asm/setup.h>
Date: Tue, 14 Feb 2023 08:49:25 +0100
Message-Id: <20230214074925.228106-25-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_001451_926873_1CEB8BC3 
X-CRM114-Status: GOOD (  11.49  )
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
 arch/s390/include/asm/setup.h      | 1 -
 arch/s390/include/uapi/asm/setup.h | 1 -
 2 files changed, 2 deletions(-)
 delete mode 100644 arch/s390/include/uapi/asm/setup.h

diff --git a/arch/s390/include/asm/setup.h b/arch/s390/include/asm/setup.h
index 177bf6deaa27..99c1cc97350a 100644
--- a/arch/s390/include/asm/setup.h
+++ b/arch/s390/include/asm/setup.h
@@ -7,7 +7,6 @@
 #define _ASM_S390_SETUP_H
 
 #include <linux/bits.h>
-#include <uapi/asm/setup.h>
 #include <linux/build_bug.h>
 
 #define PARMAREA		0x10400
diff --git a/arch/s390/include/uapi/asm/setup.h b/arch/s390/include/uapi/asm/setup.h
deleted file mode 100644
index 598d769e76df..000000000000
--- a/arch/s390/include/uapi/asm/setup.h
+++ /dev/null
@@ -1 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
