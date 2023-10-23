Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C290C25B47
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 17:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W8ALQb8gowSA6XwxMHWc2umiMh1l0ZIPPwgXkuGdaTQ=; b=iZjEnet86CMlja
	wfQAQw0JLAq5T+1qz5BKaLMJJMFiErn+pZAPW+9mbh1xeiPEXthOaotI5udySDhJNpo8v6W9Y00mT
	4u4N+LHKLDC36EjWx9YKzpJaL96DfVp9eGn2XqPSVWwLMYgNT4lDARfL5kDT+tSFD93OendYcl6wW
	IMRkgyjl/faz91AT3RGpVEuGO6GOf0fd5zjYzXp3KxVCJNRL7k2L8YhIY2kpaeviOhmSqnZ8aau5q
	I5/pSuE6zV/5clL7CQzyn/2zbOh5tTfD4M1pbdGTrtZjRadcuEYix/3AtpcI8vuqc0gaCdLgmCgdp
	20TK9db5GTV1ZNoONd2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quyjw-007wfT-0v;
	Mon, 23 Oct 2023 17:29:20 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quyjs-007wcz-3A
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 17:29:18 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6be840283ceso2847968b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 10:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698082156; x=1698686956; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36mJhajWQppw1r4vewDK4hFKpILxPms9Bh84cWTmNnE=;
        b=CLOogle2zdtsYWi5VNrlXCxFGkSENycxLU2jP79rd0KfyiGFBrBnEpnUFdNwuJau0s
         0e9/FRdtqxa49RJhHTHA10qED10WhvcTSA/PiD+TJWtrQZDOZSa+xQZsK+Rea6krcfDK
         5PaGBxi4zmUOX24sFvcc9VohXrCgJhyhlY+Nc+0i6wp3hVdf1h6Ht+nIFAS5HBtQnL8r
         9Me0HkiKmTDKiw8aHWha0T6pbDyJnBIOfJgeiMVXi7nauyy+2YiuRutLSM/w7S1NxZTM
         ftjwb7JbfIXlnBZVCD2j39b2cdRL9dFrHUr3yG16CPzm0zmRyHu261uDrzatuxyFBC3B
         KHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698082156; x=1698686956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=36mJhajWQppw1r4vewDK4hFKpILxPms9Bh84cWTmNnE=;
        b=UfuDoFoVXZILKb1F6dJ8IDKVk9qCP4q+ZvZ7UyZdNbQTmeTeBEatO0uQFrrm76d6Gs
         whOqTVo8LrLxYhhAWTyHe4Rh+baGc7y8SCwYCLGBFrQ4uLvVLV+k3dtITso7rv2Clih8
         dUg+z6i+6EjCd59+n3wnFxNFLE5Fcw/hTH4MlkOHHKKbJwnD2zIPp0eNooTfH03FVDx+
         e43uKVu/++zcuyJnihA4hfYDqDpM6pA3xK2bePIa7S0Ffq+O/kwkWEk3o2V/NgVJO0+r
         nNm9H6Fm6WzHCTd/JBWxe0gq5U0WgTGodgw0aW1Tkp2CjKTxfq7x9pDEH1GybLBWIqUL
         Pf7Q==
X-Gm-Message-State: AOJu0YwjRnM9AHok0O4AUudrci8SyqUALDoYlOG456Wz+6+lsXCLKHF6
	3TTHZHXcQ69H6SM5DIeMTbMhTg==
X-Google-Smtp-Source: AGHT+IFQlv4hAohFN2/tiwcRFKZLmk7B908S6YeDyALw0pkI0TorMC0K86E+LZulzmkBDxtFYTRLeg==
X-Received: by 2002:a05:6a00:c8f:b0:6b5:608d:64e1 with SMTP id a15-20020a056a000c8f00b006b5608d64e1mr8900912pfv.33.1698082156176;
        Mon, 23 Oct 2023 10:29:16 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.9])
        by smtp.gmail.com with ESMTPSA id g5-20020aa79f05000000b006be055ab117sm6473194pfr.92.2023.10.23.10.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 10:29:15 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v11 13/14] RISC-V: Select APLIC and IMSIC drivers
Date: Mon, 23 Oct 2023 22:57:59 +0530
Message-Id: <20231023172800.315343-14-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023172800.315343-1-apatel@ventanamicro.com>
References: <20231023172800.315343-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_102917_030146_62D6E3FC 
X-CRM114-Status: UNSURE (   8.91  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
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
index d607ab0f7c6d..45c660f1219d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -153,6 +153,8 @@ config RISCV
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
