Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C810C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 13:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nIuA+rOx50VG4X/dd+fIUIf5tW5gKoGLBczN9U8YIp8=; b=lDIjsNz0O6gjQR
	2Li4ako2Mu1WFRTtD9L07ClL90pyEsKhwina0uLiQ2PQRT2cOd3z592PuT1tiOlNj5cpihFT5cbkJ
	9Cm9YZal+kXWM5N7uBuJ5wSXIUADgpdHGzWB6Y+QHrfpHLvU8vvWRkX1YZph2GVadYd1fRrbJnL4B
	1svcjJGELhzDiBDvmklUDTanZ5f7SWTh91R5VhMvqhAATd7mDc3TxzyWHnk3ixV+VJN3PPxbpwPo+
	5eVkwlHzyaQAqNZyLrVejZvxkXaPMT4gbdirFI10DsSp5tsKddy4f12y3HOSz1Jwie7Rw2hxOTze/
	a9/xGdG6vbU+Q7fhovbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPVh-00ErMG-02;
	Wed, 13 Dec 2023 13:42:49 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPVe-00ErLV-03
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 13:42:47 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40c39ef63d9so44274585e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 05:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702474962; x=1703079762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gB+51HnZ1EhLqxZjb5NMil26fuA19Nyv7p+UCHztgCI=;
        b=03b4OzuxRNGIriGQqtV42PNR1fUsaYkrsKsNUNnQTG3DDM3n13ytaEq3Q7LVyMXPVv
         A6rVCjb7XipZiLxV1O+n9S0hCA0++2HYI55R1+QU1CzRzIxLkXzH7zFItf3XNBWt5YCu
         weF/fI42ntW0tmljLp9ImNX8zmj6a/Yxe1weXrkpKpAu3H14S6f4RF3lJjrV9G8PWX8W
         drfM+pdrBz06JwUtl1sGvdWmxCgDGv45CwPGmvr9G4mVigWQ/hs4wZe19Kd26pr+MWCU
         NszVuuq6Y4MrxV4hIyBI3ZJ8dgxgyQNRJHxZ/qB+bCBwvLujil8A5xlVkpqlap0F0q4O
         ukXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702474962; x=1703079762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gB+51HnZ1EhLqxZjb5NMil26fuA19Nyv7p+UCHztgCI=;
        b=IKGQ7WfbBQeXfbI4mEXOJm8Vwzu7Hlc4l1guJACH+unJt+aaXoX4P90a3K+V+SrifB
         TLOkB9GVPV1rDWLHoRvxguGvvAvEUD5vqQ8SKT+uqBDswWfSRVYle/2vKMoVbMO+6IYI
         BPgMTzsgkNQdkPEea+9GQOX17TTlzORv9kB5yYH0nGLkmdyzGwMuniP/jN68YXHZemhb
         2Xm4ozMrxvYl3vYCDvne3x114NWvM2g6QS7E0XR7pYjSsV0b7QTBhtHd4rbs+kYuEIr9
         Zy1JYXrq8oWAtCEO8pXoQI/y3F8PQV+TjzVHJBesRMjkih2d2a1JeLQzc5vnkb1hjdho
         QAIQ==
X-Gm-Message-State: AOJu0Yx1n5m2uvE9EITpfAlm3wXWLqIE4Oi3d/4K82c3R3kczGsgSYSN
	bZaJxXJ26vnxDuEutVEx52R6Yg==
X-Google-Smtp-Source: AGHT+IETI3kyqEYJ/qlZfh0+NlonQyfI339qGsyMbMK4dWWwNoP12b0YuZDoOk4QRJyA0AaWi9ozAQ==
X-Received: by 2002:a05:600c:35d6:b0:40b:5e21:cc40 with SMTP id r22-20020a05600c35d600b0040b5e21cc40mr4337934wmq.107.1702474962563;
        Wed, 13 Dec 2023 05:42:42 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id t15-20020a05600c198f00b0040c4620b9fasm11988105wmq.11.2023.12.13.05.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 05:42:42 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Vincent Chen <vincent.chen@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes 2/2] riscv: Fix set_direct_map_default_noflush() to reset _PAGE_EXEC
Date: Wed, 13 Dec 2023 14:40:27 +0100
Message-Id: <20231213134027.155327-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231213134027.155327-1-alexghiti@rivosinc.com>
References: <20231213134027.155327-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_054246_052311_A07C85FD 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
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

When resetting the linear mapping permissions, we must make sure that we
clear the X bit so that do not end up with WX mappings (since we set
PAGE_KERNEL).

Fixes: 395a21ff859c ("riscv: add ARCH_HAS_SET_DIRECT_MAP support")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/pageattr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 96cbda683936..01398fee5cf8 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -383,7 +383,7 @@ int set_direct_map_invalid_noflush(struct page *page)
 int set_direct_map_default_noflush(struct page *page)
 {
 	return __set_memory((unsigned long)page_address(page), 1,
-			    PAGE_KERNEL, __pgprot(0));
+			    PAGE_KERNEL, __pgprot(_PAGE_EXEC));
 }
 
 #ifdef CONFIG_DEBUG_PAGEALLOC
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
