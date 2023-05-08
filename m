Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2EEC77B7F
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 14:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PcbLAeelgbbBqpLh/oeYZ4MhSNt6r+FcjxOHfqI4qh0=; b=i+TcqpPhBENx+y
	IiNrArFlYw6wqGhDe/59vMcyFVXBeDjNUf+veNrIKqGTQnTTnekYaSwojkyjpi5zexU6OU9IB6zKJ
	MPmy7f30DibazKgcZW0rJTpvLgkTFEhQUHES9i8OebSFw5iRV7h9xL9IW914qD6pajZvu+RFZnfz+
	O3ZP+Lxdjka3IDCFTGDlDbptbwfGuNEakxICU9JcKw0kX89WPvnESpifDgc8Uo8bmav5MAKxsQd4s
	XRoGOvocTIN2G9gH6V1AmBkInrKNV+3ACxvUolmfpv0whzBT4jwVdXj3sOXPXXMVzVJsAOjPJH3f5
	/Sn01rFGZxZzQtcp3+CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw1sD-000koI-0h;
	Mon, 08 May 2023 14:29:57 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw1sA-000kmM-0S
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 14:29:55 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-64115eef620so34841921b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 May 2023 07:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683556193; x=1686148193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ds73gnsFVEJ6u1RVbKPdKJnDIubBpKmFNgu55xzWEbU=;
        b=lJgy3Bj1z5Uiu48QnHfq5K+VBP28Zxgip9ER4Yf6hmQQ8lPjaEpD0RK119Wik1cOJJ
         iTNHWt1R/TFttkaNBKF61wx8kI5nvD0D/9ouPhVmGkGdKBAO/f6u7tSxBsDns2PtEpHY
         oIiE2l2cRByWteEpf1vB2MkOni0dvyrKrnVlA/aMsfRfyhdhsK9izbxuoBPC0x7czg3s
         juTXnjpVJf5pYCmVakR0Cgvp94ANIYMAK+LbvnfCPgH307fCgx//lO8LcLCqPQvCnR2s
         yrH86CmjZ09YK9L2qscqvWOhivunsdFbAzxUvjvEKMVRsEx5Gn4gHywXyeDI8k3mww/1
         TxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683556193; x=1686148193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ds73gnsFVEJ6u1RVbKPdKJnDIubBpKmFNgu55xzWEbU=;
        b=hxQq8tQGOJdG3kjqXMiYIY43sUwM77/FqUjAsGAqAqkQ4L33NxePiOjfNRpgrr4mMu
         v9VtKVKB0JMkwmC3Y+0y00XIU9HFN6v4x9ILiIxHWetWveYo9A8X2xamhyogDkg51d8M
         H38tQIQoo3vhwLaG+7BVGtyACMAmR0c3cf4fXA6/+rM/Lq+a8bcpfrcXang13dSr+Eie
         0DNF9Vg9ZtuGOWF3/8G9mZec7GEHK/QwYMMU4S73cB0JC1DLkm1HuYfP8itB+1/8RJoh
         BQmyFmlHMugmaMnv4yqCQuq5MLq2yECGj1J7Xa0RifWK0FOjd92pz7uN5iSU8JGUWul2
         8nxQ==
X-Gm-Message-State: AC+VfDyE4MhxUqYH6bP+nj3+zHSQQQTBzBU1mdp/JaXyn5aEs2my5ib/
	hqDx5QDtKUwqhEVaBarAAXw+oQ==
X-Google-Smtp-Source: ACHHUZ7IFh1sQXPuJWRHj2WWGpozWbXGdVg2fdaqzgld/0LycsTzWlJonjSeEsRixOIeWaZl5X+7Vg==
X-Received: by 2002:a05:6a20:a5a8:b0:d9:adc3:6a71 with SMTP id bc40-20020a056a20a5a800b000d9adc36a71mr10379138pzb.1.1683556193560;
        Mon, 08 May 2023 07:29:53 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.206])
        by smtp.gmail.com with ESMTPSA id k3-20020aa790c3000000b0063d46ec5777sm6082pfk.158.2023.05.08.07.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 07:29:53 -0700 (PDT)
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
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	iommu@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 11/11] MAINTAINERS: Add entry for RISC-V AIA drivers
Date: Mon,  8 May 2023 19:58:42 +0530
Message-Id: <20230508142842.854564-12-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230508142842.854564-1-apatel@ventanamicro.com>
References: <20230508142842.854564-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_072954_178360_CE97DB8D 
X-CRM114-Status: UNSURE (   9.63  )
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
index 083ba321fc7c..8f00b56ef8d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18111,6 +18111,18 @@ F:	drivers/perf/riscv_pmu.c
 F:	drivers/perf/riscv_pmu_legacy.c
 F:	drivers/perf/riscv_pmu_sbi.c
 
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
