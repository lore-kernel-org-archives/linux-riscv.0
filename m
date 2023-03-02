Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7E4C6FA8E
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 09:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3liW64VmXaBsj9XbVrOhwkjkPneIJ/+bPwesy3MgjqQ=; b=Oh+Q1VjR4bR7jD
	ZYD72dInEl+vRGx0RFEsTlG2PpvsT2QNLxQpKFtn3U159Z3scLb+mXzdF2KzmaZiUZg7SPWSRASq3
	ilZCcRtFnmPMgrwASF9iuiVboPQBxcGrRNMsm5LbA1BZKvY2X3saLI+K6Jv0gId5sKdanY91IqdaT
	f6JlJIfzFJgUMP8yL8eMCO9idcwtu4RH64GITonb03w6qfxj1lGItPgHI0qezXfEGXI0y4b7f7kBh
	PvcZX66GLA37qDB7xF1xng8bkcYKqlLQLQNjWWrPC0cEKTZns7SvrTkzfI270ZE06MVEcQGngUL5y
	i2S+G6pV2B0Q95zvLlsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfih-001Zga-57; Thu, 02 Mar 2023 09:59:27 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfid-001Ze3-De
	for linux-riscv@lists.infradead.org; Thu, 02 Mar 2023 09:59:24 +0000
Received: by mail-wr1-x42c.google.com with SMTP id l25so15938906wrb.3
        for <linux-riscv@lists.infradead.org>; Thu, 02 Mar 2023 01:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677751162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILvb9GZC9A1qdpzGm/54DVnwfbD0aC1FwyW+Sl0y38Q=;
        b=iEFVfsrb5OtcQreF8wlM/GwKwWXjAdiB5zFZjDGOkxsfSSW2ix9k7XafXuRFWHkNIw
         TQUj1z5ar2C0vEVfH9chUCmNH/nteRlN1JdwyEUKTQ48/qxc5zj7lbxM6oIumNApIlqo
         K5VLD6wVEEWQMgZjLuZL0KrTQGr9096IfMMlinEHKNGLif5eFvYvdBjXluO8Ix1w5R4U
         RJY91d9JKU56mcqJltFuMP1hPTP3suLy9poPdP2dzMNCJAeF1wsN9BU7pj1S6IwmR5Pr
         qxXd+GuaTvJtDc6/YI8Kl6o8vw4aO5d1givhUukt4+tiF5HMj/+lNEF0nfMftS0WTvNr
         b4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677751162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILvb9GZC9A1qdpzGm/54DVnwfbD0aC1FwyW+Sl0y38Q=;
        b=NV/4xM7sTktWi4mG0NjSFjK2Rk40EMt25jRXu8ldH7kCpIE2cf6aUxHnvHZa0Voi3g
         OWBmaFbseL00zQxU1AaxL6r20yE0xkLDsOXPMON1HtxEl9sTCWg/C625SNTgXgPeBAwF
         XW+h5iGOUqNxdJH6Vdf2eW9xsmlhXSSNe6LDJfz8/PVFoKjNt+zE519yosHtIdGKDYkw
         uCOaG2P2sOZyNA6Hu4sHe/PkCXIks72475sZyNbsjuWQx8q19H/jsmH4Uc89YSvf1KkM
         v6EunI0FaIgvoVrYHDA8lfjSpvNDvNXM9Aje/GWXcZFH3Jf1Jw8YMVOrFVyXtOUFDY+D
         rRSg==
X-Gm-Message-State: AO0yUKXGUM+76O8gnnin+uHWosUnVWKeNyVUXZYbI697BZpWYhcOQHmC
	SpF3OfpD3gYPIEcCLtCUwMq+IA==
X-Google-Smtp-Source: AK7set/ZaZqc8Pqp5NMCbp2YvB641qs31ffprFtxgjh4YFRfODcsMY9Ph9awlpUQ4nOMh9NRpwbCrA==
X-Received: by 2002:adf:db90:0:b0:2c5:8d06:75c2 with SMTP id u16-20020adfdb90000000b002c58d0675c2mr7214454wri.35.1677751161891;
        Thu, 02 Mar 2023 01:59:21 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id s17-20020adff811000000b002c758fe9689sm14771605wrp.52.2023.03.02.01.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:59:21 -0800 (PST)
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
Subject: [PATCH v4 23/24] mips: Remove empty <uapi/asm/setup.h>
Date: Thu,  2 Mar 2023 10:35:38 +0100
Message-Id: <20230302093539.372962-24-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_015923_528734_F9920E57 
X-CRM114-Status: GOOD (  10.06  )
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
 arch/mips/include/uapi/asm/setup.h | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 arch/mips/include/uapi/asm/setup.h

diff --git a/arch/mips/include/uapi/asm/setup.h b/arch/mips/include/uapi/asm/setup.h
deleted file mode 100644
index 157c3c392fb4..000000000000
--- a/arch/mips/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _UAPI_MIPS_SETUP_H
-#define _UAPI_MIPS_SETUP_H
-
-#endif /* _UAPI_MIPS_SETUP_H */
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
