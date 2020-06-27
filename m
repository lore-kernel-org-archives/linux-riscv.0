Return-Path: <SRS0=1V8E=AI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE92C433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 11:02:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5828321473
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 11:02:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B9DD1rn4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWvKtLAw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5828321473
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/t/fjUCRDUX+JdUE/12mNl0S/W8gVKQAe+vFgKZ5iIo=; b=B9DD1rn4buPPO2LO6ww68SBl3q
	SRunkVd0D+N9i1RP0wu8EIJtnwCcK7YPgypZPPehR9B2VHWVdgLcrL4qrIsotRRY6nVoUkTm6dbkC
	BDfEjIqJ0dA28dbxsMPTOYcQpCzPriyD4Zclko+0pmbM3J/0Y/C7bI+427QOeLHglWwW2V0gRvKip
	93z6nv9fDyY5C3HaeOYb2allccOwwH6lKGVW1n83QBrDSZQJLXeSvQDIRCBgSYdEYcMWoN7ivSJxW
	fRCAbkisEUhziQoh6eCAcNJxyBVsPE0GSMy3c3ghfCOF9GfT5jCxkqeNnc+AJv35DM9rFsg9PCAsg
	JJZgG1yw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp8bB-00043X-QR; Sat, 27 Jun 2020 11:02:17 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jp8b8-00042q-5L
 for linux-riscv@lists.infradead.org; Sat, 27 Jun 2020 11:02:14 +0000
Received: by mail-lj1-x241.google.com with SMTP id s1so12925544ljo.0
 for <linux-riscv@lists.infradead.org>; Sat, 27 Jun 2020 04:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zyhTfdH9m6eQW892WuS3FN9RdwTh5sVUxnmpydviR9w=;
 b=GWvKtLAwmeQCrdONXle3GGmnaV34pEALz7p0vgMHsfDW2FML06KTAMRHmT5rsjgdJU
 FNMt/uQ0Mj7MCAdGY011g902ELepj29+fq+0TskUwtjIpnmvFkafOzgfguUbhum/F8MO
 T5CYUnsu8zIY8Fwt6KWYE+9EtnTAG8h8GrkIlXXqD5WRy/kA5kOrwZYj6nHCKkPaU95C
 DL2k0u4tPbiaxEy6r0Dq3K+JTt5BXhxdvD9vnKyui8anhgg1A2Oud79rk5+OfpgeUXYR
 xbN184E5hIBYIbemkEvbwzfpqhoAoCH4vunNUlBBLonLr9rEIGNM2jbNpyX5bB+TIj+z
 Rteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=zyhTfdH9m6eQW892WuS3FN9RdwTh5sVUxnmpydviR9w=;
 b=BQNW6ab6gs8XB35HgZjh2Yj9jNIgv/eYCmozXiO2fjPzwEY2w53yg+ccuLi/ttjVQ3
 AVHuTAJB2shsuuT61QY2JysC5NRYeL8YH9X//fIP3paVz8km8PZcJYulRJbskQpY3AQR
 GX4kOU9nO9EubilUHcwc319SM7W8i3yfyMdrwA7P7j66olGl2K8TlDDdKDIJHjxcohKF
 zLA8mWpAh+1z338nvqLlR+U7rL1OscUpUq0GVr6HPDqC4eOU8P/q6h5LEvCYvFNxMHez
 to54/5J7elHCR08q935u4XwLVKM6qRXRHZG2x+zyus5n/EggvobJA0nN8nBBx/ikS2YF
 gmMw==
X-Gm-Message-State: AOAM530zgMTGJ6jQSmXQfeKkKtoAsJFYfkcK0Hjb+e2xR9D8d3YOAesG
 9OYHkfQxJvH8YS9/6ddr8ELVjljGNc4=
X-Google-Smtp-Source: ABdhPJznQv4p9i2bigVoF9sejAjsoH90GK/gBJ4xhsKqaJLLuGYR43dGyyAA2vN+3hdKXh8GnMAApg==
X-Received: by 2002:a2e:8e9a:: with SMTP id z26mr3816573ljk.470.1593255731011; 
 Sat, 27 Jun 2020 04:02:11 -0700 (PDT)
Received: from localhost.localdomain (n7z3yuaxmzs2i9qkd-2.v6.elisa-mobile.fi.
 [2001:999:11:755b:51e9:ed07:efac:8bd])
 by smtp.gmail.com with ESMTPSA id t16sm5881792ljo.22.2020.06.27.04.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jun 2020 04:02:10 -0700 (PDT)
From: Pekka Enberg <penberg@kernel.org>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: Move nommu pgprot_* macros to pgtable.h
Date: Sat, 27 Jun 2020 14:01:41 +0300
Message-Id: <20200627110141.1523-1-penberg@kernel.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Pekka Enberg <penberg@kernel.org>, Kefeng Wang <wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The mmio.h header file defines some pgprot macros for !CONFIG_MMU, but
pgtable.h seems like a better place for them.

Compile tested with defconfig + !CONFIG_MMU.

Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Signed-off-by: Pekka Enberg <penberg@kernel.org>
---
 arch/riscv/include/asm/mmio.h    | 6 ------
 arch/riscv/include/asm/pgtable.h | 4 ++++
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/mmio.h b/arch/riscv/include/asm/mmio.h
index 56053c9838b2..aff6c33ab0c0 100644
--- a/arch/riscv/include/asm/mmio.h
+++ b/arch/riscv/include/asm/mmio.h
@@ -14,12 +14,6 @@
 #include <linux/types.h>
 #include <asm/mmiowb.h>
 
-#ifndef CONFIG_MMU
-#define pgprot_noncached(x)	(x)
-#define pgprot_writecombine(x)	(x)
-#define pgprot_device(x)	(x)
-#endif /* CONFIG_MMU */
-
 /* Generic IO read/write.  These perform native-endian accesses. */
 #define __raw_writeb __raw_writeb
 static inline void __raw_writeb(u8 val, volatile void __iomem *addr)
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index eaea1f717010..e82a32112b7e 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -459,6 +459,10 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 
 static inline void __kernel_map_pages(struct page *page, int numpages, int enable) {}
 
+#define pgprot_noncached(x)	(x)
+#define pgprot_writecombine(x)	(x)
+#define pgprot_device(x)	(x)
+
 #endif /* !CONFIG_MMU */
 
 #define kern_addr_valid(addr)   (1) /* FIXME */
-- 
2.25.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
