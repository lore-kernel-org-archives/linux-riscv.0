Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C68C07480
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 07:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lL65OarzLHumfu8rkfQ9gXf3sBuDCIaRrMSv290/jEY=; b=pvnYT5EaDd3XK9
	HDrnm+W61emYHCJXmFp8sK+iW2mRwg3oba5NuSdA6nnz/Ck0J5RY/YBwC60x2/fyRwBi21R4pQih/
	QtqmQSAsMADbR9B9IP3JtqJzo2/g99GP0oLv4gbl/4TcJE/CYnLNGDCiNIDw842QRakMolFowhsGu
	VNE1hn/Uf+RlCiFQJEUJn7dsrQTlY/bVSPWsKQJ32+JPvMvAd9eKRu34VHRxqkZrTLG4em+zxQF57
	UK0cr3xFaU/FmoGLnR5OYDksWy6TxBXh0DjHn+Rl1F1BRvtmyvBfUVmHaAka0+pdbU1K3V/mFQ9pE
	IMcvUhgGU9NfVqRQEqIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtjpy-001QNN-0d;
	Fri, 20 Oct 2023 07:22:26 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtjpu-001QJZ-1S
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 07:22:23 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3b2ec9a79bdso379791b6e.3
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 00:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697786542; x=1698391342; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y40VDpa5tFn1F2iuJCGX0eAdf56bF4H2v7CDU5J7JlM=;
        b=FjkEtfmY2HhGrYZFzokvdmJS1WKFJcOMt0fz6tSuYyQrHNO2CTwYvRVadw49KM6qvW
         MvLTqeZII9+vJjhJvcFCGUNBs21Fr9aPqBy5sSO8s9jMSDAQxMm3u3Sa69hrVscPZ/+g
         kYJyRtByzor92GWwK4dOuh5QNLheyV7ZRy+JuN+twIRNNSajaEwkUCjAnwCAyUAnlWcF
         fSC5yCy8nn/BRgNk55Hmpel3cfVqe+Q1gySLPKZI0rw+F8VVyLbCFeC4qWz5ieCG99/g
         +Xkj1+og1eXB/vtidt1b6OwWx0w3rWOS6BstuAE+U1a8j5gp4WNDKuJmcykFF/CcMlLe
         GfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697786542; x=1698391342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y40VDpa5tFn1F2iuJCGX0eAdf56bF4H2v7CDU5J7JlM=;
        b=Ej29BMgMB5rEUQRtfwKtCybgXQ6kIIRwsAW+vwvFgUelw6ggVCH4L/eJ2m/MhMpf2T
         j2/Hcj8+IhCiPUdaYKVJq7VUJoQtI5ZplARgyfG9nY3KSPlZkZPg+YnAdI7FjhbEy4Fw
         9vbJ7lCMqIT6cJGuWAHJ3FO46Q9FjRMYNKlzY/P0GXRyLpe5Uge9JgFWJKlG44vPj5oL
         b7aoZgXE+IXyJ6zj9sAMfrOXd65usJPWh8LOJp/xUTJKH2iUNxMJUtMQC85P57142Bo5
         eRf7VL+BeShrH+c6OH2mYSSAXyE+UEy47LqXpO6eynN0ifQgJ3mRGMvdV+6FrCVPhCPN
         oEug==
X-Gm-Message-State: AOJu0YwP+7g9p7sv53Avy0ig2+7Kzq7yqAFuGwleRiRSKkHyAOlflYVD
	a6zBvc80cqmxC2Q/KBKdZJSn/g==
X-Google-Smtp-Source: AGHT+IEUQYK4G0+aPnRjUR077ELz4RoscN7PlFXPrhd3l1/3Dp5w/UYmiQBCTNoQsdXF4g9TKR4q0g==
X-Received: by 2002:a05:6808:55:b0:3af:d7dc:a47e with SMTP id v21-20020a056808005500b003afd7dca47emr1067018oic.42.1697786541699;
        Fri, 20 Oct 2023 00:22:21 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.83.81])
        by smtp.gmail.com with ESMTPSA id v12-20020a63f20c000000b005b32d6b4f2fsm828204pgh.81.2023.10.20.00.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 00:22:21 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 7/9] tty/serial: Add RISC-V SBI debug console based earlycon
Date: Fri, 20 Oct 2023 12:51:38 +0530
Message-Id: <20231020072140.900967-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231020072140.900967-1-apatel@ventanamicro.com>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_002222_487022_5DB86765 
X-CRM114-Status: GOOD (  13.76  )
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
 drivers/tty/serial/earlycon-riscv-sbi.c | 32 +++++++++++++++++++++----
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index bdc568a4ab66..cec46091a716 100644
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
index 27afb0b74ea7..c21cdef254e7 100644
--- a/drivers/tty/serial/earlycon-riscv-sbi.c
+++ b/drivers/tty/serial/earlycon-riscv-sbi.c
@@ -15,17 +15,41 @@ static void sbi_putc(struct uart_port *port, unsigned char c)
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
+	phys_addr_t pa = __pa(s);
+
+	if (IS_ENABLED(CONFIG_32BIT))
+		sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
+			  n, lower_32_bits(pa), upper_32_bits(pa), 0, 0, 0);
+	else
+		sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
+			  n, pa, 0, 0, 0, 0);
+}
+
 static int __init early_sbi_setup(struct earlycon_device *device,
 				  const char *opt)
 {
-	device->con->write = sbi_console_write;
-	return 0;
+	int ret = 0;
+
+	if ((sbi_spec_version >= sbi_mk_version(2, 0)) &&
+	    (sbi_probe_extension(SBI_EXT_DBCN) > 0)) {
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
