Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444B9CCF9FC
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 13:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p3yQ40pnuoYCbJQ85BYsti3+mMZWMxqe3j5mJrxPcFI=; b=2c4o0gVMsfzd1c
	aQ0VyvXrqBi1yrbBgaHesjNiOW1KcXazjkl3Hlzb2TF85qaSt1jUAg/UMCU5Pypok+98dg8GWZ2Hv
	8cfSrJxwhse+yIhmJfi1n2rBQMyPN1hFAjsjEBxjajdjeJDHJ8YaFu2ShJPG5fWFb445v6FvU++N6
	a1YzYau6q10ORQ5K02hhrgiHBYuviEJqvzBWF5shZiu9R4X8kKJCRcO2/FZDA4hEjWPny3x9Rpp8w
	9L15glOPTSs9bByZgpmzGXoGeytwPDdb3BgggkU4It1tyvoJUDZYVoOLRkpxLfUfE6kCk4MKh7sRF
	wWZPJwMGQBD291c9Rc6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET9P-00000004GCc-0tA2;
	Thu, 30 Oct 2025 13:57:15 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET9M-00000004GBr-1p1D
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 13:57:13 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-294fc62d7f4so6474755ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 Oct 2025 06:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1761832631; x=1762437431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idtv0RG1n1Xu/2siY10CA00hyxq2ZPaiF1nMz1aq8l0=;
        b=MNSP7AVn3+4ds0/bnphSWDcftLMqFZsS5ZKoxxsHYQlxAPym1vxR26ZuPoocz4v1UN
         Nbl7M7+bmCzkqoSmzg676ymsKNtuDDFdSzxJTxEKpkDPb+2nG5KwGeaY+CurRNGVAInw
         bT4gMP1OFTmLNflVztnkJdhq/kVkYcoJKxrZRV1uODPYEf4DvCTvBwdbrYSLDRcEGa2b
         EJQ1lxTZnZSysqMxfluugfb15DrywBYkyj6456BeYzhnt0M2g6B90aVEV/OVfArAuXz0
         wGLNk5U+EVOb+uz4pjPMdPFFwEpf1GajZJzR/Nb52+dCpmB2ZLsSyVqihS5+QrpQbWO+
         mqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761832631; x=1762437431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idtv0RG1n1Xu/2siY10CA00hyxq2ZPaiF1nMz1aq8l0=;
        b=uOI1sulK39i2vlcukYbT2K0or2ND9GnJpA+5oLpTALZriCSy/PLUT9hJp5B+gRMD78
         TUXOSzMu6sHqw4UeRJeD9kS9FHO8Io4n0nLxuxlXK2IqOn4+LoRcNCaALXoZJk1r5DT2
         AXEb3QQsudYevGX5DDU8BWrDeBI03wQruSAkMt5bklDTKTC3h/zTc5I7+QL5TVaDJMNW
         JMcWzDyquiwrzL9xT5mxvotilboyJTLjXhNfBTbQ+JfRVJnokoGY1NnXXuuvfP7YVvBN
         lG4oZbOjNOjQ0pYCBg1RTwIu7mxQythXRNCMpdLw5/qMR33Q4Vh6NSXnhMLk9DDkEP7N
         GZNA==
X-Gm-Message-State: AOJu0YzOmoCj02o3+oCkBdybWhnrlHA0/P3sZ8oD7ynQrxPEQxp2WssK
	Xmtt0gtCHnogBhBbDtfOzdH45vXmrLLYJN5n/0b092P57OboEZohd6jgEkvMdS5JtKo=
X-Gm-Gg: ASbGncvE765bEq8CYc7YWVe2uWORRQAabL55tbCu3BoJCD8N93lbSBAFDUWnfmHy0ag
	/w7bBjqsp6NXJ/A4z9jVuXPxGfk9ZlkoCLw8JiRl3Bb8nILprrsOXicP8Qt4VwR9HkQaEFCYNiz
	x5PJxht7s33d36k3XLcCAvLND7yMZXyot7isk+LUrnEnrGjdMp+WL+MoWfCp5t0trQD6hTjq5Q4
	rI7ROrsuiUGsDRkeZowQzkRjDR4EjkoyLu58PP6/olZ0uaAl+Xm27qitmnjlmxot4/VkQYdHlf6
	5nunK45FPSmSBzx2f3Mfz0XXHrqsLaHXDCl0mEzENFH1bsMzzz8dnnELhinbGmV3dvlWCt/XIWt
	/M4LEcUrCalZTn/mOB7TxbzMYUaLxrpcf0dMiJGwTm+STV5ztC7YEvd+vefp+4ZMR5qAxKvvzxQ
	hLQQy0uJnTHH5SHkK2kjhRUDzEu9er2N93eiPHSD5+weWjawSF/8Exz+NgG6fG4sU=
X-Google-Smtp-Source: AGHT+IGbOUAtM2+Lu3qbpwcnntpyy8m+vA1T9owmvZzuSyODN0ovPcBr/za3iDV2dG9ZYLAg2yY1uw==
X-Received: by 2002:a17:902:f682:b0:294:ec58:1d25 with SMTP id d9443c01a7336-294ee0a0fb8mr33408495ad.50.1761832631190;
        Thu, 30 Oct 2025 06:57:11 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e495e8sm187071905ad.110.2025.10.30.06.57.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 30 Oct 2025 06:57:10 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	apatel@ventanamicro.com,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH v1 2/4] riscv: mm: Introduce percpu tlb flush queue
Date: Thu, 30 Oct 2025 21:56:50 +0800
Message-ID: <20251030135652.63837-3-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030135652.63837-1-luxu.kernel@bytedance.com>
References: <20251030135652.63837-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_065712_473750_1FCA9F34 
X-CRM114-Status: UNSURE (   8.49  )
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

The percpu tlb flush queue is used to buffer the tlb flush tasks that
each cpu needs to process.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/mm/tlbflush.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 8404530ec00f9..aa8f1304ae5c4 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -103,6 +103,18 @@ struct flush_tlb_range_data {
 	unsigned long stride;
 };
 
+#define TLB_FLUSH_QUEUE_SIZE					16
+struct tlb_flush_queue {
+	struct flush_tlb_range_data tasks[TLB_FLUSH_QUEUE_SIZE];
+	raw_spinlock_t lock;
+	unsigned int len;
+};
+
+DEFINE_PER_CPU(struct tlb_flush_queue, tlb_flush_queue) = {
+	.lock = __RAW_SPIN_LOCK_UNLOCKED(tlb_flush_queue.lock),
+	.len = 0,
+};
+
 static void __ipi_flush_tlb_range_asid(void *info)
 {
 	struct flush_tlb_range_data *d = info;
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
