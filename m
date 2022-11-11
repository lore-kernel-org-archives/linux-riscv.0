Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232E5C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Nov 2022 04:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PhwFbvC7Knjds2iEie6I5SFKwpApnS3rP2CMbBf7OwQ=; b=Mm6i26sjY8QWh2
	C5321Itw9tA/06nIr5Tak1uVbPnsVPrZHELsRCSkT8XiKaqDOQuY/5YPX0Wz1Gr+XpTG/s8hgILe1
	0ZXurbg0j/cAaqnyFIfK290p5hIU/loEFv1sBoWzMO8Atq8BVhAoVVMXFR7daQDeSeBRKGODRzBTB
	eksg/V3vpblt1VTmfW9kBWkRrCZ+uYNlDmKRUr/0abpyNbRHrPO3c4HOItJel2C83MOo8iYDok5L/
	wpWZvzQNl3S83Uao1Pc5ChkdbOUJYA/th61BYcZLo+zZ2RXrggVQYbZ98zbwexkR2/V8O1SVgqs+W
	p10AzmltQLY4gNbKdUng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otLtI-00CzOr-4h; Fri, 11 Nov 2022 04:43:44 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otLt4-00CzG2-RV
	for linux-riscv@lists.infradead.org; Fri, 11 Nov 2022 04:43:32 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-13ae8117023so4362137fac.9
        for <linux-riscv@lists.infradead.org>; Thu, 10 Nov 2022 20:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QDVYSk98Pqd4HV62BK0V8wp4iYN5PuAbyZ/qltqpGfw=;
        b=pGEC0adh/z21JLXfroQVWPiQB8qRzyeAxJTc67/f0F5iN0Gh1pmhQVFtbzFwJxzq7x
         lw8v5HEnkpA7f+MR2HfUCUo0goJIZbF9HPhj81RhS6pDv3UXQAmn8ihltl/h+LZTehtO
         f4zpyWcf044SFzNCrxEANZyXaShWJhsj+AKkyr2lWAJbatFc+uFES+OQRitG30+FGkDn
         iwKUN7PkaEG+/vjEYYaE+Q7HS+hM9CH+akvSrXi+ofXrGHz8WqfnFkeCPG/IHSkDIm+v
         YR5y2mBsJQDRRgkRX0/IeOQS8/rrdgZDjrDBJOp1rSz5gnPhcn1IHlyj3DvJdQsoJ3NT
         Iuxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QDVYSk98Pqd4HV62BK0V8wp4iYN5PuAbyZ/qltqpGfw=;
        b=034ekjq23B3wzOupXvM7r8B5ziBaxyMv8XmFsx7OWGRXsahsMTV/yk7kgjJ1WeBfSQ
         6ZIgpw0v9sMAN/sgLpL8FYnW0wRKfKJfPnQjiEurK4GYWUPe7bEBBKJn+3Id3ODp2N42
         GjWcAB/gTYJ/TpsXK5avPpMiYmIKW2a3xp69givLVvQyMsDaOOUyhf8PLsLlJZig1Jyx
         7hHohBL0mt11ZPUupYbDNMfxBpmvvajzGFpl3mEC2yvzH++k9AgKhV+6TjuYmISeOHbA
         rl1gvBR/6dMepvxPBNDIxu7pm+XzhmmylaJMCbgg49RhRfU5bXhQU9cExXp5NoYWM41l
         Bv5A==
X-Gm-Message-State: ACrzQf0XX2qHnYslCoL+gQKUfKuqMnNRhuKZjUjGqnYl6lNOfvg8Vve0
	FKE6aL6IGWdhUX5lCiuqCvm/1w==
X-Google-Smtp-Source: AMsMyM5DWhoIHaszP8oZY6DWjTMwKD/Z6A3foCxphzY9FvQRpztlhXmyAzSAR2vBEk3VKni732ZP7w==
X-Received: by 2002:a05:6870:1f0d:b0:132:7d3c:745b with SMTP id pd13-20020a0568701f0d00b001327d3c745bmr2895855oab.180.1668141807875;
        Thu, 10 Nov 2022 20:43:27 -0800 (PST)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id k14-20020a056870350e00b0013d9bd4ad2esm787353oah.12.2022.11.10.20.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 20:43:27 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 8/9] RISC-V: Select APLIC and IMSIC drivers for QEMU virt machine
Date: Fri, 11 Nov 2022 10:12:06 +0530
Message-Id: <20221111044207.1478350-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111044207.1478350-1-apatel@ventanamicro.com>
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_204330_920030_A32337F5 
X-CRM114-Status: UNSURE (   8.36  )
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

The QEMU virt machine supports APLIC and IMSIC emulation so let's
select APLIC and IMSIC drivers from SOC_VIRT kconfig option.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/Kconfig.socs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 69774bb362d6..c16b32eeadff 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -35,6 +35,8 @@ config SOC_VIRT
 	select GOLDFISH
 	select RTC_DRV_GOLDFISH if RTC_CLASS
 	select SIFIVE_PLIC
+	select RISCV_APLIC
+	select RISCV_IMSIC
 	select PM_GENERIC_DOMAINS if PM
 	select PM_GENERIC_DOMAINS_OF if PM && OF
 	select RISCV_SBI_CPUIDLE if CPU_IDLE && RISCV_SBI
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
