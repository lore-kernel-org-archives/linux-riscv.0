Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F0F3C61CE7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 06:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9KauyOr2FMO6T+975ZeoqwQMuyi2OFJvvC7Ojhb1/o=; b=FEPT6jAtkH3j4p
	yHDDeRtdVK4LJWXb6Iv8prSSGivaJb0/MeNHPK7tqwRdGDw5mM3xlwSQZqf47SdFuItzg8MB6dAZe
	BRPq9CBi10D07cQxUtYkPrTp3Ho6TlGqGlGBT2vxWCu0A1bHSohzUY7Gz/WSU//AnH4WwnHCG9N4P
	aSVmnXQCWYiLNg6qBAZyuvrVle4UzOtIF6s9jG6Dak2SbG1QHW9wezPgYtJyznkfuOCKQWPH++Yuj
	FtIYvj7J/gmYNtPdx1lq3sM4D0uwZpvwFTQUP7lerpw/KTy/zwYk/k9fpBcOv2Spc9yO0JeyQUyK8
	F3bgnflMmd3MEdLU7O7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEuj-00000009041-1Plw;
	Wed, 11 Jun 2025 06:26:21 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEug-0000000902G-1eIj
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 06:26:19 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-235f9e87f78so57742365ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 23:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623178; x=1750227978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2ugGpXC4o/CNHHmtI6Ytb/JDD4uHU55rBbbL+FpeXA=;
        b=NFSp+m4KTVzE2S0Ki5+h3TZpgth0crZWxNirajL9gQCyKRFzQMso1e6bKMDq3RnDKV
         E+V0Iur8tK2ZiBUw2mvvW3wV3VZZ1+cpleXz5pTk7vLQbsBJLiATiinYxZPcqsA3rdj6
         GFya1osPVr+w5ne21Pif0AEcsLT6ePLxJODtn1uymi1L5MXkfqWkrn3wNqrvx2nViuAp
         CD0AVhKUMicTnW/Kr4v+gjua17nx+AS/sAdYYulDkW5dQQNsvUdxzUiZIVxUf+HBx7vw
         aXTc3uj2+8vwLbhvvwrrnZCBhWFc5vPVYdx2cdHn5nBdeI18Snmr3uib2jXXAoDMTF7t
         78EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623178; x=1750227978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t2ugGpXC4o/CNHHmtI6Ytb/JDD4uHU55rBbbL+FpeXA=;
        b=mXY2jwJSjNzp85faeW5rYGzjvn/8i/FPsijCs9RBO5LR/xa32dM1H9HOvLLRw76g4F
         3BNUQxGrn5LyXZFX5z53HPKa30Qt+dOcb0I8mOFdeJmr0vOqXIADbgBxHYcBoLvRcD9s
         F4i271ssmahfqbfYaoBA1u9nc+yriFEvfOyHLQj5uArdEQ8V2XAJYQdjPwkcN43Q0ojl
         G4RvwTY3skDuk5ss409J8Nuhoqc91ljmN/vtOokRCLjffJw0+AzzfAIXEbGRHFnVsjo+
         U4cctdosRvhPButRnHsmetd1bl3+T9NnG3yMwzQm+JpSBDjU9qHsbMycacDV1Zr4D3Be
         uH/g==
X-Forwarded-Encrypted: i=1; AJvYcCXPQYyXOfvUqtOmGLyrQNg4hEzedA+XLdC4hsVU0Ev0ZIbdCBd50iJl693GrS9JdKH1YUq+cOf9g65Uwg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/T3mgurnNEvM/AHgsCdZ6nuLX/eO6vrPNegorVtplcIilE4Od
	MizUcHfj8pB1iOrMdfPJxLF8kDGaGDMTYrkp9i1SuXxiH5jMdkjNOZVOMQhhDlJmsyI=
X-Gm-Gg: ASbGnctr4qUKQn9jtNRiJmyWqIJTXwd7GosdL5/Y7WLdjx9yrvoc8RQ5lxMYWwCqdvP
	eEkNrWjqNWbMGzkSlo3wkyShCrJjjyFRjcrAwy3zsNrFZsFkZkcD7XgKvoDUhbzqOD0owV+JGKj
	DcWAtbxQtnrWUZOWuryRXsQGCVhOnjBU9oDcC4vViMdXPX/sxWHBdXWuYDzh+Xwg4z4CV0VpMm1
	P2UOvKWULluwdjExeEMttBfm6PaXEnlP9MV9wAo4s+6+aREMlYmYcv0QmZnUUipS89stb83aCgb
	4NOHFu9Oys4XNbgZ1hnrGFsuOhhQJ8NfZ1tH0nyB9ZiO63atCsb83o8JE0Pl7KkLb7GGFiozmj1
	ztMBo1UV8xNcNvM9V97q1VxzSpQ==
X-Google-Smtp-Source: AGHT+IHWcPo2T5oWAHxVCtrvEXenhjJ10/Omq5VoGqBDmOSNSjGENAvaM/GRXOOcD2Yi8BQMsG2wZQ==
X-Received: by 2002:a17:902:d48c:b0:234:b743:c7a4 with SMTP id d9443c01a7336-236426b4fbcmr25446925ad.38.1749623177773;
        Tue, 10 Jun 2025 23:26:17 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:26:17 -0700 (PDT)
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
Subject: [PATCH v5 23/23] MAINTAINERS: Add entry for RISC-V RPMI and MPXY drivers
Date: Wed, 11 Jun 2025 11:52:38 +0530
Message-ID: <20250611062238.636753-24-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_232618_430975_D1F9211B 
X-CRM114-Status: UNSURE (   8.55  )
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
index a92290fffa16..5ac1746f3086 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21361,6 +21361,21 @@ F:	drivers/perf/riscv_pmu.c
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
