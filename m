Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476F3C28B20
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Mar 2025 11:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KVsp9h1P33W7kW//Gft7YTVchzMcwf6IcjHQHSdn9cs=; b=Q8RfjiDf0tDmIW
	ZOeVZ6aNtJ6DcUfH+vtN6N78Q57nryxYsSifE7TLdkvFakxkyudqimaJf1TvgtRG6wr5/FQixpMFf
	Ysmx1dmrUkRNeS7OKTKO2xOt06LXU58QNbB4QpoLCrPkGX+ZHDrtcf7CzNBkEsiy201osenbsboGW
	T1MfFAlLGfUuShHLBXoG24tPjmeiMcFYUzSm+GovDiiiy0GYF3YuGYe2oJ/8Czhu7skyOAseXe0w5
	dwT5Jcs8YBbvigrXFeUS9hY+YPNOSMN/uXErWnkhijGid7Aj5N/PuAhXOMzf2umgwhQkD36e/66Lu
	ctVbiLf/ZW+66UVTQh2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyqdh-0000000G866-0L5z;
	Sun, 30 Mar 2025 11:15:41 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyqde-0000000G85g-2eAd
	for linux-riscv@lists.infradead.org;
	Sun, 30 Mar 2025 11:15:39 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-223fd89d036so78679645ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 30 Mar 2025 04:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743333338; x=1743938138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bOkg965odz+QE9cKXvYVRkNTxhqTHUa1qzYcFa9wPk=;
        b=gjLl02zzho9RPg2mO10BRhufpN1fxlU25YwVfhkRU22kfxQfQeZlQtoYvNRiRxAtt1
         ZXr168FKSuT20qAfW28QqMw6C3iLPJ+xeVfFTnJBgWTuVotgTY7/donpjKd7oGfzEyyO
         G50u7NuyRG9rrck90qsES7gpm6t4s9rrMbVG7BV5d7+HPd+NxqLOkxuv76EbEnMkSPa/
         0bEzITG/p57BPaUMWpZr51H6BPOsTo4obVNixSQZW1gvHqpQ7nWhIt1I0Gvs2Nwxicj2
         9jngozwMxdoLul4bvh03MKVT/13i+Ta01s7t1F4jzcSitGKOgx01nQof7rCkk1kspfvA
         DPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743333338; x=1743938138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8bOkg965odz+QE9cKXvYVRkNTxhqTHUa1qzYcFa9wPk=;
        b=ZBNO8AF8E6Gs9WIL/mKg2cbYVYDiWhWu33lI90ZtV9wyam/yO3tVbLhyCqTwk8Jvdw
         /1g2hfmjPssZxMSFHynAiEYUskE4HmyQWY6AbraWGzKQqjVLQCeNokXDLE7iKVU6fxHP
         JE/ibShQSSYG+5RAU1I1y+2YquKa9ZKMNSnzFqCe6lwFNgu45pZY9GhUFLmAYyJWsPxX
         jtbQDNQxgmVcqFGVXTOMQGjjlNI66q251s9PI4EbvFUDpbOJOojQG+hFPAya4cYFC0pO
         fFGujGXTKKtDkgYK9kdCABR8GBt8ZT4p2i10B31LHJ8Zvp/Ot25lQf8Y6zSD7Ub5jtHl
         oTqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAbA1XXU0p+XvsHvmY1JbZ0SdVkhYoQVsZgY3rKbowS1BZZ5zr7KRC7pFwz5+S4Ey6OC+KdNlYieR8fw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp7vkpt7OuBWKoAwTfL70xchLVgV2eJtdQOpyRqwB0SiH23npU
	KS+dyoitPxfQa0lfOO9qs7UGJ6UUaQ2a5TmH9pZn+4A8i5+9QHFY
X-Gm-Gg: ASbGncvSI3955xi+6CeqZhL6Yi31YfmsFu9sqVueAxPdenEIQfw11wajsqg207diNbN
	gqR0TLavZ7y13BW6KQ7g7uACcfojBRlVc7S4GTPPi4etZoPGU2v05W/3DgxMeVpnfzHya7vvB4q
	7h6QeDvN5kxcENJwzaa8cntrIcsbtI2AiYZ5ToalC4uTyZ+fTHxhYAUycYYvmSSCExhjjDGeMeQ
	3x1+aqjsZwrAjX6Vwyp2QuTzh8Fz5rN3qF8aueWWlVpObT6klS1F+3OLqKgqwmhnRhh9FQ6oUbY
	vAQNAro3X4HUb30hYEzdBGetogSbGhiTXdlarBrcaITjnirBIxCGpvl3fxdeOsSev+4wuaP/O4C
	GliYHvwRi9p90K2bQbmSiTKBXV1P/YA+MetgPpqYzTQ==
X-Google-Smtp-Source: AGHT+IEr5XA09hAhyrlbGXwVWq56SHCAv4LzqL2X4GJ5+M6iunRrNMxXVWWj1zZU1Aw/S704vfVyAg==
X-Received: by 2002:a17:90b:1dd0:b0:2ff:7b28:a51a with SMTP id 98e67ed59e1d1-305320b171cmr10716832a91.17.1743333337650;
        Sun, 30 Mar 2025 04:15:37 -0700 (PDT)
Received: from DESKTOP-NBGHJ1C.flets-east.jp (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039dff0c76sm7552658a91.20.2025.03.30.04.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 04:15:37 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	john.ogness@linutronix.de,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pmladek@suse.com,
	samuel.holland@sifive.com,
	bigeasy@linutronix.de,
	conor.dooley@microchip.com,
	u.kleine-koenig@baylibre.com
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	stable@vger.kernel.org,
	Ryo Takakura <ryotkkr98@gmail.com>
Subject: [PATCH v3 1/2] serial: sifive: lock port in startup()/shutdown() callbacks
Date: Sun, 30 Mar 2025 20:15:15 +0900
Message-Id: <20250330111515.393038-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250330110957.392460-1-ryotkkr98@gmail.com>
References: <20250330110957.392460-1-ryotkkr98@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_041538_731540_798FAFC9 
X-CRM114-Status: UNSURE (   7.87  )
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

Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
Cc: stable@vger.kernel.org
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
