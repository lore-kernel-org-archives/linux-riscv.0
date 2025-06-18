Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07A3C7115A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 14:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CXcgn2u+5V5GaShQvbGFtoc1zVpzFAgfZfdwRcAedqI=; b=0vvN/zhUOveIq8
	pBbJF2HiWV0AEQu0BEYjqJFBYkn8oPVjptpm1lPx8jLu6g+nlQiGgjb5hZGwSlGx/YyB8NMYsbKTs
	1pb1ZO4KDZy9knhOkm4zGaytuE9nCuFbM6FjohqTFk9oFNhEnxxXnB32ahkCBGP2r8iasCcH7Hy7J
	WcDp40o+R4l36CaYj+3FoGMdWKX5HLqjSwL80SXseZveqMRFpz9cK9QiMFRkbFW5dRWpqzKmanrbg
	USHITJtXBPTu1uJGJOB2igjb6bqUeN86rtDrNkKc6gWShsYCcccRZqrdWN52755dVm2yXGYtsl752
	IRgIxeljU+Q/i6/ypCkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtpP-0000000ARKC-2z6I;
	Wed, 18 Jun 2025 14:31:51 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrjS-0000000A5kF-0AUg
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 12:17:35 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-747abb3cd0bso533005b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 05:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750249053; x=1750853853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8tBKVX30NLoa4br+Bk4w/D/MRgyFgU//5djHLJDdbc=;
        b=SR8GMMh5uZm9tKiM4vHUuWyY0+HjFMG1RRAmnl0rLC1ha4s4igo8EdvMGjCHkSlWAC
         YvJd65SapzlqNgBQ/NhLtym0VLmqVvfDtJOg5LxXPkJ4ZVLhW/Je6K0/+kHQh9k0bENg
         he8N6jPypvgpx3PbSIOXlxAOvEvTWsWzvwYpZN8Il6HGs8+1VQtIzTBuNvEp1vt/mfA2
         o4frqPYG01rbA0EK2etAdCLgVXj4abzr3GeWzQWZa+rYDWDHgvzaETEVHtu6RjABTXXF
         CuF/kKJ91E+dazCddyTyd6AhwJh9cUPDMZmxOhGXIoYYo1Emf/HgyIpJ2Y53Latj1fOf
         MQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249053; x=1750853853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8tBKVX30NLoa4br+Bk4w/D/MRgyFgU//5djHLJDdbc=;
        b=GJybt6S9ZLQ3fjjKAvjTT0zabzL54Ro4lbT6JrG4gzUzAj21SS/UipmTLVREZKGKuO
         8y+IxZ3dd9C6Yy+7lMWcVQYOdjYUpNTJtY/e8SFJNMnK3v+ADBtR06Ipb5hQu1g4PAA+
         nLy2y3JtonopKGLDkAi6fRPUsGqkjzL2hj6ZGZKv2JNKDCAq8Wnau13NLRr8izkP77sj
         SOY+7RytUpaW8/gOQHd0bFxYN0MCUk+BL9dtfkMmRaU7FPdf723SK66dL8wUQaZXSyZm
         Ylig5o4SDe23XlJerucaY+W3SV20Z2PLqZYfULbxGU7jIVLbFyfylYi0xtVS1xB87w4i
         dhzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPyJfHsacrCRVSUqKmHWEgAbr8E4baLHL99NTvmg8rxYanlr8fP3bBR2sDKjx3GtgsxSKcAclCADjWXw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWnGayf1oVZs+X+6IAbdtQw57jdgyavXCeXIjYX8mz4t3oWQMq
	j+NTZ/ul11JpSb40rrD9YIihK2RHR3fYc7BbM+XwJTrApYrJFMt3tTE4NmCF/lDz/V0=
X-Gm-Gg: ASbGncsLng+IsrSJ8mnTu0kivI1jzIQ9jdnXhLYBzoylQ9X0vQLcW9VaOoHSFqXo5Mk
	HR3GyX9v80uIFH/NkpJ40PvaeVzb0M9XKCEw9p/QNJrWolHi6uZ8SZggSftUjBT+d+98eAcr8vC
	lXtdzZx4eORyeYru0gI1IkJWIYQplKcoURMpz9BN5G04ZuwGVOoJT3NHYZuE+bnvawbrQTYSgFe
	PfjkEcd6g1r6sO4v9VJNxbvYy05agRudxYiopjDOQ2ytM1DdRyzPngRSjqPuUFiHo9Ji57xW12k
	f97VWfrAZ7B9AOBA/rPJyzVKYIgAGPM4zgyGhqKyr2JYCwfuGeOsMVaFphWWZ2HqmxE8xhWF9FY
	dyUxE0yHJt4cz9fROUw==
X-Google-Smtp-Source: AGHT+IEWGi/cAL/pfhnuBa+HjvvoDBVM4CSi/muR85WOt2UwTAsiTGP0+QbukmJ4eBCotN/31dgHnQ==
X-Received: by 2002:a05:6a20:2d12:b0:21f:53e4:1919 with SMTP id adf61e73a8af0-22003652154mr4644799637.3.1750249053381;
        Wed, 18 Jun 2025 05:17:33 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:17:32 -0700 (PDT)
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
Subject: [PATCH v6 23/23] MAINTAINERS: Add entry for RISC-V RPMI and MPXY drivers
Date: Wed, 18 Jun 2025 17:43:58 +0530
Message-ID: <20250618121358.503781-24-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_051734_079286_C067AC89 
X-CRM114-Status: UNSURE (   8.98  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
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
index 0c1d245bf7b8..688bdaff566a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21364,6 +21364,21 @@ F:	drivers/perf/riscv_pmu.c
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
