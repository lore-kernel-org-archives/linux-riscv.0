Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083E0C678D4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 10:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iDXUqZbFtKqPNjcLXImlWi40HNRgmkx13PLN8axbbrk=; b=krWI21RWYKx0TN
	tlEZHYOM5JzoYpqIL9rYlThyM+khMJM6yvqtnRSkVAqg8g/svCB9pZgJX+v3OBjIwk/G88iRQBev/
	jfREWo+ZZEPniqqrBGTJJtO0zBZ8FTKpFKdhrJwT9wTwVncTmmYwQrPvdrX7AQxVHiNGKWBaPYHbn
	WDI6oQ7pfKCaO5UEBVT4I4nbUPRTdzsKsYmZRrcOyoyLlYUAj/a9lwoaZwl+NoxuoAUgKQ/pnGPAz
	SJeeawedcaI17kz74LoNAkvvUw72v331lx/AGNg80zuh4euSHcR5Bq4AkFR8xODfeZRR3qTfjtRRE
	eC9iRhDEsFeEMRVHFQ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7n4-00CEwa-9o; Mon, 06 Mar 2023 10:09:58 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7mz-00CEsC-HT
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 10:09:55 +0000
Received: by mail-wr1-x42e.google.com with SMTP id f11so8175819wrv.8
        for <linux-riscv@lists.infradead.org>; Mon, 06 Mar 2023 02:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678097391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZOQ1qdZsFIK5hbGOnWeLVu8XxoTb8xkf1L43beLt1s=;
        b=uFqyPU/KfF2H0sgeJPKblQQ09z2QF+U8QLkec7GtAjnGRixcmkQQHmI7463iJRt1T/
         rHxu0Kl4nc3nOt5MH9Ymte5dM23zyqLTRTNXtNU/pE708hNq7xfdVy9kEFY5gWKXtEwu
         IOizVhQJrEUxmZR+iVQR/Op/EKbjLs+sDVdMJbW1oFXrIiiiohfr4Ht1NR2SXiWfV4yF
         vCqG7L6DlmSxUldGFBQRAIoJ9f/jjDlGsHjp0/BtyE1TaiFX6kgDAhRCjZMstOl1yuBn
         ROiJ5Ouz3oB3EdmXnuAEfAUOcog9CZw6U/stmGUU76S9rvh5HigWpSduzV3a1puQbFWA
         f9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZOQ1qdZsFIK5hbGOnWeLVu8XxoTb8xkf1L43beLt1s=;
        b=JYGwGAkBFnMpfbnkH1ImmNLS/oBmUgU/KqWEtNpTbsPFxPpZRmRMLJliqvP2TgvmL0
         L4bw+94NbIT0hblTrlbtd5p36GlUxMW5SpFjqPyogAFPuu3MnayZ7LxLXQxzcn+ZJ1NO
         Ss7NOc/lzjU9S0TWBlraLP4nf+8lW84l52cCq6EedC3VAr0rpQtoCafTBzVv/OBwPJIx
         cDqWuZINXV1q5kuLfu2eENX7AeBD7j0iKl4VUQRsd4ARdtjsN9+p6JpSmIbOrSUebMI4
         Q5dwllhS75vlxiNOAmjtcS3pXNkdWM5HeSvT6hGbSiTRnn8nVw3WBhh5NGS2ON00ZVKM
         h3jA==
X-Gm-Message-State: AO0yUKWRK5l2SSbCjV/nF6JmLllKTsxDEleDReLgsJucftKepQ8gzK3/
	+DLk25WsFxeOD9jpOpVc3QFq3w==
X-Google-Smtp-Source: AK7set+81v6+Tn1jgTZ0GG84ONU4lrLBfEM4VVz0EKMiaYSTRJq6zNMe3zar9b+ifVJD076yKeNEYA==
X-Received: by 2002:adf:dd83:0:b0:2c7:148c:b054 with SMTP id x3-20020adfdd83000000b002c7148cb054mr6259157wrl.29.1678097391202;
        Mon, 06 Mar 2023 02:09:51 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id k11-20020a5d628b000000b002c707b336c9sm9267953wru.36.2023.03.06.02.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:09:51 -0800 (PST)
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
Subject: [PATCH v5 04/26] ia64: Remove COMMAND_LINE_SIZE from uapi
Date: Mon,  6 Mar 2023 11:04:46 +0100
Message-Id: <20230306100508.1171812-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_020953_637283_8C5F4EB4 
X-CRM114-Status: GOOD (  14.51  )
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
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/ia64/include/asm/setup.h      | 10 ++++++++++
 arch/ia64/include/uapi/asm/setup.h |  6 ++----
 2 files changed, 12 insertions(+), 4 deletions(-)
 create mode 100644 arch/ia64/include/asm/setup.h

diff --git a/arch/ia64/include/asm/setup.h b/arch/ia64/include/asm/setup.h
new file mode 100644
index 000000000000..ba57909cad4c
--- /dev/null
+++ b/arch/ia64/include/asm/setup.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __IA64_SETUP_H
+#define __IA64_SETUP_H
+
+#include <uapi/asm/setup.h>
+
+#define COMMAND_LINE_SIZE	2048
+
+#endif
diff --git a/arch/ia64/include/uapi/asm/setup.h b/arch/ia64/include/uapi/asm/setup.h
index 8d13ce8fb03a..bcbb2b242ded 100644
--- a/arch/ia64/include/uapi/asm/setup.h
+++ b/arch/ia64/include/uapi/asm/setup.h
@@ -1,8 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef __IA64_SETUP_H
-#define __IA64_SETUP_H
-
-#define COMMAND_LINE_SIZE	2048
+#ifndef __UAPI_IA64_SETUP_H
+#define __UAPI_IA64_SETUP_H
 
 extern struct ia64_boot_param {
 	__u64 command_line;		/* physical address of command line arguments */
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
