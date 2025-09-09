Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46644CA0FED
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 22:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mATWBSdIP7uPA24mHl6s/H0Eegabqw2h8MVfX1AAsFA=; b=5AfkPv63Guil8a
	lTB6QqAHsBdRzj6xwtnV7I+pFWsSi/p5aWiLVvafgt7BvLOCoFCaZrSdWovyRbX8TPaK1qp14Ykr4
	JRIV9lrIslYrT5NKQ4VajcWR+75OHGpEDCfYA3oZBF0uHA9NEj/A3dh1nQ8aTb1VcBkd/XZ/H40dj
	kw/pW+qi72V4wdiABHKlj1tfnefNB0doA0d7Gt2nyqou2zdfoPvkUD8p/uMpPm8e7A9wRW5L282de
	7JjTRSDm4ofzTmKfIKCxGOxl7svBYwcsehapj/A/XqBHgQJ6N9bjMXGdkRL8e4vZ3wfNUyTprBBEp
	9oTjcwBvTx31mxD/szrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw71s-0000000Aij1-0Xcm;
	Tue, 09 Sep 2025 22:41:36 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw71q-0000000AiiG-0Day
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 22:41:35 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b4f9d61e7deso3928958a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 15:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1757457693; x=1758062493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u1ipfyK9b5YmSa8JFsuC7Jixb/D0wPo4LPC95p6875o=;
        b=f6Z8pNMZne/EjUYgevyyKkmxUbm5NpZjSwNcQaSkDsyv1udQeZV8tYqULD+5ivzEzM
         zxmy7gK8JawVQqB/RAdxXZ+sccy7WkgFLNqa8cy5OZaOQkyqHxDDIZjRr1SxZL3NinRi
         dpmDeWuGDgA/XVLaXbMkQfM6F+ZPwjetdIRncI72xqpdmele88foXbCI//0pJTajnMX2
         F6+c9FQTvgZKdJo60V4TDT3mWVEjZT+jLjdy2lByEeGHZWPBr8EOiT7ByK8Ros+342yP
         pjWqYkIMB2+lbgWxjEK/FfvKJ2PrjNRhdLbaRYXmfAPYX7PPYiPO+uvAMwFDHDnB5/8r
         UM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757457693; x=1758062493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u1ipfyK9b5YmSa8JFsuC7Jixb/D0wPo4LPC95p6875o=;
        b=jTi/aNB0cSUA0APTS0kCnReOqHEBIjCNyXxkUI0wa0+6XiHZ1U9HNTM03EpWon2x6L
         GGYrp47jlJHRz3MlO3xIzFwPEvy4crJAujsSvNKX/QHB6ZPm8+aHrdX9SFwLTSPWOKXq
         XTaWn8Soz3yqVTMuxYLXzlmALq6IN6vrs23GiAurBEy4pkoKfGM4AfOzdDJcJRT0eGy5
         GZRavwcBeGTlSpPSK/MNoiet3nqe5uaK2VFPCvTx57OjEjN5hdKnIoQRs6akhlhSJ5IA
         X4joCcCiZqA0PlDGBDNapq1ewCWi3xSEljWgC0r7IknyzjG+rJtUsQHrsX8rJnxvJ3In
         njrg==
X-Forwarded-Encrypted: i=1; AJvYcCXnoqkrjvKgzTt2xZ56XecfcE+uOOZpxXAWNMvbIaNz1QDf7iNyCIRpopsAonLqXqAaiHGc37WCjMU3xw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCu0TkJt2pIBMvE/2LLpsHdz+flNTtUGfv8fxJrX2vvJvUUuxT
	iPYUp+D8hAZPlpOtsKnrCd8JYnlP2iZ/oyBruFd1lgwd26hTTHpgaEUr2m4GScipK50=
X-Gm-Gg: ASbGncui3ix0Rpaw9t9fwoqauJPNeysRVWsWxMnPDtZUH+1lZ4wDsIYA4mmC63ZIaiw
	p+7YKTEomVzuf8+bfgxhVpriPqV8f4CSDc4TD07YewsloSxtPZULfnJOuAUfvVDiJEiEZF+JA5k
	mvq+sh+JMpS070wNtSLF4mDSsYbhLnx7DNCBY6JEIAeYet9ulTqXJBb3MHe2S6UmeIO8xvgskbZ
	hIlxOp6B7K1rE9kCFHaJyvXwnNMyFGn0PmOgpeCE6NH0GYmZOxEgfTppPRLZgbMv2Z9ZVAIcKrW
	PBaIw81kzUgrOuREX6H61ATFcH39NEKnY7aA/1peY2WVI3e3zvFWXBmJWeYcbTbV0zjDd/0y2ma
	Skv7jGGel51LVNH5UczBKTwSEW8iZ2vriaVdqAZO6HJGPR9FlBFM6J8Q=
X-Google-Smtp-Source: AGHT+IHckWZ4Zmqgngr3HglCZr4AquYHliN4dZVtohCeeipZhQom/qfD2zWCfOQFtVElwxlYywtNXA==
X-Received: by 2002:a17:903:380f:b0:24b:164d:4e61 with SMTP id d9443c01a7336-2516d531c06mr160527835ad.13.1757457692920;
        Tue, 09 Sep 2025 15:41:32 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a27422e30sm8043835ad.23.2025.09.09.15.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 15:41:32 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: linmin@eswincomputing.com,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH] cache: sifive_ccache: Optimize cache flushes
Date: Tue,  9 Sep 2025 15:41:27 -0700
Message-ID: <20250909224131.276800-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_154134_105450_8836A864 
X-CRM114-Status: UNSURE (   9.82  )
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

Fence instructions are required only at the beginning and the end of
a flush operation, not separately for each cache line being flushed.
Speed up cache flushes by about 15% by removing the extra fences.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/cache/sifive_ccache.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index e1a283805ea7f..a86800b123b9e 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -151,16 +151,16 @@ static void ccache_flush_range(phys_addr_t start, size_t len)
 	if (!len)
 		return;
 
-	mb();
+	mb(); /* complete earlier memory accesses before the cache flush */
 	for (line = ALIGN_DOWN(start, SIFIVE_CCACHE_LINE_SIZE); line < end;
 			line += SIFIVE_CCACHE_LINE_SIZE) {
 #ifdef CONFIG_32BIT
-		writel(line >> 4, ccache_base + SIFIVE_CCACHE_FLUSH32);
+		writel_relaxed(line >> 4, ccache_base + SIFIVE_CCACHE_FLUSH32);
 #else
-		writeq(line, ccache_base + SIFIVE_CCACHE_FLUSH64);
+		writeq_relaxed(line, ccache_base + SIFIVE_CCACHE_FLUSH64);
 #endif
-		mb();
 	}
+	mb(); /* issue later memory accesses after the cache flush */
 }
 
 static const struct riscv_nonstd_cache_ops ccache_mgmt_ops __initconst = {
-- 
2.47.2

base-commit: 9dd1835ecda5b96ac88c166f4a87386f3e727bd9
branch: up/ccache-flush-opt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
