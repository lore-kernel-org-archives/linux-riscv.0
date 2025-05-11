Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B378C3ABC3
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 13:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nmHsK2FeIyppoJ5trUQs4CIukIWj+x2kVBsqSkOb848=; b=hQzhGahyWIIBt6
	dUXGhaIn8NqrwQ724j07yDSMDreW20HSE1UPJykH7CDrjCEoPoloVR0/E+lEjO+LtV7XLvSCSSdN1
	U8utx7GiJJhNYrSnXJQU9edY+JtyiVEOHTiDDM7SKvwz3nmnfK+4v0cOnttnvynTWvS5jM437Ld1K
	0lpNNK0KX5ft7CTvwTwCF8OFhhc1tdvUHXWWuI9Jv7hFG37dIcdnL7JA7UODT0WkCbTDGiUES0ZyT
	yPizlbSO/mpMxL29tjcwRgi2HPjCGmz4Q547hVwqcM3W1q3D4QydOhvU66hVcadFTVWLcJVVfkvCh
	yncAMbBUTkCfAHYGF0SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6xh-00000007IdT-3ujI;
	Sun, 11 May 2025 13:43:25 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6xe-00000007Ibz-16BL
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 13:43:23 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-af548cb1f83so3100778a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 11 May 2025 06:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746971001; x=1747575801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYGn3XecLxKlXcXghuizRd0ORyv4dXXBBqocKLMzEs4=;
        b=cJXk+bev1IXJetjhJFczbT5xvlsRVm6paCvRVjB1aixygI73lc9iQOffEg3amExkQ+
         mEE6JBU2KfanEOvNOZCtLCYoCv7D4IK+dvs3M0fWof8WVrjdQaFtCcYzc+ODZPOXayT1
         ZA6IFWRLDmYnk4AYX4Xj4KfZpGO5hTTPcvwe4Z8s0LVU15IpGMv+q5gYY13VywNug9ts
         TijgPEGi7l4aV7zK30Jx1qlo/F3f1SuahvdgxReldZOqlOEUg9y6s+eBQWB9ofK4I86w
         qe9weHloYvkZ6l2DQNmNgxSXJU6pwthNXf+S0yO8s6oTC6Y2x4Z4oHGHpcMZzrz/SYo+
         WbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746971001; x=1747575801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYGn3XecLxKlXcXghuizRd0ORyv4dXXBBqocKLMzEs4=;
        b=UL4VpHqaAvtlgpjb9U7xH6HaIwtK9/cU175panRfJTd+UFTj52wkHdx+GT4ovVuNrH
         yeiSNWO8FP51OLTeD4um/9NHc7ftNCqv7rP0BN52UmypA2mFNIWFW5KfLJ1jM2Flgch/
         H48ErP8lPU/xO8HoPQohTU6y4P1TUkfWfXGG8KjfaBlYF5sAuT4QaUVvkA9Doldpk6/K
         +ak7qt3oHJPvNpsliqVZP84uyJySxLigY+p5fmXKZP1C2zbJBMJWehdLFKZKSsM4eudJ
         95sx4Se66C/mbji1K4GJDfSFUPo+esB9ufCq+tdY2ymt++wlJZssTbTrEy1p7cUvDNy2
         vlSw==
X-Forwarded-Encrypted: i=1; AJvYcCXdz3QtjcLERqJNrZduKCWqlcdzIHqaYhm6U7RND+JDawWw9yHMyIJP1x2NMYdUnvIJI7DMq4JRjGjoEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YztWL/7vhO2MEzNrXODzafVWZ3+fa6See0WfjRx1TRSq4D9JMMR
	c83TK2mR1zP5cmWC7bACAFGpT7fc6XNjbR6Q6xgJnGYro1+NCSzWy/mK1kc9SRk=
X-Gm-Gg: ASbGncvV2HEIqUADkCSaEi+hvuiG+2uCU+fLKHSkG0IrT4Zw1XgPeLLOmVlNx0gPIQd
	A1qThsuQL0xEigvvH8Jo7y07qULWGaFl0/D3yEFW10gDvEbBNveWIaw4gXMOQ7ZVLG0M2I4zIDC
	31piqHDn5OQQfVjLmt2y1RPGi3PTWbNj4wJDvvCVIj1VtBcE9eJuz9ncRskn2WOa52XBxaSG5mi
	I5Th7B4H11uaJANEwwZyogyvkA6rGpAUSeFEhFKb7K/mZkk+QC4e/zAc2Scb3nEwRP6EgSk7ONe
	eGq7lpSgpM0vm6JyTy+k3vQynDiO45YEFWSlDGyB39rsMe6U/X6nffrcX56X2VI7BymA5rIpIvZ
	iPDaVFp/S7grGgw==
X-Google-Smtp-Source: AGHT+IG52LyOtdqyYBdOZ0QKQPhVZkpzaGbfXrQI34jhYPtmLfmrXHBFBAebuBhiCsLhxrZFt4LIYA==
X-Received: by 2002:a17:902:e94d:b0:227:e6fe:2908 with SMTP id d9443c01a7336-22fc91a8448mr169477755ad.48.1746971001231;
        Sun, 11 May 2025 06:43:21 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:43:20 -0700 (PDT)
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
Subject: [PATCH v3 23/23] MAINTAINERS: Add entry for RISC-V RPMI and MPXY drivers
Date: Sun, 11 May 2025 19:09:39 +0530
Message-ID: <20250511133939.801777-24-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_064322_300757_063C7E88 
X-CRM114-Status: UNSURE (   8.24  )
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
index 69511c3b2b76..46a0909a17d9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20885,6 +20885,21 @@ F:	drivers/perf/riscv_pmu.c
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
