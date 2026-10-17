Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB67CC6B2A
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 07:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJDJbKLv5jbXUc5i+76eB2v8kamKP4IJrUOcFaqcsoE=; b=PLdmJk9hX9ngbR
	C9nElHFbt3EyrMEsxXPr7FXlwpLwJHjBxopdZSk8YwtvbW9JOcCBKQs73y6BFo4uI5TMfnrD8Nbnt
	xaQbjZBXyW2PTdT0GR3NwRBDGLJoaPXvWnJORgNHLWRui9B1LQYLunbXKwmpwPCZ/SJ6oH5jhsvPR
	KVuCI0zuY3PKXbP3oaE3VUzwwCRrWIyyY4XLxt6uyM/2pLM/m7bWF7i2g9KXHnKAo41wdK2422qPm
	o4dg3d33O7zpxA1tfqubp3DtnX6+3VexEolJ9T2JpzWdSQOCBCrV7i0cFiJz9fLRrMEOqDqVNAPHc
	bl3KJIIgJkrMY0XLrmZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHz6v-00000004XoD-2G4B;
	Sat, 17 Oct 2026 07:45:45 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHz6k-00000004XmI-0gsc
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 07:45:44 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-5ea93a316aaso312658e0c.0
        for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 00:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792223133; x=1792827933; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xOJGjg+lvYDLo4dWg7JB5b8p1Kepu54TYn5d9QR27hI=;
        b=SvAuMhFxnWwQnQckWzbx2xavcQb7BqrwOAQZURYacHXy1OceTiyRbcZP/cX3KocBtr
         7MMB2su4QBoHMhxmqK1RGjvsmfXJCw9Wz6Gbxnuy+fO5AxDX6+jct3CT2sg1WuLoz+at
         ZoRp1bsW7JYvvaqHN8P3j7tNYDqr1vDB6ZebHeQCrmt89wvkuvJUNYbl1EsTK7F+0lwy
         pPnd8w2QkOVfqRR6iNW/XK95pFveiP6L2HERSNqG7RiG51dPBPlOCqn96+s1JBQ0EFwq
         00g/HswgJft5byDdZ3wutQ2vajl/zOy518uXTrkdpu9hXmD/WRHOL0ya9ejhSVo6hdUR
         OWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792223133; x=1792827933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xOJGjg+lvYDLo4dWg7JB5b8p1Kepu54TYn5d9QR27hI=;
        b=0+NthD1Da36oPyBmZNeT0/h+EogX0WnMd1Syv0Yq/V+p/HKNBm7P4RQNf6ai0ahubs
         IQsxkw7oehJ7K9h6mNd16Nthh+bm7ZewrEOTpzA5QH7+6zUaOX+cJm/2M5rGKSb5fv3g
         raRfF8tZ++ucpAwigI2NhSTFLN0OA3n3bEcuZ3rN2PlE4fThoKEzYn0ToQ0TjN9B9bRG
         iVwXH6XIexOZT0dlfP8xwHJ7uZoNcHqsFCg79XHa8/xzGLWZEQ35Wy5oQpUnegKv8g+4
         nL6hrkuPw2+//VXtduqc6A4/95DEb6rOASWJbGmKCJUx9PMVtm9WS/F3N5DbPsUDz8ZM
         /9hQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBoEcjlmSovpVtXQvESPS4ePQ3Uul8+tt0bsU2GpFblQ9civRiIJ13itl59iBJ3jJ2OPTZUmD6VPmhNQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLBgG4cQz9sC5ET9OIcKKD/i92te9VFiNaeMeQJcJDp8HfW0pUX
	FDFkoRPb/FSQsVXO/pmrCU69x6AJkrTsXirNj8yx8SSwX2infP9nLQd8
X-Gm-Gg: AYBFou2xvI1KHFASkGtPGqhs5sE9cR99jyDkY+XfNNkdsVfJaUQuoOGgf1EDpcBCWpC
	44d8X1SatI+W6cVV5uEIGBHJj0d/BYVObD/tQhhjhgMH0gFuLQ0Xm4/CoYKPrTuUoKDWGTsYmV5
	0FtsS+oMMwNy7xus9eF59BVVISl2AEs/KdvyfMYUXwl05n3C4NqOUBZBTgb0Lds4nVeT/O9FfvH
	FOw/Dk/JBA2s3fg8ZEOavbHWCaYCxcYTxwJsahgYAZEp0Hp3oW2saArIfX9DDclFwOhtevEDKBt
	28jB8TCUVy9Zy//npDT1Bke6eaHf/qa524+vqEzI7TxSyvxGVHlnFBCCJJ9+ifuB9MVRR9BEQaY
	hv92fBMlwpuBRBXNXs35RmaPPDcFCQop6I/jZG6dSe3TACVT0Pn/wrGFAuPs0lIRPoHPGmJBOnV
	oNDw6ACCCQ06/hyYk17FfEzdvpapwy8whvF3Arv0GPASZ6l7laKNFGBcF/N7BJ7SpYQo7QsfyLA
	j4T0mrjoieLZvtkyACiSKX+yA74ojhxVkyjmYHyQABCnUk5MjduNdLiaVKzwvs9
X-Received: by 2002:a05:6102:161e:b0:7c2:b682:606f with SMTP id ada2fe7eead31-7cc3672ad8cmr521911137.1.1792223132871;
        Sat, 17 Oct 2026 00:45:32 -0700 (PDT)
Received: from localhost.localdomain ([186.151.100.62])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b53cfdfsm3701836e0c.15.2026.10.17.00.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 00:45:32 -0700 (PDT)
From: Sebastian Alba Vives <sebasjosue84@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com
Cc: linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sebastian Alba <sebasjosue84@estudiantec.cr>
Subject: [PATCH 2/2] serial: sifive: avoid division by zero in the clock notifier
Date: Sat, 17 Oct 2026 01:44:53 -0600
Message-ID: <20261017074453.62645-3-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017074453.62645-1-sebasjosue84@gmail.com>
References: <20261017074453.62645-1-sebasjosue84@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_004543_488102_D55971FE 
X-CRM114-Status: GOOD (  15.61  )
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

From: Sebastian Alba <sebasjosue84@estudiantec.cr>

sifive_serial_probe() registers the clock rate-change notifier before
it initialises the two fields that notifier divides by.  ssp comes from
devm_kzalloc(), so between clk_notifier_register() and the assignments
a few lines below, both ssp->baud_rate and ssp->port.uartclk are zero.

A rate change taken in that window reaches:

  PRE_RATE_CHANGE:  udelay(DIV_ROUND_UP(12 * 1000 * 1000, ssp->baud_rate))
  POST_RATE_CHANGE: __ssp_update_div() ->
                      DIV_ROUND_UP(ssp->port.uartclk, ssp->baud_rate) - 1

On RISC-V an integer division by zero does not trap; the ISA defines the
result as all bits set.  DIV_ROUND_UP() therefore yields ULONG_MAX and
udelay() busy-waits essentially forever, hanging the CPU, rather than
producing a clean oops.  The POST_RATE_CHANGE path additionally programs
a bogus divisor into the hardware.

On the FU740 the UART clock is derived from the CPU clock through a
synchronous divide-by-two, as the notifier's own comment describes, so
any CPU rate change during probe can hit this.

Initialise uartclk and baud_rate before registering the notifier, and
bail out early if the notifier is ever called with no baud rate set.

Fixes: 45c054d0815b ("tty: serial: add driver for the SiFive UART")
Signed-off-by: Sebastian Alba <sebasjosue84@estudiantec.cr>
---
 drivers/tty/serial/sifive.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index 4a445d285..cd2925b6a 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -604,6 +604,9 @@ static int sifive_serial_clk_notifier(struct notifier_block *nb,
 	struct clk_notifier_data *cnd = data;
 	struct sifive_serial_port *ssp = notifier_to_sifive_serial_port(nb);
 
+	if (!ssp->baud_rate)
+		return NOTIFY_OK;
+
 	if (event == PRE_RATE_CHANGE) {
 		/*
 		 * The TX watermark is always set to 1 by this driver, which
@@ -1022,6 +1025,11 @@ static int sifive_serial_probe(struct platform_device *pdev)
 	ssp->clk = clk;
 	ssp->clk_notifier.notifier_call = sifive_serial_clk_notifier;
 
+	/* Set up clock divider before the notifier can observe this port */
+	ssp->port.uartclk = clk_get_rate(ssp->clk);
+	ssp->baud_rate = SIFIVE_DEFAULT_BAUD_RATE;
+	__ssp_update_div(ssp);
+
 	r = clk_notifier_register(ssp->clk, &ssp->clk_notifier);
 	if (r) {
 		dev_err(&pdev->dev, "could not register clock notifier: %d\n",
@@ -1029,11 +1037,6 @@ static int sifive_serial_probe(struct platform_device *pdev)
 		goto probe_out1;
 	}
 
-	/* Set up clock divider */
-	ssp->port.uartclk = clk_get_rate(ssp->clk);
-	ssp->baud_rate = SIFIVE_DEFAULT_BAUD_RATE;
-	__ssp_update_div(ssp);
-
 	platform_set_drvdata(pdev, ssp);
 
 	/* Enable transmits and set the watermark level to 1 */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
