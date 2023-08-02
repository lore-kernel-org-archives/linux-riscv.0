Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B690C04E69
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 15:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hMNOkZmhMavdVQt9eKbq48BOU9Hx96foPc1Wp0NsQX8=; b=UZgoUUIN7DTwNa
	8+5PkrSHfmGrotLIUawmBVkieCVwijNqb7J9jCRuy3UFt3scbphrPswZjiURvU9Rb/k2xt7W65DJC
	3UWirse5NAgqJpKPOh7zcy+O2fcZ9BhzlvgV/XxtXePiSKayyVX7npNZcFzC9y5mCXUAqQgMu/5sO
	zQoPLvvOEb5qb85fuXLlpVqxuTIXUxyupEMsFYlfDq7T6+EEWgWwwMpsPku+08KF6R9LXrqm0XvOe
	PNxEE3OHrtbaG/+TIeLU8Zt7Cq2LCcKSGF+DnsA00q5nKDQO8lX8eYM/xrKItlwX9sWGmqPQIN5EG
	8bVhlAR+Yu4AGMQEOxFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDMT-005A5P-2i;
	Wed, 02 Aug 2023 15:02:05 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDMR-005A3X-2Y
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 15:02:05 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1bbf0f36ce4so33112005ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 08:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690988520; x=1691593320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nImulFWj8VTnTfSKoHJB+uK3WiURTzzmP3Vx/VbcYKk=;
        b=HPOjG5OGEEiuG0oXk82hAC75kB6TCWujhaeIqxUyqgHOK9Q7mr6UWYQCuJw9m9+0WL
         HleCLprhGlPb+BU5NV15PlqbrnORe+aVO1luFT0PhTPHjv190dfxD15roks59kwgk4xV
         ctDESQ+goX+b0gAR3pv3o4pBZ5shGZIOTP8bP/lYyBbMEP/5SUhaObMMDl90GKcZA+ak
         blIFMW56L9s84HvPxsxpXI7MzzmmcymZNUVMVLOYyqrkVNu3HfCO5kkFVedwRs3ciaM+
         a0HyxIk9VmJQZRHVrm203B0+tkDff758/vc+23YJB3uuc1Go9fHiqb0QIE82lMXOTPnP
         qXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690988520; x=1691593320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nImulFWj8VTnTfSKoHJB+uK3WiURTzzmP3Vx/VbcYKk=;
        b=WCqQgRuHsEgQcaJpWT+ZHQkgBDKXce3rojHXrYrF6rIvQWoqOEOZup9lwNZFmQnjxX
         riF4BeQexqpQD6gFW5FHy2ymHqlM4wzBvQPRL+CFcd1QhhMV9gqymXOyPG1L8VhbVTm8
         v3cnwWyxtlgTpFVtdWokp2xqqTD/ut/GNo3+SWiX/G8KEOKkSHOJL5EGB/n0CRh9AMnr
         VZK4mamjVr/7jLQsZI0sFeneUFHAXPWQHcdY0gmZROdOJ4dSYNBOnI6QWL3aegqC4NZI
         d7m6Ag21t+aKfnyeycn+w9pRtNyj89B42NU3NYMLMroPDnHywdubU9Gev5n+6q8slkbj
         ut5w==
X-Gm-Message-State: ABy/qLb1twwyqW3zsxQZGwVy7QZzWXUEqGd1tONJdc2zMIeLg+EONdGe
	PkroLjhWPyIhAi78mhJV+nAdpyV6o0MqyWXfu1tudg==
X-Google-Smtp-Source: APBJJlFykme+yf2L/FDzWboz+PNHF5ksbViTvRVBVq1JdYyI8i5nfMsonxgq1h3vCACtRcGcc1oYZQ==
X-Received: by 2002:a17:902:dac8:b0:1b3:fafd:11c5 with SMTP id q8-20020a170902dac800b001b3fafd11c5mr18601162plx.44.1690988520102;
        Wed, 02 Aug 2023 08:02:00 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id v11-20020a1709028d8b00b001bb99e188fcsm12503963plo.194.2023.08.02.08.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 08:01:59 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v7 14/15] RISC-V: Select APLIC and IMSIC drivers
Date: Wed,  2 Aug 2023 20:30:17 +0530
Message-Id: <20230802150018.327079-15-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230802150018.327079-1-apatel@ventanamicro.com>
References: <20230802150018.327079-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_080203_826281_F824690D 
X-CRM114-Status: UNSURE (   9.43  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
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
index 4c07b9189c86..318f62a0a187 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -148,6 +148,8 @@ config RISCV
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
