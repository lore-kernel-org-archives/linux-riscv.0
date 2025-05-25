Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8660BC54E90
	for <linux-riscv@archiver.kernel.org>; Sun, 25 May 2025 10:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OikhvkuKwpDVQvPqSIxdhaVRpIykFQp0R9PakVoTd1k=; b=AfEJM7+2hvuE6A
	B8ZOswU74dYijXG7ZfJhUyDHEUgE/ej7xxOXTkmU6LYVkhWGgQ8ByAD/HN5AU16XqSXo3n+87TfRM
	r9z1dSObwDHyzCCnEaCfEdYQQLtq7EiomhmIoER2olj5+Zxh48qh7DbgDIXx71zDLn2pDvnNtUhok
	zWSiwUB9vmxGe7ubriurkFCzXMP+swpoZz+G87GOJsr5wfJznMnnJTrh6KHXxgcYn5yPjTwLdgE7x
	CXpa196uqStbZmtbF0c4ElWIj0ilrWZHziyITE9WoEAfIpBEMi2d/WRaIe1PVa8K7XvBbaLNOfifB
	4N8C1YDqBlQ+mQdV/yyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ8D3-00000006vLK-3HKW;
	Sun, 25 May 2025 10:04:01 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ73y-00000006nUV-1m0z
	for linux-riscv@lists.infradead.org;
	Sun, 25 May 2025 08:50:35 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-23428770e1fso4484505ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 25 May 2025 01:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748163033; x=1748767833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHC1UEZymw9wnnpkV/BuwvpiaSVPH0/q81+93KLNW1U=;
        b=XwCcMNYlOa5TY+hgFQXygEsTcPu7DtdLqTbR5CHqdfnUfGZbyP2i70+n5wiT47ILdW
         W/Tv4XGW7DZhgPp4F1bIGAiWCyIFExsmMHZQWxfJXH4ty0gUXPrWcyKu20aKf7lhdakK
         y3XCEYk4tn3W0trzo9pi1PmXNpcyoyxxxPXMm++jPXGBccg1/AK9fvLTYsxEFN7HI9gp
         P2jk2AZzcCrL1nXTE6/ctmGapjAckYDfutJ9epgLHDMuA57ZR4u4CIkxojrKtmFQNuQQ
         TrIFhhzlvQAR34WABSHvejIuCcwJe7fLGI7OuJae0wT1HHAs6oEixLoCA05dXabdNlU3
         AXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748163033; x=1748767833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHC1UEZymw9wnnpkV/BuwvpiaSVPH0/q81+93KLNW1U=;
        b=u2FiPVhpsipsAhGSZu1KxE5r3ABZOsbwzGLaCqq040ScpMBYHjGx2CaE2apV0fKVtm
         IAxM1VlRIu4kcGgAW6KyYy/RYdySt+37tsfZ1XBcQoHhMW1NHBKpYKMc56tkWT9y9V+T
         pYNvnRnsIpt6g9yquLY7mgRVF+djaj0IyV1/QFIP9ayaZlUiESn6L6NASvc2KTilNSlg
         NcYn7+V+CCGHhXLq4StWf524EfPrzlv+ybvxDrDqOCoNYe5aUEldKMDYKodpz4i1uKBy
         gPjkBXP2kjC0DkaC5+cMjYIXMPozWC4dTFX/fdas2O5LciQujejS9/dqNaj8/fwsQX9s
         n7lQ==
X-Forwarded-Encrypted: i=1; AJvYcCXX416lhEZAXyqFDLcbvLUz8xe6mvXIoTsjUpgz9KMzX+UfqR63++f9iBu8d65hfVmGZ8FKJyaq2WYMZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCQq9hsSdSnqxDgOPZyV/CIn4rrvcilIPyO08qqn365oO/8a3M
	mh4sPeIveq24Br5kUrnOH1/V19de8lD2UGKqMm9eqisvHBUvo1kFfDo90hDUFKe+lxI=
X-Gm-Gg: ASbGncs/PnfoBxWtDPt6MTNYsdQpYd+wwKCn+gGUm0KbRsdZfuRoTf/3Tcj+LCrFk7x
	Bq9K2u51heWWcpbvesPNJq8rDU8KB+ZeQoCc3Q2AN7aMi+m80ls/QoYZZD6d0jSHWiuLFJgHsx3
	YdaY7ETUnFjdXel+IFddXBOhzhkAShOAOGXgT46V/Pnh2CAwaxKn8a7/dR67eD9ETDH+EzQiLEC
	wMJf+03Rg+K5P2NeM+/fXFJWKyox0oJXeqw3D3m9SG1YoiH5P937ZYQxg35RceG8F8I+BAw1hgt
	7wXKGTFL8NsCHvGC6lGqUVBwZSjMcr3ReJDbHh2GuASIzZL6BLUr+HNmsnb4Xnm2Hp3UTCYSeNr
	lZGeEAF4P
X-Google-Smtp-Source: AGHT+IEZvm0nbOinSt/PdP1ymjs9KkhXXFgMyCQpgodAAZI4iEJHOoECkEhtpUUCnZco52yWUXVFNQ==
X-Received: by 2002:a17:902:ce8b:b0:223:5c77:7ef1 with SMTP id d9443c01a7336-23414f7036dmr90752035ad.21.1748163033368;
        Sun, 25 May 2025 01:50:33 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:50:32 -0700 (PDT)
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
Subject: [PATCH v4 23/23] MAINTAINERS: Add entry for RISC-V RPMI and MPXY drivers
Date: Sun, 25 May 2025 14:17:10 +0530
Message-ID: <20250525084710.1665648-24-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_015034_456795_FDA6804B 
X-CRM114-Status: UNSURE (   8.95  )
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
index d48dd6726fe6..f09b865a697e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20963,6 +20963,21 @@ F:	drivers/perf/riscv_pmu.c
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
