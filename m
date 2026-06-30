Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E69BC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 09:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YjXrDuL5IFGYTa9Bf7FEAb+YxzVF+Bo11lhghoaFE8c=; b=GbubsHMhhArzw3
	i63B4Rgsttwso2Q7/SJropFc+J598FIk/ZpS+fmPeyU3b3s53FuBEhoxbgdJ4dpR+5bktJ7C2UjZC
	ku/Z4X9urlnWu1wnYxqueKnqpKzDTbF8z+m+gDT+2LB6WPYrFHVPkRx6iRz5c8zALmW+yIFqGwL4I
	92yNX8rNhVYudoqQ/CudLXX0dMwFOKxhPE/5c/LCR3RrHh7DLvvaBThIP4/BrI7YTHdkd02Teu9zI
	bgqGRfFCrFycMjw16ypXhV8THjlGUIfLv20NfOaAiGLVZuq/KPS6VjLa8+C0v5koOkikKTnAaYQdG
	qPs5SRxPjmHZ/fZauKYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV4F-0000000GW2h-1vao;
	Tue, 30 Jun 2026 09:47:47 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV4D-0000000GVzK-0OuK
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 09:47:46 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2c82da9504cso12324795ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 02:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782812864; x=1783417664; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCd0Rjz6Hwu0tTfmpV0ijwjuzSLgPDCGqWDTMjcsJq8=;
        b=aNZbWAxazaH2q7oWc7woPKACMQ9RPNvDXFDis+JS6h1IM6323EPE40GeKHxN61A5HT
         LL9xtnEjTYzCTaxBUjneUicXWAEsJ/sdsFwBSE5O77KPz/hgTEQI5usGS/8afirk/B/3
         uBx12C6B4zpA3RJy6YY4uX7QPFr+L2OiJNDH0DgbZbH+3U8NpyHMwB8lU0F1y9l2h12g
         GJUAw0hv2qJVLylH8uCtcgDP3R+wLb25W+c1s8mGKvvHbU7GHTDiev/XbipOfzz1EPll
         9zEQVZQFexSOVlsfHy0PKCHnJgp3SOHgI729sHMJ5ofKAouH09q3/mMHPCWjEqYZpLP2
         6uuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812864; x=1783417664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fCd0Rjz6Hwu0tTfmpV0ijwjuzSLgPDCGqWDTMjcsJq8=;
        b=KDAy1uwu3WOYxV8jnGvCYm1nUHXUeMXdbIirCU/EJR86He27ky5Huv/2VN1z1zs1Ko
         x68+ufbNBLNQ0ewj4/V6SbkXTDXwaluEKYymDLJcawtwXyoruOAr8DDdVFAWdubtcGYh
         Vcqwh8EhQmAzbGOF95dlHl3rUE2/Bsy+5RmzyuoStv83mx/6oDVOXace6rR4+uQjfqyd
         D4X3zhdBURxUubq9kYsh3zbQLUJtAGXw8iVh+WHsOSABFLtuGSCdLYzZr6UOyopmizcS
         nTJTrNg+N97tu7JJTr4BWPfYULE0WRY++l2fzjUTDrJnk1laDRSx8R8hk7VSxVZnD2od
         rTAQ==
X-Gm-Message-State: AOJu0YyhsMdnPDi8eJCYNS73nmjX/OtAaxXKkA9uq9gmlzGYQVgZeycQ
	pcHxAV3fBW0nC0Ol1n4FxEnL69fRbaUEkAeaKK+S37ANrI2qTssbEfxuKAko+5Jast8=
X-Gm-Gg: AfdE7cmI5jWEM7v+4Yq9wjLCFJRHcKfqw2d+Xt6FsMmmAuqMS3I/d38ZC9b47qarWA0
	T3EcVE9RZBeIXbpfsVWp48nWCcKKLz4vJExwiAtfw0kGf9LoAJqZGPjsgngExeWPyVu96f14cy/
	TWUxMZ7Ahe2ysdKAo/RbsE9c7mEvVAy3WUftwEEN911W6H2VSEHHltGdQTZve4nEj3TmCahWcDD
	f/MhSlI/YowFl29GOLPQ00WDj5GW6xacnM60tew3+nquh28MlXafyHQY6SYdtDuWYYQYU8LJy25
	W+HYbZle6pJk8RMyCVTG0NL34XqgsDC1LJhIjsVHE17Sl8f+ZdqyOI0uDOrHcAdTcUv3TgUbrAJ
	URI0ior5VJkf2mcdVsQrJNS1ophQc4Sk/y0aCKFO+wJ0GLqpnirqcB9aCvD1IUkns4VLTwvlYw+
	MtmDKamoxv2LSaE/bpvDc94ANlh17uH/Ys+tzoggZC/Q==
X-Received: by 2002:a17:903:94b:b0:2bd:8395:fedd with SMTP id d9443c01a7336-2ca2ed6765amr21739245ad.37.1782812864165;
        Tue, 30 Jun 2026 02:47:44 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW.local ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c87bb8sm10144675ad.30.2026.06.30.02.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:47:43 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 30 Jun 2026 17:46:35 +0800
Subject: [PATCH RFC 12/12] rvtrace: Reset RAM sink write pointer on every
 context switch
MIME-Version: 1.0
Message-Id: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-12-c9c1ffc64e4b@sifive.com>
References: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-0-c9c1ffc64e4b@sifive.com>
In-Reply-To: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-0-c9c1ffc64e4b@sifive.com>
To: Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Greentime Hu <greentime.hu@sifive.com>, 
 Eric Lin <dslin1010@gmail.com>, Eric Lin <eric.lin@sifive.com>, 
 Nick Hu <nick.hu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782812801; l=4041;
 i=eric.lin@sifive.com; s=20260630; h=from:subject:message-id;
 bh=iA92P89O8Fbr2v9RT5UY8ZtumXveAuMX3tRI4pD1FjM=;
 b=lsjfiPDk1AqzyEu8JGuSbv04BwI0yhfgIRKiFCOzihuc3tq96944PXrWZW1Mj/zfGVzQhjkBX
 Mhdd2tOT0HLC5GYyT/7/pzcoPOsKXN8HnIk4ItWwXsKEBB0vu/IlQNE
X-Developer-Key: i=eric.lin@sifive.com; a=ed25519;
 pk=RLPQN6uNJ1cSM8GhP+L++2j3pf5ohznFbkNdwIO1XDw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_024745_160001_86EE23FE 
X-CRM114-Status: GOOD (  17.81  )
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

Currently, rvtrace_ramsink_copyto_auxbuf() only resets the RAM sink
Write Pointer (WP) when a buffer wrap occurs. If no wrap occurs, the
WP is not reset and is left at its advanced position.

This creates a highly non-deterministic tracing environment. For example,
consider a scenario where a user traces a program: On the first run, the
trace data fits within the buffer (no wrap) and the output is perfectly
captured. However, the WP is now left near the end of the RAM sink. If
the user runs the exact same program a second time, the hardware resumes
writing from this advanced WP. The buffer quickly wraps around,
prematurely overwriting the new trace data and resulting in unexpected,
incomplete output.

Fix this by unconditionally resetting the WP to the base address of the
RAM sink at the end of every data copy. This guarantees that every time
a trace session starts or a task is scheduled in, it has the full
capacity of the RAM sink available.

Consequently, tracking `prev_wp` is no longer necessary for calculating
offsets in the non-wrap case, so the data copy logic has been simplified
to always read from the start of the buffer.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 drivers/hwtracing/rvtrace/rvtrace-ramsink.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/hwtracing/rvtrace/rvtrace-ramsink.c b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
index d89cdcb971dd..8e9cbaa70f16 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
@@ -59,7 +59,6 @@ struct rvtrace_ramsink_regs {
  * @stop_on_wrap: Whether to stop tracing when buffer wraps
  * @mem_acc_width: Memory access width in bytes
  * @regs:         Pointer to register offset definitions
- * @prev_wp:      Previous write pointer position (for incremental copies)
  */
 struct rvtrace_ramsink_priv {
 	size_t size;
@@ -70,7 +69,6 @@ struct rvtrace_ramsink_priv {
 	bool stop_on_wrap;
 	int mem_acc_width;
 	const struct rvtrace_ramsink_regs *regs;
-	u64 prev_wp;
 };
 
 /**
@@ -202,25 +200,25 @@ size_t rvtrace_ramsink_copyto_auxbuf(struct rvtrace_component *comp,
 	wrap = wp & RVTRACE_RAMSINK_WPLOW_WRAP;
 	wp &= ~RVTRACE_RAMSINK_WPLOW_WRAP;
 	if (wrap) {
-		rvtrace_write32(comp->pdata, lower_32_bits(priv->start),
-				regs->wp_low);
-		rvtrace_write32(comp->pdata, upper_32_bits(priv->start),
-				regs->wp_high);
 		src.cur = wp - priv->start;
-		priv->prev_wp = priv->start;
 		/*
-		 * There is no way to tell if trRamWp wrapped around more than once. As a
-		 * result priv->prev_wp can't be used and the entire buffer must be copied
-		 * even though some data might be duplicated.
+		 * There is no way to tell if trRamWp wrapped around more than once.
+		 * The entire buffer must be copied even though some data might be duplicated.
 		 */
 		bytes = priv->size;
 	} else {
-		src.cur =  priv->prev_wp - priv->start;
-		bytes = wp - priv->prev_wp;
-		priv->prev_wp = wp;
+		src.cur = 0;
+		bytes = wp - priv->start;
 	}
 
 	tbuf_to_pbuf_copy(&src, &dst, bytes);
+
+	/* Reset WP after trace data copy to perf AUX buf */
+	rvtrace_write32(comp->pdata, lower_32_bits(priv->start),
+			regs->wp_low);
+	rvtrace_write32(comp->pdata, upper_32_bits(priv->start),
+			regs->wp_high);
+
 	dev_dbg(&comp->dev, "Copied %zu bytes\n", bytes);
 	return bytes;
 }
@@ -258,7 +256,6 @@ static int rvtrace_ramsink_setup_buf(struct rvtrace_component *comp,
 		return -ENOMEM;
 
 	priv->end = priv->start + priv->size;
-	priv->prev_wp = priv->start;
 	if (priv->end <= start_min || priv->start >= limit_max) {
 		dma_free_coherent(pdev, priv->size, priv->va, priv->start);
 		dev_err(&comp->dev, "DMA memory not addressable by device\n");

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
