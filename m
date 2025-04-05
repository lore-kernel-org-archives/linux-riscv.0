Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD7AC36010
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Apr 2025 04:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KVsp9h1P33W7kW//Gft7YTVchzMcwf6IcjHQHSdn9cs=; b=rTEBVU8jMjmjuB
	EOecHxoF0tnFE7NAJe9bZ5ARzOcVXkN2XiR7BLTYdcdFr13pev8NmNC80cdjhXDCL96WyePyvGHvn
	s3Bh1YYZFQSvAI9maaw90euCLWup+X1hdwXYJ3s+kE/5CahdEZg0z5FqNW+mgzbKUZiwJnn6i2Po5
	SbW5SRcBdM1C9YAHW4fLRH/jTrHpCGsKvK6ZtfA5wulddqdBlEQ2Gqe3fja3QxHc3GBtyK/qqPHER
	paASk2H376tLTkv9mzJ3KPofugo9ACyNlBHAXrVNIZFnK1wAZpih6jLTLULqcIxPN6S8/KcN0vsFi
	ZVoGp3Z3IoT0cWHyEp8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0vOB-0000000DSl8-3RR4;
	Sat, 05 Apr 2025 04:44:15 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0vO9-0000000DSkp-40G8
	for linux-riscv@lists.infradead.org;
	Sat, 05 Apr 2025 04:44:15 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-73712952e1cso2550261b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 04 Apr 2025 21:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743828253; x=1744433053; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bOkg965odz+QE9cKXvYVRkNTxhqTHUa1qzYcFa9wPk=;
        b=iv4cEaHk28yR5DgWmAppTF5WPBJAJkj/5Oo3MtVmKDADSNjorF2kdIZvvj+7GSZEE3
         o3vKQd4AgVCUkK/sNP6uPaiRHjMJkO2sH8ztwdSQHLPeAnInJxVA6ilVtofGpDWUVJCc
         k9PCf3XyBogUrEtaoiEu1HkucBeC7SKXjvyZWEWx+wfthDWwKgmdg/q9ikQYe6ZJ82OD
         wH+eh4QXRsH7duHM6gK/RkL2qq5G9nbNtzGUgNC+TqzWe+5e99URg3rZjAYGyGgapP7M
         ZfOvuNEKp1X4r5s2u2zZQjAg+xwj49IXrcoOIjTzzj7Rr4oVEpRcfQ3xRvR1J4zq/IoS
         8hxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743828253; x=1744433053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8bOkg965odz+QE9cKXvYVRkNTxhqTHUa1qzYcFa9wPk=;
        b=dqvTzAi882JJmyqcpFR85OeQYp77BrKJTTHFkPcrMuTe5SSA1x2ogYmuABuulcA0CA
         jiOYqg5rCfVwPaGMCdB3fqHFQSMlmLEKfZvjDRiJ/vni8HoqcaBr2guIXYz+XYmJmt8C
         M7v/paiYyRaT2hpP7J6E/7VM5x3wi7OPZtCvudAUdIbAp4VuiUrKoN+vqbrCQeGnT5ls
         PGsSe7FUFbqTINmvpNuzO1ze0hwPfdp9xqUk5b+J4//Wf8R6CAPeZRHMiPeF7d+aBDBJ
         Z7vQ+ZOKSn1lh3EEF6W0vNe2PbK8Rgc3uboEEXc/g7HXitSlxObyE9OSPZimv//dbWrN
         Gi2w==
X-Forwarded-Encrypted: i=1; AJvYcCW8gAUxNQK7uST49BUQ8DCB+CU19/c0WMnHxZ600vxMvfayzZZnifvAx5P8OXjNT1/XODOCwl/UAADkmw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzlG4Ur7RkFvO9N6M6puwH0A5ryp6kgz3peEFejKG2AxQSUyC4N
	V91nzWLCafzXqq6ZS9/+Yv18ksHyzU8N/DI/ZEGcM5yOR2WMQNqd
X-Gm-Gg: ASbGncvfeDbEsItDT14oweTsqvD/9WXsTXoog3BrSeXJH/fzxjFGplJjg1a5FePth8y
	qqwmkSngErhTRK/gMJ40ZIEiuNsPmMqzRMtWLfUOL1ExLyHncmAZFLuTQtjflig6lAQPclx92zW
	bBc6hp7yYR9O2fEqf2JcFtj3GpTtOZVtlB2v+6d+SbAEyOzf8kZIkwZ0gkAFunEe+gsOO0X5+F3
	zkwJ4lh8WIJl3vv/IixKVYTJhw7BI4Wvafrm2UWWx/f4opeoNJSNalAECBhcfpRgFDc9t78Py/x
	7aOJ4XgURRqHvkZKfEz8e824KQ7sV9O59g8bNq8dzqktvvT4FnwRjQvzZTQeAn9+bkGy5FjnoNV
	9fiGSr/jyvl6PqCcpbcPCECpJoXRcouc=
X-Google-Smtp-Source: AGHT+IH6x7bxx7g+YFTtM+ge7TYGa+a/bsXzLkrOIrtKg+MV0AgtjofqDOvWHcwFk7z0p2vkRCK1/w==
X-Received: by 2002:a05:6a00:1414:b0:736:5725:59b4 with SMTP id d2e1a72fcca58-739e47da9cdmr8628640b3a.3.1743828252726;
        Fri, 04 Apr 2025 21:44:12 -0700 (PDT)
Received: from localhost.localdomain (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b4317sm4486035b3a.148.2025.04.04.21.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 21:44:12 -0700 (PDT)
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
Subject: [PATCH v4 1/2] serial: sifive: lock port in startup()/shutdown() callbacks
Date: Sat,  5 Apr 2025 13:43:38 +0900
Message-Id: <20250405044338.397237-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250405043833.397020-1-ryotkkr98@gmail.com>
References: <20250405043833.397020-1-ryotkkr98@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_214413_993695_35BD87B2 
X-CRM114-Status: UNSURE (   7.95  )
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
