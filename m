Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E9AC87FCF
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 09:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fOPTgYI51HY6++D3wKRjgdJxW++gKALD3bdDSWwFej4=; b=dMIOshCHLgJOOp
	psmphah5POrqJb6iTTvL1wQ3F+wrdZ9cFLI6Rp7tXq0caBzSkZJo08KHAfn+srLYVhoR+vl47tnx8
	t9/9YgHBWNWFpVoG/wHglHPBaqS/dyFX9PH8O4eC2xayb0LDK4Hw4T5gAUxlxMCzSNDOR4IN78wMI
	vE2OMnxMWxRNqYUXiWqtHuhftn9w+isncajJAS7i+E7xFXjMS/IoOcru1SiNeXF3/snw0sKMvp8ip
	G1WKxw44Hz2uQObuhonlyY1lY75zU2mT7R/J3luOyT3D7DtBiQJV4uMAS6LXPWzaJ/tu1pbUiOBjT
	2jBeW28QTJX/j69McSnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKRj-0000000E9Ul-2LHE;
	Mon, 28 Jul 2025 09:47:03 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKPd-0000000E98f-0ysD
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 09:44:54 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-31ef50d8d57so476575a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 02:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695893; x=1754300693; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x549zkWeZBn9yckX51psel8f2gpHv6i7OmNEj/3BvHk=;
        b=f7V+kd81sAvQM4yVwtZsb/FAprXkO/h7f6u16691w0ys7iEvKMF5b/+uNE4+NmDk70
         ivNya8tCIqNJcItFkSe7wy6z9Z0iP1qNcEzE3+KZXUxcMOFVSvdXZpX0CIym6vftfurx
         y1fFbEawpob909OYvpLbQuM9t5Mbuq0RoIZc2DxgLeuUO2s3ZwORGZWHPBwvtqv5auHO
         DQfgApIKtRfGhJJ8o+KMAAFDn0QgZDRqYXjOQDpdUCAOQ14QAkrmPcnCvma/dUYf7Y1+
         En8cjk6VoPZXLDfNp0PH+U58oMKnWudwzbjEEXWXpUkLwj+zwNcX7kkJVlo5fB9WwmFY
         WcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695893; x=1754300693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x549zkWeZBn9yckX51psel8f2gpHv6i7OmNEj/3BvHk=;
        b=tS18G3OgXwHOO7h+Ar4vDN3TCrZc1osck7uA4ZKLd2OxdAdOdftFv1FgG3Ly1F5BYY
         0e15kUcoE3FiQx+zDB9/q1AFtwMSqqy+P+lVpDnsPpz07LlcaQoaoFiH8IUBBe/B540u
         7svzl3y1vSGk7mBCu6W51YIsvy6lwLwifZLsBxe4hrdWK0hQCVFlGFWaBtKgar22xNCp
         w7Y3LQTMSo5t6XJao8xBeYleUEPjd3hNM4QlX5iSOD3tRHwGZ8o08U7NNDVg1d4U32xA
         8a9lfr0p1ZtgT+nU9chs9gnyXiuSOb+TmaobQiDVrzbEIFchZCYJhOwZsgQNPBzvCFcv
         4zIA==
X-Forwarded-Encrypted: i=1; AJvYcCWmkMZNDKGp5oFCdHmsnMHphMormhVP2BSeWjcVcmIAPnDoHRxuA+LWSBFr0czatESyg7fo/0dv/w7mSA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfTgECmwkPGjOmxBRNpVRNY3GUZI9NFT7isbbhy4XmyjTL48P2
	uOXXAb7V0H1rgS5spJ8A3W2TWpiQbf4/OQpcouECV57JALflMJeVBJ9QhKD45immkZc=
X-Gm-Gg: ASbGncsA/PvmM0T83Ayupp+oBXPyA10gMVSXs77/W+9SEmJOt+7iMnE3TUBNsSQPHFN
	Rjr3Isc+21Tw6GtOpuyqPfceT+pNB1k4d7MRIux8A18lKamHzOcXQiK5VgDnOnkKuINnbGom3hB
	ri/gQ/4ZSXjzKvnODXszm+oQ4VhD2btvTOOINHwa5IxLKEVfrbzFrn9X4Fgj4FIvixCPQywZdbn
	pjLlbnXB8asfVBxzB4eBzcnSj2oTHiDpxTU1XFwV+qhmA0uBAGgMy9KFhMiaHWVWqVyRMeRRNki
	Vg8tlBIqi8CZ0vxCOT20BKvvdTKjIVVUEoGurOwVUZMMLnaN3d5uBK9pjSYR+e9xZhCYIRwe+sF
	rX58TZqVjMFa39/z6oyNSR2MOcK9uKY1py753x4A/8u9TJXcBLZPU2kv6sBpp
X-Google-Smtp-Source: AGHT+IGSbo27hBN363qDwsNMdhMoZk2PtIESdVUuOULrb8b8ZFITrd8ZdG3auXim/8/7RPtqAB6o6g==
X-Received: by 2002:a17:90a:e70b:b0:31f:1744:e7fd with SMTP id 98e67ed59e1d1-31f1744ea0emr283600a91.31.1753695892281;
        Mon, 28 Jul 2025 02:44:52 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:44:51 -0700 (PDT)
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
Subject: [PATCH v9 24/24] MAINTAINERS: Add entry for RISC-V RPMI and MPXY drivers
Date: Mon, 28 Jul 2025 15:10:32 +0530
Message-ID: <20250728094032.63545-25-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_024453_276553_1F7E127A 
X-CRM114-Status: UNSURE (   8.66  )
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
index 10850512c118..ad6404e8292d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21395,6 +21395,21 @@ F:	drivers/perf/riscv_pmu.c
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
