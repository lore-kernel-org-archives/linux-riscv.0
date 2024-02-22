Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB86C48BEB
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 10:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LkmveTYMFfZF1nTUugiRACOn5b0cPCh2IlGIxiPxVm0=; b=1xos8D6RbM8YZ3
	YIdHfcE3Z4tskVVbIzYqCGeOu4960gH5nUHkX2vpgEaQwukeBMrSBGi8Hf6JrLXY7Vcat4vLFhpc0
	SsKjKGkzKJpD4KLohNeUiB6F6TTtYxWe/HNdr/Mm1Peh2RBocblEZ1T6drDi8tI3t6hYrBne9M1nS
	uCaNNP+nkmZMWFHhlRhVwsYb+MpA7O8lm/xAFH8RJsgzUEoknKEWCtBkfbiPRId880wRsFgf3+Vo7
	0bGX1nP6RbNcTQ7qTLkbWesbRZ5XlBrDEpwET2TbtI9zCPqP8ZVAcVWAzMqbqzLckPEMgK9oV2VNr
	l6vdtlPR0UpyUriQcEcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd6af-00000004X0j-0Zk4;
	Thu, 22 Feb 2024 10:46:09 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5b6-00000004JM4-2GwR
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 09:42:39 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3c03d6e5e56so7318290b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 01:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708594951; x=1709199751; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71v8gbBOdtXGvo9g+2jtAQQQGBX8E4yEXl9JiWYqu5c=;
        b=jp4ufkisZ99q1/b2ZJa5+C+X5AvvpUpwGfmDhYVxV4X5hdcH2rz56ECbuH9xFSLS1j
         tvDTcQp4cswAQMURK12Cmd84/7SelEUHusqIgrWf2++4tDSrr/yeqGMUzMVJXKadAwX5
         FWgwyc4rS4yVTpovggtrHSToQn8HABRqYukEQ7lSAOpyapb2DcmTskxWTdTpS7dmAnR1
         c25gWXlSy2HSV2x/T1fSySlaI0VcqlAdqr/9DStsRtqBpX3fxGl9brXaKCVS1ibKQ0/d
         +AhiZjz0rRuLPNZLfheqvRYeDDBVPFcZa3TjDPS3e6q7IflWu97+RFpeG97GaNsc1Bp1
         GorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708594951; x=1709199751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71v8gbBOdtXGvo9g+2jtAQQQGBX8E4yEXl9JiWYqu5c=;
        b=epVwiVJ+laQaiRAPg75XOVz54a6gMo8y8UuYaqWeK1ZwHcyCkr0IIypxlIE8r4H+Y2
         syLvpm76wGTOf4s3l24kTqiyPtepR7Pdu9Q966VGByIaRxA2DT/Nmd/kuCJgoIE7de6m
         uxHqmSBFeWomS/mFQuVyyPmALw/BDmMlhqYkHvUmwOdDcHK8X+gtXD9ss92qTes9I2KK
         1zAeJ/z3jNoWdoY6r56wHncHqJInj2TpVMSpsiZ2l8FCHgnHNMZTCxJaFAa0vnE2fdb6
         nytC3Jm3tSFfyG6/Avds2P2j5s9N1tSpTAFG1ZBLJ85svtESriTaKZzr/3+MCibrbcO+
         0umg==
X-Forwarded-Encrypted: i=1; AJvYcCUrISwDkkFK6E0IGMuLlqaAWhKPRIPz0fn+CrBLUbw4rHi7/SIV4TfAWFt5al8f4ggOfWCaqwbZ8AzftzeW/C/fnN2SDSPYU/6WLGjqTk4O
X-Gm-Message-State: AOJu0YwJqm3l67rTKc+Klj0YWfm7UyhV/4I48rbHncN5GW6D27Fc+mlV
	zpJdEPQP3fOXQujVeVVuHlNdc8zxBiZ6mDZKjHL4BahfbKO2p8plj6l3SJ7l5Sc=
X-Google-Smtp-Source: AGHT+IF0y2dY34ltcK7epyszLwVDXzQXA+TqKHzDIczRSHobiYjOfHtewc2vswxjV5CnvZL2ARs9rQ==
X-Received: by 2002:a05:6808:3011:b0:3c0:32ad:7422 with SMTP id ay17-20020a056808301100b003c032ad7422mr28344533oib.5.1708594951517;
        Thu, 22 Feb 2024 01:42:31 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id n15-20020a05680803af00b003c17c2b8d09sm130699oie.31.2024.02.22.01.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 01:42:31 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v14 17/18] RISC-V: Select APLIC and IMSIC drivers
Date: Thu, 22 Feb 2024 15:10:05 +0530
Message-Id: <20240222094006.1030709-18-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222094006.1030709-1-apatel@ventanamicro.com>
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_014233_056894_89D642CE 
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The QEMU virt machine supports AIA emulation and quite a few RISC-V
platforms with AIA support are under development so select APLIC and
IMSIC drivers for all RISC-V platforms.

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
