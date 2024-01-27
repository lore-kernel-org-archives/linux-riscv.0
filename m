Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B56C47DA9
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jan 2024 16:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dABr5VYJwcAf8A8xr/ySDW1mlW8NG1ZNJkOXG83GPBU=; b=IMWJwJQ9+8lpzB
	9v57D3Qozna5ZPznM9cplMAdwVyLfvpTbiXL8D6QDwoUJoBbs9vtynwNp6l46EDpR+MQN1+9+Rqyf
	XO+lXEf6EdGaOshEB6pD43h+8wBkLNh7YUuob4r681k4fpJiYyBggw+70SzT3LrypAsOwOKk6pukw
	aLok/gp+aKpJVwrpgAMUyxoCswtNYtXlavey3hCFifFHmULT898e8kDxCPJTrh9AZRj7yoZKljkfB
	zl2rLE2i/B/cQ77RBwyMfchfibXggjSZOQ560k2EcOo6kiRFGXBo3Gor2rA37xlPbGDdLx/KNcMm0
	qVkMZVouvW974VoMvXuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlTN-00000007nef-3gLp;
	Sat, 27 Jan 2024 16:24:01 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlQ4-00000007lWl-0oSP
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jan 2024 16:20:45 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-290b9f83037so901152a91.1
        for <linux-riscv@lists.infradead.org>; Sat, 27 Jan 2024 08:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706372435; x=1706977235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKr4R3ReoTivFHMhBAg5uu2FBun4VRRnzFiPnpPYZRY=;
        b=VmuarAEFE/8QeOSz8QIgGLbKe0Ehbv4G243TOY9nIeFaFU+u0sBxU/jmqeOkJaKKQ3
         T9kbQyAr27lnmxNURHIrZcrn3B+gmvoQe+SzDewu1bCSTEg3cCtBIXbahYX74BSZQ9J7
         CO08FzNMywUxv41zmNg/CxO5oljkt4x4Kds/MZu6deHpahBH82JRB2ca1QVTxMCDvlYm
         N7GHxIw7NUIfS0KpPauf57oyCA/M6Gh6wPc6sHa4S7tm4539KD24/LTIHVRkPoqGbVN0
         U7cvKLJYK6wJheNR9H2ywzqHjD52qt+A8NnxmrVrVALzc2r7HY/Tirg5euMbSCvSMqnX
         g6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706372435; x=1706977235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yKr4R3ReoTivFHMhBAg5uu2FBun4VRRnzFiPnpPYZRY=;
        b=V1y2Qmj1II6CE6KE7sFMjvf12cqT4IOsHa3q2JwjyFzbUL54Z0s2yYxzrz1mmmLpP4
         JZSAUIQTxQlee+wtsBLihiWubr8sI1I6yAr+OfN7WXuQwND8dBo2AgHJRuX3ZCvtJDCu
         pWDQ6LOxG3oPptt9//wBmrv9k3sCMMkEpYNiilZwh4YEBbCLVyDI2WLhiBp0g3zSVsaK
         W3ylNB1o7otcBMbTRgaSVG7DLg97Mgo9htdMGcVUHVSMMplZSUMmf46Z3XMqgwcl+qxX
         YVFRTsLs78OJ19V0VYfLRzke/hefH0GLE7nxBwaf+Gi9gl0jvs1IEcTeVzf29Uvahtg6
         Gc+A==
X-Gm-Message-State: AOJu0YzA3ZiUwqPOjYIVS6+WvkIHYpgDlAOIujytPaf8b9WwZ9J70Piu
	ldD8gNDu2u7tcaHaoOgeuZTj3SF2uLXwquPUaF76XSmgWEuPcG1wqqumgFoIdmE=
X-Google-Smtp-Source: AGHT+IH+09rxnVj+v63YGbzebMdNocoIUARHK8Q/XqwlAzTL0KPUnJV/xhDxS1x77jvAJNgqpyZR9A==
X-Received: by 2002:a17:90a:8985:b0:28d:5536:2e8d with SMTP id v5-20020a17090a898500b0028d55362e8dmr1647576pjn.48.1706372435319;
        Sat, 27 Jan 2024 08:20:35 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.17])
        by smtp.gmail.com with ESMTPSA id d11-20020a17090ac24b00b00290f8c708d0sm5091620pjx.57.2024.01.27.08.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 08:20:34 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v12 24/25] RISC-V: Select APLIC and IMSIC drivers
Date: Sat, 27 Jan 2024 21:47:52 +0530
Message-Id: <20240127161753.114685-25-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240127161753.114685-1-apatel@ventanamicro.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_082036_573562_37501252 
X-CRM114-Status: UNSURE (   9.02  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The QEMU virt machine supports AIA emulation and we also have
quite a few RISC-V platforms with AIA support under development
so let us select APLIC and IMSIC drivers for all RISC-V platforms.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bffbd869a068..569f2b6fd60a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -162,6 +162,8 @@ config RISCV
 	select PCI_DOMAINS_GENERIC if PCI
 	select PCI_MSI if PCI
 	select RISCV_ALTERNATIVE if !XIP_KERNEL
+	select RISCV_APLIC
+	select RISCV_IMSIC
 	select RISCV_INTC
 	select RISCV_TIMER if RISCV_SBI
 	select SIFIVE_PLIC
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
