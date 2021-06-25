Return-Path: <SRS0=TyRV=LT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5271CC49EA6
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jun 2021 01:02:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA0F56135A
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jun 2021 01:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA0F56135A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=15OWW4ykbnkjdlJjtsXfgDCOFC28dGWtVN3Cv+AXDco=; b=cMINN/Wb8vRTrP
	0PZ8o2AJR1zoy0utFEBp8DgOz1f+6q46b91yFt+9oXK7RfTYsZrMzTWva61ftzyZ3mXZnb1BQynuO
	BChbJbBbd830Gpf6AOH83dx9DZQcwX1JboLOkyAOZyCK0nR70S5IRrkHqZYC37bpAK3fCfONSGwvP
	FOpeJXpbr7TW8vyRDcYVckjJDQ4Vsi/0ca7aCCXMDmc5PxL6h/XRB+ltUqxvgoHSi3Cboi35pB4Je
	2+TRsKnjtiQIj/Kbr0p35rbVLX2vF5pXagJIjsMMYzOYQhhZ6LLBaznKkvxi3VH3kzJ71QHo1dW7z
	JkTK8PUzTyJI9WAOLvSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwaEp-00GvrA-LM; Fri, 25 Jun 2021 01:02:31 +0000
Received: from mail-ed1-f52.google.com ([209.85.208.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwaEn-00GvpM-6V
 for linux-riscv@lists.infradead.org; Fri, 25 Jun 2021 01:02:30 +0000
Received: by mail-ed1-f52.google.com with SMTP id h17so11141314edw.11
 for <linux-riscv@lists.infradead.org>; Thu, 24 Jun 2021 18:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZzhxbsS0xblHmbaMS57RZ4S8yZ1GoCabsZyCXQhJYrY=;
 b=iu+FIq/U8++yCVAQz3s9zkB8B4n1VuLARR0TW8zjHrSSC5rQpKFUvOxmKbKQrN6wSK
 2xftz5h3UIosyyzThHT88FP8BFMBpCsbIyuEpvJ7H97oriuer80QUnDeich3GwDOFTOM
 cpXV2W8mwcmUZJ1TIBBAONEJbDFOjvwqjYgdP7fjQg/HQIGy59XYPy7970NoAIi5W+bs
 vlyJFmvB3eK10fDMlRZny2Dnyf8nCx1ZaVfj2G+Nr3n/gIOZ/Nn9+h7cxf7x/dcD8v1T
 bk9em4hChDL505WD/gHcG6FOKERBxRAB3G9T5z9Bx0a0TPz00633GBuwSgbwIjTTa86t
 jdqw==
X-Gm-Message-State: AOAM532RAo1ddIyZN1s+c4KWHd/XkhBYfG5dvUd0PNlMPtG2h+OXCFBv
 N52I2WKjS5g0PCySmjDqh0k=
X-Google-Smtp-Source: ABdhPJzUlanwgvJ9sy/0XoJxNoRpkQdc4Ar2JfL2/NSyHYMU4NhXrSCqoGE3LIUdsSRwDZUL/8ERpA==
X-Received: by 2002:a05:6402:35c3:: with SMTP id
 z3mr10939073edc.346.1624582947742; 
 Thu, 24 Jun 2021 18:02:27 -0700 (PDT)
Received: from msft-t490s.home (host-95-251-17-240.retail.telecomitalia.it.
 [95.251.17.240])
 by smtp.gmail.com with ESMTPSA id yc29sm1921909ejb.106.2021.06.24.18.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 18:02:26 -0700 (PDT)
From: Matteo Croce <mcroce@linux.microsoft.com>
To: linux-kernel@vger.kernel.org, Nick Kossifidis <mick@ics.forth.gr>,
 Guo Ren <guoren@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 David Laight <David.Laight@aculab.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Drew Fustini <drew@beagleboard.org>
Cc: linux-arch@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-riscv@lists.infradead.org
Subject: [PATCH 1/3] lib/string: optimized memcpy
Date: Fri, 25 Jun 2021 03:01:58 +0200
Message-Id: <20210625010200.362755-2-mcroce@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625010200.362755-1-mcroce@linux.microsoft.com>
References: <20210625010200.362755-1-mcroce@linux.microsoft.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_180229_290321_86FDC0DF 
X-CRM114-Status: GOOD (  18.14  )
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

Signed-off-by: Matteo Croce <mcroce@microsoft.com>
---
 lib/string.c | 81 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 78 insertions(+), 3 deletions(-)

diff --git a/lib/string.c b/lib/string.c
index 546d59711a12..15e906f97d9e 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -33,6 +33,24 @@
 #include <asm/word-at-a-time.h>
 #include <asm/page.h>
 
+#define MIN_THRESHOLD (sizeof(long) * 2)
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
+static const unsigned int bytes_long = sizeof(long);
+static const unsigned int word_mask = bytes_long - 1;
+
 #ifndef __HAVE_ARCH_STRNCASECMP
 /**
  * strncasecmp - Case insensitive, length-limited string comparison
@@ -878,16 +896,73 @@ EXPORT_SYMBOL(memset64);
  * You should not use this function to access IO space, use memcpy_toio()
  * or memcpy_fromio() instead.
  */
+
+#ifdef __BIG_ENDIAN
+#define MERGE_UL(h, l, d) ((h) << ((d) * 8) | (l) >> ((bytes_long - (d)) * 8))
+#else
+#define MERGE_UL(h, l, d) ((h) >> ((d) * 8) | (l) << ((bytes_long - (d)) * 8))
+#endif
+
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
+		for (; d.as_uptr & word_mask; count--)
+			*d.as_u8++ = *s.as_u8++;
+
+		distance = s.as_uptr & word_mask;
+	}
 
+	if (distance) {
+		unsigned long last, next;
+
+		/*
+		 * s is distance bytes ahead of d, and d just reached
+		 * the alignment boundary. Move s backward to word align it
+		 * and shift data to compensate for distance, in order to do
+		 * word-by-word copy.
+		 */
+		s.as_u8 -= distance;
+
+		next = s.as_ulong[0];
+		for (; count >= bytes_long + word_mask; count -= bytes_long) {
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
+		for (; count >= bytes_long; count -= bytes_long)
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
