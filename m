Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D5B0C43217
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 13:42:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12C8F6023F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 13:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 12C8F6023F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z2Q4E7WAx4SZDSSPij1xxvbLZ1KEDSWrRGXrZdfsQx0=; b=ucb1vXJeS9qY71
	AbLi7PRRcT57veZkNmyHxNFrRj8BfX7WJZ9xrvaeQe26OOc1zEqjpqYOVInnXTz2HWgZcimNVQLmr
	qV9Xtl8v7/Y3Agcq/ZtmvYjxbK4gRgzhRdECflLECuoYcmRtie/Z+EcCls+qLVqtPT7Kw89zip/+Y
	WS45GLjl5iylrV4wxtRBdRykGwSMOTCEELFQnWGQ7/y4JiFG1mmIpkHAG6paja8T5eCai8X6KHcJ+
	PvA/xlgcqVu39seih1yjDBGYXz2TL63V4bXcM8pBLi9xXA6Q/+Qpjd4PfZkH9DEy6jGW7jfL28gsD
	pEIfWhX5R5eIT+D239AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maI2R-00D2Qv-MW; Tue, 12 Oct 2021 13:41:51 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maI2K-00D2NL-KE
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 13:41:45 +0000
Received: by mail-lf1-x130.google.com with SMTP id y26so88694025lfa.11
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 06:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DGGFcJwUluytadH8SL5R0mewhPlMj47K6tSGZLmd1as=;
 b=Q5kCK0dM7MzUIVG0cBAevxVJPYiYEAnI71yoYWbZFo8+BKIvv8xDZO7fBxoZuP20U9
 AjIgofOFufwMB4nb1JTDoboEzAMGdrAJiaPpa2iZD4CsDPmbYJm0hgEhJYCsuliooudu
 1FZ/f6/F8a5V3s1zZpk7dsgGbrp769AMUbWAY9+o3KE6Tv4dYzOLe4ETbRCXhK09Kuxs
 NVNwP0TcetF7/E8+KYXw9KBxT7RvHnmOBlBQXmoOlFQTp1xPHLWazCAmwGiTCgVkSsrn
 L+VelMvBtCMQDQmXO4WCf7pZSymi93egYm9BYB7j1rq0WrfZ+y02liLIJyoYfHKW0a3X
 jOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DGGFcJwUluytadH8SL5R0mewhPlMj47K6tSGZLmd1as=;
 b=Ui+lbsXFrHY5C8OOKIBUx2i5cKYBbm56+2l20omLCu4reg2o8RA2IdiapFuhAY3+GM
 Ze+7QF6VPvjea3GR7QxDLPz32BohDat6T8hLQD1zf/2vERn6wz6G1M8Cqqn/kai/OyTe
 +Db1phty0xyhPVFNBTiS3xIZCiGFkQd1iI9+lTWeNFqchJz9GXt9WeAJQFE4+3xyFwdv
 nXa0LMXvGzYQQ1jKCq6AY+ZNvuL45KtuXsBSD1aiXELk9FHJYEw67+FGavgo5lU6jJO9
 gEKuYEtYaIFvpuS34rsRqtFuYRZxFJGizKx8QP5JEo07MkioxoWfF67JhwUOXS5EFYQI
 X/eQ==
X-Gm-Message-State: AOAM533IrDnzfrXO4/fJxf6DX0p3oEuypO4xiIj6ojJU7WlZILApjlv1
 1DeYIX0GKg5JX+478Day5tZ/CmKecFP6Kg==
X-Google-Smtp-Source: ABdhPJwez4d+GKyXDGVd9Y+nTRN59R9RrisJjzFa5FgxOuhnTRN/34SvnIlTQWXm6+Cb+4talE4IMA==
X-Received: by 2002:a05:651c:a05:: with SMTP id
 k5mr8906846ljq.288.1634046103011; 
 Tue, 12 Oct 2021 06:41:43 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id k16sm1033761lfo.219.2021.10.12.06.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 06:41:42 -0700 (PDT)
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
Subject: [PATCH v1 02/16] dt-bindings: timer: Add StarFive JH7100 clint
Date: Tue, 12 Oct 2021 15:40:13 +0200
Message-Id: <20211012134027.684712-3-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012134027.684712-1-kernel@esmil.dk>
References: <20211012134027.684712-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_064144_699040_D6C80CF4 
X-CRM114-Status: UNSURE (   8.92  )
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

Add compatible string for the StarFive JH7100 clint.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index a35952f48742..8d5f4687add9 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -25,6 +25,7 @@ properties:
     items:
       - enum:
           - sifive,fu540-c000-clint
+          - starfive,jh7100-clint
           - canaan,k210-clint
       - const: sifive,clint0
 
-- 
2.33.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
