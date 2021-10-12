Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA87C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 13:43:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DE0D6101D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 13:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9DE0D6101D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KqJ5gi2q/nrV8gVFoTQgQHlZmsAwMF6yp9KAEZLrZ2w=; b=VpLIz0sCdwJqfm
	F7hzuLiTEMpYxYK+RJVyg3JBD0j67fw8yfOjaOyjGFyPHo6KK0PHhRRAl8XWnPks4FzBeO+SiHFiK
	2qh61NoAVUY3ZZOZBYk0gxK0Y0pkxzafofxo4gL2jdy30Z+oCw9fgD5qanP1eTRrAMGPhV9O8BnFu
	7/1/dF4gfvR9QkeqFwp6GQjPVuXfWX3LQuc/JOjmyszM4VgNPLzlI/GiDf5OtmnMkNDTGhdo7TXgV
	v3lJBjPYMYAsXGaBqFc6vFeXCKIdhhUnwmShTKBPM0SLZ6zbzg5JfyXXS1WlMgU/Nz8tQrSLVZ3LS
	b3vrSQY6Ir8UtVoE9Q4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maI3r-00D3Ig-6u; Tue, 12 Oct 2021 13:43:19 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maI2q-00D2f6-2q
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 13:42:17 +0000
Received: by mail-lf1-x12a.google.com with SMTP id i24so86003328lfj.13
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 06:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SP3ukIpWgejkYPr25X5V3f6f4cfAs1jYw+VX4Qabu68=;
 b=n4mn9H3yBZU5NxCyx9v/kHth3RsW3yoA9HUheYI4yoJqaPJXoYoA4HTi2/pEsQGzOc
 ZxQogFfcpgTjNLOYgGS+IivOBzsZ9aT9Gud8A1BQCGY7bXlFgSHesD0cMOys2oOm447o
 XVUwgUyzAuXMbc59pJTcPxS+JNI9qVBkoKHXLOsy5eY9h9IYTMh0Ia89R/mVNDsrPtAl
 I2zkaBpHnwa7o7lpJNVAQAutwnNRJYQLO+w2g21KGRBL6DU8JyfAAkrBS/ZnItJr7Na1
 GunByUhNHTU4TCknilLVcCI5FWO9ocI8ZWLlkACHhOdQoEhsPaE/UkWejuTOCSF/31f0
 6sag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SP3ukIpWgejkYPr25X5V3f6f4cfAs1jYw+VX4Qabu68=;
 b=tXSBejw4EmUke6Aq9n90F+cPp3GNJdPxbP4gaOp9WYGQoQma92lHCULVc1zbJTBFUT
 bStBvv2GBprP7isVtb7zvMjWKXjD7DHq92FxlwsYkGh3FISafn4V4KsLJsC8Zb2HsB0a
 trWwksAsdZK5pw4Qich/2hq/vWh+b04H2Wvl7QU7Sz9DZCQwpS3rpP8tVL/+XASOslGE
 DGouo9Z1gn7Xh7BYTC/xSp/4EjuV0CqfAu5kNZeL9axL+QwY5TSlXezHp5g8iCCfQtDX
 +POzU32zPm/j0NFdwD26yhGrBC9EhvIXUxui/Ml5B8oXn74k7Zo+slh4/VAgSzcm4TdR
 z3fA==
X-Gm-Message-State: AOAM531cViFsVwvbdJ51upPzIvHaKwhTfXMY/2qQDSnNCkgTXwZQTQAp
 tjalIzpwX75Q3ad4aW84lBiWQx+46nqeUA==
X-Google-Smtp-Source: ABdhPJwoseP3cc4gsjA7m/LA316WUSr0lQbPRj7mGDZjFft6jEPQ3Zn36oOowhIU3P3nB/RI5aZWCQ==
X-Received: by 2002:a05:6512:260f:: with SMTP id
 bt15mr32895654lfb.134.1634046134691; 
 Tue, 12 Oct 2021 06:42:14 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id k16sm1033761lfo.219.2021.10.12.06.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 06:42:14 -0700 (PDT)
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
 Geert Uytterhoeven <geert@linux-m68k.org>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 13/16] dt-bindings: serial: snps-dw-apb-uart: Add JH7100
 uarts
Date: Tue, 12 Oct 2021 15:40:24 +0200
Message-Id: <20211012134027.684712-14-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012134027.684712-1-kernel@esmil.dk>
References: <20211012134027.684712-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_064216_173115_66E5CF24 
X-CRM114-Status: UNSURE (   9.27  )
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

Add compatibles for the StarFive JH7100 uarts.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 .../devicetree/bindings/serial/snps-dw-apb-uart.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index b49fda5e608f..12137fe80acf 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -40,6 +40,11 @@ properties:
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart
           - const: snps,dw-apb-uart
+      - items:
+          - enum:
+              - starfive,jh7100-hsuart
+              - starfive,jh7100-uart
+          - const: snps,dw-apb-uart
       - const: snps,dw-apb-uart
 
   reg:
-- 
2.33.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
