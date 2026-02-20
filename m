Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA0DC5AD69
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 19:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WSfyOxI5gGq+E/RsuXs1o+2ez9dTBL/VfosiD5ARgsI=; b=o3fZdhT9Uw+Q6+
	6QzDzdjRR0r5TfWHj6boWmn/z5ol/iFsl1PJepV1QNUfsO9XIKfmCx6wbnm8SYlUpEnfC1Mv//D3Q
	CdYNgSRPba1eEXWWmP7mglsQsxH8QzDsCMhgaZUWoymflSqFeFVWR2XGrrBIvIVmeKnHvwpRHcoEZ
	MsT3P3X+wR1L2Lhu8tYBeeprcz5unAt7Y8WEUsOBKaCChQ7iLWeeqlwlzvV83LarzcDnopYXuINrp
	+a3B4TDap7n8cogyAJbuXtEdv/lr8kXIL6+r/f9brsFBg5qlJlVMH0gT77t5j2nrBZEqWlIJLD0tB
	/rW6O/M1CJ+05u8DKLQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtWQF-0000000FWVb-0LCa;
	Fri, 20 Feb 2026 19:44:19 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtWQB-0000000FWUp-3IDe
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 19:44:17 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so14628685e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 20 Feb 2026 11:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1771616654; x=1772221454; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=exW6wJ5MettYqKMw45/sBx+PnMDuRihL33c51S/rlCU=;
        b=QTznWuTHo6K27lbP9gyRKpAscUFXuH6kbhc2Hn1Pvs1EAhKTuYyK1bBcbZRAAh+Oxw
         M+1xwXC4TozSqojcYhxOjITeVdHhJUqybW7XbLOKXTAi2Rl96Kh8JUxoXGMYm3qfOh7R
         q3lUhdwK+PFVEs0z0ljSwN19hiMeZhMz0mZPBZH3ejczrrbtmZdc8QVGlcXzq0Zs0uF1
         X9qGxo3wuVIC+SnciBK5m6IjcLFF+fncz+q9Y6hO+CN1wIWgoiNZSpBr6QMZLDYrtlQF
         6HlvnhyF3GzkDkC9HdU4D7IYlo4pB3Jz3IhftYSXmS7ZCzw29Dq3G/7LZDUSfbZ3CFz4
         +FRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771616654; x=1772221454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=exW6wJ5MettYqKMw45/sBx+PnMDuRihL33c51S/rlCU=;
        b=DectCna2SkrNjLrFL7j1r7IJRlIX5XUoX1aAH6zJ1fqm5oTHRL+4sFz5PnR1UtRdJW
         2bsoSCe9dauUuy1k/4xdGPeth6YZUpgUNBWO3O4otVP7XqgC6U8Tg4Tzikz9YnXsTNaA
         UhSlJvW6fAa1gxYun2gb3rkc/3SOGoVObmugijmC4/hY3Ksj6jWoMs4sQZG73D8S7hBh
         UaDeWc/xcVjzemhnxDvT1c3kEcVsaolwrNBUtlbx5BgIh5B+0HaC7IxzW+qU1KEduQqb
         ge4cTRRyTx/aczN0LTJRmr/xINzg9VQeksIOTnbYN7Ke/Hvhz+PLQcA9l+gz/K5NXPja
         cQbw==
X-Gm-Message-State: AOJu0YzxNXDQi5FoaFqq4lTjcceUTz0IV+vLWwZ1pbVnclqjXnn7bUz9
	9A26ZEDuN47x+tYMoChuKoqTmMTSsR2zJMJ0jT5mG9zQ6cXfyWub0rrdhzIsvXGQ/Oo=
X-Gm-Gg: AZuq6aIADaRFO/5WpE7AK+yIGPSoYyQtSy5WOWbqGpmaJtuszlSF7jmwBpCk69xui1p
	EsL0D6D1zwzzN6Kszo80q828vcWIeVMPCVwFyMCs+Ebp4CxAi5M9qGYYIK8oVJs0jZZzZoA45U2
	JF4QYZNltyGmgsrZNwH9eQktVOaGsmRcROBSOtUUJ9MI5naP6YaHPKjT6LNRk9Gt7NpdtEwBeRN
	FwVG3YAFBitxiah0mYi1PS2bZdE9MxrCN+X5DnbDXUtlZb9LqApVQjxuCQhSii6G7A5KV5sLZnB
	L2TAc53koFcXPIdgTToZuhGBUmdCu3vY+RL0WZeiquRBNCRDgD+YyJnHMb3RdvfHmjlQEjLP63c
	+2Qnhhgc9l4uQquCxWlt05+ERYwjvLcpggraxrYlrKJDVu4ir1qq1LBov9uZ1t15xOUZjbPSihG
	/k6lABL9Kq+YJ11Ssa8HSK9TOgLAKunSI=
X-Received: by 2002:a05:600c:46c9:b0:483:6f37:1b51 with SMTP id 5b1f17b1804b1-483a95ea9c9mr9114085e9.23.1771616653836;
        Fri, 20 Feb 2026 11:44:13 -0800 (PST)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3e1b7ccsm24460755e9.11.2026.02.20.11.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 11:44:13 -0800 (PST)
From: Max Hsu <max.hsu@sifive.com>
Date: Sat, 21 Feb 2026 03:43:54 +0800
Subject: [PATCH 2/5] dmaengine: sf-pdma: fix race between done and error
 interrupts
MIME-Version: 1.0
Message-Id: <20260221-pdma-v1-2-838d929c2326@sifive.com>
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
 devicetree@vger.kernel.org, Max Hsu <max.hsu@sifive.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2398; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=HZw/m+iZYxEGcuIZeLOrzXaThPDTnv+UpkVRVzMpSOI=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBpmLl71dxWi5B+zksLXjlly23frduiErFqlc8fz
 Z/otqlEM4iJAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCaZi5ewAKCRDSA/2dB3lA
 vcuoDACgaeWfX7TSgRc1yNCZNUpKCUjEzSewb3vD7LvYIUVNGUfInacZIz+DBH6FaLxFB9wtTAQ
 J7hyWDGbq5fOphtYG/+4mE1K4SYEXr7LLG3QI5plJqhkgVzy+NA+JNUKWt7z5Nc/70t5KXh8KlC
 cjjhkknMwzd+BtXvy30eiEvVSqmaeyy/8UIDqAT/4/pwDmCkAaV1EcWgzyK4LdRlHHE99mNiKo+
 n015Nh6m2BWRuSkkm1MYESTug3DX3WC6/ByMs28nGKB/DxyKtrAtMT6Mk+tQWuvPIPvxHnpo3K7
 avJD/L46htLvCT+z8SyM6kU1J+V2zChbhqoEA/K3aJ6uMaI2AcAYuTFj5kkPJtoepUMvRQusLap
 RAJJT6K8glfyHNIGLIfhWibLjyIkXfOxNEM0a2xoRjY2Ko/Ri9BxAbGjt/4kz0IA8h5UKMXZ0xu
 +nDU6BCnE4e7YBBie6Zj/Bpg57kOAiQ/3C9GLsC7Uj4B0Ennz3k7dOUaZugVOuQEE/n3s=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_114415_845084_F567A39C 
X-CRM114-Status: GOOD (  13.46  )
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

According to the FU540-C000 v1p5 [1] and FU740-C000 v1p7 [2] specs,
when a DMA transaction error occurs, the hardware sets both the
DONE and ERROR interrupt bits simultaneously.
On SMP systems, this can cause the done_isr and err_isr to execute
concurrently on different CPUs, leading to race conditions and
NULL pointer dereferences.

Fix by:
- In done_isr: abort if ERROR bit is set or DONE bit was already cleared
- In err_isr: clear both DONE and ERROR bits to prevent done_isr from
  processing the same transaction

Link: https://www.sifive.com/document-file/freedom-u540-c000-manual [1]
Link: https://www.sifive.com/document-file/freedom-u740-c000-manual [2]
Fixes: 6973886ad58e ("dmaengine: sf-pdma: add platform DMA support for HiFive Unleashed A00")
Cc: stable@vger.kernel.org
Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 drivers/dma/sf-pdma/sf-pdma.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index 7ad3c29be146..ac7d3b127a24 100644
--- a/drivers/dma/sf-pdma/sf-pdma.c
+++ b/drivers/dma/sf-pdma/sf-pdma.c
@@ -346,9 +346,25 @@ static irqreturn_t sf_pdma_done_isr(int irq, void *dev_id)
 	struct sf_pdma_chan *chan = dev_id;
 	struct pdma_regs *regs = &chan->regs;
 	u64 residue;
+	u32 control_reg;
 
 	spin_lock(&chan->vchan.lock);
-	writel((readl(regs->ctrl)) & ~PDMA_DONE_STATUS_MASK, regs->ctrl);
+	control_reg = readl(regs->ctrl);
+	if (control_reg & PDMA_ERR_STATUS_MASK) {
+		spin_unlock(&chan->vchan.lock);
+		return IRQ_HANDLED;
+	}
+
+	/*
+	 * Check if DONE bit is still set. If not, the error ISR on another
+	 * CPU has already cleared it, so abort to avoid double-processing.
+	 */
+	if (!(control_reg & PDMA_DONE_STATUS_MASK)) {
+		spin_unlock(&chan->vchan.lock);
+		return IRQ_HANDLED;
+	}
+
+	writel((control_reg & ~PDMA_DONE_STATUS_MASK), regs->ctrl);
 	residue = readq(regs->residue);
 
 	if (!residue) {
@@ -375,7 +391,7 @@ static irqreturn_t sf_pdma_err_isr(int irq, void *dev_id)
 	struct pdma_regs *regs = &chan->regs;
 
 	spin_lock(&chan->lock);
-	writel((readl(regs->ctrl)) & ~PDMA_ERR_STATUS_MASK, regs->ctrl);
+	writel((readl(regs->ctrl)) & ~(PDMA_DONE_STATUS_MASK | PDMA_ERR_STATUS_MASK), regs->ctrl);
 	spin_unlock(&chan->lock);
 
 	tasklet_schedule(&chan->err_tasklet);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
