Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045FBC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 May 2022 04:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dU2pUmIi6mYVq5AFoNnxppk1CqJTTvypXa5VYvE7CQs=; b=B1S2O8TdNdVWrX
	3wBCtaNKnXnsxz/2RIThk75AzkzBJbDggJhJxtQZ80WV04tRmtwgEoQZc3QL8V6PQZ7SR+xlzGRvv
	qnMQI+pxbSyB36KhaYCAWzpRG1HbryfR/UZwws35g4XD3WSYnTBsTWoJXbhAonZdUPazwfeE9midf
	f7eoEe9xy21d2NGwubUAR2jFNJ5PUwjMrnJyqfbhGy57c+UJePVY12/PLRHrYbwT2kYTyOapds2pH
	n0x/8zHEF9XM2wMR2Qquo7rrD+IVvwwksbM24LAZiOwnyqH63JsPS4egq8qPZ/9hID4tz+Ed+6pIu
	FUhHDfecJI+2F2pxODKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuRbs-00Ga0a-TN; Fri, 27 May 2022 04:30:00 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuRbn-00GZyA-BJ
	for linux-riscv@lists.infradead.org; Fri, 27 May 2022 04:29:56 +0000
Received: by mail-pl1-x630.google.com with SMTP id w3so3134669plp.13
        for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 21:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sz8Wl/RrPE6IxYREExHJEvcGrtIm/VscBM/l+yLFVg0=;
        b=O8Ot85XQfFBVKkDqvEOJGeHmdMBuVSr4MPIFzwpcNxuB68h0dXMLEofL+CLpF5g+Hv
         S3iwmZm+iyRtWBRkd0acwDIrdJJb8PLyilM2z4tRl98SGNb5s5KD0cV7quTasQP4Jz2Y
         j+PRYtjWKLAx9Sosd/LRZB7HjrFZkx7OptRBEXBhYtMSeV6y+XBa2+46XvPV6RanwGXF
         m79pH2FNC74yoHkOyBa/u5zoSaC7CPbjgvB8poKQOaM0P3WmoteW99ppT68oQRSlN7ap
         5G62RcS5oj9ml4GqKw7B5+j2pUH+oym+VgWFqv8dBtHXRMLXqs3kCvw9OV8tXWgBr4ia
         fMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sz8Wl/RrPE6IxYREExHJEvcGrtIm/VscBM/l+yLFVg0=;
        b=Wi9FazTLgSFxEGxa5puzq4eUO9sVHDVZMyE3ILTTUmok/TeclJZ6JmTFqCTotpdUan
         3vTpnRGm3QJ4PMJtQqqqoFDEuiTybP3wZ5dzrvM6buxoqyJ07v5bzhHqOzkD1CIViRdX
         Iz1mt0PzZS9/PmUua167ngVfjPN7Rmd5wK0r7DdF2wRA2yM2eBquvQKSNa41Cidf6e3g
         kSZvQ56YdB8nBLiTBujy2JgacWT2J00gnuGokUbBd2gQD8n602+pUsOTGdAEsh/xNi5F
         poRUn8/eFxuchYDPnGpiKOOdQgieLnOggNW5H8ui/E7rlc6O83UXnCSSj0cqcRzKoteu
         UBxA==
X-Gm-Message-State: AOAM531l2bG43EHjpyXO8M44JmPQBjIUhuMA4sZ2tAlj+Z4pdjh5iAzz
	Rx/QC5AaDD7TRUOoUwK0HrBrEA==
X-Google-Smtp-Source: ABdhPJx6ek+jDxXvyWji9WIdx2QzKtt1rf6kKQxEPnGvkNB4j6S3Y5drdcqAN/BXPbdO5S4ajBGpFQ==
X-Received: by 2002:a17:902:ec8a:b0:161:7ca5:ece7 with SMTP id x10-20020a170902ec8a00b001617ca5ece7mr41422447plg.141.1653625794246;
        Thu, 26 May 2022 21:29:54 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id y63-20020a638a42000000b003fadfd7be5asm2352307pgd.18.2022.05.26.21.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 21:29:53 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 3/4] RISC-V: Prefer sstc extension if available
Date: Thu, 26 May 2022 21:29:36 -0700
Message-Id: <20220527042937.1124009-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220527042937.1124009-1-atishp@rivosinc.com>
References: <20220527042937.1124009-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_212955_465980_1CAD2FC1 
X-CRM114-Status: GOOD (  13.38  )
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

RISC-V ISA has sstc extension which allows updating the next clock event
via a CSR (stimecmp) instead of an SBI call. This should happen dynamically
if sstc extension is available. Otherwise, it will fallback to SBI call
to maintain backward compatibility.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/clocksource/timer-riscv.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 1767f8bf2013..881d9335c92d 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -7,6 +7,9 @@
  * either be read from the "time" and "timeh" CSRs, and can use the SBI to
  * setup events, or directly accessed using MMIO registers.
  */
+
+#define pr_fmt(fmt) "timer: " fmt
+
 #include <linux/clocksource.h>
 #include <linux/clockchips.h>
 #include <linux/cpu.h>
@@ -23,11 +26,24 @@
 #include <asm/sbi.h>
 #include <asm/timex.h>
 
+static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
+
 static int riscv_clock_next_event(unsigned long delta,
 		struct clock_event_device *ce)
 {
+	u64 next_tval = get_cycles64() + delta;
+
 	csr_set(CSR_IE, IE_TIE);
-	sbi_set_timer(get_cycles64() + delta);
+	if (static_branch_likely(&riscv_sstc_available)) {
+#if defined(CONFIG_32BIT)
+		csr_write(CSR_STIMECMP, next_tval & 0xFFFFFFFF);
+		csr_write(CSR_STIMECMPH, next_tval >> 32);
+#else
+		csr_write(CSR_STIMECMP, next_tval);
+#endif
+	} else
+		sbi_set_timer(next_tval);
+
 	return 0;
 }
 
@@ -165,6 +181,12 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 	if (error)
 		pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
 		       error);
+
+	if (riscv_isa_extension_available(NULL, SSTC)) {
+		pr_info("Timer interrupt in S-mode is available via sstc extension\n");
+		static_branch_enable(&riscv_sstc_available);
+	}
+
 	return error;
 }
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
