Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F46EC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:02:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E2456103B
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E2456103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9fiivmEnp2N4xaMNaqWg9+g3GGRxazZVMYJ7AoNWpZc=; b=Rdbadcgi9XjZ0/
	Xa3eUjSqGVztgnAjZPbXfdu0qut8pJ47zubAiG5jU+ruTCKLD33b0Zv8FNDU4DjT7BX0H20tKHV29
	MEvaQORfEtT9jiBh6pKDwbs6k8C1Uvk9+0vph6nFFdaBfIs3KCT7/qtPpgl9nLPPTH8Vmyv6EoxwF
	s0ENoISX2RtTaEkVsCKtTYTySqYElmrJaUWqnE+zZnuz2gic5fG0zpJv3KRIj7SeLo+WC9GNmd05W
	duObP6R6QZasaI9osKqGogCeKhQaDq3b5rRDvLnICTy/chZXdlQGkoEtPMsVKdG8jUFd9avijpwlf
	wnsnlFgP2Mn61OPrubmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmzye-00240J-96; Tue, 16 Nov 2021 15:02:28 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmzyW-0023tN-HG
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 15:02:21 +0000
Received: by mail-ed1-x52e.google.com with SMTP id b15so88869961edd.7
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 07:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eESfjL+iaVjt21sHtGEVPwxEB8OqLbpv+keCGxcdIyU=;
 b=GBo/tWD7/VC+DrNkyc+CGG7YNagc8t/FoORpQFKPHdPt0IV9Gx9y/PiZNrnUmDm5DC
 UZf06nG/gksTBavr4RbBiaK2NIIK59KlsVpy2t8CtygTzkbOnYeKkmskFq74hRdJDPLJ
 +OyK04RpIBUFrRiywEIh3s0gISQspVWuNN+I9YLGbOJ7/n4MprXmsJbNK+tzAMigYc0M
 DPnw1/fyPEKpBX/4iJ6hfH38jqAV8DvZiov8hHt8Ey9Kij0VBSapj3CgPhyswAYM0+58
 q4nq5XxKRORgwMw4hkuqr5IMxU+Enm39ADFfTtBSD9efiwxOWpTvyNyZC112irpFSpRN
 Zj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eESfjL+iaVjt21sHtGEVPwxEB8OqLbpv+keCGxcdIyU=;
 b=VLEn6/YUY/ifkRzFr4Cp9ia8mqhnCv+evwt+FQIcUHX+lemIvpHLWvTzC1b0C/nGQm
 a/O0NRGk2X00TNwX7EXRf2wnX+8AncZQAVxRInAJCvacgDSZqgmJ9hXMMsy5OTV+lXAe
 lKG+5jzfK0gZwbi0TxUA1ozKtOVmtApC5tITZEVDioEjvmOSvK/QW/hoos4TxZwBUgFM
 2bZSdOCkkgExXSZIJyXwsUT+2WW/6arLkM90O5YvymHDJOPjHtUpPl6PtB8HfqFSr35B
 pSqyvHxPkShw1xRli1HkbDA9NVYwDt8iah2Cnwg2wem8iOJyypcDwPYqNBuvtYG3k7YP
 Zp9A==
X-Gm-Message-State: AOAM530aUeabtnVv/LmCEhDI0KoPCE2H6BmWP+Cldijx4zHN2a9wkfmi
 WdQMkPG94CauLaqstRPsFjhmfATbcybCNw==
X-Google-Smtp-Source: ABdhPJzbcNiVffclTcRpaBO52GwEoEn2jk4MljQAy87jtPBHusK3NacuiHaKOoX55v9hJnHjiyoKsw==
X-Received: by 2002:a17:907:3da6:: with SMTP id
 he38mr10456201ejc.151.1637074937635; 
 Tue, 16 Nov 2021 07:02:17 -0800 (PST)
Received: from stitch.. ([2a02:aa7:4600:b4ae:a375:e7a0:9eaf:8d7b])
 by smtp.gmail.com with ESMTPSA id u16sm9414311edr.43.2021.11.16.07.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 07:02:17 -0800 (PST)
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
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v4 13/16] dt-bindings: serial: snps-dw-apb-uart: Add JH7100
 uarts
Date: Tue, 16 Nov 2021 16:01:16 +0100
Message-Id: <20211116150119.2171-14-kernel@esmil.dk>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211116150119.2171-1-kernel@esmil.dk>
References: <20211116150119.2171-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_070220_625908_3FEA9869 
X-CRM114-Status: UNSURE (   9.33  )
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
