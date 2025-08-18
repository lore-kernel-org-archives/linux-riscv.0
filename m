Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82229CA0EE4
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 04:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmlCkty8Sk5zKyLres+whKTWlpGbIWO/UCfpQ5Z82Ow=; b=gOGIfYI4AKQwAf
	ilRXsy6oSSy6m6VKEVit52Uw8L5+dITb9k/g0XcIkCKhGxeNWYauzNVm6x1r17SVvpiqcbHf05Vx5
	Y3nlvu/9OdQ1QR6QeV6kPLEWDGCYshOHwOQupp+28ozRMRtqu+BH2zFCaqexxZCT5OGDUpXreheHh
	seTsWhXAmN75NLD2OijKk/3BQUPjPKChWeun1KMH5750CsGlG+Y6I2MNVrQzahxrx0MzfRhyVscFh
	X+hTqdIndKJX0o48uzDDVFfSHyDNrEClNnQUiFfBPIzE+sree6ou0/5S3dsYULSbQ6c8ICUeMVPkA
	A6hXUWI4Hr4f/Lv3nD7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrFN-00000006RxH-14bw;
	Mon, 18 Aug 2025 04:13:25 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrFL-00000006Rvt-0UaV
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 04:13:24 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b47052620a6so3704352a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 21:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490402; x=1756095202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PujbwOz9dknJBj0WiTvzomVt33H+ylTg1a04PuImAic=;
        b=k1GNejs/lmmtVPD4JOfpjc+gwHXoG8+xYdtrQGY0l9HoQJ410seSwxHYEXSCNHJwdg
         D7mpJK+7LMdtVJMF0NjUAoSpMa2aOhowywvXXZ2i8MrS0JwvOg/3SRqGJyfsT8YiQ73U
         FiyYR+14/z9Sutv0LV1ULxT+dECSK6lzLGS3ZyIWmHVxHznv56JgcM+gDJGRlH4yjgDN
         4A4wory62+qNDqE7ZDAW/j7NMMKcgCEWpwBCmrZO01D+4tAH8vlTqfIhbdWX0RtqosAB
         pXvfgoKic2nttj5uq0BOa+KRlZVky1O33Rhvpddu48FA3rJF1RnVgyaRF8swOTI3kNK7
         28OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490402; x=1756095202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PujbwOz9dknJBj0WiTvzomVt33H+ylTg1a04PuImAic=;
        b=bKwDDBRKZDCHARvCvD/BGKUw1SaX8TGwqYwbWv6e62/3tbyVkg/pC/vc+j4PfUcg63
         BLZQa2jDSSIdQ4ukH1zrq/g/vJENWkN/Ly7a/mLoC6b2DUb5Hwyw3E/81g5tNl06jNif
         8i2Ovlc2hJRb8jyCvLcKLYunW6fc8m3j0Ek1TAvYtWvckxtkSt5imJ/H1YOXGUCJDgyV
         ACBIUB3lpX9IE2uwMWkfVyONJwTVKQifUkzBCPFDB2Da76FI4wRQ0czXxgrqlmVkqMY5
         dOCVibomY3rYy1Vi3wcn1FTaCjymgyA8NTwUeayliY8+JIoZiVAlBGJXl3UgZXNn2MSI
         MWZw==
X-Forwarded-Encrypted: i=1; AJvYcCW37/r/Lt2l/8dETVR50jgrgPc8sFuhgMXsiULhrabnY9IwPxfhxay/hMWSQlQVjnTmkglqHlhT9c2+fA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfXADmpbr9m4pNfb6FsL5svGNEbfvNuLLo6VZKhRKcA11tsOnD
	3VvenQ0CCrbL1gwTmmYNRbb18lEOt55aZH51DN4apfKwRLxdIBlifG6dFAzdRBwU3QE=
X-Gm-Gg: ASbGncuDVEljXibrLm5KUL0aSX3Mcaeqw1/aE1K9YATCZoNeoWA+x7WthkMHjqxY6J+
	Q3C4BXteGowVAIRjQMU/3L6Gd6jLNu3ZbT2IEQduUSfWgo7SharPYtrNXYD+cbu9hz5DjD2ADKN
	IdzTMblfDkGW4MgbBysDHm9Uk46KUz7QyHknO0Fw9rIBnWzOQlxQxXhzkery/4XrPmahO4+6dIq
	J5WZekvwe3l6R1Zo/vtqJRduIiJXZd6qOWHFnt3Go++7yJ06vFDminkF24S8hVdK6PhXloVf2wa
	SlK7ahNbnRasJTGvsuWHWx6WHVN1K5m5BLniQjYJAosnfOapG1SIeKOKG3vfdluK9l/2aiC5Cn3
	oS+4k6/gqtiUKcLV6il8rCi0X2NNAxiB0rU0LC6EbIwPy5Le3khUZfg==
X-Google-Smtp-Source: AGHT+IHd64OLVzgyUo/oPlpqgL2RhIpctnfrLzAnLHSZJO6tBzpwKW59cA8/JZnKdWHEIOpAgVUkNw==
X-Received: by 2002:a17:90b:2681:b0:321:c9cf:deaa with SMTP id 98e67ed59e1d1-323297bdeb6mr20158792a91.17.1755490402208;
        Sun, 17 Aug 2025 21:13:22 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:13:21 -0700 (PDT)
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
Subject: [PATCH v10 24/24] MAINTAINERS: Add entry for RISC-V RPMI and MPXY drivers
Date: Mon, 18 Aug 2025 09:39:20 +0530
Message-ID: <20250818040920.272664-25-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_211323_151546_6FF0964A 
X-CRM114-Status: UNSURE (   8.76  )
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
index daf520a13bdf..c675625504de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21698,6 +21698,21 @@ F:	drivers/perf/riscv_pmu.c
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
