Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B62C606A336
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 14:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uVZ+5Sfw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NCBYO8xa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=SrDA2suh35nqjtT5x31MtlbpzkdFHF91M5nTT91N20c=; b=uVZ+5SfwkkrDgJNNZYrgVgJaU7
	pCh+lsd4+MZyKqhQweFctt+fP9fWtOOD6VD02460aeoMkMbGlw/MPI8mZDXfrryU1MIjez41JPUt1
	Nhk7IdRKb5mufACMQp4A4jEGn36OoSbqRo8lDvclsS/IDGZEA660C2kAoEP/eUgAolARsqFqcnF4I
	1/oO+A2mz2/XQzbaeCE+7HHzY+SCV5s4imNzSHkqQhCCZ6g/bUgmIpDAb0UU9hZOeldo+zlepGsln
	4ShFo0ywbz3By7LRKTXdzsbqj2t/NSiO0B4t7WmqjN03gJDiAxhMp6TeLS5UzE7UhRiNVfdNt+DNk
	ou65Xxwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxhG-00000002rBh-2LfW;
	Mon, 16 Nov 2026 14:28:38 +0000
Received: from mail-wr1-x445.google.com ([2a00:1450:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxgE-00000002paK-1U40
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 14:27:35 +0000
Received: by mail-wr1-x445.google.com with SMTP id ffacd0b85a97d-48e0461e040so3108091f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2026 06:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839251; x=1795444051; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GDmEcRmMyOcax5mKICmpAsSQPFvmFrhuIcwUrIgFdio=;
        b=NCBYO8xajOTc6uL0b9DMrLpQwaBNRUAVYNcCYOF8Jtminy8B1t3XjxD3yTmdOnt/F6
         1Qbd4aX2bHkU8Zls5QsskUWdF2AL+F7fxwh4Re+xPzrjPpHVNvJsOG/mZYAt/dVnjua9
         hlxDSsZZ6YqUEx1IPveU9mRPbjGffVOoBSFDPtjbvYlBKwCRSgDV+/l9X3MCCXdvhQVR
         /e8CnpE04Y0rSeQVDKk8WLe6nBLdIMLlXVcjKoR/VEASFM/uS2D3sMxy+te2XNd52lJX
         W5/+WQm2l7WwMrINhOjD9kZEslj5LpIadH1nO/8np23+vY/fnipqNN9cQs2lWOwZGexx
         jvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839251; x=1795444051;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GDmEcRmMyOcax5mKICmpAsSQPFvmFrhuIcwUrIgFdio=;
        b=QlBZ5fATf7WUZnwGj2g4dO6ku972hbuRtBtUDGuy/oJKAMgsb+LEKBCbrn2YiOrKxi
         rekZxFIC0n3IXPHVfDOiKLQ2dGdEu+aK5wvYcHkKVYs9834uoLb886FAWV1TJ55PaFp+
         ky5m+ilRSdM+3tQY4OEhgxrZtOz7xsa2LAFT688y3kPp8OPADf/ZXyFzrgFVs8PVysk+
         mSjl+lRx7s63ABknDtUxppRIgyNwmaZ3+DC8Dj6B5SJmB0Pt2pLJb1vhcSdKxnWcTOaB
         4YxD7vxnJqW9zIjGmH/Ika5H+cRauULCLl+EEcVL20+Yrdd0Z6lzgAcKWXuE/02B5+uZ
         ONPQ==
X-Forwarded-Encrypted: i=1; AL+hErFbaCOeh4solr2mG6oqKrWSa2HfstEpd5zXFscbRm8BVWuYZNKhqR3vbc6PA2tO8QzWoV64TE6HIAEGaQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/Kej/gnwUOWYnqJzTtvDdl39MFz13G0xmNSAEckK5apf4/WUk/
	I4UpsVOKdDO9qsXZgFmR59jVN4kAeESebQ+chlOeUqSIfJK6Rx08KqB1awqLFlPkUdbzobK22w=
	=
X-Received: from wrbdj11.prod.google.com ([2002:a05:6000:b0b:b0:493:1d71:a33b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:608:b0:488:7dc6:4e9
 with SMTP id ffacd0b85a97d-49c70ed8e94mr25114870f8f.10.1794839250838; Mon, 16
 Nov 2026 06:27:30 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:34 +0100
In-Reply-To: <20261116142618.1687025-17-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261116142618.1687025-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2284; i=ardb@kernel.org;
 h=from:subject; bh=pQuS5NqxIFj4wbVklTtBdnUPtGLjNWkfYhwihjrAl7M=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu30IKV0rIFvb3+jhJvjwtvPt+/VykrMM5e7MOqiDD5J
 z4biho6SlkYxLgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwETuWzL8d11y4WaaBftmeZMD
 53wZtqg9KLJ+1VZUrtITZ9u4o7zpACPD8ueZbzxnF72pm3I965OyuWpdZ0F03u3v0v87Z+lIPG7 lBQA=
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-32-ardb+git@google.com>
Subject: [PATCH v3 15/15] Revert "efi: earlycon: Reprobe after parsing config tables"
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_062734_750280_CF46E4FD 
X-CRM114-Status: GOOD (  12.62  )
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

This reverts commit 8b3a149db461d3286d1e211112de3b44ccaeaf71.

That commit added logic to probe the EFI framebuffer earlycon again after
the EFI configuration tables have been parsed, as the primary display
information may not have been available yet when the earlycon= early
parameter was processed.

Now that only ARM uses a configuration table to pass the primary display
information to the core kernel, and the EFI framebuffer earlycon is not
supported on ARM, the reprobe logic no longer has any callers. So revert
it.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/earlycon.c | 16 +++-------------
 include/linux/efi.h             |  1 -
 2 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/efi/earlycon.c b/drivers/firmware/efi/earlycon.c
index 3d060d59968c..997f69ce46cb 100644
--- a/drivers/firmware/efi/earlycon.c
+++ b/drivers/firmware/efi/earlycon.c
@@ -216,14 +216,6 @@ efi_earlycon_write(struct console *con, const char *str, unsigned int num)
 	}
 }
 
-static bool __initdata fb_probed;
-
-void __init efi_earlycon_reprobe(void)
-{
-	if (fb_probed)
-		setup_earlycon("efifb");
-}
-
 static int __init efi_earlycon_setup(struct earlycon_device *device,
 				     const char *opt)
 {
@@ -231,17 +223,15 @@ static int __init efi_earlycon_setup(struct earlycon_device *device,
 	u16 xres, yres;
 	u32 i;
 
-	fb_wb = opt && !strcmp(opt, "ram");
-
-	if (si->orig_video_isVGA != VIDEO_TYPE_EFI) {
-		fb_probed = true;
+	if (si->orig_video_isVGA != VIDEO_TYPE_EFI)
 		return -ENODEV;
-	}
 
 	fb_base = si->lfb_base;
 	if (si->capabilities & VIDEO_CAPABILITY_64BIT_BASE)
 		fb_base |= (u64)si->ext_lfb_base << 32;
 
+	fb_wb = opt && !strcmp(opt, "ram");
+
 	xres = si->lfb_width;
 	yres = si->lfb_height;
 
diff --git a/include/linux/efi.h b/include/linux/efi.h
index cc1df1577d5f..4a809c6ae724 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -719,7 +719,6 @@ efi_guid_to_str(const efi_guid_t *guid, char *out)
 }
 
 extern void efi_init (void);
-extern void efi_earlycon_reprobe(void);
 #ifdef CONFIG_EFI
 extern void efi_enter_virtual_mode (void);	/* switch EFI to virtual mode, if possible */
 #else
-- 
2.56.0.611.g1030f0b940-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
