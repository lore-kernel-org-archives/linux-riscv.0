Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C78C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Feb 2022 16:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fe02P35DbdCPUn9REHwiAthHOefUmjz9ur3EW1RZq/Q=; b=mRfq2cxdSn0luI
	AoyW81dWMbEXbcUv8i8pnWQ3+3V1tC+K/szGeKv3f+xkPL6isHrd3N5sOQGmvP9daVEFMPzvt1chd
	dfXf1oPWE97eGLk94WGMgzyYKiSWeRa2W/9QZeST4NN/tSTFbH5V9jZrGMqVFJRiQ2//n6c0K3wXz
	/QpHS159JSQbQn+delHUS+2u/BjCfxSJDPVHou198Rpwa2ZykaLrfcPRoQdR+goI/BUJv3Al63Mzb
	bUSMmwT4JwPi/gl1Ac28QuUyUvd9EpYlLudMgnt6ch+iOKfQbZeFAR57PyUppnxOGPtnmX9GfCqWl
	bRNbBv3M3GJlspC1yxLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMBLG-006ciR-2S; Mon, 21 Feb 2022 16:15:14 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMBLD-006chL-FQ
 for linux-riscv@lists.infradead.org; Mon, 21 Feb 2022 16:15:12 +0000
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 532BA3F203
 for <linux-riscv@lists.infradead.org>; Mon, 21 Feb 2022 16:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645460109;
 bh=5wR2inrb50SGryPV3ql5qm7RIRt9i7gNq/sby+Clcps=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=VN7Dhyuauh9RFyBI5ipyI8n0C4NYgAO5DDi3VIbLmt2nWXCkqkNF1wof+aCWixrsh
 /iQaN/+hGGWRSRs3qwaFNhXGD5H6kf3XAgNRxCmC3ywbMQprU5caJ3rKqdqDYJ15xt
 qcPVTUbbWI5yB9eHFRY+gjN+r9sJpc3AO4J+xyGKz8uo4jeYeAIs2RLjoTlG/QBVsa
 jE7JHGHtu99yCWUNDlFJ10biaXkmKRSMgfpz+ME/ZRimaAG3IzaE6SYimmLcHDNYsO
 tZSw9hQBd1aBo7LH8UPcCzH8sVdIGM/EBNNf462KqKilE8xpr5F81Xvoky59UHMN2P
 E2Xc8KWvic/7Q==
Received: by mail-wr1-f69.google.com with SMTP id
 e11-20020adf9bcb000000b001e316b01456so7588984wrc.21
 for <linux-riscv@lists.infradead.org>; Mon, 21 Feb 2022 08:15:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5wR2inrb50SGryPV3ql5qm7RIRt9i7gNq/sby+Clcps=;
 b=eZx4i1IIZNMR/JHT85GKCM/Cm6GVk3XigtbN0kRjJqfOQ3g2lcPIFLQrccoMWtPNyg
 fttNj8wjXSCHPLZE39qnw5pvIrFh9Kcvxy2AKs9N23cGwLkgfYk7ebhN+oGQIc0CyOTh
 TYSSCcaKNSe+RmZnMCGGx4qWvsDaNmxCKCDRXVliHd65Mt6SJwxPPNaA7+jKox0Sk8CD
 vV2r3kiYr9RaxcgCd+YxQQOJGUYquOB7A0EZkUblJLit5JCdRvlenSq+njZIM6d+2fti
 QNv6fNALizwQxwjygbWZhqeCXgFzuOhhE9Wnqh2PMo2C6Vl7zxI7iLnBDMGvaCTdkvpY
 9UKQ==
X-Gm-Message-State: AOAM531IynJjcDmDQeoba5PIQy4j2R5veTRMDHeoFh1aVGHVV4ybkJ1R
 DIZEv2aLnTz/I5J8kg0najuk/edQfWS4nriw5KHyS0hSJFD1KyXeoB7jfw0oLKXKpea4HAjMq9m
 /MhNDMrfekMwpUzY3OpON6jzyTX4jLckykLmxQ0mGV+On2Q==
X-Received: by 2002:adf:e952:0:b0:1e3:39ed:d990 with SMTP id
 m18-20020adfe952000000b001e339edd990mr16495587wrn.215.1645460109056; 
 Mon, 21 Feb 2022 08:15:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4/RK1fIWDS+henbbXZJgauSuqwElTcKvG20tpmepmsmnqy5mytufnWbPM6q+0YBF1+QKZTA==
X-Received: by 2002:adf:e952:0:b0:1e3:39ed:d990 with SMTP id
 m18-20020adfe952000000b001e339edd990mr16495579wrn.215.1645460108908; 
 Mon, 21 Feb 2022 08:15:08 -0800 (PST)
Received: from localhost.localdomain (lfbn-gre-1-195-1.w90-112.abo.wanadoo.fr.
 [90.112.158.1])
 by smtp.gmail.com with ESMTPSA id 3sm49978552wrz.86.2022.02.21.08.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 08:15:08 -0800 (PST)
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
Subject: [PATCH -fixes v2 2/4] riscv: Fix config KASAN && SPARSEMEM &&
 !SPARSE_VMEMMAP
Date: Mon, 21 Feb 2022 17:12:30 +0100
Message-Id: <20220221161232.2168364-3-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220221161232.2168364-1-alexandre.ghiti@canonical.com>
References: <20220221161232.2168364-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_081511_689298_26C217F6 
X-CRM114-Status: GOOD (  12.40  )
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

In order to get the pfn of a struct page* when sparsemem is enabled
without vmemmap, the mem_section structures need to be initialized which
happens in sparse_init.

But kasan_early_init calls pfn_to_page way before sparse_init is called,
which then tries to dereference a null mem_section pointer.

Fix this by removing the usage of this function in kasan_early_init.

Fixes: 8ad8b72721d0 ("riscv: Add KASAN support")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/mm/kasan_init.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index f61f7ca6fe0f..85e849318389 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -202,8 +202,7 @@ asmlinkage void __init kasan_early_init(void)
 
 	for (i = 0; i < PTRS_PER_PTE; ++i)
 		set_pte(kasan_early_shadow_pte + i,
-			mk_pte(virt_to_page(kasan_early_shadow_page),
-			       PAGE_KERNEL));
+			pfn_pte(virt_to_pfn(kasan_early_shadow_page), PAGE_KERNEL));
 
 	for (i = 0; i < PTRS_PER_PMD; ++i)
 		set_pmd(kasan_early_shadow_pmd + i,
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
