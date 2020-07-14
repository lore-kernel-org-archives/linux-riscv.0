Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2642C433E2
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 10:01:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F28D21D7A
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 10:01:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q3rJsz18";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmXTJUa/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F28D21D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=52tzTuw/v1yNfYrUesNhXwNKJnwESiuoP1fuY8VnH8Q=; b=Q3rJsz18xwyabnCj0Ww49pNIF
	r1NWkcKQZc8yTESDX6PKsabnrJAA3XNtVFs18bd8Lm1wdS9amupj5EyzNlb1J19HJS0IBoh4JNetW
	Estk9kWtsNHm68RAQQ1AbwqGQULRqTBPspAGNidOQIZOYO8fyz3UmkVMSpdmGS8hBUQRIm3Uv0Sb7
	TSUXZqg3iwWrmBnu/XSv/iTzHYXu3H9Qnuc2pDbbQl72oZYcyWlNNE5CxSukguB+XBlwFTRrPbqwz
	2ekKtGfGIDQ6XOO607oM6Nl8XjnU31VcPjeu1ak5pbo3AcI/io8jEDUbPD456itGkNtgBvHoDg1JQ
	OtGtZxZ6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvHkD-0002Mx-DV; Tue, 14 Jul 2020 10:01:01 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvHkB-0002Lu-Qj
 for linux-riscv@lists.infradead.org; Tue, 14 Jul 2020 10:01:00 +0000
Received: by mail-lf1-x143.google.com with SMTP id u25so11004552lfm.1
 for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2020 03:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Eq+bIFfgQTb97v8yD8SXsGZ7hBTmnEuGWYIyVfq/yxU=;
 b=bmXTJUa/NPv6xyRiKkgFitbcpxXaiYXtbbYCjLiWxLc/M7TOu15LRXq7w8Koo1rTsz
 U9585Xr4NHZ5TACcqihcfUjSUDOW4A/9KPn00CGLB5PAYWUl0qP4zVZ7ZDxSssYQdkSj
 A6VPDexIAyTOvKHiNepId/o2LEI1duF4LzJ6bfFiaJ4CAn/bjwcK2AB70Y7A17BfAKh7
 Ke3IyNUyFjSCh16DfkF5wv20Bm94vvdSpFj9wxtmZBg+6KKzKikB/kucivgQscFXSFHh
 j/N5cKsoHz7FnJSpvwj1MpUsoh1+ZgyLL8wHVBNuBkeJVGbf6U0Mw9AdIIYqQn1lWNr+
 a/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eq+bIFfgQTb97v8yD8SXsGZ7hBTmnEuGWYIyVfq/yxU=;
 b=QhGv674I9+kpJg8uzASyRsD2rOo2Gdetcpl9vsMRy9E6epiBjUPYRgtf+Wsi/+21Vn
 7hn1NV8F9YwDkXrCi/J/moUqdoCjh8VWHBh0bd1QBiF8Rb9k6Ji/qUlcz6gj7Fa5cx5X
 XtvCbWaI22R/v/SS41ovICSdNJY6sQDdG0DmSzD8VvJB18YqmwbMod2El0xZyXNokUCi
 Uyhn9cMa4+jFH5Q0HSSaTMh//T3A+s70Z+3MR/+wd1i1ZG8FpwuvKrR/ZcjvngTVma64
 F5XKaDrkyEC7Eu+oRV2dVHMU5kNP9vwLdDDXpXqHvrPq68NoKfYoyWZFY/GXwT/dgxON
 F/lw==
X-Gm-Message-State: AOAM532q74ATvEQ4ep9B1NhGTxtdTkprKdimrTu6QvdS0M+TAU/TS2RP
 uFJDAjozlJuew/H9CYrFrIufpSBM+MM=
X-Google-Smtp-Source: ABdhPJzIfk16yByHSm/GWbMUoJ750bDhxTfXbs7iGoNYmwZcfvr86sgAnBKx57CtXoe3HDMB/oylfQ==
X-Received: by 2002:ac2:5a50:: with SMTP id r16mr1898543lfn.170.1594720858025; 
 Tue, 14 Jul 2020 03:00:58 -0700 (PDT)
Received: from nero.bb.dnainternet.fi
 (dyn9cmyyyyyyyyyyyyyft-3.rev.dnainternet.fi. [2001:14ba:2fa:2500::9])
 by smtp.gmail.com with ESMTPSA id y22sm4560279ljn.2.2020.07.14.03.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 03:00:56 -0700 (PDT)
From: Pekka Enberg <penberg@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Subject: [PATCH 2/2] riscv: Use generic pgprot_* macros from <linux/pgtable.h>
Date: Tue, 14 Jul 2020 13:00:51 +0300
Message-Id: <20200714100051.345018-2-penberg@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200714100051.345018-1-penberg@gmail.com>
References: <20200714100051.345018-1-penberg@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_060059_893564_EF59E862 
X-CRM114-Status: UNSURE (   7.19  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Pekka Enberg <penberg@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Pekka Enberg <penberg@kernel.org>

The <linux/pgtable.h> header now defines generic pgprot_ macros also for
the no-MMU configuration, so let's use them.

Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Pekka Enberg <penberg@kernel.org>
---
 arch/riscv/include/asm/mmio.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/riscv/include/asm/mmio.h b/arch/riscv/include/asm/mmio.h
index 56053c9838b2..aff6c33ab0c0 100644
--- a/arch/riscv/include/asm/mmio.h
+++ b/arch/riscv/include/asm/mmio.h
@@ -14,12 +14,6 @@
 #include <linux/types.h>
 #include <asm/mmiowb.h>
 
-#ifndef CONFIG_MMU
-#define pgprot_noncached(x)	(x)
-#define pgprot_writecombine(x)	(x)
-#define pgprot_device(x)	(x)
-#endif /* CONFIG_MMU */
-
 /* Generic IO read/write.  These perform native-endian accesses. */
 #define __raw_writeb __raw_writeb
 static inline void __raw_writeb(u8 val, volatile void __iomem *addr)
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
