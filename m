Return-Path: <SRS0=b3sz=MI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 593DEECE562
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 08:55:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09133204EC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 08:55:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I1hnJOt+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlpQoW6g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09133204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WNK8D9tMqAx1dBLTh1oxH1oNt6ABU8mXFXG3AiZf7Ww=; b=I1hnJOt+irTWVyVVw9WlBKrlbM
	dPXMN+WXE4n1v0sigHKIMHhOZRTVVwM+wv2OVshA9TmwxYavbSwmMhSF0mFCaQJk59Gw3EHTKB0HQ
	V5R9XbNKJsBZlmsLpvGannD/fp2CFJKLlCjHoettJjUiLX6ci2+eBM2TEmG9MFI8fkmkdri0lTv9s
	ATQq+2/21n6qJANgOIEq/6QuHwzHqUztC0tdpckRx8C72p1gsh9z0h3aKAYLd3BGXdQrHIYRQZke/
	fha8jCbJ4y8yu5cxPMxZ8udjC2icliRdoS3AISeqjPrD4vBkSQlrvmgAgfF2g3TIoiKLCsEwjcC4/
	WZC08n8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g55Ho-0004cX-9f; Wed, 26 Sep 2018 08:35:08 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g55GE-0004PA-CV
 for linux-riscv@lists.infradead.org; Wed, 26 Sep 2018 08:33:34 +0000
Received: by mail-pf1-x443.google.com with SMTP id j26-v6so13086025pfi.10
 for <linux-riscv@lists.infradead.org>; Wed, 26 Sep 2018 01:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UBDvynMlQ+CLa//vjhI1FniisjjUmkbIGiogOAJ0pDw=;
 b=nlpQoW6gTNn0ZvJ6d3TtBZiUM/dTyRg/qvqxtod61+lEcMu9xu3ryWfBe0YHMB2RJa
 3e0arhfbXSga29nBn5n4iAzoWkJiSTAI8yJGbLHp8THp0Tzs9S12z1ndhxXrGbBaRtoi
 OTtNLwvTftEWq1SB3fM450H0BnLUw9WKbs+oit5cHFcl/UBHZBTQwWzMql6NaS/yIGDC
 Sf7doqUJ/uR8LWqTqzBPmVdVbpVNngzn7k5Z5nWcgPxQKaunWeenhwlakMALH4E2Wrm7
 AxebaQHcOH/NgxOGnszKorbRPJFaKe3Wb/z53p/ehs3ZbQyZvOZPhHGj4BIlP2ceTj6U
 4Vxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UBDvynMlQ+CLa//vjhI1FniisjjUmkbIGiogOAJ0pDw=;
 b=ABC92Dicg0k8OCqNGj28tschBPQl4ab6nOMzqz873xBSZ1Hf550pjdzbigBMS6lGJJ
 dmt+ed1uvjXWrDLIQQQckn643YqEZaQmOQuyrfxYqHUJZTZ4E0AtF1A7fv/iKamE9iF+
 nbl9HJIdDHn/TmEyrS5aIKG2RUGLgra89fVa9lJr68eZKWWhToyodhAV8a9J0l19bH7d
 CQd1zeMR/6e/2zQX3hIJzh/mW0L1jLpbopJYC0PEwuZaJCWqhTEESF1E/quZeoWqGAax
 So43AOJ+IZ8GCxRbXVBUv0CuGiOoMISej5Acc9jY66Jy98CnXf6USQys1R5SKXdr0VTh
 hqkg==
X-Gm-Message-State: ABuFfohKqeHTrGZWaqSyg6KRQ68OPK1QlZaqPozkHjAOH/GFVy+gDQro
 FKGuv6i0RSAV2vV6cYvCna8=
X-Google-Smtp-Source: ACcGV61DR9IMLqNAjTlLRYHT+XOmYQ0I2xkfogfqOQ6H+2d+c2ye8dLxgkfQ32da6MFrMpv+/W/6Kg==
X-Received: by 2002:a63:1566:: with SMTP id
 38-v6mr4621863pgv.383.1537950786910; 
 Wed, 26 Sep 2018 01:33:06 -0700 (PDT)
Received: from app09.andestech.com ([118.163.51.199])
 by smtp.gmail.com with ESMTPSA id f15-v6sm5530764pgv.66.2018.09.26.01.33.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Sep 2018 01:33:06 -0700 (PDT)
From: Zong Li <zongbox@gmail.com>
To: palmer@sifive.com,
	aou@eecs.berkeley.edu
Subject: [PATCH v2 5/5] RISC-V: Avoid corrupting the upper 32-bit of
 phys_addr_t in ioremap
Date: Wed, 26 Sep 2018 16:31:14 +0800
Message-Id:
 <341d3a765c0078280eb99d49559b5f9a27b93fe4.1537949825.git.zongbox@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1537949825.git.zongbox@gmail.com>
References: <cover.1537949825.git.zongbox@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180926_013330_517245_63239864 
X-CRM114-Status: GOOD (  11.64  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: hch@infradead.org, zong@andestech.com, linux-riscv@lists.infradead.org,
 vincentc@andestech.com, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180926083114.4Z7IQCr5wz_d8Aaf59ARjrDs_F9v-YE4stsDFYbvE8A@z>

From: Vincent Chen <vincentc@andestech.com>

For 32bit, the upper 32-bit of phys_addr_t will be flushed to zero
after AND with PAGE_MASK because the data type of PAGE_MASK is
unsigned long. To fix this problem, the page alignment is done by
subtracting the page offset instead of AND with PAGE_MASK.

Signed-off-by: Vincent Chen <vincentc@andestech.com>
---
 arch/riscv/mm/ioremap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/ioremap.c b/arch/riscv/mm/ioremap.c
index 70ef272..bd2f2db 100644
--- a/arch/riscv/mm/ioremap.c
+++ b/arch/riscv/mm/ioremap.c
@@ -42,7 +42,7 @@ static void __iomem *__ioremap_caller(phys_addr_t addr, size_t size,
 
 	/* Page-align mappings */
 	offset = addr & (~PAGE_MASK);
-	addr &= PAGE_MASK;
+	addr -= offset;
 	size = PAGE_ALIGN(size + offset);
 
 	area = get_vm_area_caller(size, VM_IOREMAP, caller);
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
