Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6788AC3601A
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Apr 2025 13:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aS4M+fXuh2I47WESd6tqCuFJY1aqhuT16rBFglg1UpI=; b=nqo6wgcq2uH6Vq
	1+ySBGjPPvgPV9RD1T0wfiYHd2JjUigoN3uiVDJZ3hUV86TXv/yBrHWxvwgNin12twQ/Af7i4DOzn
	ZxoaTA4b4UIeLayyJDFzSYcfQr/ZA36apJd7cFu/9qCnvIFw02yiokd+J6CHn+MtiJJVgk/1zqb9U
	uLeUAS1SeDrjGjIOSo7Xliy+cpfM6Gr87hP0eucCy25d62wOYqQ4iivVuUmKiguX6RTvEkuETfgxl
	lxLupvo7NZ0Ilb7pDPpJzS0a4tTgtEgYvjut+xU9MFGVkhLjyMEAjOYw4Psl47y0cO7+CDtW8yMZh
	vvHJsd0sp5w37uTFBh7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u13X7-0000000DzdN-3IvU;
	Sat, 05 Apr 2025 13:26:01 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u13X5-0000000Dzcz-1RJK
	for linux-riscv@lists.infradead.org;
	Sat, 05 Apr 2025 13:26:00 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so2591980b3a.0
        for <linux-riscv@lists.infradead.org>; Sat, 05 Apr 2025 06:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743859558; x=1744464358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nKs0lwSpjYnhUeQPgpDR5O6PnIX9bK5Z7Homt3o7Oqw=;
        b=FauvuxrsxIaGG9p3wu1Jfuh1YHUp+LujT5RiLRu9DluPGMR4yWZjV3omQgbtMCbj09
         PZhf8jSkzFthC7HC0/qR2NVcviizVq6Nt1XSXrWyxyf/vfYyxQ0WWGubIVkDiFD54gmz
         ntNydzgiAoT+XEwkCCvFsX1Jj+8dWBa9s7OwJ5tIJZlrGFtdEe/RKUY/V0JFQebcZCCa
         /JsXC1qFaOAsAZUSQ8aHbg7x79Jf6eeMcuJXy8hUyIcIkBsWONqn/6gQYHt2qrrMF421
         hN8ZIOu+a1isRts8Vi8mj5ihHBZO1FjVuszvKMaeavFeVnl8XjgjthyxFUyDjKz//NND
         CEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743859558; x=1744464358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKs0lwSpjYnhUeQPgpDR5O6PnIX9bK5Z7Homt3o7Oqw=;
        b=OaXhQ9/U6sazOB0UeowofYkl2h6UwlUzeetrrWWrX2l8M0jPpCWT01ACl5hI70vpGt
         d7L8fTIC9hPjEthOSeZbZ9euiWncXPhdGTb0YROABdZsEiEtTwVJSfMxJdmzZWFyvheR
         dbXDLyVvIIlXD8AVW+aP0nN8PwEieAT7P6ch5x5ICwv9vLC8PYg8f3t0Bw6vdPxJJcUC
         xk8vXmh+WMl9kaZNr50nGCL/gxIVzYmhrE8N2/4tU+kfnSRs1c4lKMeahQIF38DUm2PY
         t4tZ6OGxMlMOoaDG2J2PATawILKy3lWhLhh6QZBSNAqoGZZykBauKyqB7CFu4CMeAI2G
         Qtiw==
X-Forwarded-Encrypted: i=1; AJvYcCV/vQJ+ljP0LkdVXiJ8L7yUBaucoRj5dVvKz6nfUOPhy1YGsTVn5WKmB3Jej3Y7EYTKXgNSFVyVInguoA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9tiGS0XBogzJBUqhf41XxnhsPqIkrNuRyD6k0SprRKcnUov2Y
	Y6AF2zBXMf8htPe363DRGyh5KtPxmxhGbzeBJ7wSeMb2EKTVbC2r
X-Gm-Gg: ASbGncuDPC/IhQB2Nc4nifXPX8QJkPoQ2eQ3S53TzcMDeMl2CK3XA66Lha/rBTiRWo3
	APp37HdFPhvwMdnnHQgWadJX52Vlua+LiF6zfeGHSSlWbiD/bFqh/9pLVmroVlJ8jolgSGEtA5H
	AXB8kbrpNaOnNBNnfU5fGIM9L4N8DaQDsNyA64QYoafKDSwacPPJbCkjXqU4LUo+mBIfvUsom2W
	DldQc/C6Wqbp4HkPxsuxSqHbyn2v+wQOq+6WsQasoCSao0S1Fqq4dCK7thhgQemW4OAFxaLehD/
	deOCcttCy/5qfxBEJ9Ca16yzK7lu9WGCVIyFwXNdEDpwiMn48mUnaEIZbXdFWkKBQEKvReQf7nh
	N2qe4e+BjmskdtUXU6a2K/lClIh+fztM=
X-Google-Smtp-Source: AGHT+IG1Q4lj2kvYXbd1JXXsWrnfajZnJiCpu1OsmZxghmbQZjNxXaov1rF97YvrfNBWxpHmvMDgAQ==
X-Received: by 2002:a05:6a20:6f05:b0:1f3:237b:5997 with SMTP id adf61e73a8af0-2010517563amr9491084637.14.1743859558310;
        Sat, 05 Apr 2025 06:25:58 -0700 (PDT)
Received: from localhost.localdomain (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ee2b3sm5200206b3a.46.2025.04.05.06.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 06:25:58 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bigeasy@linutronix.de,
	conor.dooley@microchip.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	john.ogness@linutronix.de,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pmladek@suse.com,
	samuel.holland@sifive.com,
	u.kleine-koenig@baylibre.com
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	stable@vger.kernel.org,
	Ryo Takakura <ryotkkr98@gmail.com>
Subject: [PATCH] serial: sifive: lock port in startup()/shutdown() callbacks
Date: Sat,  5 Apr 2025 22:24:58 +0900
Message-Id: <20250405132458.488942-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_062559_398686_7ECFC05C 
X-CRM114-Status: UNSURE (   9.19  )
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

startup()/shutdown() callbacks access SIFIVE_SERIAL_IE_OFFS.
The register is also accessed from write() callback.

If console were printing and startup()/shutdown() callback
gets called, its access to the register could be overwritten.

Add port->lock to startup()/shutdown() callbacks to make sure
their access to SIFIVE_SERIAL_IE_OFFS is synchronized against
write() callback.

Fixes: 45c054d0815b ("tty: serial: add driver for the SiFive UART")
Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
Cc: stable@vger.kernel.org
---

This patch used be part of a series for converting sifive driver to
nbcon[0]. It's now sent seperatly as the rest of the series does not
need be applied to the stable branch.

Sincerely,
Ryo Takakura

[0] https://lore.kernel.org/all/20250405043833.397020-1-ryotkkr98@gmail.com/

---
 drivers/tty/serial/sifive.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index 5904a2d4c..054a8e630 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -563,8 +563,11 @@ static void sifive_serial_break_ctl(struct uart_port *port, int break_state)
 static int sifive_serial_startup(struct uart_port *port)
 {
 	struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
+	unsigned long flags;
 
+	uart_port_lock_irqsave(&ssp->port, &flags);
 	__ssp_enable_rxwm(ssp);
+	uart_port_unlock_irqrestore(&ssp->port, flags);
 
 	return 0;
 }
@@ -572,9 +575,12 @@ static int sifive_serial_startup(struct uart_port *port)
 static void sifive_serial_shutdown(struct uart_port *port)
 {
 	struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
+	unsigned long flags;
 
+	uart_port_lock_irqsave(&ssp->port, &flags);
 	__ssp_disable_rxwm(ssp);
 	__ssp_disable_txwm(ssp);
+	uart_port_unlock_irqrestore(&ssp->port, flags);
 }
 
 /**
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
