Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89FC606A325
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 12:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LTUMOhWS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZoEF7GAp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=dGniS+zDFmZhil5XHcOEH90JnyE3cW/lNzwCf9ci4Yc=; b=LTUMOhWSvLFcLn3mUCBrYwv6yF
	t+98NQ4HZC+n61iNG+c6f2nJol7Bzpgk8aKxl6tptxa10urenn0HFUenYV+jr3qDLxDUXWZ+MAY/p
	GgmTTc0AcT55zSnAt3/6Qgu3u9wf12aVQM1D8UnBgf8SiGo556IMp33lq3vQFxwEBPDRJSUgIalAp
	8tnOhtBnq3JZlOXupJ3sN8nOW14LkasGjIi/7pMyxwyi/FOqdzjxkjZ7WKM9ljNVKJRjjWsOhavDc
	ZaoEwa7y9FnDwQaE+uvW7w5hWwiCHKvtU6MaC3rtZ30Sht+iE/Pb22/n+/jtKnV/geYtxMt69OUT0
	jTvsbxzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknN-00000003n1q-2srw;
	Tue, 10 Nov 2026 12:17:49 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknI-00000003mvQ-3XTV
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 12:17:46 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-48e011829easo1297884f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 04:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794313062; x=1794917862; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gy+owdWhI9aq49SvOXumwy6C5wawdvH/TU7Zgbh6cFQ=;
        b=ZoEF7GApyFNrkkrVD5sQvSnLYC+ExxuFctL4QY6knuYEM7Pev96eK/c4+Te7cEd5ch
         IX9nqXVTYvzRQnPnXlNatp5LC3IPrxDrjLYW4R+sBALAZwSqzwruSmVwCH6bgW+n7d4t
         v7XIn+SjQLZWR2a4kIwmmORwenv35IXqxy2t0TUszb0MyUDBjO4haA1gxu7kYol+keys
         5oyHJHU1Pmnq/Q/sqZpi95TOMN0Y7GJ2L99oNkkmrWMuCfVRprl8isvO8nSDHCpblT4P
         KEvCyKd5hjxvusbJda2ydBLIMFFIp259IRX+FvzgIDIwJ1lNBBq55/YhmPhH/buInVa5
         oIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313062; x=1794917862;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gy+owdWhI9aq49SvOXumwy6C5wawdvH/TU7Zgbh6cFQ=;
        b=MJBosX/wCPLPmWFtjYz91t2JEnbe6WqyhraL+GBGXvMP+v78dE1f4J/UR3bKYpP5Nj
         d6ZGF9/G4aRkqrKfck+pxnDIsf6GrLy3xSN7Vmbmf/govzBRa+/6cWWezolC4EaOIV01
         DXrxYpiOdO9a2in8GcXqNdHnj3Ic/gp3wt18MGABiXRl8GzRkUFHjWqmZgz5sx5A0Qez
         7qqDJKcYN9mp4lmsM+VbbPqErUHdtsBGWbR2XZFgQqH0IdyKzqThP0pJ4TkXGOGVl3TC
         qtvemKAkEPwJxPzVkT7TRUAdB4X89dQHslZTlH+TcVATdc4mGJoc6l7tXAVlT+xavKl2
         RYdw==
X-Forwarded-Encrypted: i=1; AL+hErFgZ+NqhGJ+p3g6nmem5MBmIY5Qirqu7JN0K3zuRnwDNY0MnfSbGye+LVWKOwxQoVIZ6CubkjbWOeWViQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/us4MBXRqLLKS0cdfePM8LOWEGQ1OnI1BAEGUBLJStanShQ8fZ
	CSwbUwCi6kCP2JEvrCjgogGOMyD2kGgUqSyu8kEx92xQSRofSUuTjS0GtJl7/UYRGlVZwD8ngg=
	=
X-Received: from wrxp4.prod.google.com ([2002:a05:6000:184:b0:495:feb9:bf43])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:298d:20b0:48e:202:6718
 with SMTP id ffacd0b85a97d-4982ecf6701mr3321662f8f.25.1794313062387; Tue, 10
 Nov 2026 04:17:42 -0800 (PST)
Date: Tue, 10 Nov 2026 13:17:35 +0100
In-Reply-To: <20261110121731.2728824-12-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261110121731.2728824-12-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110121731.2728824-15-ardb+git@google.com>
Subject: [PATCH v2 03/10] efi/libstub: Avoid _end section marker in library code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_041744_939078_8A67D4B5 
X-CRM114-Status: GOOD (  13.43  )
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
2.56.0.542.g3ef89b7020-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
