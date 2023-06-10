Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A0AC7EE2E
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 20:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nwMrpuyCxyEZYILE92nJEek39OHGJmYJhNIL/aJnglU=; b=xryiyPXn6FUmAl
	1XnJaWx4lQLcwSUJtBP6/1OjWxuKDmycBxQ8BoSZ8WNh9x3ViawREVgd2Sm3CwUaX2+vs2PFcVGUs
	5AFwbH2CETuluTgMLyGjq7huoHjUHaAaqkjzKF0Zf4ogwgV2Wrvvx/utAwPSKscg4XcF5WSwhDJlq
	teTagFdRhEPO49WPzHvrhPRIeNkqcP3nCj+dUEXAwoz/DlofPNxOFrM1zbFfalloNpIkI6wT/BhnC
	7Q1PdEvrFX2MPUagJhwrmyAJD2qz89U+aTnv95dWmtyxfYRYi+jXcKm6L0rmIKUWFrYp5/Jmay2fu
	B5hpEQAfat4lODpaDECQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q85Jk-00H0nO-2V;
	Sat, 10 Jun 2023 20:36:12 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q85Jh-00H0lx-0N;
	Sat, 10 Jun 2023 20:36:10 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f7ebb2b82cso30866205e9.2;
        Sat, 10 Jun 2023 13:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686429367; x=1689021367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VW3ufThgtzabcqR2lSzvJonEKJi+vdbcWOGvWLdXSuw=;
        b=G8gcoEFbSty+rM3z00E625GAC4MphjCRwG+0qvC9LclMM3BG1YXAZEV9JdXh+Dgng0
         EJhzQqG/AzFz9LuuI8wk13LuQEEFXArt3pchXmR86iRidKOS5j6i//hoHpPW3Ta1fBbO
         eorJElEmO2mQfmiXAWxK7y1zjF7pm3LM0awLiozRdtU680HpCHgvSXFo/Z3OhNA3r8RO
         blAyod9h7AUiwgfsCofNQOnGCxV8E4R1NwPQMFVgAJna9Ind7aDN6GFCys4u5pwO+QF6
         pAGb1aqygR65a6oin0FXCbyHEU90uwoCyVsBclz1DONTAfLcW424UNlO2H+pML98P7n8
         tZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686429367; x=1689021367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VW3ufThgtzabcqR2lSzvJonEKJi+vdbcWOGvWLdXSuw=;
        b=f/PGOrANCjZ36FMRB8tnhYvaRj2T/zViPI63z6xuU0uQwxHcZpMwvsFZeh9ABAsWKE
         1oH8mfzcUP3VwcZ8ryvI7DxgOS2O+f7XwaLb4KeX1PKmIBh0CyED3r/RUdF6WIFxoujI
         vVP1wXprtCmODOcUGg5B5nGXP/3ucS8W1XRpX2gsYAqGoB6ywWAFfaA9kLBFT4tfaMyf
         43OMZyseg0nLDpR9wAghHYlw382+aB99SJuChmGPiPInx1VmT0LpO2xytCDhCMNL/gm7
         jZs0MWhzBE4bviQns34vyvacLZI43ySwQX4kJHoxW02sJqZF6/EFJwpB7xMof2K/0L9m
         KdTQ==
X-Gm-Message-State: AC+VfDw0Au/2Gox5BAiBMLWFEC/tBPBhgi3FvnV+DzdYpEvjtYwM/ZS5
	xFHl/o84132/j7pbgU8WV5A=
X-Google-Smtp-Source: ACHHUZ66lmd9V4cfx9DRFPFSHhBP4rWQz3UvrI5a7rsIQWgHgIRx9tzV+r8oz64wo77KNfyZtD1sfg==
X-Received: by 2002:a05:600c:211:b0:3f6:906:1195 with SMTP id 17-20020a05600c021100b003f609061195mr4112575wmi.35.1686429366811;
        Sat, 10 Jun 2023 13:36:06 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id m13-20020a7bce0d000000b003f42a75ac2asm6572867wmc.23.2023.06.10.13.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 13:36:06 -0700 (PDT)
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
	Andre Przywara <andre.przywara@arm.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/3] Add D1/T113s thermal sensor controller support
Date: Sat, 10 Jun 2023 23:35:41 +0300
Message-Id: <20230610203549.1127334-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_133609_154185_A989019B 
X-CRM114-Status: UNSURE (   9.56  )
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

v2:
- Fixed SoB tag
- Moved binding patch before driver changes

v1:
- Initial version

Maxim Kiselev (3):
  dt-bindings: thermal: sun8i: Add binding for D1/T113s THS controller
  thermal: sun8i: Add D1/T113s THS controller support
  riscv: dts: allwinner: d1: Add thermal sensor and thermal zone

 .../thermal/allwinner,sun8i-a83t-ths.yaml     | 20 +++++++++++++-
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 26 +++++++++++++++++++
 drivers/thermal/sun8i_thermal.c               | 13 ++++++++++
 3 files changed, 58 insertions(+), 1 deletion(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
