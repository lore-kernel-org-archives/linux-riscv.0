Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1112C7EE2E
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 06:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aUWXCcJRTLi6ck3rfDdf1ZIFxyTFlb0HKxErWoc9LCk=; b=iVFEIqsDjfmzSl
	k6dN/+8FprHsxyXCxX0dRi39LKw9d3AjnAQB0Y6QL2X74SH1JgQYiwZRJOGOezsXXGQv1tc3NyYXl
	xULgwt5DVyj+Zy3kb1PEEVJndGOT6aVS2qwZXq/drG7Ui70oC8t3V49w8lCHolZSQnMkChx6HA3Qd
	BWHizEvjcw+KPumXmjv1h9dwQuaZHbknFBWixMDhy3I4ZdX3TL2KSbodFQdPMM1BJslO7d2pKjZJs
	H43cLuY2wtU/yXJcGRC/+inUa+X9WjO7mmsyP2lbjgL0tKbG4w/XrFoI1sH11x5HU8wzQ4za1p5g1
	PjK45JA12i1LYmRnPx/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8b8V-002mMj-2d;
	Mon, 12 Jun 2023 06:34:43 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8b8S-002mLw-0M;
	Mon, 12 Jun 2023 06:34:41 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-30fb4b3e62fso808859f8f.2;
        Sun, 11 Jun 2023 23:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686551678; x=1689143678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Wat54lnLjucqBUhCyCz2jjA942pDQtZohk+myr2KU4=;
        b=c2zzRyWDsD9NA/NQkSWJl9TYXJpYTRoWVyrQJIqWKkJge3T4w4eXHIbyqIM227yTDD
         +82SXmmwVQlQOmgWR0fmPw0cshkPbniT7JJ282anh1Ucg1zljdtJh5LL9zMrMN5n80tM
         AXtaE8Y2ghuoVNoX2CQoQGov2jouSHTdP7O3OA+ijRzjnObWic7xtk9O99Vidl0H3ik5
         2wbGJ5RZy0rhlIpYnv3LgmC5R1Sri99aLUaUOl9wGxyHLFWX9hQiAEf3LXV2GIjNuMM7
         BvboEyN7Uc1FJZAU2O84iaBhVClYWnI4aXlHjDkuGHm0XAxibzcrSeOh3w0zxyhD8pHP
         z4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686551678; x=1689143678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Wat54lnLjucqBUhCyCz2jjA942pDQtZohk+myr2KU4=;
        b=N0HMbenwYziFO0hGcy724dPQrndswEjg2CERzWo00SFftuSVjakoavsQ8cvdCBsxgV
         FUoXTKtcPYku3dpTUbREeZA+byyKjIUZz/m3nZ9u0KmrZhBN8bp/D11dn+xGIpAlqooz
         iMsg6zZXC8+Gp3DpBkufivlMlW66oQs+Bp6Lc47A3+BAbTiKKqwDNAOR91OzZFwGdhQL
         netW3KeNUmy9NKsz9+MksqDvZ5qNytCFAHUL+o/yJcuSDZiNWAEgReel6kFneArzjEbo
         wez3gjVVen4kqH4YlQgpXD0LBE38xnksVXV7M/s0yPksHYfSW3RGAn2ptUeywWHw8Zbj
         GqGw==
X-Gm-Message-State: AC+VfDzjf4VdBUF2l2n+/46Jkw9dzi9Lk8J4yGqrvaa6ZqoHsEskWFR6
	Z9BrJZI9yrytFhoPXtJor6E=
X-Google-Smtp-Source: ACHHUZ4U/ycWnSfITPfKvps91ZElflobta8YYppwQmKfPG5h9wzmgirJll+nMPk5Wu6GeYuJqEpRtw==
X-Received: by 2002:a5d:5704:0:b0:30f:bc21:1ce4 with SMTP id a4-20020a5d5704000000b0030fbc211ce4mr2153510wrv.14.1686551677565;
        Sun, 11 Jun 2023 23:34:37 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id o7-20020adfeac7000000b002fed865c55esm11484811wrn.56.2023.06.11.23.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 23:34:37 -0700 (PDT)
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
Subject: Add D1/T113s thermal sensor controller support
Date: Mon, 12 Jun 2023 09:34:16 +0300
Message-Id: <20230612063429.3343061-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_233440_172423_CB8AFF83 
X-CRM114-Status: UNSURE (   8.91  )
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
  riscv: dts: allwinner: d1: Add thermal sensor and thermal zone

 .../thermal/allwinner,sun8i-a83t-ths.yaml     |  7 ++++-
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 26 +++++++++++++++++++
 drivers/thermal/sun8i_thermal.c               | 13 ++++++++++
 3 files changed, 45 insertions(+), 1 deletion(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
