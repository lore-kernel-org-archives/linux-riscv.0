Return-Path: <SRS0=TyRV=LT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE7CC49EA7
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jun 2021 01:02:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C9DD613B9
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jun 2021 01:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C9DD613B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OJNSMLx/eAbsAJHHn8SAzf2E9PqxLcbTJMdj9KfpXY8=; b=AWSk6NZFH07XWN
	pmEFkqK3fzvXDSe0lxZpnZrL0ZFoHZey8WengRscZMoZaoXVRYx/Wv04Yc3v1ptzapQyTOSMLGe2M
	tgzcLK/Ji9VIaGh89UigQ7LH4LuEpJReVMAFcB4zOeBoPYuiNJHjhGkBzFrFovVyuvOUyo6qsB1Zq
	Yft2KnJrfAE0XjYhb0wjvT44hxdKdx8YKsyKJvPVJZnmmfU/64RTrwolSXPs0JhLShkxsYduZ5u3V
	qGOgdl8tp897me5Sap5geekJVAX/9aD4yPNv75Hkt00OZfZjNepUK6nIs+GevUZoqgFev7PXUriph
	vgaDOUnouUmcwYlVls5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwaEr-00GvsB-K9; Fri, 25 Jun 2021 01:02:33 +0000
Received: from mail-ej1-f53.google.com ([209.85.218.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwaEo-00Gvpz-LW
 for linux-riscv@lists.infradead.org; Fri, 25 Jun 2021 01:02:32 +0000
Received: by mail-ej1-f53.google.com with SMTP id he7so12358219ejc.13
 for <linux-riscv@lists.infradead.org>; Thu, 24 Jun 2021 18:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5d1bwUaSuG/f6mTu6ru/WOtu9a5hLw1cNtYO/dabh8E=;
 b=Kf5u1Lo3qEoUt7/Kn0Pg9+wvOtM02MSCvCOqHUTAuJz1RNOyHNcwZn4pNkEL8TTd5r
 kP0TT3eKJ0kZcaDr5wfGM5EAmt8mbLqPDf7MzRH+sNsIRzdXQ3q6jVWYZsmflq2YrkW3
 f+M7aNUEQy8lzU3YnLdI0vy92Km+BCOENdUK+6lV6fLp0TvcQk/NeTJjRkhDprW4yRCF
 2iBeCCRbAqNMuJhbhhrKgb1lUC43D6gVhEphAWbvS414+U3YFm4lVrWtl1HRfAAe8RH5
 M1hTZR/UJauFVRxUi1LYHjCf+6VEf43VP9+2iZJK926jrkkL5rK+ZMTzJnCQ23kaqqiU
 +FKQ==
X-Gm-Message-State: AOAM532yAVjpe2XoPhpXu3syRIsZOOQdZ2EDNy/rbJTEUhYXJ3LiXCw6
 kFs4ttRY8EFgy1XVLZAvU9U=
X-Google-Smtp-Source: ABdhPJxINwo0+vWL6bmf2rOXNOQTpbhqaRuhL6BUfM1PoIYKKfYvwU+5wDopzTUQ2tk9MFuhlrmHSA==
X-Received: by 2002:a17:906:30d0:: with SMTP id
 b16mr8028751ejb.495.1624582949235; 
 Thu, 24 Jun 2021 18:02:29 -0700 (PDT)
Received: from msft-t490s.home (host-95-251-17-240.retail.telecomitalia.it.
 [95.251.17.240])
 by smtp.gmail.com with ESMTPSA id yc29sm1921909ejb.106.2021.06.24.18.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 18:02:28 -0700 (PDT)
From: Matteo Croce <mcroce@linux.microsoft.com>
To: linux-kernel@vger.kernel.org, Nick Kossifidis <mick@ics.forth.gr>,
 Guo Ren <guoren@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 David Laight <David.Laight@aculab.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Drew Fustini <drew@beagleboard.org>
Cc: linux-arch@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-riscv@lists.infradead.org
Subject: [PATCH 2/3] lib/string: optimized memmove
Date: Fri, 25 Jun 2021 03:01:59 +0200
Message-Id: <20210625010200.362755-3-mcroce@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625010200.362755-1-mcroce@linux.microsoft.com>
References: <20210625010200.362755-1-mcroce@linux.microsoft.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_180230_793526_E9D1B4BE 
X-CRM114-Status: GOOD (  12.68  )
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

When the destination buffer is before the source one, or when the
buffers doesn't overlap, it's safe to use memcpy() instead, which is
optimized to use a bigger data size possible.

This "optimization" only covers a common case. In future, proper code
which does the same thing as memcpy() does but backwards can be done.

Signed-off-by: Matteo Croce <mcroce@microsoft.com>
---
 lib/string.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/lib/string.c b/lib/string.c
index 15e906f97d9e..69adec252597 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -976,19 +976,13 @@ EXPORT_SYMBOL(memcpy);
  */
 void *memmove(void *dest, const void *src, size_t count)
 {
-	char *tmp;
-	const char *s;
+	if (dest < src || src + count <= dest)
+		return memcpy(dest, src, count);
+
+	if (dest > src) {
+		const char *s = src + count;
+		char *tmp = dest + count;
 
-	if (dest <= src) {
-		tmp = dest;
-		s = src;
-		while (count--)
-			*tmp++ = *s++;
-	} else {
-		tmp = dest;
-		tmp += count;
-		s = src;
-		s += count;
 		while (count--)
 			*--tmp = *--s;
 	}
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
