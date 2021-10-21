Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FDABC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 17:42:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F7B960FC1
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 17:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2F7B960FC1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mk1HxxgdmXzhZS55GE9q25qAmEw2O2w5BY53Gemou/w=; b=S/lGbUmBzzsZK2
	V4uEN10n+FLF4qYET4/gGSRvc2CIJBNkGNniyIsJzPHgBbDwhN+J8/qxjklop1DbHid7d5BXqT0Om
	QoZB8zDPIYlfMBgz8N3Pjcbc8FlvxPat1fhU7Qjmr/V4kmiAd/BUyv4ynJPZcmcUen/9E/yHqXPz5
	dEw1BYhMCHwrIfSFfJHTzWJgY+ld8O3Li8AE+9teH6ohAaw9mWh95dEL/BBkoztq2XXEwnlTNAu05
	r9WdFshuLJKDDfnmR1ykIQVu4mlegvlJq7HwxKseV77rtWtDd5LgyArr4bGF786qnI+VYOXjnZA9Q
	dkjFoK4lh+8WngDpClqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdc5U-008WEa-Lk; Thu, 21 Oct 2021 17:42:44 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdc5N-008W9g-MV
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 17:42:38 +0000
Received: by mail-ed1-x52a.google.com with SMTP id u13so4088016edy.10
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 10:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MCca8WmqiZmvjsKFOBNufzAInvNjctDyKcXO2F2kBQQ=;
 b=TQjF/z4gJgAJiNH32UrxrXDgHZj7FpBafMT7G/89Q2si+DDxOMrC9ZRsg0NI2AH3t+
 tXL/1EYmV8KJazCpVz/3fhhUHNsfKssBIikEmM17eQ8UTMaL5avj3AU/vpILUmZplkMe
 HwpIoKu1D9SdUWusZndSGEvNvsnJC9yD4RHm/an/ibdRUoJa/HtdH78l9VYlhNuSTczC
 cCJecHazUnDqsbZY93LGpauBnBob6eVGtErw6BbkIHsVYNq1qL8ARBUVYl2DjUjHl73K
 FvoWmUFtnPs9x0KS/j0TgJ/AbgpBqJhy4czZ0eWV07dP+b1pIyrFdC22Aas8tgyCnrnb
 PTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MCca8WmqiZmvjsKFOBNufzAInvNjctDyKcXO2F2kBQQ=;
 b=IKi/RUpovJSe+0tTcVebTihaFBsKv7hcs35j3cPyTE4cFPcNkLPpMr48tdAfpVPypx
 oEpa4QGxdbRj0RvmtHNiiuojK1HZ06CuMusu8ieBuzVTr7XGCwxFGLLqzzaXe6mtkJg4
 zYBL6bTE1V+eRmYv6Pv3d90itAKrFg5/cQS9FdBcp0ZOOQ1Dm7CqJEIJaagcofwC8AlA
 o2DUruGT+q85wKYO67PtYAWfzc33hmzZl574+3rO1J2Ptcjx11EH2OEl9qVRU+9ZOXLP
 bXbPk1CQqOoyDOPxVREocfmayM74dec9p/b0arEQW+ttivRknASDQCJIl2YwSnmd2jto
 W6HA==
X-Gm-Message-State: AOAM533SSsH9YSjqrx7cyJHdbf7212o9mNmA87PEL3XNmJTsVi3eYIVP
 7mKfhfNZV/+vl9IGlimhgdCvYdNOoxf9qg==
X-Google-Smtp-Source: ABdhPJzJYngSIkBuImIS3HQujkU2qyzg7pzE2cfapYrdsUmfEGCaOcEXh1aq6FzaCLH/YGvTArPTCg==
X-Received: by 2002:a05:6402:3554:: with SMTP id
 f20mr9652573edd.210.1634838156013; 
 Thu, 21 Oct 2021 10:42:36 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id h7sm3144847edt.37.2021.10.21.10.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 10:42:35 -0700 (PDT)
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
Subject: [PATCH v2 03/16] dt-bindings: interrupt-controller: Add StarFive
 JH7100 plic
Date: Thu, 21 Oct 2021 19:42:10 +0200
Message-Id: <20211021174223.43310-4-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211021174223.43310-1-kernel@esmil.dk>
References: <20211021174223.43310-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_104237_763600_8B01DC4B 
X-CRM114-Status: UNSURE (   9.12  )
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
