Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA7B606A323
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 14:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IicgsXVL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=L52KTTLl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=i2w3oYUQiFX5ZAd3HlhMELZjqhTCwioz+nDreTmGrTU=; b=IicgsXVLdQz1nEkvchmvVu6xSk
	dQARla6tWHKQSkB0vKDEWjFyyZulNHALFhfh176/nreMVJi85D/7Z5g8Xn5YPBgtTZhJRrAhzk4sT
	K8Ze183QtSykYjEWZve0YH8tF9poo2zfSfS6sj6wXbsgqPKj/7YCt9KedU2rGc49rvJsFJ/DiBhGB
	bSD0T5W6I1rgM8RxBe1vpCDJ91PZmKW65p7ttXX5ggUxNyrpKJEMGl+RpPVBhPgD96ld/wvz0JsI2
	YZNxWApv63iIhwO53fd1xHf7yBheUPMisxFH3/W8fPvanLLyACGb5g8E1olokpzL6XyTWgiCA/Px9
	v2OUYeew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxgw-00000002qi2-0d35;
	Mon, 16 Nov 2026 14:28:18 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxg8-00000002pPs-2XWk
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 14:27:30 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4b764ffc014so26506545e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2026 06:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839246; x=1795444046; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cV64o3SIMgxbdBJ/g1LGVun+1S1o6sl5wdO0gO6pEOs=;
        b=L52KTTLl8+G4vx8cbx0vm/nl9STs47fI9b6Ar7QWzF1QCP28HjziH4WljTbajz3dyI
         IRvcKe4FGzXoAwYDRMlMt/R4xsLRiBu1AecJvtX7uC0f10wbdpfZadBwdRq6+43yrSX1
         nHaSqicTj7wih7Xym7Sa+dBndaYe3p9nNITpM1D430LFL61/yy3aHvqjR/+vItno8+xb
         E1VvIg+OUirY3VlWPMJag2Yr1Bbsn/FUo+l99V1lmK2qWOoPysafhx6+Q+sFzRVMVypz
         CxvO5ablq3pFPpC5/ikJqxZggEPPLhJO71QzipMgtGaLdgNzR9xHCm4s2c3/uHauqSfl
         +2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839246; x=1795444046;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cV64o3SIMgxbdBJ/g1LGVun+1S1o6sl5wdO0gO6pEOs=;
        b=fh7+FNW6TGveSBXpc/e32GLyiaC48wlDW6NnXN8IxzjLbRWAwZokzUrf/2oWELj9uq
         WeT9Z/XXE4LM0IXXL34ZG7XkJThR/H/LQaK6jAOsRgAjJxIV8KqB/0dh9r9nlLoVEu9I
         Gznjmv6d9Pdw/cUW8+3o410tDn9+QZJFOjhl/kPLhaf0RDZQSb4Kyn3AOtWGZEohqGdV
         6P2E8SqOXa/f+omWGIcW9ncHtahmDUWsOAWc44icxBAZvYSoDHe4oxtIEww4zlhaSSaA
         EPBzNjVJRPsd74F5SA6KRNM8zjEVXor6v4rWtrfdRiQpu7lmJkufn8XlrFXAtdCSFxxy
         O2IA==
X-Forwarded-Encrypted: i=1; AL+hErGUJwiQPbqqP9ESIRhIct/SfDng9wbnu6MiXZAwbRs8l6XiVCxIlCxsyXA4tlB9xKthA4Q244ZCeHYCkQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/+fwumdex8iUtbb1eWc8AHyl5/SWaCnDGJj5KvWv6Ci3gUy3zG
	2CQZf8plqs/yZukbwSLGt3E7Oj3NnmiRlxmOxx7rhuMzCkiHyhKMhSoW+TkTRwxd95UDrrUdoQ=
	=
X-Received: from wmaz14.prod.google.com ([2002:a05:600c:6d8e:b0:4a2:1459:4ee8])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3d91:b0:4bb:6861:657d
 with SMTP id 5b1f17b1804b1-4bb686166e8mr129134925e9.21.1794839245593; Mon, 16
 Nov 2026 06:27:25 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:30 +0100
In-Reply-To: <20261116142618.1687025-17-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261116142618.1687025-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3987; i=ardb@kernel.org;
 h=from:subject; bh=1pJ9yJPUym3K5Fr1m3ICy12CXT7e7//ufFV5i6KSJ2A=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu30Cwpb4e+Lf8evjZ7eOlnnp2IcFf6/W3Hd5+4l/F6y
 4aQnccmdZSyMIhxMciKKbIIzP77bufpiVK1zrNkYeawMoEMYeDiFICJnDBkZLhnZrt++mGzFxlG
 gs4HJd4s9ivede5g+IVn8TfkjXinfbNk+O96vXDW6o77TO98ur/w36+Zc/bk1Kubmw4+s+dROh6 ysoEJAA==
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-28-ardb+git@google.com>
Subject: [PATCH v3 11/15] efi/libstub: Make efi_remap_image() return efi_status_t
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_062728_793785_4A307E6D 
X-CRM114-Status: GOOD (  14.72  )
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

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
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
index b985ababbe66..634e52aa6dcc 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -1293,8 +1293,8 @@ struct efi_smbios_type4_record {
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
2.56.0.611.g1030f0b940-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
