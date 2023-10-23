Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE0EC25B45
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 17:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nkJGzQjxwJizAkfxtFL3RtXgcHLdmM/hAOytOiunDx4=; b=Aswyw8qPQ129xp
	z9zaj/RJ3chgoh1hf2Hrl9AodQGgOTneJU6no00j5Q7+RmHmpfTsVdaTbf7oVO/1DyEzmnyMZqCZi
	OyKWnb9yStVCalaRspjsimT2u4XzxiZhHg86aR/9w1+UDUMWIIYad+gEvL45LOh3+xnZ4rPEPX/b+
	nP4a2IcXSYAKqMN7/a0p+Tv+9KsiLdSML+OJrKaxkalhufTXdtPXT/gLxTIu3IkkVgtVUhH5j4wSL
	GtyxdIMT+axvgUBM69sagyAoJaizHlQYurfiluQi6DBGyYM1ZLf7bKIjbFr+ogmMhV2/LA9oNZFnw
	KcxVcdAUE4exF0M8FjNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quyk2-007wiW-0a;
	Mon, 23 Oct 2023 17:29:26 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quyjy-007wgJ-2U
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 17:29:24 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5b5354da665so1816206a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 10:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698082161; x=1698686961; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Z+lM1psdaIr4vqzMn22M1QYDstohuJWu+yz55IiCnA=;
        b=WR0N+VdNKIZ4sltcKWmpb6XFJaAb2C/kc4LHpST4YWrhm0S0qF4Ank7EPZkj96Z0oT
         3xkb2wwgxhNkywuq4bWyGXEVKxNyaFYhG+SrppqNme7GKcAw4+taOPGyl9kkVeJmktVj
         EFTaVenVVY4uYIRsVnhF78VuNUsQWy/OQ1V6ZLqRQlmcH0g+aIHf4jskKg2rcz72EFAN
         VGcuQ+ZokoQsXmOkb7SEIFBbEnItuxlMdZEMeE63RliAfbaG03lLA1JTEB4ON5EW7uTB
         X/swjqxVrF0cEna0XQUr01Y2Edn9sIAuyEerJ7IuYWW5uN9scIP+ms3ydVhHWo2W8nHd
         cjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698082161; x=1698686961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Z+lM1psdaIr4vqzMn22M1QYDstohuJWu+yz55IiCnA=;
        b=JQxhyUzI/vvYrzEvtgkkmVbjDvXpWYnEDdM2fCtJGRzD8HesSvOvJYGjr2NKAWTPOU
         f0TVjbm85s+tU8b3pw5gFfInFkg4bymYMtxy9cwC5nEL8WMlN5acM/AbowIwvSkGlJ5q
         3dt162GnfuD/L7cx6lVZn25clsK1xoRr3f1b77on0jpC2UalfHSGseqoSoGx66Ewg/qR
         PQk0gYVTSupJmtKsD36FOYn9RW+IeOxz5FX6pAD11a1ogzYniKNl6STB6ISa7bxe79fN
         A7lkjqiglx+JJA9gguCRswFfCdLYnfVtlowYfoxCd6P/3X2Fb0EJrCKdnRPGDK1LaW6p
         FIZg==
X-Gm-Message-State: AOJu0YzHSeWkjd5mppwMuAG2v9JdUaCqbCYodfMqgncMf0UlbmJWsYq3
	+46NDq8elty480PiS7F//KzBvA==
X-Google-Smtp-Source: AGHT+IHo6USP3pcRlXKuqJ79woJTXEsC0Rq2g43o4Sr9KzMGrxRYLsluIqp45MjwhV/47Ir+x9eEvA==
X-Received: by 2002:a05:6a20:daa3:b0:157:609f:6057 with SMTP id iy35-20020a056a20daa300b00157609f6057mr319511pzb.27.1698082161065;
        Mon, 23 Oct 2023 10:29:21 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.9])
        by smtp.gmail.com with ESMTPSA id g5-20020aa79f05000000b006be055ab117sm6473194pfr.92.2023.10.23.10.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 10:29:20 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v11 14/14] MAINTAINERS: Add entry for RISC-V AIA drivers
Date: Mon, 23 Oct 2023 22:58:00 +0530
Message-Id: <20231023172800.315343-15-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023172800.315343-1-apatel@ventanamicro.com>
References: <20231023172800.315343-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_102922_812351_41ACD487 
X-CRM114-Status: UNSURE (   9.18  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
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
index 801a2f44182c..4557675c6086 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18410,6 +18410,20 @@ S:	Maintained
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
