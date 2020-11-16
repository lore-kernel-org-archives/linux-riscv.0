Return-Path: <SRS0=N5Fz=EW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4631AC5519F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 12:58:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C40DC22245
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 12:58:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XrUtx/X8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UcxwrlYH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C40DC22245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F6LNV1Z3DTDHgeqbjcsYYAU/dFQSVekyrtkpxjWxsRU=; b=XrUtx/X8bFFsflYLpEVgEC1rtW
	KuBVF6aAfWUSxSCHGNYjipQr2dX6klp0logzYKGB5enr4+vyVNr800vcCDupI46yuFAnUk8Jx0oat
	pSd/SLWSSor86JD07dxXaVFk2EZF5VYFz2H5CdBgzr0/2ZEukKasn8sWjATLBxpFFXN3frMJkNmz1
	zwYLMY5Wx3HQf1QIPVRfRyzIwgNJVpzWx1CQY+wRd6U6cduuvvb1ugOtx6lCnedNHFNjc6fTd+J+y
	HJ/yy2MVCbqZDhGRZqpzK+WFbq0JchIuOaXzA+k/iKDV+UJPiP3xnUj849uLCVQB9YronZc8+u+Jy
	rJGbBD9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kee55-0004LI-13; Mon, 16 Nov 2020 12:58:03 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kee4e-00049Q-0R
 for linux-riscv@lists.infradead.org; Mon, 16 Nov 2020 12:57:41 +0000
Received: by mail-ej1-x641.google.com with SMTP id o21so24276619ejb.3
 for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2020 04:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=VFpKYJVrRsPJ2PwOn4LC6Z/6haFi58vQxTRWQWD21uY=;
 b=UcxwrlYHdjveEkVGOcCJbxmGbOBUL6tkBTekK/9ff5SpqoYKOBJ7CU5qAVblx0z/hl
 54DqNDT/yAWZYzFuEeAcMo5bp8gvDYcJA5QzA6/vFkc9yCiMdHolwxzLEkb07A3oAo7x
 hYDSUn2Gie2QZdChHnioJ+L63lzvNpGRdFbP89tYdwFTmcalMXOLjmVUGLkPsdoIGMt7
 cSa+jg+YefnbTDNMr9tD5XkZwXh4B7knXFaR8lVA999YSTiRc+9+SAiz7iho+VL/qIbf
 Z1HakGVBCZC8055VAmhXTu49uh0PN8Xxp4mTEUaWslk/WAZmf/xc1zXBwlXrT7oE97NJ
 aRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=VFpKYJVrRsPJ2PwOn4LC6Z/6haFi58vQxTRWQWD21uY=;
 b=lCRIcW3XJnAgE29wOo+QTqMD6oHYqnmijgdF8/icyzskq+rBOhqfpIZp5DtNHOt7l0
 FtLrtm2OJVk7CHY3s3ZPUww8Z1HBoKtZZ0gSUQNER3PKzKIY04fhktURhxkUjkYPlBsx
 4XUv4cq5mABL1UK0HJfFHEgJmA93HUHUy4PKRJGV0UuEvXcCJtJxk7Rr5wMJp7sfqnzI
 B7ypCv+dPEeS5omnp4GuheImbRJZ0cMcLbsDYAN18UgtJGLpLe2CCVcqfOFrM5axuEfA
 t2GzlEHkuptXpbiCpn0/mN1dpiYaISyZg8h29X82A3igtzNe5siIOQuy5QWcFUr5+Z7z
 WzEQ==
X-Gm-Message-State: AOAM532AteXSY+wKR4ct8f3fmMgVRCC3rEFr0VHl6BLXttYjLu7uUBcK
 QeJaO2d9Cxmr+Iphx8De1zI=
X-Google-Smtp-Source: ABdhPJygdD1IllcjR6Ak13Nkrh75/ClXb9uRlokGu2vcEfnZWn+2ki6Ft6qW2Apnt9RcqSMXBUWjaQ==
X-Received: by 2002:a17:906:8c7:: with SMTP id
 o7mr6940825eje.413.1605531453510; 
 Mon, 16 Nov 2020 04:57:33 -0800 (PST)
Received: from ?IPv6:2a02:a03f:67bd:5c00:f7b7:1c1e:162a:e52a?
 ([2a02:a03f:67bd:5c00:f7b7:1c1e:162a:e52a])
 by smtp.gmail.com with ESMTPSA id q9sm10472569ejr.115.2020.11.16.04.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 04:57:32 -0800 (PST)
Message-ID: <3ba42880e5b43fc238aac8d30da271516fb281ac.camel@gmail.com>
Subject: [PATCH] riscv: Align on L1_CACHE_BYTES when STRICT_KERNEL_RWX
From: Sebastien Van Cauwenberghe <svancau@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Zong Li
 <zong.li@sifive.com>, Sebastien Van Cauwenberghe <svancau@gmail.com>, 
 linux-riscv@lists.infradead.org
Date: Mon, 16 Nov 2020 13:57:32 +0100
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_075736_134528_380A11A1 
X-CRM114-Status: GOOD (  10.63  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From 5690c2f91d87a007babb13e2d2c9c45d1ff68b7a Mon Sep 17 00:00:00 2001
From: Sebastien Van Cauwenberghe <svancau@gmail.com>
Date: Mon, 16 Nov 2020 13:37:32 +0100
Subject: [PATCH] riscv: Align on L1_CACHE_BYTES when STRICT_KERNEL_RWX is
 disabled

Allows the sections to be aligned on smaller boundaries and
therefore results in a smaller kernel image size.

Signed-off-by: Sebastien Van Cauwenberghe <svancau@gmail.com>
---
 arch/riscv/include/asm/set_memory.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
index 4c5bae7ca01c..172e63d942b0 100644
--- a/arch/riscv/include/asm/set_memory.h
+++ b/arch/riscv/include/asm/set_memory.h
@@ -27,14 +27,14 @@ int set_direct_map_default_noflush(struct page *page);
 
 #endif /* __ASSEMBLY__ */
 
-#ifdef CONFIG_ARCH_HAS_STRICT_KERNEL_RWX
+#ifdef CONFIG_STRICT_KERNEL_RWX
 #ifdef CONFIG_64BIT
 #define SECTION_ALIGN (1 << 21)
 #else
 #define SECTION_ALIGN (1 << 22)
 #endif
-#else /* !CONFIG_ARCH_HAS_STRICT_KERNEL_RWX */
+#else /* !CONFIG_STRICT_KERNEL_RWX */
 #define SECTION_ALIGN L1_CACHE_BYTES
-#endif /* CONFIG_ARCH_HAS_STRICT_KERNEL_RWX */
+#endif /* CONFIG_STRICT_KERNEL_RWX */
 
 #endif /* _ASM_RISCV_SET_MEMORY_H */
-- 
2.28.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
