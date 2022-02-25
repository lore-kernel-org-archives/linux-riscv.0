Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02FFC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Feb 2022 12:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uxf1ZSgp966f63QNA7QgQtTKAIjaKeVgUVB0EIyg1cU=; b=VQrWsaf4fvALYU
	Srb8X61BTpEnmKFx1hMNg5O2Xnud/zUWBMYJ777eQMdUl+dR5+oAjcaCI4ivtR/6aq0a993Qe3a5U
	lsyTh+Z3dRJxB5U3wSeIHkQ8fFmaK8ZQH/rjG4Xaxo7hSDZ7j4o+P6EEjs5QJJggOg1KWb+iozYuI
	mbb+X3XuWlFO3URxZkJr9yXhDo8fc1RNhb5tfpv/5IkSGsfGPnJr4MnwGpyI5KnS451XoOlOVEDOV
	ryhqe161njSrcx580OkdkmSy1owrTBeKSpQMZalhM5gIMljqWdJYCbT6wNv2sxBCeTQGAs717YiR3
	OdXCLG54jSuUWpxYey9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNZz5-004u5b-7V; Fri, 25 Feb 2022 12:46:07 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNZz3-004u4w-67
 for linux-riscv@lists.infradead.org; Fri, 25 Feb 2022 12:46:06 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 016D93FCAC
 for <linux-riscv@lists.infradead.org>; Fri, 25 Feb 2022 12:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645793164;
 bh=IZZDTFAqzc8aGjWg1aZGEvUIk/RV0NTNXI1qwgw2jtM=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=arCbRdYZk5seUtqfpFHMcTWaLOyKd5+OpIelhJFWZJY87neb4lBCZw9T8kSVKZsY9
 e/AniF1Uv/fIuSPX6esv+MhDG9Y5lzpfwAAswU0acqt5J7Jmt08OOiwJ3ROtEtcRBO
 rZerSAoFM/Fcp526nk1oh5piNIder39elup/LfbXJUukWd8gOYxw+gvzjIf5F4L9ko
 nRqGl2XG7oK0TxA5Ko5M5b0TBVyEquDkLf5T98e5ayyexgzWOA2RHvVHhvoLzYP1PZ
 g+TCdCXMj0zYeWMK1Gb1saO7SdLZ9JUkvM1MY2i/Y0cvq+B0agYEeGnMdfUTjkF6Fa
 y24RMBd4kydKA==
Received: by mail-wm1-f69.google.com with SMTP id
 10-20020a1c020a000000b0037fae68fcc2so1511678wmc.8
 for <linux-riscv@lists.infradead.org>; Fri, 25 Feb 2022 04:46:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IZZDTFAqzc8aGjWg1aZGEvUIk/RV0NTNXI1qwgw2jtM=;
 b=l0RxGpczg0kORCQmUIP9Z7eB7pBZBfy+JIKlpc9P5jNtJhe2XmG3WN/Op0bmRfHo+N
 178KPUQw4xmEKfBRxd/XLXNXQGLfnYRg0tmOY376aap6wE52kDLA37Iw4CiCHpE4InFp
 u08rlLe8MOFQzpHRicIzZZ+ps1fgnLfrMqAm5KyKSMjIspQTXcAxnPkgPxZLUi05UNHG
 aiXz38sw2BlrYSd7OynEOeIL1k1MCbeKxgDEWPP/8ClLbzMr/EpYNrbaoVihjfifZYq/
 EpaOCvxa58O2C/eWDPIbqxHWs5ZhxIzlEjOji8gSMJHTY1oYDlcwLgZ09M20Tm3q5jK9
 Y+pA==
X-Gm-Message-State: AOAM533ZhD1uZi4dzmiQ03Z4XyGonLkvUb3TWM9IDnIiGjkfcBXunonO
 qjr80NwM3UcurVaMJpz1GJY6jxhgCZpHNyouPGUhVhcfjGAFf9LQeDUTZqhDQP52CdZo48HnSPl
 CM/+XBTjzfcZpHz2QDrRriQNLywcC4wb+09SCNAhtA3qA7g==
X-Received: by 2002:a5d:59af:0:b0:1e4:a027:ce3b with SMTP id
 p15-20020a5d59af000000b001e4a027ce3bmr5811399wrr.318.1645793163265; 
 Fri, 25 Feb 2022 04:46:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxO7k/BdZpfrSelXcnhXik1Fk/jhx3wZbS/FHtdA4vPeJI99+BzxjzzIqpykVUwH5wXXBm4Wg==
X-Received: by 2002:a5d:59af:0:b0:1e4:a027:ce3b with SMTP id
 p15-20020a5d59af000000b001e4a027ce3bmr5811384wrr.318.1645793163068; 
 Fri, 25 Feb 2022 04:46:03 -0800 (PST)
Received: from localhost.localdomain (lfbn-gre-1-195-1.w90-112.abo.wanadoo.fr.
 [90.112.158.1]) by smtp.gmail.com with ESMTPSA id
 e33-20020a05600c4ba100b003810c690ba2sm4741109wmp.3.2022.02.25.04.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 04:46:02 -0800 (PST)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Aleksandr Nogikh <nogikh@google.com>, Nick Hu <nickhu@andestech.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com
Subject: [PATCH -fixes v3 6/6] riscv: Fix kasan pud population
Date: Fri, 25 Feb 2022 13:39:53 +0100
Message-Id: <20220225123953.3251327-7-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220225123953.3251327-1-alexandre.ghiti@canonical.com>
References: <20220225123953.3251327-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_044605_446261_B3D2974A 
X-CRM114-Status: GOOD (  13.90  )
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

In sv48, the kasan inner regions are not aligned on PGDIR_SIZE and then
when we populate the kasan linear mapping region, we clear the kasan
vmalloc region which is in the same PGD.

Fix this by copying the content of the kasan early pud after allocating a
new PGD for the first time.

Fixes: e8a62cc26ddf ("riscv: Implement sv48 support")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/mm/kasan_init.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index 85e849318389..cd1a145257b7 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -113,8 +113,11 @@ static void __init kasan_populate_pud(pgd_t *pgd,
 		base_pud = pt_ops.get_pud_virt(pfn_to_phys(_pgd_pfn(*pgd)));
 	} else {
 		base_pud = (pud_t *)pgd_page_vaddr(*pgd);
-		if (base_pud == lm_alias(kasan_early_shadow_pud))
+		if (base_pud == lm_alias(kasan_early_shadow_pud)) {
 			base_pud = memblock_alloc(PTRS_PER_PUD * sizeof(pud_t), PAGE_SIZE);
+			memcpy(base_pud, (void *)kasan_early_shadow_pud,
+			       sizeof(pud_t) * PTRS_PER_PUD);
+		}
 	}
 
 	pudp = base_pud + pud_index(vaddr);
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
