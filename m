Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D238C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Feb 2022 05:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yHaLQ5YIXLt6rczkNSHR+xGLAtpF0cj8uugWG6f9lzU=; b=OMKOhLcoQlhoE6
	0q/gcyF4cRutsgVooxdO9Gk221E7bnM+O1lEYD4u9JdaGbZnT5JrbRLyV0DYbFrpq4CeBJaE7zyj8
	exLKcw8VfVTpJCY8o2c4sG51HafpOd7GMxhLG6aZ8IOsF6OBnW0nD7L75n2buqfS+1zGPrNpnLAi9
	+WIsJuJ6MZM/8WTC1pW9bCRIeVdxfQpUgkRGr95jRzYxFdLXfqMIecasu9XvLKe3T7acca9s98gnI
	3RcMPwQ17+1F3We4jD1BCzLqnx5mDYI/hdyimS3sncSHp45wNcl+EscXN5HLvh03ripzRfs/VdR7n
	HfCbgp3JyCUvO9CTaM8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI2Ra-002iIk-9Q; Thu, 10 Feb 2022 05:56:38 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI2MR-002fZh-Hm
 for linux-riscv@lists.infradead.org; Thu, 10 Feb 2022 05:51:21 +0000
Received: by mail-pl1-x635.google.com with SMTP id 10so937035plj.1
 for <linux-riscv@lists.infradead.org>; Wed, 09 Feb 2022 21:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qlm9yJ5575SFpR6IPywQKZmVoP3waSVFMhfeayBNTbA=;
 b=fnfZc0AIG8SBxpjQDcaVBiRVbSpK8UXvadVoxtlMHcKr0gAVz662qCEZ2aLfHkaCrp
 oiNJ+9QqhvaLMKcfaPl1GvDq/YUj/KRrfqu1TELLhPgEcxVBKkh5/LP578h0s79b1qwj
 Y7SVefGUnaxDq3ntC/uarGxulVKTMh9zt2PhbZ5bJd2Bnb1UTvzXAAVcFv37EO3hG2OS
 z27IWz2UqxPidErtJ6MEhNTczwPVKRGCWbxEC3/KRbK/xRRz5GP8MTSv/3LDlLwfNba8
 osTFlbhy2375IUn5yHEpNyCH1aSPSULs4Q4hVFjmfd5Opdfvh1Tc1WsDh0arV08b9I13
 RBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qlm9yJ5575SFpR6IPywQKZmVoP3waSVFMhfeayBNTbA=;
 b=3IpjwcBOMk5VQRodiQS2lF/4jl0lqBNPdBaD9nOZvcFtwf/WmBQxgHTJNrwhQs6KFa
 DkUwzbKnnYML/whzVgVdzpuvkLVDlYJkLGtzoin24MIrat7wtCfN0rOZ2mAHZe7/i9l6
 uNIFD2bl7sE3H1gy4bhLsMTBcrsHEQ1MqvW1+f6W8mtA+mPr32v31RqCMImy7iiCkrkB
 RGh8LIk7N6lHfczDtWz3KKj7cS77OfOYzlk/MqTW3UDFURE+cpYagYG+xzR2fkilwvFX
 i6bBld13qSzeAODUgKCTmq30K8yjXv6ay2j5bIFpNBsZ0w2oruuAab7nfgYW/yKGtvDk
 bcqw==
X-Gm-Message-State: AOAM532587aO1QQhdeTPYPwpSYs5+SDanMsAPH1kDec72jFMBOQ8Zriv
 TQ7TK+m1mjfAb5HUe8maSaE9GQ==
X-Google-Smtp-Source: ABdhPJyfhOIllPegTmHNIO0ywUxfTTaD2VxDT95TmWoHMJ394XuWoV97b8eft+oMdipg7wKw+LoPoQ==
X-Received: by 2002:a17:903:2406:: with SMTP id
 e6mr6077678plo.98.1644472278347; 
 Wed, 09 Feb 2022 21:51:18 -0800 (PST)
Received: from localhost.localdomain ([122.179.114.46])
 by smtp.gmail.com with ESMTPSA id s32sm15192270pfw.80.2022.02.09.21.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 21:51:17 -0800 (PST)
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
Subject: [PATCH v11 8/8] RISC-V: Enable RISC-V SBI CPU Idle driver for QEMU
 virt machine
Date: Thu, 10 Feb 2022 11:19:47 +0530
Message-Id: <20220210054947.170134-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210054947.170134-1-apatel@ventanamicro.com>
References: <20220210054947.170134-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_215119_613963_51ADC28C 
X-CRM114-Status: GOOD (  10.37  )
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
