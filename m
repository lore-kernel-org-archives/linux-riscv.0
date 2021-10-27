Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB55C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 05:00:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8258B610A0
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 05:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8258B610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kC26ojYNgGPDsKFKfXmAVoaIFqXqkJU0WcDUs+9/0+w=; b=am23Th/dHls33v
	YuI7ojxeVLhZrASitO2z7N3IrPtO4qoOHc1RU0Svs0Jiq2dd7OZ5yz55AiYyw+C/pLNKkGTTZio5V
	iVaI5uVFzLjWROkr8Fd04jyfFOxXKY/bwqcHoPyS6gtdmzQ1GM0u5HJ3wjgQAblLSkL9T8PVkw8Ek
	Zk6/MrBpaYXVKm640zJZQsdzZZ75lE2nuAWNXBH1R6qWgfzNVZF28A9kA6xoDDYpPi9s1CGxaEp2H
	g8gfirKSLxUuOltvUT1vdoLhPv120+iRh2qpos29lLER3OxJAT/2deBted+YrX1vAlnYe45IheDJz
	J0daGlC55WAWtgSqLoDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfb2Y-003s07-1H; Wed, 27 Oct 2021 04:59:54 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfb2U-003rz0-6d
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 04:59:52 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0663D3FFFB
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 04:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1635310789;
 bh=LTVtpyKftoE0IH0g/BXOTfVkolo16F3nizMPYgvUIg8=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=c1yrvb6RM5aoDZ7D5pEMLP2ieBb2cD0sHvRMkAiXJGIzQAm3xDgdaNUAvgyNsKSEm
 eYo9XDtPGsV+g8xB5RFyCkYkuOgAOVvPyPJM+Y+hKl3O1Tx2oa982/qwvoReEtd4pR
 sPBbxycUgUHN9AGe1H5vuVTbrk735Q1ekWwRTA/0TJdMv3kOKF4V0vQR3J5wbf3IAq
 Vyhkugrijtk1LRwF+lSut6SleKQrFiSC4eFtDVMZhveDfakGz1u7MaacxIIYlps0Vu
 h8ETJLhKVnFr2+z1D/R3XWKvZL7oR18uegrFNYETIySQlG6YZLx0gJB/1fTGmUuar8
 kHUwLqV761OsQ==
Received: by mail-wm1-f70.google.com with SMTP id
 u14-20020a05600c19ce00b0030d8549d49aso1360309wmq.0
 for <linux-riscv@lists.infradead.org>; Tue, 26 Oct 2021 21:59:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LTVtpyKftoE0IH0g/BXOTfVkolo16F3nizMPYgvUIg8=;
 b=BuwsyZJNHsn/xGvBh4EUmRawBnDZBvyHM7uNrJpNCuHmIUYFznfcOEXQlQdU2BwUSs
 46xKFlPHAXTkInSC78OgBiglgCmuk1MFLYz3SrqiSOQOU5baqiSeWH/SuzYQlMM9S7iN
 d3KQk4Y4KYX4OmUlbx5MpSRFWxtrhT9FyPg3rd13/k8qMpPbhgkPrILt4/sM/MQ/XbN1
 Sc7lBE637UL9BQ8KF+4i1fei9afifjgPiPPEE6r2MgZUtyAoiiBHyzmfOtSXa4hMKrfE
 /cdEekwQgbeKkfC6jnuF+/KMyQvQZTbORVcEyhBKD676B9ICUgltMaJUtlErhfMXdnfc
 +G8Q==
X-Gm-Message-State: AOAM531b+zAVy655abnNBJBeZOdVsidg7n1zs0iTbkP6J9lTxjitIiJI
 v9vYkqmJQ7uBwm/UUczBEW5NSBD1k4k3PcK9Er0HyshTAPUu7Xj6WU6tWVrQmUs4cnmAlzbFpsO
 xl4cPvR4iVVQBuola1jJO0nVNwQsrmi4LWdIUqG73d1Ve7w==
X-Received: by 2002:a7b:ce93:: with SMTP id q19mr3460073wmj.98.1635310788755; 
 Tue, 26 Oct 2021 21:59:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8O7sqkwoLrKnw5Xt6p5dLSckvr1ImPBad0sPPzwGeWPQZemV8X1dl0PrG0R5bBdfsawaeAA==
X-Received: by 2002:a7b:ce93:: with SMTP id q19mr3460062wmj.98.1635310788623; 
 Tue, 26 Oct 2021 21:59:48 -0700 (PDT)
Received: from alex.home (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr. [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id c15sm20432877wrs.19.2021.10.26.21.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 21:59:48 -0700 (PDT)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH 2/2] riscv: Fix CONFIG_KASAN_STACK build
Date: Wed, 27 Oct 2021 06:58:43 +0200
Message-Id: <20211027045843.1770770-2-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211027045843.1770770-1-alexandre.ghiti@canonical.com>
References: <20211027045843.1770770-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_215950_400015_4DC37B3C 
X-CRM114-Status: GOOD (  13.11  )
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

Now that CONFIG_KASAN_SHADOW_OFFSET is correctly defined, the boot
hung while populating the shadow memory right after the call to
kasan_populate_early_shadow: when calling this function, all the shadow
memory is already populated with kasan_early_shadow_pte which has
PAGE_KERNEL protection.

kasan_populate_early_shadow write-protects the mapping of the range
of addresses passed in argument in zero_pte_populate, which actually
write-protects all the shadow memory mapping since
kasan_early_shadow_pte is used for all the shadow memory at this point.
And then when using memblock API to populate the shadow memory, the first
write access to the kernel stack triggers a trap.

We already manually populate all the shadow memory in kasan_early_init
and we write-protect kasan_early_shadow_pte at the end of kasan_init
which makes the call to kasan_populate_early_shadow superfluous so
we can remove it.

Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/mm/kasan_init.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index 8175e98b9073..8df937902630 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -175,13 +175,6 @@ void __init kasan_init(void)
 	phys_addr_t p_start, p_end;
 	u64 i;
 
-	/*
-	 * Populate all kernel virtual address space with kasan_early_shadow_page
-	 * except for the linear mapping and the modules/kernel/BPF mapping.
-	 */
-	kasan_populate_early_shadow((void *)KASAN_SHADOW_START,
-				    (void *)kasan_mem_to_shadow((void *)
-								VMEMMAP_END));
 	if (IS_ENABLED(CONFIG_KASAN_VMALLOC))
 		kasan_shallow_populate(
 			(void *)kasan_mem_to_shadow((void *)VMALLOC_START),
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
