Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BABBCD98F2
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Jun 2026 14:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6OLgomLpWGY6BkF14Cx/B2geBGzUZVE1naJsGRrFNT8=; b=RHBSaUTZWu8r1y
	NFJaWfp+gpUOm+c3wQiyMvJpOUaF6izpHM8fLMSjRtSBZU8UhXs1toeeu80SVZMtej6c6gJ+fj8ZW
	8ZEEjEMJ0tcvXDqrTpwr0mdZz/e/iqkQ3pikzJGPi97T9uKsj4Xvpa4dgxVyFD4e9577vd1K0/598
	neZqBJ/QWpNCx/hybFovB2IPE8kHS5okC+tQsSdgne7JDOk3W/28ljwWhWyyHpQGsU0060A34Hlgo
	Ok66G9cebF+JOmyooBvdQlBmJNKeELemgUAa9dHtPSBOdCtnXKRqS+ya3SwibzeLGaBLkbxg8asj2
	MwmQNsS8VQhntUifpKLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbJeD-000000040k8-49C3;
	Sun, 21 Jun 2026 14:59:46 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbJeC-000000040jU-1i2w
	for linux-riscv@lists.infradead.org;
	Sun, 21 Jun 2026 14:59:45 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-37c867bd3e0so1663937a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 21 Jun 2026 07:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782053983; x=1782658783; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yznC/BMabUJfqN5QcB0Hl6eIfBsGUQKn5o2NhCWNsNM=;
        b=BxrvNeSfqW+jgkclevHw+gvkdw+T8uEuVc2iyqcHUNpGHCpA/rMG9WREK8X6Exkb7Z
         9/xNV5EOiwB4Oqf9rqenbQkX3kmeFRRIYGyarpJwGZEOPImJhgg7YtnfyCN7FVToxJtb
         9q2EoJYKoQvmNbOeV3U8LQH9S/Cm6fL/kg9l0pIGFIN6xVelNs12GizN/EhsYc5p7sz7
         Ywnaz/X+4r+orjsOVYdDpvUqbTHTubzKuADuheVJRnEiRGcitu1rZ6cB03pMlpVamX7p
         ZgrJ4+SHAvS7SvE+00l2ykxsxMLY6Gkt+FAuutBwHIK9XOU+uQCozJj3ULa7cvULtxq3
         70vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782053983; x=1782658783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yznC/BMabUJfqN5QcB0Hl6eIfBsGUQKn5o2NhCWNsNM=;
        b=nSQEjlQd1si6oPZ/jwWdrvDZ7QOaDQs/QlxIm4vUF+Al8phy6LfgYiW3v+o+AafH9i
         1wDGsSqGhYKk+K3xReLHmxHgMHSFva0camGVGFtt/veTZXd6nhD6Zfx0ZcfAew8zZIrW
         l1lS4VFAZwh/qHxJBVte7MMmHp7T3+16apMeL65rytGYBiRsY0slqoEkEAgXYvx27w6d
         1RQB7KBBCEArvinDUmyl7l18cMwsCFP74idVn65bU4KKnHCsa1JO72oG7T0J5S+h+sMm
         oB3OVE85MTTkUNmHPSEiTq3KzXS8p8LGH1FnSkvWQtUaCMR9KfhVKf301XiUcI8X+j3x
         kuKg==
X-Forwarded-Encrypted: i=1; AHgh+RqcJWgFEKxNLyaJB0MHix+3k2UHOHT4himW79YfMOVk2C/sfrH4gsTwpfSsAmpzNnB+xkYPpFwNMgC68g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRLoCb1+qj/3sO4K5Up/CxIaDxHoZrY5ASzsr3xqh0IaB99NEU
	Gd4UMcnmos/cj7/2MQHEnUuSBwN+GQPfKYc+QfY38dxy9RczDrE7UV4b
X-Gm-Gg: AfdE7cmVpdE4s+ntdJBYrjeilDceXGX2nGkgRKf5vEM1g6LxUHCEVyJ9qBGZlRnTfyR
	C/4e9XqxgvFHeOOEbQxvE9Q+95Lc5BNIGyuhmDIUJMCb+USMeTYUGwLaBkUOiPi0998eHXE+sT9
	OJQ15/lwe22BRRE4BHlJJshKmyBsOWAq9Gh29pvN5zdbUFu2hq1fNwIMovaWRQOwGim5ufSN0pd
	pdCKa3ZwFWLoV/icU4tYUsTUBzgblJqsQKd3f8tHFN+gWEiepMr1YaKSCb1QMTyJ4hdfeRP4x/B
	G7VJiWVom1sf5cLsZ89bLx2zexBcOZHjlDWMHBQfjWi8GgzdbUM9tjuf3aN5TSKe43f3To+Cqy3
	5sWzLgmiJzj6mPoiPcO+vSelx1ujn7uqhlWNURAO0pN8ggSKMh/9LaiiQFgcv8rrHlMXh75DhFj
	0+XZP31vk=
X-Received: by 2002:a17:90b:274d:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-37d15e8b6bcmr12695801a91.19.1782053983448;
        Sun, 21 Jun 2026 07:59:43 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f225870sm4544896a91.8.2026.06.21.07.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 07:59:42 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Sang-Heon Jeon <ekffu200098@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 3/6] riscv: remove unreachable invalid range check in create_linear_mapping_page_table()
Date: Sun, 21 Jun 2026 23:59:13 +0900
Message-ID: <20260621145919.1453-4-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260621145919.1453-1-ekffu200098@gmail.com>
References: <20260621145919.1453-1-ekffu200098@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_075944_448408_9331B13B 
X-CRM114-Status: UNSURE (   9.07  )
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

create_linear_mapping_page_table() iterates memblock regions with
for_each_mem_range() and breaks the loop when start >= end.
for_each_mem_range() never returns an invalid range, so start < end always.

Therefore the start >= end check is unreachable, so remove it.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 arch/riscv/mm/init.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 5b1b3c88b4d1..eb93c2ac05a6 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1229,8 +1229,6 @@ static void __init create_linear_mapping_page_table(void)
 
 	/* Map all memory banks in the linear mapping */
 	for_each_mem_range(i, &start, &end) {
-		if (start >= end)
-			break;
 		if (start <= __pa(PAGE_OFFSET) &&
 		    __pa(PAGE_OFFSET) < end)
 			start = __pa(PAGE_OFFSET);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
