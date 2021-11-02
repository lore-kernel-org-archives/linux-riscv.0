Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A960C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 16:12:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5417F6023D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 16:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5417F6023D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9fiivmEnp2N4xaMNaqWg9+g3GGRxazZVMYJ7AoNWpZc=; b=TCJu3DzlPMbVGB
	7npDLt02xAd01XL+P+/HbhLGR9lEqzumJY6EB9z4j0QBvAjKpicZbCcwbEjolSM0exWDUsurnkywS
	kiNLMCUHsgTDmDIDqNhFOt0c3cacOzUs9hUSb+qqJCsbbVr1z8ybkMJkr0NSLdQBvH0xQkJEI4Aji
	2zswKOj9n9IYBIxJTrSe7+eMncl0Ar6kIIjK4qDlq6RkETK/tPjfYUxA4aN2hfA2Axzz1DdlMyK91
	SU/PqdQdTacvV32U+u/EYZOSEs5/ArMiFQvYW74uzCuMuesRS2Do4ILhnyYUVm0nhMOYv4hBvJwGH
	ZWTsSXfHdMYL0iSIK3fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhwOr-002Fut-PS; Tue, 02 Nov 2021 16:12:37 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhwOM-002FXb-1t
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 16:12:07 +0000
Received: by mail-ed1-x52e.google.com with SMTP id w1so23975196edd.10
 for <linux-riscv@lists.infradead.org>; Tue, 02 Nov 2021 09:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eESfjL+iaVjt21sHtGEVPwxEB8OqLbpv+keCGxcdIyU=;
 b=IlWT9DwelKyx/I3jSjePAMMT+3JB2GrVrwnIAGdOk9hrBzHtziodtGkrUDM/u1/ID9
 tprCOK6dDYnlSuKUXV0iMcgkkU4pQdVaTylJCkRs8H0ZsjkdYP1XxL1RGpmxcqATcXb2
 8ozAZWW2Y0iebPUGc6k42EyJr4l7qW2UqMw7BswX2PmiWHECp4ABGnCv1z3K37u1mwoZ
 3FU2yq7EIgbEFbFhtAcU6cPT2eZeLOJj5RA36psBuuXHduiHnswW1bM7FMDU1Z6DDNue
 qst6+MxLFJWX3Pgsn+pOtWhx1WyLU+1rRIMIRl7GtkBKdtqsBwe5Emd3meHWZ7M3rnFD
 kRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eESfjL+iaVjt21sHtGEVPwxEB8OqLbpv+keCGxcdIyU=;
 b=HugWIEjieRP4Hb56K/yeoq7kscquvHMCwYz/CIPk6IfJVPW7At02VeD8N6rbJV8X82
 cuTn6mqiW+D7G6Ld+0rwRw8ES8r0SaX0NOZ8grwxCOBah77EpvH4wqxvaHT0jx1FD24E
 4Og+EJ3tCoFOMIGl8eIzLo+xaa+mfYkDatxtFn5mIHc5z1SENe4nD07OvlFnfQJzQ+bd
 vdEwpwVPp99DrgdnCFxWygTlJQqRp+Mb4qN28fFWEwoiyoY/QXWfPXFSa9xXkws5gDD2
 TI+wm+idSaq4sgktqyYOEYWOtRpqVREQOKLnS9cVdfFwvtQC2sveBnsidHAoe15FLrUA
 bN4A==
X-Gm-Message-State: AOAM532ejzIjG3nRr8NOwDYV7xKhWJmrPZns6H2I45VydcBMIpxsahgd
 k0sf1E28ZlhV+mQV6iGh0OoVrnOdiSrsmw==
X-Google-Smtp-Source: ABdhPJzkbLNnfJXKIBGWGnhTUO/fKndK15BD8iMjIXWBbf/l6lYub1R9A4iNr7JgK9QCzISZhmDG5g==
X-Received: by 2002:a17:906:1450:: with SMTP id
 q16mr48526979ejc.213.1635869524760; 
 Tue, 02 Nov 2021 09:12:04 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id c7sm8451374ejd.91.2021.11.02.09.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 09:12:04 -0700 (PDT)
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
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 13/16] dt-bindings: serial: snps-dw-apb-uart: Add JH7100
 uarts
Date: Tue,  2 Nov 2021 17:11:22 +0100
Message-Id: <20211102161125.1144023-14-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102161125.1144023-1-kernel@esmil.dk>
References: <20211102161125.1144023-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_091206_142034_04CD7C3D 
X-CRM114-Status: UNSURE (   9.80  )
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
Acked-by: Rob Herring <robh@kernel.org>
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
