Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946D1CA0EF2
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 05:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I9ftdTC9Ot+VcG/gRUm3WBK3DGXdgcGthKyVWaX4I3A=; b=QgKb5cAvINpJvz
	2c6cU2CtBgQcvM/rEcy2T1UuNtqlMUjP7FdHhWHfD7MOIkFBZYn5v3GvGigkjUsBNssGewjxtlDP1
	aF0T74IVX3HbyWMURfO7p1/yMabTcwzBpUFkZbVoxIOffUvLum5h7G/lEhMVw910ev/UZjPbmW5uV
	FxefDkP7KBqNeW3OHdxRGl3Xrr6epNXnMVDTH79fZ9p3ONEl0t5qe640oflHMu4iKsU036c5wKH5B
	Yw9QheAXIuZC9W8Z7I2+juDdNwlcDS/WZwR6nYHxjEWTlEruVQRO7A9P1hYk/rlNCuwVzdpPWIQlW
	ybuDcQXLEjhz0fY+ToIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unsGO-00000006XEL-06sy;
	Mon, 18 Aug 2025 05:18:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrEv-00000006Rjf-16bX
	for linux-riscv@bombadil.infradead.org;
	Mon, 18 Aug 2025 04:12:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=lSO7EIKKecSXu2aYLs1QJ6fLwvTSI8gnzNqTWtwR7X8=; b=MskLabjAPZnCFDuhQvlQH6xqfv
	7tf4zRCONdCpmbhwlvfYpWXEhjizmmZ3kGrGaM1JUnUolFaZyYlccp8YcHzIC+W5O98uqdjH7nlFg
	ttjYaXclu0AWx/2vrzId39Jv+hHKEQelUOABxqvVmdDHLPFi1oDodcAU46oHMli3fxuzeRmOB9VgY
	NgGiduz4bFq2cY5bElL2WPAwkzB7J4m0ejSPnco2po43ZDNb3ao5+wjyFaGKHlfieXrGPT7wUZE8Q
	QUg8oQJbDcTyulhCre3n6ExpjvxjoRQfa3JAlTiOEJqt0lQysA64CxrGuBsnVroh6qzHY0qqTBL1L
	xQOawVZw==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrEq-0000000HEH2-2RWh
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 04:12:55 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-32326e7baa1so2885869a91.3
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 21:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490370; x=1756095170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSO7EIKKecSXu2aYLs1QJ6fLwvTSI8gnzNqTWtwR7X8=;
        b=WnHiT2gSp5s0hklQ8h/Gd7mwv0kAiqrKu0kjbI2Z9re0cGfSE4AmupOHlkNA/emEyR
         DD6Vo34uPYHM8unogXGO29eexH+VUPGC/aLi/et1nTN/Z3ngXzuQBXjgDeBo5l10fV0b
         5tc4bfabGcTTuK1jgUjiCYFYxuAMtxUbzrxC+JwahM72BT9nbXcFC8F9TkJNA/ZZiZLl
         SqeEFVR2tzpGz225V7mwtUFTjQC18Fophbx82Q+L4mzHCraOzyDrxotWlJhE1pk8+LCI
         mKYPFBqtsyHepC59KcQk9LgEmoQ2o8S2tAza4IcZRiMP6UBQVrl9BSPuDE0fU4f2kK8F
         i6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490370; x=1756095170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lSO7EIKKecSXu2aYLs1QJ6fLwvTSI8gnzNqTWtwR7X8=;
        b=VCCowX+gayzj+odn8M4bsvRWBRDOGu6BLsRmj28/cML0HVW1YRMTami4+DQmkcTt4+
         lnjcGqEMysTTLtvtcgfMS+WTw4NYeleVJYpLTvPX3Nawei2cQ20GzR17Ki3YNcJ/BwXi
         0KQGpHhbwvisakPJ5ivtOkeOstKF7My0pmSFvavA4GS7Fe8bHwFyCuV8PLRPIJSod10y
         JKdklk4wNbYZGipP/fN79GirVTBZYm2Hy6iemfJ4vgXzbwfiYT2BgvF8Qr+Jerq9W65n
         t5fUBYI7o3eHLYK7AAgm0cmmp5nWioopTGzUTGc71/axFnJ5/6iIB4ELabHI/WqET+4f
         czNA==
X-Forwarded-Encrypted: i=1; AJvYcCW1BsbYOifSkp8UkId4CVQxn78EIi2HruRkv+cUR74B9UrHBdVZXM+J8jBym/1/2yFbeirrRPBD6On4iQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8X8JVINjJe//z31Is0cTmiQxz0aXtDpeV2peYRtGLG6IbePXH
	XDNIxtBHE9WMtty+hG4xPYRCGbpmxPkJsoH6+U18G8M+K2PRqiX9EGejJsBe15m2EaE=
X-Gm-Gg: ASbGncuMLilx0Es2GWjQqRK5EDERCtKQiROKzwhKk/o3r57P79Zzg4e8v1gFWEmxqVu
	KD6iAsqOcioLnx/EqhUs9ZjufRAxXsoDPilgGGexq+EwxMqstsxPeGMLO25Ak8+BzrLWGrRf2o8
	d7fOco8OwAzzI1u68UngJoKD/dKAQfeOpMdhEikUvCaYQ9OL52zZkDDprRRWj3ncPNKgLcuNCjs
	tsHOEBRtEzBwtruh32x4oy6UfQQl9dmNvb7xcRQ21FFt4H4rmO1nk3cRavDKq0vFhNNwzoaKVp2
	cWzYT51uIRgK7xxoHcHm2NMjVPGzvfGeCB2Kq7aNWwBBqUczWuJU9PpzAhoAkdWKlgD3Z0dYC/k
	A7j+rX12V6LETVgpunUJXptK3+BqKDCbOLCmNw3Kb6bWOD7EhCrpHRxrwEMOeuGU7
X-Google-Smtp-Source: AGHT+IExLgk4LFH6XvWJh2TlOkeN2K8sXn/NODhuvQLQVVN3l8PFGUqseotWWhf1jijDquDiamajVA==
X-Received: by 2002:a17:90b:55c4:b0:31f:30a6:56ff with SMTP id 98e67ed59e1d1-32342141f5bmr14558099a91.19.1755490370228;
        Sun, 17 Aug 2025 21:12:50 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:12:49 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: [PATCH v10 20/24] irqchip/irq-riscv-imsic-early: Export imsic_acpi_get_fwnode()
Date: Mon, 18 Aug 2025 09:39:16 +0530
Message-ID: <20250818040920.272664-21-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_051253_398944_17119F91 
X-CRM114-Status: GOOD (  10.87  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Sunil V L <sunilvl@ventanamicro.com>

ACPI based loadable drivers which need MSIs will also need
imsic_acpi_get_fwnode() to update the device MSI domain so
export this function.

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index 2709cacf4855..2c4c682627b8 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -7,6 +7,7 @@
 #define pr_fmt(fmt) "riscv-imsic: " fmt
 #include <linux/acpi.h>
 #include <linux/cpu.h>
+#include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -233,6 +234,7 @@ struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev)
 {
 	return imsic_acpi_fwnode;
 }
+EXPORT_SYMBOL_GPL(imsic_acpi_get_fwnode);
 
 static int __init imsic_early_acpi_init(union acpi_subtable_headers *header,
 					const unsigned long end)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
