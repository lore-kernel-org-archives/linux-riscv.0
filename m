Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C97C77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  1 May 2023 19:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cgk4tcvb9kiGToIC0UlvHlgo0TYHZdvLpK8T6ffOj7w=; b=k8whlLtbVzTDQS
	hHn9Sd79iwCBZNHKgcVKmAbgFpFnMvM2e5lvPzL1ZlZEyqxC9wtE1cWY9WtrGRMoLdiWuH9HzjH0U
	1Px0wySw69hcYXghyQ8x5i3VPK3W3kxFmQ66DTiMtHZJi1pypztkgbG5H4mE5DyjHrVkpvKXecWcq
	OKZo+Jfo4RREya5R2j5taT0LULMF9z5R3uATeWRXs/7T3t0QuWS+t0CGQs73V3TLBZRzxpBa6Zzb5
	Ju8VfPWy1W9IEt0CyOcpeF4P1TxBwR0rP7UmOyAKTzfS2++wa+KPlUkM/YJAuNfFMrI7vakOtJOL1
	CLKYvgdfaIoJJhSe4zfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptZUs-00GlU0-2E;
	Mon, 01 May 2023 19:47:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptZUd-00GlDP-26;
	Mon, 01 May 2023 19:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=apg836Gn0N7QExyyhUUGNgc2fd2r3iyoAghRwsUjc2o=; b=SFxpzWa10PwFnznuOQHniAcezH
	1pL0ho3Sb0om+wpVrOyFtzdQDvH/Zdl6IWlfBhUw+eYXuhDDI8cWsdJTDUnsRoSjpKCk43/ZzqjxA
	a2eJQaA2a5EqGW3I1P+Ha1HMXICRD67WDMD7h3rPNpm4bng8kFW+EUxI1lWgrS0WMUOoc69Zt54yZ
	o2CrKnSaT5na/IZGlD2aEIArydgOWfkm4A3hPZMG+c+vl9h8A3FH9Ty999Ty2XCPO56jsAn/dpcjL
	NkE42ksCdyaJjNBCdr1c60X2OUznftKllSP5pT8uD4jw7WNL5e9xnGHwAaL8mWI5dANJn667Bh/md
	qj3CbWpQ==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ptZCv-007csS-5x; Mon, 01 May 2023 19:29:11 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1aad55244b7so19089945ad.2;
        Mon, 01 May 2023 12:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969347; x=1685561347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apg836Gn0N7QExyyhUUGNgc2fd2r3iyoAghRwsUjc2o=;
        b=WbTJO1ayjn3HXL/iQMZCmT2+RnFSF2O5WG+VKbNfOxDU8NvbfSgz+Wjs4UVgNNQcMr
         uLj57ayYRa/f+rOhAVP0jHM/2f33b+TbcsUuT8OausfFIQuWjGI50HrH5E0KiKkIgQwa
         0uM85OALkALC3dGk5nJ/tYYANgKg4uu8cRvFIwQEiY4YzwHIJvVidPyhHtwxmNKQYA0W
         tAWz4vl42KgoRYKzs8w7tUocWedsU0Shw+kefBEmySvrYYB7bH8pThcvpYZ6Dpmw316z
         icjhKqrruYJxczjDCcNsGgrwDrViIcKW8h7/U3ESAg45ipYAB08luKD04Ylpo9b00Q6j
         cFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969347; x=1685561347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apg836Gn0N7QExyyhUUGNgc2fd2r3iyoAghRwsUjc2o=;
        b=Tn9o+V+DvCEPrxHaG8p7sk7qLLOLMMU00lCsDFs56Mayt+TgVL+s47dAmBxWduYnXO
         r3R4FHR0My3+QgJ2s2m9f0kgrSdaDyQ7hzpQf3DdtYrL09nRDTvcnUn8sFzRExTurrVY
         AKehAqYWeN+EWnXO3Ca5rtjIHpZqRPQr4Wnx/oLmPU/Y2H5OUH+bKtl/Mftj1nXAUyJb
         DnkfnuHXPWwhYc53BMq9t5qdi2qhjiti9EIF/OAqstWiv/Sm9VodrUGh2UK1r1Ik2vWP
         rC8YqVYp8lKkcyUzWwE1sGlL1jm5p0TK6hc76vmKqINvR034T6QyM7vpBR31yYZc+wL9
         ueUg==
X-Gm-Message-State: AC+VfDwFe4yWR0+y3DxW9lGZFU+jNAqTfEmTBsp6z6VER4PQM/EGPuPw
	4Tr48BgJenSdQSMv/Xx9ZIg=
X-Google-Smtp-Source: ACHHUZ6JhHSCQpD21/kJ78iavglhPlPTqvuf+3JEce/L0R67tH5klQ2MwjR0kPXU/JMC0Y1BeGjoZA==
X-Received: by 2002:a17:902:c94b:b0:1a8:626:6d9d with SMTP id i11-20020a170902c94b00b001a806266d9dmr19271440pla.62.1682969347146;
        Mon, 01 May 2023 12:29:07 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:29:06 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH v2 23/34] hexagon: Convert __pte_free_tlb() to use ptdescs
Date: Mon,  1 May 2023 12:28:18 -0700
Message-Id: <20230501192829.17086-24-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_202909_274704_3B5B917B 
X-CRM114-Status: UNSURE (   8.97  )
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

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/hexagon/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/hexagon/include/asm/pgalloc.h b/arch/hexagon/include/asm/pgalloc.h
index f0c47e6a7427..0f8432430e68 100644
--- a/arch/hexagon/include/asm/pgalloc.h
+++ b/arch/hexagon/include/asm/pgalloc.h
@@ -87,10 +87,10 @@ static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd,
 		max_kernel_seg = pmdindex;
 }
 
-#define __pte_free_tlb(tlb, pte, addr)		\
-do {						\
-	pgtable_pte_page_dtor((pte));		\
-	tlb_remove_page((tlb), (pte));		\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	ptdesc_pte_dtor((page_ptdesc(pte)));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
