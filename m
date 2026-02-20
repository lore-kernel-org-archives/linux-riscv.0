Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B1FC5AD69
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 19:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+tlpi+rW1QaBvwo7rqtC20ZlyblnhZDaSf2CtMWWkf4=; b=eW5psN8wx2LmOe
	Rz+RPOB/ToUi6tTn99Ml18clo4zFI81aViUaggIeJPjKSJXRFJ24u8YB3FnJ2zPjIbW0nY1IhIv3y
	LW3Um+GcYlrtmV6knfakn7M7eC2TtXScoHIBtPa9GeirYCJG2jHv2u/y3MnR372GtK/x1uz3hjBG/
	ACJt3B/Q1trpuJKA2EU3lQA7e418vHqVJ/ZheRvMQXtlXF9U+ISGBGGj7uoNOqBHMyxlIP1du9fgq
	t/28ox124MQYyjfp9cuur+wv4yb0o//TsbKQ+seWhuLRik8jjFM89USJu1Mv52guXJ5Zgbb3rZerP
	pYFhMlPgPGlzwkveAvfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtWQ8-0000000FWUU-3Hp1;
	Fri, 20 Feb 2026 19:44:12 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtWQ5-0000000FWTc-3mdu
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 19:44:11 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-48373a4bca3so15114565e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 20 Feb 2026 11:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1771616648; x=1772221448; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8dE91IsiM0t5/CAeP0M+B+4hbTqf1CMxbF14VFtvdJw=;
        b=LYjkut0hwgvyBFFwW53R2rVRAIBves/MDgDfb383Mdk8umuu3Gc0uEGtMuvRM++XVu
         rVHdRVaOmkWkfn4APEZYNeKaSzA5Vpl4D37sGrA36kSXO2K8IDoCbtj1Bq3m/zfIHOKk
         LF16g2FTINe/LcWykEjsKOScpoTDzb6JMej4+RsoQFeNfrFFprFK/lGCRL041vTc42EK
         c6UYrRENfCbfiYNlDJEAreJbCFmiS4mAgd9+OTHOV67jTdt4g/uoGSJxHmHg3Wa4hwtJ
         c+o/nghiJ7qjACw6HdR8DqFZR0rBfXtiSbDTFO4YMkyiW9YtIdNZ4+XGc8gm52AxM7/J
         4uxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771616648; x=1772221448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8dE91IsiM0t5/CAeP0M+B+4hbTqf1CMxbF14VFtvdJw=;
        b=vtNjugVNYNL13MJJtgVMR7PiR5DuwfHVw41CCTwtVXf6aqo04AU9GXzVeOj7md30B1
         09el6phlcgPrPcn7+pRWvmzBI9Pfsvrox+GAaAJz5DZsCr+lo3joUFZYiRmk294Ge0e5
         HbRLq/nc2rQCIxebV5X6PKee3G5T4Wf2YSQb3vk8ZwArLwRsvnCgfS9uw4zHJD4/HPgp
         4A8Oojax70k0O9th59DfmrgVLkVdE1nHAfHJk9BfPcSLGntEpRV/fHggB7mj12OtImPR
         JR1cQTQ8GKL3TkRo7kSXkRfO7OkQF5bnco9u2g2sxhut2kX4bRlyXaq1ylE4Hdm10vLA
         /lVA==
X-Gm-Message-State: AOJu0YwUg8CtTgZDyz62lBIE8takkk7x57f86WODDjiz2rykru1IMEvY
	fUuvgALEsNjImR+n0fGFYjIV46Hd+qJvAIAhqGVfj+rBY9UtjoLU+i9tsVYl2UZ9PbU=
X-Gm-Gg: AZuq6aJmFyVmytWpwNvKV+AAkK/08qK9QzxlIK/LrgifDnpD9SFlDSuRGl2hXSuCnhw
	zjwO05eW0u4M4p0zwcgC/sQuH2tY+zMNR7GBYNRF9V9HqESJ+geCzdMIM0UVaJbRPSf8BzTRH+z
	b3eIdhQWMyYs5OV182+vVU0/wF6bWl9vHfdwOcrzSXvNBmlEPpE+PaQ9LH0w34PeUcrKTfJzNfv
	2mFf/HVc96eCDH4Kj0sTiJZYicQiiPz++YU7j5kuCYPcOMRlsuuNXMyzBNQg3h99stBVmO6w5GM
	ZY5pG2Ns51muT6FiwzlAWYDRFtUyEYuHO+WLeSWcNG8Mh8OSodNHNEuBnfVFZOLQThaWuKPMWNO
	RhmQ/JzomOw4oG3krg1MwEsnC8JCj2wD8fQYy6OocHDXNcEJfoAAPPQooPT8qLUuDFlH7zA8jT9
	5Lwutd7Wpc7sVQ/tsB64SK
X-Received: by 2002:a05:600c:1c04:b0:480:1b65:b741 with SMTP id 5b1f17b1804b1-483a95cfc62mr12256445e9.15.1771616647672;
        Fri, 20 Feb 2026 11:44:07 -0800 (PST)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3e1b7ccsm24460755e9.11.2026.02.20.11.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 11:44:07 -0800 (PST)
From: Max Hsu <max.hsu@sifive.com>
Date: Sat, 21 Feb 2026 03:43:53 +0800
Subject: [PATCH 1/5] dmaengine: sf-pdma: add missing PDMA base offset to
 register calculations
MIME-Version: 1.0
Message-Id: <20260221-pdma-v1-1-838d929c2326@sifive.com>
References: <20260221-pdma-v1-0-838d929c2326@sifive.com>
In-Reply-To: <20260221-pdma-v1-0-838d929c2326@sifive.com>
To: Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Green Wan <green.wan@sifive.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Palmer Debbelt <palmer@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 devicetree@vger.kernel.org, Max Hsu <max.hsu@sifive.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=AnEa53opPbOu4dRIdrxYWqC5ToC/rveEHLt+0LxZ02U=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBpmLl7iZxRqUMek04x+o3lBeEEqeiLt2VR8OAQc
 Nw/cTkeEZ+JAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCaZi5ewAKCRDSA/2dB3lA
 vTvEDACAZT/DJRai2ns/tv7qnjMFStLTAaaFD0WsiEnykRMhHVFY6Ll9o/QQco3XuLtDkfk8yBW
 Daf1E7Za0anPZFcvzU631toudhRDqKH2nydxS+UUOB/Vg/gpJvoKdAqWFR+eriNyIIjMsmbOltI
 nqOk9KGfetnbm/fJUmLyoDhVl1Rx4jtXV/iuVXSWzwYIvQB6V/lwpGQKY56dcvNS8xZ2FDfUrmI
 W5sPggxYe/khEXJWJwW/mLijfNxY5qcQKU34zgROzAmv2xl3jkKMt4bdWb9BvlRy5gvGUNB0fyM
 Ay7XcscVkpnwITy9xM08B3UTkwmX4DMATt3qoiOaqWymJLQnoJ9fj7U2jDSEqPeidm2SQxhRCU5
 M5Okuss097crl0k3OlyjyVMuhDW2MJI5OYdotZfJIyHOU3j1uvh0vwY5tEhAMFbpJxgSqWUBQuv
 fkCEwPLbl+I3WeTPSpFLNwtpGPTiG45Gw1XWSs11pBChKJxiXkJIy/2c4p6XtbMIRUq2E=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_114409_964432_5F7A92F2 
X-CRM114-Status: GOOD (  11.59  )
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

The PDMA control registers start at offset 0x80000 from the PDMA base
address, according to the FU540-C000 v1p1 manual [1].

The current SF_PDMA_REG_BASE macro is missing this offset:
    Current:  pdma->membase + (PDMA_CHAN_OFFSET * ch)
    Correct:  pdma->membase + 0x80000 + (PDMA_CHAN_OFFSET * ch)

Fix by adding PDMA_BASE_OFFSET (0x80000) to the register address
calculation.

Link: https://www.sifive.com/document-file/freedom-u540-c000-manual [1]
Fixes: 6973886ad58e ("dmaengine: sf-pdma: add platform DMA support for HiFive Unleashed A00")
Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 drivers/dma/sf-pdma/sf-pdma.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sf-pdma/sf-pdma.h b/drivers/dma/sf-pdma/sf-pdma.h
index 215e07183d7e..d33551eb2ee8 100644
--- a/drivers/dma/sf-pdma/sf-pdma.h
+++ b/drivers/dma/sf-pdma/sf-pdma.h
@@ -24,7 +24,7 @@
 
 #define PDMA_MAX_NR_CH					4
 
-#define PDMA_BASE_ADDR					0x3000000
+#define PDMA_BASE_OFFSET				0x80000
 #define PDMA_CHAN_OFFSET				0x1000
 
 /* Register Offset */
@@ -54,7 +54,7 @@
 /* Error Recovery */
 #define MAX_RETRY					1
 
-#define SF_PDMA_REG_BASE(ch)	(pdma->membase + (PDMA_CHAN_OFFSET * (ch)))
+#define SF_PDMA_REG_BASE(ch)	(pdma->membase + PDMA_BASE_OFFSET + (PDMA_CHAN_OFFSET * (ch)))
 
 struct pdma_regs {
 	/* read-write regs */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
