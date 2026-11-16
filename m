Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E8C606A323
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 14:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HlJg8zwN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=IDiyR4S/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=czHfl+kq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=Es7vUbQXGqxsg9lvnGXg9PSPMYyeH35K6wGE5GZoDf4=; b=HlJg8zwN+7i9Tu+nCi4Gkc9ySn
	6DUheLqgG/MeweQTbNw9SZQnAByy2Hrtx9Nv7LIXkKJhRpKlEO0oQOgq12gADmDK4kTSz1Acsb2nz
	5NigoG/vQZ3OxH5etxN5z8E8BILUebGzTLz+cI/Y/gQtTOP8j9cCHtECaOB8yPtiACGJkQ3lW3oL2
	FhZXXgZ5wZzZphxESukg4Abik+pQOv6goGLVAkTyHMKSQ2QEBzA1o5ni/Tdqj8kuSx8CvWfRyADZ9
	mP2w1MdZ80GyHpUsJttESIX2KP0E4ogv3jBmmwEoxUWQ/WOYFbmn/wWJLCVZLtyvAq9suQh9uBY8z
	FqhSTCXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxg7-00000002pRF-1tHy;
	Mon, 16 Nov 2026 14:27:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxg4-00000002pLQ-04jm
	for linux-riscv@bombadil.infradead.org;
	Mon, 16 Nov 2026 14:27:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=c/NQHRNe6l6YOGUDkv9ZNGcgPj475MvlcuYl9auZYJY=; b=IDiyR4S/uMra9/qCwnDpXtJh4k
	VNhBzR60/BsgGM1pWX6sod/R7X21Ap/bo2oOyUYumG5YbG35ArIRDZdpsrPZNHnwb2A4pPn3ftxP2
	i3gNSgMDnu9Zrkkc1YQRqZ3bie1hxxESwFVPcEM+sM3p9Qg9q+fqBpVogoyYu+yLC3vfCf0GxvHqL
	ZWwMR7SigOn2a1wlugLTWprThje53FYtbUUeE9gLq0jljBRkUs9Vr6BooZsCPQKxq1ZRp/MqPOotb
	Rn7CCh9RVEyu4+8kC8R+2cCZ9/N7mj57NYvv3XS5QcjK/teXXfVHA76buZ+Z7Txt94W+4W5Abslhq
	PknAqRag==;
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxg1-0000000DvuH-1dUW
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 14:27:22 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a16dc2323cso27103505e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2026 06:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839238; x=1795444038; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c/NQHRNe6l6YOGUDkv9ZNGcgPj475MvlcuYl9auZYJY=;
        b=czHfl+kqv6djkvwgE5hfosvtj4Zx/tthP3qamV1YcsRBzEDsF7O/eH+74dVHqmuCZG
         gsg/umJWKU+unNzm669S1bXQQZ0+2FMH6MnnBpfrUHwCqKVRpGN+nLyAMK/7DCoj7jVJ
         XYCLcz3ycDTPxQLgZR7vdV7mlbnfHmVxvj2EeaT4bqAqFWzFGGD95U22Jp+RA18PNJ/Y
         2ZiWPN1qZCniXda46EibM8Ib+X/fY0W0gfMemYwgNBsRP2QnaE5yKVAQvyGvasWYDDee
         wrIW7TWUYZMECF9D46m/6K0b/sJLD29vkwULk0gNZm44+lDZIeYTIuLlQB2iexmSrTkX
         8X+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839238; x=1795444038;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c/NQHRNe6l6YOGUDkv9ZNGcgPj475MvlcuYl9auZYJY=;
        b=13Q8QupT7Ta3RfcwUYRCcds4+uIoVhftZu0mcYaBdYMZrqvgGg4W0XtMGCqhjiQsHn
         O9C045hMQUjwP8mHfuuUtYMJVJDQGNJ88TVLHdw6PCOpgUbZcAzUwDwM+GhJTusFUI9M
         N+Ui2NRpCWUJXrOr4guzr76uxCHXhvpuWiBS97Rh6kN9rnKVwWIkH1DY9dj7dwr4dhH7
         jELJLJcbRPNtN2pGZ8ksf2ZB69uAQYyu7DnyG9cIleMNBJSRpvUdmhWkpIy0WhUmJaNH
         yo/GLI9doImHs9mzgvzEipNRqXgQ5G6gSou3Q3s2tHfvLkDZ94/IkwQ0CZOUFykPcZ0I
         2ivA==
X-Forwarded-Encrypted: i=1; AL+hErFVHgIdZENhndgnHe8TeEEv9zLBIozKDid1OLakQ/S8J78VFP/9ZRFnKOTUy7AwbTon4lzVl11Eu7OPpg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+l5AfTyXDUFNsT3VFKeZjpyPka7HSsOokgnS6a4BVOdFP5DFmP
	Biiu0vZo4APGbKJREnN17GdfdTg24sgjY/Jbsx0l56Ff+cw7mRx/5GQ9xFv6dkzvTHpxAzYjvQ=
	=
X-Received: from wmbjj17.prod.google.com ([2002:a05:600c:6a11:b0:4a3:5d5b:9ad9])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6286:b0:49f:e8bf:8f9b
 with SMTP id 5b1f17b1804b1-4bb55a23b4emr228382165e9.4.1794839238088; Mon, 16
 Nov 2026 06:27:18 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:24 +0100
In-Reply-To: <20261116142618.1687025-17-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261116142618.1687025-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222; i=ardb@kernel.org;
 h=from:subject; bh=gNFwqEvRPin0drZTY8vZ8X80jlSMfocbKk0VdpmbVRA=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu30KSg3fcv87JE2Vwx2/OUl40vW2RrsPb6oCrlHnF1u
 dmyb9M6SlkYxLgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwER6PzEyrM+807hgHuvh1S8n
 7DDjYHotYHn95jar+8ULlgkKbOBwnMPIcDTjw5LJIe92RiypnXv/9FrZ3E0/bCS3WkXYaqwq8vY LYwUA
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-22-ardb+git@google.com>
Subject: [PATCH v3 05/15] efi/libstub: Avoid _end section marker in library code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_142721_426088_482290B9 
X-CRM114-Status: GOOD (  13.84  )
X-Spam-Score: -7.6 (-------)
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
2.56.0.611.g1030f0b940-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
