Return-Path: <SRS0=3Ayx=L2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015DAC11F68
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 12:32:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0E8461424
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 12:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0E8461424
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wRh3Vg5gbcQ5+3391tksiiyO0syNgIUcxovU+ZcDSB8=; b=okEbOSUXEQaygJ
	Bb1eSes5MVE5aWEVZy4Rk9I9ASfIxnzP7/K6xgcwfIFB/aMg/9uaNGJ8sJNBg64vUyh16C69xWIkv
	uQ3NsIoWgpi3fbmgGPSCOdLMpJ3fIp8T50hHENFYQkvl0O5ub0FBVA6cPTxLa8Q/I5p+PHcel/jaF
	EUEQx2rVwlVZd8ERqb3d1gTTuQUuu3ZZe3mgRB66YD65RXCqBQhgbhOMZzDm61zls+yBCk72cNRsR
	VmkUs5J0pL44AsXKcVWIFM7Yy03NOzT87YEFm0b0+QxEfq+SGedfSPDvroW8I7s9go+8o0P019sPw
	Gv1XUCTaOtueEybYlOFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzILJ-002yx2-Ss; Fri, 02 Jul 2021 12:32:25 +0000
Received: from mail-ej1-f50.google.com ([209.85.218.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzILF-002yuJ-Pe
 for linux-riscv@lists.infradead.org; Fri, 02 Jul 2021 12:32:23 +0000
Received: by mail-ej1-f50.google.com with SMTP id hr1so12470592ejc.1
 for <linux-riscv@lists.infradead.org>; Fri, 02 Jul 2021 05:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T4puU0S79nYZVJxL5330o71fJ7BCxyuoFiktDEi3Ycs=;
 b=lnhT/5EWCZadbN1NPvM78EJB4McAjK0zyvLKNox0+UqRIWtUBYCLGeA9H2O1AHiykR
 STx62dFQjAzW+PsEp1Y0HLcFdh1s7tWfNodefJR/QIRoOh7Zvk+E1iFBMRqA9VuugclE
 Y7/ArwCLL96dV6eOPB1KKPiQ43eSqe7l67sGfZwpyts0UldO/1b5evpPdUiLDxNL7soq
 TZBj7HIfYeQIxaEdKxCeTG0FN9Q2C8q/T1mwSDjAeemTDLCmc9gvLk6yVhB6ioGJUt1E
 T/IDUMNTarRwEazvGSndq3TX0Xjvvj3EuvcynNV9NCT3W2EPlzsHKMKONY7jM7xk2D1s
 PZqA==
X-Gm-Message-State: AOAM5322zu2Yi7zWLUh6USec3UvfpiWvR2wIGNYF/wj3aWoyeek2NreZ
 aNgapXmXjIrtRSJXNQX2s7Y=
X-Google-Smtp-Source: ABdhPJzVbfW2f5ok3CMI+LmMsoURAHir44e7S77s4RVSljg6S5X+t1PvRrH04Og7dFUH6Z5AD+3Xug==
X-Received: by 2002:a17:906:2bd9:: with SMTP id
 n25mr5046575ejg.513.1625229140622; 
 Fri, 02 Jul 2021 05:32:20 -0700 (PDT)
Received: from msft-t490s.fritz.box
 (host-80-182-89-242.retail.telecomitalia.it. [80.182.89.242])
 by smtp.gmail.com with ESMTPSA id c3sm1290189edy.0.2021.07.02.05.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 05:32:20 -0700 (PDT)
From: Matteo Croce <mcroce@linux.microsoft.com>
To: linux-kernel@vger.kernel.org, Nick Kossifidis <mick@ics.forth.gr>,
 Guo Ren <guoren@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 David Laight <David.Laight@aculab.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Drew Fustini <drew@beagleboard.org>
Cc: linux-arch@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/3] lib/string: optimized memmove
Date: Fri,  2 Jul 2021 14:31:52 +0200
Message-Id: <20210702123153.14093-3-mcroce@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702123153.14093-1-mcroce@linux.microsoft.com>
References: <20210702123153.14093-1-mcroce@linux.microsoft.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_053221_877771_F2797F94 
X-CRM114-Status: GOOD (  13.50  )
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
index caeef4264c43..108b83c34cec 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -975,19 +975,13 @@ EXPORT_SYMBOL(memcpy);
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
