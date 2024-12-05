Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FDDE7717A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 10:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r2h7Y8gCYhjEiBVfls6o2qzqChFBV8uYwqwd5RyXXzo=; b=2uJu7OI7kbh8Pm
	QYpSL7eCivKWvYBHWvms8jXRz3JGVbL6YE6LTM0ioexShXNt8hyhrcBqly2M06lkg/3zHLtMU9+qR
	oXKhfxnKXdvAHzmRJ96A71p7s+ncckgmO30tfVXlq2VcUlpgO1bW7KEuNiV2cT9oVlZs8lJUff99Y
	3y1aa2+ZWzad/xrjZDYELRQWRZlqOOOgnraa9s29ufEdZzRaBCP2ZAHTSolIIbsyWC+wgLoBlRR2t
	gFhaZ86PUIIJf4ZB5K/a/A/kCEwfvHleHUC+vrJLmxakYT+UPd4JKADB5cPWzrQOodbCctZYjOG4a
	UwM6Vqi5t9W8ldXwjWEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Ls-0000000FaSa-2TzL;
	Thu, 05 Dec 2024 10:44:56 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9FU-0000000FYCS-18cg
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 10:38:21 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-71d46ace74aso371853a34.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 02:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733395099; x=1733999899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfWeT6m9rP2RvyJAYvuGAOSzcqpyDy27Avf8NzKYXNE=;
        b=hYPxKtkWSsN2rordmFQQRyfMVoh2oYdZROAo4+HjqCuOzSOa9ced63XcW5Kjqf6ywn
         MHrvhpVS3GkvNYuA9sVOmkf341vHnRqFv3RC+HMp9gfbl+06k9jbGUQsQ7/eWnd4ORjc
         Q97GmwWD5Rp63Rhw8Vu/g3McosgowbiBOx1wmPgzGkciJjucnfJo1suJ+mDQCuNZf31L
         /O66CnmOaY3FImO9m3pGtL/4Eudt1gLNHH1na4TJEyXEpcf9h6G9z5K+vx+qPDJQwQZR
         sBsI+p0NZvR3ZvpumVelp2knN7MM6QgaLyDN1eNnwtC1wyfZm9BuwpQg3dAA1N6T9kfF
         LZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395099; x=1733999899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hfWeT6m9rP2RvyJAYvuGAOSzcqpyDy27Avf8NzKYXNE=;
        b=GFq20yli0O8Q3xR9mILIzgaqmkIrp7TnwbBij9Xr4RN2mn3X2O9L/OWDwQ4CG+x+Sr
         M1iLYM6WlT2OoJ9vgveY9wyzlAU1pIqmIpksttz9PuxSkitoCwu0zeOtkJkJpSQXvgdc
         MezmG7XvRsh3BMuWXLFNVwWRhXNumLQtgyTo2NoodeRTQ1YdB6/R0TXVR0w6xLjeZ5xu
         2mO369KZMXojGB8PsNsVWXPacTsVc5xFOt7ZcjMp1IlkONMHoaPbfkgMVCXABGth/9cr
         9jU3jn+MFYkmZZqNH8PUXslTt3006vXBqF4KMlHJTDD51gdlnTUxNByeWlHMr2dkd2Nb
         VJOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVd16K5fbcrskRQSnGxXN5mN4Phf1bGJkKmM9Fdu7dzH9nQ8HwzpqNe2DU09rLnkUIZ1dA3+qMAKOtiA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJaEIg/BuEAScax22UWj/YVpM+TxI2jwU6x8aYO0r8RvL0FA/G
	ZxjIyEor/HsS9KDitT9EJAf5IekSJ0x/0CG54huD/2JSSAJiPSgnLRAvff5gXpE=
X-Gm-Gg: ASbGncuh9XzPeqJm2gQwKONpLkDNgZvItazx+AU88U/7m1suY4Qn2I8myt/QN4pdQIe
	6J6dTWhWmgaaZecJgbIJQn+11ZVC+CNamWrcV3uGwHYxTURzjEOBpP5Z+Op/RJsQ+Ecujt6FRxP
	EoD1ZREHRpNGqmKI1e85FeEv5nr80RKNDKMihYxXOQVgrN+zNrVmiZt/TPCwXs07pqiAW/n2NiX
	0UnQBL3KRnPS8EkE75/U7mVuDN8yD1tJsJ8VcM5d0wJIoJEXpjCCvJhhXWNYQbS7uZqTGkLLjWI
	RxCV7gTw+BmK0SIpUizZOv7D2sSJCEpq
X-Google-Smtp-Source: AGHT+IHmo8dAIPLaAwW/lT+NI/PJnWblM6aaHV5WtIj+KNZJRyA2qtNhsMIENCAwyOOd5jQe2iKEOQ==
X-Received: by 2002:a05:6830:2aa8:b0:71d:4488:19d9 with SMTP id 46e09a7af769-71dad652c1fmr12149732a34.17.1733395099595;
        Thu, 05 Dec 2024 02:38:19 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156f048csm886826a12.39.2024.12.05.02.38.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Dec 2024 02:38:19 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	punit.agrawal@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH v2 10/21] riscv: mm: Reimplement PTE A/D bit check function
Date: Thu,  5 Dec 2024 18:37:18 +0800
Message-Id: <20241205103729.14798-11-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241205103729.14798-1-luxu.kernel@bytedance.com>
References: <20241205103729.14798-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_023820_305878_158D78D5 
X-CRM114-Status: UNSURE (   9.09  )
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

CPU that supports only 4K MMU usually updates access/dirty bit at 4K pte
level. As each software page can contains multiple 4K hardware pages, we need
to traverse all mapping entries to check whether corresponding 4K page
is accessed or dirty during pte_dirty/pte_access functions.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index bf724d006236..c0f7442c8a9e 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -553,6 +553,29 @@ static inline int pte_huge(pte_t pte)
 	return pte_present(pte) && (pte_val(pte) & _PAGE_LEAF);
 }
 
+#ifdef CONFIG_RISCV_USE_SW_PAGE
+static inline int pte_dirty(pte_t pte)
+{
+	unsigned int i;
+
+	for (i = 0; i < HW_PAGES_PER_PAGE; i++)
+		if (pte.ptes[i] & _PAGE_DIRTY)
+			return 1;
+
+	return 0;
+}
+
+static inline int pte_young(pte_t pte)
+{
+	unsigned int i;
+
+	for (i = 0; i < HW_PAGES_PER_PAGE; i++)
+		if (pte.ptes[i] & _PAGE_ACCESSED)
+			return 1;
+
+	return 0;
+}
+#else
 static inline int pte_dirty(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_DIRTY;
@@ -562,6 +585,7 @@ static inline int pte_young(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_ACCESSED;
 }
+#endif /* CONFIG_RISCV_USE_SW_PAGE */
 
 static inline int pte_special(pte_t pte)
 {
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
