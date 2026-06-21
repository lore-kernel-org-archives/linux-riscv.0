Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A808FCD98F0
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Jun 2026 15:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fcVvNmtfJ5GYjcFPOMFLGP8GskrjE62Ht9MXtKs82Cs=; b=2bUQ9sKCHoIBnX
	OfZpnhTQlwPwIg2CDx0k8Dc4vb3OwS1PQ3pmxa4LJ2gK6C5OZv89O4aH2Rmmsxo89KSAD+KCNj8/v
	GdwNCdKDKo/MspJ6UAzhzlPD7zT/78aQ7Ki8LJ48YkPI5tPRDC3CKblVHIfbKQmHMVIp8czYvQIqo
	aBKFqRQkUvKaeyVRv0oBrdcTdf2Xv3CZK4g+eUy9TkfE46VixJYmwn98LRm9mvwkUqqyGGqE9Z4+u
	aLWLa8eWM2tP7XsPZU8YDfxy1NnRjHKRd5lr3xWxYfizin/RR6qgAEQbVx2sJA7elgWjmHX4TOBDp
	R6WHCii6EmFDhef4jJbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbJeK-000000040mc-0Rfy;
	Sun, 21 Jun 2026 14:59:52 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbJeI-000000040li-0hAO
	for linux-riscv@lists.infradead.org;
	Sun, 21 Jun 2026 14:59:51 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-37cae9b7536so2044335a91.3
        for <linux-riscv@lists.infradead.org>; Sun, 21 Jun 2026 07:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782053989; x=1782658789; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXp0KcjOQMbI7uQElmRG429BAxV9Hu53X5KVxOfmKEM=;
        b=SywdAjiP28Rm4tF8cGK+B8muPH4KjQIudyxGr7R2gmkGJXoBIXJKgreqBr7YDrg3AT
         B0ZD+6VMr7tsmeRRXmDGIycPwPVWprYU22fspzVNLmwB2vHbIqsxsYTbhfizJLBXp8tb
         pt1TWxe/6hVz4kxoCWBvgtk2SBFY4wrIK4y9VXP5NPQzbD/UwEuPtWznOa3NuuyMaaHq
         ABTa0RSfDgIG+yLg5IR9D3MV3TcPt0fVByt8+kFjcOAfLPjIkeshyffu4TohhJnuMuV/
         q+Wlr0Dy7IvNYT1XPh3JtfUDf7cliFNZKx6+7bbjJYnsa7X7SJGBUmvMiA2s8pC46Yo7
         WgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782053989; x=1782658789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LXp0KcjOQMbI7uQElmRG429BAxV9Hu53X5KVxOfmKEM=;
        b=HCNkPbEjUd9DZifaDqLSmXeLmoOkghE0eFjWnF0iWZS4wQuSDfXgWbNZsgPbWn3tdd
         i2ROg15mYO1p+Qz9MQALn0mWVIpCSCnizQGZnLmjt0lNM02D4YosZApq3TTHHLe7fvju
         w7qOJVJslelJtruavroyuCHRm4GcS125OGcdfgCy1hgZ08cOvJZjBjVJmnFKYvUstaXh
         zCAw3wMNdOTQEhfDQtVlkqJDCqG3Dm7KF+abTf2Qt5GkcEANiuPCUbXyOUC/gyzRi2BU
         b/HHymo/4COAC5SrYG1K5ucnHjf+mV+2K32Z3IxVOxJCvrJqn9EsGwDm+3xso2W75uRt
         AzdA==
X-Forwarded-Encrypted: i=1; AHgh+RrYtPn1YBHm0yR5pdnx0FTsvux8McuSsEmiK7pVDEXShrAoEnfRySvdclHl8Oev0w2FKCVi/mo4r8rhww==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJgUkNtfSJhTihtBXC/gJ4aFtlg3j/Ryq0BbrfPO2j44aCW9HN
	V+XG9LbsAa+llYsFsX7WQQgrlhkau63mH9lmrVrrglhIrh40vRsRMbtM
X-Gm-Gg: AfdE7cnuyQZWvhQFVAA57Qy4R1Pc1Ga7KhMhSo7UPDByJBiLeNicjOPcZk8xM2+52gf
	NJ1k3YPzxgVBetJZ8CdLaOydbsJbVhGJN5KneGYpizb3n3lfQWQdceDzAf/w+LECCOFvnehjG03
	8YXthmFfPBXWNC9O0cUXygS3w0mc/m6WRlF1E3u9DEw+9Y8xzAIlbZB+ZZce4tN8RRIdBquZyLk
	iRIq51IknBuQsoSwvm7X4CSHmtkVUJoPgebZqYGoxNgUAKv+YmqP2ro0mdFSF4leBMSduCiEVLe
	pOzbMI/3Kqrfx32FZOIXMuWuCgBfvESeo8ibqQF9M4v8GtM+0hHOw6OmMra07edILw59oW1zfHa
	HyUtKTfmYEPgKa9vIMQVJv5h8cin1sWV9zgV7iKiuRdZNpT0OSwVAJiDTLj2tH7PdK/Pbzh4ED3
	dXxdLVjKLwx5xsPgvi+Q==
X-Received: by 2002:a17:90a:d2cb:b0:37d:85cd:1367 with SMTP id 98e67ed59e1d1-37d85cd1554mr2058990a91.15.1782053989257;
        Sun, 21 Jun 2026 07:59:49 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f225870sm4544896a91.8.2026.06.21.07.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 07:59:48 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Sang-Heon Jeon <ekffu200098@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com,
	linux-riscv@lists.infradead.org,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: [PATCH 4/6] riscv: remove unreachable invalid range check in kasan_init()
Date: Sun, 21 Jun 2026 23:59:14 +0900
Message-ID: <20260621145919.1453-5-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260621145919.1453-1-ekffu200098@gmail.com>
References: <20260621145919.1453-1-ekffu200098@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_075950_205886_A9D0550A 
X-CRM114-Status: UNSURE (   7.54  )
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

kasan_init() populates the linear mapping shadow with for_each_mem_range()
and breaks the loop when start >= end. for_each_mem_range() never returns
an invalid range, so start < end always.

Therefore the start >= end check is unreachable, so remove it.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 arch/riscv/mm/kasan_init.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index c4a2a9e5586e..1f3aa9611187 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -512,9 +512,6 @@ void __init kasan_init(void)
 		void *start = (void *)__va(p_start);
 		void *end = (void *)__va(p_end);
 
-		if (start >= end)
-			break;
-
 		kasan_populate(kasan_mem_to_shadow(start), kasan_mem_to_shadow(end));
 	}
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
