Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F03AC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 17:43:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A77C60E97
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 17:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A77C60E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7YjFa+EM5bfB3WxXSpKtNu4CAhojXtqHY4P4H16lmLA=; b=Zc62Xg1s4rEQb8
	hNus46ukQjhAvedx/HequMqJD1JL2lTgSBrM2gw5ACFYBk2rs/Ob7HWkyrTrZc5NKLZw5G/u1Y76x
	iOzOGG7sMxTACmvxq0lpNab1UJ/5Y8bKzBx6HDLFcJkmtrsfva72W/aXc461rVpMpXkI2vvRr3Uus
	D2Bxnai7O/NhrkI9ZMA769v+b9fx3NO/m+NijYtQ3RheqdFLnKYqVWKxplCiOG6YZKCGqLrH0ObnY
	EYHYmvzwCMl0mwK4rAk3Ggy+nCZ9Mg5GBE8UBgh+powKbzlcSEzdTOlRrqCIeaG2f12aJZZfNr0Go
	LNAuUVADAyR0fV1Arx1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdc68-008WlX-Uk; Thu, 21 Oct 2021 17:43:24 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdc5b-008WJJ-Ht
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 17:42:52 +0000
Received: by mail-ed1-x535.google.com with SMTP id a25so345741edx.8
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 10:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CjoKkwUCJK3HIw5uHUmZ4CoHPrFG820t9YmJMstPH0E=;
 b=O5f3HwOjkQ4+tB3xOrnbF1ENNuT1PacJnXp2w3ojguDJsknTzHV9rEUb4qXA4Ptl47
 GqPq4xeOJs5SBPRaFMA2pu0zmXGnnxb6X1jDlzfrxJoQrFYueuoBR9rbXlRmYSKOkIxt
 hRpyaRhiOnZSEnbkhKwPGWvDhQYWRF57zFZ0tXeAYjhhrs0wwIpHVUm+4ILeoBzlv95H
 D/4j+k5Ykebn8T7qUvTR5yCyPRq+qceNq37YSUYqChv4O5pCN045UfvmFIDMFFpKuHMz
 Hs1PrlKW2BAUoyDHKSCUJW9F98gNYoQPeOtYlhRPzTJLSq2s4ZvfpyRktPcgBuCSJ8/N
 zt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CjoKkwUCJK3HIw5uHUmZ4CoHPrFG820t9YmJMstPH0E=;
 b=W9LNIBNtis0fhW8rmrELUGiVPYPCQZa1U+lPWGzbRpusybrzZiatBVTlZJeZhFgUBD
 9DQiQokx/KYoG10iiJVrXJHYcoCX0Ua1V+oyumwKjedDW8hK3la7JKfLwFUhQmyC9Ti3
 /kjgvaugJJEDxEJMhLB6ka42qqOgdXIorRC/e2biEbtjqzK7TgBFibEqcObl6Tl1LcqY
 JE0kgLFNVZW1XTzcu/EMPKORbFX8hB7YgolMgx7nb8oK6BtGeBj8SkLuOsSqhnXphVwd
 x7TIC/T7HmNfE8CkONkV6ofZ2JP4cVqg0ZlE4VNqIi991i+nd8rKbMqz5KkuTFxjVAOX
 +zsA==
X-Gm-Message-State: AOAM530veJm3Tr8eGVDGb9EEmgKUXFn4wk2fs3lBQd6CgtSZJv+KCZek
 NpSGO51Gy+d4KXkSHD18cS8JX24KzZqlLA==
X-Google-Smtp-Source: ABdhPJwDV3DSHvGqkiveCixNp0SkGI0VrJyje9fMw5jEXhibMe23T9hVaEq64JHE1rPBxiwiiy3dBw==
X-Received: by 2002:a17:907:d8d:: with SMTP id
 go13mr8983097ejc.556.1634838169801; 
 Thu, 21 Oct 2021 10:42:49 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id h7sm3144847edt.37.2021.10.21.10.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 10:42:49 -0700 (PDT)
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
Subject: [PATCH v2 13/16] dt-bindings: serial: snps-dw-apb-uart: Add JH7100
 uarts
Date: Thu, 21 Oct 2021 19:42:20 +0200
Message-Id: <20211021174223.43310-14-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211021174223.43310-1-kernel@esmil.dk>
References: <20211021174223.43310-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_104251_635535_3954979A 
X-CRM114-Status: UNSURE (   9.11  )
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
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
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
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
