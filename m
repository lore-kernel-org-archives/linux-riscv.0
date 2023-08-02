Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0BAC001DF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 15:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ZvPYgF1rfePPA0litYSedS8xfe68nefF1rFKHPJCjU=; b=iWmsosoa0j2oo5
	m2hnbncF3wAhhtZfWZCy97TwDXbwFRuRJm6MtW20W5Fshp0ITQS4l4aufWQptE5f9VM30NNadnjG2
	SQVP223dulaLdw6t6GeGfZ8p/w0eXBAY2Ge2R8kILCFujSuITQ0OrLzdnzIUCk3JDSb9AsAZHgyyB
	3mN6nzAwd2lBOCy5n69HVROyiuii7/RcDajgMkLDTTW7IWGDNIR6yCLfiVSVc5XkPlEnHGM+aNJEV
	hP1fouppizo0rrNWKqrBmnOfC1nWBp1ijgR4oiRLZ5FUsDC8VRGvZf0rnMr2nSioEsLjh4NQOzB9Q
	3MRvQqnQpnKZN0S1YosA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDMZ-005A7v-0I;
	Wed, 02 Aug 2023 15:02:11 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDMW-005A6J-2Q
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 15:02:09 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b8b2b60731so41822335ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 08:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690988527; x=1691593327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzjEf8gdmshIPz1UCPWBPDv9bSpwWIxt6/009doAlF0=;
        b=T3iwGETj4wk8BsrroMxNokL4un5cyLJxMkS0Yghktf+HS8BezQltxIZ0BfQvA68mka
         llJH8OFFMgrFDx5TDUnTJzKxZ4HrQdZ6Fr9y/2oNs6mf/6LUgN2jyb11T/B6TWF/D/wu
         GupSTBzd5zCUcj+LpHiXgl/WuEbfWQwdTGDAhy+tPxzpFXqEdCBS/17WhpZ0YDJPvEUP
         oJfqbUH8YCSSxXHPtW7akxZYPB186+u3GCnSB+A1zLaIccK4F+lDLKmOw8Xir51qJnS5
         QDO1I9r1Te3WvQNBkYTOQebaDyhRtykY7Ge9oJ5+kHlQagRLSTG4+v3fBLmg3zwhl0pz
         wtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690988527; x=1691593327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WzjEf8gdmshIPz1UCPWBPDv9bSpwWIxt6/009doAlF0=;
        b=JT1XFB9yWCqFplW07fVSqeQ/xfl2U+QAu8rdz54Fkrg928ZZ3CmwNxyYQS+95MeUuO
         VgHvvhsRUHNQ38+643yY5K325lHTZH0VFwRxBqNvcyDjyflFf3Jg0BFeHRqZazgOzray
         y7dZpDqzz7DXsEbk25+Lp1STh95EK8VhVA6S+70C0k1XsI1T2iJQ8KPFooOmJsWTRomi
         lsgDM3hyoACxuWhLo7GiClK9nGM7za321SiRbOv8Jvb8JqjIqILHPgu5AFT7OnVQqp75
         5rS3nJVyoSAlDJv5JrjAvMBzbu+xRSu8GJlXdqUzQsp6Qo+2+l4UFo92s7jqKZESv2RO
         Xh3g==
X-Gm-Message-State: ABy/qLYjr57TmBtbDbzCqR+XVL4vPycJj3QoPLTxD+WjcE0VieQgoy+P
	iP/xyXvWa5QE/HNPgejjRKD2/w==
X-Google-Smtp-Source: APBJJlGNZTsOk79JzcpgWFDkaYvrxpw9ast6LoWe4ciQrJMbBZi7SOXmTU9v4q3t9h7VBETnKKPJiQ==
X-Received: by 2002:a17:902:8207:b0:1b8:b464:fa1d with SMTP id x7-20020a170902820700b001b8b464fa1dmr13027165pln.69.1690988526530;
        Wed, 02 Aug 2023 08:02:06 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id v11-20020a1709028d8b00b001bb99e188fcsm12503963plo.194.2023.08.02.08.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 08:02:05 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v7 15/15] MAINTAINERS: Add entry for RISC-V AIA drivers
Date: Wed,  2 Aug 2023 20:30:18 +0530
Message-Id: <20230802150018.327079-16-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230802150018.327079-1-apatel@ventanamicro.com>
References: <20230802150018.327079-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_080208_784741_2ACCB49E 
X-CRM114-Status: UNSURE (   9.62  )
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
index 53b7ca804465..8e315aaa20bc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18259,6 +18259,20 @@ S:	Maintained
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
