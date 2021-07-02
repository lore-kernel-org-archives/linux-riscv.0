Return-Path: <SRS0=3Ayx=L2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810FCC11F68
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 12:32:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46303613F5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 12:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46303613F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K8DeZzbUtISb3Regy2EAC5S+mn3eDwRDqVfZrZPDGkg=; b=PlxJLFPSrB0Vw9
	AREBrBokHe5JDr/G7HW4+GsPI9xX67U+LdJDOGxG+vfR1WcrMfaBuGQSpBk2kNZ727EI7m+WKvoOe
	8pDjB1AAi7Q7X8FXHBnQdUImVvNj3ELFzkPEu8s/YhAHTfWlbtLNg8ghel8R1kbq5fcbTzQ6JbCfR
	eAhMBDcfNJmlDKozEH74G9uyO4HzWraLpfQVM6UHfpnLIohmyEL1SOzGRvaWmkC8zfANA0pG7ty3g
	hewK3Rg2fFvgL0dAgQFqK2qdLIjvV8RmM2PxKCBaWbthmfeRIh/LFC091CtbLrPIDIDisVYvWRcf0
	mX/0TTeIkFAaCAopd+Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzILP-002z0A-DI; Fri, 02 Jul 2021 12:32:31 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzILM-002yyF-NQ
 for linux-riscv@lists.infradead.org; Fri, 02 Jul 2021 12:32:30 +0000
Received: by mail-ej1-f49.google.com with SMTP id bg14so15839906ejb.9
 for <linux-riscv@lists.infradead.org>; Fri, 02 Jul 2021 05:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o6ZDZDCvhi/aYSH4+o4WB0jbVOX9Yf7JZyqDclGvSvg=;
 b=DStEl9R1lG99N6hym2mTLwdYPGsXdLStJaT5dryEHNz3YMRnYdbaAEV6tVXf4nmXcx
 ozkXJofZwhAaazJjLNLrK0BtuRgK7+lRZROJC5GYC6rIXxPzJRCwjMg5zba2+/ZQVBoA
 o7L+yRNaAiqmlj+zP+mmG/iXiabSNwjrZwpDbghbvJmFJDnQZQgeKiq0gsa2rCL5I+oC
 s6x6Cjom2QOy/5StsHL2S12Tzdv/Uvsk1nEeD/2uHcZUbJdbRhgaSa788RTx/liOgv1V
 O9XXYpaxGIrPMDvKGTXh1KszRhjzEUt5LYknDhBMKaiglpDUgR74To6cQnE60mJ9wV2W
 P5pw==
X-Gm-Message-State: AOAM533AcK4qk0MTjfT98cSFwMgFNjBTjXh3uEHnUfpjhiqeiN/V4RqC
 Wg3obbTtgeC5lUgyof0czlg=
X-Google-Smtp-Source: ABdhPJwQrfzQ1h6zczBdfLb25MTXk3GdnKc5nFaDGxDMgWYbUpCHG31dhKgZ9CSECScHKbbT4BunVg==
X-Received: by 2002:a17:906:9b86:: with SMTP id
 dd6mr4909110ejc.100.1625229142346; 
 Fri, 02 Jul 2021 05:32:22 -0700 (PDT)
Received: from msft-t490s.fritz.box
 (host-80-182-89-242.retail.telecomitalia.it. [80.182.89.242])
 by smtp.gmail.com with ESMTPSA id c3sm1290189edy.0.2021.07.02.05.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 05:32:21 -0700 (PDT)
From: Matteo Croce <mcroce@linux.microsoft.com>
To: linux-kernel@vger.kernel.org, Nick Kossifidis <mick@ics.forth.gr>,
 Guo Ren <guoren@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 David Laight <David.Laight@aculab.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Drew Fustini <drew@beagleboard.org>
Cc: linux-arch@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-riscv@lists.infradead.org
Subject: [PATCH v2 3/3] lib/string: optimized memset
Date: Fri,  2 Jul 2021 14:31:53 +0200
Message-Id: <20210702123153.14093-4-mcroce@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702123153.14093-1-mcroce@linux.microsoft.com>
References: <20210702123153.14093-1-mcroce@linux.microsoft.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_053228_818650_73E1BD35 
X-CRM114-Status: GOOD (  16.50  )
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

The generic memset is defined as a byte at time write. This is always
safe, but it's slower than a 4 byte or even 8 byte write.

Write a generic memset which fills the data one byte at time until the
destination is aligned, then fills using the largest size allowed,
and finally fills the remaining data one byte at time.

On a RISC-V machine the speed goes from 140 Mb/s to 241 Mb/s,
and this the binary size increase according to bloat-o-meter:

Function     old     new   delta
memset        32     148    +116

Signed-off-by: Matteo Croce <mcroce@microsoft.com>
---
 lib/string.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/lib/string.c b/lib/string.c
index 108b83c34cec..264821f0e795 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -810,10 +810,38 @@ EXPORT_SYMBOL(__sysfs_match_string);
  */
 void *memset(void *s, int c, size_t count)
 {
-	char *xs = s;
+	union types dest = { .as_u8 = s };
 
+	if (count >= MIN_THRESHOLD) {
+		unsigned long cu = (unsigned long)c;
+
+		/* Compose an ulong with 'c' repeated 4/8 times */
+#ifdef CONFIG_ARCH_HAS_FAST_MULTIPLIER
+		cu *= 0x0101010101010101UL;
+#else
+		cu |= cu << 8;
+		cu |= cu << 16;
+		/* Suppress warning on 32 bit machines */
+		cu |= (cu << 16) << 16;
+#endif
+		if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)) {
+			/*
+			 * Fill the buffer one byte at time until
+			 * the destination is word aligned.
+			 */
+			for (; count && dest.as_uptr & WORD_MASK; count--)
+				*dest.as_u8++ = c;
+		}
+
+		/* Copy using the largest size allowed */
+		for (; count >= BYTES_LONG; count -= BYTES_LONG)
+			*dest.as_ulong++ = cu;
+	}
+
+	/* copy the remainder */
 	while (count--)
-		*xs++ = c;
+		*dest.as_u8++ = c;
+
 	return s;
 }
 EXPORT_SYMBOL(memset);
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
