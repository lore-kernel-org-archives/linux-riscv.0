Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3453C61DA4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 08:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IpdHzY4xCcbGqKnAaeX85ylf7KcjuHlDiY8pgz9dnd0=; b=TBYfkP7VjAO7kd
	QUS8Lgeae6YE7P40/lSsJROWBVAYPRXFgo9xHW1unW2Q85W762R0ZEm4Y3rDtnZ4ZINo3hBIVv1Jf
	Wkp/Ho0Z04/gvtbyZ2hAj4Ptg4NevFH+2ZP8bomYwYsOvcvg1swJzcda+NEShQPX4HiH8lY1D037v
	dI5rJ4OwVnn5g06rq4bDjY41llymU2Vff13ektE9TSz1WSN93knMdwts6i5xBTxLgLt7rgelO70D9
	b4deLcCIxHxekBXVvOps5Coj79yv+EVkeS/JsXWs5sv7OkyTu3VKW9uA5cgZa0Wjz+y5kjnvREfsF
	/qTedG5siWaWX8axkXmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqNg-000Sw5-MT; Tue, 14 Feb 2023 08:09:40 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqNY-000Sre-11
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 08:09:33 +0000
Received: by mail-wm1-x331.google.com with SMTP id m20-20020a05600c3b1400b003e1e754657aso4603741wms.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 00:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIGhaDfE5SLWmKnSG9ikHY6squrBg187QDirpB8eFVo=;
        b=3lVcUd9sn2zQtFJR0u5J0kIaXOBwAUdWgS6TENWUzffST6PzutUUl4KQpRH68UCRqd
         AmXoKs3y/uU0PKnWtHqvwoOcZOhZN4v1Z7I6ss2MsSWN20umEr3jHUop77luRvjOQ+bk
         v9lp8QZUxuG4bx+6A9WxrhaJL2ZCl/14dMrBN4+4+AEiSiWCOTWv1xrROBT0jCNPejG9
         KRw3spY1j9L9Rl4qLoqZjdsJkumRxyNrfV8n0f91+GGjQwwO2+2THxyXibuvkVx1Ha1Y
         3AaXyilcA+IllPgV2/eY+YJepAx3JFCIrPZ694HAOjj7uDLhBVRVm9DXebU0wkwu1Nw1
         GNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIGhaDfE5SLWmKnSG9ikHY6squrBg187QDirpB8eFVo=;
        b=0d5naHus/FvRcAm9epcEZtFf4IH2xPzzuYLxbED4KoBOhD4hU9S2YT4+XE+Nhha2wq
         yVVHHnIxt+CwqPtQNDTnwDj7QqGWiJunt1Gq7Xna7L62N+tH4N1SVykej87Se8/E17/K
         NmJ/wbfVpU/rD89ySdAHW7BnW4q9XF2dqwCpAE58vQeMO6O2J8F7RyXcBB3kdTWiMXIX
         UTB92FBxcse/x+iddr4KT1ADYpk9aN4Fy8zTpF6vHloEuZ73yo2d66AJyeQE0E9hhQNc
         hAvrqplmyv/UCH829HsS1mkKcliSARSDwmOsbYWHssN73rIkmxHJ380TcJ/L/elNCEGH
         rhSw==
X-Gm-Message-State: AO0yUKVL2M52Gpi6BBVr7te2Q5MtMQJX4irA6CE6jfs5negiwX7zCg6q
	6jEo0nYM0wWzoSiZs7CK+V/pOg==
X-Google-Smtp-Source: AK7set88Ec71bhliYVjT8vjP3kYFJaQCuobrrvuvuiyk+qYoiCOwcAHhOO4G490cg0AP2c/iYiSZ+A==
X-Received: by 2002:a05:600c:1817:b0:3e0:c0d:75d8 with SMTP id n23-20020a05600c181700b003e00c0d75d8mr1854136wmp.23.1676362170796;
        Tue, 14 Feb 2023 00:09:30 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id s12-20020adfdb0c000000b002c3ec1fbc0bsm12256456wri.94.2023.02.14.00.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 00:09:30 -0800 (PST)
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
Subject: [PATCH v3 19/24] parisc: Remove empty <uapi/asm/setup.h>
Date: Tue, 14 Feb 2023 08:49:20 +0100
Message-Id: <20230214074925.228106-20-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_000932_103011_01B2118D 
X-CRM114-Status: UNSURE (   9.98  )
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
 arch/parisc/include/uapi/asm/setup.h | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 arch/parisc/include/uapi/asm/setup.h

diff --git a/arch/parisc/include/uapi/asm/setup.h b/arch/parisc/include/uapi/asm/setup.h
deleted file mode 100644
index bfad89428e47..000000000000
--- a/arch/parisc/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _PARISC_SETUP_H
-#define _PARISC_SETUP_H
-
-#endif /* _PARISC_SETUP_H */
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
