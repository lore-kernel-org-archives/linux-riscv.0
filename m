Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3754606A336
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 12:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hSXhCsGH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eCHvHXSC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=n/gwOzvM3zH7CyOpXaQp2Gla3VopJoYvCOM1ruZ477Y=; b=hSXhCsGHqVzX9C32z5e1FnVe9k
	zYmN4JBUI0lfWQQeJcizuXHbpmQBPTsjmqJk+No3kpw6VUM026H5qEnNGHZTzKBvxnXY8ferXSx7f
	l64Yuyyu1SP9CpiAjpisIgHgYtfcgNRfpeBx+pxxeRbp2+TU2tv0nd5T/3H1kHYhTAdHntUcqC4it
	X+khk4TaH+T3ttJTj+CNp7Z54HublM2I25v+YYRnPdOImTNdIQ4L0M6I9d21Tg1OlIPOSkzJifzh6
	qvooEkbrLNlpU5pbu3uRxtfnKf1ZRFGKB4JfzhLMKzXIH7nKQJFaYRQPkEbCVwCk/lOBQizgyw5DN
	fSnkPfDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkne-00000003nLE-1zkO;
	Tue, 10 Nov 2026 12:18:06 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknP-00000003n1t-0oKG
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 12:17:52 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4afef353dd2so21117965e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 04:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794313069; x=1794917869; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XeENm8YGI/YCcxTaf8fM3RRrPARxs0Acfc/5LAWqFwc=;
        b=eCHvHXSCWus6GGDoPpTuZ+NsLMp1a/+CTFAMf6mGUoxekI6G7bwJoxzr0TKqhzxhTX
         BFjOQBrtT+8tpoXYrdNYREozjQ+WbMOWJDO5gbQ0ibowwE766uXBnYNwNX8qSiLNO2qO
         WV3MMwCkBYUsCrhpT/92l4Oa0xukScMhhoqarxn0qR5fGaPBUa4HZAG092iOgkziYfC1
         VAEvlCnCnOcTiqI4BNCTCL2hpQJ9fBg27wgk13mwl78HOg9i0RPMA86FbdFweMSS+ZvV
         ey83j63fz5wrVTY5wXNah0U5bDl9rDsKcLVdSpaIpzXRW7USe9UZm9c3lW1kZ9dk6zK/
         2MjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313069; x=1794917869;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XeENm8YGI/YCcxTaf8fM3RRrPARxs0Acfc/5LAWqFwc=;
        b=aIdvVdtl/nVv0PlKB/Dh+mcUMBCXQqZqVpSojcC2L1FulCxZxMvz4ZNkX+Ond8uHSu
         VYOeYnZ6zrG4m2IqyaslQyxfWX0boRaP3GK7twPSobgWOQ6US5tOdoP1RB6Ea2BUxiDH
         hmOnBe3CMWCWPM1zWUykLxBE3NLnRFTUNM/uvHTT5iIrXwhBUzsacE+tJk2oKrf4AsX6
         Am5mLPVKpbY1LDYSxiw/KzdtTUMMOeZaPCDJSrvIz8ydfJyosVeMZhJGmg4iIRoXmlhH
         kACID8iUM7iFP4NBnMkSHONnTIOud0XjimuGhSP4GB1n+ziIcmWy4/1WvlgjiqlHnZMU
         Nlfg==
X-Forwarded-Encrypted: i=1; AL+hErHk241eeL8XA0q99S6xU6oLW98DIi4vcU17Qxlz3d/bUPb/8A8kKNjIqEHob5Hz1+e4eDhI+Dr7C/v3nA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+BcaIQBcDcDeTpxkuv/HYK0rk5OGkYbdyI64VomnF3/gSdu+Do
	Gxt4vsYCYdIaGeNA88I6LtOx5J8HNxJLrdGtPt6Lx7SFqj3zkeO/dAM43Oq4b9QlzduN2K4ZnA=
	=
X-Received: from wmpj1.prod.google.com ([2002:a05:600c:4881:b0:4ae:2747:b6c5])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b33:b0:4a4:4d57:8487
 with SMTP id 5b1f17b1804b1-4ba0233684bmr40944525e9.5.1794313068535; Tue, 10
 Nov 2026 04:17:48 -0800 (PST)
Date: Tue, 10 Nov 2026 13:17:40 +0100
In-Reply-To: <20261110121731.2728824-12-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261110121731.2728824-12-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110121731.2728824-20-ardb+git@google.com>
Subject: [PATCH v2 08/10] efi/libstub: Make efi_remap_image() return efi_status_t
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_041751_253292_8C8D661D 
X-CRM114-Status: GOOD (  15.13  )
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

efi_remap_image() uses the EFI Memory Attributes Protocol to remap code
and data regions with the appropriate permissions. This could fail for a
variety of regions, all of which are currently ignored.

So relay the failure status code if any occur when invoking the
protocol. Locating the protocol itself is allowed to fail, as remapping
the image is likely unnecessary in the first place if the protocol does
not exist.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/efi-stub-helper.c | 15 ++++++++++-----
 drivers/firmware/efi/libstub/efistub.h         |  4 ++--
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/efi/libstub/efi-stub-helper.c b/drivers/firmware/efi/libstub/efi-stub-helper.c
index 8e43eb3f418b..e50deec99686 100644
--- a/drivers/firmware/efi/libstub/efi-stub-helper.c
+++ b/drivers/firmware/efi/libstub/efi-stub-helper.c
@@ -697,9 +697,11 @@ efi_status_t efi_wait_for_key(unsigned long usec, efi_input_key_t *key)
  * region of the loaded image read-only/executable, and the remainder
  * read-write/non-executable. The code region is assumed to start at the base
  * of the image, and will therefore cover the PE/COFF header as well.
+ *
+ * Return: EFI_SUCCESS on success, other EFI status codes on failure.
  */
-void efi_remap_image(unsigned long image_base, unsigned alloc_size,
-		     unsigned long code_size)
+efi_status_t efi_remap_image(unsigned long image_base, unsigned alloc_size,
+			     unsigned long code_size)
 {
 	static efi_guid_t guid = EFI_MEMORY_ATTRIBUTE_PROTOCOL_GUID;
 	efi_memory_attribute_protocol_t *memattr;
@@ -710,10 +712,12 @@ void efi_remap_image(unsigned long image_base, unsigned alloc_size,
 	 * If the firmware implements the EFI_MEMORY_ATTRIBUTE_PROTOCOL, let's
 	 * invoke it to remap the text/rodata region of the decompressed image
 	 * as read-only and the data/bss region as non-executable.
+	 * Don't bother if the protocol does not exist: it means all memory is
+	 * read-write-exec anyway.
 	 */
 	status = efi_bs_call(locate_protocol, &guid, NULL, (void **)&memattr);
 	if (status != EFI_SUCCESS)
-		return;
+		return EFI_SUCCESS;
 
 	// Get the current attributes for the entire region
 	status = memattr->get_memory_attributes(memattr, image_base,
@@ -721,7 +725,7 @@ void efi_remap_image(unsigned long image_base, unsigned alloc_size,
 	if (status != EFI_SUCCESS) {
 		efi_warn("Failed to retrieve memory attributes for image region: 0x%lx\n",
 			 status);
-		return;
+		return status;
 	}
 
 	// Mark the code region as read-only
@@ -729,7 +733,7 @@ void efi_remap_image(unsigned long image_base, unsigned alloc_size,
 						EFI_MEMORY_RO);
 	if (status != EFI_SUCCESS) {
 		efi_warn("Failed to remap code region read-only\n");
-		return;
+		return status;
 	}
 
 	// If the entire region was already mapped as non-exec, clear the
@@ -749,4 +753,5 @@ void efi_remap_image(unsigned long image_base, unsigned alloc_size,
 		if (status != EFI_SUCCESS)
 			efi_warn("Failed to remap data region non-executable\n");
 	}
+	return status;
 }
diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
index 394796472cc0..e2a9339f3e2c 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -1283,8 +1283,8 @@ struct efi_smbios_type4_record {
 const u8 *__efi_get_smbios_string(const struct efi_smbios_record *record,
 				  const u8 *offset);
 
-void efi_remap_image(unsigned long image_base, unsigned alloc_size,
-		     unsigned long code_size);
+efi_status_t efi_remap_image(unsigned long image_base, unsigned alloc_size,
+			     unsigned long code_size);
 efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
 				       unsigned long *reserve_addr,
 				       unsigned long *reserve_size,
-- 
2.56.0.542.g3ef89b7020-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
