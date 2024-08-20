Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C92C3DA4A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 08:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SOrXLZyzB/4U6hDxcmBljohUn/gJ9rHse+Z35kxPMkU=; b=GydPl6bzJjkFyA
	Sedmo0i8s6oYhMAkg2OtVUVhu3LsYQCjhYWhW1FKfBF9j4wIJcjPmPewR6bZQybEIz4A1xUU1tilS
	1gE6tBkGlNPE6R7lgwMWFK72zHQHLTMsjPKTw/ooreCxLXjogeFBHb2zAnipJcHPW49aEnzAcCrZQ
	+1SuXC5vDLwtOgO2L21MQSdAy/qDAI9d6HIVxYdYFin2HHAWJsvNtxa2zuSW0rqCqtMDCfD4IM8vI
	dZyI8m9ZQOHrXvH34i40LNZBTn2Qa6keIiB9cecBm6wNGPQYg+ED+jzA0BBMRlmxklDRcP9PBni2v
	xKtF0NLbPDPp2lV1kzvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgKS1-00000004QsL-38ou;
	Tue, 20 Aug 2024 08:42:50 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgKRy-00000004Qri-30Y5
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 08:42:48 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2f3ce5bc7b4so29317121fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 20 Aug 2024 01:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724143364; x=1724748164; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2PP/VAgEIyHL1KqSWiO//9a8kNH8xXXjnkMKoqwockA=;
        b=F700TNRIkzaI48d8Y/lwKIPMB4+XHyej0EBKPPNkFzW8cYRTeVcsubmIgetL8hVMsx
         6J41+EmCBBNW6F/965IGrPQcdjL+46BvLkcDKM3GQUG9bzINmSLJlif35++eL5Mm/Ci1
         4n7YqimpUdokeD0BZXQjEJ8yH8/FLOV3vqQK6ROotG+5h+Vi8El1YFuNAsUMK28OEA6+
         hge/qTpp+j7KuGFKMr4chF4ts+U/N26ouwfLo5in7F26yxpQpnLLGqgv6lG3HmasRHiY
         a2zP79YTgNR5kwkzoum1tRbnPxlMFNgVFi6Dko7FHM9yZEi8NNBrNWK3OoVdPbvUBwxM
         VJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724143364; x=1724748164;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2PP/VAgEIyHL1KqSWiO//9a8kNH8xXXjnkMKoqwockA=;
        b=mK1xu6/3BJUVPyerFlYSy4VPIKts4lHT14HW/dz2g/YGIV5d+zLOvos+irefwgtqxw
         tl1udXb1P7hw/bJ7U9+ZcnPnWVgpA2aJd6JR7Bqmu6TMSF6Bw6J5dAoS4xAm3x9sETNU
         cINAIDJHAmEWu+fBUZiEUHB7ZMxiLyhwPdxpJ39dzjYzgs9BM/Eu82/BtbBlgjxS9+1z
         OXjQxZfmBFxPho6nArqcMikEsT5Rs20nxyETTnxD/hWZFFlN0WT6f4/hAfTpTI6Cn76g
         VYDZcjaD5hTg6nrlL2TvN9TMXrZ43LjLEC83Q/ZqHu/XxfxvRtfTrV6xHFqGrNJE9VU3
         ALMA==
X-Forwarded-Encrypted: i=1; AJvYcCVK+x0Vncj5fcohFs/OWzLgo4VuKYgFpsabVwn6mq/AZ+r0LRTXLFBsGouqIGxQoEm1iEWOAWNYHUy7TqdZsQFATye798U0vZNDN7OwQVBR
X-Gm-Message-State: AOJu0Yzlk0ljxYcGJIKnf+0r6MIaxSp/vtgN9MVh/QkzSNGn1DTJiZ+B
	lGEMMf5u6HpAeej1SL24Y71O5ioUMjGjgBgNDDevI8XOASbSNPHA0owD0tV2sXYiPa4nOPwPPz/
	vI40=
X-Google-Smtp-Source: AGHT+IHyMvSwXLRRmCjKbTOz+MEieevfpO33ioQwKGl2Doy+5ysz84GRgquXIJdiF2lrdI+nfWga3w==
X-Received: by 2002:a05:6512:6ce:b0:52f:d0f0:e37e with SMTP id 2adb3069b0e04-5331c6dca58mr8439534e87.42.1724143364033;
        Tue, 20 Aug 2024 01:42:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a838396c306sm731716766b.208.2024.08.20.01.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 01:42:43 -0700 (PDT)
Date: Tue, 20 Aug 2024 11:42:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] irqchip/riscv-aplic: Fix an IS_ERR() vs NULL bug in probe()
Message-ID: <a5a628d6-81d8-4933-81a8-64aad4743ec4@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_014246_778126_8842957A 
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

The devm_platform_ioremap_resource() function doesn't return NULL, it
returns error pointers.  Fix the error handling to match.

Fixes: 2333df5ae51e ("irqchip: Add RISC-V advanced PLIC driver for direct-mode")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/irqchip/irq-riscv-aplic-main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
index 28dd175b5764..981fad6fb8f7 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -175,9 +175,9 @@ static int aplic_probe(struct platform_device *pdev)
 
 	/* Map the MMIO registers */
 	regs = devm_platform_ioremap_resource(pdev, 0);
-	if (!regs) {
+	if (IS_ERR(regs)) {
 		dev_err(dev, "failed map MMIO registers\n");
-		return -ENOMEM;
+		return PTR_ERR(regs);
 	}
 
 	/*
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
