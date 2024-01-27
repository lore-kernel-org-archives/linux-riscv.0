Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22150C47DA9
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jan 2024 17:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ruJg71vTwQ9ZKrf8rPJS4UccDY/uXbA/Xg+iT4CuBg=; b=YyUwLM6ZOA0LGQ
	F8VvcyP+qURD++Goj6tKv/l4Zhu3Y3DS9jd3n/Dbb8MTuNuW5GC1YBaQuIeuUfKfPnfbduoWlwMrJ
	28QO1exrx8RVplBrAAVkqxzr6hEmt0lXA0RWFRN5zt6irw1RSvG8o2y3wNv9/cTJa87XsR74h4riR
	4qQxnOQEXBX8gR+HDbWbaV67GpM+d9EqfiFStOYvnuuwmXIntGKkVekyOeDNCTjaFpvYDA/lAnX/b
	+nYIqWWLIO59ed9IJiK3V1gUdqKxGLFnD2yCLRFo8YfsVtFwK9Xovbyv3CmI6c4mL0g/7tT/iOfmZ
	kX07AsZv37djzfS/8YaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTmaI-00000007vUx-47Vj;
	Sat, 27 Jan 2024 17:35:14 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlQ9-00000007lag-3MYL
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jan 2024 16:20:48 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2906fd62cb2so689853a91.2
        for <linux-riscv@lists.infradead.org>; Sat, 27 Jan 2024 08:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706372441; x=1706977241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HC6ciBL1O4iGBio2d1au61PVhJtzF6Er8tF32HGbqHI=;
        b=I4Leq5P413ockLcAtPl9/g/lg2qoaWpy9rHwColUONDXiLCK9RCURFqqX/FYEdNGqD
         IQoaQRVyvmxF+CpmpAm3c3IPDNMOBNgrQAomjaiEULBXeuumkP1Xc0QcppoNiRanFpkH
         zdZOGdEQWaY63QSgPQaHK3mk6dg6Pk2L9HKoOD1GZgNoG+c6YFKLx7RJYes9ipnU8Raj
         HYCOxoIwLPNnSYpX24pWA+y0nVukMEhk6Ka5rBhUlTgAWycUXq6NFffgJdBvydwqabg9
         +81Xy6DTdB+o4lA/w6ds87CkGt1lRl5I+Hugmoh8crZeY03cEeg650yB88Bw7mthea5H
         UgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706372441; x=1706977241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HC6ciBL1O4iGBio2d1au61PVhJtzF6Er8tF32HGbqHI=;
        b=OL4lIIO1Ap+W5iZcBGx6uBy4AQYUFjWgd5r1b71yWv5Wfijt290DQgagEWGUhlcb2Q
         vZOpX0zWWl/PfaZgdlyla/ZhiMEamChw5BS1Evr+Ek0ZT/3NMHCyGUEBp9XeDpN6rs7p
         m6xDIOy2SwIXxYZjk2EOAN7dIuH3jOq/S25XiP9Duu0ADS4FXAJmdb/j3Uvp5WgePPct
         /Op2ZMkKKNrc2+SkmK+anAV5Up+9dQ/ipMbT/EFn5Rt2OZGNHeBY6UmY4OjyTz326Q2t
         unR+XcTiqF6XOrTPviS8o16IvQpjKg+xSl10h7ex48IyBztt4Pjw4lf26MA8zvSOoKJB
         boEw==
X-Gm-Message-State: AOJu0Yz1MZT9jPPqt8RSKPaDdjp9CX3P5biyznXdlyV5zmYQGaektrNL
	zrmEYoc0xDjq4TJzyMMysUtYvZy/PDhCXIB6aX7kMIYtP7fA/B97yMbVgQeJoTs=
X-Google-Smtp-Source: AGHT+IFSOUWlua21LZ+ZlYrE47zhwA4hUbK2IiPKJDlMaTp5UgCAuO4/WnvSs3iZZMJltrIhvxlurg==
X-Received: by 2002:a17:90b:184:b0:28f:ef30:804a with SMTP id t4-20020a17090b018400b0028fef30804amr795532pjs.35.1706372440990;
        Sat, 27 Jan 2024 08:20:40 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.17])
        by smtp.gmail.com with ESMTPSA id d11-20020a17090ac24b00b00290f8c708d0sm5091620pjx.57.2024.01.27.08.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 08:20:40 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v12 25/25] MAINTAINERS: Add entry for RISC-V AIA drivers
Date: Sat, 27 Jan 2024 21:47:53 +0530
Message-Id: <20240127161753.114685-26-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240127161753.114685-1-apatel@ventanamicro.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_082042_027336_CAA2A1BD 
X-CRM114-Status: UNSURE (   9.21  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
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
index 8d1052fa6a69..49dd12e90609 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18792,6 +18792,20 @@ S:	Maintained
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
