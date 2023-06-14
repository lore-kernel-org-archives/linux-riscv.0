Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE990EB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 12:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lm9X6KOb/a5J2dNzcXzNqHunhb8IT26eGSPvTLlM1xI=; b=DssrjjRTMNG0Rs
	eb6OK+9n6eDpHcJhe3ZydiH0UjGllfu3+xLn7XyW3OtjpxVmP6O7kKTO224XoRei1wky0YEYgvEVO
	DI1kmrTkFy4W1cKJFm1BUPMu5LLhpE3UR7x6TP6tsd+2MK0y40p7cxzxvLAsD7XAVaH2Dyii+uLQh
	AR2YUI3brx9G3fOfpbuFpudceSFW7C8QptWQ6cWiDeeOTcBPTVga7qhQuijjP/jXwkJNswml0DprG
	29q4aiQAezVqp7FMy24mfEroejUqlR6iFt/m8NtQSIQ+rQwkCRilQlh7U6eco1TOmYIilDU/8GBhi
	kuXhhWNtXqCPX+yw5cKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Q2M-00Bg3A-2F;
	Wed, 14 Jun 2023 12:55:46 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Q2J-00Bg0k-2o;
	Wed, 14 Jun 2023 12:55:45 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-307d20548adso4807049f8f.0;
        Wed, 14 Jun 2023 05:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686747341; x=1689339341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f4a+nqynai93p3DslnYapWoLBaBt6oixAJaqzvjoA2A=;
        b=O7bqwRo9lqTLd0GymqyDJ/F7I5npZ3EjGhqdc8H3z76pJF+lG6ctgHpTwrGS13GdeJ
         7/+hPgUpA7T81p6dBhiwsmDmSLI6YRtANIy5njh4PLpnZFxoVlEtMM2jCZpGI4ULOpws
         lbZy49S4H5M104U/AMIj/GdKhxXCOX2/DYD03RarZYLu2D2saslnN2zqChnZIGpUUCr/
         5laFVT1VMh6J2ECV7iqvALDhM6ApBsXH3ElHD4cuypHY2tURBT8rcE7Fe7vtBeDT6G9u
         aByQdm+gWh963O0oAxOTS97kALwPMyubxCNNW7EGWRpz2OlqLbaNogz987Mvkv3xkHDn
         1uag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686747341; x=1689339341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4a+nqynai93p3DslnYapWoLBaBt6oixAJaqzvjoA2A=;
        b=D5ZK9UVQrHRPhSJJMNVYJjiLuM1Y0+Id7HXmR2C4uVwzwW2rdSGrcHDgq1gynE/t54
         qghmWLvxWfJdGvJlqAdcl66s4Ac8m5LUt5frW+rutBy8NQpTTfCVsscrz8G0P/5O6y8+
         Iib4+HhT0xGdLqA6FUwzMjFFpUmKuq+19N1/axYkTpKGZJ6fvL/7XSYV3hUpjV+crmLg
         cUMN5wc72h//0cryIZVrQ2+xyclmlOtd6bjVp8GsFKJb6D8nKRythuctE6Xs9mCcHL/E
         6QyEEnR0qSfxbfMdkbIO5f53g2vmEQCUt1isNka6LGlp7u/AJTYQ6cMdsT/Nevs7yAtV
         1TPA==
X-Gm-Message-State: AC+VfDxsyWRf6PS8sfqiBroookjei2g8VpEPdF4zWWW/7me2IwOITMWQ
	8IPcb1sNmLFsKGSjF/Nd1DY=
X-Google-Smtp-Source: ACHHUZ5CgQtLa5Ylyn328rgorrSA/Y3m894rHJvNMi4kR8Twg1Hc7ZqF2fyloHx8zTEu2k8bZ90qfw==
X-Received: by 2002:adf:dc42:0:b0:306:28f4:963c with SMTP id m2-20020adfdc42000000b0030628f4963cmr9087095wrj.23.1686747340807;
        Wed, 14 Jun 2023 05:55:40 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id c21-20020a05600c0ad500b003f7310a3ffasm17402522wmr.2.2023.06.14.05.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 05:55:40 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 0/3] Add D1/T113s thermal sensor controller support
Date: Wed, 14 Jun 2023 15:55:18 +0300
Message-Id: <20230614125530.660597-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_055543_910157_1BF9AAC5 
X-CRM114-Status: UNSURE (   9.88  )
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

This series adds support for Allwinner D1/T113s thermal sensor controller.
THIS controller is similar to the one on H6, but with only one sensor and
uses a different scale and offset values.

v5:
- Dropeed 'thermal-zones' node from sunxi-d1s-t113.dtsi

v4:
- Dropeed DT bindings example

v3:
- Fixed SoB tag again

v2:
- Fixed SoB tag
- Moved binding patch before driver changes

v1:
- Initial version

Maxim Kiselev (3):
  dt-bindings: thermal: sun8i: Add binding for D1/T113s THS controller
  thermal: sun8i: Add D1/T113s THS controller support
  riscv: dts: allwinner: d1: Add thermal sensor

 .../thermal/allwinner,sun8i-a83t-ths.yaml       |  7 ++++++-
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi      | 17 +++++++++++++++++
 drivers/thermal/sun8i_thermal.c                 | 13 +++++++++++++
 3 files changed, 36 insertions(+), 1 deletion(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
