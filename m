Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8141C43334
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jun 2022 13:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qhJXbG1eMASwNt8PFzpBpx80PybYM9gSyh26UWl3Ok4=; b=0tBDb+gJFVeRoo
	GYcWSU00dAaG6bQ+vCdQmJf79AJSDB8tfyEGTHSS8VO/mzAIRrpwWYg1JHf+IMzvnZJUNrN9BrlA7
	PResnwxqvDcLZ0HGmDr1n/UjS71Fp1nAfu5jmeK5u0NIpTV2MXQvbPJOuRO3zxSIiPIC52kQ185cS
	V3hd0pOhae3kchvq5oHmbSgICY5mbVvZ6/Hs4wQNJw0fFn/LW38nLRcM1QNOus1nqS8HrUb511AH+
	tp9kgC6o9qGtMNgrwtpZBtX1eDp1wP4CaIRtJwTZ37WN6Q+0L8cwq37lfvxcl2MgdZcLhcXns3S1D
	q1LhYNePmzLyPkT7p7oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxqNi-00EYMj-Aa; Sun, 05 Jun 2022 13:33:26 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxqNd-00EYIL-03
	for linux-riscv@lists.infradead.org; Sun, 05 Jun 2022 13:33:22 +0000
Received: by mail-wm1-x335.google.com with SMTP id l2-20020a05600c1d0200b0039c35ef94c4so4471227wms.4
        for <linux-riscv@lists.infradead.org>; Sun, 05 Jun 2022 06:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fxHo2G/MFjOMreF495XhNz2LYNZUg8qT/+RBpI9PUtU=;
        b=GyflWBfDey8F7h0aXmePopOxBzCwMdrBZ/rms2VWXDiLEAKingS6VFUymMjDnTB9eH
         lcf2hErSL3bZguOFLwFMqQtt4ZClHUReRvpI0APoAYwE4Qo9xjhtmMntAJmyVQ2ewEds
         F7J1Jh3Od2Rb1uKnbyr0ET9dEc5LUc2jkYSa/1y03QTjVTNValhQqWMEKUxpE4J1zamc
         piBKUA32qYzp5OCQT97iQj+icCEIuUA49n+C8pN2TB5wvjhI7bukPPcdjO94in0lUdaY
         z/jzeg1XMh6GnLlEnpLrM5UNiEjhpqHWnKi5zZpjx2e4Y2US8g3hoxoOz5P0ShFrU5JV
         Y+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fxHo2G/MFjOMreF495XhNz2LYNZUg8qT/+RBpI9PUtU=;
        b=E4jSV8VGwjF1/bL71u8/uLheF7YrnvJfDPvPpnuz0AR8v/hjraZDIyk2OJJv8gUUVD
         DnMnaLnc8jVW5cHiYorbCXI/2H1R+N8reTJbfz7QctEy2vTquPJuaH/fbRLYdmx09bnh
         yWmBiFMlJpZ74oHgcnxGQfB6zA8wdpaygzpr/jyperlJ9otypvCO34+LzG2cUpBfJGxu
         sQn4xpGhCVe1i+PW7fpTrFIqKaSDIIIRYKMNQ43kRx3KSk7Z43GlrPExgS3+q976FPRh
         cZ3UPj0ql/d6HGZmQpJNBTfG65SRzK9CpSpkdwf9deaUhPHNJ5+3+Uq13TpNxU6bDqRW
         kYgA==
X-Gm-Message-State: AOAM532UGUQPwgZq1jyVSs8A/2zH7mntQSKw59w41WfG6qQruakpL8p2
	zjW/djCTJL37V81oyIfgOE1PzbLvLvDPS9tJ
X-Google-Smtp-Source: ABdhPJyEHIjQiJuKOu1YPJQ7jg0tsDoGPCGhSJazHb2r3q+Ax+V2lnyXRbTFBdqUkBxVN8dXg+h9Hg==
X-Received: by 2002:a7b:cd83:0:b0:39c:46d2:6ebb with SMTP id y3-20020a7bcd83000000b0039c46d26ebbmr7211195wmj.187.1654435999213;
        Sun, 05 Jun 2022 06:33:19 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id n187-20020a1c27c4000000b0039c151298b7sm18217076wmn.10.2022.06.05.06.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 06:33:18 -0700 (PDT)
From: mail@conchuod.ie
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee.jones@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Steve Twiss <stwiss.opensource@diasemi.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Atul Khare <atulkhare@rivosinc.com>
Subject: [PATCH v1 3/6] MAINTAINERS: convert ocores i2c dt-binding to yaml
Date: Sun,  5 Jun 2022 14:32:58 +0100
Message-Id: <20220605133300.376161-4-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220605133300.376161-1-mail@conchuod.ie>
References: <20220605133300.376161-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_063321_079671_2710C9FD 
X-CRM114-Status: GOOD (  10.95  )
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

From: Conor Dooley <conor.dooley@microchip.com>

As the ocores i2c dt-binding has been converted to yaml, update the
maintainers entry.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f1b4b77daa5f..f799cf34ea52 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14826,7 +14826,7 @@ M:	Peter Korsgaard <peter@korsgaard.com>
 M:	Andrew Lunn <andrew@lunn.ch>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/i2c/i2c-ocores.txt
+F:	Documentation/devicetree/bindings/i2c/i2c-ocores.yaml
 F:	Documentation/i2c/busses/i2c-ocores.rst
 F:	drivers/i2c/busses/i2c-ocores.c
 F:	include/linux/platform_data/i2c-ocores.h
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
