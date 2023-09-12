Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B28EE3F0B
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 17:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W8ALQb8gowSA6XwxMHWc2umiMh1l0ZIPPwgXkuGdaTQ=; b=CffuzD5V7X5vgn
	+DQTXGkoxgrrNU/+SAiNl7nnVWvwui8QqGgeCNhucCEOmT1IhZy4JVubhVryqI4c2TrlWeD9VOCyK
	YU2t5lj6l7P0p79SEuUqrJBaeY9ygTvV0wf/my1wNYJ1mDIJm7altMR7zYA6JYXyVCJFio1Or1SzF
	PFlwRJkKX+jiDRp+5Km9QQ/Jc/Eik9k6dvERPGa0hasAMDtaXHVd0wTgdbqeh8h+rnMZtmIE4ux8h
	uIh+PCUNH6g95Z6VO0fI1arswFV0QigRq+rHUWEoms8tyn6H6S66lxeyd9xU2ZwYszFOE3DPHnh48
	qeHuQsdaTk05oiy3S/Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg7YH-003wTt-2Y;
	Tue, 12 Sep 2023 17:51:53 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg7YF-003wSA-16
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 17:51:52 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1c337aeefbdso54159925ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 10:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694541111; x=1695145911; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36mJhajWQppw1r4vewDK4hFKpILxPms9Bh84cWTmNnE=;
        b=dntx+MstuWMvoeyqosAKKoTtJrqCShDt5GVbeVKaI09nTuKe3Nk/S04dL1RyqL9nep
         Wn2BJl+9Lqj8ILtuMPrrXjFbC4eCSJLXVCKKBkcx2Uqu4JSoBIoiuuvYN9P+nV8cfIJC
         I+6iX1OlSVTgZSP2kN6Eudo/vQWjFNbSfmX9UbtBeT3caIo140TSrjaYxczO25EMaQq4
         hd8nIHqR14DRuQ8YasoSWvRP2NBIdxrcy6scnnyqf32PsM1pvnJLWhDiV9c4gDfBpLpl
         f0/EIh2ZwLCpu32yeVM7+tmM7YASlkf3Mc7E0NVfyHr225sbaUezDjFmIB5XIMBgXP/S
         /m1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694541111; x=1695145911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=36mJhajWQppw1r4vewDK4hFKpILxPms9Bh84cWTmNnE=;
        b=MJ/ae2KYi9IHpF2uFJndQulIfzskVo+EpZi4OksP4daTwJ72RkFhRKJiEv30Q2KOvN
         I14uGQw3BPP8S3u0sro0+BL0weOHWCbF89bPwzXO2TKRI6IYJLuuACaJRfWoj41zRFn7
         8EfC7qjjvuC4BVQq+3pB2AXz/XAr1VPijvDjg/FT/4liL1TqK2j1YCkydM0B90hwO4Om
         StVuJqi2Lzo19Ju8HDjXOFyfygyA7FAAkGUMpXJIreWAjWhxGxgARyX/D5oVCP51JBS9
         AiWZb6kSHg6WbbK9sxaFdpyn3cDUYzbr88JqpkT4NUMPcyqKcfP8oohJOpLiBtHy9epw
         7BUg==
X-Gm-Message-State: AOJu0YxbeEGiG7Y5TIRjyPCiT0gc+toBRtouMXqB7559xIFUET4JFekW
	NPkJyjfkcl0TZjA8CTr6cF7PHQ==
X-Google-Smtp-Source: AGHT+IGzKiv6aVWHh57FmWTPTv7VGb8lmd++nbi2X5IKfa8UeOaBY9kForZ40pmyk5JQrBe5XHEEzg==
X-Received: by 2002:a17:902:be08:b0:1b0:f8:9b2d with SMTP id r8-20020a170902be0800b001b000f89b2dmr447310pls.29.1694541110710;
        Tue, 12 Sep 2023 10:51:50 -0700 (PDT)
Received: from localhost.localdomain ([171.76.81.83])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902a40c00b001b891259eddsm8691440plq.197.2023.09.12.10.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 10:51:50 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v8 15/16] RISC-V: Select APLIC and IMSIC drivers
Date: Tue, 12 Sep 2023 23:19:27 +0530
Message-Id: <20230912174928.528414-16-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912174928.528414-1-apatel@ventanamicro.com>
References: <20230912174928.528414-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_105151_409364_2C06D428 
X-CRM114-Status: GOOD (  10.33  )
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
