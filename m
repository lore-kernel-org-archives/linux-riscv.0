Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13635E82CAE
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 17:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1MDdKRvZRAztBDebLt8n4/Qe+YTK5CYeH5vpMm6l5ag=; b=AS+xYeL+cgTJV7
	zLP2DBTyEDraLaUnBSIUcNT43Z0u4yRkRQTOuwIx23shYVw/8FL6sJJdX/PH0gmsXsJYk/of+wyFq
	QScSZm34OWUd4ADRZSWRIIXbXnL4mZHZiRRBDzb80JWbC31yRhw7ws+6h0x+ucCix1eV79TMvoZJZ
	NfmhLA1dazUz+26IK/XmNofSWFpgEfyq/VslP9/cVUdyz7/USpcWq9f61NPfwSrFCrHhb8dMDOXTN
	vmO3zZWxChjqeWxXSbN48okariAVuNODpEkMLpjQXV4w+e5JPv8kffH9nBVZGnScxA/FfrLTB+2Gv
	3l7LFR2kxxDr69InNVFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlXtm-001TBo-33;
	Wed, 27 Sep 2023 17:00:30 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlXtj-001TB3-0Y
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 17:00:28 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-4526f0bdf72so4875188137.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 10:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695834023; x=1696438823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lR0BPLKkgj2fJ5IyWi7flO/+WIQlLqax41QD5MIUKy0=;
        b=DZgiiYTq7QdTDWUOnQbCdIYFG4DgG2QacKkw5y6k7AfrP5kr7q3IWSMYg8iujUapCr
         CCLlDFvrTnvChTM8GIi5v2WBTyEBD7G95ABPxZHnCf2eKS7HcWOMvP62QZ3TbieW5SKM
         3La370Pt1SOMejfdFpn7HJRg7LbUnhciKPOX8j6BuoqZOWGeafTZu7f/kfwd8lgHmhyQ
         F+UTHl6MpGM3f1W1wh6WsFbr+ZkKbR3VybF/3icpYoyCLLk7qx1NwBvc/NE6a9CDG3vw
         IdeN8Wz4e3gown7VXFR62dN/aWgbsimugBHW1kHqKXpNCHpu7k7M/GuJVqc/UHBszylu
         vMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695834023; x=1696438823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lR0BPLKkgj2fJ5IyWi7flO/+WIQlLqax41QD5MIUKy0=;
        b=UpmLwx/+e0UICYaXSo0KUvTWTC3NV0ZRvXJrd6fezF6AmKh7ovKgrM+TS7FviJzjHo
         yfV/PwIjqtWIi6SPBepTNYUqR427ZlW/tvbjXO/e/WIjGO6xJqgI0+or/SGA/8dfnAdm
         YYIrTWmNP6s51UaX/dqWfUP8q2lQ5hZTVO0aOIzxKcJhCBoAmhxutFhcH+60ZmfXzVWu
         hdn+BshPLmGH7w+4ZJV5pPNPBci0qrjmpIIvHLa+f5B3LNJanntAzMmpxZRn/8a6TaSj
         25+IHOQZ9tWtLt/oWG5wuHvuqRijya9zbJwnJZiwlSw4cWhSMCfqdEE0m3eYAFnW+k5v
         wuSw==
X-Gm-Message-State: AOJu0YxFkS1MwfbSah+MDfCIUoPmhBLmdpGzfw7fC5ceNQmLXKmWlvEs
	vOqgFiixUJKTu+Vkdt9oGRaamb+kzQthrtioOsQ=
X-Google-Smtp-Source: AGHT+IGbkNYcjY6OkDmHWUN+FpDde/aR1o0xZg9sHepbkCx/UdwSY0ITedw583PH98yPOZ8dUv5Kog==
X-Received: by 2002:a05:6102:f81:b0:452:de00:7ab4 with SMTP id e1-20020a0561020f8100b00452de007ab4mr1063401vsv.5.1695834023233;
        Wed, 27 Sep 2023 10:00:23 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.42])
        by smtp.gmail.com with ESMTPSA id u7-20020a637907000000b00584b293d157sm3279396pgc.80.2023.09.27.10.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 10:00:22 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v2 -next 0/4] RISC-V: ACPI improvements
Date: Wed, 27 Sep 2023 22:30:11 +0530
Message-Id: <20230927170015.295232-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_100027_358640_2507CF62 
X-CRM114-Status: GOOD (  11.02  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Kumar Patra <atishp@rivosinc.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Ard Biesheuvel <ardb@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series is a set of patches which were originally part of RFC v1 series
[1] to add ACPI support in RISC-V interrupt controllers. Since these
patches are independent of the interrupt controllers, creating this new
series which helps to merge instead of waiting for big series.

This set of patches primarily adds support below ECR [2] which is approved
by the ASWG and adds below features.

- Get CBO block sizes from RHCT on ACPI based systems.
- Set timer_can_not_wakeup in timer driver based on the flag in RHCT.

Additionally, the series contains a patch to improve acpi_os_ioremap().

[1] - https://lore.kernel.org/lkml/20230803175202.3173957-1-sunilvl@ventanamicro.com/
[2] - https://drive.google.com/file/d/1sKbOa8m1UZw1JkquZYe3F1zQBN1xXsaf/view?usp=sharing

Changes since RFC v1:
	1) Separated the patches from interrupt controller support series.
	2) Addressed feedback from Andy and Drew.
	3) Rebased to Palmer's for-next tree.
	4) Added RB tags received on RFC v1.

Sunil V L (4):
  RISC-V: ACPI: Enhance acpi_os_ioremap with MMIO remapping
  RISC-V: ACPI: RHCT: Add function to get CBO block sizes
  RISC-V: cacheflush: Initialize CBO variables on ACPI systems
  clocksource/timer-riscv: ACPI: Add timer_cannot_wakeup_cpu

 arch/riscv/Kconfig                |  1 +
 arch/riscv/include/asm/acpi.h     |  9 ++++
 arch/riscv/kernel/acpi.c          | 87 ++++++++++++++++++++++++++++++-
 arch/riscv/mm/cacheflush.c        | 37 ++++++++++---
 drivers/acpi/riscv/rhct.c         | 72 ++++++++++++++++++++++++-
 drivers/clocksource/timer-riscv.c |  4 ++
 6 files changed, 201 insertions(+), 9 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
