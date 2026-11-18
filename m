Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090EA606A32A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 18:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rBgjVhod;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=D2fyPEAs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=tUp83PycqVsGf4B6DTwfbrAokWvCXkNCptSZA4AK1GI=; b=rBgjVhodCtGU8NOpfM5cjA7mbR
	ars8Eo96zuZ4SPUej+NWB4KOm22L3P/XrXp80+L7SlEw4YOhFfvf3Eeek2EyQ1BVAxS/58o4EA19O
	OscvKU6L9GDngSyz+ywDfEz0aNIZTuwwyCH6YbrsoFqlWHmjyxsRPonmLQteFqzMnuqmSL9wolT0H
	ndjdB2ZMm4A1+lSjEw6EUTb+UskggBlYDhd+zwt+604oLZmdi87fuQLd2Ci7rILCVcIsPNZul4/M3
	csHuqoLBiKmMigFYw2iX1ZlWxShMml7W360vEncl3gDOtpuXygTlUUPBHzTxKKdAFL+GQUEu09d0F
	ujHyP2QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkIQ-00000009tZI-49mh;
	Wed, 18 Nov 2026 18:22:14 +0000
Received: from mail-lj1-x247.google.com ([2a00:1450:4864:20::247])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkIA-00000009tDD-1MSs
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 18:21:59 +0000
Received: by mail-lj1-x247.google.com with SMTP id 38308e7fff4ca-3adf57a6f70so7421931fa.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 10:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026115; x=1795630915; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AHVLK8gN3JGtLR47/Vi3zFfCL1k2jq913taY3VtB1LY=;
        b=D2fyPEAsDdSDAqdnDPTJwrZ7r6ZA396d0T8PKQvmrYZhF2Q3aG1QadlWxHnTx3fMi+
         jq7GNI1OGLy0dNwGUDz+nKz0DsguR5bSMKPRhrq5EK8aswHTVsdF1jFsU+Fuiv/EtZuo
         kH+0NseF9OXStvEHXh4bw9+SaPGj0SpAmnwdryhMLEHGqcXugB2b5J2VA93xLtqgib2o
         NDlaywQrnkTlUbE41SACnXgeoqhrdV2JJX+ahmnUFK5ns758SvLzzhPdW27zc2QVaieL
         awO6azTKOjN41JROFdT+3TygzyBCH3SD6/TDCjWxtZUkLiQXHjs19ojGhexLooDLLK/O
         xDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026115; x=1795630915;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AHVLK8gN3JGtLR47/Vi3zFfCL1k2jq913taY3VtB1LY=;
        b=mN1ZM0v/rMcJlcu6+I53gB+NF8C33hzjVN9eQrWhf5ism9Uspzb5sATWT0NmZ9Y7xx
         EJw1cr0uwoXI1+K0AvbxfyvN1Jp052cwa1DmG72f68REX+S+Fcs1hpGhtEhAyiJwXLd4
         7zxR/Po6fFpX1pu4dRWPbMcuRaI9by3OeggKDspQduHylaLAe4uQ0HSV47xDaOqOeR/c
         5tiwxB2t5xS4iimPyQJSXvBRtCqebsdNQGEFh/yG1jxWKOEC+6o2CCcHH+nGDIwDswl+
         9joe6ZK9na0EhVgFNEi6S/v07IxwX0ERpMWmdUyYJYvg+Z5U6tUbiZOTKmrn8//lgqXE
         PVrA==
X-Forwarded-Encrypted: i=1; AL+hErGnkElZjIa+8HxyJ6nMRuWPUXOFDuta03yWBKuNtZ7LxeqWbczpJwgKpocIDhrxjRp4PT8n5qiiZwi6cw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9rL4f4lsWGolGBcAfsEBOruoTm7wRRP2/uKEQc7gxkwwQFh6LE
	GVF4EOWqIUnNd3+nkVRzbVnuffj7OHyIYhCYboGMn4O/aZ9DaX06tvSeY7yj9dW/KjY5OfdL9g=
	=
X-Received: from lfbey12.prod.google.com ([2002:a05:6512:678c:b0:5c0:343:63d0])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6512:1322:b0:5be:516f:1b4b
 with SMTP id 2adb3069b0e04-5c1a9bfbef6mr1173325e87.28.1795026114420; Wed, 18
 Nov 2026 10:21:54 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:11 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1269; i=ardb@kernel.org;
 h=from:subject; bh=tASZvRhKDOWjZ60RkT+IntWFeW/Kh2vWRn/QEfDreKI=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm5msC79deuT9dVvP9cSTiye5ZGrz/fDZqu98+9iRb
 UvzA0OTOkpZGMS4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEFrAwMrz4aNTAevTAi5Xn
 a25PrLxmp6L9PXJNuGF4uKXwH+9Qzj6Gf7Zph5fNXC5YYXDQuCF/wTRJzW9dDzv6xZuPvubr3b+ ngQ8A
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-26-ardb+git@google.com>
Subject: [PATCH v4 05/19] efi/libstub: Avoid _end section marker in library code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_102158_663682_917DB3F7 
X-CRM114-Status: GOOD (  12.90  )
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

The _end marker could point to the end of the kernel image being loaded,
or to the _end of the zboot decompressor image, and so it should only be
used in code that is obviously only intended for the former case.

So instead, use kernel_memsize and the image address to obtain the same
quantity.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/kaslr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/libstub/kaslr.c b/drivers/firmware/efi/libstub/kaslr.c
index 8f8dc335b3b3..b34e4599f0f6 100644
--- a/drivers/firmware/efi/libstub/kaslr.c
+++ b/drivers/firmware/efi/libstub/kaslr.c
@@ -125,7 +125,7 @@ efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
 		if (!check_image_region(*image_addr, kernel_memsize)) {
 			efi_err("FIRMWARE BUG: Image BSS overlaps adjacent EFI memory region\n");
 		} else if (IS_ALIGNED(*image_addr, min_kimg_align) &&
-			   (unsigned long)_end < EFI_ALLOC_LIMIT) {
+			   (*image_addr + kernel_memsize) < EFI_ALLOC_LIMIT) {
 			/*
 			 * Just execute from wherever we were loaded by the
 			 * UEFI PE/COFF loader if the placement is suitable.
-- 
2.56.1.708.g77570a6a1d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
