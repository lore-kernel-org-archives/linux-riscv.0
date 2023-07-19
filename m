Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DF2C001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 11:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vPiM5nVkVFHtQRjtbynJynmF0jw1QanZieY4zdmFA+I=; b=j7K+ttkneDiCut
	+ClrbwMgNo2UE//lgqODCLj7qWx8jPAMRG/X7RossAk9RoikxLWWdsx5TQeajYctNv/C2DIlKlA2j
	FBWylhrRGlBEfMrQfiWR7yuepGsKBYtz5XTNxXhyzyjGFV5/lQn3ECo762oGoaSX+IxnZOF4tq3+c
	/DrqtVB8fvJ92ZeDvifdRIqzeF2puCepXNM23MSZCQbeF50plSkLXiPbCZVLfolfioK5BXWc7NYkE
	VpzhxnGNg7OHIG4G2m11+OcbMY1qkr7yOnfQb7M6aEfeWYcb7TbyHIWQF+KP4eAr0/q3dg5lik1Og
	b4j+RrjQFaLBe8f/zzrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM5UX-007GTc-31;
	Wed, 19 Jul 2023 11:37:13 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM5UV-007GSJ-31
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 11:37:13 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-666eec46206so6787237b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 04:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689766631; x=1690371431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1z3imD2XbbYDd6VSbUkFEY8FOTIJ1YRTYJOPWV0s530=;
        b=fUfLvcG3vH54NIWAMiN74LkuNau5ETz9NqCyVq6ETEUHLXfbo+b3r7geBNflqlb+Vv
         t9qHOUw1r49bV9wJkSJZ5bvc8AERc90co+ltIPin3Eh1RLNPam30rf8H24SdgadDrgtD
         5R73oExEaQkmAGpgxG33zMYHMwaHHeRwDkaWyh5Llj9YIOaKE9jc0TnJ50oGuQ1S1MU3
         OnwoAYwyrZwVMtPFPhcJGNAHfVWYmIpRdBqR2d0FPVFZoQ9Ewg0IPTSSYqY2XXNIZZoT
         K88c5xlL9or9I2wDVGcqcs2X1BIgHBoIFZQGZ4keVuvQZ7WVTaVH9AAQrqqk5yayGIEA
         k3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689766631; x=1690371431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1z3imD2XbbYDd6VSbUkFEY8FOTIJ1YRTYJOPWV0s530=;
        b=NcMR3PqFYUTtYCoy/y3Vf0OriDhHL6ueLH8235GEU220JfmMfO22ecKmwS21hrOe9v
         x7H4B1uW95eRXqq6brP0h/nq3JTV/eKsQPApIFU0pMI17+8KK3DqCM7+cJjg9D4yPzTj
         uoeezZVA4QQlkhhFe96VPr3n4gll9vZzAoefTjCesdq0U/5tpsDHIQTc8pctDe2zV+xu
         BK45V32mIhGmSyhN4P6WdgpjBz6JpXwKQanVqwxJyQ4BEZdbHRL9NIw1hXV96C6GrBHH
         BQHYH8gq93SqrJS6Q/r6nbuZ5PNIfIdQeeWNs+z3k1vEnoQBAxK7+t89p6y9Y/mN/qN9
         SMgQ==
X-Gm-Message-State: ABy/qLaBexkzujC7BlzgtsshoQZoSCPsXJJXZ0wry9290BNMKoaV2vcl
	x+s9NvDPbf2a+vid/b98Of2UoQ==
X-Google-Smtp-Source: APBJJlHb++7vjyRXEyeunDkFGfTLlu5xk3V4zcn75am1kfRS/AnyVeeK3Rkrh/q5SMNbQrMY+8AL4Q==
X-Received: by 2002:a05:6a20:8424:b0:130:6b27:729f with SMTP id c36-20020a056a20842400b001306b27729fmr2966252pzd.3.1689766631349;
        Wed, 19 Jul 2023 04:37:11 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.130])
        by smtp.gmail.com with ESMTPSA id j10-20020aa783ca000000b00669c99d05fasm3050408pfn.150.2023.07.19.04.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 04:37:10 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v6 14/14] MAINTAINERS: Add entry for RISC-V AIA drivers
Date: Wed, 19 Jul 2023 17:05:42 +0530
Message-Id: <20230719113542.2293295-15-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719113542.2293295-1-apatel@ventanamicro.com>
References: <20230719113542.2293295-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_043711_985405_A30C5A2A 
X-CRM114-Status: GOOD (  10.19  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add myself as maintainer for RISC-V AIA drivers including the
RISC-V INTC driver which supports both AIA and non-AIA platforms.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aee340630eca..ef7af65441a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18256,6 +18256,20 @@ S:	Maintained
 F:	drivers/mtd/nand/raw/r852.c
 F:	drivers/mtd/nand/raw/r852.h
 
+RISC-V AIA DRIVERS
+M:	Anup Patel <anup@brainfault.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
+F:	drivers/irqchip/irq-riscv-aplic-*.c
+F:	drivers/irqchip/irq-riscv-aplic-*.h
+F:	drivers/irqchip/irq-riscv-imsic-*.c
+F:	drivers/irqchip/irq-riscv-imsic-*.h
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
