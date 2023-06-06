Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A35C7EE29
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 12:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WXiIfAru68Pah2YokxqentiyPDgu2btJldtULj7Oy24=; b=HPWsFhQVX7Z7va
	xb7kv2q9nlwMQDI1Yqzy/cMPDa1UfQPevpk4+RTzG6e5/xCwYkHrJZR7TOS/THtmS02l5AafVwotk
	mcREH9Jf7I8kjbdFbPQ0dpiNXsWjVRB3KsifK4CYrikmfyvbxJBpj8jff5KQrJ30k7Dbudf+LTzGY
	7uXM0sODYn+sWEGGtFbARX5TY3SbFDuj/BXBfu47hOBhKwfMNVIladNe+39FjXRsMdRhMUA4JTPa3
	IRHjKS0DNV73zSpS1ApunNGJG+zjNWPgMKZhE2yV96WX9RSXXDLkDgIolGt0Au1GXHThUSx/f21zK
	9g2v4MP2h85jUBKFqlYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Vvh-001fjj-09;
	Tue, 06 Jun 2023 12:36:53 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Vvf-001fit-0m
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 12:36:52 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-30d5931d17aso2741406f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jun 2023 05:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1686055010; x=1688647010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRJCBm1K3gKtA9P8oa436oFytzNm3ZRYlTVQKHg/5x0=;
        b=XM2xBLfv60ptr6Go/ry9Nj6ExuIoxylGWaDS0x0HaqXjZj14ydn90vmEhmG2WtoTx0
         qH5ZToAQJimQF0Eg9MVSsgCVWfV5C/BRlOc238Pl0cq4wPVlr+WGZE2BkYcKBmcWPppA
         J59b8Q9Pbun4Ij0HfysGKaIo1+ciqlXuxXHJCdhvXTHnpZucM5puJrLn0hQt+nq8cLmJ
         mgScgV3i60C2NOPGI+yRAsCwngLFQJ3JrfESANdaNzMAHH1YZmOeJk2oYYtl90l1veaa
         dKZDiWAREns7QCGSz2qGYD2DeOpMYA9I5OUT+QAMm7t1RGenWXFqVVeL4R3+Oyd1WiS4
         k/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686055010; x=1688647010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KRJCBm1K3gKtA9P8oa436oFytzNm3ZRYlTVQKHg/5x0=;
        b=LWIo2cnWXE2OL6o5i4pHO1hcKLHBhue8bGB4S4VD069iilha5b1RHL6qHkPGGofXbr
         hZcaPUQIhmjccxNUhJXR6t+UcXqQM8xShFvD44ZfBVAJip3vfRaZS6nMSVN+cjrx0ZPG
         CHjWzQ7yOMywtFV4IbsOXGRFcvWX3E01pe8OUX72sHKTM8FSrWHqJLL6tW4Tvyswa4/G
         HqW9pVEe5Wo3GDZGoRpA9iYPPc/2Yz4Vp/HkbObIRUO6RqgizpiBLSLpbM3MnIjltNvw
         ynoZC6ws80pqNLx9/uYa1ELiVhxexE+wdoUEaTZy+U0ku3AbyB6izK0adriKNeygeTLu
         HZzw==
X-Gm-Message-State: AC+VfDzibqg70IpC9aF9e+PDGKO/mimwW6z/pmTxGUyKXaVanQ/2hqE6
	ztPnn+eZiI0IMlSZGLv7DRdYDDlhrk8XJEjlP5g=
X-Google-Smtp-Source: ACHHUZ5ekNV2hJsIy3WOef/8IkqukwqVEzw40hcPbnAIYJSpseFgboWCQYewyzkinKMGRbK3ARPnMw==
X-Received: by 2002:adf:edcb:0:b0:309:41d8:eec4 with SMTP id v11-20020adfedcb000000b0030941d8eec4mr1809470wro.39.1686055009833;
        Tue, 06 Jun 2023 05:36:49 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id j11-20020a5d564b000000b00307c8d6b4a0sm12592085wrw.26.2023.06.06.05.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 05:36:49 -0700 (PDT)
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
Subject: [PATCH v3 4/5] libstub: Fix compilation warning for rv32
Date: Tue,  6 Jun 2023 14:32:41 +0200
Message-Id: <20230606123242.20804-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230606123242.20804-1-alexghiti@rivosinc.com>
References: <20230606123242.20804-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_053651_274649_82D8AB35 
X-CRM114-Status: GOOD (  12.18  )
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
 drivers/firmware/efi/libstub/efi-stub-helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/libstub/efi-stub-helper.c b/drivers/firmware/efi/libstub/efi-stub-helper.c
index a5c61a768d59..029d1581db72 100644
--- a/drivers/firmware/efi/libstub/efi-stub-helper.c
+++ b/drivers/firmware/efi/libstub/efi-stub-helper.c
@@ -842,7 +842,7 @@ efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
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
