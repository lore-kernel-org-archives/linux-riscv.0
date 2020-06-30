Return-Path: <SRS0=QRI7=AL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B99C433E1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 06:28:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9645920775
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 06:28:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FutI6WCI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DuO340PL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9645920775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qo9bcpr0O/wV9oalQdLnp308KwGkyj1q3uWAJ31+MnY=; b=FutI6WCIlH0FKT4haRNP26THgE
	t6n+nNVnlqgk+VxltpkkW4076Mqjql5DDuEjUdlc06f57Zh4VFnXyY/VUH/AbBYb0XCC6hLH71+W1
	ERlJH1JYkhrE2r8pquz8GOTqp1KIICrVJvt8bVGnvOHo7ERmM9Tkwv+zYiy1e3ltfpAwwRQU6axfk
	444Wol7jOWp/p+9lk8+QY6RcAZrQ9OeqFdNBKYer3fx8YNrxdR+mQzVdIQzv9BLz0rkLVAfttC9Ic
	DLavAmpJsGjs7Li9EYf/9o3o8H1tkIytchILyWtYoTPcPIcNj3ucu+gy8Th9m0lIo5+CQ2Oo5dscs
	dO1WZJ/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq9lD-0006t7-Bn; Tue, 30 Jun 2020 06:28:51 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq9lB-0006sc-41
 for linux-riscv@lists.infradead.org; Tue, 30 Jun 2020 06:28:49 +0000
Received: by mail-lj1-x242.google.com with SMTP id q7so7841835ljm.1
 for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2020 23:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zh/hWc4r7cZ7FP05AK2iPcOP4j6SOsMCoNiN5zEG3u4=;
 b=DuO340PLKDhAWxll2RkuZvjQacukqtXNx9jKKjNiXLXIicLaW+UW/axNZmNMGJzITr
 +6y4yereXqs2h0YOxQ0GZNHs68e707FGc27XFkcPT/pGy8vUeYjtzXXxHznjn8Z1cuYq
 FXLgvgZUG11O+0VEPF8upvoAmw8bv1ZX0XxIx+cubDiTfiemr8Qmb9Dy258E5DgI4wHk
 ByLQ6B2HZLmbcxJepww0vUQaVFFdi7viMZw50IGCrJaCEN7j+OI9JE8mVXyrNPzFOcOz
 nMFuOvNj5Yd6DBZr3e3WMIcpIGQvpf1UTbut+IMI2q5D19Ee9m2jt3bh0seNO5lrSkKY
 KGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zh/hWc4r7cZ7FP05AK2iPcOP4j6SOsMCoNiN5zEG3u4=;
 b=b0uADQzFbQXMpZcZTnPjM/PXWDhmmq0KV+Z8YCfo63STOUnpI3f4Y5igSgxyCKRhm0
 SMVk661P4A8+0f24jfAjWMEBgVT07WarWdKwumkjfJssNEoXO/ChtqlOcGF5BRp7LQoq
 /ryVRZEYvHuc6e4o9d2TG+wyoNgG/aEKdQS160nUPWA+bcdION47JzMkc1kEQWuCD3MY
 ZViQeYemVDgBkrl8OAUBq4vqnW9Sud40GKQtO9uyGpZFKxdWbFg3fZGaAuzW/5b/BOSr
 shpdBONd4OVN5g6SyPQWUrDREVsns3mvg3YZbBvv/D+B5bR+YOOL7QljMqlP5N7pG0z0
 31pg==
X-Gm-Message-State: AOAM5308E283X2DgjGqiuWueQch2zFKpjhWVq/1hf8jx0iCtTMHfr88n
 UKW2UpOgPqMduFurv2AlaBQlu9Lfeok=
X-Google-Smtp-Source: ABdhPJznit1Qej/9E1/qA9oplqfDuDB6/i0ztAOJRCvIqjdZc+3QHNN1XF03oV244gukQWGaasxOag==
X-Received: by 2002:a2e:9d1:: with SMTP id 200mr9142803ljj.392.1593498524781; 
 Mon, 29 Jun 2020 23:28:44 -0700 (PDT)
Received: from localhost.localdomain ([2001:999:83:73bf:51e9:ed07:efac:8bd])
 by smtp.gmail.com with ESMTPSA id l5sm537571lfp.9.2020.06.29.23.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 23:28:44 -0700 (PDT)
From: Pekka Enberg <penberg@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: [RESEND PATCH] riscv: Move nommu pgprot_* macros to pgtable.h
Date: Tue, 30 Jun 2020 09:28:28 +0300
Message-Id: <20200630062827.16589-1-penberg@gmail.com>
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
Cc: Pekka Enberg <penberg@kernel.org>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Pekka Enberg <penberg@kernel.org>

The mmio.h header file defines some pgprot macros for !CONFIG_MMU, but
pgtable.h seems like a better place for them.

Compile tested with defconfig + !CONFIG_MMU.

Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Signed-off-by: Pekka Enberg <penberg@kernel.org>
---
Although the patche appeard on the mailing list, they never made it to
the inbox of some important folks such as maintainers... I assume the
reason is that "git-send-email" used "penberg@kernel.org" in the email
headers when it really was sent from "penberg@gmail.com".

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
