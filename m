Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B07DC46467
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 17:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WXllFq6J+nL3nYSpnjKzWyAVZiozhdrp7RhbBcZ+InM=; b=nnDS5+D3rwkjGW
	PH9mQeJHoABLqiPD8Gh70EoLoEOd6vQrlGV4peMxLYrzNIqOnCqPdss6qHOBrzizRLez91uBAki6a
	usz+3+EiQ2oAOBPZn+TsYI0PlvnPVv3wk7B9+r7MeUiMD4ak+589yxvz1zSj1nY7FGUwFV9cFfVj/
	gOAI6AqtrXDUlXX3NxRB0YOmhWxWvMth+EgZBW2CGfsz5bYIIYceUdiqxPc1V9iMMy3v5a332+nBL
	IUFb14LLs1NLGtYprnIgqGCNwpHkmOoNLLtnNZACIRPGkR37/uyaWmyW4QOTS24p3NcL4wBP9lU3Q
	T8/67rOphTl5iRlNGEKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCkr7-003IDJ-S5; Tue, 03 Jan 2023 17:13:41 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCi4C-001rrf-TO
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 14:15:02 +0000
Received: by mail-pf1-x430.google.com with SMTP id k19so12932525pfg.11
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jan 2023 06:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9cahVv2TInUZQq8hRVXfSnhUh5CoJndbcse7r+efrI=;
        b=JvQp+D22PddPJwvOIzWqpbiumCna0mY0Qs6kY5uGOPhttIQbAM07RfSktwA4YPQDfl
         FRzZBAQa1PKaQ4UOFU8QKXnvXEq9fkmdQVQzIxvWxnMxmq+/PDipRUhO8QEZiF9wTfMU
         P52esXVKy7v38CPrSEkE68VSvOw77TJgHkFqytND0WptHKP4kcU4dR7iKqTNVgp7n072
         q5q4uG7oGjmRdcQQogprEohimTvr8TGccFiqF7wBLc6VQPwPG7u0F0S09v1MTCiW9TIC
         yCy+hpq5AQGc+VyAeDFktNK0ysxTjMzLHXasMDKkUO6XMMAenXgOCUhII9mEC2Pz56ig
         9D6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9cahVv2TInUZQq8hRVXfSnhUh5CoJndbcse7r+efrI=;
        b=TVZFmdl40oEZU3uxVqYbtP4d3/muZsi8DAZzMiRJahp2oKaQ/nrsbfsrprAt919k7Q
         4CT2xM+XhaL4iUF2QMOcaFyUJJdOXD9X3i3XOT6Brf8z4STVxL6Fldelq/wb+HlHlt5J
         cbraKJuJ5iJQ5BlEQ5dcLg0EizIAypCVBAeiGiojphbJVCMvdt1I4Vev+le8dxvYjRgQ
         NtDfekLB+FlE9VRA33T8xJrppTN5/L4cvxGrCN/R69nmOuQYRQJ9TUJI3oFMlWVTnKnt
         P+f4BpKfA9t37Iuo5coj+9wwfdt4zCiNwX9WLcpYhJl+IbC/RopYKcRHt8tGnCuFGOSf
         r1bw==
X-Gm-Message-State: AFqh2kryKNs303pm3M826+hyzoT4IOOp9Vj5dHaKymjuL+L6/3E5/TO0
	IUj1UUv1Yv4oHjpdcLeicKTTEw==
X-Google-Smtp-Source: AMrXdXvCOxRJHxTUnBXhg91eXznx4qUxOjJDdB2DRp725FJ6It0JynsEemtk32n/ofi6kbO+KalXBg==
X-Received: by 2002:a62:cf42:0:b0:581:a004:3f36 with SMTP id b63-20020a62cf42000000b00581a0043f36mr21220945pfg.25.1672755298798;
        Tue, 03 Jan 2023 06:14:58 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.241])
        by smtp.gmail.com with ESMTPSA id h1-20020a628301000000b0056be4dbd4besm5936035pfe.111.2023.01.03.06.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:14:58 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 9/9] MAINTAINERS: Add entry for RISC-V AIA drivers
Date: Tue,  3 Jan 2023 19:44:09 +0530
Message-Id: <20230103141409.772298-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103141409.772298-1-apatel@ventanamicro.com>
References: <20230103141409.772298-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_061501_087314_300CFF20 
X-CRM114-Status: UNSURE (   9.00  )
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
index 7f86d02cb427..c5b8eda0780e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17942,6 +17942,18 @@ F:	drivers/perf/riscv_pmu.c
 F:	drivers/perf/riscv_pmu_legacy.c
 F:	drivers/perf/riscv_pmu_sbi.c
 
+RISC-V AIA DRIVERS
+M:	Anup Patel <anup@brainfault.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml
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
