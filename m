Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E652C64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 07:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g5ywImdb59+pWW7c4obAsYID3lUCkBmBQDVlTvCqYR8=; b=q741SARyjBtBxa
	ZlWa2H1sHrpri7VtPLbNT20BS5QE+DYznBvIHUZOUOrBiTy64sTo9cgZAoLWHMB3i8X+KfVGaJvP5
	4ucoEv67QSC1VYqOHCILqfYdZWZg18QR7ajw5avbZh6Rl46CyoOi85CiQbLpwQWkk+Eq58Y1pHPl8
	Tkp27f9gTN2Hw6KDuwr3SOLLiZdVcpNy2QbGwrQWt1Lfe6NVeUbiwgdugTQkAWCfmm89i/8QOwCcP
	EeES/9dVdFB+BfgcPWfznbhLXqnDVqlxImPmtcqt4rPO45Lv77v196/fU51pwOi02LIimg2PLVleD
	WN39FTZ2M6iXrFpDs4Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqBj-000OC8-R4; Tue, 14 Feb 2023 07:57:19 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqBd-000O7p-VD
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 07:57:16 +0000
Received: by mail-wr1-x433.google.com with SMTP id k3so7063919wrv.5
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 23:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWjLqsc+NkWMLFdHmbfFb0dn9xRzmwLOXd3uaLGqwBY=;
        b=caX8aWQ8DZKo96HIEXErccmSqQeGKRpDuSdr6010va+fd6heZz1VBNqHbYUWTHczq8
         mezb+8HbIfzaNI36qGubajDNLCzRQzt4Hbgq7MFFxEJGNk3bEGAMc043qE5rdYn342sz
         zVKvXF9BRRNZYR6lWJOn/JnI+PgnmHZPBcTAowttzA8jjfTIqHHQZ+ERkinvG9qHEEWV
         rovUNsOO1j9tz1zELCVd7W981MDmvC6qTN+tjlfDMf18pIEV94eGlS2sYxoOgQ3HkWuh
         MK0V0bkixcCwiYoT3zYKuN+arx2XpkArqn0BbZInm5/TMzCXdMsPWy4n//p8ONoMyppz
         QTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWjLqsc+NkWMLFdHmbfFb0dn9xRzmwLOXd3uaLGqwBY=;
        b=nzKQqKhrPXCRyBU7MYRNI2atrTCkNc+YfHrPz6NMy+lgnxxGmjjg0OAhXDaJks23Vv
         6Hj7uW4B022Z4SnGqquEBbS+7oUxrKCoe5I6ryq9JJL6jg2kSneOtEOwKdSnj1FLk6FD
         Xe+H0yKppaa7J6HIt1rdK/EaJOb9C+bXq+kNHRfYNCtzl8BOnROHVtCvFYgWWv9lmdRh
         ambG+5KzV6Ckmxigu4btTLa4ff1xdAZGs1kGPddctey3mr64KQeLVfIxGEG2j01h3c5/
         iZRQExREASz9AjBP2l8Z0hV4eNo0yJvtdk8LC+Wb7Hh64Nc2vZGDlwsPl9/g3YV1ZtHs
         kP2Q==
X-Gm-Message-State: AO0yUKUz1F5lskgBaae0FChC2J1Xk2LQUCivAkZN80L2FRgS2irjPa9T
	xmy3P35Vv/wMuKWxeNOg5VLBgg==
X-Google-Smtp-Source: AK7set+iS2kYtSEJxwa0DIBeh1AY3bbZg7Y7IAN8bCjXkQu8bp7LWnEg4bsVRpj28otCWhsJxiywzQ==
X-Received: by 2002:a5d:58d9:0:b0:2bf:c0e4:1bc5 with SMTP id o25-20020a5d58d9000000b002bfc0e41bc5mr943365wrf.56.1676361430168;
        Mon, 13 Feb 2023 23:57:10 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id s12-20020adfdb0c000000b002c3ec1fbc0bsm12232660wri.94.2023.02.13.23.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 23:57:09 -0800 (PST)
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
Subject: [PATCH v3 07/24] mips: Remove COMMAND_LINE_SIZE from uapi
Date: Tue, 14 Feb 2023 08:49:08 +0100
Message-Id: <20230214074925.228106-8-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_235714_113105_D9E4D0C1 
X-CRM114-Status: GOOD (  12.20  )
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
 arch/mips/include/asm/setup.h      | 3 ++-
 arch/mips/include/uapi/asm/setup.h | 3 ---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/setup.h b/arch/mips/include/asm/setup.h
index 8c56b862fd9c..a13b9259b476 100644
--- a/arch/mips/include/asm/setup.h
+++ b/arch/mips/include/asm/setup.h
@@ -3,7 +3,8 @@
 #define _MIPS_SETUP_H
 
 #include <linux/types.h>
-#include <uapi/asm/setup.h>
+
+#define COMMAND_LINE_SIZE	4096
 
 extern void prom_putchar(char);
 extern void setup_early_printk(void);
diff --git a/arch/mips/include/uapi/asm/setup.h b/arch/mips/include/uapi/asm/setup.h
index 7d48c433b0c2..157c3c392fb4 100644
--- a/arch/mips/include/uapi/asm/setup.h
+++ b/arch/mips/include/uapi/asm/setup.h
@@ -2,7 +2,4 @@
 #ifndef _UAPI_MIPS_SETUP_H
 #define _UAPI_MIPS_SETUP_H
 
-#define COMMAND_LINE_SIZE	4096
-
-
 #endif /* _UAPI_MIPS_SETUP_H */
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
