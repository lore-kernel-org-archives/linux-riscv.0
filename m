Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C1CC636CC
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 14:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQPNxTgi3QLOmwUsjeu1OsM2PZsjps8Ag/kW1zFSCjE=; b=kDoUHz564RbFEn
	uJwyY3fk4EjPenshYPE0Ppx34pOUy88r/znUkybFA8ItHN9lbydLzxnj1RLDaOmjJfXQ1AouFigwz
	VlTUtYTVNG6oiyxQBFyBGr/M+oLZoXycsIexvE54JrIOF4dpLdrrWHNxAVoHtYDomnr5op6FuqcY7
	19LxVPoLL7zb/b/IIqq45ipd7SkVUWT+jk2tOktUVBJUcSC3UnXzEHGewFUIKot+9C03TAmHlIXJU
	kuqh5bpMPSkWy30hiBWWhpCiB/6U8/U8919KQT7dC0w0AeCK9zxqPJbT9h15I3+VVe9tyAv4wXf1X
	MhMZbH2Njv4wA4YRw1/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJBu-006HyR-Q6; Wed, 15 Feb 2023 14:55:26 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJBs-006HvR-Dy
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 14:55:25 +0000
Received: by mail-wr1-x430.google.com with SMTP id bk16so19413202wrb.11
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 06:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFZ2YC0fgNO5IScjFj8fCx7wxmBPNhh2ssV4/ZbMqxU=;
        b=eOcBAPjgIt+WhR5hfDh6Za/xsjISTX28UboARgwu3/BWNk29fi7nOSnVlLooTINvq1
         grawxRamDHGBT4+ca/x1g6aykZIGQHvEcxaPK0ng4ME3P7LeN86UCeEG1igcxZpCEGIR
         dmhwWJQj956L2JopjfuW/6YiIByJhmuyCGnpe90XUIkUU2/aPPN8YNp+IF+fuFVNVc8b
         jlRxZf7TY/wT/pBg5m4JqeOXB+3WdZPSXj0YQbbNb4kxRluMaEIrN00aZ2wejENicNPT
         hIbHd6OK/COzir6+MX0Hb1aIZttsuCqE938jaK24wNVS9H+FAo4nzwdC2HcYnK0U2Ugr
         503w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WFZ2YC0fgNO5IScjFj8fCx7wxmBPNhh2ssV4/ZbMqxU=;
        b=as1fe6MsfYHAn8jy7ZReF7zkKllZI3Kj+k7wjdVfqRtp6aU1xvNQd722F3Vkom9lHd
         mL0cO+dNwWctd4enwPf+f7Wws3wi4DjgA2kxseQq8Ul5WY8xcAk9w9m6nwwfSisLIn/4
         PO7RjVzIPcub6GjChQCztp+HEHaRACkdP6jvoNFafk/Hr+O6EUWGJJWaRGxOAgL8TD10
         WKTSt6+FtA6lYpVzSCvTbckFdjFAaXTyqVBzBQBMjexeERqIQFeEGb5tzQdqMb8dsWek
         rhpf85Dp9T8IGql+kQYYb7c/dzcVRt9P3Q8x3NVkIcTJwENQOmi0LM9jdOljoSf77b1V
         hqZQ==
X-Gm-Message-State: AO0yUKXmJP8GoEb0qiP4cxBj758oZPYze6EpBs2yp9MU+NHGKXIZvRTx
	+rnbTXLYZHdbrATCNpcE+2zlPw==
X-Google-Smtp-Source: AK7set9ydRMCaArnxU7Ht9ckCOmyaOWeWDHgmLuOzZo9PdkdFiBT5s/U7hY3mzZhXL75FAh+JivHQQ==
X-Received: by 2002:a5d:544b:0:b0:2c5:5687:5ed5 with SMTP id w11-20020a5d544b000000b002c556875ed5mr2053017wrv.18.1676472919291;
        Wed, 15 Feb 2023 06:55:19 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c445100b003dc1a525f22sm2637468wmn.25.2023.02.15.06.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 06:55:19 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 4/4] riscv: libstub: Implement KASLR by using generic functions
Date: Wed, 15 Feb 2023 15:51:13 +0100
Message-Id: <20230215145113.465558-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230215145113.465558-1-alexghiti@rivosinc.com>
References: <20230215145113.465558-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_065524_487769_916EE5AF 
X-CRM114-Status: GOOD (  13.43  )
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

We can now use arm64 functions to handle the move of the kernel physical
mapping: if KASLR is enabled, we will try to get a random seed from the
firmware, if not possible, the kernel will be moved to a location that
suits its alignment constraints.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 drivers/firmware/efi/libstub/riscv-stub.c | 27 ++++++++---------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
index 145c9f0ba217..0c3c4a13afa1 100644
--- a/drivers/firmware/efi/libstub/riscv-stub.c
+++ b/drivers/firmware/efi/libstub/riscv-stub.c
@@ -30,32 +30,23 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 efi_loaded_image_t *image,
 				 efi_handle_t image_handle)
 {
-	unsigned long kernel_size = 0;
-	unsigned long preferred_addr;
+	unsigned long kernel_size, kernel_memsize = 0;
 	efi_status_t status;
 
 	kernel_size = _edata - _start;
+	kernel_memsize = kernel_size + (_end - _edata);
 	*image_addr = (unsigned long)_start;
-	*image_size = kernel_size + (_end - _edata);
-
-	/*
-	 * RISC-V kernel maps PAGE_OFFSET virtual address to the same physical
-	 * address where kernel is booted. That's why kernel should boot from
-	 * as low as possible to avoid wastage of memory. Currently, dram_base
-	 * is occupied by the firmware. So the preferred address for kernel to
-	 * boot is next aligned address. If preferred address is not available,
-	 * relocate_kernel will fall back to efi_low_alloc_above to allocate
-	 * lowest possible memory region as long as the address and size meets
-	 * the alignment constraints.
-	 */
-	preferred_addr = EFI_KIMG_PREFERRED_ADDRESS;
-	status = efi_relocate_kernel(image_addr, kernel_size, *image_size,
-				     preferred_addr, efi_get_kimg_min_align(),
-				     0x0);
+	*image_size = kernel_memsize;
+	*reserve_size = *image_size;
 
+	status = efi_kaslr_relocate_kernel(image_addr,
+					   reserve_addr, reserve_size,
+					   kernel_size, kernel_memsize,
+					   efi_kaslr_get_phys_seed(image_handle));
 	if (status != EFI_SUCCESS) {
 		efi_err("Failed to relocate kernel\n");
 		*image_size = 0;
 	}
+
 	return status;
 }
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
