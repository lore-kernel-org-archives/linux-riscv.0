Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5E2C6FA8E
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 09:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h+4zEAdm6qmm/La6aIJQPgf/XicT+yZanljdievT/YA=; b=GZuoT8gaKE3JJ5
	PXznsZw16oxKP/mAwKI2GK6CuKjtc1UvIOeauYF+nqySqJQCis5w1uz6mlK0Z7w1IGFnoNayM+23a
	OQFoTrnWZWmnydET9VYPBdjLGAhDTDNmzMhWLM8eXTPjJ/iUbBL7b3bUd51NsnbEiaNqBxgtUgQj+
	6BHVS7T8hN0jFljXna9TaSaMv4y6vaezdbePExRWYHnsXYtf1jHsv6cKWOE2RS5dX0fmiCo0eDjhQ
	W4vgTmgPpwwi0jhCFMQyzSporxrIX3S9fw3CCqWdoq/fxMvQ+O4y/Y7NgAWanB2MB1KLPZGk/56R5
	OZKxshp72gN/0c/nLqjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfdi-001XSH-9z; Thu, 02 Mar 2023 09:54:18 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfde-001XQV-Ja
	for linux-riscv@lists.infradead.org; Thu, 02 Mar 2023 09:54:15 +0000
Received: by mail-wm1-x32d.google.com with SMTP id j19-20020a05600c191300b003eb3e1eb0caso1286949wmq.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 Mar 2023 01:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677750853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyJad6DESnZ256fhxA8bHesaXxO8dG/mPAVgfV58f6Q=;
        b=PocY5jSD+knTufeHYJY53emKY8cLaDfBcpJ3g7vcOhM0155bmN6drNHnAy/dqVYcmS
         c/manfIX36JsBtFH99BTF2Vhq17Xxmao4MhiPi3ICI2F2bi4/Ax/dOjd69nET1sNlDN6
         OtZSz6avRPNnEV/+z6xJj65aUB9Rp6l2st0GmKzcok9tj9j35urs60K8AIwWQG1Zp+fS
         k1Xh/ef/kJcmM11fj4F/vUQsnPUPMh0G9lxxM2dqDLG+wdMulGgke12EY26Onc4UNECB
         1FB84pqf6oF+ekGSZc0v9kcvl2vF8KCwqzDgQGWPfdPHjPnsi0IU3g+ILK2dYAMpfZJA
         te3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677750853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyJad6DESnZ256fhxA8bHesaXxO8dG/mPAVgfV58f6Q=;
        b=fUAhvntTwJpDh8kUUF3ntO58XRzL+7Tv0y84WC0E1r2nx1kBZ4xykitrZWg/9fUFQp
         jEk+0qoFrkUacAu1wxltdI6063BNR5VUReyfZkzhgAOlKTZ9/TvCFTBLNYSiF2wy2Efb
         wTxUIxS3Txd+qv7oJPAQckVYiEkVzmfeGe9zSZp/ztYNdr1i2Azp0wssgO4JFv6Y2avD
         2/tcKwphEtCecdgwJUf4h6Q1vWxCXCpeXfGPxIQXXVAI0crcMywgbSedlwCCnayegALs
         J8ej2HN0qW8Oo+SHc9CDekBsRh2k+pG6wysyAg1FPTDulozsX9jQ9QpAt+ka2z6q06Sf
         m3Hg==
X-Gm-Message-State: AO0yUKVN5zZdDH4ll9CelQRBG0jOC9dF8bQw724pCiXtE/LZP+Jt105c
	Sd8Q3iqdV/30kBU4J4a+X6/p8g==
X-Google-Smtp-Source: AK7set8wLtrohdEsm9pImDViXL5baW1jLm37hLC/THOyG57xdYbkaYkmThGLVaZE3EGWQc321ut4OQ==
X-Received: by 2002:a05:600c:16c7:b0:3df:e659:f9d9 with SMTP id l7-20020a05600c16c700b003dfe659f9d9mr6908776wmn.34.1677750853161;
        Thu, 02 Mar 2023 01:54:13 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id d2-20020adfef82000000b002c5801aa9b0sm15003456wro.40.2023.03.02.01.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:54:12 -0800 (PST)
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
Subject: [PATCH v4 18/24] sparc: Remove empty <uapi/asm/setup.h>
Date: Thu,  2 Mar 2023 10:35:33 +0100
Message-Id: <20230302093539.372962-19-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_015414_691196_6177F517 
X-CRM114-Status: UNSURE (   9.74  )
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
