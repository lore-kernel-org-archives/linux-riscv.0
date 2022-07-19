Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE33C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jul 2022 05:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N0JaYHrgNV+saqjnDIehHB10emhlZa41os4ayUYBn78=; b=mLmvDqhZ31sr6S
	iL1373U6UZ8ZHRQg9SOrBV5U8A0aBeANH6GYRKE35s3SfeVh0jX5hAfDTPRezE+MQrDPiHt95hIZa
	z2XTs2hj5emi3/CM+E/p68YanBNo4XbkvuOtSVyfs8LCFyguylZxaEp4KZW8w6f9hEslTV5q/Sa1h
	PKBSYTtoq9Kwx/PwYMA4pD7rSiJla1q2RnJIVGFeRLg+U51n5mts40NxA0o24zM9nyInOLkuTAzUn
	u04dHPTm78S9hCK4qY1mk5C+40++y5qRKGln2IczcqcUIcoyXPcjoyaU1SAqnbfYAzCSO/5QMe+F3
	oD6OT16Tlef0d4v4xi7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDg5q-005VP2-Kz; Tue, 19 Jul 2022 05:48:26 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDg5n-005VNb-A8
	for linux-riscv@lists.infradead.org; Tue, 19 Jul 2022 05:48:24 +0000
Received: by mail-pf1-x436.google.com with SMTP id b9so12574377pfp.10
        for <linux-riscv@lists.infradead.org>; Mon, 18 Jul 2022 22:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0sX1onoPJ1YOPt+mOAth6+mii2dmZ7QR6AiT86YyKdU=;
        b=Q+etMlFe7tkFERxmJLMYSSfPYaSKlDVB5MmWG/aPRDojaTL7fGB65qXqN91Wp9rHzM
         Z5NdjthNuFERRgaHn1ErM7tncHNinspsUs1jW3qrFtX00TaOJIdUoTQswz9XzPMLikE1
         dvCti5riz+mJ5rvt2kWr6V0MA3Y4TcnntUXmZnRg/yJuwFv9jPW4NMXbKEsAIIt+K/sy
         8rq9awPE1F7KbXNI1cCmjugCjPCEnhjT5hTPcYM8FlJ3M7Cc1zGUZaztBv9xjrBJYjbo
         ULY4FCkMoLuUTLn83FyGLDKKs2UP1dcIOvP73UVAn9rp2Y/PMKIrBbpux8I9MIYYD7R4
         sn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0sX1onoPJ1YOPt+mOAth6+mii2dmZ7QR6AiT86YyKdU=;
        b=SV+YZA0udegvj0aFZTOf88YvBePP8MI7vNhqgJH3JdhBystwii6jB1Xyw5ikrW94BU
         qJeWM4AAcSF2wFUFNckhkxhfqh04nBAMc0vMqxWkQByUKSWxzH4awPWYyxFX7DSvGyQC
         OQhmqxOGGWEBdKQCw5rXn4PCmN5mnKNFRpSqVUzATUY3dJ9MvVYAY9+kGH1DY5dPeNZL
         64uuzAzLCxOuC2pLVIjiLU3xDZWt3NTewd1c9rYbxQCDiBnQsrzPz0IjZq8MC3SR29kM
         NbUMKqwTFFwDlw6g57hTpjwigXBUkOEjGztpehUYOQjhGdmCEHbZQ4sGBRE2y9Hk9mYb
         W66A==
X-Gm-Message-State: AJIora9yusDUf/3Qc5I89h9wsvdcVG2l0YONk31F4aQBJGXYrDE55U7u
	z2GfXDcI2Z8oCRmCahHRa2djng==
X-Google-Smtp-Source: AGRyM1vEptqqG+SuWmXjVjM2cnzKrtW4+dR5715b+Hro/HvmivhTCinXeLELS7w7xtHgkbdT9pABkA==
X-Received: by 2002:a63:1a21:0:b0:412:b103:97a2 with SMTP id a33-20020a631a21000000b00412b10397a2mr27744199pga.12.1658209701359;
        Mon, 18 Jul 2022 22:48:21 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.93.102])
        by smtp.gmail.com with ESMTPSA id o186-20020a62cdc3000000b0050dc7628171sm10374129pfg.75.2022.07.18.22.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 22:48:20 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Atish Patra <atishp@atishpatra.org>,
	Samuel Holland <samuel@sholland.org>,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/2] Improve CLOCK_EVT_FEAT_C3STOP feature setting
Date: Tue, 19 Jul 2022 11:17:27 +0530
Message-Id: <20220719054729.2224766-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_224823_373030_49BFAA84 
X-CRM114-Status: UNSURE (   7.08  )
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

This series improves the RISC-V timer driver to set CLOCK_EVT_FEAT_C3STOP
feature based on RISC-V platform capabilities.

These patches can also be found in riscv_timer_dt_imp_v1 branch at:
https://github.com/avpatel/linux.git

Anup Patel (2):
  dt-bindings: riscv: Add optional DT property riscv,timer-always-on
  clocksource: timer-riscv: Set CLOCK_EVT_FEAT_C3STOP based on DT
    property

 Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
 drivers/clocksource/timer-riscv.c                 | 6 +++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
