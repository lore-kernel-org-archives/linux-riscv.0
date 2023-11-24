Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD1AC61D97
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 07:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N3LLg5xDIysCTChyMD02x/QLA5htYbXizTRo6KRMWkM=; b=M4QLcwt6WNEiNg
	cUkA4mFY7oiqwFrRbAq9MHeVE2/J4I23q0MW93PihWFPq+EFBEnXojLHyTJUTRtIPSiP085nW36Zm
	hTx3z3pJ/lHigCIEG6f4QIHw/jBjye1fNZBHnUnU0H2x0Rd1drrq/HdsKl+wbgwR0AhEkkijcwv0u
	uWlFQBHtGbqGxzqrGwSMm4vV4P2PzThOYrlLVgLXqQchyuK043tBbji+xCwQ0e+UkBjt9yU78zCCx
	GP9cdH0J88VQutUEcLD6JNT7+2BvvUaC6Z5IwfNGjFff7y2Tal7n9lxrrqpht7cUuK/U/FQDjQ/1M
	ybMejxpvpf2n4BNG++zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6QKq-006Lcy-13;
	Fri, 24 Nov 2023 07:10:44 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6QKn-006Lbo-3C
	for linux-riscv@lists.infradead.org;
	Fri, 24 Nov 2023 07:10:43 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3b84402923fso845206b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Nov 2023 23:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700809841; x=1701414641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5e69UQ6T+Z7CNLXUZDcGOS0SOuMoPgQwIsqXvR77gEM=;
        b=PJHT2Use8Ngs+oNq7vklVcrMjfcnuQ95ld0mpbgv7qxPzqot1IsewohsJyxnw0Uo6W
         EqBibTdHI1+TF2AQ+N8mJol+fc+zKM2SWlN63GASZgU7lZFgFNwSyMBLcIUm/Q0XeJf6
         VvZ0Cj2SkKcqK6pvGlxD11gvpkn5hOmVVJ0H3eAhpp4SijV0fMH1hWL6Xb3jp6t3xfO2
         U58tcABZ9+51Y1equW3rxv9W9/VNNZVDhXImMNGb31NDsrQmvdCfOVdYSzH9RpstDutS
         H2iG8gLDjw/JVVDQALG/qfuMGudXi94ymfH92ISkBHyy9FzZ14w7Fvv00P0DIjaEDSbK
         WhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700809841; x=1701414641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5e69UQ6T+Z7CNLXUZDcGOS0SOuMoPgQwIsqXvR77gEM=;
        b=QG+BA3Bg1XQropt0kJ1D119fTH2BfxrobpT5wC0h5I00OAmlwFMpBuaAaHLXMGT202
         iS8w+SLLeop6TMt1b5B7HR4BhtUrrwFCIdE7NLu6xkJWdtIq5+FdpLtuDBfoapkc5quq
         WPR07556gSnWbKtVXo/+FVjDixTcpbHxQM+WxDTzK+j+rVxsaHAonXW8Ix1iq2DO9Cnk
         bG7B5hSw+L/4JNu4Gjn2v6T7JjaCNuBrL10UhT+aUph88Vet4tS4s9e1P2STHoY05WOa
         +RRrABKc0KDVQzmXoh103+LBWKRrHrbKS2/o50N3nmocT91CiK8geZzKNeBxATd9Hmi7
         JHzw==
X-Gm-Message-State: AOJu0YyRLGxcOfPUS+Amb29lTVDtTT1BMCyIRBNmJstfWDBIBkj7qjBD
	jDmfmCKaINAMhlQDTNgSUkcXRw==
X-Google-Smtp-Source: AGHT+IGpCaOs051rva99tydJYiLxp2JmCAggGxrs3iHMIIeR5K0qZKOeN66AGmBC8Za809GQ8lm4oQ==
X-Received: by 2002:a05:6871:453:b0:1f4:dd99:b07 with SMTP id e19-20020a056871045300b001f4dd990b07mr2011442oag.49.1700809840700;
        Thu, 23 Nov 2023 23:10:40 -0800 (PST)
Received: from localhost.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id e5-20020a9d7305000000b006c61c098d38sm435532otk.21.2023.11.23.23.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 23:10:40 -0800 (PST)
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
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v5 4/5] tty: Add SBI debug console support to HVC SBI driver
Date: Fri, 24 Nov 2023 12:39:04 +0530
Message-Id: <20231124070905.1043092-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231124070905.1043092-1-apatel@ventanamicro.com>
References: <20231124070905.1043092-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_231042_039901_614A6E5C 
X-CRM114-Status: GOOD (  14.26  )
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

From: Atish Patra <atishp@rivosinc.com>

RISC-V SBI specification supports advanced debug console
support via SBI DBCN extension.

Extend the HVC SBI driver to support it.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/tty/hvc/Kconfig         |  2 +-
 drivers/tty/hvc/hvc_riscv_sbi.c | 37 ++++++++++++++++++++++++++-------
 2 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/hvc/Kconfig b/drivers/tty/hvc/Kconfig
index 4f9264d005c0..6e05c5c7bca1 100644
--- a/drivers/tty/hvc/Kconfig
+++ b/drivers/tty/hvc/Kconfig
@@ -108,7 +108,7 @@ config HVC_DCC_SERIALIZE_SMP
 
 config HVC_RISCV_SBI
 	bool "RISC-V SBI console support"
-	depends on RISCV_SBI_V01
+	depends on RISCV_SBI
 	select HVC_DRIVER
 	help
 	  This enables support for console output via RISC-V SBI calls, which
diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_sbi.c
index 31f53fa77e4a..2f3571f17ecd 100644
--- a/drivers/tty/hvc/hvc_riscv_sbi.c
+++ b/drivers/tty/hvc/hvc_riscv_sbi.c
@@ -39,21 +39,44 @@ static int hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
 	return i;
 }
 
-static const struct hv_ops hvc_sbi_ops = {
+static const struct hv_ops hvc_sbi_v01_ops = {
 	.get_chars = hvc_sbi_tty_get,
 	.put_chars = hvc_sbi_tty_put,
 };
 
-static int __init hvc_sbi_init(void)
+static int hvc_sbi_dbcn_tty_put(uint32_t vtermno, const char *buf, int count)
 {
-	return PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_ops, 16));
+	return sbi_debug_console_write(buf, count);
 }
-device_initcall(hvc_sbi_init);
 
-static int __init hvc_sbi_console_init(void)
+static int hvc_sbi_dbcn_tty_get(uint32_t vtermno, char *buf, int count)
 {
-	hvc_instantiate(0, 0, &hvc_sbi_ops);
+	return sbi_debug_console_read(buf, count);
+}
+
+static const struct hv_ops hvc_sbi_dbcn_ops = {
+	.put_chars = hvc_sbi_dbcn_tty_put,
+	.get_chars = hvc_sbi_dbcn_tty_get,
+};
+
+static int __init hvc_sbi_init(void)
+{
+	int err;
+
+	if (sbi_debug_console_available) {
+		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_dbcn_ops, 256));
+		if (err)
+			return err;
+		hvc_instantiate(0, 0, &hvc_sbi_dbcn_ops);
+	} else if (IS_ENABLED(CONFIG_RISCV_SBI_V01)) {
+		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_v01_ops, 256));
+		if (err)
+			return err;
+		hvc_instantiate(0, 0, &hvc_sbi_v01_ops);
+	} else {
+		return -ENODEV;
+	}
 
 	return 0;
 }
-console_initcall(hvc_sbi_console_init);
+device_initcall(hvc_sbi_init);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
