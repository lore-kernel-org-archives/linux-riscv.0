Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB0F2C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 16:12:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9EE4604DC
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 16:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9EE4604DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KvTWOrIkgP7WoG/J7FyWb2yJZyN8isO57Oweq/zLpJc=; b=jPXTkpML9p5u6I
	BA9apY44jmjVgzmVqkU74u2hTs9eW5NP5GQh/j/sZmJAimn6Ue+t0D+taNgmQzvKb8cLD9CcwwSkB
	VtRYdYVHFqZbaXF+VCNWPXp89kR/AtgEHOIu+CTDVtFRPXrQj+6H/BUEHF59O+oHAyhyL/3Dcl+Bd
	q835p8FUKupcqEMG0oLzIIT97awsmt6jEikDbS88MSx4eYLIyLPGHvKyK/TfiypWMrac/sv6aUVG1
	tFtAhC6CMtgWM2QEZ3kidG1A2QQz7b1POOIAP+PIlxaYkEjWFNpT3sTI8Am+ANTNkue/C4I8By3qW
	FCQS3MZCEf1UkO/s/Oeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhwO9-002FPk-NM; Tue, 02 Nov 2021 16:11:53 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhwO6-002FOJ-Ee
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 16:11:51 +0000
Received: by mail-ed1-x532.google.com with SMTP id w15so77757453edc.9
 for <linux-riscv@lists.infradead.org>; Tue, 02 Nov 2021 09:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z3xrx/IjdMfQoBfwXaJgW39HMolJDiqcY4GCUL8qxe8=;
 b=LXfIj2Z4WMpkea3nWTzGuHn0zasNZNcX6P8os0+i7/c8qIqUf70qkE7Sr9Q71TFqH0
 9ALKQHimQY1zh4nvtz9/cS4r8YVjSqpSXxs7QgJLp62R4y3sOtwktYJcWvv6rf7cEJy+
 cfd5nNe3YVCDpex4j3yvh+cn5FAU6Z7s+sZnUcBV8uuNRqeShzTEXw4o3dT4f0RJjJa3
 IDrVpFek1tD7RqJljLFWlavIQO0YrcSKAdqumdtbq6bBLRR//0v1pypI9dgCP+RSt0CH
 RSyeOuGxrnfyZFLAuzEO6lOyaKxLMIuKrQ+NLAK5YRddACJC/DfauhpxIRchJqU/Ma4B
 D/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=z3xrx/IjdMfQoBfwXaJgW39HMolJDiqcY4GCUL8qxe8=;
 b=i3DBYIqXRYBfJzucrWmJNc/8B06PK3gebt0FiNsGU2qIPYybPDHxXZ9azpLLIUeBM8
 jfvpaO+y9XeX8LarUtbche8CokpqhzKYcZfzet7q9yHNhn7rRgWtJcaXDiK3u2r45UbJ
 fBhBtsOPnuEyD/7YyCkvmkcvVI18uYvhtutaKms9WO1c3Zc5ethQI07O3wz3FOxR5lAj
 XBpiclTbQDPW2vi1+MEGAElhTvsN7BMY5uKf0v2nRDs04r12g35xy5V1SBlj2mS+0GAn
 RCgCv+vPkDW1qkRV27mRhtTCmZyfQxcv5EBvf5PkoxltA3YVl6n3208Zm3qjcgWR1evu
 +VJg==
X-Gm-Message-State: AOAM5316pMhlpbk93bZGwLG+kMhqFZjcP7OedHmrJr7hnpaaZENXCh1T
 w0nN7x+A6pRYQu0otymKLKmJZ6CZ75sOjg==
X-Google-Smtp-Source: ABdhPJyovKza913KPMbj0Md2JTDAPXlRSDUZ9UAcHWnMSQ/TZMe5pgyFBG1YPDmyjHNj+AmITMpPPQ==
X-Received: by 2002:a05:6402:da:: with SMTP id
 i26mr52392928edu.207.1635869507694; 
 Tue, 02 Nov 2021 09:11:47 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id c7sm8451374ejd.91.2021.11.02.09.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 09:11:47 -0700 (PDT)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/16] RISC-V: Add StarFive SoC Kconfig option
Date: Tue,  2 Nov 2021 17:11:10 +0100
Message-Id: <20211102161125.1144023-2-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102161125.1144023-1-kernel@esmil.dk>
References: <20211102161125.1144023-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_091150_510784_C22BC835 
X-CRM114-Status: GOOD (  10.65  )
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

Add StarFive Kconfig option to select SoC specific and common drivers
required for these SoCs. Select subsystems required to boot so the
required drivers gets enabled by default.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 arch/riscv/Kconfig.socs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 30676ebb16eb..6ec44a22278a 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -19,6 +19,14 @@ config SOC_SIFIVE
 	help
 	  This enables support for SiFive SoC platform hardware.
 
+config SOC_STARFIVE
+	bool "StarFive SoCs"
+	select PINCTRL
+	select RESET_CONTROLLER
+	select SIFIVE_PLIC
+	help
+	  This enables support for StarFive SoC platform hardware.
+
 config SOC_VIRT
 	bool "QEMU Virt Machine"
 	select CLINT_TIMER if RISCV_M_MODE
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
