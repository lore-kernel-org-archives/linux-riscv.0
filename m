Return-Path: <SRS0=3Ayx=L2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12DFAC11F68
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 12:32:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2693613F5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 12:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2693613F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6LWn4BNk4WKwJaxONYZ0WM+oV/4QXWzdVLh3MA66pqo=; b=F/P+43ghyxZwoC
	kkmwJHBiTNQv5rcRfJ30AAQ9GTLdGfzLRkwwIs+92pPkUxo7w1diF0PPN88A2ZhfUjGWAAZIac+9A
	XK3dCLo0301hl4XQjQAif9c6gp9citk9kum+2H1+DPo1If0hTSMl0l1lyK0gzTVNovXyg+AHA0Urs
	vcVDS3U6vaS4FpVrG0+PhJbhUCv07nv05ygzNLEKkgjEYDFH20AUWobGQiFrdoK4ziLnj/a1iFoDo
	TuOD2JyMMPU6V5WajID/OUEW0bUglRB0Q8jpx02VFYbs/DqMG4vlhCnqHDnkOR9wrswdd47mAUx/e
	3hDlkFqlXBTt+e3tRMow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzILH-002yvM-DP; Fri, 02 Jul 2021 12:32:23 +0000
Received: from mail-ej1-f52.google.com ([209.85.218.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzILE-002yuA-VG
 for linux-riscv@lists.infradead.org; Fri, 02 Jul 2021 12:32:22 +0000
Received: by mail-ej1-f52.google.com with SMTP id c17so15808991ejk.13
 for <linux-riscv@lists.infradead.org>; Fri, 02 Jul 2021 05:32:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/GMA6YAdsMJJ2OpDaPRDcSndU6vVBN1z0EV3RST4eEI=;
 b=XhE0Dk/tHL/MFXvx44/dqIpLWwHI8bc8+xuuznxTjY+vUzkxUM2tbJG+FTUuIK+MjG
 rSGBfPh/G3tsaaFEQSp7Q5Hp4N7paTRb/vIVEqRmlKgrNracyUPSGiB+M0ZLJNqSe/wK
 Pwzr5P4wdLaBl/Hid8ON7ia1PRrvujnBlrwzpUxakiHfbn5YH0BVJ5tRENZ5fHzq3Iea
 peU3NgPhD/Tn8ppBn8TjzaXnDlWa2igQNhnR8nBOdAojVRDzf922ybhdFbVCmIW1LfAs
 webMPTV/Y816mXy01tAoldfaxl5OokqzoNYdVE3BByPXSIJot9YnI8mWDwE8QfGUyL1d
 u72w==
X-Gm-Message-State: AOAM530of4JnFMwXVnEyj4W7aoUyJxgn0qH+PZ9EdOlLIXivUPYIsmEE
 e98JYwG1EIsquYZASo8ey/A=
X-Google-Smtp-Source: ABdhPJyuBLxcG4vaaxi6RF9BBdfZtZkVEaNit0HDs+2ntcHzQ/RwrmfxN18YyFvI23EQTmjogWV32g==
X-Received: by 2002:a17:907:7254:: with SMTP id
 ds20mr5026096ejc.145.1625229139021; 
 Fri, 02 Jul 2021 05:32:19 -0700 (PDT)
Received: from msft-t490s.fritz.box
 (host-80-182-89-242.retail.telecomitalia.it. [80.182.89.242])
 by smtp.gmail.com with ESMTPSA id c3sm1290189edy.0.2021.07.02.05.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 05:32:18 -0700 (PDT)
From: Matteo Croce <mcroce@linux.microsoft.com>
To: linux-kernel@vger.kernel.org, Nick Kossifidis <mick@ics.forth.gr>,
 Guo Ren <guoren@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 David Laight <David.Laight@aculab.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Drew Fustini <drew@beagleboard.org>
Cc: linux-arch@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/3] lib/string: optimized memcpy
Date: Fri,  2 Jul 2021 14:31:51 +0200
Message-Id: <20210702123153.14093-2-mcroce@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702123153.14093-1-mcroce@linux.microsoft.com>
References: <20210702123153.14093-1-mcroce@linux.microsoft.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_053221_060022_8D66C7B4 
X-CRM114-Status: GOOD (  19.36  )
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

From: Matteo Croce <mcroce@microsoft.com>

Rewrite the generic memcpy() to copy a word at time, without generating
unaligned accesses.

The procedure is made of three steps:
First copy data one byte at time until the destination buffer is aligned
to a long boundary.
Then copy the data one long at time shifting the current and the next long
to compose a long at every cycle.
Finally, copy the remainder one byte at time.

This is the improvement on RISC-V:

original aligned:	 75 Mb/s
original unaligned:	 75 Mb/s
new aligned:		114 Mb/s
new unaligned:		107 Mb/s

and this the binary size increase according to bloat-o-meter:

Function     old     new   delta
memcpy        36     324    +288


Signed-off-by: Matteo Croce <mcroce@microsoft.com>
---
 lib/string.c | 80 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 77 insertions(+), 3 deletions(-)

diff --git a/lib/string.c b/lib/string.c
index 546d59711a12..caeef4264c43 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -33,6 +33,23 @@
 #include <asm/word-at-a-time.h>
 #include <asm/page.h>
 
+#define BYTES_LONG	sizeof(long)
+#define WORD_MASK	(BYTES_LONG - 1)
+#define MIN_THRESHOLD	(BYTES_LONG * 2)
+
+/* convenience union to avoid cast between different pointer types */
+union types {
+	u8 *as_u8;
+	unsigned long *as_ulong;
+	uintptr_t as_uptr;
+};
+
+union const_types {
+	const u8 *as_u8;
+	const unsigned long *as_ulong;
+	uintptr_t as_uptr;
+};
+
 #ifndef __HAVE_ARCH_STRNCASECMP
 /**
  * strncasecmp - Case insensitive, length-limited string comparison
@@ -869,6 +886,13 @@ EXPORT_SYMBOL(memset64);
 #endif
 
 #ifndef __HAVE_ARCH_MEMCPY
+
+#ifdef __BIG_ENDIAN
+#define MERGE_UL(h, l, d) ((h) << ((d) * 8) | (l) >> ((BYTES_LONG - (d)) * 8))
+#else
+#define MERGE_UL(h, l, d) ((h) >> ((d) * 8) | (l) << ((BYTES_LONG - (d)) * 8))
+#endif
+
 /**
  * memcpy - Copy one area of memory to another
  * @dest: Where to copy to
@@ -880,14 +904,64 @@ EXPORT_SYMBOL(memset64);
  */
 void *memcpy(void *dest, const void *src, size_t count)
 {
-	char *tmp = dest;
-	const char *s = src;
+	union const_types s = { .as_u8 = src };
+	union types d = { .as_u8 = dest };
+	int distance = 0;
+
+	if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)) {
+		if (count < MIN_THRESHOLD)
+			goto copy_remainder;
+
+		/* Copy a byte at time until destination is aligned. */
+		for (; d.as_uptr & WORD_MASK; count--)
+			*d.as_u8++ = *s.as_u8++;
+
+		distance = s.as_uptr & WORD_MASK;
+	}
+
+	if (distance) {
+		unsigned long last, next;
 
+		/*
+		 * s is distance bytes ahead of d, and d just reached
+		 * the alignment boundary. Move s backward to word align it
+		 * and shift data to compensate for distance, in order to do
+		 * word-by-word copy.
+		 */
+		s.as_u8 -= distance;
+
+		next = s.as_ulong[0];
+		for (; count >= BYTES_LONG; count -= BYTES_LONG) {
+			last = next;
+			next = s.as_ulong[1];
+
+			d.as_ulong[0] = MERGE_UL(last, next, distance);
+
+			d.as_ulong++;
+			s.as_ulong++;
+		}
+
+		/* Restore s with the original offset. */
+		s.as_u8 += distance;
+	} else {
+		/*
+		 * If the source and dest lower bits are the same, do a simple
+		 * 32/64 bit wide copy.
+		 */
+		for (; count >= BYTES_LONG; count -= BYTES_LONG)
+			*d.as_ulong++ = *s.as_ulong++;
+	}
+
+copy_remainder:
 	while (count--)
-		*tmp++ = *s++;
+		*d.as_u8++ = *s.as_u8++;
+
 	return dest;
 }
 EXPORT_SYMBOL(memcpy);
+
+#undef MERGE_UL
+
 #endif
 
 #ifndef __HAVE_ARCH_MEMMOVE
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
