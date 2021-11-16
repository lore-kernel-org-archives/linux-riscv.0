Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD99C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:02:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EE5361C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EE5361C4F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cBFCyAmrcm2wkJlVKC5u4aPcOJ5QlPm29vzO5qdAGQY=; b=WK05ppSZbbV3d7
	4GcI3jKzDm/tjiRYxIkOiouB+gu0uk+7f7NBh/fC0M3dOcN/brHaTvTkpdZ9dG2iOeCe9TD5iYP+X
	aMHcqh5L6ffZHPKav5E7b7YEKN8OJrgkAxPtHgkI+N3cNemueK/muk7sFEAGFBArhn2phEsGz9nOT
	Wxho39gf7D5tevhrjbSDHhwuevsbvEa2FO2EdCwm/CsVIf0A7z6UGbuhdSifkfcobLwtG9UzgY0qj
	xQ1HvJ50fygPuCY+yTcggT5oU0URE8nwzw/T01PFONfi0ZNk5OhUq0S3aOxb/YEMhQi/ylY0vniI4
	XT9oaLQix/ENALT5jkeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmzy5-0023b0-P4; Tue, 16 Nov 2021 15:01:53 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmzy3-0023ZF-5q
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 15:01:52 +0000
Received: by mail-ed1-x534.google.com with SMTP id w1so23098095edc.6
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 07:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JB6hpmX7hgdEksB90s0jcnSr+ju9+L9HjspXKT59qjU=;
 b=HE5ENt6vaiQfV4MNlDbaLaszGg3cLQ7pGZh6F6y7/YJ/u84MxEjir45qlyLH69uRsd
 28JPFOlEHaHzPVxRf+ViBuzn4l5/0PMefkaqtK/WELIJORG2O7e7eVagA1TB1qttH/H4
 G5JMSFLU+SYxN7pqFrYVK56L56jQZzPgWgTZdTp/omZCBftO1WGTxX7TKhrRuPchFCPo
 bXYZtk86HDldg9u+DrTx3IMgG5oUBoBr0dHf9P7ZGIc5wUNCvJUp+UwQJDQTbzBejxox
 bl10fnpqlykxFr+UVbQjiSjaFqIsLAk4MS4l25ExbgCt5oRDBnwBJwooHD51HJ2WHtGa
 MxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JB6hpmX7hgdEksB90s0jcnSr+ju9+L9HjspXKT59qjU=;
 b=NXhHFlrYDuYTzoMZwZm5DnII5PTpxFDqNpNh6P2VuxZ6YqIqvR1HmE+EJ6yKv0JkTJ
 rx8aFLernwZTnWycYJfaJi/Hrnp1iTGhZtb+4DjRL1FyuTkTGbp/zVI6IOPJGmoKnUS/
 eoGQA6gk8Hlq4o3rA/r5/UNCtixNXO3Ky/0UdLuyaedC+2vcmbJi68VrimPbKty/PiCz
 yYxoz7N7MfuDJZF4strG4P4FhBK1iwgjEEEezCRVBf/fHj/I9gysnR6PoJiLwLfyG7rS
 SyGqIkq79KlQplDCMPGvtCmVJRy9rfeDJCRUupqvRS2ufOMje4VgaFgX+NuSwhN1AQbg
 YaWg==
X-Gm-Message-State: AOAM530gkfCoJIlTi2qYo2sU25CvXcQx7rn4+jqH7KsQWyzNCgk/z2JO
 +Cl5/cC5pZX4km66iA4Oo+CrQxLdJFfQug==
X-Google-Smtp-Source: ABdhPJx9yGvuPxfqElzl/dVvZFeP+txYs/F8wxyuWuezuC7HWxLcpZVsOpao0yAXkkShuW3qXAIveA==
X-Received: by 2002:a05:6402:350a:: with SMTP id
 b10mr11228785edd.184.1637074905967; 
 Tue, 16 Nov 2021 07:01:45 -0800 (PST)
Received: from stitch.. ([2a02:aa7:4600:b4ae:a375:e7a0:9eaf:8d7b])
 by smtp.gmail.com with ESMTPSA id u16sm9414311edr.43.2021.11.16.07.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 07:01:45 -0800 (PST)
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
Subject: [PATCH v4 03/16] dt-bindings: interrupt-controller: Add StarFive
 JH7100 plic
Date: Tue, 16 Nov 2021 16:01:06 +0100
Message-Id: <20211116150119.2171-4-kernel@esmil.dk>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211116150119.2171-1-kernel@esmil.dk>
References: <20211116150119.2171-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_070151_257121_9972251B 
X-CRM114-Status: UNSURE (   9.23  )
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

Add compatible string for StarFive JH7100 plic.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 08d5a57ce00f..28b6b17fe4b2 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -45,6 +45,7 @@ properties:
     items:
       - enum:
           - sifive,fu540-c000-plic
+          - starfive,jh7100-plic
           - canaan,k210-plic
       - const: sifive,plic-1.0.0
 
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
