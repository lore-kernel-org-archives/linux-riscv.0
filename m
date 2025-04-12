Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0735C369A2
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Apr 2025 00:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rQA0GM9VI3CNjvfWZhj74VW8r1prJdxQd89pS22RVIM=; b=wi9w/X6dTYEePw
	IFc0P0PmObOIXq4EuysLG8tOVJYngYldM8yneQDNCCEOSwggM+YrO4MiWdRdzmuGXcvD9PVRTbGuq
	KI18nAPeDAOD+rMv4xggj1VFVBzT1750wnEi8mX5XW2ySTsK/bUB87ZaVi7z+SXN8hE202yUvHx8I
	3uO773MCfqqUhyyJ1A3YqdzOkXvSjVdf4MoplbSICpZN7mKaXMi/5HpPVyp5jSB69VGQX6NTMgogc
	U2jBbzJ+hKvNf8SyxXjblclxfOyz+uTpyYOGsyL2WeMniiREXZIjvKuTXwBpU+/rEhN9jLCY7ZisQ
	12gajAYf8WIXWoaKm5kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Oaf-0000000FA00-2LyE;
	Sat, 12 Apr 2025 00:19:21 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Oac-0000000F9yd-3Vc9
	for linux-riscv@lists.infradead.org;
	Sat, 12 Apr 2025 00:19:20 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b00e3c87713so2224965a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 17:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744417157; x=1745021957; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pl4Ao+sGi12Y8GuDBgcGJjc/F643etgfiqYpC5NF9Bs=;
        b=d/j2ILb5y2GZO+GpmXt4chTctZsmUwyM4JKZatpiRjcd9PrlUkE19x+9+RQLVwCwRO
         InY2+UHwm6jrZ6r41PikzizSRRDJhOtiYj8/CYR4prik47hBIQutKtTha4Rdb99UtC26
         QeJoBsPzvMtNqem4bsZ9GWJHHa65NN8ejQBfV8EqKSr7YfKhil5SCfDqgZ3eKArQpt8m
         IC/9HawVW1S8FJgdsQhaWw2aA5t0Ntl8YsA2f4Mq8QG0WOL2s3ytf62Y0L0nvg6UkfYM
         Zi+4ECy9OivhNFtE/4Yucy6gs1s2uixEGeFYGIoCeBNxDbCsz0kY2mwncWT+aK2Jo/Qc
         UpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744417158; x=1745021958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pl4Ao+sGi12Y8GuDBgcGJjc/F643etgfiqYpC5NF9Bs=;
        b=LTKNl+Vcno9Z7gguNFL5TBgpl4PkNW2vIvZMRAAjoeGHcLpv94qCbqnbwu9DuV1CFy
         jnjyEvF51l+HANqIE8/Ef2YDIhd+1Pdla+H1vPDvTsJnVHNEexrxugWu32xMu3tdo69U
         CCKX9KtCi33tnJ5JPBR1hGU5B1q+/9aMPjfcBHkGBLm6uLqllNHu/l0Ai7imRX5R8IA0
         I+Hj+UfBP5z3/y/tCkSGu70mKW4WyRRhyXXrPBJB9/Asjr1bCILofMvYvo1kf0BR42bF
         HwxELctOfFjxcLAKUCAvLqqqrCCtR9fB1bgSbgQdKqKuwgno5LV02CeE6Cp6YI0glMYd
         vyqw==
X-Forwarded-Encrypted: i=1; AJvYcCXlb3DgzUURFrk890q6bRnWCVA6592UzUod/revL6OH3OAVrYj8po6jF532D8iavIDQsNfU330rLbNR2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJkt7JaGDyDVAcA62CX0Okl67BSsfvaQW+PG8saL52fkIQy1kD
	P7xSi2SdDOXk3sFMPNg79lzDFnFzA6jV8psGQVnJ7u/l5O7+7zSr
X-Gm-Gg: ASbGncvhIpIRPWuBI2SZMRENzdoiS3Hb4OqlB6wnotQ4Ukv6qNxywzETGqjKFISuHDu
	difraXR2SACRI6X1/eQAR5eyP+oU+KmoOtv56ENqszOcn1J1qwCeYy1leVeQuQJg/AWBR3Thznq
	Brf2qqWrouG2kEOhkm5+/3vCM7v2CHwfjJpQ3rONwIJcTjB9bj20CYE0jGLx8crWv+ARsG8fWq8
	bmj2OqVFjTgMUfqUi8IYBSUbACQ/RyTxLEcaR8fQY2aeroQyOzaL3sCiGQzJtWD/gi7x5RIPp/q
	Jx90F3JsaGDvwpG2ZqR3IzQ+4HLD0uL6sRoIMNEkbtJdwdpzVy3xiv0RqvhagV/Iw6oBtPI04nF
	ctk/ZgMEM/XoPwfr/y3oHFmcBWC/8KpyGHBdpng==
X-Google-Smtp-Source: AGHT+IHxZRgFKr/eoGrqndx0eEnSsquSVnD+KeF8iKFQdtKjOmi7NLYyrW1oWrufBCw9OJAiRQqcNg==
X-Received: by 2002:a05:6a21:789d:b0:1f5:6c94:2cc9 with SMTP id adf61e73a8af0-201797c3a64mr6674058637.22.1744417157441;
        Fri, 11 Apr 2025 17:19:17 -0700 (PDT)
Received: from DESKTOP-NBGHJ1C.flets-east.jp (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a0cf3604sm5520285a12.25.2025.04.11.17.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 17:19:17 -0700 (PDT)
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
Subject: [PATCH v3] serial: sifive: lock port in startup()/shutdown() callbacks
Date: Sat, 12 Apr 2025 09:18:47 +0900
Message-Id: <20250412001847.183221-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_171918_875151_A33C71E9 
X-CRM114-Status: UNSURE (   8.46  )
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
Reviewed-by: Petr Mladek <pmladek@suse.com>
Cc: stable@vger.kernel.org
---

Changes since v1:
https://lore.kernel.org/all/20250405043833.397020-1-ryotkkr98@gmail.com/

- It was sent as part of series but resent as a single patch.

Changes since v2:
https://lore.kernel.org/linux-serial/20250405145354.492947-1-ryotkkr98@gmail.com/

- Add Reviewed-by by Petr. Thanks Petr for the review!

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
