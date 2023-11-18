Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFED2C5AD4C
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Nov 2023 03:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NBPGANXUS+WnaC0YZ5X9BIb4UakfeaIilQqLr0CpoaI=; b=d5dgOvJq3Ijq9y
	qRWd7TaBZ4fCJB4wvppVK07GWo8mbeyNzj6aRr3U1t5jqcU2DcPQCRS2gEK/2Gl326FEZjbvBVD+4
	903HMBoQTl3AFqf736Ab2Uu0OrOiZ5njZYgG+2HIbUQb5JBZMnL2c0dEAPL9Rq+73hlhDIXTRTQwC
	P9C+ajQOYXkiPMam4I3+IbUTVR2pwJNvntM5FFVuhm/9eJVAVVMOzcYAOddY09C4hRUgYdgCuwEhf
	cIBp7XnzORz5FJxjsmbOmRjmr7OFZ+/vuAyzfl74gD5VEbIdeD2BX4MJfdYIkO8BonGPLinTpslEp
	QxK2y4jkONtH61zZnWJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4CBP-007n5o-0G;
	Sat, 18 Nov 2023 03:39:47 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4CBM-007n4L-0B
	for linux-riscv@lists.infradead.org;
	Sat, 18 Nov 2023 03:39:45 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-27ff7fe7fbcso2208348a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Nov 2023 19:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700278782; x=1700883582; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ii/r8hzimL/XtavRWrcGkJgKEnLeFuQkfTAUm70Wb2A=;
        b=EeALZXpxotv2ys3Or38MSTRe1ZijmWDdCnHxMdWSCVYvM343Qc0O+jySchsbNpDbp2
         Csrd/kU2ohEDWEV3PTn1gYdP5TuzCOP6bbh0mXRESbv9wLRzMcmHdexz88exTXKjNb1V
         +b5YOz5PpJiXei4rssLjUr3sH3dLZVLjyn2uFpQJicA/M6tJ3TaP/8nEXPYDlqRU88dB
         gAjTFoLwzQrsvlGFoWn4aRu+K8Gc5WjWfc/BpYplfZ0N6nK1lirbsJikvmK+EF1cIBii
         hmP7zzwKaKr4tzgQ35zXHjwomMazOv4ZwgI26PJp+3v71nBgpTFRi5OtKeOiOAMW9mpD
         Kr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700278782; x=1700883582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ii/r8hzimL/XtavRWrcGkJgKEnLeFuQkfTAUm70Wb2A=;
        b=oCQdEUK3Chb36ah3lrPVQTUc2ajKZiV27WfwV0V6TqY6qo44qW6yoJqtCizIK0fkkS
         CGqHh8FuTYHgKINOFTL/JHzSehQ8atZ+aPziJX17CmpGwIMVDXEvtnOF84nPPhT4EHja
         JpzIhXH3Y0LKcO1i6iLTbBIYRWx9NQC+/LtW4pWom6LVMFMRauGeTRBJ7mItZKo2AjE3
         Z2/e1/wpCXbYU0XDoPO50mvsQKPL7dFAgVzx3i6LKswtJnwnBItgSdCWTNpZt5dXa73Q
         p8Bz57dfNurg0TwlItmYKai4OR9YN7VQxSvp/JNX4XeSMpN1GqjnbhdMHVyVQttBGfLi
         Eqag==
X-Gm-Message-State: AOJu0YxUaX0C4fTG1fvJH5sX/BPW7iuDoDbgLjYdKDGFXSbC3B2bo98n
	5cxT+89ldaFmTSKH7NSvmvlPKg==
X-Google-Smtp-Source: AGHT+IEnlmvKg48AWLtRJlHz9Rg/Q27+8No7s5ojWvtL/WdnvFdbsfi5N3eU9MggG7ZhT0nUoF/4cA==
X-Received: by 2002:a17:90b:38cb:b0:27d:1376:3ae1 with SMTP id nn11-20020a17090b38cb00b0027d13763ae1mr1378816pjb.0.1700278781572;
        Fri, 17 Nov 2023 19:39:41 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.80.108])
        by smtp.gmail.com with ESMTPSA id cz8-20020a17090ad44800b00280fcbbe774sm2053823pjb.10.2023.11.17.19.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 19:39:41 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 3/5] tty/serial: Add RISC-V SBI debug console based earlycon
Date: Sat, 18 Nov 2023 09:08:57 +0530
Message-Id: <20231118033859.726692-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231118033859.726692-1-apatel@ventanamicro.com>
References: <20231118033859.726692-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_193944_093589_F9EC3E1B 
X-CRM114-Status: GOOD (  13.51  )
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

We extend the existing RISC-V SBI earlycon support to use the new
RISC-V SBI debug console extension.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/tty/serial/Kconfig              |  2 +-
 drivers/tty/serial/earlycon-riscv-sbi.c | 24 ++++++++++++++++++++----
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 732c893c8d16..1f2594b8ab9d 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -87,7 +87,7 @@ config SERIAL_EARLYCON_SEMIHOST
 
 config SERIAL_EARLYCON_RISCV_SBI
 	bool "Early console using RISC-V SBI"
-	depends on RISCV_SBI_V01
+	depends on RISCV_SBI
 	select SERIAL_CORE
 	select SERIAL_CORE_CONSOLE
 	select SERIAL_EARLYCON
diff --git a/drivers/tty/serial/earlycon-riscv-sbi.c b/drivers/tty/serial/earlycon-riscv-sbi.c
index 27afb0b74ea7..5351e1e31f45 100644
--- a/drivers/tty/serial/earlycon-riscv-sbi.c
+++ b/drivers/tty/serial/earlycon-riscv-sbi.c
@@ -15,17 +15,33 @@ static void sbi_putc(struct uart_port *port, unsigned char c)
 	sbi_console_putchar(c);
 }
 
-static void sbi_console_write(struct console *con,
-			      const char *s, unsigned n)
+static void sbi_0_1_console_write(struct console *con,
+				  const char *s, unsigned int n)
 {
 	struct earlycon_device *dev = con->data;
 	uart_console_write(&dev->port, s, n, sbi_putc);
 }
 
+static void sbi_dbcn_console_write(struct console *con,
+				   const char *s, unsigned int n)
+{
+	sbi_debug_console_write(n, __pa(s));
+}
+
 static int __init early_sbi_setup(struct earlycon_device *device,
 				  const char *opt)
 {
-	device->con->write = sbi_console_write;
-	return 0;
+	int ret = 0;
+
+	if (sbi_debug_console_available) {
+		device->con->write = sbi_dbcn_console_write;
+	} else {
+		if (IS_ENABLED(CONFIG_RISCV_SBI_V01))
+			device->con->write = sbi_0_1_console_write;
+		else
+			ret = -ENODEV;
+	}
+
+	return ret;
 }
 EARLYCON_DECLARE(sbi, early_sbi_setup);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
