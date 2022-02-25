Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8C5C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Feb 2022 12:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/bqt88Ln4R5ptMQHD6woiwuMRThs+qc5EzrhD/6HuoA=; b=vazlvBlREMc1DG
	nwI+yPDQARKiDioCvLqMhxvw4/K5ABeCG99o6hzvGg6QsSyNLdTcKlQ6/S3Zu1jl8c2eqBMjjueY5
	Xqr/Eej9PGmrodIyjE0lWXITTvxu2yVA5YGHi10it8JWCNiVv/OQ14qvW5aqgZU3t91DQkCXyO8Mn
	PeItusWqSV58cTDH8SHP4iC1lrEYpOG2IHFu0YAXoH+54NwdemhZlwmKP720c3WGHUS6EsblxEzIF
	IiMBuxcHDkqlK1aeVGr/Pcyv2q9FrpOuV/pk+9XzoFCv3/VkGFlZ2ztH6ItlJgmLB7H7BW+SzrJTH
	DRrIP0QY64DRKE4Qddpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNZw9-004tJb-1B; Fri, 25 Feb 2022 12:43:05 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNZw5-004tHp-9H
 for linux-riscv@lists.infradead.org; Fri, 25 Feb 2022 12:43:03 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 12B073F1D9
 for <linux-riscv@lists.infradead.org>; Fri, 25 Feb 2022 12:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645792980;
 bh=cguSXJTSK/jUGjEgH9bI1vq5RLn1H9fQDOjhSSVs79w=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=pM0+kpRWb7dd7Tsz6ltx3TxX3tylo7zrS6pHacHj8ytb2VwP5mPPsCY/p0I+3/z5J
 39PHlTTSu50mUO0v9aOJ/lQc+/TPcz7gE4bLQdLEW3oyZqNTw9Nrj1A+EjgRY0a+Pw
 cfi01C3Bxv57tQsmKwjHhHa3v+zMSD74I+0aB9wtBsNgifhxqwR6X9aypde3GuEMhN
 3GxpytXM90YuqhKusGb5eujXEhbWlhS4A8eJ1qG/PmT/Cf22g14XZkqfC7yyMfl0DB
 qNy9bKeZV36OyyNDclIcVgVPoWk9VD5iWxdmtkTPjEnJPQ0KOHMObLUdAoDNdEdTuQ
 1GQxUvOgp6tfA==
Received: by mail-wm1-f69.google.com with SMTP id
 n31-20020a05600c3b9f00b003812242973aso1270414wms.4
 for <linux-riscv@lists.infradead.org>; Fri, 25 Feb 2022 04:43:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cguSXJTSK/jUGjEgH9bI1vq5RLn1H9fQDOjhSSVs79w=;
 b=AZKUP/6f6hT4aMN3KLjP6Xg5diuqhvUNNKS3A0jFcgUjLpn5VJyh6Q/zxNBdlyti7t
 UqRliawaI88eGKlYHAunGh8TdTFjNzCUd+kGKjX0Qb+bVmktnpLV/LBOELEhplzCyAAh
 Uv7VR6lr9R76X4WCl5IoTKjfx3J4+1Sg7m+gWl1FncwJ3vxZMvozJMS8Xz7tzEc0n1NZ
 sZdctVHHWmrCLTo0aHYfIAAwBOGHNjWotCjHrW1tN5/5y1WiXwWIPE4JeYrEjIkOceln
 6FzGJRIFavWhyKrqAuIzbTKqg2qJQx7H2y9SoqZCxAOWHJ5ug/2fUWdpYg5WCFUaj0Dn
 R3Lw==
X-Gm-Message-State: AOAM532jikE0M06YPYiGa/Jvrc8wGmatLMohMyNkNjJU+virTT1ebdnB
 AibM+kOYcPhDCe9Lhpx4RDsRMo7Qs5JGAujMwos1eb+yKNM6hXh0UFmV273u8ThEmMzykcyLB9m
 +JvG7NgBWUcx+jjjwRBIQ9iCIi9H3nCpE+bnzlAoN6ZeXug==
X-Received: by 2002:a05:600c:3483:b0:380:edaf:d479 with SMTP id
 a3-20020a05600c348300b00380edafd479mr2577991wmq.20.1645792979759; 
 Fri, 25 Feb 2022 04:42:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcRpOmBxAvnb9C8VWTL3Q+pIs+JnIpbWsXck+OsKjusYuwlpFrwhhbzMfm7RYXdb8ihagxtg==
X-Received: by 2002:a05:600c:3483:b0:380:edaf:d479 with SMTP id
 a3-20020a05600c348300b00380edafd479mr2577978wmq.20.1645792979554; 
 Fri, 25 Feb 2022 04:42:59 -0800 (PST)
Received: from localhost.localdomain (lfbn-gre-1-195-1.w90-112.abo.wanadoo.fr.
 [90.112.158.1]) by smtp.gmail.com with ESMTPSA id
 g7-20020a5d5407000000b001e2628b6490sm2248342wrv.17.2022.02.25.04.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 04:42:59 -0800 (PST)
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
Subject: [PATCH -fixes v3 3/6] riscv: Fix DEBUG_VIRTUAL false warnings
Date: Fri, 25 Feb 2022 13:39:50 +0100
Message-Id: <20220225123953.3251327-4-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220225123953.3251327-1-alexandre.ghiti@canonical.com>
References: <20220225123953.3251327-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_044301_482349_7C9A1FCF 
X-CRM114-Status: GOOD (  12.29  )
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

KERN_VIRT_SIZE used to encompass the kernel mapping before it was
redefined when moving the kasan mapping next to the kernel mapping to only
match the maximum amount of physical memory.

Then, kernel mapping addresses that go through __virt_to_phys are now
declared as wrong which is not true, one can use __virt_to_phys on such
addresses.

Fix this by redefining the condition that matches wrong addresses.

Fixes: f7ae02333d13 ("riscv: Move KASAN mapping next to the kernel mapping")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/mm/physaddr.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/riscv/mm/physaddr.c b/arch/riscv/mm/physaddr.c
index e7fd0c253c7b..19cf25a74ee2 100644
--- a/arch/riscv/mm/physaddr.c
+++ b/arch/riscv/mm/physaddr.c
@@ -8,12 +8,10 @@
 
 phys_addr_t __virt_to_phys(unsigned long x)
 {
-	phys_addr_t y = x - PAGE_OFFSET;
-
 	/*
 	 * Boundary checking aginst the kernel linear mapping space.
 	 */
-	WARN(y >= KERN_VIRT_SIZE,
+	WARN(!is_linear_mapping(x) && !is_kernel_mapping(x),
 	     "virt_to_phys used for non-linear address: %pK (%pS)\n",
 	     (void *)x, (void *)x);
 
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
