Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB5CC54ED1
	for <linux-riscv@archiver.kernel.org>; Sat, 24 May 2025 15:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vi33+9MG6xjH3ACyCRhe3K6wMhIbdlQD9qEpOjBWglQ=; b=pjsd3KbElQOln5
	BZ+V4wAdvt+b1fvhqPpNoF9TQPxxsJpK8rQh7c3APDydP7nYJHpANcNBxCxRutVqx3evt1S1zJeKR
	il1//DvETyy1JjAhUMvOgSMu972SE92phoIbsw0n9S8tfbiompg2Hq29mSdVbC0h3ISL1h16RgRyq
	nDflvm4srAj3Y8v2n1Gq7SaKk4gsVnGQC1f7RE/ZHfEw2z4F2lgtgVSWcPCMX1eu4SEsKaR8NMg63
	7zg8eylu7bDoXoYN3Q3Hno1wjWShWPaDK56TAafLY21oB96gicxv+JfbafomeRVEif01aaoAhrdUv
	GBS0N4Vs9XMa17rcqP4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIrDs-00000005yFa-0eKk;
	Sat, 24 May 2025 15:55:44 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIrDp-00000005yEi-2grb
	for linux-riscv@lists.infradead.org;
	Sat, 24 May 2025 15:55:42 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-23035b3edf1so5066905ad.3
        for <linux-riscv@lists.infradead.org>; Sat, 24 May 2025 08:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748102141; x=1748706941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTOfhhx4tmgdgjsjrWN+4ojRH+o9SeAoyKRWolFXyrw=;
        b=dJnAnflEhuF5A/sL8YBVylDFQ7myp/8z0zjuB0FxlqXN3FfRWOEVXIDktZmVS+/+V3
         HK8w+D9G3LSR5kAEwhqXHOCgclEszE3rf5xUzN6CAiXLW9o1PPHfqF4izGIMZZhMaFjb
         Dkqa8RIm57mfGqWfEIqRAhYWCnUA+EWnoOl8moyA4HIgrtjtvZCSF29NL6swpLzZIhnG
         /4vdBe6HDPM76MRFKcfwWlC/PN9eM5FT7FD8IELCn92bCROxoAxdCt32vUnxO4zLPmSm
         4DpSu5G8mhZVbsHpCzl2OGinic1sEuY4TWMK6q1FhCkCZ9gopthTjs3OvTF0mkBKElRw
         Pc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748102141; x=1748706941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTOfhhx4tmgdgjsjrWN+4ojRH+o9SeAoyKRWolFXyrw=;
        b=vtNfIZh3HH93GXp8V0c3EEW6851HLjxXXIMR7JuPvLGKt+1pide67C/8sfBEUJG9LB
         Gn8RtBXv3VWfl1ppSwDMG19wRgX3NLft6TpYB0MrHVoacl+23B3YcW6A9zqscrTvqpM3
         TNQlwmu6cSS04UXocuAwoN+bfXYugrWiOYIcZdlFwFPClz20nsouf0kSnBnQO84W+KB/
         ++E5hy/7yyhnLhWgqBFqIf2ognVTJbn8D6f3n2O6zEA+/yjb8FP6qbU7vzQrGhFJ/Ocr
         gauzLwdn6L4c3KiPTzNxAo3uaPKLWrxaf2WA+EL/SLWaO2r8dMTe1NlROXKt92T7IUCf
         wnqA==
X-Gm-Message-State: AOJu0Yy8BZ4Wq8LyckWbL8I4f8bsL8yfpl/KjUaCSE4cFI5afU+ip6Df
	4Wi4UMbNKO7RQ4SgGhdDKB1wtPhiESikrdATWuZwmCE+y0Rc0+oMzYNi
X-Gm-Gg: ASbGncumYDoetahZlt4eAGCRYMQxrTLCa7B9hwPnbQyj2v5SiFwnKDR+HM8Hfme1AFT
	EavkUvCktmc1dfkFX6FSZVmv8MeP+Yh3ktmNFNr8YOBdkHsDTR94hRa5rZm3S6VAQexhK3BdJjE
	JzRW1crm3graTsSqKUdWXl2+kiK060KMB0gHisRI78lHkcg/hF5euUROtRgQjXfCeGLq1HhT9xU
	YdmTqvTzqmFKB13Hbtg1kwlu5m2vZLX9ip14bJHClSUWvKGWvt/nOeRx18cek1prY4+Mb0w84Px
	Hs6Ln+XX24Q43Wr0dixu/euza6RyztzImIgp088FFH+hjS+ucfbqnWUdwD6ynck9piTQvtjfxZs
	KOKR0hg==
X-Google-Smtp-Source: AGHT+IGzb8lXK6JpNh7Jawzjljq6XjfoS2tt2jOQqiGcPa4jJ9wCYrr9Hj9TnlXUNZjSKHaQw0Uczg==
X-Received: by 2002:a17:903:185:b0:223:501c:7576 with SMTP id d9443c01a7336-23414f586a8mr62783105ad.12.1748102140651;
        Sat, 24 May 2025 08:55:40 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234396eaf62sm1200745ad.9.2025.05.24.08.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 08:55:40 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	akpm@linux-foundation.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v2 1/3] lib/math/gcd: Use static key to select implementation at runtime
Date: Sat, 24 May 2025 23:55:17 +0800
Message-Id: <20250524155519.1142570-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250524155519.1142570-1-visitorckw@gmail.com>
References: <20250524155519.1142570-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_085541_685227_038540B5 
X-CRM114-Status: GOOD (  13.39  )
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

On platforms like RISC-V, the compiler may generate hardware FFS
instructions even if the underlying CPU does not actually support them.
Currently, the GCD implementation is chosen at compile time based on
CONFIG_CPU_NO_EFFICIENT_FFS, which can result in suboptimal behavior on
such systems.

Introduce a static key, efficient_ffs_key, to enable runtime selection
between the binary GCD (using ffs) and the odd-even GCD implementation.
This allows the kernel to default to the faster binary GCD when FFS is
efficient, while retaining the ability to fall back when needed.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 lib/math/gcd.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/lib/math/gcd.c b/lib/math/gcd.c
index e3b042214d1b..2898ee0e5add 100644
--- a/lib/math/gcd.c
+++ b/lib/math/gcd.c
@@ -2,6 +2,7 @@
 #include <linux/kernel.h>
 #include <linux/gcd.h>
 #include <linux/export.h>
+#include <linux/jump_label.h>
 
 /*
  * This implements the binary GCD algorithm. (Often attributed to Stein,
@@ -11,16 +12,13 @@
  * has decent hardware division.
  */
 
+DEFINE_STATIC_KEY_TRUE(efficient_ffs_key);
+
 #if !defined(CONFIG_CPU_NO_EFFICIENT_FFS)
 
 /* If __ffs is available, the even/odd algorithm benchmarks slower. */
 
-/**
- * gcd - calculate and return the greatest common divisor of 2 unsigned longs
- * @a: first value
- * @b: second value
- */
-unsigned long gcd(unsigned long a, unsigned long b)
+static unsigned long binary_gcd(unsigned long a, unsigned long b)
 {
 	unsigned long r = a | b;
 
@@ -44,9 +42,15 @@ unsigned long gcd(unsigned long a, unsigned long b)
 	}
 }
 
-#else
+#endif
 
 /* If normalization is done by loops, the even/odd algorithm is a win. */
+
+/**
+ * gcd - calculate and return the greatest common divisor of 2 unsigned longs
+ * @a: first value
+ * @b: second value
+ */
 unsigned long gcd(unsigned long a, unsigned long b)
 {
 	unsigned long r = a | b;
@@ -54,6 +58,11 @@ unsigned long gcd(unsigned long a, unsigned long b)
 	if (!a || !b)
 		return r;
 
+#if !defined(CONFIG_CPU_NO_EFFICIENT_FFS)
+	if (static_branch_likely(&efficient_ffs_key))
+		return binary_gcd(a, b);
+#endif
+
 	/* Isolate lsbit of r */
 	r &= -r;
 
@@ -80,6 +89,4 @@ unsigned long gcd(unsigned long a, unsigned long b)
 	}
 }
 
-#endif
-
 EXPORT_SYMBOL_GPL(gcd);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
