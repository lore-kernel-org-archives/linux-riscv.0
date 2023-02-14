Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375B2C61DA4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 08:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dsCCdiZNE+dieEPPUuH+sDSMR+e6sP8YC7es3uH+uds=; b=FatbnDfPf9Mbh0
	Nhv+diAP03WKoQ5Hf4+UcmDAR1B87EMoYabFryaahPI6/hJ+yJyVLaE6Sm0UTnk3pnLeXW5q82+kh
	+Np6lUpj1cbEaqKtSJMYjDAz702XvNhND4BcdUmXOTSrcxfd6hQQXAMn2z0I/wsQ4fqn7fRtfYsrU
	VDZiVqXcnm7ZlHqJheTZxldpvpQHYIi2GrpRJ4gqkELJ5KmOMVGWbeT1kwWSxNKzf+IjvVyGFRfBL
	RsSdnkU/bYXesgpqtDQCFU574PdTd+VzrQ6LAm6qMauCcUrvcqU5URcLqhXVZnu7SZ4dxZ/RYr3jg
	S/Wi2xKuXxaEPJm6nCNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqHd-000Qpk-1R; Tue, 14 Feb 2023 08:03:25 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqHZ-000Qno-TP
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 08:03:23 +0000
Received: by mail-wr1-x432.google.com with SMTP id bk16so14688902wrb.11
        for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 00:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWYHj4zorz+dwOxhMMH91bCZKZH71c0fjl4K1DE3I7g=;
        b=27dlS2aO0uft324x+5s1DeYbloYz3UgO5DgO75VDlplQxxBVeI64VkQzc+Byd8Fu/Z
         Xka03pnhW1NbtoFStNpUrISXlzzG/TAk7uTdioQtnWEclNcJ56F+eb2Buf+CDzsIjDBa
         wGPYMfPCSoPjGcXzx0cPQO4ARszV05IlnyXN6LVlv1T7gx5cyxtQC9Ss7sDVmmmsdRGg
         FC1qBiRgVJKFMTOWAF531BXN8fSAKHBnrY8Sk1F7aCe9PVMMmxdr3HlQ8X9W+zrUSBJb
         J6C2ybiNqsD6i+accbqJBNvWRrnbVBq1PXgtShoItYGXBi77TYgeSR0F2epforxZmM0s
         AR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWYHj4zorz+dwOxhMMH91bCZKZH71c0fjl4K1DE3I7g=;
        b=AeVMGIxNRmP6p21joaqbdY4oQRPG2eRpoflEqf8tcznAu3LptlH6upUCXBA2FnuSXj
         FqLuyzRfhlM2IgVeiQ0o7yWw8wBdz9o2EMy9Nj+dn0l0i/eg/5qDMo4+uSmZOGW5kng9
         yT91Ry4VLWylvEUHmhA85RDPNuYEbJfdH5j1KeEKRfJGIt3R/dpC2Eci+rGkfaDd4Z3z
         rrXOKOphZF4wgzNKA2yaqxl9c1eYcb4WRM9mWhKvHmzCKZ8jfpeFAUQiePV5PPDFnsu9
         Y5dESirtUEnqMXa4L5Gmivd9uH12cpKNRjoLzLLc1XVbhBZ3eYRoT6NEICORrvlvrt6+
         D8XQ==
X-Gm-Message-State: AO0yUKU3YXCKD+3pCIE9yY2eKNXimLSuL9B+fBhSeqv7n85OL8HJ0c7Q
	oT5L5KSEf5vPpO6agMAGiuniMQ==
X-Google-Smtp-Source: AK7set+16HUKFeQRbMq4B+hriqCT9+7bWN18GPL4d51zKSI423HCnDqYe0sW8FBEL0We84v1KhSO4g==
X-Received: by 2002:adf:e54e:0:b0:2bf:c09a:c60e with SMTP id z14-20020adfe54e000000b002bfc09ac60emr1259998wrm.2.1676361800528;
        Tue, 14 Feb 2023 00:03:20 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id n2-20020a5d67c2000000b002c53f6c7599sm11635424wrw.29.2023.02.14.00.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 00:03:20 -0800 (PST)
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
Subject: [PATCH v3 13/24] alpha: Remove empty <uapi/asm/setup.h>
Date: Tue, 14 Feb 2023 08:49:14 +0100
Message-Id: <20230214074925.228106-14-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_000321_976320_82007FA3 
X-CRM114-Status: UNSURE (   9.90  )
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
 arch/alpha/include/uapi/asm/setup.h | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 arch/alpha/include/uapi/asm/setup.h

diff --git a/arch/alpha/include/uapi/asm/setup.h b/arch/alpha/include/uapi/asm/setup.h
deleted file mode 100644
index 9b3b5ba39b1d..000000000000
--- a/arch/alpha/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _UAPI__ALPHA_SETUP_H
-#define _UAPI__ALPHA_SETUP_H
-
-#endif /* _UAPI__ALPHA_SETUP_H */
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
