Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C623DC7EE22
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 14:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ux5uSaI/yH+/MC8Y1BIshdqN1c0WzJYN8vYMP5I6dOk=; b=QiyStioZyJSS9d
	SxbEUys2aDenUOCOPw8ggLxOB9UBnk3+haIHkR3N6jfVQwK3EhA5k5pj6lKrrYM7gLCfQDru4o4ha
	6gZYSeEJmeUbD+QQthvThJe3ho3y25Hov9KkUJ7o0WQYWX+m1T253Av3YPIKyDO3jM1ebep2tF7eH
	QiWO52nfjgqRMqGz5AEsyLGWgrJXUlhBqRkBig2AYcHg96j1PZfd5FKKotVsHC24b7f2L41/04M/p
	Y52iSIE/tqoj51qBIuLMWiwrWYDFXo7Ds+qUGqb9a+nZNiAmfOqeTSC1J+uhNKFJhiyHcsIkL2Cph
	iPxsa5+bzMkSeD27lE4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw1s8-000klb-1q;
	Mon, 08 May 2023 14:29:52 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw1s6-000kkA-2a
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 14:29:51 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-64388cf3263so3208112b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 08 May 2023 07:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683556189; x=1686148189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ib+AURYSmjIxuoqk+PR8Eg/Z3fYq7w+OW68J7DC1sRs=;
        b=lhf0yTrL5foE3dgkCXYnbKFaPVDfELgWh9Qfu/YV+eeRXTgmNBLamrISJGm/kf8awb
         /Q+x7COPipzhN8O060faYDbfE9mfR23SP9HjXYhGusmHffrOHXqsmpI1CeuvtIza3iJb
         D2HJTugPooWWFNeSmHWphhPLl9HTV5glDX0ktJXkQfOxo9GqBoI+XQwkhqqVu2fbXa++
         7IVbVAbG5rwHmJWxdfwxWkg8E8AvJFCGWiFL1GD/XfG5ng5yS3gQtpftU4y0mQXFcrjF
         WuX4XDgTcmDX0aYWje38GHBLesDKvbasYOydQcOSSX1etOg97JceszynFQC+Wv6vzJdq
         tXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683556189; x=1686148189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ib+AURYSmjIxuoqk+PR8Eg/Z3fYq7w+OW68J7DC1sRs=;
        b=ehV66Min0wkXxa0jIKe+omdveR0akMfHH3VRv1k4czqbhzXEVo77fN9CXVUbfPah+A
         7h/U8Wbu/7350imyHFwXQXtJZdrqG3wXBRuXSVzV1YhKCLBb/dnkLzsGDySgp71ypiqm
         Bz7e+SHPG/a5ZLkrOl/ziXR/KqzutF7PPb145Uh/aGRqTBtIqYxisnSe7R3knSZaZYfr
         xwRKbjoCj+8hawpKGGkChpZlokf9PRH5USL6RsbcVB0Kk4meDBn6UGm9PUfTRHNgrYq5
         vsEts4XaKsbq53US3ifP4+Ud1Ez58ELJZDp/cM78dTTyyH0ZSr/cooXhHJxzcHUY97wA
         B2QQ==
X-Gm-Message-State: AC+VfDzeo9v9VKceo0V6atmzLvgGLGoI5VVwJWMVxRV7IFWKxPAvs6Qu
	tX2OSqpsk24MKiXm798nQteAcA==
X-Google-Smtp-Source: ACHHUZ70ix2zTrDE9s+rnkB6ZVqKqawiFZ9UB6Fb2s+oNTDZtIBezM4K/5LRvwmXZR9QE5qBhwN0HA==
X-Received: by 2002:a05:6a00:b8a:b0:646:663a:9d60 with SMTP id g10-20020a056a000b8a00b00646663a9d60mr2975346pfj.10.1683556188702;
        Mon, 08 May 2023 07:29:48 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.206])
        by smtp.gmail.com with ESMTPSA id k3-20020aa790c3000000b0063d46ec5777sm6082pfk.158.2023.05.08.07.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 07:29:48 -0700 (PDT)
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
Subject: [PATCH v3 10/11] RISC-V: Select APLIC and IMSIC drivers
Date: Mon,  8 May 2023 19:58:41 +0530
Message-Id: <20230508142842.854564-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230508142842.854564-1-apatel@ventanamicro.com>
References: <20230508142842.854564-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_072950_837973_5BF2A360 
X-CRM114-Status: UNSURE (   9.83  )
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

The QEMU virt machine supports AIA emulation and we also have
quite a few RISC-V platforms with AIA support under development
so let us select APLIC and IMSIC drivers for all RISC-V platforms.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 491ecd7d2336..1bc2c7659b7d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -135,6 +135,8 @@ config RISCV
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
