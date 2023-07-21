Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675A1EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 07:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zpHnufTBCaS77iq41iPtxDLHlvp8/MkEeRiM6XReEys=; b=HN65YRipTvwWgP
	9fW4TQbIQKi9N6qj8LOsHw9FATc9Y4RbmXTFrrgvTVg7of+RAvufno0AsunCq/8jdC5lGUTR5906n
	xhIKcN3bV3tsXvoCpflbOdfZBEAn41LqQFzLJHtQxWd/5pxpWJ3snVXIjbX81U3FC7UaVgilVE+BR
	w9sui3Z0N7T3shO39oDZIx1GqePnBLW/tBUmvAGJRYvDll6TvJAlTjo3EQyfZXQ/bxMaclKJ2Gbff
	asTgPL30E7XoxpRmMdpsFQx+1WMEsk5LA6Z0oYlIgLVijEXwmMuAAcQN0mSe7FV25aCMgeyGv6hxz
	W3XGKDBXF2IFOQQvflGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkwj-00DFau-1o;
	Fri, 21 Jul 2023 07:53:05 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkwd-00DFY3-1y
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 07:53:00 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fd18b1d924so13199085e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 00:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689925976; x=1690530776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIkLQY6GoloV+JD+TWBkfog1jNXXj5pA5kZEBb1l9EU=;
        b=HQvTIAF9kXtSBDxc6tLNKF2+dn0pwpuDwz+pTMhkOwXmyeOGg8xAiNUhNnrPO8Dq2y
         4qtg31yEtRbWRk6+t72F//zXGUmoPocJIDJpDymiCpDUTYjzYMc/K1KSMusEKX+EzGpb
         Onx08zYI0yjWTkhbJSYI1/+N96bRSjIDVgihEqMphLRp/3zaXJe49Cb655DDzB1mx6uR
         ocZRWbhHUp3HprcZiYWCq4GoJKSaudJX10Sdxpnj7dMYxADg9UgfBBh6hih4mhXR6q0W
         abIx1B634Ijjxw9D+pVa03qX00zOtsDPl5DUspThYTkeCHEHopNM6fECusVvN7QUpQIh
         BCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689925976; x=1690530776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIkLQY6GoloV+JD+TWBkfog1jNXXj5pA5kZEBb1l9EU=;
        b=Tu+Jz15ZDy/YSYA6euRqcdMoDb2xEdY21eQnKhdoicUvd4+Fbczx+FMJooQupKGe6Y
         rJPveXEfiZkWaVuFWn0Tiew5OOSbeUNAr67yUWfc3LM8bozQIIPXqFY+1waoLk3lRbFY
         6nBjIKRijrlfCXKEzyg33BGym/c7objZdWn4Lu3e5rfGw2wHgMgx76vc6d5VumOn6TBn
         IPBTMsiNJnVsCLF3jsbp7HwL6Te8YalkffQu0vpY73CPomY8PZc2oRHQu08MaoXPY7KY
         8sYaJqG3WDX2g/hq54IAY5thWIBuY13AXBHghfuC2lQzPG3K+D5qv6YeAjjvYVr4ewX1
         HzsQ==
X-Gm-Message-State: ABy/qLZdRt4QcDZ9q77ShYaOMWN4BaAb9EB8CSh559GlLkPS+fbd6r54
	w+62NkvDQQsadX8u4nneyOJQPw==
X-Google-Smtp-Source: APBJJlG4jUnWsu4FpTlpiZiIgK9Wy8Mxui/x11b/YNZFd0j/KrT9RSHmNXz3WtNSoHHU5vOtTYDJlQ==
X-Received: by 2002:a05:600c:289:b0:3fc:586:ccb4 with SMTP id 9-20020a05600c028900b003fc0586ccb4mr748526wmk.36.1689925975962;
        Fri, 21 Jul 2023 00:52:55 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id y9-20020a7bcd89000000b003fbb1a9586esm5663454wmj.15.2023.07.21.00.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 00:52:55 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 4/5] libstub: Fix compilation warning for rv32
Date: Fri, 21 Jul 2023 09:48:49 +0200
Message-Id: <20230721074850.310644-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230721074850.310644-1-alexghiti@rivosinc.com>
References: <20230721074850.310644-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_005259_648017_9BB5A5D8 
X-CRM114-Status: GOOD (  11.82  )
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

Fix the following warning which appears when compiled for rv32 by using
unsigned long type instead of u64.

../drivers/firmware/efi/libstub/efi-stub-helper.c: In function 'efi_kaslr_relocate_kernel':
../drivers/firmware/efi/libstub/efi-stub-helper.c:846:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  846 |                            (u64)_end < EFI_ALLOC_LIMIT) {

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 drivers/firmware/efi/libstub/kaslr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/libstub/kaslr.c b/drivers/firmware/efi/libstub/kaslr.c
index be0c8ab0982a..afb857329799 100644
--- a/drivers/firmware/efi/libstub/kaslr.c
+++ b/drivers/firmware/efi/libstub/kaslr.c
@@ -130,7 +130,7 @@ efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
 		if (!check_image_region(*image_addr, kernel_memsize)) {
 			efi_err("FIRMWARE BUG: Image BSS overlaps adjacent EFI memory region\n");
 		} else if (IS_ALIGNED(*image_addr, min_kimg_align) &&
-			   (u64)_end < EFI_ALLOC_LIMIT) {
+			   (unsigned long)_end < EFI_ALLOC_LIMIT) {
 			/*
 			 * Just execute from wherever we were loaded by the
 			 * UEFI PE/COFF loader if the placement is suitable.
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
