Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940A8C001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 15:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j32lXqO+aBBaW8QWM+Q5mPP2m+jYb788gTS1splsxw8=; b=Qj4k1XFYUwDm5y
	e3NOYYxjc1uxRxk1T+g2wgOWqjjARjuqb78ES28GoxXhq/wpkkfwzOaZhLbJrwSLM6fOL7YQGYAuS
	e2XkV3dvAmfXBNfcY0ilnLRx8d+UXChdXOpninTV6f588Qrdz1HfHodqTjZ/NV2/PEOIvLBoCTMaO
	LtXoT/7nDgmDutyKD7WdRpzFQBpu7gBBGNNk2OJoY9RvBZJfNWebrfEBjAoGres3DP6Ph0v/HvHhH
	dw39TS4s7m8kJBvqTNqjtb5mFcdDT1kGC2P9cqUWqLxuCMWGYx0JS8sU/w5BTf+71Y3VLXf/yYXqi
	SnArKTPe6gzYwyPc4c7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJxzK-003hSg-0S;
	Thu, 13 Jul 2023 15:12:14 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJxzG-003hQj-1x
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 15:12:11 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-313e742a787so542342f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 08:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689261127; x=1691853127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZf0qeWm+WX+bv1IFZf8K1PwMyRHAPQhF5RBE2OKQPA=;
        b=ZM5qANd6WeLcZwwFyXrmgXdeZPNHygoE7OaWvEWRKzI6UtObzCbxmP3zfVqwTLzgAp
         keJuo6AS8TIX1aCmgkYH+hkVg9JP4/xN+jttfihreMuN52dV92KDQmnS8kU3iRTU7rdy
         2e6GVnlzyUsnuTl4jVke9Nwyp0wBlzEhYAdgATXfHP5f/4PpjQ1ZxOAg1WZvp9E3EP5T
         DEtvRG8vuWwwh7fsE7Uki2T1eHqRl5vzuvYyrhQf7VtOOB7p5qWWkhRFFRp7gfQXG8DY
         9/s77o7lGA6InfdsnqviK2iU70I6ww9NBY0DBqJYBvoilr+Z0ei7BaGkP5wughoExpr5
         +cxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689261127; x=1691853127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZf0qeWm+WX+bv1IFZf8K1PwMyRHAPQhF5RBE2OKQPA=;
        b=U7zU8YcRq11AOEq1bRBLVOq5hIc5l/IG0HSqBFvD27qwVfPOnMK4C1yu9Y/CC5BPRF
         AOvBDfT1DxWkFQGbuTsh7BaJ5K8tRk1C6ygTmkGdFuolE+X5a/S/8GOmiWUVt4ZDiF/R
         IUB0YTq0TM7QvVDaKNu0FLHTpAZVVTO95hmEiFSqWmg26xDUGraPxrrwf+E+z+0iEFai
         EHu0VWnTTHcKeRKVVKtCPFzwacUbpB1zTGtCVrwi8D4HGdNCXCKDEEoMFBXRGeuqh47B
         X87iUAPlXYvZMNXMqLvoazzomc2g/+x1LmUS+sb1M2A+NyyAoiMwzB44myGrce1SdKEY
         V9Sw==
X-Gm-Message-State: ABy/qLY4zIjcs12megY/TYUwJ1IC67+5SAwdMzFHpDwnTT9KzLvL3zGK
	/tJLR9Kk6qBqpLAl41zJtYiMz4yXkoUP8Nt4piI=
X-Google-Smtp-Source: APBJJlFkFNYrMUFbwh2cf53W6lfedDnWlkmEMnNDIb2MSpNlVfunzKxcD+6qsHxJqfHT2NQg1TXzlA==
X-Received: by 2002:a05:6000:104d:b0:314:2d59:c6d5 with SMTP id c13-20020a056000104d00b003142d59c6d5mr4451359wrx.15.1689261126945;
        Thu, 13 Jul 2023 08:12:06 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id q10-20020adfdfca000000b003144b95e1ecsm8137817wrn.93.2023.07.13.08.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 08:12:06 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH RESEND v4 4/5] libstub: Fix compilation warning for rv32
Date: Thu, 13 Jul 2023 17:07:59 +0200
Message-Id: <20230713150800.120821-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230713150800.120821-1-alexghiti@rivosinc.com>
References: <20230713150800.120821-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_081210_644888_765F48BB 
X-CRM114-Status: GOOD (  11.34  )
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
 drivers/firmware/efi/libstub/efi-stub-kaslr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/libstub/efi-stub-kaslr.c b/drivers/firmware/efi/libstub/efi-stub-kaslr.c
index be0c8ab0982a..afb857329799 100644
--- a/drivers/firmware/efi/libstub/efi-stub-kaslr.c
+++ b/drivers/firmware/efi/libstub/efi-stub-kaslr.c
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
