Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12382CA0EEB
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 18:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5YEpBA+/hbv7WLsUIUa+rgzQHYgyW5hYK0WJDQyWtcA=; b=0B6xmWcHREWujM
	mKgpNf6b5w3pRVyB0xYzo7AIAbGvGWbHqMXbMXAPyzAoR+EawxnDQFA9tI42P7jNPhUNXSrZTxRqD
	NoNC+Z/QPuI1mmnxnjGBGL1Uddec2Q9Amu0cg0CuBOsFpbf1xSjRAshU3aiNMNmyUMBBqUtpuXm6N
	7LaHXGn+iQtQCF1AYMleTWGWUjp9WuTrGDsKt7DbFaJhQtoNYWByyjA44IwHUAns0Q4EGCloL6S8n
	qk4NseFg/cTn6KIVmdyQMPlUHtpkNQp8Rb6WejfrPEIPNA0uPW7+B48w0D+skxQGksxyxrvM8p8YW
	Gly+EicILYtBnWMazfkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQr8-0000000BEFK-07tU;
	Tue, 19 Aug 2025 18:14:46 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMjI-0000000Aexd-2WEl
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 13:50:25 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2445805aa2eso43565815ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Aug 2025 06:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1755611424; x=1756216224; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0fLkDwiiUZSss6sfPf8N7ZCd7V1JUEtWvKlq+l/gMKQ=;
        b=QIPb/IJ/Rxg6OeltHTcxDO3+NMaWyNqrq2tXbqBR4Mh+WZlksqRhazV3S3jF5E+f5u
         XUfHRQzXa9Fm84RZ/+zCDd13/D91lQwJQCa3V3fi3sQLM+W7DvCyV6jTvE1UEcU6QD5c
         JD22nZCyx8gY0lyR7bokTPoqA+cVfNTiKrUhkumOk3DOfskn+umzhWMBp44wO9+2YDwJ
         cgy8aI+zMWj3T/M7F/BBJXv0OpiJUYNkS8hUehszv79rV4XiR6T74fBjvBgddHVehTiX
         Sj5s7VLtCyQ8LocF7kZBe5XrnZ3XD4ZMljnBXrlPjnEWE6+pOk3+IpOaI9m1fhSOGwrG
         XTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755611424; x=1756216224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0fLkDwiiUZSss6sfPf8N7ZCd7V1JUEtWvKlq+l/gMKQ=;
        b=BZcjmbFrUFfmtBAZWyaOcEwpZKbqGuFOKwZrSTrUPZTdGqXJgW5bZcMSLf8FmzFcTm
         QqJedx76TNMvHlkNF02Ax9BF0twEnG3C51BJOhQAhe/Of00dw9hJEf9f78NDmSglGfLy
         6i9Y4niAJUOpTKUp/cIwhDhY3TepPLeueCe4fkcJxP2YJWaZCwG7VnrYe6hY/f1cns8F
         hoxA1WL+IJCOCMz3+nzG/+hdmlpr5Bf/wwAVnBSpPx8uqZDhQi/hLoTeTLivNGupUK9W
         TVWjEWsHP43QfWIda5OQwpv45vR7GABHmkNnOje9WIe/gL43fXN4u52ktqwra2PJvzSt
         Jflw==
X-Forwarded-Encrypted: i=1; AJvYcCWue8boKo/f2NoalrYlZcAxksXmXaku0h4mVoRMnUPTHQpzszmdriS0mzmdldnKpDsEvMogjmiGEB3c0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3B14RkBsIADGkIsMXO+h7MwmZwYR6QGwYa+I/CEnj5+9+Kq+z
	EQcM79wI0ArhlQbxJOE2fBcwssxb1e+5DV04u3pwFWoHlQ5TUtjQZO1dCG/wk7yhuAk=
X-Gm-Gg: ASbGncuAHKoqRN5qQWIsnD+MSMyouT/SzYIv5Y6MgFtghlZNBVbwWqb7598rXQAY+Wz
	mh7aJGJwWJDWqN8/eKmf/ndn1nHtHGVUvD5ILrsX73M6FD42pHPli4gcNeM6F0o6pEYBdTUSgeD
	jEaAWRsUhvTQIJwnjvcL90cqbV6io1zA2ItEw91L45tNZUx1j5griPtrGeHyF8RjdmLQrkNSosi
	UZwSREzcikPAnU5rwJCWgk2sGAGRa27uxkZvVok4xIO8Fc7E8zJOpYeBey36HhDKUFyslhnWBRd
	0FkP24nMjjyZccX9qEuEHtuxc8yeI8GHH1HYU250naRqo+qJRBEJUY1i6krP8yjvNXt+etxQu9b
	JgJ+BOSQtHiB2TStqt0xnCVNS9c7iFohbyg2Ax0KE0LnHd40Ul2rGrAn0
X-Google-Smtp-Source: AGHT+IESvYgemIySPSxA386V71buITJEB5A1eQjLKfmg5oq42Sd+h+mzvTGReO0QPPNPP/g2BvgHbA==
X-Received: by 2002:a17:902:d488:b0:244:99aa:5488 with SMTP id d9443c01a7336-245e046e326mr36849155ad.30.1755611423589;
        Tue, 19 Aug 2025 06:50:23 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d5533c4sm109937815ad.140.2025.08.19.06.50.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 19 Aug 2025 06:50:23 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	linux-mm@kvack.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH 1/2] riscv: remove irqflags.h inclusion in asm/bitops.h
Date: Tue, 19 Aug 2025 21:50:06 +0800
Message-Id: <20250819135007.85646-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250819135007.85646-1-cuiyunhui@bytedance.com>
References: <20250819135007.85646-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_065024_636550_36D7B9A6 
X-CRM114-Status: UNSURE (   9.69  )
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

The arch/riscv/include/asm/bitops.h does not functionally require
including /linux/irqflags.h. Additionally, adding
arch/riscv/include/asm/percpu.h causes a circular inclusion:
kernel/bounds.c
->include/linux/log2.h
->include/linux/bitops.h
->arch/riscv/include/asm/bitops.h
->include/linux/irqflags.h
->include/linux/find.h
->return val ? __ffs(val) : size;
->arch/riscv/include/asm/bitops.h

The compilation log is as follows:
CC      kernel/bounds.s
In file included from ./include/linux/bitmap.h:11,
               from ./include/linux/cpumask.h:12,
               from ./arch/riscv/include/asm/processor.h:55,
               from ./arch/riscv/include/asm/thread_info.h:42,
               from ./include/linux/thread_info.h:60,
               from ./include/asm-generic/preempt.h:5,
               from ./arch/riscv/include/generated/asm/preempt.h:1,
               from ./include/linux/preempt.h:79,
               from ./arch/riscv/include/asm/percpu.h:8,
               from ./include/linux/irqflags.h:19,
               from ./arch/riscv/include/asm/bitops.h:14,
               from ./include/linux/bitops.h:68,
               from ./include/linux/log2.h:12,
               from kernel/bounds.c:13:
./include/linux/find.h: In function 'find_next_bit':
./include/linux/find.h:66:30: error: implicit declaration of function '__ffs' [-Wimplicit-function-declaration]
   66 |                 return val ? __ffs(val) : size;
      |                              ^~~~~

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/bitops.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index d59310f74c2ba..d9837b3cf05fe 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -11,7 +11,6 @@
 #endif /* _LINUX_BITOPS_H */
 
 #include <linux/compiler.h>
-#include <linux/irqflags.h>
 #include <asm/barrier.h>
 #include <asm/bitsperlong.h>
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
