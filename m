Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF2260A2602
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 18:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=soQqr6iM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d5XMhfpZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=ZkAImFLMO9C6fiEK3poyzbMqnMXXcrOutZdBYJacOWo=; b=soQqr6iMD6uXHGCQOTVzUn3XdO
	N+tts7YzuQ36EsP8V00srxcRRWTVfpt8vYgZPfEFBEwEh1D9A2d2IpPEDimwyHseKqwdoMMnwPiR+
	aQUvj12qaPwC+wYl61tmCG3XtqDt65VYqfNzpdPuDqwEvYxhU+OKJ2GO3/3HAeXPbig7rkauvA5rY
	qVjuSuSbAu3dkax7f3WJd6l0jzcEroaDk+v4o2HCOgS8xl/ArPdIjILRo4j43nWGdyiepd4pHak45
	o3nR3E4+/c09ROMRA/XngHY+eNgJY3eTBw1GCsP0DySH2kOASlsPfUmEOcmQcs1MLvmaxZgCJYQ/A
	PHbkmnKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkJp-00000009vXI-2ydR;
	Wed, 18 Nov 2026 18:23:41 +0000
Received: from mail-ed1-x548.google.com ([2a00:1450:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkIS-00000009tY2-2jO6
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 18:22:21 +0000
Received: by mail-ed1-x548.google.com with SMTP id 4fb4d7f45d1cf-6a5d57a8d51so1644650a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 10:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026133; x=1795630933; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6V1QA3P52x46nv3P41ByzMEuwbndT8/SrZmGlBnbrBs=;
        b=d5XMhfpZGclKgdHO9Wv9YstKVBSAacTGMdLcSIHZDstyjo9Um8QxELSIpKgPzMj2rX
         5MCeMsqNRqQKZrasf/0chwncPcwrWVwtMWO1ZVtCr3+0PKBvD+KTOmHXCT5tBPotiLIj
         G5FBZ2SVORxQ+j3X9uZ6UD/vQ/y+Mfh8tB0aB21Ke3v5ycTLPDJQHcH44My1X4/czfSh
         tGNe18rvxAjIggCP5CN9gJIDIxJmZp+OnnBR52ZfVWnVQ6sFLAddpaXkWBd268fNvXB4
         OJZX5M8C3+fT1GjCxkkG9/Tz7LBYiONNHVk3RXJYCG52ISYNJrmHV4vaXYvg8doT9tAS
         mnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026133; x=1795630933;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6V1QA3P52x46nv3P41ByzMEuwbndT8/SrZmGlBnbrBs=;
        b=Y4d3nm3Ck0ku4BGtnXaY9vrbVdEvFRdi8awB/n5YXrj+O96rRLzitmb5ilA6QKW16a
         ffF9w+zbaDsGazzldtoAIiORydngMD29Nsubd2gPXCvlt0+Vbu4Gd4GeDDrNVJJTRmU4
         kyS76z25WT+OF6hKl3VrQ4WgVY4lDYcl0WEfh/PvrwwHph63tCRyV3qs+dqR5Im0qHgz
         sL60o05f4frMZDQC8/aZWqjdUfOS9/03TdCEVGIbFEO7op4TeKN95SJPgOsR6jFG3Tno
         a+Jo5cUKRr4F4tQ6KC0AEgLgW/jyRmQm7BgN9dk/FgZB0JxC+UiWJGiGcpDviZIMzyQK
         bptA==
X-Forwarded-Encrypted: i=1; AL+hErF0ExIoxc3BWyMt36b7gFx2EabAXUMFLGHHC2YnQPvsMwYPEcJXd4mGuVq0pvijpVxcTcfFeek7pIUS1A==@lists.infradead.org
X-Gm-Message-State: APuU4Z/QuH8kxu83oTwkvO7PalRy9zKsLhU1OUriMTUJB5PeB8KdD5sH
	vrB7gnQBjIP5KkCV1RE2pXp87RcJR6TwyBOVJfI7EnP99XoUQ1t4tYBcmoxa+4EOntzlH1U0mA=
	=
X-Received: from edew2-n1.prod.google.com ([2002:a05:6402:a202:10b0:6b5:71b1:5396])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:1f14:b0:6b5:8719:6d51
 with SMTP id 4fb4d7f45d1cf-6b887ebcae0mr3272336a12.32.1795026132980; Wed, 18
 Nov 2026 10:22:12 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:21 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3998; i=ardb@kernel.org;
 h=from:subject; bh=ScJHVhvjJW7cZodEmI3s6Cu3UVcx7Ou1mV7bexdNsCg=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm+XHVDP+rDqpPevtwVUH9HN5H0z+4TiXyzef2ytjQ
 WGR+pnWjlIWBjEuBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjARgTiG/26JnzVEZXSTBTIv
 WAWbGX+pc2v625DpGBy5NU8yO96ameGfAdeGb2bd6xq27tfckbBu19bz8pZxd/nDMva/DQ7bf/A kPwA=
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-36-ardb+git@google.com>
Subject: [PATCH v4 15/19] efi/libstub: Make efi_remap_image() return efi_status_t
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_102217_013207_BE5F881C 
X-CRM114-Status: GOOD (  14.54  )
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
index 4e6af37c4ecb..27b60ad81264 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -1291,8 +1291,8 @@ struct efi_smbios_type4_record {
 const u8 *__efi_get_smbios_string(const struct efi_smbios_record *record,
 				  const u8 *offset);
 
-void efi_remap_image(unsigned long image_base, unsigned alloc_size,
-		     unsigned long code_size);
+efi_status_t efi_remap_image(unsigned long image_base, unsigned alloc_size,
+			     unsigned long code_size);
 efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
 				       unsigned long *alloc_size,
 				       const struct efi_image_info **image_info,
-- 
2.56.1.708.g77570a6a1d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
