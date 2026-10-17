Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712DECC6B2A
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 07:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d24StZ/3ryHci7tSoaWSS3K66TGmLE/FXb7yIa5bVF8=; b=sfW0pAFriTqga4
	NionODGy7eJtHFVmjdoECpWS6Q/2lYV44jUQvzOuBW8FvERQy2aMjAkcF8yEThlH9dXHoBx8eOBnH
	OH3ymUaUbouKCvwdV6Z+20N4BH1yRa0jkuizw0DzrIdGAfyqZ/Rod4Vr8DvDkTDrytMh5Azaz43kD
	RKH1aqJy3V36HL0mqGHRllWXJWQpbZIJzlW29eG85C3NAnOiZ/Y83h8qOIF1YyvVzedJlZlPLAyYJ
	oMF1BVxv76SPSztb5Q3HahmPvcD+KUwXrKg4QgG7BH7t2/iZNyAgkBhbQp2rqbdOg1lcnn2AW3p4j
	bM4Gsa5KsVDjXxVSvbjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHz6j-00000004XmJ-2KaV;
	Sat, 17 Oct 2026 07:45:43 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHz6h-00000004Xlc-2OmU
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 07:45:32 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-988bb309c2bso331706241.1
        for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 00:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792223130; x=1792827930; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7+MRhp20Qv6qzPEtCEOr1Z9CVtBjcSUa4+hS0qMlh6k=;
        b=fw28wls91Me/fc6MFggCh3JsbNiLYq1FsyKwALxgjpzGT6QHWqsexSNRjb1POBx9uV
         mRqeaczLJt3qE38+B7zMxJmDn38pl+e9yyy/2V8Vz7hF2Yk8etmlanKKay0mgLNivdTy
         qiHPDZKSmR6VTpp5Q8YsyVMxvXKx+vG/YEZE5049+JJvrNQIRYM6WEygWkzHsuz8ZiZI
         yqoGjlDq08yLwi3bselxW2RW13+9yumw0sTqob8YW1yBh5Kw84t0Ec0xF/W1hZCbo139
         eZ6VXPXivAn+Vs4lFEOC2hLJpxOogE+lTlxDbn9pLa4BJfH6Yegy8yaC3r4nBmAV9UPx
         DgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792223130; x=1792827930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7+MRhp20Qv6qzPEtCEOr1Z9CVtBjcSUa4+hS0qMlh6k=;
        b=T7eo6TCT+9FTJr5NFWoR9iLSVQJmsQsagZ/4oXNPt7tHfiL0JooxAm0PLRd5rBWEnu
         gkTqud1k5aDad0h0S6RI4a4uOy4896vSK64WozSamqqL8sM/5kCFnKAkaUkUR/n4IJVz
         FaMavqKy3konkY2+dN3SzGe+2UwLVase3XxnaekfREZurcor2vtY2cbqTyMMsSN8TZk0
         ILJeOXWIKWyJ6F2ajhwEmIwnJnBOp8M8Ox13Q52K2MnyFoSSlsV7Tf2McOKboKDnGrSP
         Zkghm1zK1XDYpAFd/J4yyqg84Y855lyJd2TRDJkSUCx7brGPgm6o3tjcoR6J/m9DusJI
         cDhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxk20lvYaVqPa2tV/ui+gjVB39FykFj73PkxEKkYSzGdi3TCuzj7Bb1UBQtG9e6VXT2+Uho6aVkz6Vu7g==@lists.infradead.org
X-Gm-Message-State: AFq9FYIhy/w76xwfOtjQBFWhziUwCdn1l8dRvD66q//Qe1kpXvJ+jXOs
	Ycq0+G9vR475Wu/FPkgW0l4UrEBhhd5WIsFS8ZCVO4EZQOjVCIf+OSNHs/niVkBt
X-Gm-Gg: AYBFou2/LZjYdkr6nhMn+ZSWZz9ekusrlGJ76Tm/ukL3oTNE2oikYVSu03hFvwuDHmo
	xHnqvXu+Z2WWnkyllZAHyfe9PaJ5EAyaXX15sQkt/WjLOHeEpW5tTmkocVaNQoLfMAcFjZ4kaJl
	bOW4sZj/8FbHG1Vd4hfOe2RdhPLX/Lk5NPkMprjYq2rk2TC4KEbFa/2LYpFS4kOLrnB/ycphRhh
	t9K7W6wVy4V+sU4P7Nc03jVXMe17wOqT6Qhpv1W6BL7FJKOR+iuhM+nHpnW91n/mC+vVLDk89ll
	JVf/EM/73YsK+cjF59AiNGTt22nU7axRLt+GPWf77jeUZCqw+gs0VWnyqLroRUwk3VJ77WiKQ8k
	UZUKS8qAQI4iFuoG9uTmZybJQ7EUlE8PV6vhI2tpdWx8GeFl5j3a8ExBm0wY6JvVTeuXcc3kFC6
	B8H9IR8n4bVsNAWyPPotBkV7KGmQd2er4OgzF0PYBhJB53ulfpZl6KL9S4JBVIXyHBhhwRsmHYP
	xUnedFBP+P3o+b3BGRFUOaGzK5enmIznhrRlKSJqLeqjVRBOxHA3Sv6C9M11Wk=
X-Received: by 2002:a05:6102:41a2:b0:7c0:4d52:8cc9 with SMTP id ada2fe7eead31-7cc36997787mr569456137.14.1792223130340;
        Sat, 17 Oct 2026 00:45:30 -0700 (PDT)
Received: from localhost.localdomain ([186.151.100.62])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b53cfdfsm3701836e0c.15.2026.10.17.00.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 00:45:29 -0700 (PDT)
From: Sebastian Alba Vives <sebasjosue84@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com
Cc: linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sebastian Alba <sebasjosue84@estudiantec.cr>
Subject: [PATCH 1/2] serial: sifive: fix NULL pointer dereference in probe IRQ window
Date: Sat, 17 Oct 2026 01:44:52 -0600
Message-ID: <20261017074453.62645-2-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017074453.62645-1-sebasjosue84@gmail.com>
References: <20261017074453.62645-1-sebasjosue84@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_004531_625202_0EFCC325 
X-CRM114-Status: GOOD (  17.42  )
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

sifive_serial_probe() installs the interrupt handler with request_irq()
before uart_add_one_port() has run.  uart_add_one_port() is what assigns
ssp->port.state, and ssp is allocated with devm_kzalloc(), so
ssp->port.state is NULL for the whole window between the two calls.

The handler dereferences that pointer unconditionally:

  sifive_serial_irq()
    __ssp_receive_chars()
      uart_insert_char(&ssp->port, ...)        /* port->state->port */
      tty_flip_buffer_push(&ssp->port.state->port);

so an RX interrupt taken inside the window oopses the kernel.

The window is not purely theoretical.  probe() programs TXCTRL and
RXCTRL but never writes the interrupt enable register, so IE keeps
whatever value the previous stage left in it.  If RX watermark
interrupts are still enabled there, or an interrupt is already pending
at the PLIC, the handler runs as soon as request_irq() unmasks the
line, with no timing requirement at all.

On a HiFive Unmatched (FU740-C000) the vendor firmware leaves IE
masked, so a cold boot on that board does not hit this.  The realistic
trigger is a handover where the previous stage leaves IE enabled, such
as kexec into a new kernel while the UART is in use.

Move request_irq() after uart_add_one_port() so the handler can never
observe a half-initialised port, and explicitly mask the interrupt
enable register during probe instead of inheriting whatever value was
left there.  Unwinding is adjusted accordingly: uart_remove_one_port()
now balances the added port on the request_irq() failure path.

Fixes: 45c054d0815b ("tty: serial: add driver for the SiFive UART")
Signed-off-by: Sebastian Alba <sebasjosue84@estudiantec.cr>
---
 drivers/tty/serial/sifive.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index f615701fc..4a445d285 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -1046,27 +1046,30 @@ static int sifive_serial_probe(struct platform_device *pdev)
 		     SIFIVE_SERIAL_RXCTRL_RXEN_MASK,
 		     SIFIVE_SERIAL_RXCTRL_OFFS, ssp);
 
-	r = request_irq(ssp->port.irq, sifive_serial_irq, ssp->port.irqflags,
-			dev_name(&pdev->dev), ssp);
-	if (r) {
-		dev_err(&pdev->dev, "could not attach interrupt: %d\n", r);
-		goto probe_out2;
-	}
+	/* Mask all interrupts; the bootloader may have left some enabled */
+	__ssp_writel(0, SIFIVE_SERIAL_IE_OFFS, ssp);
 
 	__ssp_add_console_port(ssp);
 
 	r = uart_add_one_port(&sifive_serial_uart_driver, &ssp->port);
 	if (r != 0) {
 		dev_err(&pdev->dev, "could not add uart: %d\n", r);
+		goto probe_out2;
+	}
+
+	r = request_irq(ssp->port.irq, sifive_serial_irq, ssp->port.irqflags,
+			dev_name(&pdev->dev), ssp);
+	if (r) {
+		dev_err(&pdev->dev, "could not attach interrupt: %d\n", r);
 		goto probe_out3;
 	}
 
 	return 0;
 
 probe_out3:
-	__ssp_remove_console_port(ssp);
-	free_irq(ssp->port.irq, ssp);
+	uart_remove_one_port(&sifive_serial_uart_driver, &ssp->port);
 probe_out2:
+	__ssp_remove_console_port(ssp);
 	clk_notifier_unregister(ssp->clk, &ssp->clk_notifier);
 probe_out1:
 	return r;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
