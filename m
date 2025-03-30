Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B11C36008
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Mar 2025 00:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LE+ZIUNReGN1tIBF2m1TysHdlMDw0SjqVoyBRsY9Wn0=; b=mcMFKO7hbyGJ2W
	ZI0ZPGrZCRNO3L4rJfuhx1aYsnd+b6RwXTbeDjQK6ZAa7HVGNCdV81SgzTlViS0ELDY3bFZcgtIrA
	Yjg3D5II9zDCqtnGMqfRnIuL0xNw6Sb+9gF5wmoolrtGTVMrNANP0ZNx5NWnDj1tLWzjiO5+Mp8yG
	DwzUH8yuJ5r8enpGLazd7JDDi3w+1v/2Ipl8kc9aEQJiIC3woomFnEYBE3pSRU226A0bp1Nf4n0rw
	XSj0sVQwZW7Ju1bRg3edZwSJLuLuHuHam2EJcpGoBdyh5cAXpR64yTFRWfPuX6jXpy7sUKOB9SfCp
	mYybCA0W2f0xtRAWCgQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tygei-0000000Ffto-1b5D;
	Sun, 30 Mar 2025 00:36:04 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tygef-0000000FftS-2dOF
	for linux-riscv@lists.infradead.org;
	Sun, 30 Mar 2025 00:36:02 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3014678689aso4794872a91.0
        for <linux-riscv@lists.infradead.org>; Sat, 29 Mar 2025 17:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743294960; x=1743899760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I87PBBHC1/SKne6uhKC4Z9to2SP1rEfx4IDoCZFQKwE=;
        b=jPOZrmPN+TFPmQ4sqqihr9wPKQFL5Xc9HSlzq70PzGF/qMe/aA8YeBPm2fWScnMqch
         GAluHBtbovVaqMSPSaysmRjR+A/6PAP8WWedI/ggUPMgOkDdPZAKwXwoZFAzO06bHI89
         xZodBZxUiB1i8F/oEzCDE/t3yo1h5huEc9gAfGWr8uzyvgtSWpyu9VykQVQjmKuJsJjp
         txQyczSNF3Mzr37NiuPB2T03RKd0rWJd+oyFszsAnqGa5fjMBkulTZkAqo6xJg5WwAio
         5HpBiqlpPpwIJekxKvteIJ8g0NrpE/mHE0gkkFguH7FZdXZocpDTRSLpWBu6h6tn2aKR
         p3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743294960; x=1743899760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I87PBBHC1/SKne6uhKC4Z9to2SP1rEfx4IDoCZFQKwE=;
        b=eFK/UKb3P0rQrdDeBBQT+ORFqGlSUO32bepf8kCGqPcqj3ZGV31n8AFznF6mKmrl2M
         iXqbePk0r7Y+syyWm2E9r/SPJQLVNU7NId9yTBH5xVUTRDaZ5H0IjZ8jzIesr61pUX8c
         TLRPabHz5AjlO6Rz6csgDgXTi3IHRwTrY5WYCalPTCK7XA/ZzKfZSM8+1paNtiaDMKlY
         oNw6S3hxe1QByL/D9IHMj6vMx9/MPq9JwTagDIx725NLRfQ/6ZnbWbRcRBgwCnNLH2/C
         ivMKKMR2Fvtr8XEE12A21T6zkwyP/2qV1Br6/NGTsAU6dntwXEbBZAj+XXAN9Hv0Djqe
         0iKA==
X-Forwarded-Encrypted: i=1; AJvYcCX9Kf8AjF87ViN3zFRoDK3fC4Oxz779calawm1apRwNeeKxGyL8TlW/g/BIdR9z7P/i6N04AXtQ2ALnBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr3scHfs+1zToMXvyjsFf75iNsrG9SEaqtSFXRbDb+Hye+ZOnF
	ELEzzeaXZ0J7cPt2qaSyQ+nMn3LUvpIMJTPzyMJLQSk5nzPy9935
X-Gm-Gg: ASbGncvs+qCkllOxnlvvqHhJUNHZ/x+G4Sv8hxIq0KV5bVdc7XLRqgwY33BSjh/u7TY
	r6oqgtKoTuqWc0pnnHvbP6PORD4RwM8hGGx6/MEnBVjojJDGnA9iCDTGHg7f7s+9qQcD/PYGRcZ
	1EaizVjoL0YWYpQrfZGDWLVdPsuzWtnggsdFbkmA/cBOvxIsYuDta4u1PpW2AzU/mQWtN5M8xoP
	di0bzYFgNR2L9lAELCvwjA+KnxoIQja7YjatC1r4N0rGWN919KvtDJ7+/GICp/Oyn8sejnuHTih
	tdDUIoPtxGc++rWjM1p48r9+bQmzGatVE+3dCA+LUeyoxtJIwyJ2uSxnXHIDi5IIeF4mKbBmt0i
	chhRoh0I6zs7Q66AkKtC+ZUKDvFIdaFs=
X-Google-Smtp-Source: AGHT+IF+X3s/+j/bH4Ir4u2sBQ7YQHvm8oQ/bbO3cAsu+okzmktZT1hFzu6w65mr5QVvFL19LQNe4Q==
X-Received: by 2002:a17:90b:4a04:b0:2ee:d63f:d73 with SMTP id 98e67ed59e1d1-30531fa18acmr8077696a91.11.1743294960613;
        Sat, 29 Mar 2025 17:36:00 -0700 (PDT)
Received: from localhost.localdomain (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3051cd7fcc8sm1846368a91.1.2025.03.29.17.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 17:36:00 -0700 (PDT)
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
Subject: [PATCH v2 1/2] serial: sifive: lock port in startup()/shutdown() callbacks
Date: Sun, 30 Mar 2025 09:35:22 +0900
Message-Id: <20250330003522.386632-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250330003058.386447-1-ryotkkr98@gmail.com>
References: <20250330003058.386447-1-ryotkkr98@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_173601_668873_EF44FFF7 
X-CRM114-Status: UNSURE (   8.42  )
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
