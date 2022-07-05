Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7BAC43334
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 21:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0yAXaSssf0iguzNwX3t0HGGUbselHGLGr9EWjAAbzlA=; b=Hs+oXl7+ktDnrB
	XC8+p3YyUsvuY1vWdFqMmEKR57pfYnJ1TeN1UKCqB5vCsevyw056vwIDzw3fTaIy6tdBsJoVyuRIo
	TULjY/z66yGbOngi8KS/vz9d/JDyXge06cmsei/+MEHnsrrZr1ih18XNDLcOMLZo0B6DcI+8M05IE
	Dv21gIjAwUkUOV8DvUjJl5zgbM7gqMcySIh1xVTy++iXjN164zuGC1mDp4UGta4MVr75ADZMgZHL9
	Q6rG3JLwYJIXQfiAzE/nnBDJgPlayX4mZk1HVMvgjFB2KpooFlFDk7RyZo8sa1H9idkrIxLKzxyQN
	wW7Tqn3Q16UicDA6QPIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8poI-002qHz-0i; Tue, 05 Jul 2022 21:10:18 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8pg6-002nFm-7F
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 21:01:52 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B7F9A3F211
	for <linux-riscv@lists.infradead.org>; Tue,  5 Jul 2022 21:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1657054905;
	bh=BZ3TTPllU2RNx61rLK2KPq+axv5Y7LrzDROkWqt5HLQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=L/H+CMCNNWsx/KeP2y7jtfcJA3e8mN0v3pM6KJVLvrsfrbs7b9xJTplKey3X5os5c
	 ffJHIUGcmY/xFDmyaik5Gk6sFKA85sA8VMe2+tnHeADxhPrh/jc3fuaHONeBxNbTDr
	 eXaULRleUD8dEspgMAxyNcuZDPyvcsUac0msT/ZmXpJ+aCbVbqKJjopVlbfL8Ma/OX
	 tGS3MEg4ZbTFONrQd0a2LIOsJ94Q8AzREIPuQhSvHFPsY6UlbE9oAoXxsKjitnS6Gx
	 paQ7nGm8R4Ks/GyZ2opEdVW+v4GOXbOT2id5tOzG1KVPRi2cb9Siuyi/oV0mxL6d6k
	 pyjydZG+Cml1g==
Received: by mail-wm1-f69.google.com with SMTP id j35-20020a05600c1c2300b003a167dfa0ecso7283894wms.5
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 14:01:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BZ3TTPllU2RNx61rLK2KPq+axv5Y7LrzDROkWqt5HLQ=;
        b=x+BuR0eUHHoE5jY8cXE/sVQkcmOEPzKLaRPv2C0wvsftsJ2H3DlW1D5OfPclRFOfLT
         nfDLXt3xtbBYjQ6TILfPH70dn0tgxrZtDrbsR98tnoZMyAFOfLm8k/Ig0RNOQ1ThnAh3
         TluY2M++EUGC3k3dFB5fqf4ncf8H4Sqlt+sMBo0B/YbRe3K/I4EQ8BHwocXU1Rwz37XR
         YXWtytOWE2PcVqlbq5Y+ByvQTAfcfJTg6IpuX/sO7jSaUCqSPm9EFdwGdvr+4HxX/NKn
         ZtAURpLLEXklYNiKRsQV6T42OhOgTbqoOIAQJgwayNRSzb4Os6BtMMTRO2Jwh1/Z6QqT
         Pa3Q==
X-Gm-Message-State: AJIora/5Meqiz5gjfE+0mcT2ij6fxT/MN3HB4BDFm64iscy0o4j4uTSJ
	S1/qgGj9djP9gVgwtw3PLLKMMrNQ82S9Xknfvrxg7Bw6O1osi8x52wivNC1CnMl1d/i8AXGBKqi
	FfwWXoyNKHuD//cJs3mXj5Pd9faTvml4CKQQGalVqKMbCmQ==
X-Received: by 2002:adf:d1e9:0:b0:21d:2154:2bc7 with SMTP id g9-20020adfd1e9000000b0021d21542bc7mr32198640wrd.105.1657054905427;
        Tue, 05 Jul 2022 14:01:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uJ6GR25rmzYj+5MOIYxx8GnVDHsnsL8L8SKcrRNOoJrGmGln63zLuDAwKc99O7ChnLFoDsbg==
X-Received: by 2002:adf:d1e9:0:b0:21d:2154:2bc7 with SMTP id g9-20020adfd1e9000000b0021d21542bc7mr32198623wrd.105.1657054905236;
        Tue, 05 Jul 2022 14:01:45 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id r15-20020a0560001b8f00b0021d74906683sm2517667wru.28.2022.07.05.14.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 14:01:44 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Vincent Pelletier <plr.vincent@gmail.com>,
	Bin Meng <bin.meng@windriver.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Ron Economos <w6rz@comcast.net>,
	Qiu Wenbo <qiuwenbo@kylinos.com.cn>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Stephen L Arnold <nerdboy@gentoo.org>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Mark Kettenis <kettenis@openbsd.org>,
	Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	David Abdurachmanov <davidlt@rivosinc.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 0/4] Add HiFive Unmatched LEDs
Date: Tue,  5 Jul 2022 23:01:39 +0200
Message-Id: <20220705210143.315151-1-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_140150_713125_F9D46936 
X-CRM114-Status: UNSURE (   9.03  )
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

This series adds support for the two LEDs on the HiFive Unmatched
RISC-V board.

Emil Renner Berthing (4):
  leds: pwm-multicolor: Don't show -EPROBE_DEFER as errors
  dt-bindings: leds: pwm-multicolor: Add active-low property
  leds: pwm-multicolor: Support active-low LEDs
  riscv: dts: sifive unmatched: Add PWM controlled LEDs

 .../bindings/leds/leds-pwm-multicolor.yaml    |  4 ++
 .../boot/dts/sifive/hifive-unmatched-a00.dts  | 42 +++++++++++++++++++
 drivers/leds/rgb/leds-pwm-multicolor.c        |  8 +++-
 3 files changed, 52 insertions(+), 2 deletions(-)

-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
