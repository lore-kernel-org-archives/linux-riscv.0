Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E304DC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Feb 2022 12:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fe02P35DbdCPUn9REHwiAthHOefUmjz9ur3EW1RZq/Q=; b=XNV1Ad3JXs0kdP
	vk6UpS21Lao+OuIISqnrNGEUK6d2pIzfzDNccb3AShyTLcnBmwy9pkt8RIyeKYnKzpBCmeQy3Q21W
	/7gIU2V8oOmkBGKg/k48fg7CBFBBtbnU+DUIsYgERHGhRqnW92hohPY1AfKsNso44vznG4nYKsVaZ
	WE+hZCE74voAWAHAplotFz9VH7vMEqAVmgyMgbVyviO3squbAF9hwyftcJLztMRq7RjS9yx4xTvhE
	bBUHMpP2h9Z9ovVcFhkChplzBmy/FyJQC1UBf3CPtgBdKjQ8bfkuQTcynDhF24LeFHtPtdXju8nMQ
	nufgU161jjMEJQ9Cwqcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNZvA-004stN-MV; Fri, 25 Feb 2022 12:42:04 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNZv7-004srQ-Qb
 for linux-riscv@lists.infradead.org; Fri, 25 Feb 2022 12:42:03 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 218023FCA4
 for <linux-riscv@lists.infradead.org>; Fri, 25 Feb 2022 12:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645792920;
 bh=5wR2inrb50SGryPV3ql5qm7RIRt9i7gNq/sby+Clcps=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=ohKOTkf/fqpEZpKXnJlcNghWHkOJjmBhKZXyfhI8d9UXhu//q0aej3SkQM6rjyfqg
 huLXTRqdxtFwmeskYx+o5yA0GgwHVtT3NfUGNbvYKv8y3II35xZxVZ8JGm8l4FQ2Au
 osQQkfnFc3+o460C3YN80y2//11ZGmZ74I/Q67yZri+KJ9rbZESQrQFkibpRmTT61p
 IN1UkkCLVEcSWEnNH9xD7HT8YvqNRYHAjbmdwWcDQwCQYITLKv2+3XxYFiVY+CRFdB
 ZZtvKkusKlaqGUnNQtugbKg2BjQyrmAK4JfZcxQxLUvhzLhdK1MRgObd0LimWfl+7b
 9BA/AcFqztAJA==
Received: by mail-wm1-f70.google.com with SMTP id
 m21-20020a7bcf35000000b00380e364b5d2so1276029wmg.2
 for <linux-riscv@lists.infradead.org>; Fri, 25 Feb 2022 04:42:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5wR2inrb50SGryPV3ql5qm7RIRt9i7gNq/sby+Clcps=;
 b=v6oHtQV/CoZ9KdUIhLVIs1C2jN2jNvYLhS3lNGiW5CMguHWLDf9lT+VdP4zdekjO2p
 H+tFXIUbS3Mhjhg4l8JTbuJU9h3CkRBgeRd4Bhp7vV6AuY8YAfHfzpbcNSx6iHGqSqmL
 RGBjb6IhooqwTR2cErvsZwcgZHo+r2yt1+7YNFt3brvVqneGapb45Eq0C90LdoBDCweo
 15IQyaZ8X2TcPeNF+Zkg/a3MjymRdiYnfn6pNfNzolqAoUV+MVawVlYpNKoj/KdnLu07
 n2C8EMeM9EiXyRLoD+08/EdVrjTimeoctcknYaL/YsgEzonTdEvcQ2u9oZZS+GIJFmUZ
 vwqg==
X-Gm-Message-State: AOAM532DlNZMg26ViJliKkgac8gRf96/y60DXyyse0oP10uXLBcRMIiO
 /4FaSymGl2m9Z2Q0UqKzc+xYbwxSAl1dxF3TM7Hs/EXSYUfYukZRE1nkUp26rpB7E49MdZ/ez8H
 WC0KEzn9aYWPvfBWfM62uzl+ELbr4r3BpOT/pVTxpq59+Ug==
X-Received: by 2002:adf:80c2:0:b0:1e3:3b9e:ab6d with SMTP id
 60-20020adf80c2000000b001e33b9eab6dmr6234423wrl.253.1645792918687; 
 Fri, 25 Feb 2022 04:41:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx83iJoyNT5BQRvq3mMRYqD931oXS9YXkhhT249/SBb5EDJpj7lWu/6JE6+IOyTRBie/j9F6Q==
X-Received: by 2002:adf:80c2:0:b0:1e3:3b9e:ab6d with SMTP id
 60-20020adf80c2000000b001e33b9eab6dmr6234407wrl.253.1645792918458; 
 Fri, 25 Feb 2022 04:41:58 -0800 (PST)
Received: from localhost.localdomain (lfbn-gre-1-195-1.w90-112.abo.wanadoo.fr.
 [90.112.158.1]) by smtp.gmail.com with ESMTPSA id
 p18-20020adfba92000000b001e4ae791663sm2234860wrg.62.2022.02.25.04.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 04:41:58 -0800 (PST)
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
Subject: [PATCH -fixes v3 2/6] riscv: Fix config KASAN && SPARSEMEM &&
 !SPARSE_VMEMMAP
Date: Fri, 25 Feb 2022 13:39:49 +0100
Message-Id: <20220225123953.3251327-3-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220225123953.3251327-1-alexandre.ghiti@canonical.com>
References: <20220225123953.3251327-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_044202_011810_23110485 
X-CRM114-Status: GOOD (  12.37  )
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
