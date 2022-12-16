Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC1DC001B2
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Dec 2022 16:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=att3F1ozk/En2ZN83sk3GXdOvFCkLbVqnrHJK6Va+sQ=; b=zSeKFhvVUnLWNr
	WsfF/ZzQCB/7iyxSKmEKWhM9tja+k+AyUzsrLWpmN0BViDMwWb8cBt7PL6IK2FlaOrsTP0LU84KTR
	NDUkTucPB2Gsj0t4Niy/R6yTYt+OJmYvxigQrlHHtmSivVIaUKuDshKb/K+X6A51VaRMpeMP8WPu0
	0o1rPtm5H9rP9Flus6kF6H+dBC2CWSmmP96uoD+F3tX0QicuN64A3afDwQMvHRjuLEHoPj+imnP3L
	3tEHVyWA6nIUi/wm0hsrIZxTF+rBvSfSjWJU3ZJb+m34R1OJcJgR2y9p+ElQvRY5Om5bEBfHhjkpB
	id5vRaCVICOWMmZ5h5Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6DW9-00GPXe-1b; Fri, 16 Dec 2022 16:25:01 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6DW6-00GPVF-Ld
	for linux-riscv@lists.infradead.org; Fri, 16 Dec 2022 16:24:59 +0000
Received: by mail-wm1-x32b.google.com with SMTP id bi26-20020a05600c3d9a00b003d3404a89faso1657194wmb.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Dec 2022 08:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKAmpdKbBscT+wI0zsC3ixLztutjRoSSvZIlGNHmM4Q=;
        b=5zZ212IkhjKj94ipOAPbwYPYOlsIe2Q2iWqZ84pUt+gO3r0Eyarf711NDpKVO1C14q
         nc7RKDG6tdAFzkDUhRHwpMXM+IdQ7pAncnZIS/bWk/Hi0ReDG9cPXdIIugmvowrmL6wv
         LMTwApz9J7YrsCYDgOiiPW37lHNWWdAZw1sOVAgSDioakBmFysGZiya7IoZO/Vgqhhwf
         SLaq/M9LNpwE9S8g2yUbEIti1w6dDDrrElKg7SELhEGIvFdL8X/d9W70ns0APlzb3KLh
         EyU6JIbiXwoEnIPZ0d5qtYxPEjutK2P0Q/qFUR125kgS+E3BEfl91D5jcEuGMxVOc/Kl
         QPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKAmpdKbBscT+wI0zsC3ixLztutjRoSSvZIlGNHmM4Q=;
        b=f6086Hp/N/LxYBoAoZ+K5TNHDWxRKbjQKEePgG3xRryhDsZ97gDiXiiS6t5LHbhmQE
         zJQ9m0Ew6Qob/TnPYyjgo3BEd8z6xyMzfrRSGMFKGN5nXxszU3OwbGzsUzi0Bc/NvJmp
         3uEIG93HJDXwijoWJUfvPB8kM229U/cm9c3esa7S9c2e9dQt+5CSEkcJh4nAMwQBg+ss
         cEZsUTEHLyWrCKhOLDOa8Ex67oBdfSyhzH2SE4E0KnGDXigpwsJnNcbsXnuRK4/Nwue1
         XrhK16umWERd83R5Db9HhLZ9QonZGf8b8RoFDNATnKmiF1+MkrArr23aoByznqY5J8ah
         /Pxw==
X-Gm-Message-State: ANoB5plc0uNBErpcZrgZVZRI0XrqGbaBFCahdZpra03GaaNNEq8bFVNF
	mJawrTgYmbB3JwnZP2j2mbmjcA==
X-Google-Smtp-Source: AA0mqf7Kp1ma3mcIhSnx5tq7MByphnU57QGiZGBYUPbdSWTo0NaGRsZNrXC6At0HrKNSMT9J+W//Ew==
X-Received: by 2002:a05:600c:4f89:b0:3cf:d0be:1231 with SMTP id n9-20020a05600c4f8900b003cfd0be1231mr36102867wmq.13.1671207895040;
        Fri, 16 Dec 2022 08:24:55 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id h16-20020a05600c351000b003d23a3b783bsm3450995wmq.10.2022.12.16.08.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 08:24:54 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-efi@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 3/6] riscv: Move DTB_EARLY_BASE_VA to the kernel address space
Date: Fri, 16 Dec 2022 17:21:38 +0100
Message-Id: <20221216162141.1701255-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221216162141.1701255-1-alexghiti@rivosinc.com>
References: <20221216162141.1701255-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_082458_734317_8C19E4AB 
X-CRM114-Status: GOOD (  10.20  )
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

The early virtual address should lie in the kernel address space for
inline kasan instrumentation to succeed, otherwise kasan tries to
dereference an address that does not exist in the address space (since
kasan only maps *kernel* address space, not the userspace).

Simply use the very first address of the kernel address space for the
early fdt mapping.

It allowed an Ubuntu kernel to boot successfully with inline
instrumentation.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 58bcf395efdc..d5aa6ca732f2 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -57,7 +57,7 @@ unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
 EXPORT_SYMBOL(empty_zero_page);
 
 extern char _start[];
-#define DTB_EARLY_BASE_VA      PGDIR_SIZE
+#define DTB_EARLY_BASE_VA      (ADDRESS_SPACE_END - (PTRS_PER_PGD / 2 * PGDIR_SIZE) + 1)
 void *_dtb_early_va __initdata;
 uintptr_t _dtb_early_pa __initdata;
 
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
