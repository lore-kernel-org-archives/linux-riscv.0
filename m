Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A3560A2613
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 18:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b/UO/K7+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j+IueCaO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=Js/nrX6maR4exDhB3KJAuce8FAPyhUf82kLWu2DXcbQ=; b=b/UO/K7+22gfaxb2OMY7RX+nxo
	8fqOi/M/BxATPoqHVG++P6nGMe3T/5VsdroHsKolNl63DwE60pRpnV4ZYGgUv/qnpONJcCtpDQwd/
	dZaCwrtZvPMRulRMIraA7SVqmO81cGBviRtHb6fe+2plF3pSC/IWDZckwdb0zDg3WXMl9ZAmN0h8X
	AMb11Au2mZuOsz4QLEEDLU7mKYNJRQd8pj/vlC43ojLb56912kDUkRA4arjbQYj8KbFBC/lH+mVpN
	QXAQK8hZA1DaSErGvP17MJ41Cn5YCu3jIJdC+e6Euv8TOnXHIMMc/oIwW8tVCXtBrJ6IAsSuOxv1k
	swVe8uvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkJq-00000009vXt-003v;
	Wed, 18 Nov 2026 18:23:42 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkIU-00000009tZs-0nyr
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 18:22:21 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4a16dc2323cso11750985e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 10:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026134; x=1795630934; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbvVNrqGe63WaCDhQx3Sv7CZ2HUvzt7iMpy1FWtb+xE=;
        b=j+IueCaO6C0FuFm/VAZkDd3m7jawQcrvmG728xtFasea2C21cHrhS3/Hs7k3AtNHFM
         VP20ncEymPgh0me6BxmZXg4ZTEo6KAf7zNXayAgenBKQZUNIkkQGGIPt1YebjqR8tgR6
         4DyKMDf7pCH4pcBZr6d1mK2530CDaFIelwkgHOARIz+NKE+WkigrrI0FMulWe+9QBEl3
         SAY9yMawju+J7gDScgVlN6U/e+94swsZCKRw1NwlZlkSd/SWViYVFXiCz6MrHIvXd98L
         Ujfq/EUQk8YLXnUIqlaar4QuhgDHe6mM77zVrBJngPFNfAuyz62QnwphqmYDz9aJp7ir
         nPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026134; x=1795630934;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbvVNrqGe63WaCDhQx3Sv7CZ2HUvzt7iMpy1FWtb+xE=;
        b=fBh841KoUtMz0YgeM7K8WiPFBh0FnzVFelqpdCY8gQADxsqUbvKAcH+pQpoaSka0E0
         VzgcA2GA1dVZryr87XLh8oNp1S1/XveSpx8WymwEFOdbzTuCb86MxdkyFZkQoFHldA3T
         e5QvrvurE4n3AxR0aIn42umxVmoWf5YRjO5qE5qsb6DWdKIlpRvRZZ+6MY1omv9GSvdV
         I0FWMNyiMKtL5PVqKX+tcO9GcmH2opKBs2+OaEgFpOcBozB4af3EFF232odxBg0MFaX3
         j04Rwx86m85ai3RM4U8ZYsaIIYm4qEb/ZSJtQniqr9CZJvqP0JlBclOfU+IszL4wtczA
         PxQg==
X-Forwarded-Encrypted: i=1; AL+hErG2EtPGaiFNmWiWSiYC34Ws6CWQcZ6vGn0JHs8iN8sJ+zWWJ1t0Wf4jJrMY9Aykn4kF4pw9UGLUtELy5A==@lists.infradead.org
X-Gm-Message-State: APuU4Z8UvD6KVGVtUdT3yysTkhzYtQp0utlVqrhIeoY73mPfFy7p+Hgv
	j3OCQf30s3qI0PzdDl9Y86Fb38HEBEDsWsH8vyQyZusnPG+Gnq37mS5Lhi9a99g0sreFE4HB6Q=
	=
X-Received: from wmcq6.prod.google.com ([2002:a05:600c:c106:b0:4a1:b721:2a42])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a55:b0:4b1:2026:6b41
 with SMTP id 5b1f17b1804b1-4bb7da2bd37mr65014595e9.30.1795026134131; Wed, 18
 Nov 2026 10:22:14 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:22 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3432; i=ardb@kernel.org;
 h=from:subject; bh=JdUM/iQUeD0oJbWCV6TTeOpr5VeNWaZWfcnI9fEnIyM=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvmxVzhTeaiPgdOv59tuORKzfu67fZ8M+NyVqZmvl2/
 pKvPjJqHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiNlwM/1Mt+iTFuloPxcy6
 5OZ/+M3kr+/VedYcu87aXuZXUfdcxISR4S3DKTM1X/aMueVnPD/f6Joxs3mJt/nLR5sn3pZ2avr JzgIA
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-37-ardb+git@google.com>
Subject: [PATCH v4 16/19] efi/zboot: Disentangle efi_remap_image() from efi_cache_sync_image()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_102218_285769_BE3D8EA7 
X-CRM114-Status: UNSURE (   9.80  )
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

Refactor efi_cache_sync_image() so that it is not in charge of calling
efi_remap_image(), which is really the wrong way around.

Instead, call efi_remap_image() from the primary zboot procedure, where
it is more straight-forward to obtain the code size from the loaded
image.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/arm64.c                 |  2 --
 drivers/firmware/efi/libstub/zboot-decompress-gzip.c |  2 --
 drivers/firmware/efi/libstub/zboot-decompress-zstd.c |  2 --
 drivers/firmware/efi/libstub/zboot.c                 | 14 +++++++++++++-
 4 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/efi/libstub/arm64.c b/drivers/firmware/efi/libstub/arm64.c
index e892302f4189..f8bb890b9631 100644
--- a/drivers/firmware/efi/libstub/arm64.c
+++ b/drivers/firmware/efi/libstub/arm64.c
@@ -113,8 +113,6 @@ void efi_cache_sync_image(unsigned long image_base,
 	asm("ic ialluis");
 	dsb(ish);
 	isb();
-
-	efi_remap_image(image_base, alloc_size, code_size);
 }
 
 void __noreturn efi_enter_kernel(const struct efi_image_info *image_info,
diff --git a/drivers/firmware/efi/libstub/zboot-decompress-gzip.c b/drivers/firmware/efi/libstub/zboot-decompress-gzip.c
index e97a7e9d3c98..79cf8c48b033 100644
--- a/drivers/firmware/efi/libstub/zboot-decompress-gzip.c
+++ b/drivers/firmware/efi/libstub/zboot-decompress-gzip.c
@@ -62,7 +62,5 @@ efi_status_t efi_zboot_decompress(u8 *out, unsigned long outlen)
 		return EFI_LOAD_ERROR;
 	}
 
-	efi_cache_sync_image((unsigned long)out, outlen);
-
 	return EFI_SUCCESS;
 }
diff --git a/drivers/firmware/efi/libstub/zboot-decompress-zstd.c b/drivers/firmware/efi/libstub/zboot-decompress-zstd.c
index bde9d94dd2e3..dd7f11238154 100644
--- a/drivers/firmware/efi/libstub/zboot-decompress-zstd.c
+++ b/drivers/firmware/efi/libstub/zboot-decompress-zstd.c
@@ -43,7 +43,5 @@ efi_status_t efi_zboot_decompress(u8 *out, unsigned long outlen)
 		return EFI_LOAD_ERROR;
 	}
 
-	efi_cache_sync_image((unsigned long)out, outlen);
-
 	return EFI_SUCCESS;
 }
diff --git a/drivers/firmware/efi/libstub/zboot.c b/drivers/firmware/efi/libstub/zboot.c
index 4cff756902ad..9c7de225b39e 100644
--- a/drivers/firmware/efi/libstub/zboot.c
+++ b/drivers/firmware/efi/libstub/zboot.c
@@ -40,6 +40,17 @@ const struct efi_image_info *zboot_get_image_info(unsigned long image_base)
 	return (void *)image_base + efistub_image_info_offset;
 }
 
+static efi_status_t efi_zboot_remap_image(const struct efi_image_info *image_info,
+					  unsigned long image_base,
+					  unsigned long image_size)
+{
+	unsigned long code_size = efistub_kernel_codesize(image_info);
+
+	efi_cache_sync_image(image_base, code_size);
+
+	return efi_remap_image(image_base, image_size, code_size);
+}
+
 asmlinkage efi_status_t __efiapi
 efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
 {
@@ -107,7 +118,8 @@ efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
 		goto error;
 
 	auto image_info = zboot_get_image_info(image_base);
-	status = efi_stub_common(handle, image, image_info, cmdline_ptr);
+	status = efi_zboot_remap_image(image_info, image_base, alloc_size) ?:
+		 efi_stub_common(handle, image, image_info, cmdline_ptr);
 
 error:
 	efi_free(alloc_size, image_base);
-- 
2.56.1.708.g77570a6a1d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
