Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9294EEB64D0
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 15:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ty5TWFdGPRmlfcRkMwcKYHWDMBTjwUXIsbmq2XRg4oo=; b=HHeOZL/O2Fc7/j
	m77dZ4la4E1pSoAUQaHyws80W4iUHGBI4FHzc2Z3eCSBtTnCxiKn7dfvfHvDNL/q7O/pDqJCrO9Sx
	dc++enXCkA9qZLxHbcq+JWAxMeXt0We+AytL/khv0nGtNoWPB1vFufoUoZBZ8/bz7BDQnJ4XGZ6k8
	qvXzkkVPTHYKlABOE+b51rZUQwLe2Y3gQ6A7ZM5qR3lQamUThCd/edOr0oKw912OYc3kxM0i9W8BT
	998lvH02hHjFWZbXIZoj0k4A2cbHt8iRWIczYArXzIXr1nPD0ZdZAQXE4kMeUPRR4778K4XYKCHtf
	lpD5kx4cahmQ+Pl3uofg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q963m-008UHw-2s;
	Tue, 13 Jun 2023 15:35:54 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q963i-008UFg-2P
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 15:35:53 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-38c35975545so3607651b6e.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jun 2023 08:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686670550; x=1689262550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjPmtbt5dpp3nV1ppkSLOwXIjTqZCsmy4toORZe/818=;
        b=Swu4hszULQzPuPzBt7iqf7LrNn3pbjBkMCsVSv0eHYkgdWXz+ssLl7XTId4Nr5rzC+
         8a3/nOLQ58HBh1itV5d3Zm1Q5o/F/sG56/XMn/lM7XnGldDZFhvJaLBGVX3ct4r9PaUq
         5xO2UMfIQ8LB3/+IweLxBeFM5jNSHy8V6LJ2QcsPHefylqBWPP/Fg76wn8cuwCSZoYE0
         Hn3w6RKopilic4uboB8qNvybBC/uHDgpVqXXH5WZGqI4sWPZATWZqmo2PQA7vdOSKVnH
         ZyKKq+H3CDcbycD+IazyO/GnO4bAGuQlmH8rMA4VeTT5U46wMBVBwupa7M1pKv9PNj6p
         5Abg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686670550; x=1689262550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YjPmtbt5dpp3nV1ppkSLOwXIjTqZCsmy4toORZe/818=;
        b=R7i5fPNHUGfWz0gtzvLcZ6TWCZBapMNRwAXS74wXALDpmFNSZJ/tiHu2K7Iue4rnc0
         HmwBCTkKMct5M3OSHcSLJ6mk7f8rjslVgn/gGCEKqvYFhpmZXq66VekoDn1omAY8qiNF
         CoOtrSHzPoep3G4raczsS10zl0dLKk8WY4kmr26TBih26IevcFzs3kAy8k/nlNLLVYJp
         8C5gpSnFoDDy3XvxWXiKwfbRjfMfcZCD0N3/Sn4JoE3LNrtBK+5Uroiz2LdVA+JUTDci
         PV6+Uq/3kEbe4g+KNVYkHX32CiT+66/WUMkKIsT980OEw+7v6NxetXsOCw1nAQilFBXi
         VY5g==
X-Gm-Message-State: AC+VfDy2ueJSwXyDhCFdfN+GgB8E2k1sa9XkEyZeRGXD6xJqkYo2Q8UI
	Xk6CHp2GOKzYhmbJRl/smEqEZQ==
X-Google-Smtp-Source: ACHHUZ7Tg1xp84o5UNsIGFouFyCklTip/xPfGoAYw3cqzXxDnJEowsGdk1gdK+IhU0wBCwPu3ab6ww==
X-Received: by 2002:a54:408e:0:b0:38e:d739:6f3f with SMTP id i14-20020a54408e000000b0038ed7396f3fmr6723088oii.56.1686670549823;
        Tue, 13 Jun 2023 08:35:49 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id n2-20020acabd02000000b0039ce305ea4fsm1630807oif.14.2023.06.13.08.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 08:35:49 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	iommu@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 10/10] MAINTAINERS: Add entry for RISC-V AIA drivers
Date: Tue, 13 Jun 2023 21:04:15 +0530
Message-Id: <20230613153415.350528-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230613153415.350528-1-apatel@ventanamicro.com>
References: <20230613153415.350528-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_083550_789112_2A128F0E 
X-CRM114-Status: UNSURE (   9.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add myself as maintainer for RISC-V AIA drivers including the
RISC-V INTC driver which supports both AIA and non-AIA platforms.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 51da90e60004..2d474eb902fa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18136,6 +18136,18 @@ S:	Maintained
 F:	drivers/mtd/nand/raw/r852.c
 F:	drivers/mtd/nand/raw/r852.h
 
+RISC-V AIA DRIVERS
+M:	Anup Patel <anup@brainfault.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
+F:	drivers/irqchip/irq-riscv-aplic.c
+F:	drivers/irqchip/irq-riscv-imsic.c
+F:	drivers/irqchip/irq-riscv-intc.c
+F:	include/linux/irqchip/riscv-aplic.h
+F:	include/linux/irqchip/riscv-imsic.h
+
 RISC-V ARCHITECTURE
 M:	Paul Walmsley <paul.walmsley@sifive.com>
 M:	Palmer Dabbelt <palmer@dabbelt.com>
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
