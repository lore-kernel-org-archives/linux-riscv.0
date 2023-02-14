Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E034AC6379F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 08:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mjp96XdS/eMfxrrxkdkUJe1NKbkF3pRG7z8bGknRw1I=; b=zJV05bUTVwQnyT
	+SgYWGZHakxCfEpNpQrvjaakzabsikpOsyDobuY21oUH5ybTVZvuf3ldkDRxgTv+6ubLgx7IPe7Gl
	exd27mvZa8ZvEjgdC2be2nosia2BaDiYcrLzM060OhyrYajDnOSi0sQmPJqLsYCLrrnvmseEfxKqg
	H1siu7CymaqIHmYouy0xYdAuYSEGjecAjH45mkYyR4xvtrnNEgGYN8IsNg+7Qvxrz5a3hAiH5jEO7
	q7IEBVUtv1a+ArRfKxLmwz8d8WCcR2APBS0aMh6rMGI5iKCDPRS35LNxBX4bbCJMXLP3mQUOvc1zT
	Phh+m3axI3Ofk0g8U96Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqPc-000TjG-PH; Tue, 14 Feb 2023 08:11:40 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqPX-000TgA-Vf
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 08:11:38 +0000
Received: by mail-wm1-x330.google.com with SMTP id s13-20020a05600c45cd00b003ddca7a2bcbso5521009wmo.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 00:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvpaBOHRxynQVN76sYSm78ChjX1znmriOrQIpZIS+4U=;
        b=5NlXgVjhh9vbvViub6LhSOmr8tVa6IBVEyF0zRfB83IByLzArwAM+0qw+VxsNI/v3O
         9OWtZbrdL8JfvpiE3iq+Owwbn7WHXgFSoaFB0e4OactZe5gsW9qsGGDTPeYgJylr7/3s
         3F4MpYflrtieowDacsXG30s/rLOj/tHYjrMAdlnpeXOJLEslGasAHVP98/8wE2cbZHi+
         DtJVObK2BvR1NA+BCeSfpJ7/0/Xqxv3cM7UfBXMSNhytYiWpfcvUEjSNTOi8cKTr/Na1
         dTCAdzJ5u+E++JxwEI0i4jgV9lz/WMEz6jZfUqV1tX/DrncLas0AKVlLr+8/5kI49TKM
         W/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fvpaBOHRxynQVN76sYSm78ChjX1znmriOrQIpZIS+4U=;
        b=QNKyxu05fDLb6EdcADlUdqtn3Lb8komTyAnRSdFNvgdPASfhmQ3RAf55353fgfR+1M
         GyhfAiSvPMdPbFyhprkzrGSa3afVkf3Cnu5/kLSkLgBFJfCcD7C23fksJ9O2ItADY5Ve
         WV4X9eHsq+JeXr7Q+ZBu/kjn2e2hhna7LCYUaOvyJY6iPIFv7iMOdGluOO8f3WdSePRQ
         MC7P7IF3axEbWRLGFd/HsruG736FG4DrniqcdNWoZpGoc/Pw2LhaE9xrMb+//RKN9DYM
         AXj6q0mnliKRaYims4CoPoEUR37nblThnm8FSew2dK1aVf91lJxD0sGFfi0MR0SfKPDS
         7uhg==
X-Gm-Message-State: AO0yUKUW1bPMNjZSMAyxbTW0PKJUVHWhVJU+7bCXSPTkMVSVPNjqxwQn
	u/Xbr5f2ALNTCUOTqN2712VwPw==
X-Google-Smtp-Source: AK7set/6ZO0GzOxTpCDrsVlt02f4BgyGKOm1zeoaq0l7Vu0+xmZuXJDnZSoDV/hFx/zxMjZLosjRIw==
X-Received: by 2002:a05:600c:994:b0:3dc:5937:35a2 with SMTP id w20-20020a05600c099400b003dc593735a2mr1855049wmp.9.1676362294487;
        Tue, 14 Feb 2023 00:11:34 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id r18-20020a05600c459200b003db03725e86sm18173022wmo.8.2023.02.14.00.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 00:11:34 -0800 (PST)
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
Subject: [PATCH v3 21/24] xtensa: Remove empty <uapi/asm/setup.h>
Date: Tue, 14 Feb 2023 08:49:22 +0100
Message-Id: <20230214074925.228106-22-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_001136_053543_36ED813C 
X-CRM114-Status: GOOD (  11.11  )
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
