Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D6EC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Feb 2022 16:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/bqt88Ln4R5ptMQHD6woiwuMRThs+qc5EzrhD/6HuoA=; b=aZwcg3Zpgey7LZ
	HWlBoq4/Wlcx4ermnQGbCRmWri87KTmP3snaRIRn9wPhkiOaVgFXCQZ0RMpjyGpmoXkfHwjw5njny
	tOmhNGZ+QNAdynWIoJcBPDuFu2pyBPv/Cq5y7IVXAYoLlJSTnDAE87Wp2ZcpXVjBkpNAVdGjlsq/h
	dS7I3HfIPcfqDTGxqVaSLsu7hTj4jTccbxOiBafjtveAnP6eqzk3bYRri4W8EvnuGU6FDqtvynnj/
	gceUxpnkwoPq2Ii3hLzxp3UBSDJsYYQw8czijQy0j3mhAnXQWzUNubClrlErw9ZMxGWsBhwLShH12
	GLIHjEwWNlAJHWTPa0mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMBMG-006d5C-51; Mon, 21 Feb 2022 16:16:16 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMBMB-006d2O-RR
 for linux-riscv@lists.infradead.org; Mon, 21 Feb 2022 16:16:13 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9540640049
 for <linux-riscv@lists.infradead.org>; Mon, 21 Feb 2022 16:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645460170;
 bh=cguSXJTSK/jUGjEgH9bI1vq5RLn1H9fQDOjhSSVs79w=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=a4EFzjDZUur7R7YNccmSMOVcwfl4gTQIls+xPg+ySJ51J5QrxGwvagPfe4kbyGx5I
 NN6aPlKjb+yHetwTWJXbAVk5kOTvfXBc45bq1wbyw790NZ6sWRlRuAmPGb6sk6h1NI
 43noR0Nmq1rYj8hIwl/uAKicu28qE/G4EXrHA1y0kT36VdzTohP7XmUwgQlSv+yZiQ
 /1V4PBj/TkKasACCiYEjR+TqHJd3hEZR3J0xli7M2f3lLulJbOMqwXNy6SqSfj5YkC
 NhpKyw5BtZ/6XyUdhG3jtdjLWrHgH0t9snVJLeGdwwI9zFkoIT8ZJGHelxXGfgw9yO
 RU5Zeykrqc8Pg==
Received: by mail-wm1-f72.google.com with SMTP id
 j39-20020a05600c1c2700b0037becd18addso4580068wms.4
 for <linux-riscv@lists.infradead.org>; Mon, 21 Feb 2022 08:16:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cguSXJTSK/jUGjEgH9bI1vq5RLn1H9fQDOjhSSVs79w=;
 b=p2hanRu2UjjJn2EheHVWX8GMXlP7C2kf7Rf3uqGophPMkoL7V1Uq0eX5AiyMKnBovk
 XcaWB8patDPUZA9AbbG/D1YnCSW5NfUDbZW4ON/7R26frgG+tFv0yr4vFeF+fyqAlRgY
 cIkCYyfpRQ+UuwfQCNGOPyt2jv0rGqhCKVp+2gZJu6YJFN5zo71WKI71cteI2eaGUATj
 rAkcshKZVqjNOHJgn5POQ5lMA4VG2utBVV9rYrSAFo//sZ5tk09HZGvhH3v5tG1oOv5c
 BmFjLR2TvEAiaHvAGTHCD1q9dTa17ph2CIrJoUEpFhgTlOTP3axTSYMV+mxJtsZWmKtS
 pUbg==
X-Gm-Message-State: AOAM532mFVhyDhtAfmLKNOeXbWPeyk6Yw7lO8q3OE6Uj8fj4TDAPssZn
 zMxBP1I3ID0K8oTT6DgBm8qTWnIzKdV/Mah7R3V/p3z0rCCB5zf9oyaGL+9q1c7Z4+0cEvk61CR
 cz4KVfkDaoKfdUe1lVMhNU9WK1qijn6jemgekbecr/8SSNQ==
X-Received: by 2002:adf:f14e:0:b0:1e4:a64c:c1f8 with SMTP id
 y14-20020adff14e000000b001e4a64cc1f8mr16542838wro.512.1645460170158; 
 Mon, 21 Feb 2022 08:16:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYgUE7MZQmI+ZQcdzJiIN1T9Ug6obXjiEHel6BWLTa8oJLZK8xZY9nQ5A4HYo6se/kNAsxNA==
X-Received: by 2002:adf:f14e:0:b0:1e4:a64c:c1f8 with SMTP id
 y14-20020adff14e000000b001e4a64cc1f8mr16542818wro.512.1645460169981; 
 Mon, 21 Feb 2022 08:16:09 -0800 (PST)
Received: from localhost.localdomain (lfbn-gre-1-195-1.w90-112.abo.wanadoo.fr.
 [90.112.158.1])
 by smtp.gmail.com with ESMTPSA id r2sm10098731wmq.24.2022.02.21.08.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 08:16:09 -0800 (PST)
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
Subject: [PATCH -fixes v2 3/4] riscv: Fix DEBUG_VIRTUAL false warnings
Date: Mon, 21 Feb 2022 17:12:31 +0100
Message-Id: <20220221161232.2168364-4-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220221161232.2168364-1-alexandre.ghiti@canonical.com>
References: <20220221161232.2168364-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_081612_070610_379FC7C3 
X-CRM114-Status: GOOD (  12.21  )
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
