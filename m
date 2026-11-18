Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E34C606A32C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 18:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hcppxmIU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IGdaR12N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=H51oaH24O+aZ/vwsCGAO+fBMnhEq6jHHhwUBz754EKc=; b=hcppxmIUpe6eC62w2GwtHzRAYn
	ytRQPfEwMqdG0MefMyX3e9GaVOo1VfZsykR5uX+mMWmGkg0JSjqGG/1EzhMDFOcPsBUw2jLsyYWn9
	/Mnju/S+2vOoaXYdIpYWbCjEpEdY/WPCG7WcNWYt5V5v2Gk2m3P5JYV51ldjuy/BbBPrSKLOIiuLQ
	LXof10uYbo2+YPlnjMJ7bHhaQLCDqENUcSTJUnND8KZtS7c4hzEUYAR1j4UMkHMAgBnA6PWFflDf3
	Ic0D5dYYTSwspc3gH4yGXcGqCvvQvPC5LcVkuPyN5HRkU5FlxTJ50M5AcpludliBnnYMlOVdYHETK
	yw+wLKxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkJ9-00000009uQC-1C42;
	Wed, 18 Nov 2026 18:22:59 +0000
Received: from mail-ej1-x647.google.com ([2a00:1450:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkII-00000009tNA-26mj
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 18:22:07 +0000
Received: by mail-ej1-x647.google.com with SMTP id a640c23a62f3a-c465c4c8da0so145303166b.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 10:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026124; x=1795630924; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X2HAR1/QIm7cbi9gzcaeZomwRblEdyJ34MRcnIFpfbg=;
        b=IGdaR12N8qXBg9wyRCwCqEww1JUnpEIgc24Xy5IwBcGmjwc1JuExHG4+Y8NQOeW2LA
         5QnFRULvl4UTHQnkovNJ0wUTYEmu1U5K0plTBNWOqx/pElxjYscECCMsSmnj0gJA3Gsk
         NBEoUzwNOdJWDGXci2BN49Plwgolhp1VBOsErmQRw3rl+whBTYRTHAv3w0sYydtFFghc
         RS2kCiJmh8G89E7MJ2FiIi7fksnC9HlVkAQM7p6o287AEtGp2Kme8/8no6EpqcDmy8tX
         YXAVgLKWLjALb3jBzgcZ8LEyGtAe3E98AEq51ADo/oQxNHJdnqHGs+ug7qct5R2P+7KV
         RqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026124; x=1795630924;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X2HAR1/QIm7cbi9gzcaeZomwRblEdyJ34MRcnIFpfbg=;
        b=1K8cfK/gLHOG72wu7qJT8MmuTTj8kevLpt6Lxodhh1zb6ps/uEbi8DGl8f6OrVsdIg
         PA0RhOFQK1y9CpAEZto2rxdype0GB4hH0Hju+7auhEdE/bEgJPnkK9FHtDEQDadZ7Ul1
         Cm9q4zbLcFiZZTBz3/8P+RAmEpgmvdfiavhaJS+bIrDZVlibdOerSG+mZK1JU9/hhmLg
         qaGBzy8uWFDCc7+bByUJ64Y8QOEo05QWqgSQVJ0zXGuNj9U2Lj+nhv1HLca79xlChLtz
         f53/TR/l5bMajX/jk+/SPBHhnbGDRdXV2rCZSCxzxyEZuizNEbH0e9Vb0e/cZnydWyee
         VM+Q==
X-Forwarded-Encrypted: i=1; AL+hErF0/MuN6goFYTL1Vl3dUSe1zvDJ9YwzDLvYepMsymM1dfIYT5bQb709TXrqo4Upo2HFn3TRNTio1oAepw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+uZg6EiTRMiRu0JCea1BapKjf20aiWlvCYDJFYD7+mb63TFtG/
	Wa1h8cG5cFtLcLltjzHh9zUF+jeK38JnMoQq4GKqM1leyk5/ta7UTnuE04V3FEc5a2T63gLSOQ=
	=
X-Received: from ejsj16.prod.google.com ([2002:a17:906:4750:b0:c50:9014:5739])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:9490:b0:c31:c767:ae0b
 with SMTP id a640c23a62f3a-c510dc46093mr335886766b.0.1795026123628; Wed, 18
 Nov 2026 10:22:03 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:16 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1913; i=ardb@kernel.org;
 h=from:subject; bh=VIsLiroKmQWhjV/hmhsESRfVSQ8Kw0tSPcHO14prx9s=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvmwWvvm95e17E9K2NDbPkg+j/ukJRfPtiH+Q4JSYcv
 PmxdH9kRykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjIZgWG/2E7fT4eu39zRh1f
 83dNmbx5TW5zrrkcP5aX7OzzbWmoeCLD/wDLYM3ApSk3e8R+/VvhvkTocrniAeuGitNi00ISZ1g WsgAA
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-31-ardb+git@google.com>
Subject: [PATCH v4 10/19] efi/libstub: arm: Simplify handle_kernel_image()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_102206_594712_291CF052 
X-CRM114-Status: GOOD (  11.20  )
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

Now that ARM moved to efi_image_info for obtaining the base of the
decompressed kernel image in efi_enter_kernel(), it no longer needs to
distinguish between the image address (which might point into an
unrelated allocation below the decompressed image) and the reservation
address (which is what can be freed upon an error).

So use image_addr/image_size rather than reserve_addr/reserve_size in
handle_kernel_image() to return the base and size of the allocated
region to the caller. This will allow those parameters to be dropped
entirely from the prototype in a subsequent patch.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/arm32-stub.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/efi/libstub/arm32-stub.c b/drivers/firmware/efi/libstub/arm32-stub.c
index 798b2ae3bb03..55d4fa3177a9 100644
--- a/drivers/firmware/efi/libstub/arm32-stub.c
+++ b/drivers/firmware/efi/libstub/arm32-stub.c
@@ -128,18 +128,14 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 	efistub_image_info._text_offset =
 		kernel_base + TEXT_OFFSET - (u32)&efistub_image_info;
 
-	*reserve_addr = kernel_base + slack;
-	*reserve_size = alloc_size;
+	kernel_base += slack;
 
 	/* now free the parts that we will not use */
-	efi_free(*reserve_addr - alloc_base, alloc_base);	/* no-op if 0 */
-	efi_free(alloc_base + margin - *reserve_addr, *reserve_addr + alloc_size);
+	efi_free(kernel_base - alloc_base, alloc_base);	/* no-op if 0 */
+	efi_free(alloc_base + margin - kernel_base, kernel_base + alloc_size);
 
-	*image_addr = kernel_base + TEXT_OFFSET;
-	*image_size = 0;
-
-	efi_debug("image addr == 0x%lx, reserve_addr == 0x%lx\n",
-		  *image_addr, *reserve_addr);
+	*image_addr = kernel_base;
+	*image_size = alloc_size;
 
 	return EFI_SUCCESS;
 }
-- 
2.56.1.708.g77570a6a1d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
