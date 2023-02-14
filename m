Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1628EC61DA4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 07:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LAc8rPMAIuqv8SMFNHBggfEVL2ikkkNS2n92eq703ng=; b=pU5wawR9yWPVMU
	e1ahWjBYBqTlcdg0cG7sF0aCfVYw2FsWG1P9eiff+k+IUOd2MMSDvUL1B/mqnJXN8eJlcJ9WAxCPQ
	9h2Ho1KgdvyWiSTGQlNxJaKzLDS1FfVUY/foARfFiQb5CZe0w1hzj0yGHy5wBFrJRwHG22A16fhL/
	4MwAphmedsBA/3OYDfXDpUIcJ0A14AacSHyQThVnoB1u5HSIDHuBCzbmbwth5TCYCZ80BIcv1j8rX
	2dyO58pqb9oUxz3KaccibbG9iVc+DrTwRnU5OKYX3gKDDsug7AS3j93doTjJrlKyHnD5UIc9DkRGz
	96wYhmRnYLOaEKg2NMzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRq5z-000LPd-Pw; Tue, 14 Feb 2023 07:51:23 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRq5r-000LD0-3y
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 07:51:17 +0000
Received: by mail-wr1-x42c.google.com with SMTP id j23so14722933wra.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 23:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfhnFvdOBMaLaqHchQiBMEzcSlF2Fa7xiydpzk9bce4=;
        b=C2iakMWMXSP/c9K7z5Xrdh2FZ8isHrwxMldv7DFWh875IFzrwvaewsb7pv+pVa32tl
         uGCdv0Gz5Sla77Gz5skt6wbYUcHV0MvrDD91ZQ6pbR0FErzvIa+siHbNV83wcBxe5ArP
         aJt1rzTFYZAlJ16o/6rxYLUe5PNm3Cl+WBlup3rC4VDyDpLzh+6dKa0ocOU49K1pDDRG
         2DU7qDQ8it3t/pBnyu9Q2n/Gn2V8da6o1Pd0nCVDpMY7pf+5XFSyefWucX0xtqrzNgZK
         hOieCgCpkZJ2M+Y8BO8XCPqXTZ1/32v6n2w6GpPqHXYf4CRyUxX7PkOvD2S1cOWpGGyY
         hVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UfhnFvdOBMaLaqHchQiBMEzcSlF2Fa7xiydpzk9bce4=;
        b=c906cT77yWGYg0wW6sh9ZUFNSqdozZhXPLMxQ8OSQFvNjnDugcOJ4+umLwOqkFgfXy
         lZxRh5z3/DAr9uwCT9KPRN+mxK++ndqUZWWbht0PUviYRySuSTd282REGiyeBncCVG1B
         K9PxAMhsVLL+/tDbNkzyBHa8nU6s0oOn9JK6pA3dv/m9H0uzv4iDH4+CXW+IQ6EGcIE0
         vrOY3xApYK8hN6l2hvGO1hCLikD6Tyj6z+wQVmEt6WLl8hZaPtkgM9HRR57f5hXtzioG
         VM25/60aIlmQ+wg7+U78o+4FnagaToUWsZO3mAmWLo6IYKWUZYNmB2NvLn6YOlEVkH2N
         WgrA==
X-Gm-Message-State: AO0yUKVCEp32rulFopYLwkViH+HNfOaOoKJNYJqWC3ogd2I2ZEHDQln8
	/9BdO04OQuDeTNGJdbllqkcE2w==
X-Google-Smtp-Source: AK7set+tz6eryASejtd5hVfxacJT6BORz8YwC4GVnZIt8q/N1OOFFLu4x7zoiximKp+ApGKLpAFEDQ==
X-Received: by 2002:adf:fd45:0:b0:2c3:e300:f5a2 with SMTP id h5-20020adffd45000000b002c3e300f5a2mr1090779wrs.50.1676361059827;
        Mon, 13 Feb 2023 23:50:59 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id f5-20020adff445000000b002c53f5b13f9sm12091737wrp.0.2023.02.13.23.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 23:50:59 -0800 (PST)
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
Subject: [PATCH v3 01/24] alpha: Remove COMMAND_LINE_SIZE from uapi
Date: Tue, 14 Feb 2023 08:49:02 +0100
Message-Id: <20230214074925.228106-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_235115_184528_923EA2BF 
X-CRM114-Status: GOOD (  13.45  )
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

As far as I can tell this is not used by userspace and thus should not
be part of the user-visible API.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/alpha/include/asm/setup.h      | 4 ++--
 arch/alpha/include/uapi/asm/setup.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/include/asm/setup.h b/arch/alpha/include/asm/setup.h
index 262aab99e391..ea08ca45efa8 100644
--- a/arch/alpha/include/asm/setup.h
+++ b/arch/alpha/include/asm/setup.h
@@ -2,8 +2,6 @@
 #ifndef __ALPHA_SETUP_H
 #define __ALPHA_SETUP_H
 
-#include <uapi/asm/setup.h>
-
 /*
  * We leave one page for the initial stack page, and one page for
  * the initial process structure. Also, the console eats 3 MB for
@@ -14,6 +12,8 @@
 /* Remove when official MILO sources have ELF support: */
 #define BOOT_SIZE	(16*1024)
 
+#define COMMAND_LINE_SIZE	256
+
 #ifdef CONFIG_ALPHA_LEGACY_START_ADDRESS
 #define KERNEL_START_PHYS	0x300000 /* Old bootloaders hardcoded this.  */
 #else
diff --git a/arch/alpha/include/uapi/asm/setup.h b/arch/alpha/include/uapi/asm/setup.h
index f881ea5947cb..9b3b5ba39b1d 100644
--- a/arch/alpha/include/uapi/asm/setup.h
+++ b/arch/alpha/include/uapi/asm/setup.h
@@ -2,6 +2,4 @@
 #ifndef _UAPI__ALPHA_SETUP_H
 #define _UAPI__ALPHA_SETUP_H
 
-#define COMMAND_LINE_SIZE	256
-
 #endif /* _UAPI__ALPHA_SETUP_H */
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
