Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D6AC2BA4C
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jan 2022 11:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yHaLQ5YIXLt6rczkNSHR+xGLAtpF0cj8uugWG6f9lzU=; b=fRQ7dzhWRglqjW
	nuL62b7FBarUaTIXj6MO5CBkdgkWVGYiBTTxaqSVpKJ5saJbxZq/gMTuqDiPyHWFssDGqWZp6bYY4
	GVbhIcgiJKlEwLFRvy/UueSkLS+0/n2iM2Nqy7RyUEtqSWMWGLzOr8y6nqrx+Q+sU4yz99+aAjLbu
	A25V0DcaiQcASzlRWaCRX8VnWHBaWyg09WD86yi+ouNu7dAc5R88XULHBiGAmRkOfbXlD9QmeuH+w
	UJ5l0CFiqtW07CcVfkdvc2xaQlQ6x1dSHT4TQ4p3QkDPBDh+ElN9Xzdjr4gQmm5Rv0ym0nZB5XeSX
	o6Ji30djtP3cr8VkpcKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCgpQ-00BaIY-Se; Wed, 26 Jan 2022 11:51:09 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCgkX-00BY62-B5
 for linux-riscv@lists.infradead.org; Wed, 26 Jan 2022 11:46:08 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 s2-20020a17090ad48200b001b501977b23so4358831pju.2
 for <linux-riscv@lists.infradead.org>; Wed, 26 Jan 2022 03:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qlm9yJ5575SFpR6IPywQKZmVoP3waSVFMhfeayBNTbA=;
 b=NxPkbSYmWFaN95PyEIyPwgodGezgxN3X9MixZlR066DnPRYP1cobNH9jAB0s36cd6Q
 ySyqYaENca2IZRgGQsDbpuJFvsHU6cJdWGNL1curR2mCiF8abcRZQmPiQzg/zhsMQ5JJ
 QNzC6lLAd3RwZnM+Jc1hmNjgk7ltV6+5WXz6vpdS9M41r9UxCnPIRDujIbXdLnDT1Brv
 XGJniw06BlrVTKgOvTCCvzeU9yuE7ayYWiVJn3FRJs7KZJ7M0NtnU5zARFaFfXGrWMwM
 DyggnPkk1X3mse6C96lNLVMsMReVj905raBJcjodRFOJ9LmxzzryAcFoB1vnmSUEoQ/Q
 6t1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qlm9yJ5575SFpR6IPywQKZmVoP3waSVFMhfeayBNTbA=;
 b=pmuGGLbTvaTCJBtjRUhAL5H1iSUDsChLBpS+nr6s2P7bo/1sCZ4u7+Yp1wK/aqdgJh
 orQcCgTWlQ41Uoy3W8+uPKd+zRlAMzM2iRZulmcDVvpx3CGBJM7f/zE0dnjiafLA1c2m
 FrmrtwN7pUpLmZMZUk4So/imMZ+F6n+0glyhchQn2ky5Z0nSoFrf2Trj+gAwnM7yKVgw
 UPkkvnQaNxPO6vCd449KPrucboI/vuMZ2h20ygBAxVuRSlhBNYDgAnNHhfrcOBCHsNFe
 GyLfw+sAx+dw9X6/Dl5ASvhQ1rT5f61f91XYWfLaxjdlJcPqVQ5SlVoekmj8PoYxJr/N
 vyBQ==
X-Gm-Message-State: AOAM530WbLIE+tY2XGTMSxprZfyJsu19VDCVF2wMcQ8C2kzAmV2Ij7g1
 3bo8OQ+pxIwhevJJaDk4RmJ9/Q==
X-Google-Smtp-Source: ABdhPJx9kXQfLSUsJYLbLoE3i5jlnsAyM6/6+KfwVUFH8RIATnnVjIb0WUzj8hEixBetgKmmLHf28A==
X-Received: by 2002:a17:902:8c97:b0:14a:ec66:bbb0 with SMTP id
 t23-20020a1709028c9700b0014aec66bbb0mr22332418plo.68.1643197564511; 
 Wed, 26 Jan 2022 03:46:04 -0800 (PST)
Received: from localhost.localdomain ([122.167.221.23])
 by smtp.gmail.com with ESMTPSA id nn2sm2994976pjb.35.2022.01.26.03.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 03:46:04 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>
Cc: Sandeep Tripathy <milun.tripathy@gmail.com>,
 Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Liush <liush@allwinnertech.com>, Anup Patel <anup@brainfault.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvm-riscv@lists.infradead.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v10 8/8] RISC-V: Enable RISC-V SBI CPU Idle driver for QEMU
 virt machine
Date: Wed, 26 Jan 2022 17:14:52 +0530
Message-Id: <20220126114452.692512-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220126114452.692512-1-apatel@ventanamicro.com>
References: <20220126114452.692512-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_034605_430369_09DCEAC0 
X-CRM114-Status: GOOD (  10.72  )
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

From: Anup Patel <anup.patel@wdc.com>

We enable RISC-V SBI CPU Idle driver for QEMU virt machine to test
SBI HSM Supend on QEMU.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/Kconfig.socs           | 3 +++
 arch/riscv/configs/defconfig      | 1 +
 arch/riscv/configs/rv32_defconfig | 1 +
 3 files changed, 5 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 6ec44a22278a..f4097a815201 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -36,6 +36,9 @@ config SOC_VIRT
 	select GOLDFISH
 	select RTC_DRV_GOLDFISH if RTC_CLASS
 	select SIFIVE_PLIC
+	select PM_GENERIC_DOMAINS if PM
+	select PM_GENERIC_DOMAINS_OF if PM && OF
+	select RISCV_SBI_CPUIDLE if CPU_IDLE
 	help
 	  This enables support for QEMU Virt Machine.
 
diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index a5e0482a4969..b8c882b70b02 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -20,6 +20,7 @@ CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_VIRT=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
+CONFIG_PM=y
 CONFIG_CPU_IDLE=y
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=m
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index d1b87db54d68..6f9a7c89bff9 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -20,6 +20,7 @@ CONFIG_SOC_VIRT=y
 CONFIG_ARCH_RV32I=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
+CONFIG_PM=y
 CONFIG_CPU_IDLE=y
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=m
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
