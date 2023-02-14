Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9542C05027
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 08:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5V5EBRZyty0CVlaDQhL8nsJTe66bKVX3YOikJEn9cYA=; b=2z1Ud+hdaxq5Rc
	cqKe10zStjNdlP7f9XZbMg5mr3V9ZpI05ZcOcixvOTMkfkLxWJx31CZsPKBGWl3RBy9/VWFU9ECr2
	OkdWq9AYAC5gnGUmaz6yKx85umWBgIHZgczFlX+rcNjXX9s6guB/3eWvPJWTnArsDgeiX0xhzrCcg
	lKKhiaIxe9nhjR3n7GvaO0Zmy1eR30U3phWyoZiWLUxinayDLzY0qYj8Ml3viu5R5JUDPV8w5fjIC
	3zPBRCWgqlOX2kTgcsKXAnkCYlTIaub+SwB+7Z6R814uLWaMuZmNfiWq/W/E8iKSqA+HiGBuRs+gm
	Cv0DIguuXuKgXg534qcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqOb-000TLD-55; Tue, 14 Feb 2023 08:10:37 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqOY-000TJ1-2C
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 08:10:35 +0000
Received: by mail-wr1-x430.google.com with SMTP id by3so13408574wrb.10
        for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 00:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GFm9NTVm8dbp1GpfLPnAIV1IFir3mGxMVXJeR5p3rs=;
        b=PTQkf//dJGBi2m4Z02VrlE5ANJFq2MWQ6OYQ8nrykhLGUsTt5XBy5YRbf9k9QQegRY
         BVMzJeHG2/hFVSB1Fa0QtoB+NswSMEx7hYwZhLpwiCjCHYi8Y6QbOTsMsY3YRaN2fxyI
         TQrME1t7VPJR1xsC11gsDznxT0+kI7jvgwxSJ4o858yIfRNXRcmvtAxcaRNyUPEuNCl2
         Hm3cAUgxzybA5MtTnncNweGachZ+4qdYQplQMHP/HhiBFsXSovoVwRHcNBk3sGiUk6gs
         zKB5R71fru3DffzOCLnt/KNVPa5PO68WzDLt4s5DKXCBAv8XkTB3JqSiC1c2d82rGL2R
         LHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GFm9NTVm8dbp1GpfLPnAIV1IFir3mGxMVXJeR5p3rs=;
        b=VsQjcr8wPkuwjxLjiYYVnwqi5CbeTcGnNsZPzH1FHuUJf7u3bdpXWf6tur98faeymw
         ofG6DIELz7PE+PM6RqoRcpjeq03Z4IThKKEhK9OYkn7K/dM5NQ8b8fta2mRcgd4E/jag
         0I/ErfqjuimKsQhRtt7v+SCrLKe6lEaVKZM3BjpyMN+UsVISb3qeuS92dsr3kNmR8e2J
         HWPfkVeMWbWx7nX6fGzqqqI7yuPdsdroNG0pjHT8Op0fwP56sMnw72ziv1aSeUUYgO2p
         Rlx20YWtUs5lVAZxiaVjiVJCNaeWEH4D0U9APydB0jZuL7irkncRruARy+eNT9GNv315
         9a3Q==
X-Gm-Message-State: AO0yUKVzHACUZZioHES/G20HkIq1PqUEyOpFTY54PRAdePB7CA3Artbh
	zbKKdgJ05MLviGXY7xFZhW3AHQ==
X-Google-Smtp-Source: AK7set9cFggn5kLsyauNurU9k3OzP0c5nfv55sbLNFuogeg4x/2W1qLasJcZZgSg2XJAOsdA/Tl6bA==
X-Received: by 2002:a5d:6183:0:b0:2c3:e990:a1e3 with SMTP id j3-20020a5d6183000000b002c3e990a1e3mr1228880wru.60.1676362232683;
        Tue, 14 Feb 2023 00:10:32 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id b4-20020a5d4b84000000b002c55b0e6ef1sm3398514wrt.4.2023.02.14.00.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 00:10:32 -0800 (PST)
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
Subject: [PATCH v3 20/24] x86: Remove empty <uapi/asm/setup.h>
Date: Tue, 14 Feb 2023 08:49:21 +0100
Message-Id: <20230214074925.228106-21-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_001034_143239_ADDB3047 
X-CRM114-Status: GOOD (  11.06  )
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
 arch/x86/include/asm/setup.h      | 2 --
 arch/x86/include/uapi/asm/setup.h | 1 -
 2 files changed, 3 deletions(-)
 delete mode 100644 arch/x86/include/uapi/asm/setup.h

diff --git a/arch/x86/include/asm/setup.h b/arch/x86/include/asm/setup.h
index f37cbff7354c..449b50a2f390 100644
--- a/arch/x86/include/asm/setup.h
+++ b/arch/x86/include/asm/setup.h
@@ -2,8 +2,6 @@
 #ifndef _ASM_X86_SETUP_H
 #define _ASM_X86_SETUP_H
 
-#include <uapi/asm/setup.h>
-
 #define COMMAND_LINE_SIZE 2048
 
 #include <linux/linkage.h>
diff --git a/arch/x86/include/uapi/asm/setup.h b/arch/x86/include/uapi/asm/setup.h
deleted file mode 100644
index 79a9626b5500..000000000000
--- a/arch/x86/include/uapi/asm/setup.h
+++ /dev/null
@@ -1 +0,0 @@
-/* */
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
