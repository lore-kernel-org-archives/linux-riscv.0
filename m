Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA93BC3DA6E
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 21:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7POzpgFHpIubgbkRdoiKEBETgQXFAHxioA/rRGaPuAk=; b=jYIxGpCGpy9jpw
	wKdB0zPw9sMJ78rLPuGCkeQF3CI6RHZ9+M7tVav5KWN8nkLbjLu0RqhubesKJ4flQK///8y6GEgoK
	hf3c162F122I+edmh24lDQ1iMlNSidEpCjaZd4CKJOkmewiUuOGwsi6FBbU4CuJDYOQtsCKqZ70B9
	/XoJrVThiQAtpccRHXIHwMrd3HWw9/+TMk8zPjZFyN7ghbz1QzzimkdFzaxy/FxSORGmloiiGXurq
	CDBCv6C6jMv/l9wv0wGXrbysSn4eGybi0BISfnVYtp1WBrxZLnLdsIixx2lgKLmGuQ1Dy8758ma75
	mW6XAzbBPidiHdebmw6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEyNv-008TL3-2e;
	Sun, 17 Dec 2023 21:09:15 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEyNp-008TJy-2j;
	Sun, 17 Dec 2023 21:09:11 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40c236624edso26713885e9.1;
        Sun, 17 Dec 2023 13:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702847348; x=1703452148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8lQ9koqM5HR+VAaH2z3fBKlko6ZAPGMVyn6jm18Px/Q=;
        b=Pf1IdbPeGtBbqVZc58N6SocaL1h3Pc95Xwnj+V7zADT7WAiROPudFgaMhydeiQvtCl
         v0Nm4V7qmbjNpD2Ng9qW5y9dMr62S7ufrGYgb/aZLm0MJ2M8SGrgaheKgkm+cniFanWI
         msWnhtYJBrWhw2nk0EkCWbT46wBfdob8N52uBtxsfFkzh+c8XN1sX9IeiH7EtzU9Icay
         X1AQJbqssOuwQlEjCTcAyRavlTWHD4vZSClpxIqH1uo62ZeTjMzj10rW3TAcjcHuBDkJ
         RdLPbvrGKB1Vozhltaa7jhL8700BGv34rQ5iuEGkH2B8WcKY2cJ8NfACQ0GagJCcUJn3
         7tog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702847348; x=1703452148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lQ9koqM5HR+VAaH2z3fBKlko6ZAPGMVyn6jm18Px/Q=;
        b=AGYDyFRsvaht4KA+I97aGf55dluHrLFnOzipj47ajR14DlDdKpR0eZ2jhLXw+k0NNG
         koO0gN+0J2x9zzsFAqZxQwVNm0x1/cMAgazeWLj9f0whwZeMHDAOfoL4MjcC9MoeJYCI
         mC4QtsIFT0gTGkOk1rID3QCXJjhtlHaqtDUrRNOCcHOX4LXiRrLSaoNEa9yKIKFz1VCQ
         plRhbVNkOl34JJzYWYYYMSbmlX6wqDJEsuMGD+oGvqsEKnK19JVU+qLaKnVkO9LNYrP5
         uUHiwKHFE5wekXCCp2POkVzUFwfcx0jpV7Vmu9tzkXGGaSnGLlbOcWmB2C6NrEiTz+Lp
         1pfg==
X-Gm-Message-State: AOJu0YwHgf6qOptpwL7B+7TfjZolcGHSBRGHBkdikqRiy3y8wSWyF383
	F+zDXzUc+REFB2uwOW2ono0=
X-Google-Smtp-Source: AGHT+IFq0Qw5BzSy9IiEeWETEQaj9PyBVqQP8GjxQaaABXzR63EQjYWKJ9bwUsU+wJyPcCO0JSj5ow==
X-Received: by 2002:a7b:ce13:0:b0:40c:3820:f002 with SMTP id m19-20020a7bce13000000b0040c3820f002mr8188560wmc.94.1702847347408;
        Sun, 17 Dec 2023 13:09:07 -0800 (PST)
Received: from wpc.yadro.com (188-169-139-214.dsl.utg.ge. [188.169.139.214])
        by smtp.gmail.com with ESMTPSA id vc11-20020a170907d08b00b00a1ce58e9fc7sm13316096ejc.64.2023.12.17.13.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 13:09:07 -0800 (PST)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: 
Subject: [PATCH v6 0/3] Add D1/T113s thermal sensor controller support
Date: Mon, 18 Dec 2023 00:06:21 +0300
Message-Id: <20231217210629.131486-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_130910_036332_D1B255F6 
X-CRM114-Status: UNSURE (   9.15  )
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>, John Watts <contact@jookia.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Zhang Rui <rui.zhang@intel.com>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux-pm@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Lukasz Luba <lukasz.luba@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds support for Allwinner D1/T113s thermal sensor controller.
THIS controller is similar to the one on H6, but with only one sensor and
uses a different scale and offset values.

v6:
- Rebased onto 6.7.0-rc5

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
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
