Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4D9C61DA4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 08:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g8HICeNaENRfPKORNsTVf0kiUPQzbzvUnvwnWxawPDk=; b=2JfrMMHr4AfGZD
	t8l8JONWZl1nRv//zp4WPoLor2nF5WRaGzo6IrxxrDnAVEjzv31RrqPRMke0qm9SMukjrOrcLItl3
	ur0uyEIqUfMrS9df/f6k93NBqttRAu8uZqd9YPqk8B2/VH0WA2LtyU/zq4Ps5+NLkQq3xzLzKskZR
	dguGDNsEUCfTu+1VP7lXZBld/Zo6nwTcV0SUKU+k3ml1pHRTI/+IIK0vhB4B0OoIl+7Xr7jYu7Wak
	uBvostRzq5Nl/jb58vesmvrbIVlRpMEge4AEktHWtzEsD8sGcxtrXAM39vPqAIXwofziMqE1rcaL9
	Esqi5p09WSTz0+6o3F8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqQp-000UHc-JT; Tue, 14 Feb 2023 08:12:55 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqQb-000U9Q-Lo
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 08:12:42 +0000
Received: by mail-wr1-x436.google.com with SMTP id m14so14706521wrg.13
        for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 00:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWpoWTHF+daqxuKXm60VZYbfqB4+Spk5kTFrpLEIhE4=;
        b=Veh/EHYixy/BVr2GrHtk30P5YOPi4EHeSNqoamBT39WTsSXejEs0UE30C93HqcRFbp
         izPwCu8TUcJCCnqCQUAY76bJWXbwocobxnV2kZxn2xUtxnjsLvfB+9HbXWhAb+VvhxwT
         ARoUqyHz4DGmfUVA+DxyMln0z753FAek0lIkRmiTL+glPB9eA2+4Y+LhwF4bY5+c6Fj7
         K5SkuIZ/rdq4GcLIl9I10pHsVItae5lluUj0xTVWSi285VRJODP7+Dsb+9bCPUpOm4mh
         jpS7KbvLNAtE7HUyXRC7hgyv9H7uPIhwNYJ1Tdh6UaI1eBiLIy+6gQu11e3k700HLthN
         ofOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWpoWTHF+daqxuKXm60VZYbfqB4+Spk5kTFrpLEIhE4=;
        b=PdNSwT+TRP0iRio1eLDekGtMdriQnPiHhk2ZQrVk6EVcLt71QX1leAFOybgBZNwqIb
         UC7YYn7xFTBZaTi3KWN93UNdV891rCiTeL3q3MF45ITvAgvRqwqmqPabQbImdzgyEax5
         IYi4AGBFzQieMP42AC6GswuEN6GOTRY3HdWbu1+sMA65YpyFXUmkpkScvxknL83M1aDw
         uAkrOp1Yb2jqORxMKdGD0JPPb79eh0DvLbJu989VKqf6TsmNtlEhuPa3GDiO1cHCOdCd
         aXO/+YgOzeo/nRpVlHZmioIEgwA3bOETLbLFioK6De7Q4annWTKOo/m9tYLSd64omnRM
         XsYg==
X-Gm-Message-State: AO0yUKXrKUJCAoU8cfYNuFHktRZQRIfl5t1KevQJ/a6EiPHRvLItLcgA
	KFkHpZi80b/hmzcjEurFvCHAsw==
X-Google-Smtp-Source: AK7set+d/Wk+5hZQ8NSPgK4Evsk6EpiRcuFavYqIB7p0C+RXb/iGs1hy6ywVSaUPMKt3GJQZyND31w==
X-Received: by 2002:a05:6000:1b01:b0:2c3:f4bd:2582 with SMTP id f1-20020a0560001b0100b002c3f4bd2582mr1210111wrz.46.1676362360196;
        Tue, 14 Feb 2023 00:12:40 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id l4-20020adff484000000b002c569acab1esm120587wro.73.2023.02.14.00.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 00:12:39 -0800 (PST)
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
Subject: [PATCH v3 22/24] powerpc: Remove empty <uapi/asm/setup.h>
Date: Tue, 14 Feb 2023 08:49:23 +0100
Message-Id: <20230214074925.228106-23-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_001241_755180_0C60C7B0 
X-CRM114-Status: UNSURE (   9.81  )
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
 arch/powerpc/include/uapi/asm/setup.h | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 arch/powerpc/include/uapi/asm/setup.h

diff --git a/arch/powerpc/include/uapi/asm/setup.h b/arch/powerpc/include/uapi/asm/setup.h
deleted file mode 100644
index f2ca747aa45b..000000000000
--- a/arch/powerpc/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _UAPI_ASM_POWERPC_SETUP_H
-#define _UAPI_ASM_POWERPC_SETUP_H
-
-#endif /* _UAPI_ASM_POWERPC_SETUP_H */
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
