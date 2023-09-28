Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C788CE7AFD
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 06:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oXYnZQKR8jdLW49lejpfafg/k2kkKqmWZgmT+Y8WWmc=; b=T4WKV1ynDxFzXB
	gCYAsPk3S+Z1Fc9iKzfYGx15Te3PBw4/Pru/ChCMfO9UhoD0m8+O7IsXjFLoB3cWA9YHVWQqHssN+
	0tlYvOCnd1ugb7CYzmYtTEGdfjyKtL+yoygtrrmbNSrud6VIOVo/v0fcIOwqCMdCzQVvn6oY4/d+D
	m5qHFqdrbvMGHskOCNLazfSCdt4A1ay6/f4LbN6PIsNcX7r2EjoXkc/7e8DZISCARl2D9YRpCRRxx
	3RObOj7EmbwRejkNOX2RzvHkUeW4qlaqGL1Dlab9Nc0e3xE9vjK+LzNwO3MXkmN2SvUkg6LWcYSyF
	UpeyGqdTDqAdaonIQ/Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlkI0-002MRj-39;
	Thu, 28 Sep 2023 06:14:20 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlkHw-002MOp-31
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 06:14:19 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3512fae02ecso30292115ab.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 23:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695881655; x=1696486455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHuIvMJs8qzoPXhYXObNPxhAaUcGW9Ddxs7u6Di5I3s=;
        b=lyy/nxCpyg66r2//IcDFLQhSe7MPAvpCwtofx0kBRCNhAYwNCJN0Wlp66thH9YwfC/
         HgoW25AIjwmAFtttdST7/I/TmwyrBhuWE9maDDDFTDaRgXynVARGl2Bx3PjE3yEKbggX
         t4kN1I9J+s7frrZjWlodZoMi75mUPwdedJXBe5/2qdllCIxmaLbU+XpPr4YV/cIh09C8
         TK4oHd2djwLtVLPWYuPpCyFglIdgz9ehmaSgS6JNUEZTflBgegkO4VsH3A2x6I7Te1Qv
         T1QXOrtsCqTJ/80Cixkr84cullMleKhKH0LaJHKmBs1wupxTimRuje1+aivup75otHwJ
         GPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695881655; x=1696486455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHuIvMJs8qzoPXhYXObNPxhAaUcGW9Ddxs7u6Di5I3s=;
        b=VBxLOkbc2excgpJLDOlCqHvhC5Bw/xBotrYyiyOA9wxl1Tadpsbk1Ez1BIo90aHOlT
         0PfKj7BthMbuik9XPd7ApduBJFN4jy7dZ+Lmpsh+wVwduB5QUCpbLfBixv1yAWKz05KQ
         pIkCQIxe2lXiRpvH9g3zqLZC8HgPqRZdDUkuTXfm1o+r24FeRUbsiMqQhzjGoQENXKNU
         Byuax/JpH8AFJFkM9zhcTNry4PIoviauXDnQ7fVBk4ggLhelKk+4+yRw6EN6UKnGiwkF
         NftGvp+PkqekeLBeSUU4J6Rp0ZjHlud6ORPQk8RdfuHzV9VdXONfTvKCQld58UjuYLl7
         Kamw==
X-Gm-Message-State: AOJu0Yz0C/SJP501hV2GvnUHIHgKcaBpRtCvRTdKGh53Wiwjw5hUBfck
	486WGv8o77LR73sO/10PpzmqtQ==
X-Google-Smtp-Source: AGHT+IFTu6zFLWGG5N+HYwj83ugftb4GPLwahJWLeQeUPg4Ri/nzVup+T9WjH0TGUx0jYGkXS+msOA==
X-Received: by 2002:a05:6e02:152e:b0:351:5acb:271 with SMTP id i14-20020a056e02152e00b003515acb0271mr335799ilu.1.1695881655365;
        Wed, 27 Sep 2023 23:14:15 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id x6-20020a92d306000000b003506f457d70sm4774467ila.63.2023.09.27.23.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 23:14:14 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v9 15/15] MAINTAINERS: Add entry for RISC-V AIA drivers
Date: Thu, 28 Sep 2023 11:42:07 +0530
Message-Id: <20230928061207.1841513-16-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230928061207.1841513-1-apatel@ventanamicro.com>
References: <20230928061207.1841513-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_231416_978326_19C67B2A 
X-CRM114-Status: UNSURE (   9.84  )
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
index 7518be65d782..92b2b1e6a673 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18411,6 +18411,20 @@ S:	Maintained
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
