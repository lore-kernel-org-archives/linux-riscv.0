Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375C8EB64DC
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 12:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JvFcvEYn34PrJSJJj/QRAVS0arhQYTCUNOKubSxN02U=; b=bsyyRR5uoRphLO
	TsB+fIO9N7vkqAhqoRkWUqeslxI4f1zuEkVVY75HMftn6ldAem9eT+K1EfKOSdYL5jPJKTwByAm7a
	m13AFmqZLSYTcur+5FIRt+SsnxPGiK7eoVHTz86zNbGHtrdT5rD+aqowutnn2nby45Xrud2dKZUT3
	JeKRlEEbFtBXNZmpGcinpOuMDG34mx8TfMHXNkDHwSJm3my/QRVfobuvkmvSa+/C4d2/cObpKUGsa
	Ug2sNFwpnSPkzl43QikYQrXy1P2EL+a9nYCoACIv0gvSAK/Az0s8d0CXRmqGDycgMpEUI7XCO+KVj
	twMRAZeddAVsBslny5ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNBwu-00GiNE-1d;
	Sat, 22 Jul 2023 12:43:04 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNBws-00GiLn-0o
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 12:43:03 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-314417861b9so2064299f8f.0
        for <linux-riscv@lists.infradead.org>; Sat, 22 Jul 2023 05:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690029781; x=1690634581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/der0KJlDJ6cwsQs4A7+tIRkxDY3MMfqGccPHIlX2cU=;
        b=gLMFot1BkI0ANTW5TAy3Bb9fjvPkiUYnwOGIenuWohOLcknH0XGZ0PpcM+5zX60Z+m
         6O4mMv39vxTp/o926alCtUzZc0ivcxXTWHFsLiwv6C4Q2uWPZiqQqH7ZRG7cAyIIDqdy
         Susq5+QUDRzIxDTk4TkHnxVhYEgD48ErFCEHctoPsAin4wdcl/dH0Zc/OtXYWM33syru
         Y7w3nuCizPPyraqKoDNUV/m3+Rheyc7jQn3KCBJ8/ZvNAsHAxzPaOmiORG74HLe+FOg4
         lU9ZgkmtlURKG7U2HY6d77tMENB8qrjtfCa9/CDqOzOTj7KREym6sTWEMenKl303dxM2
         TM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690029781; x=1690634581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/der0KJlDJ6cwsQs4A7+tIRkxDY3MMfqGccPHIlX2cU=;
        b=DWEYDoeBYpke/TBtmYk5pCKeJ/+40vL0oigO6CcfTdWyes3bmGO4C9WPp4bEXkhGhX
         JLLX/0LNiAr16nT/uTZjak1uSz+bh74yqJtIy4VADPxR5n6qPyFP/hieMEQp/sUO5fam
         5FGosngER+xKnxBP6W3/CbaoN/x//2IX3YWY/Dyi3lwW0IvzrG1DtDKC9Jfznbqtladx
         Zzu0SNkJKemWFyEuzsyHi/UbLribHsZW2k0R2S2SVp9aoLtA9BQRU1sN48E9sBDfLhN4
         xz5AKyW9d8sa8aF/yjSrAmMdIPNVTfaaZUJ5A6Lp6X/5bAdYvGBPmYRnOaBPeM5O/yE8
         Fbww==
X-Gm-Message-State: ABy/qLaIHIyqxW87sappWjyd8eOJglgZoxoEX6zKYMAxBMm24dL6asLt
	MNmJWtaLwRwUl7+4WLevenjySg==
X-Google-Smtp-Source: APBJJlHkvTt0JkOjTHC/10qCFsIyDPIAfKz5RSmvzPMUq5Ej1dnP9W1WU/kGxqayUnfN2+92c6cZ+Q==
X-Received: by 2002:adf:e6d0:0:b0:313:fff0:ff44 with SMTP id y16-20020adfe6d0000000b00313fff0ff44mr3603578wrm.38.1690029780939;
        Sat, 22 Jul 2023 05:43:00 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id t10-20020a5d690a000000b00316fc844be7sm6834681wru.36.2023.07.22.05.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 05:43:00 -0700 (PDT)
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
Subject: [PATCH v6 4/5] libstub: Fix compilation warning for rv32
Date: Sat, 22 Jul 2023 14:38:49 +0200
Message-Id: <20230722123850.634544-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230722123850.634544-1-alexghiti@rivosinc.com>
References: <20230722123850.634544-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_054302_292007_FC1422A9 
X-CRM114-Status: GOOD (  11.61  )
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
Acked-by: Ard Biesheuvel <ardb@kernel.org>
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
