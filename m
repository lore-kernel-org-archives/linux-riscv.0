Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27E9C83038
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 07:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lWBpiv+x4x6Mlh8HBD1dkwrVzCLyPN0NX5O6w5qQyxU=; b=QeaKzEHVdlVHEC
	B8k8sfsy4DSeFw79iTFyTupiFu8rD1xifzu6cPakyXZ8Vsaf2C5GQMwDqOEeyrRfbxNJN1twN97ci
	WbFrIACBi8TaAvQC7QtMxJRE53+7zTHagRficsN+demEQDWAtuKbY++7m+509nikZtbp4QmpyI4Cm
	aGF09p9q/oet8P/SLZnhgbdUNC0ym5ysuRhf4OEwVHpQx9BkFu/3C9y/eCD+89/JNvC44WrVcMafE
	ybqjMB7/QhMQTufLDehyqAsHIkAsojQe3E72oswTTv4x84gol/UeO2BtRV48rrkYNm54QqVLOZ7B7
	1w4VFnD1aOyRxsiTRdXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWsFP-00000007XzG-3vxK;
	Wed, 02 Jul 2025 07:51:15 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpqG-00000007GWw-3Mf8
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 05:17:09 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2353a2bc210so37520475ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 01 Jul 2025 22:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433428; x=1752038228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t84+O6WBdBY0SCc3BtWc+Gw5ZYyMJomoxrVu9jQtsgg=;
        b=aA3HRPpSI4banz92UdKE1/8gM+bNI0+eP/WzX622w/v5cpXSPJP5jEp5tTUm/CHS8D
         r/o7DwnLZdQ/ARsfYBQePRegY0ExmCIcIb2YVNjJW7Q0c94O0ob0btHyKBub1JT9aD5k
         NKT/T6R45yQYjshPZx//VP5BqeCk2wci3ypoJY+TYQjVjdOtoMsweX7DKRXQ01JyWvs9
         bXDPd0XOTzw2wxpfB70Ngf8IQOR+cL7RkxWGWkxkkcmxVI0o8B4sc0knPSOFEAbjbGn7
         0Smm5KG0IvqF5MbYZSkpsqA5UVV48CdCH2uSnBU0Ijpqw/vOljnLnUrn0DbFCEbCng9a
         6trQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433428; x=1752038228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t84+O6WBdBY0SCc3BtWc+Gw5ZYyMJomoxrVu9jQtsgg=;
        b=HDAHos3RBvqprbkQLKqHmTdkbaFplRBIOELFbYxBurN7HHBJQ8pB40nb3yjD3M9cdW
         2RHkIs4hifMKiswUPddZKxVSE3G2VZ6oe9XrMJzphd/g8p537T8nE5fvjckKI988Ia8Z
         pZ0in97NfQhulULpGIfP8y9O8ZxECUBorFU8rXMVuI6UT/PTLq0qlG46K4crnlAqrdnK
         YF8Uy1bhN4l+n+W4B8TlmyhIHWyMj2YMed9MSJtY1VTRxcxus9539qOJZSHtirEzdZU9
         wc0VjlXW2XCq02Bg3m1cYzws4TI/IDq/L4q3PYEk69mRNVRiUrcRIJYhWHoWOnWTy+lX
         bIXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb1vO3eqmttIGaqkjXOmGVdWUmenEs/DujV+/FRG5dEgQxsyWGUNTRdppGbM6fVng7onlLFL9JhvxLyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSqJU0odn0cK0lAGhJGTOBT1kplweLj0OCrTykCXKtOlkaSIu/
	lH5J67rSvWwuw1HoEGI/vRq2TRnxmR7vrjbDisZUK6uT1Ck1gE8oaXQ+6WG+2cL5UzM=
X-Gm-Gg: ASbGnctiOPnHbCVNBb7JHMH6L8HIw0btKOk9nRm/abGgS0yAHGAGNlm15h+afmYLw1R
	e1ISzeBaGQWoTg/5evN6Ja70FKBOdQ65EtdyCNX/WLj9TgWD3FK69uO3SJS3/OSuE81tgzV4kbq
	vq+AGktS1bqIrCbT+O2Yjn0V2Uwb5EwMX/v62l1Lp3/tS/RpaqqYXi+bUCzOVU7xjlUItzw+pWN
	nPAFqhoKWJVHeQ9Wm9dMxW3Psu4vyzZhLl3xJLOA1BoiOkPJ1JBL6Nx/gfa0gN5lGgwUhG0GP98
	ggcZUBLPDJ/cITDbleEK/4n3pLQ4Yo5K2GtVWSZj6r5kJ/UCNWQo8u4i4XEDGbB5Uk5gFCm2m3D
	OoAhNkaoNlfxSK3Ex
X-Google-Smtp-Source: AGHT+IHF9jCGgWd1zPtdr7P6gyUcMpmB+BURtwnVFT7vtNKBR1DlMS0ym17Nq8ulkiJ1AGOTzoV1rA==
X-Received: by 2002:a17:902:cf4f:b0:235:27b6:a897 with SMTP id d9443c01a7336-23c6e552a2bmr15106685ad.34.1751433427932;
        Tue, 01 Jul 2025 22:17:07 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:17:07 -0700 (PDT)
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
Subject: [PATCH v7 24/24] MAINTAINERS: Add entry for RISC-V RPMI and MPXY drivers
Date: Wed,  2 Jul 2025 10:43:45 +0530
Message-ID: <20250702051345.1460497-25-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_221708_838667_019525EC 
X-CRM114-Status: UNSURE (   9.80  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add Rahul and myself as maintainers for RISC-V RPMI and MPXY drivers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 MAINTAINERS | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4bac4ea21b64..c22434a2756b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21397,6 +21397,21 @@ F:	drivers/perf/riscv_pmu.c
 F:	drivers/perf/riscv_pmu_legacy.c
 F:	drivers/perf/riscv_pmu_sbi.c
 
+RISC-V RPMI AND MPXY DRIVERS
+M:	Rahul Pathak <rahul@summations.net>
+M:	Anup Patel <anup@brainfault.org>
+L:	linux-riscv@lists.infradead.org
+F:	Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
+F:	Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
+F:	Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
+F:	Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
+F:	drivers/clk/clk-rpmi.c
+F:	drivers/irqchip/irq-riscv-rpmi-sysmsi.c
+F:	drivers/mailbox/riscv-sbi-mpxy-mbox.c
+F:	include/linux/mailbox/riscv-rpmi-message.h
+
 RISC-V SPACEMIT SoC Support
 M:	Yixun Lan <dlan@gentoo.org>
 L:	linux-riscv@lists.infradead.org
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
