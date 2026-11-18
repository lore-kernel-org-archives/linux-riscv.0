Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3A960A2628
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 18:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=weyvdyTt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IF/hsisT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=hfNHGsCivNm4RCW4ENAeMBGGIkHIrvacw6fymGODPsc=; b=weyvdyTtMtAr3k6IhbPaMh0EYB
	5GbqMv06G2YhGc6zh9lNr7cawCUyHACJDIEjEiql2DErcxxaM14ARRlJXIbwM0c5vSIvLg/DndtY1
	WC6K4pqJDq0TevJ4XN3LB8rbCT7ij0B5Bd3e6WNZE4B1jud6TbsauhEKa87iXMGUwVcUHJD6juA0a
	Aun0RENEGm2Zo4eItqJe7Kc+xBXp3Uo+EvOAFFEcNlXo0S4XeW7MNEikXQ6Jpmfpf5JKU2cK+bLPc
	ULG1JGHjnxDvxMB8RSsU3NonqxvGlnLXpn5blnFCBgJSusL1IdODwSfj3wxVqkBw+vRXt66Pmm/nQ
	V0ulAsqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkJG-00000009ueg-3gsm;
	Wed, 18 Nov 2026 18:23:06 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkIL-00000009tOo-0tSP
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 18:22:10 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-4a370217dcfso999730f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 10:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026125; x=1795630925; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IEeaARdatv0A7mhpnidkLGUlVtXUnSTDUsZkbCqBIIw=;
        b=IF/hsisTf5S5QkAv+/ucOw3TpmUR8pOPkWNP8wt3DRjB2XMWqOdOxFMXUCpApx+C73
         qHrt5B8EkawLijqsIVu2wxW66BGq9ordmQGkS4UBcDy9UBh/82WM4El/BeVQP9InXqH0
         +B7yZKSMp/MMsitQ6lWrrvYbGVL7adbgVzWST9mz0IX9qGzNJixEvjIe8MkJbRMgWobC
         5VwXCVJe0ysYm78Qo2O7mxRYTZFNiiIPKzkBRbaSvy1R07ZZoFtsaKZ/09oRkLKxA15g
         1AmnuUtcq6AWZIIs1ETcD+1DecK7LV+b7zAPEBU1pJegVK3thYKP/Sjs6o5TQLJ/W3dZ
         aV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026125; x=1795630925;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IEeaARdatv0A7mhpnidkLGUlVtXUnSTDUsZkbCqBIIw=;
        b=JVQjgld1xbEiz2qi3aEATM/fWUBw40VFU8NBqXDBi4aG/dlPXC8PbBdYC7075UZmm6
         b1uC5BUMeJS1owhMdnvhk1tzdI6MCG/vNr1K3Pbof1XDopf1/Kt8IHQRic19t1Qz4Bx2
         s+2lJqumu9kjDzfcpc+oL2DxWkQTggWGqw0LVFSRHqzX70/r//slR4ix4Z9yx9QKx7QG
         8H27HtsS2Gx9Od2+EkYCctdrPKJ1GupjfisHYCU41d2T2SBZtLvQiEROcCHoJWZrbcNz
         Y67unoSs5K3WYcpJpp5kVHWw2vDFy4IctZ/86kb0/LnpNvp74gxWBrwNiEahkew5wdc9
         PFhw==
X-Forwarded-Encrypted: i=1; AL+hErHeXe0yM4N7iF8FnbXujzhIe2nHEr6QfgxZg1sDAeD+8e0Mn6sQLJL5UkniaNVGNxiVc6g3jBTryD8zNw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8Pi16UoK96PkMpRbLjwj+5RLZNuGFt0vbcRC7GS6IJogC5k5FQ
	X19MuhY6DYKRlt4yu52zLUR3VS+OVhIWjnxQaju+IbjI9B3FtHmP55YT4jzTNwcvHf9S2t9rNQ=
	=
X-Received: from wmsl30.prod.google.com ([2002:a05:600c:1d1e:b0:4a2:df9b:ef74])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e02:b0:4bb:6b59:aac3
 with SMTP id 5b1f17b1804b1-4bb7da44054mr69467855e9.29.1795026125277; Wed, 18
 Nov 2026 10:22:05 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:17 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4679; i=ardb@kernel.org;
 h=from:subject; bh=BY4lNS3U3HJqg99nmA1jm5uVn1J2yFNPSkQm9h6irHI=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm4Wphpfm8/sXp+4V/dL0O9xUmSnwvrtj2M3pv1sN/
 9XOe3+po5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExk6QmGX8xWJ/TOemt4m/Aw
 lk7+uOJa7ReJe6vtN6p/Fvh1Or37hwojw8dZU7T4rG8eFZ/mW9XoEuD1xad9vWilmfU6Dou6SLH dHAA=
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-32-ardb+git@google.com>
Subject: [PATCH v4 11/19] efi/libstub: Drop reserve_addr/_size params from handle_kernel_image()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_102209_314857_3658F538 
X-CRM114-Status: UNSURE (   7.85  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

The reserve_addr and reserve_size variable pointers passed to
handle_kernel_image() are no longer used, so drop them from the caller
and from the prototype.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/arm32-stub.c     | 2 --
 drivers/firmware/efi/libstub/arm64-stub.c     | 2 --
 drivers/firmware/efi/libstub/efi-stub-entry.c | 6 ------
 drivers/firmware/efi/libstub/efistub.h        | 2 --
 drivers/firmware/efi/libstub/loongarch-stub.c | 2 --
 drivers/firmware/efi/libstub/riscv-stub.c     | 2 --
 6 files changed, 16 deletions(-)

diff --git a/drivers/firmware/efi/libstub/arm32-stub.c b/drivers/firmware/efi/libstub/arm32-stub.c
index 55d4fa3177a9..3ca20d2dd4d2 100644
--- a/drivers/firmware/efi/libstub/arm32-stub.c
+++ b/drivers/firmware/efi/libstub/arm32-stub.c
@@ -86,8 +86,6 @@ struct efi_image_info efistub_image_info = {};
 
 efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 unsigned long *image_size,
-				 unsigned long *reserve_addr,
-				 unsigned long *reserve_size,
 				 efi_loaded_image_t *image,
 				 efi_handle_t image_handle,
 				 const struct efi_image_info **image_info)
diff --git a/drivers/firmware/efi/libstub/arm64-stub.c b/drivers/firmware/efi/libstub/arm64-stub.c
index 6140def24c69..af38cf73cf01 100644
--- a/drivers/firmware/efi/libstub/arm64-stub.c
+++ b/drivers/firmware/efi/libstub/arm64-stub.c
@@ -15,8 +15,6 @@
 
 efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 unsigned long *image_size,
-				 unsigned long *reserve_addr,
-				 unsigned long *reserve_size,
 				 efi_loaded_image_t *image,
 				 efi_handle_t image_handle,
 				 const struct efi_image_info **image_info)
diff --git a/drivers/firmware/efi/libstub/efi-stub-entry.c b/drivers/firmware/efi/libstub/efi-stub-entry.c
index 36ea6aa2cfcc..a2fefe1ded05 100644
--- a/drivers/firmware/efi/libstub/efi-stub-entry.c
+++ b/drivers/firmware/efi/libstub/efi-stub-entry.c
@@ -36,9 +36,6 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
 	efi_status_t status;
 	unsigned long image_addr;
 	unsigned long image_size = 0;
-	/* addr/point and size pairs for memory management*/
-	unsigned long reserve_addr = 0;
-	unsigned long reserve_size = 0;
 
 	WRITE_ONCE(efi_system_table, systab);
 
@@ -66,8 +63,6 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
 	efi_info("Booting Linux Kernel...\n");
 
 	status = handle_kernel_image(&image_addr, &image_size,
-				     &reserve_addr,
-				     &reserve_size,
 				     image, handle, &image_info);
 	if (status != EFI_SUCCESS) {
 		efi_err("Failed to relocate kernel\n");
@@ -77,7 +72,6 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
 	status = efi_stub_common(handle, image, image_info, cmdline_ptr);
 
 	efi_free(image_size, image_addr);
-	efi_free(reserve_size, reserve_addr);
 
 	return status;
 }
diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
index e45d16095247..4e6af37c4ecb 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -1150,8 +1150,6 @@ struct efi_image_info {
  */
 efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 unsigned long *image_size,
-				 unsigned long *reserve_addr,
-				 unsigned long *reserve_size,
 				 efi_loaded_image_t *image,
 				 efi_handle_t image_handle,
 				 const struct efi_image_info **image_info);
diff --git a/drivers/firmware/efi/libstub/loongarch-stub.c b/drivers/firmware/efi/libstub/loongarch-stub.c
index d57e3d3557a5..8f2145bd9ad2 100644
--- a/drivers/firmware/efi/libstub/loongarch-stub.c
+++ b/drivers/firmware/efi/libstub/loongarch-stub.c
@@ -96,8 +96,6 @@ efi_status_t efi_relocate_kernel(unsigned long *image_addr,
 
 efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 unsigned long *image_size,
-				 unsigned long *reserve_addr,
-				 unsigned long *reserve_size,
 				 efi_loaded_image_t *image,
 				 efi_handle_t image_handle,
 				 const struct efi_image_info **image_info)
diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
index 840fdd63dccf..8cd0cd9b0048 100644
--- a/drivers/firmware/efi/libstub/riscv-stub.c
+++ b/drivers/firmware/efi/libstub/riscv-stub.c
@@ -12,8 +12,6 @@
 
 efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 unsigned long *image_size,
-				 unsigned long *reserve_addr,
-				 unsigned long *reserve_size,
 				 efi_loaded_image_t *image,
 				 efi_handle_t image_handle,
 				 const struct efi_image_info **image_info)
-- 
2.56.1.708.g77570a6a1d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
