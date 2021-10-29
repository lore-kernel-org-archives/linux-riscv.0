Return-Path: <SRS0=3Oe1=PR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8AE9C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 05:00:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C18B610E8
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 05:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C18B610E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OE/z2Swv9WVrhMxNifPSELLNvmF2kDXduyos3BtIQKQ=; b=j8JA5UGoztFCdr
	Ru5PgXGzqCbtlQFs0wzQSzzNtBoVSk6U3CD6vC6Iqa2U1N4U4lZZ48e5HooSenoIX8GN+5e3m5nN/
	hgPFhZrePDMcw13A8rmG+2R9b930De13z141ABZRznprwUuw6LI9DfNPgOP0XW6WGDqFgQPUiehhB
	LD84e1VlQWR/zn0JUZjVZTLyIJUM7ZL+/Sf66Ix2Pxz1MrROEZAmJKjmmF0TSMVOGpKkvoDkDGqLM
	1bT6qHG3vHoTp6LjZ54QVGuooI5A/Iz9S3P1iYF1Uk1DEfl9Kf6ZNbi2EsPce+O6uuw5xoYMLeeTE
	BiP2FE6DAjQdzRd3oiFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgK0S-009pYW-D6; Fri, 29 Oct 2021 05:00:44 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgK0P-009pX9-AW
 for linux-riscv@lists.infradead.org; Fri, 29 Oct 2021 05:00:43 +0000
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6E0E33F19B
 for <linux-riscv@lists.infradead.org>; Fri, 29 Oct 2021 05:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1635483633;
 bh=fVrxR6rs0QgNgX/0Rgh0R5Yk7RWIkh0KqpodnVxs5fE=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=dYEoaswMiqXEsOsoiCYi5EMlULbWzI/D4i/+0lrsof8s0G8IhPnwxrvA//REKgHa8
 qGF1FWv/oab8LihgxthnvWu+DQJi4BW8Mi93//CfZikWVfE2iVEZgjC181fl0s75jO
 I3P1xjlI9VrNe7i286z0Y5BfHEEKrX8IHyP38rmQhoU+y9mVA9j4HOFOJLxON2rvrj
 5gyQs1Xr0J3oH25XuwjsfjkPW7eGuAArDyQgi8DlodEc4hSjIR7gJOR0L2dOHml6C5
 X3DEX6yCiaYqpLlIESmNathapi8wF86gzxMxuMX98XmfPAotrdwe8Wcdl0e7pq9J82
 t/KgjXzTjbn7g==
Received: by mail-wr1-f69.google.com with SMTP id
 a15-20020a056000188f00b00161068d8461so2983694wri.11
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 22:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fVrxR6rs0QgNgX/0Rgh0R5Yk7RWIkh0KqpodnVxs5fE=;
 b=sm0S8whBoYZF/DiKoEcg2s4MqxTQm6bd5Bnjaqhajm6fXRUtUb+xqF/zhmvVmMbOak
 V0z/fGfOiu+pcsDv/EAZMs9VxbWWccFDkyK6W2JYRtXIib07zjYtTvZ0uhjn+ZziUwcI
 qTuksP5chyIin1Dki0iDxU0UGcBlKJNDc2xTP5hMqLS7dRIkHlFROKRTUHCbRbacqgHF
 zeE4goW4ayHOimY1NjN+5m8E+JdLSgHvX+qsZjeWiXPdjSWKyKT11eeWmGgR0VE5Ddln
 00E+GeN2e91CPMbEN2PzKbsuWydi3ooRSbDbQTpS9sa1+WWwRO/hnxrAplFSApr6g1Nc
 vxdw==
X-Gm-Message-State: AOAM532MnSALgnVlRWFdEISWRCXWL1pr9aLyomORszfta48GDiTwqTli
 KzFX9EdUfbmXk5g+CpijtoorMdvABlLAIUG67ez2Mr9vNE6qMSJ1R6FTo4n7DM2Zn7FmuGTImHE
 ub6jjjGT5PhETZZF/Atrr4EAQVSAVffhlKlVDcTWHJj5p9w==
X-Received: by 2002:a05:6000:186a:: with SMTP id
 d10mr11818534wri.279.1635483631174; 
 Thu, 28 Oct 2021 22:00:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVcMpOtY2oarkcGRWdba9hc9bb3yVUoAEIjsLxk+hc+TjKojuTqQUEEMBKdf1WYqhz7f/cXw==
X-Received: by 2002:a05:6000:186a:: with SMTP id
 d10mr11818509wri.279.1635483630964; 
 Thu, 28 Oct 2021 22:00:30 -0700 (PDT)
Received: from localhost.localdomain (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr.
 [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id d9sm712512wre.52.2021.10.28.22.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 22:00:30 -0700 (PDT)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH v2 1/2] riscv: Do not re-populate shadow memory with
 kasan_populate_early_shadow
Date: Fri, 29 Oct 2021 06:59:26 +0200
Message-Id: <20211029045927.72933-2-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211029045927.72933-1-alexandre.ghiti@canonical.com>
References: <20211029045927.72933-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_220041_517689_5B53E3D4 
X-CRM114-Status: GOOD (  13.84  )
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

When calling this function, all the shadow memory is already populated
with kasan_early_shadow_pte which has PAGE_KERNEL protection.
kasan_populate_early_shadow write-protects the mapping of the range
of addresses passed in argument in zero_pte_populate, which actually
write-protects all the shadow memory mapping since kasan_early_shadow_pte
is used for all the shadow memory at this point. And then when using
memblock API to populate the shadow memory, the first write access to the
kernel stack triggers a trap. This becomes visible with the next commit
that contains a fix for asan-stack.

We already manually populate all the shadow memory in kasan_early_init
and we write-protect kasan_early_shadow_pte at the end of kasan_init
which makes the calls to kasan_populate_early_shadow superfluous so
we can remove them.

Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/mm/kasan_init.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index d7189c8714a9..89a8376ce44e 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -172,21 +172,10 @@ void __init kasan_init(void)
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
 			(void *)kasan_mem_to_shadow((void *)VMALLOC_END));
-	else
-		kasan_populate_early_shadow(
-			(void *)kasan_mem_to_shadow((void *)VMALLOC_START),
-			(void *)kasan_mem_to_shadow((void *)VMALLOC_END));
 
 	/* Populate the linear mapping */
 	for_each_mem_range(i, &p_start, &p_end) {
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
